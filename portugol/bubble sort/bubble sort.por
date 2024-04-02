programa
{
	inclua biblioteca Util
	
	funcao inicio()
	{
 
		inteiro vetor[15], tam = 15, auxiliar, c = 0
		
		// sorteio dos valores do vetor
		para(c = 0; c < tam; c++){
			vetor[c] = Util.sorteia(10, 50)
		}
		
		// saída do vetor
		escreva("Vetor original: \n")
		para(c = 0; c < tam; c++){
			escreva(vetor[c], " ")
		}
		escreva("\n")
		
		// bubble sort
		para(inteiro v = 0; v < tam; v++){
			para(c = 0; c < tam - 1; c++){
				se(vetor[c] > vetor[c + 1]){
					auxiliar = vetor[c]
					vetor[c] = vetor[c + 1]
					vetor[c + 1] = auxiliar
				}
			}
		}

		// saída do vetor
		escreva("Vetor em ordem crescente: \n")
		para(c = 0; c < tam; c++){
			escreva(vetor[c], " ")
		}
		escreva("\n")
 
		// bubble sort
		para(inteiro v = 0; v < tam; v++){
			para(c = 0; c < tam - 1; c++){
				se(vetor[c] < vetor[c + 1]){
					auxiliar = vetor[c]
					vetor[c] = vetor[c + 1]
					vetor[c + 1] = auxiliar
				}
			}
		}
		
		// saída do vetor
		escreva("Vetor em ordem decrescente: \n")
		para(c = 0; c < tam; c++){
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
 * @POSICAO-CURSOR = 1069; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */