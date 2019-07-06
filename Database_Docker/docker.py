# pip install pymongo
#developer: Maycon Douglas
from pymongo import MongoClient
import datetime

cliente = MongoClient('192.168.2.101', 27019)

banco = cliente.vm_info

vm1 = banco.vm1_collection
vm2 = banco.vm2_collection

VM1Json = '1' #Pegar as informacoes da VM1 e transformar em Json, adicionar tbm o timestamp
VM2Json = '2' #Pegar as informacoes da VM2 e transformar em Json, adicionar tbm o timestamp

#Formatar dados da URL Abaixo ela retorna os dados das duas VM's
#URL_mem = "http://192.168.2.101:9090/api/v1/query?query=(node_memory_MemTotal_bytes-node_memory_MemAvailable_bytes)*100"


while 1 == 1:
    timeStamp = datetime.datetime.now()
    vm1.insert_one(VM1Json) 
    vm2.insert_one(VM2Json) 

