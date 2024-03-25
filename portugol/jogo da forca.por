programa
{
	inclua biblioteca Texto --> txt
	
	funcao inicio()
	{
		cadeia palavraSecreta, palavraOriginal[200], palavraJogador[200], palpite, palpitesUsados[200]
		inteiro tam, erros = 0, aux = 0, letrasCertas = 0, cont = 0
		logico forca = verdadeiro
		// matriz que forma o desenho da forca
		caracter desenho[7][7] = {
		{' ', '_', '_', '_', '_', '_', '_'},
		{' ', ' ', ' ', '|', ' ', ' ', '|'},
		{' ', ' ', ' ', ' ', ' ', ' ', '|'},
		{' ', ' ', ' ', ' ', ' ', ' ', '|'},
		{' ', ' ', ' ', ' ', ' ', ' ', '|'},
		{' ', ' ', ' ', ' ', ' ', ' ', '|'},
		{'_', '_', '_', '_', '_', '_', '|'}
		}

		// digitação da palavra secreta
		escreva("Digite a palavra secreta: ")
		leia(palavraSecreta)
		palavraSecreta = txt.caixa_alta(palavraSecreta)
		tam = txt.numero_caracteres(palavraSecreta)

		// geração dos espaços em branco
		para(inteiro c = 0; c < tam; c ++){
			palavraOriginal[c] = (txt.obter_caracter(palavraSecreta, c) + "")
			palavraJogador[c] = "_"
		}
		
		limpa()
		
		// loop que funciona enquanto não perder ou ganhar
		enquanto(forca){
			aux = letrasCertas
			// mostra o desenho da forca
			para(inteiro l = 0; l < 7; l++){
				para(inteiro c = 0; c < 7; c++){
					escreva(desenho[l][c])
				}
				escreva("\n")
			}
			
			escreva("\n")

			// mostra as letras já acertadas
			para(inteiro c = 0; c < tam; c++){
				escreva("[ ", palavraJogador[c], " ]")
			}

			// mostra as letras usadas
			escreva("\n\nLetras usadas: ")
			para(inteiro c = 0; c < cont; c++){
				escreva(palpitesUsados[c], " ")
			}

			// lê o palpite
			escreva("\n\nPalpite: ")
			leia(palpite)
			palpitesUsados[cont] = palpite
			palpite = txt.caixa_alta(palpite)
			
			// verifica se a palavra secreta contém o palpite
			para(inteiro c = 0; c < tam; c++){
				se(palpite == palavraOriginal[c]){
					// adiciona o palpite a palavra do jogador
					palavraJogador[c] = palpite
					letrasCertas++
				}
			}
			
			// verifica se o palpite não está contido
			se(aux == letrasCertas){
				erros++
				// atualiza a matriz conforme a quantidade de erros
				escolha(erros){
					caso 1:
						desenho[2][2] = '('
						desenho[2][4] = ')'
					pare

					caso 2:
						desenho[3][2] = '/'
						desenho[3][3] = '|'
					pare

					caso 3:
						desenho[3][4] = '\\'
					pare

					caso 4:
						desenho[4][3] = '|'
					pare

					caso 5:
						desenho[5][2] = '/'
					pare

					caso 6:
						desenho[5][4] = '\\'
					pare
						
				}
			}

			// verifica se perdeu ou se ganou
			se(erros >= 6 ou letrasCertas == tam){
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
 * @POSICAO-CURSOR = 2549; 
 * @DOBRAMENTO-CODIGO = [10, 77];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {desenho, 11, 11, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */