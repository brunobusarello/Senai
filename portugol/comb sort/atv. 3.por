programa
{
	const inteiro tam = 10
	
	inteiro idades[tam]
	inteiro aux, opcao

	cadeia nomes[tam]
	cadeia auxiliar

	funcao inicio()
	{
		para(inteiro c = 0; c < tam; c++){
			escreva("Digite o nome da ", c + 1, "º pessoa: ")
			leia(nomes[c])
			escreva("Digite a idade da ", c + 1, "º pessoa: ")
			leia(idades[c])
		}

		escreva("\n-- Selecione o método de ordenação --")
		escreva("\n 1 - Selection Sort")
		escreva("\n 2 - Insertion Sort")
		escreva("\n 3 - Bubble Sort")
		escreva("\n 4 - Comb Sort\n")
		leia(opcao)

		escolha(opcao){
			caso 1:
				selection()
			pare
			
			caso 2:
				insertion()
			pare
			caso 3:
				bubble()
			pare
			caso 4:
				comb()
			pare
		}

		limpa()
		escreva("Idade das pessoas em ordem decrescente\n")
		para(inteiro c = 0; c < tam; c++){
			escreva(nomes[c], "\t: ", idades[c], "\n")
		}
	}

	funcao selection(){
		inteiro menor_valor
		para(inteiro c = 0; c < tam - 1; c++){
			menor_valor = c
			para(inteiro v = c + 1; v < tam; v++){
				se(idades[v] > idades[menor_valor]){
					menor_valor = v
				}
			}
			aux = idades[c]
			idades[c] = idades[menor_valor]
			idades[menor_valor] = aux

			auxiliar = nomes[c]
			nomes[c] = nomes[menor_valor]
			nomes[menor_valor] = auxiliar
		}
	}

	funcao insertion(){
		inteiro elementoAtual
		cadeia nomeAtual
		para(inteiro c = 1; c < tam; c++){
			elementoAtual = idades[c]
			nomeAtual = nomes[c]
			enquanto(c > 0 e elementoAtual > idades[c - 1]){
				idades[c] = idades[c - 1]
				nomes[c] = nomes[c - 1]
				c--
			}

			idades[c] = elementoAtual
			nomes[c] = nomeAtual
		}
	}

	funcao bubble(){
		para(inteiro v = 0; v < tam; v++){
			para(inteiro c = 0; c < tam - 1; c++){
				se(idades[c] < idades[c + 1]){
					aux = idades[c]
					idades[c] = idades[c + 1]
					idades[c + 1] = aux

					auxiliar = nomes[c]
					nomes[c] = nomes[c + 1]
					nomes[c + 1] = auxiliar
				}
			}
		}
	}

	funcao comb(){
		inteiro gap = tam
		logico trocado = verdadeiro
		real fator = 1.3
		enquanto(gap > 1 ou trocado){
			gap /= fator
			se(gap < 1) gap = 1

			trocado = falso
			inteiro i = 0

			enquanto(i + gap < tam){
				se(idades[i] < idades[gap + i]){
					aux = idades[i]
					idades[i] = idades[gap + i]
					idades[gap + i] = aux

					auxiliar = nomes[i]
					nomes[i] = nomes[gap + i]
					nomes[gap + i] = auxiliar
				}
				i++
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 140; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {idades, 5, 9, 6}-{nomes, 8, 8, 5}-{menor_valor, 51, 10, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */