programa
{
	
	funcao inicio()
	{
		// definição variáveis
		real peso, altura, imc
		cadeia nome
		
		escreva("Digite seu nome: ")
		leia(nome)

		escreva("\nDigite seu peso(kg): ")
		leia(peso)

		escreva("\nDigite sua altura(m): ")
		leia(altura)

		// cálculo do IMC

		imc = peso / (altura*altura)


		escreva("\n", nome, ", seu IMC é: ", imc)

		// classificação do IMC

		se(imc > 40)
		{
			escreva(", logo está em obesidade grau III")
		}
		senao se(imc >= 35)
		{
			escreva(", logo está em obesidade grau II")
		}
		senao se(imc >= 30)
		{
			escreva(", logo está em obesidade grau I")
		}
		senao se(imc >= 25)
		{
			escreva(", logo está Acima do peso")
		}
		senao se(imc >= 18.5)
		{
			escreva(", logo está no peso normal")
		}
		senao se(imc >= 17)
		{
			escreva(", logo está abaixo do peso")
		}
		senao
		{
			escreva(", logo está muito abaixo do peso")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 460; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */