<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">
    
    <head>
        <title>Cadastro de Produtos e Pedidos</title>
        <link rel="stylesheet" type="text/css" href="<c:url value='/css/style.css' />">
    </head>
    <body>
        
        <h1>Cadastro de Produtos</h1>
        <form action="/produto" method="post">
            Descrição: <input type="text" name="descricao" required>
            Preço: <input type="number" step="0.01" name="preco" required>
            <input type="submit" value="Cadastrar Produto">
        </form>
    
        <h2>Produtos Cadastrados</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Descrição</th>
                <th>Preço</th>
            </tr>
            <c:forEach items="${produtos}" var="produto">
                <tr>
                    <td>${produto.id}</td>
                    <td>${produto.descricao}</td>
                    <td>${produto.preco}</td>
                </tr>
            </c:forEach>
        </table>
    
        <h1>Cadastro de Pedidos</h1>
        <form action="/pedido" method="post">
            Data do Pedido: <input type="date" name="dataPedido" required>
            ID do Produto: <input type="number" name="produto.id" required>
            <input type="submit" value="Cadastrar Produto">
        </form>
    
        <h2>Pedidos Cadastrados</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Data do Pedido</th>
                <th>ID Produto</th>
            </tr>
            <c:forEach items="${pedidos}" var="pedido">
                <tr>
                    <td>${pedido.id}</td>
                    <td>${pedido.dataPedido}</td>
                     <td>${pedido.produto.id}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
    </html>