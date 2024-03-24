programa
{
	
	funcao inicio()
	{
		inteiro vetor[200], auxiliar, tam = 0, c = 0

		escreva("Digite o comp do vetor: ")
		leia(tam)
		limpa()

		para(c = 0; c < tam; c++){
			escreva("Valor da posição ", c + 1, ": ")
			leia(vetor[c])
			limpa()
		}

		escreva("== VETOR ORIGINAL ==\n")
		para(c = 0; c < tam; c++){
			escreva(vetor[c], " ")
		}
		escreva("\n")

		para(inteiro v = 0; v < tam; v++){
			para(c = 0; c < tam - 1; c++){
				se(vetor[c] > vetor[c + 1]){
					auxiliar = vetor[c]
					vetor[c] = vetor[c + 1]
					vetor[c + 1] = auxiliar
				}
			}
		}

		escreva("== VETOR DECRESCENTE ==\n")
		para(c = 0; c < tam; c++){
			escreva(vetor[c], " ")
		}
		escreva("\n")

		para(inteiro v = 0; v < tam; v++){
			para(c = 0; c < tam - 1; c++){
				se(vetor[c] < vetor[c + 1]){
					auxiliar = vetor[c]
					vetor[c] = vetor[c + 1]
					vetor[c + 1] = auxiliar
				}
			}
		}

		escreva("== VETOR CRESCENTE ==\n")
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
 * @POSICAO-CURSOR = 57; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vetor, 6, 10, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */