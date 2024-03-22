programa
{
	
	funcao inicio()
	{
		// definição das variáveis
		real notas[250], aux
		inteiro cont = 0, continuar = 1, tam = 0

		// loop, que para quando digitar 0, para perguntar a nota
		enquanto(continuar == 1){
			escreva("Digite a nota da ", cont + 1, "ª pessoa (0 para): ")
			leia(notas[cont])
			se(notas[cont] == 0){
				continuar = 0
			}
			cont++
			tam++
		}
		
		// organizar o vetor de forma decrescente
		para(inteiro v = 0; v < tam; v++){
			para(inteiro c = 0; c < tam - 1; c++){
				se(notas[c] < notas[c + 1]){
					aux = notas[c]
					notas[c] = notas[c + 1]
					notas[c + 1] = aux
				}
			}
		}
		
		// mostra as 10 melhores notas
		se(tam < 10){
			escreva(tam - 1, " maiores notas\n")
			para(inteiro c = 0; c < tam - 1; c++){
				escreva(c + 1, "ª - ", notas[c], "\n")
			}	
		}
		// senão foi digitado 10 notas, mostra as notas digitadas
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
 * @POSICAO-CURSOR = 867; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */