programa
{
	inclua biblioteca Util --> u
	
	inteiro vetor[8], tam = 8, aux, menor_valor
	
	funcao inicio()
	{
		para(inteiro c = 0; c < tam; c++){
			escreva("Digite um valor para a posição ", c + 1, ": ")
			leia(vetor[c])
		}

		para(inteiro c = 0; c < tam - 1; c++){
			menor_valor = c
			para(inteiro v = c + 1; v < tam; v++){
				se(vetor[v] > vetor[menor_valor]){
					menor_valor = v
				}
			}
			aux = vetor[c]
			vetor[c] = vetor[menor_valor]
			vetor[menor_valor] = aux
		}

		escreva("\nVetor ordenado: ")
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
 * @POSICAO-CURSOR = 146; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */