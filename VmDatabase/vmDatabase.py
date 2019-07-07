# pip install pymongo
from pymongo import MongoClient
import datetime
import json
import requests
import time

cliente = MongoClient('192.168.2.101', 27017)

banco = cliente.vms_info

CPU = banco.CPU
MEMORY = banco.MEMORY
TX = banco.TX
RX = banco.RX
TIMESTAMP = banco.TIMESTAMP

while 1 == 1:
    cpu = json.loads(requests.get('http://192.168.2.101:9090/api/v1/query?query=(100 - (avg by (service) (irate(node_cpu_seconds_total{mode="idle"}[5m])) * 100))').content)
    memory = json.loads(requests.get('http://192.168.2.101:9090/api/v1/query?query=(node_memory_MemTotal_bytes-node_memory_MemAvailable_bytes)/100').content)
    tx = json.loads(requests.get('http://192.168.2.101:9090/api/v1/query?query=(node_network_transmit_bytes_total)').content)
    rx = json.loads(requests.get('http://192.168.2.101:9090/api/v1/query?query=(node_network_receive_bytes_total)').content)

    CPU.insert_one(cpu)
    MEMORY.insert_one(memory)
    TX.insert_one(tx)
    RX.insert_one(rx)
    TIMESTAMP.insert_one({"last_modified": datetime.datetime.utcnow()})
    time.sleep(15)   


