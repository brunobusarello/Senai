document.getElementById('addButton').addEventListener('click', function () {
    // Captura os valores do formulário
    const name = document.getElementById('name').value.trim();
    const email = document.getElementById('email').value.trim();
    const phone = document.getElementById('phone').value.trim();
    const address = document.getElementById('address').value.trim();
    const city = document.getElementById('city').value.trim();
    const state = document.getElementById('state').value.trim();

    // Verifica se todos os campos estão preenchidos
    if (name && email && phone && address && city && state) {
        // Cria uma nova linha para a tabela
        const table = document.getElementById('userTable').getElementsByTagName('tbody')[0];
        const newRow = table.insertRow();

        // Adiciona as células à nova linha
        newRow.insertCell(0).textContent = name;
        newRow.insertCell(1).textContent = email;
        newRow.insertCell(2).textContent = phone;
        newRow.insertCell(3).textContent = address;
        newRow.insertCell(4).textContent = city;
        newRow.insertCell(5).textContent = state;

        // Limpa o formulário após adicionar os dados à tabela
        document.getElementById('userForm').reset();
    } else {
        alert("Por favor, preencha todos os campos antes de adicionar.");
    }
});

document.getElementById('clearButton').addEventListener('click', function () {
    // Limpa o formulário ao clicar no botão "Limpar"
    document.getElementById('userForm').reset();
});
