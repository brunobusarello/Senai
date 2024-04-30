programa
{
	real vetor[9], media = 0, aux = 0
	inteiro tamanho = 9, menor_valor = 0
	
	funcao inicio()
	{
		// preenchimento e exibição do vetor 
		para(inteiro i = 0; i < tamanho; i++){
			escreva("Digite a ", i + 1, "º nota: ")
			leia(vetor[i])
		}

		// selection sort
		para(inteiro i = 0; i < tamanho - 1; i++){
			menor_valor = i
			para(inteiro c = i + 1; c < tamanho; c++){
				se(vetor[c] < vetor[menor_valor]){
					menor_valor = c
				}
			}
			aux = vetor[i]
			vetor[i] = vetor[menor_valor]
			vetor[menor_valor] = aux
		}

		// saída das notas ordenadas
		escreva("\nNotas ordenados: ")
		para(inteiro i = 0; i < tamanho; i++){
			escreva(vetor[i], " ")
		}

		// média dos valores do vetor
		para(inteiro i = 0; i < tamanho; i++){
			media += vetor[i]
		}
		media = media / 9

		escreva("\nA média das notas é: ", media)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 811; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */