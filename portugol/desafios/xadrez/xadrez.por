programa
{
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g

	inteiro cor_verde = g.criar_cor(119, 149, 86)
	inteiro cor_branco = g.criar_cor(235, 236, 208)
	inteiro cor_movimento = g.criar_cor(212, 212, 212)

	inteiro clicado = 0
	inteiro aux_linha = 0
	inteiro aux_coluna = 0

	inteiro possibilidades[200]
	inteiro c_possibilidades = 0
	
	inteiro pos_pecas[8][8] = {
		{15, 12, 10, 14, 11, 10, 12, 15},
		{13, 13, 13, 13, 13, 13, 13, 13},
		{-1, -1, -1, 23, 15, -1, -1, -1},
		{-1, -1, -1, -1, -1, -1, -1, -1},
		{-1, -1, -1, -1, -1, -1, -1, -1},
		{-1, -1, -1, -1, -1, -1, -1, -1},
		{23, 23, 23, 23, 23, 23, 23, 23},
		{25, 22, 20, 24, 21, 20, 22, 25}
	}

	inteiro posicoes[8][8] = {
		{00, 01, 02, 03, 04, 05, 06, 07},
		{10, 11, 12, 13, 14, 15, 16, 17},
		{20, 21, 22, 23, 24, 25, 26, 27},
		{30, 31, 32, 33, 34, 35, 36, 37},
		{40, 41, 42, 43, 44, 45, 46, 47},
		{50, 51, 52, 53, 54, 55, 56, 57},
		{60, 61, 62, 63, 64, 65, 66, 67},
		{70, 71, 72, 73, 74, 75, 76, 77}
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
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(800, 800)
		g.definir_titulo_janela("Xadrez")
		enquanto(verdadeiro){
			desenhar()
			se(clicado == 0) verificar_possibilidades(aux_linha, aux_coluna)
			g.renderizar()
		}
	}

	funcao desenhar(){
		inteiro cor
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
				g.desenhar_retangulo(c*100, l*100, 100, 100, falso, verdadeiro)

				// animação de hover
				se(m.posicao_x() >= c*100 e m.posicao_x() <= c*100 + 100){
					se(m.posicao_y() >= l*100 e m.posicao_y() <= l*100 + 100){
						g.definir_cor(g.COR_PRETO)
						g.definir_opacidade(50)
						g.desenhar_retangulo(c*100, l*100, 100, 100, falso, verdadeiro)
						g.definir_opacidade(255)
						se(m.botao_pressionado(m.BOTAO_ESQUERDO)){
							clicado = 1
							verificar_possibilidades(l, c)
						}
					}
				}

				// desenho das peças
				se(cor_peca(l, c) == 1){
					g.desenhar_imagem(20 + c * 100, 20 + l * 100, pretas[tipo_peca(l, c)])
				}
				senao se(cor_peca(l, c) == 2){
					g.desenhar_imagem(20 + c * 100, 20 + l * 100, brancas[tipo_peca(l, c)])
				}
				
			}
		}
	}

	funcao inteiro cor_peca(inteiro linha, inteiro coluna){
		inteiro aux = pos_pecas[linha][coluna] - pos_pecas[linha][coluna] % 10
		retorne aux / 10
	}

	funcao inteiro tipo_peca(inteiro linha, inteiro coluna){
		retorne pos_pecas[linha][coluna] % 10
	}

	funcao verificar_possibilidades(inteiro linha, inteiro coluna){
		inteiro trava = 0
		se(m.botao_pressionado(0)){
			para(inteiro v = 1; v < c_possibilidades; v+=2){
				se(m.posicao_y() >= possibilidades[v-1] * 100 e m.posicao_y() <= possibilidades[v-1] * 100 + 100){
					se(m.posicao_x() >= possibilidades[v] * 100 e m.posicao_x() <= possibilidades[v] * 100 + 100){
						mover_peca(aux_linha, aux_coluna, possibilidades[v-1], possibilidades[v])
						trava = 1
					}
				}
			}
		}
		
		inteiro peca = tipo_peca(linha, coluna)
		inteiro cor = cor_peca(linha, coluna)

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

		escolha(peca){
			caso 3:
				para(inteiro c = 1; c < 3; c++){
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
				se(cor_peca(linha + direcao, coluna + 1) != cor e cor_peca(linha + direcao, coluna + 1) != 0) desenhar_ataque(linha + direcao, coluna + 1)
				}
				
				se(coluna > 0){
					se(cor_peca(linha + direcao, coluna - 1) != cor e cor_peca(linha + direcao, coluna - 1) != 0) desenhar_ataque(linha + direcao, coluna - 1)
				}
			pare
			caso 5:
				para(inteiro c = 1; c < 8; c++){
					mod_c = coluna
					mod_l = linha * c + 1

					se(mod_l < 8 e mod_l > 0){
						se(pos_pecas[mod_l][mod_c] == -1 e trava == 0){
							desenhar_possibilidade(mod_l, mod_c)
							possibilidades[c_possibilidades] = mod_l
							c_possibilidades++
							possibilidades[c_possibilidades] = mod_c
							c_possibilidades++
						}
					}
					senao trava = 1
				}
			pare
		}
	}

	funcao desenhar_possibilidade(inteiro linha, inteiro coluna){
		g.definir_cor(cor_movimento)
		g.desenhar_elipse(coluna * 100 + 40, linha * 100 + 40, 20, 20, verdadeiro)
	}

	funcao desenhar_ataque(inteiro linha, inteiro coluna){
		g.definir_cor(g.COR_PRETO)
		g.desenhar_elipse(coluna * 100 + 35, linha * 100 + 35, 30, 30, verdadeiro)
	}

	funcao mover_peca(inteiro linha_original, inteiro coluna_original, inteiro linha_atual, inteiro coluna_atual){
		inteiro aux = pos_pecas[linha_original][coluna_original]
		pos_pecas[linha_original][coluna_original] = -1
		pos_pecas[linha_atual][coluna_atual] = aux
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4942; 
 * @DOBRAMENTO-CODIGO = [39, 48, 117, 122, 205, 210, 215];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {c_possibilidades, 15, 9, 16}-{linha_original, 216, 27, 14}-{coluna_original, 216, 51, 15}-{linha_atual, 216, 76, 11}-{coluna_atual, 216, 97, 12};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */