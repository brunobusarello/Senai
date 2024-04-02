programa
{
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		// definição das variáveis
		inteiro vetor[10], tamanho = 10, elementoAtual, indice

		// preenchimento do vetor com número aleatórios
		para(inteiro c = 0; c < tamanho; c++){
			vetor[c] = u.sorteia(10, 50)
		}

		escreva("======= Vetor original ======\n")
		para(inteiro c = 0; c < tamanho; c++){
			escreva(vetor[c], " ")
		}
		
		escreva("\n\n")

		para(inteiro c = 1; c < tamanho; c++){
			elementoAtual = vetor[c]
			indice = c

			enquanto(indice > 0 e vetor[indice - 1] > elementoAtual){
				vetor[indice] = vetor[indice - 1]
				indice--
			}

			vetor[indice] = elementoAtual
		}

		escreva("======= Vetor ordenado ======\n")
		para(inteiro c = 0; c < tamanho; c++){
			escreva(vetor[c], " ")
		}

		escreva("\n")
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 144; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vetor, 8, 10, 5}-{elementoAtual, 8, 35, 13}-{indice, 8, 50, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */