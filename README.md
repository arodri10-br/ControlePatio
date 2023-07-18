# DRAFT (somente para cotacoes)

# Requisitos minimos :
    Execução On line ( em cloud )
    Execução Off line ( Local com ou sem internet )
    Sincronização ( o off line atualiza o cloud quando "voltar a internet", mas com ação de um usuário )
    Minimo de recursos necessários, pense que este sistema esta em execução a 800 KM de distancia e sem acesso a internet.
    Sistema operacional Linux

# Controle de Patio
Gerenciamento da portaria com controle de acesso de veiculos.
Devemos gerenciar, quem esta entrando ou saindo do recinto, bem como toda a operação que ocorreu dentro da planta.
O Modelo foi pensado em produtos a granel, mas com pequenas mudanças deve funcionar tambem com produtos acabados.

# Modelo de dados :
Na pasta : https://github.com/arodri10-br/ControlePatio/tree/main/resources/database
Voce pode encontrar o banco definido com os devidos relacionamentos entre as tabelas e em alguns casos alguns exemplos de dados.
As colunas que contenham o comentario como no exemplo abaixo, são as que vao utilizar um componente de combo que será apresentado mais abaixo.
Fique a vontade para incluir mais colunas nas tabelas e/ou criar novas para melhorar a definição.
![](https://github.com/arodri10-br/ControlePatio/blob/main/resources/img/Comentarios_DG.jpg)

# Controle de acesso:
Controle de usuários com as respectivas permissões de acesso.
Com base nestas tabelas vamos identificar todas as opções que poderão ser disponibilizadas para os usuários.
Não existirá no sistema a opção de exclusão de usuário, somente a sua inativação.
Pendente : Tabela que vamos usar para apresentar o menu !
![](https://github.com/arodri10-br/ControlePatio/blob/main/resources/img/Schema.jpg)

# Dados Gerais:
Para evitar a criação de tabelas simples, como lista de unidade de medidas, UF, etc.
Onde não se necessitam validações, criamos a estrutura abaixo, para que se possa criar a lista somente por configuração do programa.
A ideia é usar o campo de atributo como se fosse uma tabela e ai buscamos os dados na tabela "DadosGerais".
A tabela de Setup somente apresentará as colunas que tenham o respectivo campo Desc* preenchido com algum nome.
Os campos "Chave*" são para formatar e validar os dados de entrada.
Serão dois componentes que utilização essa tabela, o primeiro é a tela de manutenção, que deve sempre receber o parametro de atributo, para formatar e apresentar os campos disponiveis para manutenção. O segundo componente é um combobox que deve ter a propriedade "atriburo" para que seja simples a sua aprentação e seleção de valores nas telas que irão consumir esse componente.
Importante : A tabela de menu que ainda não foi definida, deve levar em consideração a utilização do primeiro form, passando o atributo de parametro.
![](https://github.com/arodri10-br/ControlePatio/blob/main/resources/img/DadosGerais.jpg)

# Cadastro de Pessoa:
Deve ser uma tela única, para o cadastro. E um componente para pesquisa e seleção de address, pois esta informação será utilizada em várias telas.
Deve ser considerado a opção de busca do CEP pela respectiva tabela pelos filtros de UF/Municipio.
![](https://github.com/arodri10-br/ControlePatio/blob/main/resources/img/AddressBook.JPG)

# Item / Qualidade :
Onde serão cadastrados os produtos e os respectivos itens de qualidade associado a ele bem como uma tabela para que se tenham os parametros necessários para os descontos ou bonificação em KG, caso a qualidade esteja fora do valor alvo.
![](https://github.com/arodri10-br/ControlePatio/blob/main/resources/img/ItemQualidade.jpg)

# Cadastro de Veiculos :
Dados básicos do Veiculo, para que se possam realizar as devidas validações do processo de carga e descarga.
Ex: Um veiculo que comporta somente 30 Ton não pode entrar para carregar 50!
![](https://github.com/arodri10-br/ControlePatio/blob/main/resources/img/Veiculos.jpg)

# Cadastro de Cia e Filial:
Os cadastros básicos para se identificar de onde esta originando a movimentação no sistema.
![](https://github.com/arodri10-br/ControlePatio/blob/main/resources/img/CiaFilial.JPG)

# Cadastro de Equipamento:
Temos que ter pelo menos o cadastro básico dos equipamentos para poder ter um plano de manutenção ( aferição, lubrificação, etc..)
Em conjunto com esse cadastro, temos a tabela de Manutenção Preventiva, onde iremos configurar os parametros necessários para que se gere de forma automática as ordens de serviço.
TODO: Criação das tabelas de ordem de serviço.
![](https://github.com/arodri10-br/ControlePatio/blob/main/resources/img/Equipamento.jpg)

# Movimentação de Veiculos:
Por esse conjunto é que vamos fazer o ingresso dos veiculos para Carga e/ou Descarga, prevendo todos os passos em telas separadas :
1. Ingresso do caminhão na planta (marca vez ?) com os dados do motorista, veiculo
2. Dados de qualidade, analise do item (Umidade, Impureza, etc).
3. Laudo de Qualidade (Opcional - documento que veio com o veiculo).
4. Primeira Pesagem
5. Segunda Pesagem
6. Interface com ERP
Os passos para a carga ou descarga, serão sempre os mesmos, a variando somente na forma de calcular a quantidade :
    Embarque : Segunda Pesagem - Primeira Pesagem
    Descarga : Primeira Pesagem - Segunda Pesagem
A Ordem em que são feitos esses passos podem eventualmente variar e serem executados por pessoas com acessos diferentes.
TODO : Tabela de carregamento / pedidos relacionados, vamos ter que fazer uma análise melhor dos ERP´s que vamos integrar com esse sistema.
![](https://github.com/arodri10-br/ControlePatio/blob/main/resources/img/MovimentacaoVeiculos.JPG)

# Integrações :
-Provider e Consumer :
    * Cadastro de Address
    * Veiculos
    * Pessoas
    * Pesagem ( considerar que será por API )
-Provider :
    * Movimentação
-Consumer :
    * A definir !
    * Carregamento
    * Pedidos de recepção
    * Pedidos de despacho

