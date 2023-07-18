<?php

// Configurações do banco de dados
$servername = "localhost";
$username = "username";
$password = "password";
$dbname = "database_name";

// Cria uma conexão com o banco de dados
$conn = new mysqli($servername, $username, $password, $dbname);

// Verifica se houve algum erro na conexão
if ($conn->connect_error) {
    die("Erro na conexão com o banco de dados: " . $conn->connect_error);
}

// Configura o cabeçalho da resposta como JSON
header("Content-Type: application/json");

// Verifica o método HTTP utilizado na requisição
$method = $_SERVER["REQUEST_METHOD"];

// Rota principal da API
if ($_SERVER["REQUEST_URI"] === "/caditem") {
    switch ($method) {
        case "GET":
            // Obtém todos os itens da tabela
            $result = $conn->query("SELECT * FROM CadItem");
            $items = array();

            while ($row = $result->fetch_assoc()) {
                $items[] = $row;
            }

            echo json_encode($items);
            break;
        case "POST":
            // Obtém os dados enviados na requisição
            $data = json_decode(file_get_contents("php://input"), true);

            // Insere um novo item na tabela
            $sql = "INSERT INTO CadItem (codItem, descItem, GrupoItem, TipoEmb, UMEstoque, UMPreco, StatusItem, DataStatus, CodBolsa, CodItemBolsa, usuario, dtCriacao, dtAtualizacao)
                    VALUES ('{$data['codItem']}', '{$data['descItem']}', '{$data['GrupoItem']}', '{$data['TipoEmb']}', '{$data['UMEstoque']}', '{$data['UMPreco']}', '{$data['StatusItem']}', '{$data['DataStatus']}', '{$data['CodBolsa']}', '{$data['CodItemBolsa']}', '{$data['usuario']}', '{$data['dtCriacao']}', '{$data['dtAtualizacao']}')";

            if ($conn->query($sql) === TRUE) {
                echo json_encode(array("message" => "Item criado com sucesso."));
            } else {
                echo json_encode(array("error" => "Erro ao criar item: " . $conn->error));
            }
            break;
        default:
            http_response_code(405);
            echo json_encode(array("error" => "Método não permitido."));
            break;
    }
} elseif (preg_match("/\/caditem\/(\d+)/", $_SERVER["REQUEST_URI"], $matches)) {
    $itemId = $matches[1];

    switch ($method) {
        case "GET":
            // Obtém um item específico da tabela
            $result = $conn->query("SELECT * FROM CadItem WHERE idItem = $itemId");

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                echo json_encode($row);
            } else {
                echo json_encode(array("error" => "Item não encontrado."));
            }
            break;
        case "PUT":
            // Obtém os dados enviados na requisição
            $data = json_decode(file_get_contents("php://input"), true);

            // Atualiza um item na tabela
            $sql = "UPDATE CadItem SET codItem = '{$data['codItem']}', descItem = '{$data['descItem']}', GrupoItem = '{$data['GrupoItem']}', TipoEmb = '{$data['TipoEmb']}', UMEstoque = '{$data['UMEstoque']}', UMPreco = '{$data['UMPreco']}', StatusItem = '{$data['StatusItem']}', DataStatus = '{$data['DataStatus']}', CodBolsa = '{$data['CodBolsa']}', CodItemBolsa = '{$data['CodItemBolsa']}', usuario = '{$data['usuario']}', dtCriacao = '{$data['dtCriacao']}', dtAtualizacao = '{$data['dtAtualizacao']}'
                    WHERE idItem = $itemId";

            if ($conn->query($sql) === TRUE) {
                echo json_encode(array("message" => "Item atualizado com sucesso."));
            } else {
                echo json_encode(array("error" => "Erro ao atualizar item: " . $conn->error));
            }
            break;
        case "DELETE":
            // Deleta um item da tabela
            $sql = "DELETE FROM CadItem WHERE idItem = $itemId";

            if ($conn->query($sql) === TRUE) {
                echo json_encode(array("message" => "Item excluído com sucesso."));
            } else {
                echo json_encode(array("error" => "Erro ao excluir item: " . $conn->error));
            }
            break;
        default:
            http_response_code(405);
            echo json_encode(array("error" => "Método não permitido."));
            break;
    }
} else {
    http_response_code(404);
    echo json_encode(array("error" => "Rota não encontrada."));
}

// Fecha a conexão com o banco de dados
$conn->close();

?>
