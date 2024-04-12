programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Teclado --> t
	inclua biblioteca Graficos --> g

	inteiro x_img = 50
	inteiro y_img = 300	
	inteiro x_tiro = 0
	inteiro y_tiro = 0
	inteiro x_meteoro = 750
	inteiro y_meteoro = 300
	
	inteiro fundo = g.carregar_imagem("/src/fundo.png")
	inteiro nave = g.carregar_imagem("/src/nave.png")
	inteiro tiro = g.carregar_imagem("/src/tiro.png")
	inteiro meteoro = g.carregar_imagem("/src/meteoro.png")
	inteiro explosao_meteoro = g.carregar_imagem("/src/estilhaço de meteoro")

	inteiro c_espaco = 0
	inteiro vidas = 5
	logico meteoro_vivo = verdadeiro

	funcao desenhar_meteoro(){
		g.desenhar_imagem(x_meteoro, y_meteoro, meteoro)
		x_meteoro--
		se(x_meteoro < 0){
			x_meteoro = 750
			y_meteoro = u.sorteia(20, 580)
		}
	}

	funcao tiro_meteoro(){
		se(x_tiro +5 >= x_meteoro e x_tiro -5 <= x_meteoro){
			se(y_tiro > y_meteoro e y_tiro < y_meteoro + 56){
				x_meteoro = 750
				y_meteoro = u.sorteia(20, 580)
				x_tiro = 811
				y_tiro = -10
			}
		}
	}

	funcao meteoro_nave(){
		se(x_img +5 >= x_meteoro e x_img -5 <= x_meteoro){
			se(y_img > y_meteoro - 56 e y_img < y_meteoro + 56){
				vidas--
				x_meteoro = 750
				y_meteoro = u.sorteia(20, 580)
			}
		}
	}
	
	funcao desenhar(){
		g.desenhar_imagem(0, 0, fundo)
		g.desenhar_imagem(x_img, y_img, nave)
		

		g.definir_cor(g.COR_BRANCO)
		g.definir_tamanho_texto(20.0)
		g.desenhar_texto(750, 15, x_img+"")
		g.desenhar_texto(750, 35, y_img+"")
		g.desenhar_texto(30, 15, vidas+"")

		desenhar_meteoro()
		atirar()
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
		u.aguarde(2)
	}

	funcao atirar(){
		se(t.tecla_pressionada(t.TECLA_ESPACO) e c_espaco != 1){
			c_espaco = 1
			x_tiro = x_img + 80
			y_tiro = y_img + 18
		}
		senao se(c_espaco == 1){
			g.desenhar_imagem(x_tiro, y_tiro, tiro)
			x_tiro += 2
			se(x_tiro > 810){
				c_espaco = 0
			}
		}
	}

	funcao tocando_borda(){
		se(x_img > 720){
			x_img = 720
		}
		se(x_img < 0){
			x_img = 0
		}
		se(y_img < 0){
			y_img = 0
		}
		se(y_img > 554){
			y_img = 554
		}
	}
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(800, 600)
		enquanto(vidas > 0){
			desenhar()
			movimento()
			tocando_borda()
			tiro_meteoro()
			meteoro_nave()
			g.renderizar()
		}
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
			g.definir_cor(g.COR_PRETO)
			g.limpar()
			g.renderizar()
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 605; 
 * @DOBRAMENTO-CODIGO = [32, 43, 53, 68, 84, 99, 114];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */