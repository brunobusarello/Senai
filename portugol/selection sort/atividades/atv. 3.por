programa
{
	inclua biblioteca Util --> u
	
	inteiro vetor[12], tam = 12, aux, menor_valor
	
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

		escreva("\nMaior valor: ", vetor[0])
		escreva("\nMenor valor: ", vetor[11])
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 501; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vetor, 5, 9, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */