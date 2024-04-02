programa
{
	
	funcao inicio()
	{
		// definição das variáveis
		real grau_c, grau_f

		// input
		escreva("Qual temperatura em °C deseja converter: ")
		leia(grau_c)

		// conversão
		grau_f = (grau_c * 9 / 5) + 32

		// retorno
		escreva("\nEssa temperatura em Fahrenheit é: ", grau_f, "°F")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 290; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */