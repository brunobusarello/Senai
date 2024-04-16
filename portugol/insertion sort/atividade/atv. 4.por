programa
{
	inclua biblioteca Util --> u

	inteiro valores[50], tam = 50, elemento_atual
	
	funcao inicio()
	{
		escreva("----Vetor original: ")
		para(inteiro c = 0; c < tam; c++){
			valores[c] = u.sorteia(10, 50)
			escreva(valores[c], " ")
		}
		insertion_sort(valores)
	}
	funcao insertion_sort(inteiro vetor[]){
		// organização crescente
		para(inteiro c = 1; c < tam; c++){
			elemento_atual = vetor[c]
			enquanto(c > 0 e vetor[c - 1] > elemento_atual){
				vetor[c] = vetor[c - 1]
				c--
			}
			vetor[c] = elemento_atual
		}
		escreva("\n---Vetor crescente: ")
		para(inteiro c = 0; c < tam; c++){
			escreva(vetor[c], " ")
		}

		// organização decrescente
		para(inteiro c = 1; c < tam; c++){
			elemento_atual = vetor[c]
			enquanto(c > 0 e vetor[c - 1] < elemento_atual){
				vetor[c] = vetor[c - 1]
				c--
			}
			vetor[c] = elemento_atual
		}
		escreva("\n-Vetor decrescente: ")
		para(inteiro c = 0; c < tam; c++){
			escreva(vetor[c], " ")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 775; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */