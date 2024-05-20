programa
{
	
	funcao inicio()
	{
		cadeia alunos[200]
		cadeia aux
		real notas[200]

		inteiro tam = 0
		inteiro i = 0, gap
		real fator = 1.3, auxiliar
		caracter continuar = 'S'
		logico trocado = verdadeiro

		enquanto(continuar == 'S'){
			escreva("Digite o nome da ", tam + 1, "º pessoa: ")
			leia(alunos[tam])
			escreva("Digite a nota da ", tam + 1, "º pessoa: ")
			leia(notas[tam])
			escreva("Deseja adicionar mais uma nota? (S/N) ")
			leia(continuar)
			tam++
		}

		// comb sort
		gap = tam
		enquanto(gap > 1 ou trocado){
			gap /= fator
			se(gap < 1) gap = 1

			trocado = falso
			i = 0

			enquanto(i + gap < tam){
				se(notas[i] < notas[gap + i]){
					auxiliar = notas[i]
					notas[i] = notas[gap + i]
					notas[gap + i] = auxiliar

					aux = alunos[i]
					alunos[i] = alunos[gap + i]
					alunos[gap + i] = aux
				}
				i++
			}
		}
		limpa()
		escreva("Notas dos alunos em ordem decrescente\n")
		para(inteiro c = 0; c < tam; c++){
			escreva(alunos[c], "\t: ", notas[c], "\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 888; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */