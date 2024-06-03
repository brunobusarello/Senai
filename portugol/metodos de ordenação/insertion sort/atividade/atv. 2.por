programa
{
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		inteiro vetor[8], tam = 8, elemento_atual

		escreva("Vetor original: ")

		// preenchimento do vetor e saída do vetor
		para(inteiro c = 0; c < tam; c++){
			vetor[c] = u.sorteia(1, 9)
			escreva(vetor[c], " ")
		}

		// ordenação do vetor
		para(inteiro c = 1; c < tam; c++){
			elemento_atual = vetor[c]

			enquanto(c > 0 e vetor[c-1] > elemento_atual){
				vetor[c] = vetor[c - 1]
				c--
			}
			vetor[c] = elemento_atual
		}

		// saída do vetor 
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
 * @POSICAO-CURSOR = 628; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vetor, 7, 10, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */