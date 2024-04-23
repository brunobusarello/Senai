programa
{
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g

	// cria as cores usadas
	inteiro cor_verde = g.criar_cor(119, 149, 86)
	inteiro cor_branco = g.criar_cor(235, 236, 208)
	inteiro cor_movimento = g.criar_cor(212, 212, 212)

	// vetor das posições da rainha
	inteiro pos_rainha[16] = {-1, 0, 1, 0, 0, -1, 0, 1, -1, -1, 1, 1, -1, 1, 1, -1}

	inteiro pos_cavalo[16] = {-2, 1, -1, 2, 1, 2, 2, 1, 2, -1, 1, -2, -1, -2, -2, -1}

	inteiro pos_rei[16] = {-1, -1, 1, 1, -1, 1, 1, -1, -1, 0, 1, 0, 0, -1, 0, 1}

	inteiro pos_torres[8] = {-1, 0, 1, 0, 0, 1, 0, -1}

	inteiro bispo[8] = {-1, -1, 1, 1, -1, 1, 1, -1} 

	inteiro branco_c = 0
	inteiro branco_l = 0
	inteiro preto_c = 0
	inteiro preto_l = 0

	// posições dos reis
	inteiro branco_x = 4
	inteiro branco_y = 7
	inteiro preto_x = 4
	inteiro preto_y = 0
	inteiro trava_rei = 0

	// indica qual a cor da peça que jogará
	inteiro vez = 2
	
	inteiro trava = 0
	inteiro cor = 0

	// flag para continuar mostrando as possibilidades de ataque e movimento
	inteiro clicado = 1

	// variáveis que replicam os valores da função verificar_possibilidades
	inteiro aux_linha = 0
	inteiro aux_coluna = 0

	// vetor que guarda as possibilidades de movimento da peça selecionada
	inteiro possibilidades[200]
	inteiro c_possibilidades = 0

	// vetor que guarda a possibilidade de ataque da peça selecionada
	inteiro ataques[50]
	inteiro c_ataques = 0

	// matriz das peças
	inteiro pos_pecas[8][8] = {
		{15, 12, 10, 14, 11, 10, 12, 15},
		{13, 13, 13, 13, 13, 13, 13, 13},
		{-1, -1, -1, -1, -1, -1, -1, -1},
		{-1, -1, -1, -1, -1, -1, -1, -1},
		{-1, -1, -1, -1, -1, -1, -1, -1},
		{-1, -1, -1, -1, -1, -1, -1, -1},
		{23, 23, 23, 23, 23, 23, 23, 23},
		{25, 22, 20, 24, 21, 20, 22, 25}
	}

	// inicialização das peças
	inteiro brancas[6] = {
		g.carregar_imagem("/src/brancas/bispo.png"),
		g.carregar_imagem("/src/brancas/rei.png"),
		g.carregar_imagem("/src/brancas/cavalo.png"),
		g.carregar_imagem("/src/brancas/peao.png"),
		g.carregar_imagem("/src/brancas/rainha.png"),
		g.carregar_imagem("/src/brancas/torre.png")
	}
	
	inteiro pretas[6] = {
		g.carregar_imagem("/src/pretas/bispo.png"),
		g.carregar_imagem("/src/pretas/rei.png"),
		g.carregar_imagem("/src/pretas/cavalo.png"),
		g.carregar_imagem("/src/pretas/peao.png"),
		g.carregar_imagem("/src/pretas/rainha.png"),
		g.carregar_imagem("/src/pretas/torre.png")
	}

	// inicialização das funções principais
	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(1200, 700)
		g.definir_titulo_janela("Xadrez")
		enquanto(verdadeiro){
			verificar_movimento()
			desenhar()
			peca_cheque()
			se(clicado == 0) verificar_possibilidades(aux_linha, aux_coluna)
			g.renderizar()
		}
	}

	// desenha o tabuleiro, desenha as peças e verifica se alguma peça foi clicada
	funcao desenhar(){
		g.definir_cor(g.COR_PRETO)
		g.limpar()
		
		inteiro comeco = 0
		para(inteiro l = 0; l < 8; l++){
			se(l % 2 > 0){
				comeco = 1
			}
			senao{
				comeco = 0
			}
			
			para(inteiro c = 0; c < 8; c++){
				// desenho do quadriculado
				se(c % 2 == comeco){
					cor = cor_verde
				}
				senao{
					cor = cor_branco
				}
				g.definir_cor(cor)
				g.desenhar_retangulo(c*80 + 30, l*80 + 30, 80, 80, falso, verdadeiro)

				// animação de hover
				se(m.posicao_x() >= c*80 + 30 e m.posicao_x() <= c*80 + 80 + 30){
					se(m.posicao_y() >= l*80 + 30 e m.posicao_y() <= l*80 + 80 + 30){
						g.definir_cor(g.COR_PRETO)
						g.definir_opacidade(50)
						g.desenhar_retangulo(c*80 + 30, l*80 + 30, 80, 80, falso, verdadeiro)
						g.definir_opacidade(255)
						se(m.botao_pressionado(m.BOTAO_ESQUERDO)){
							se(cor_peca(l, c) == vez){
								clicado = 1
								verificar_possibilidades(l, c)
							}
						}
					}
				}

				// desenho das peças
				se(cor_peca(l, c) == 1){
					g.desenhar_imagem(40 + c * 80, 40 + l * 80, pretas[tipo_peca(l, c)])
				}
				senao se(cor_peca(l, c) == 2){
					g.desenhar_imagem(40 + c * 80, 40 + l * 80, brancas[tipo_peca(l, c)])
				}
				
			}
		}
	}

	// retorna a cor da peça conforme o valor da matriz (1 - peça preta, 2 - peça branca)
	funcao inteiro cor_peca(inteiro linha, inteiro coluna){
		inteiro aux = pos_pecas[linha][coluna] - pos_pecas[linha][coluna] % 10
		retorne aux / 10
	}

	// retona qual é a peça que foi clicada (0 - bispo, 1 - rei, 2 - cavalo, 3 - peão, 4 - rainha, 5 - torre)
	funcao inteiro tipo_peca(inteiro linha, inteiro coluna){
		retorne pos_pecas[linha][coluna] % 10
	}

	// obtém a peça que foi clicada se pode atacar e o quanto pode se movimentar
	funcao verificar_possibilidades(inteiro linha, inteiro coluna){
		trava = 0
		
		inteiro peca = tipo_peca(linha, coluna)
		cor = cor_peca(linha, coluna)

		inteiro direcao = 0
		inteiro mod_l = 0
		inteiro mod_c = 0

		se(cor == 1) direcao = 1
		se(cor == 2) direcao = -1

		se(clicado == 1){
			clicado = 0
			aux_linha = linha
			aux_coluna = coluna
		}

		c_possibilidades = 0
		c_ataques = 0

		escolha(peca){
			caso 3:
				inteiro casas = 3
				se(direcao == 1 e linha > 2) casas = 2
				senao se(direcao == -1 e linha < 5) casas = 2
				
				para(inteiro c = 1; c < casas; c++){
					mod_c = coluna
					mod_l = linha + c * direcao
					
					se(pos_pecas[mod_l][mod_c] == -1 e trava == 0){
						desenhar_possibilidade(mod_l, mod_c)
						possibilidades[c_possibilidades] = mod_l
						c_possibilidades++
						possibilidades[c_possibilidades] = mod_c
						c_possibilidades++
					}
					
					senao trava = 1

					
				}
				se(coluna < 7){
					se(cor_peca(linha + direcao, coluna + 1) != cor e cor_peca(linha + direcao, coluna + 1) != 0){
						desenhar_ataque(linha + direcao, coluna + 1)
						ataques[c_ataques] = linha + direcao
						c_ataques++
						ataques[c_ataques] = coluna + 1
						c_ataques++
					}
				}
				
				se(coluna > 0){
					se(cor_peca(linha + direcao, coluna - 1) != cor e cor_peca(linha + direcao, coluna - 1) != 0){
						desenhar_ataque(linha + direcao, coluna - 1)
						ataques[c_ataques] = linha + direcao
						c_ataques++
						ataques[c_ataques] = coluna - 1
						c_ataques++
					}
				}
			pare
			caso 5:
				para(inteiro cont = 0; cont < 8; cont+=2){
					trava = 0
					para(inteiro c = 1; c < 8; c++){

						mod_l = linha + c * pos_torres[cont + 1]
						mod_c = coluna + c * pos_torres[cont]
						
						verifica_ataques(mod_l, mod_c)
					}
				}
			pare
			caso 0:
				para(inteiro cont = 0; cont < 8; cont+=2){
					trava = 0
					para(inteiro c = 1; c < 8; c++){
						
						mod_l = linha + c * bispo[cont + 1]
						mod_c = coluna + c * bispo[cont]
						
						verifica_ataques(mod_l, mod_c)
					}
				}
			pare
			caso 2:
				para(inteiro v = 0; v < 16; v+=2){
					trava = 0
					mod_l = pos_cavalo[v] + linha
					mod_c = pos_cavalo[v+1] + coluna

					verifica_ataques(mod_l, mod_c)
				}
			pare
			caso 4:
				para(inteiro v = 0; v < 16; v+=2){
					trava = 0
					para(inteiro c = 1; c < 8; c++){
						mod_l = pos_rainha[v + 1] * c + linha
						mod_c = pos_rainha[v] * c + coluna

						verifica_ataques(mod_l, mod_c)
					}
				}
			pare
			caso 1:
				para(inteiro v = 0; v < 16; v+=2){
					trava = 0
					mod_l = pos_rei[v] + linha
					mod_c = pos_rei[v+1] + coluna

					verifica_ataques(mod_l, mod_c)
				}
			pare
		}
	}

	// desenha as casas que a peça pode se movimentar e armazena essas posições em um vetor
	funcao desenhar_possibilidade(inteiro linha, inteiro coluna){
		g.definir_cor(cor_movimento)
		g.desenhar_elipse(coluna * 80 + 30 + 30, linha * 80 + 30 + 30, 20, 20, verdadeiro)
	}

	// desenhar as casas que a peça pode atacar e armazena essas posições em um vetor
	funcao desenhar_ataque(inteiro linha, inteiro coluna){
		g.definir_cor(g.COR_AZUL)
		g.desenhar_elipse(coluna * 80 + 10 + 30, linha * 80 + 10 + 30, 60, 60, verdadeiro)
		se(cor_peca(linha,coluna) == 1) g.desenhar_imagem(coluna * 80 + 40, linha * 80+ 40, pretas[tipo_peca(linha, coluna)])
		senao g.desenhar_imagem(coluna * 80 + 40, linha * 80 + 40, brancas[tipo_peca(linha, coluna)])
	}

	// muda a posição da peça na matriz
	funcao mover_peca(inteiro linha_original, inteiro coluna_original, inteiro linha_atual, inteiro coluna_atual){
		inteiro aux = pos_pecas[linha_original][coluna_original]
		pos_pecas[linha_original][coluna_original] = -1
		pos_pecas[linha_atual][coluna_atual] = aux
		se(tipo_peca(linha_atual, coluna_atual) == 1){
			se(cor_peca(linha_atual, coluna_atual) == 1){
				preto_x = coluna_atual
				preto_y = linha_atual
			}
			senao{
				branco_x = coluna_atual
				branco_y = linha_atual
			}
		}
		se(vez == 1) vez = 2
		senao vez = 1
	}

	// muda a posição da peça que atacou e remova a outra peça da matriz
	funcao matar_peca(inteiro linha_original, inteiro coluna_original, inteiro linha_atual, inteiro coluna_atual){
		inteiro aux = pos_pecas[linha_original][coluna_original]
		pos_pecas[linha_original][coluna_original] = -1
		pos_pecas[linha_atual][coluna_atual] = -1
		pos_pecas[linha_atual][coluna_atual] = aux
		se(vez == 1) vez = 2
		senao vez = 1
	}

	// verifica se foi clicado em alguma das posições do vetor de movimento e de ataque. Se for verdadeiro chama a função para movimentar
	funcao verificar_movimento(){
		se(m.botao_pressionado(0)){
			para(inteiro v = 1; v < c_possibilidades; v+=2){
				se(m.posicao_y() >= possibilidades[v-1] * 80 + 30 e m.posicao_y() <= possibilidades[v-1] * 80 + 80 + 30){
					se(m.posicao_x() >= possibilidades[v] * 80 + 30 e m.posicao_x() <= possibilidades[v] * 80 + 80 + 30){
						mover_peca(aux_linha, aux_coluna, possibilidades[v-1], possibilidades[v])
					}
				}
			}
			para(inteiro v = 1; v < c_ataques; v+=2){
				se(m.posicao_y() >= ataques[v-1] * 80 + 30 e m.posicao_y() <= ataques[v-1] * 80 + 80 + 30){
					se(m.posicao_x() >= ataques[v] * 80 + 30 e m.posicao_x() <= ataques[v] * 80 + 80 + 30){
						matar_peca(aux_linha, aux_coluna, ataques[v-1], ataques[v])
					}
				}
			}
		}
	}

	// verifica se pode desenhar ataques e possibilidades na posição e armazena esses ataques e essas posições em um vetor
	funcao verifica_ataques(inteiro mod_l, inteiro mod_c){
		se(mod_l < 8 e mod_c < 8 e mod_l >= 0 e mod_c >= 0){
			se(pos_pecas[mod_l][mod_c] == -1 e trava == 0){
				desenhar_possibilidade(mod_l, mod_c)
				possibilidades[c_possibilidades] = mod_l
				c_possibilidades++
				possibilidades[c_possibilidades] = mod_c
				c_possibilidades++
			}
			senao trava++
			
			se(cor_peca(mod_l, mod_c) != cor e cor_peca(mod_l, mod_c) != 0 e trava == 1){
				desenhar_ataque(mod_l, mod_c)
				ataques[c_ataques] = mod_l
				c_ataques++
				ataques[c_ataques] = mod_c
				c_ataques++
			}
		}
	}

	funcao desenhar_cheque(inteiro cor_rei){
		inteiro posX = 0
		inteiro posY = 0
		inteiro peca = 0
		se(cor_rei == 1){
			posX = preto_x
			posY = preto_y
			peca = pretas[1]
		}
		senao{
			posX = branco_x
			posY = branco_y
			peca = brancas[1]
		}
		g.definir_cor(g.COR_VERMELHO)
		g.desenhar_elipse(posX * 80 + 10 + 30, posY * 80 + 10 + 30, 60, 60, verdadeiro)
		g.desenhar_imagem(40 + posX * 80, 40 + posY * 80, peca)
	}

	funcao verifica_cheque(inteiro peca){
		// cheque do rei branco com cavalo
		se(branco_c >= 0 e branco_l >= 0 e branco_c < 8 e branco_l < 8){
			se(cor_peca(branco_l, branco_c) == 2){
				trava_rei = 1
			}
			senao se(cor_peca(branco_l, branco_c) == 1){
				se(tipo_peca(branco_l, branco_c) == peca){
					desenhar_cheque(2)
				}
				senao trava_rei = 1
			}
		}

		// cheque do rei preto com cavalo
		se(preto_c >= 0 e preto_l >= 0 e preto_c < 8 e preto_l < 8){
			se(cor_peca(preto_l, preto_c) == 1){
				trava_rei = 1
			}
			senao se(cor_peca(preto_l, preto_c) == 2){
				se(tipo_peca(preto_l, preto_c) == peca){
					desenhar_cheque(1)
				}
				senao trava_rei = 1
			}
		}
	}

	// verifica se o rei está em cheque
	funcao peca_cheque(){
		para(inteiro c = 0; c < 16; c+=2){
			trava_rei = 0
			para(inteiro i = 1; i < 8; i++){
				se(trava_rei == 0){
					branco_l = branco_y + pos_rainha[c] * i
					branco_c = branco_x + pos_rainha[c + 1] * i
					preto_l = preto_y + pos_rainha[c] * i
					preto_c = preto_x + pos_rainha[c + 1] * i

					verifica_cheque(4)
				}
			}
			trava_rei = 0
			branco_l = branco_y + pos_cavalo[c]
			branco_c = branco_x + pos_cavalo[c + 1]
			preto_l = preto_y + pos_cavalo[c]
			preto_c = preto_x + pos_cavalo[c + 1]

			verifica_cheque(2)

			trava_rei = 0

			branco_l = branco_y + pos_rei[c]
			branco_c = branco_x + pos_rei[c + 1]
			preto_l = preto_y + pos_rei[c]
			preto_c = preto_x + pos_rei[c + 1]

			verifica_cheque(1)
		}
		para(inteiro c = 0; c < 8; c += 2){
			trava_rei = 0
			para(inteiro i = 1; i < 8; i++){
				se(trava_rei == 0){
					branco_l = branco_y + bispo[c] * i
					branco_c = branco_x + bispo[c + 1] * i
					preto_l = preto_y + bispo[c] * i
					preto_c = preto_x + bispo[c + 1] * i
	
					verifica_cheque(0)
				}
			}
			trava_rei = 0
			para(inteiro i = 1; i < 8; i++){
				se(trava_rei == 0){
					branco_l = branco_y + pos_torres[c] * i
					branco_c = branco_x + pos_torres[c + 1] * i
					preto_l = preto_y + pos_torres[c] * i
					preto_c = preto_x + pos_torres[c + 1] * i
	
					verifica_cheque(5)
				}
			}
		}

		para(inteiro c = -1; c < 2; c+=2){
			trava_rei = 0
			branco_l = branco_y - 1
			branco_c = branco_x + c
			preto_l = preto_y + 1
			preto_c = preto_x + c

			verifica_cheque(3)
		}
	}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2836; 
 * @DOBRAMENTO-CODIGO = [67, 76, 86, 101, 154, 160, 165, 286, 292, 300, 319, 329, 349, 370, 389, 418];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {branco_x, 28, 9, 8}-{branco_y, 29, 9, 8}-{preto_x, 30, 9, 7}-{preto_y, 31, 9, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */