programa
{
	inclua biblioteca Matematica --> m
	
	funcao inicio()
	{
		cadeia alunos[5], status
		real notas[5][4]
		inteiro colunas = 4, linhas = 5

		para(inteiro c = 0; c < linhas; c++){
			escreva("Aluno ", c+1, ": ")
			leia(alunos[c])
			para(inteiro v = 0; v < colunas - 1; v++){
				escreva("Nota ", v+1, ": ")
				leia(notas[c][v])
			}
			notas[c][3] = (notas[c][0] + notas[c][1] + notas[c][2])/3
		}

		escreva("Média final dos alunos\n")
		para(inteiro c = 0; c < linhas; c++){
			se(notas[c][3] >= 7.0){
				status = "APROVADO"
			}
			senao se(notas[c][3] < 5.0){
				status = "REPROVADO"
			}
			senao{
				status = "RECUPERAÇÃO"
			}

			escreva(alunos[c], ": ", m.arredondar(notas[c][3], 2), "\t|", status, "\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 733; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {notas, 8, 7, 5};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */