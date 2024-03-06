programa
{
	
	funcao inicio()
	{
		// banner de apresentação
		escreva("====================\n")
		escreva("= CÁLCULO DE MÉDIA =\n")
		escreva("====================\n")
		
		// definição de variáveis
		real n1, n2, n3, mf
		cadeia status

		// inicialização das variáveis
		/*
		n1 = 0.0
		n2 = 0.0
		n3 = 0.0
		mf = 0.0
		status = ""
		*/

		// inputs do usuário
		escreva("\nEntre com o valor da nota 1: ")
		leia(n1)
		escreva("\nEntre com o valor da nota 2: ")
		leia(n2)
		escreva("\nEntre com o valor da nota 3: ")
		leia(n3)

		// calcular média final
		mf = (n1+n2+n3)/3
		
		// verificação da média
		/*
		se(mf >= 7.0){
			status = "APROVADO"
		}
		senao{ 
			se(mf < 5.0){
				status = "REPROVADO"
			}
			senao{
				status = "RECUPERAÇÃO"
			}
		}
		*/

		se(mf >= 7.0){
			status = "APROVADO"
		}
		senao se(mf < 5.0){
			status = "REPROVADO"
		}
		senao{
			status = "RECUPERAÇÃO"
		}

		// resultado final
		escreva("\nMÉDIA: ", mf)
		escreva("\nSTATUS: ", status, "\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 774; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */