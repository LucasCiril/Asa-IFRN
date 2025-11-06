<html  lang="pt-br">
<head>
</head>

<body>
    <h1> ᯤ⁹⁹⁹ Projeto DNS + HTTP ᯤ⁹⁹⁹</h1><br>

<h3 style="text-align:center" >Saudações, Invocador! Lucas Cirilo aqui. </a></h3>
    <img class="hi" src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/oi-meu.gif" width="300" heigth="300" /> 
    <p>&emsp;&emsp;Esse README informa o que foi feito neste pequeno (mas trabalhoso) projeto sobre HTTP e DNS, utilizando Docker, para a matéria de Administração de Sistemas Abertos. Segue abaixo o escopo do que foi pedido pelo professor:
        </p>
        
<p>Nesta atividade, o estudante irá configurar um ambiente composto por:
    
1- Servidores HTTP (por exemplo, Apache ou Nginx), distribuídos em (2 servidores por domínio).
    
- Domínio 1: siteA.local
- Domínio 2: siteB.local
        
  
responsável por resolver os nomes dos servidores Web, armazenando correspondentes aos dois domínios.

O servidor de DNS deve conter registros e para cada servidor web, permitindo que o acesso seja feito por nome (por exemplo, www.siteA.local, app.siteA.local, www.siteB.local, api.siteB.local).
Todos os containers devem estar interconectados por meio de uma , de modo que a resolução de nomes e o acesso HTTP possam ser testados internamente no ambiente conteinerizado.

A tabela constante na Figura anexa exemplifica a estrutura do ambiente esperado:</p>
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/exemplo1.png" alt="pedido prof" style="width:70%">
        

<h3 style="text-align:center" >E meus queridos Invocadores, o que parecia ser uma volta no parquinho, se tornou uma hydra. (Toda vez que "cortava" um problema, outros 5 apareciam). Mas, no final, o bem venceu e o projeto está feito com sucesso. </a></h3>
    <img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/tenso%20demais.jpg" alt="tenso" style="width:70%">

<p>Para executar testes em sua máquina, basta clonar o repositório e ter o Docker Desktop instalado em sua máquina. Ao fazer isso, execute o seguinte comando em um interpretador de comandos: <br>
#docker compose up --build<br>
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/logs.png" style="width:70%"><br>
Possivelmente, você verá os logs de todos os containers, significando que o serviço está up. Para testar, abra um cmd e use o seguinte comando:<br>
#docker ps -a<br>
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/docker%20ps.png" style="width:70%"><br>
O comando acima prova que os containers estão UP. Se eles estão Exited, algo de errado aconteceu (rebuilde utilizando o comando anterior). Caso tudo tenha dado certo, vamos testar o servidor de DNS com o comando nslookup. Use os seguintes comandos no seu interpretador de comandos:<br>
#docker container exec -it dns-server /bin/bash<br>
#nslookup www.sitea.lab 172.28.0.10<br>
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/ns1.png" style="width:70%"><br>
O serviço devolveu o IP do container, provando a funcionalidade do DNS. Você também pode testar o mesmo comando com os outros endereços ip que estarei deixando a seguir:<br>
    
app.sitea.lab<br>
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/ns2.png" style="width:70%"><br>

www.siteb.lab<br>
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/ns3.png" style="width:70%"><br>

api.siteb.lab<br>
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/ns4.png" style="width:70%"><br>

Dito isto, vamos testar no navegador. Para tal, você precisa dizer ao seu computador que ele não deve fazer a busca pelo servidor de DNS que ele conhece, mas sim, pelo que você configurou.<br>
Na sua área de trabalho, clique com o botão direito do mouse na sua configuração de Rede e Internet e abra. Procure por Propriedades e depois, você verá uma configuração chamada Atribuição de Servidor DNS (está automático DHCP, por padrão). Altere-a para manual, ative o endereço IPV4 e coloque 172.28.0.10. Salve a configuração e pronto, está tudo feito para funcionar.
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/IPV4.png" style="width:40%"><br>

Abra qualquer navegador de sua preferência, use o seguinte comando:<br>

http://www.sitea.lab:8081<br>
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/web1.png" style="width:70%"><br>

A página exibida será a página index.html do container em execucação. Para prosseguir com os testes, você deve utilizar o mesmo comando, alterando sempre o ip e colocando a porta correspondente:<br>

http://app.sitea.lab:8082<br>
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/web2.png" style="width:70%"><br>

http://www.siteb.lab:8083<br>
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/web3.png" style="width:70%"><br>

http://api.siteb.lab:8084<br>
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/web4.png" style="width:70%"><br>

Observação: Caso você tenha mudado o servidor de DNS do seu PC, mas seu sistema operacional é Windows, talvez ainda ocorra um erro. Normalmente, o Windows não consegue encontrar a rede interna do Docker Desktop, e você precisará forçar isso. Para isso, retorne a sua configuração de DNS para automático e após, abra o seu Bloco de Notas como administrador. Feito isso, clique na opção Arquivo -> Abrir. Segue abaixo o caminho que você irá buscar:<br>

Meu Computador (Este Computador) - Disco Local -> Windows -> System32 -> drivers -> etc -> hosts (possivelmente, ele estará em um arquivo em branco. Não use o iCalendar file!)
Abra o arquivo, que estará assim:
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/host1.png" style="width:70%"><br>
Coloque, no final os seguintes comandos e salve:<br>
127.0.0.1 www.sitea.lab<br>
127.0.0.1 app.sitea.lab<br>
127.0.0.1 www.siteb.lab<br>
127.0.0.1 api.siteb.lab<br>
<img src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/host2.png" style="width:70%"><br>
Teste novamente os IPs, e deve estar tudo funcioando.
</p>
 <img class="hi" src="https://github.com/LucasCiril/Asa-IFRN/blob/main/imagens/itachi-meme-itachi-dan%C3%A7ando.gif" width="300" heigth="300" /><br>

 
<h3 style="text-align:center" >ᯤ⁹⁹⁹   Finalizamos então por aqui. Até a próxima aventura, Invocador!   ᯤ⁹⁹⁹ </a></h3>
    
</body>
</html>


