programa
{
	inclua biblioteca Util --> u
	
	funcao inicio()
	{
		inteiro vetor[5], tam = 5, i, gap, auxiliar
		real fator = 1.3
		logico trocado = verdadeiro

		// preenchimento do vetor
		escreva("Vetor original: ")
		para(inteiro c = 0; c < tam; c++){
			vetor[c] = u.sorteia(10, 50)
			escreva(vetor[c], " ")
		}

		// comb sort
		gap = tam
		enquanto(gap > 1 ou trocado){
			gap /= fator
			se(gap < 1) gap = 1

			trocado = falso
			i = 0

			enquanto(i + gap < tam){
				se(vetor[i] > vetor[gap + i]){
					auxiliar = vetor[i]
					vetor[i] = vetor[gap + i]
					vetor[gap + i] = auxiliar
				}
				i++
			}
		}

		// vetor ordenado
		escreva("\nVetor ordenado: ")
		para(inteiro c = 0; c <  tam; c++){
			escreva(vetor[c], " ")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 94; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vetor, 7, 10, 5}-{i, 7, 29, 1}-{gap, 7, 32, 3}-{trocado, 9, 9, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */