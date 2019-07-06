import time
import requests
from datetime import datetime
from pymongo import MongoClient

#conecta com o mongo. colocar Ip e porta corretos do seu docker
client = MongoClient('192.168.2.101:17017')['bancodados']['metricas']
# base do rest do prometheus
# colocar a metrica q quer pegar.
# 1 pra cada? cpu, mem, tx e rx, vcs podem pegar no dashboard do prometheus os codigos das métricas
URL_mem = "http://192.168.2.100:9090/api/v1/query?query=(node_memory_MemTotal_bytes-node_memory_MemAvailable_bytes)*100"


while 1 == 1:
    #pega od dados e salva em r
    r = requests.get(url = URL_mem)
    # salva por json - vai ter todos os dados de todas as instancias
    dados_cpu = r.json()

    # tem que pegar quantos nós tem e fazer um for.
    qtd_nodes = 8 
    for x in range(0, qtd_nodes) :
        name_node = dados_cpu["data"]["result"][x]["metric"]["instance"]

        #Salvar variaveis no bd
        x = client.insert_one({'name_node': name_node})

    # da tempo de 15seg pra pegar novamente os dados
    time.sleep(15)   