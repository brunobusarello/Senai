programa
{
	
	funcao inicio()
	{
		real notas[250], aux
		inteiro cont = 0, continuar = 1, tam = 0

		enquanto(continuar == 1){
			escreva("Digite a nota da ", cont + 1, "ª pessoa (0 para): ")
			leia(notas[cont])
			se(notas[cont] == 0){
				continuar = 0
			}
			cont++
			tam++
		}

		para(inteiro v = 0; v < tam; v++){
			para(inteiro c = 0; c < tam - 1; c++){
				se(notas[c] < notas[c + 1]){
					aux = notas[c]
					notas[c] = notas[c + 1]
					notas[c + 1] = aux
				}
			}
		}

		se(tam < 10){
			escreva(tam - 1, " maiores notas\n")
			para(inteiro c = 0; c < tam - 1; c++){
				escreva(c + 1, "ª - ", notas[c], "\n")
			}	
		}
		senao{
			escreva("== 10 maiores notas ==\n")
			para(inteiro c = 0; c < 10; c++){
				escreva(c + 1, "ª - ", notas[c], "\n")
			}	
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 635; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */