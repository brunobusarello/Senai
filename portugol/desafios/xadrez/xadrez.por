programa
{
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g

	inteiro cor_verde = g.criar_cor(119, 149, 86)
	inteiro cor_branco = g.criar_cor(235, 236, 208)
	inteiro cor_movimento = g.criar_cor(212, 212, 212)

	inteiro clicado = 0
	inteiro aux_peca = 0
	inteiro aux_pos_l = 0
	inteiro aux_pos_c = 0
	inteiro cor_move = 0

	
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
			se(clicado == 1){
				desenhar_movimento(aux_peca, aux_pos_l, aux_pos_c)
			}
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
							clicado = 0
							possibilidades(c*100, l*100)						
						}
					}
				}

				// desenho das peças
				se(cor_peca(l, c) == 10){
					g.desenhar_imagem(20 + c * 100, 20 + l * 100, pretas[tipo_peca(l, c)])
				}
				senao se(cor_peca(l, c) == 20){
					g.desenhar_imagem(20 + c * 100, 20 + l * 100, brancas[tipo_peca(l, c)])
				}
				
			}
		}
	}

	funcao desenhar_movimento(inteiro peca, inteiro pos_l, inteiro pos_c){
		inteiro pos_y = 100
		inteiro index_c = pos_c / 100
		inteiro index_l = pos_l / 100
		se(cor_move == 20) pos_y = -100
		se(cor_move == 10) pos_y = 100
		se(clicado == 0){
			clicado = 1
			aux_peca = peca
			aux_pos_l = pos_l
			aux_pos_c = pos_c
		}
		g.definir_cor(cor_movimento)
		escolha(peca){
			caso 3:
				para(inteiro c = 1; c < 3; c++){
					g.desenhar_elipse(pos_c + 40, c*pos_y + pos_l + 40, 20, 20, verdadeiro)
				}
			pare
			caso 2:
				g.desenhar_elipse((pos_c - 100) + 40, (pos_l + 200) + 40, 20, 20, verdadeiro)
				g.desenhar_elipse((pos_c + 100) + 40, (pos_l + 200) + 40, 20, 20, verdadeiro)

				g.desenhar_elipse((pos_c - 100) + 40, (pos_l - 200) + 40, 20, 20, verdadeiro)
				g.desenhar_elipse((pos_c + 100) + 40, (pos_l - 200) + 40, 20, 20, verdadeiro)

				g.desenhar_elipse((pos_c - 200) + 40, (pos_l - 100) + 40, 20, 20, verdadeiro)
				g.desenhar_elipse((pos_c - 200) + 40, (pos_l + 100) + 40, 20, 20, verdadeiro)

				g.desenhar_elipse((pos_c + 200) + 40, (pos_l - 100) + 40, 20, 20, verdadeiro)
				g.desenhar_elipse((pos_c + 200) + 40, (pos_l + 100) + 40, 20, 20, verdadeiro)
			pare
			caso 0:
				para(inteiro v = 1; v < 8; v++){
					g.desenhar_elipse((v*-100 + pos_c) + 40, (v*-100 + pos_l) + 40, 20, 20, verdadeiro)
					g.desenhar_elipse((v*100 + pos_c) + 40, (v*-100 + pos_l) + 40, 20, 20, verdadeiro)
					g.desenhar_elipse((v*-100 + pos_c) + 40, (v*100 + pos_l) + 40, 20, 20, verdadeiro)
					g.desenhar_elipse((v*100 + pos_c) + 40, (v*100 + pos_l) + 40, 20, 20, verdadeiro)
				}
			pare
			caso 5:
				para(inteiro c = 1; c < 8; c++){
					g.desenhar_elipse(pos_c + 40, (pos_l + c * 100) + 40, 20, 20, verdadeiro)
					g.desenhar_elipse(pos_c + 40, (pos_l + c * -100) + 40, 20, 20, verdadeiro)

					g.desenhar_elipse((pos_c + c * 100) + 40, (pos_l) + 40, 20, 20, verdadeiro)
					g.desenhar_elipse((pos_c + c * -100) + 40, (pos_l) + 40, 20, 20, verdadeiro)
				}
			pare
			caso 4:
				para(inteiro c = 1; c < 8; c++){
					g.desenhar_elipse(pos_c + 40, (pos_l + c * 100) + 40, 20, 20, verdadeiro)
					g.desenhar_elipse(pos_c + 40, (pos_l + c * -100) + 40, 20, 20, verdadeiro)

					g.desenhar_elipse((pos_c + c * 100) + 40, (pos_l) + 40, 20, 20, verdadeiro)
					g.desenhar_elipse((pos_c + c * -100) + 40, (pos_l) + 40, 20, 20, verdadeiro)

					g.desenhar_elipse((c*-100 + pos_c) + 40, (c*-100 + pos_l) + 40, 20, 20, verdadeiro)
					g.desenhar_elipse((c*100 + pos_c) + 40, (c*-100 + pos_l) + 40, 20, 20, verdadeiro)
					
					g.desenhar_elipse((c*-100 + pos_c) + 40, (c*100 + pos_l) + 40, 20, 20, verdadeiro)
					g.desenhar_elipse((c*100 + pos_c) + 40, (c*100 + pos_l) + 40, 20, 20, verdadeiro)
				}
			pare
			caso 1:
				g.desenhar_elipse((pos_c + 100) + 40, (pos_l + 100) + 40, 20, 20, verdadeiro)
				g.desenhar_elipse((pos_c - 100) + 40, (pos_l + 100) + 40, 20, 20, verdadeiro)

				g.desenhar_elipse((pos_c + 100) + 40, (pos_l - 100) + 40, 20, 20, verdadeiro)
				g.desenhar_elipse((pos_c - 100) + 40, (pos_l - 100) + 40, 20, 20, verdadeiro)

				g.desenhar_elipse((pos_c) + 40, (pos_l - 100) + 40, 20, 20, verdadeiro)
				g.desenhar_elipse((pos_c) + 40, (pos_l + 100) + 40, 20, 20, verdadeiro)

				g.desenhar_elipse((pos_c + 100) + 40, (pos_l) + 40, 20, 20, verdadeiro)
				g.desenhar_elipse((pos_c - 100) + 40, (pos_l) + 40, 20, 20, verdadeiro)
			pare
		}
	}

	funcao inteiro cor_peca(inteiro linha, inteiro coluna){
		retorne pos_pecas[linha][coluna] - pos_pecas[linha][coluna] % 10
	}

	funcao inteiro tipo_peca(inteiro linha, inteiro coluna){
		retorne pos_pecas[linha][coluna] % 10
	}

	funcao possibilidades(inteiro pos_c, inteiro pos_l){
		inteiro index_c = pos_c / 100
		inteiro index_l = pos_l / 100
		para(inteiro c = 0; c < 8; c++){
			se(tipo_peca(index_l, index_c) == c){
				cor_move = cor_peca(index_l, index_c)
				desenhar_movimento(c, pos_l, pos_c)
			}
		}
	}

	funcao mover_peca(){
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 974; 
 * @DOBRAMENTO-CODIGO = [39, 48, 57, 71, 198, 202, 206];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */