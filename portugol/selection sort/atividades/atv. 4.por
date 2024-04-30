programa
{
	inteiro vetor[15], tamanho = 15, pares[15], impares[15], cont_pares = 0, cont_impares = 0, menor_valor = 0, aux
	
	funcao inicio()
	{
		// preenchimento e exibição do vetor 
		para(inteiro i = 0; i < tamanho; i++){
			escreva("Digite um valor para a posição ", i + 1, ": ")
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

		// alocando os valores pares e ímpares nos respectivos vetores
		para(inteiro i = 0; i < tamanho; i++){
			se(vetor[i] % 2 == 0){
				pares[cont_pares] = vetor[i]
				cont_pares++
			}
			senao{
				impares[cont_impares] = vetor[i]
				cont_impares++
			}
		}

		// saída do vetor organizado
		escreva("\nValores ordenados: ")
		para(inteiro i = 0; i < tamanho; i++){
			escreva(vetor[i], " ")
		}

		// saída dos números pares
		escreva("\nValores pares: ")
		para(inteiro i = 0; i < cont_pares; i++){
			escreva(pares[i], " ")
		}

		// saída dos números impares
		escreva("\nValores ímpares: ")
		para(inteiro i = 0; i < cont_impares; i++){
			escreva(impares[i], " ")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 10; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vetor, 3, 9, 5}-{pares, 3, 34, 5}-{impares, 3, 45, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */