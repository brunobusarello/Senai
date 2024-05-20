<?php
    // variável que coleta a data do sistema -7 dias
    $inicio = date("m-d-Y", strtotime("-7 days"));
    // variável que coleta a data atual do sistema
    $fim = date("m-d-Y");

    // variável que armazena um arquivo .JSON com as informações necessárias
    $url = 'https://olinda.bcb.gov.br/olinda/servico/PTAX/versao/v1/odata/CotacaoDolarPeriodo(dataInicial=@dataInicial,dataFinalCotacao=@dataFinalCotacao)?@dataInicial=\''.$inicio.'\'&@dataFinalCotacao=\''.$fim.'\'&$top=1&$orderby=dataHoraCotacao%20desc&$format=json';

    // decodificação do arquivo .JSON
    $dados = json_decode(file_get_contents($url), true);

    $cotacao = $dados["value"][0]["cotacaoCompra"];

    if(isset($_POST['submit'])){
        $conversao = $_POST['valor'] / $cotacao;
    }
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cotação atual</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <main>
        <h1>Conversão de Real para Dólar</h1>
        <section>
            <p>O valor do dólar atualmente está: R$ <?php echo number_format($cotacao, 2, ',', '.');?></p>
            <p>R$ <?php echo number_format($_POST['valor'], 2, ',', '.'); ?> em dólar é: U$D <?php echo number_format($conversao, 2, ',', '.') ?></p>
            <a href="index.html">Realizar nova cotação</a>
        </section>
    </main>
</body>
</html>