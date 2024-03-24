programa
{
	inclua biblioteca Texto --> txt
	
	funcao inicio()
	{
		cadeia palavraSecreta, desenho[6], palavraOriginal[200], palavraJogador[200], palpite, palpitesUsados[200]
		inteiro tam, erros = 0, aux = 0, letrasCertas = 0, cont = 0
		logico forca = verdadeiro

		desenho[0] = "  ______"
		desenho[1] = "    |  |"
		desenho[2] = "   ()  |"
		desenho[3] = "  /||\\ |"
		desenho[4] = "   /\\  |"
		desenho[5] = "  /  \\ |"

		// digitação da palavra secreta e geração dos espaços em branco
		escreva("Digite a palavra secreta: ")
		leia(palavraSecreta)
		palavraSecreta = txt.caixa_alta(palavraSecreta)
		tam = txt.numero_caracteres(palavraSecreta)

		para(inteiro c = 0; c < tam; c ++){
			palavraOriginal[c] = (txt.obter_caracter(palavraSecreta, c) + "")
			palavraJogador[c] = "_"
		}
		
		limpa()
		
		// loop que funciona enquanto não perder ou ganhar
		enquanto(forca){
			aux = letrasCertas
			// mostra o desenho da forca
			para(inteiro c = 0; c < erros + 2; c++){
					escreva(desenho[c], "\n")
			}
			escreva("\n")

			// mostra os indices 
			para(inteiro c = 0; c < tam; c++){
				escreva("[ ", palavraJogador[c], " ]")
			}

			// lê o palpite
			escreva("\nPalpite: ")
			leia(palpite)
			palpitesUsados[cont] = palpite
			palpite = txt.caixa_alta(palpite)
			
			// verifica se a palavra secreta contém o palpite
			para(inteiro c = 0; c < tam; c++){
				se(palpite == palavraOriginal[c]){
					// adiciona o palpite a palavra do jogador
					palavraJogador[c] = palpite
					//palp++
					letrasCertas++
				}
			}
			
			se(aux == letrasCertas){
				erros++	
			}

			// verifica se perdeu
			se(erros >= 4){
				forca = falso	
			}
			// verifica se ganhou
			senao se(letrasCertas == tam){
				forca = falso
			}
			senao{
				limpa()
			}

			cont++
		}

		// retorno se perdeu
		se(erros >= 4){
			escreva("\nFORCA! A palavra era ", palavraSecreta, "\n")
		}
		// retorno se ganhou
		se(letrasCertas == tam){
			escreva("\n   ()  \n")
			escreva("  /||\\ \n")
			escreva("   /\\  \n")
			escreva("  /  \\ \n")
			escreva("Você ganhou!\n")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1777; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */