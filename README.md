# Plataforma Trilhas Poéticas

## Dependências

Este projeto é baseado no framework do Web2Py (www.web2py.com) e DB MySQL (www.mysql.com).

0. Baixar e instalar o codigo fonte do web2py localmente (http://www.web2py.com/init/default/download)
0. Baixar e instalar o mysql-server
0. Configurar o usuario root e senha no mysql

## Instalação
0. Acessar a pasta web2py/applications
0. Clonar o repositório `git clone https://github.com/dedebf/trilhas-poeticas-web2py-application.git`
0. Executar o web2py e acessar https://localhost:8000/admin
0. Acessar o arquivo db.py e 0.py e configurar o login e senha do MYSQL
0. Tentar acessar http://localhost:8000/trilhaspoeticas

## Troubleshooting

* Database nao existe
```
mysql -u root -p
create database trilhas02;
```
* Tabela auth.user não existe
Rodar o script trilhas.sql que está na raiz da pasta trilhaspoeticas

* mysql access denied for user 'root'@'localhost'
```
mysql -u root -p
GRANT ALL PRIVILEGES ON *.* to 'root'@'localhost' IDENTIFIED BY 'suasenhaderoot';
FLUSH PRIVILEGES;
```

## Equipe de análise e desenvolvimento
- André Bassani de Freitas
- Francisco Barretto
- Juliana Hilário de Sousa
- Murilo Giachini Ferro de Souza

## Equipe de designer
- Leon Latour
- Renato Moll
- Thiago Gualberto