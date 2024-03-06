programa
{
	
	funcao inicio()
	{
		// definição das variáveis
		inteiro v1, v2, v3, maior
		cadeia status
		
		// entradas dos valores
		escreva("Digite o comprimento da reta 1: ")
		leia(v1)
		escreva("Digite o comprimento da reta 2: ")
		leia(v2)
		escreva("Digite o comprimento da reta 3: ")
		leia(v3)
		
		// verificação do maior valor
		se(v1 >= v2 e v1 >= v3){
			maior = v1
		}
		senao se(v2 >= v3 e v2 >= v1){
			maior = v2
		}
		senao{
			maior = v3
		}
		
		// verificação se os valores formam um triângulo
		se(maior < v1 + v2 + v3 - maior){
			status = "É POSSÍVEL"
		}
		senao{
			status = "NÃO É POSSÍVEL"
		}

		escreva("\nA MAIOR RETA MEDE ", maior)
		escreva("\n", status, " MONTAR UM TRIÂNGULO COM ESSAS RETAS")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 390; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */