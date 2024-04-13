programa
{
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g

	inteiro cor_verde = g.criar_cor(119, 149, 86)
	inteiro cor_branco = g.criar_cor(235, 236, 208)
	
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
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(800, 800)
		g.definir_titulo_janela("Xadrez")
		enquanto(verdadeiro){
			desenhar()
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
				se(c % 2 == comeco){
					cor = cor_verde
				}
				senao{
					cor = cor_branco
				}
				g.definir_cor(cor)
				g.desenhar_retangulo(c*100, l*100, 100, 100, falso, verdadeiro)
				se(pos_pecas[l][c] - pos_pecas[l][c] % 10 == 10){
					g.desenhar_imagem(20 + c * 100, 20 + l * 100, pretas[pos_pecas[l][c] % 10])
				}
				senao se(pos_pecas[l][c] - pos_pecas[l][c] % 10 == 20){
					g.desenhar_imagem(20 + c * 100, 20 + l * 100, brancas[pos_pecas[l][c] % 20])
				}
				
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1305; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */