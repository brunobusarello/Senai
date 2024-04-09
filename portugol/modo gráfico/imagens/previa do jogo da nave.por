programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Teclado --> t
	inclua biblioteca Graficos --> g

	inteiro x_img = 50
	inteiro y_img = 300	
	inteiro x_tiro = 0
	inteiro y_tiro = 0
	
	inteiro fundo = g.carregar_imagem("/src/fundo.png")
	inteiro nave = g.carregar_imagem("/src/nave.png")
	inteiro tiro = g.carregar_imagem("/src/tiro.png")
	
	funcao desenhar(){
		g.desenhar_imagem(0, 0, fundo)
		g.desenhar_imagem(x_img, y_img, nave)
		

		g.definir_cor(g.COR_BRANCO)
		g.definir_tamanho_texto(20.0)
		g.desenhar_texto(750, 15, x_img+"")
		g.desenhar_texto(750, 35, y_img+"")
	}

	funcao movimento(){
		se(t.tecla_pressionada(t.TECLA_SETA_ACIMA) ou t.tecla_pressionada(t.TECLA_W)){
			y_img--
		}
		se(t.tecla_pressionada(t.TECLA_SETA_ABAIXO) ou t.tecla_pressionada(t.TECLA_S)){
			y_img++
		}
		se(t.tecla_pressionada(t.TECLA_SETA_DIREITA) ou t.tecla_pressionada(t.TECLA_D)){
			x_img++
		}
		se(t.tecla_pressionada(t.TECLA_SETA_ESQUERDA) ou t.tecla_pressionada(t.TECLA_A)){
			x_img--
		}
	}

	funcao atirar(){
		se(t.tecla_pressionada(t.TECLA_ESPACO)){
			x_tiro = x_img + 80
			y_tiro = y_img + 18
			enquanto(x_tiro < 810){
				x_tiro++
				desenhar()
				movimento()
				g.desenhar_imagem(x_tiro, y_tiro, tiro)
				g.renderizar()
			}
			
		}
	}

	
	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(800, 600)
		enquanto(verdadeiro){
			desenhar()
			movimento()
			atirar()
			g.renderizar()
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 586; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */