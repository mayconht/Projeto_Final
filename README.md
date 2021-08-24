

# THNS5
Este é projeto final do grupo 4 da matéria de Tecnologias habilitadores para Network Slice em 5G

### Prerequisites

* Instale a ultima versão do [Vagrant](https://www.vagrantup.com/)
* Instale a ultima versão do [VirtualBox](https://www.virtualbox.org/)

## Wiki & Infos

* [Vagrant Docs](https://www.vagrantup.com/docs/index.html) - Documentos Vagrant
* [VirtualBox Docs](https://www.virtualbox.org/wiki/Documentation) - Documentos Virtual Box

## Authors

* **Maycon Douglas maycondss@live.com** - *RPA / java / NodeJs Developer* - [Maycon's profile](https://www.linkedin.com/in/maycondss/)

## Execução
*Para rodar basta executar **vagrant up** no diretório **Projeto_Final**


## Virtual Machine 1
* **acesse http://192.168.2.100:5000**
* **acesse http://192.168.2.100:5001**
* **acesse http://192.168.2.100:8080**
* **acesse http://192.168.2.100:9100/metrics**

## Virtual Machine 2
* **acesse http://192.168.2.101:9090**
* **acesse http://192.168.2.101:3000**
* **acesse http://192.168.2.101:8080**
* **acesse http://192.168.2.101:9100/metrics**


## Grafana
No Dashboard do Grafana vão na aba Data Sources e procurem pelo Prometheus.
- Adicione a URL com a porta do Prometheus de vocês
- No campo Access coloquem Browser
- Cliquem em "Save & Test"

Procure por Import Dashboard no Grafana. 
- Adicione os Dashboards com os seguintes IDs: 193, 893, 1860 e 3662.
- Não esqueça de selecionar como Data Source o Prometheus.

