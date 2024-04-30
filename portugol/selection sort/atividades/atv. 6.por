programa
{
	const inteiro tamanho = 10
	inteiro crescente[tamanho], decrescente[tamanho], aux = 0, menor_valor = 0
	
	funcao inicio()
	{
		// preenchimento e exibição do crescente 
		para(inteiro i = 0; i < tamanho; i++){
			escreva("Digite um valor para a posição ", i + 1, ": ")
			leia(crescente[i])
		}

		// selection sort
		para(inteiro i = 0; i < tamanho - 1; i++){
			menor_valor = i
			para(inteiro c = i + 1; c < tamanho; c++){
				se(crescente[c] < crescente[menor_valor]){
					menor_valor = c
				}
			}
			aux = crescente[i]
			crescente[i] = crescente[menor_valor]
			crescente[menor_valor] = aux
		}

		// saída do vetor crescente
		escreva("\nValores em ordem crescente: ")
		para(inteiro i = 0; i < tamanho; i++){
			escreva(crescente[i], " ")
		}

		// formação e saída do vetor decrescente
		para(inteiro i = 9; i >= 0; i--){
			decrescente[9 - i] = crescente[i]
		}

		// saída do vetor crescente
		escreva("\nValores em ordem decrescente: ")
		para(inteiro i = 0; i < tamanho; i++){
			escreva(decrescente[i], " ")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 955; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {crescente, 4, 9, 9};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */