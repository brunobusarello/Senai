programa
{
	inclua biblioteca Sons --> s
	inclua biblioteca Calendario --> c
	inclua biblioteca Util --> u
	inclua biblioteca Mouse --> m
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t

	const inteiro intervalo = 80
	const real gravidade = 0.25

	// imagens
	inteiro fundo = g.carregar_imagem("/src/images/background.png")
	inteiro piso = g.carregar_imagem("/src/images/floor.png")
	inteiro tela_inicial = g.carregar_imagem("/src/images/message.png")
	inteiro cano = g.carregar_imagem("/src/images/pipe-green.png")
	inteiro bird[3] = {g.carregar_imagem("/src/images/f_low.png"), g.carregar_imagem("/src/images/f_mid.png"), g.carregar_imagem("/src/images/f_high.png")}
	inteiro n_contador[10] = {g.carregar_imagem("/src/images/0.png"), g.carregar_imagem("/src/images/1.png"), g.carregar_imagem("/src/images/2.png"), g.carregar_imagem("/src/images/3.png"), 
						g.carregar_imagem("/src/images/4.png"), g.carregar_imagem("/src/images/5.png"), g.carregar_imagem("/src/images/6.png"), 
						g.carregar_imagem("/src/images/7.png"), g.carregar_imagem("/src/images/8.png"), g.carregar_imagem("/src/images/9.png")}
	inteiro end = g.carregar_imagem("/src/images/gameover.png")

	// audios
	inteiro tap = s.carregar_som("src/audios/wing.wav")
	inteiro passagem = s.carregar_som("src/audios/point.wav")
	inteiro hit = s.carregar_som("/src/audios/hit.wav")
	
	inteiro index = 0

	inteiro trava_end = 0

	inteiro contador = 0
	inteiro w_cont = g.largura_imagem(n_contador[0])
	
	inteiro i_cano = -1
	inteiro trava_cont = 0

	inteiro h_cano = g.altura_imagem(cano)
	inteiro w_cano = g.largura_imagem(cano)

	inteiro h_end = g.altura_imagem(end)
	inteiro w_end = g.largura_imagem(end)
	
	inteiro h_fundo = g.altura_imagem(fundo)
	inteiro w_fundo = g.largura_imagem(fundo)

	inteiro h_bird = g.altura_imagem(bird[0])
	inteiro w_bird = g.largura_imagem(bird[0])
 
	inteiro mov_piso = 0

	inteiro trava_inicio = 0
	inteiro trava_bird = 0
	real altura = 2.5

	inteiro segundos = 0
	inteiro segundo_base = c.segundo_atual()

	inteiro canos_x[2] = {-w_cano, -500}
	inteiro canos_y[2]

	inteiro y = h_bird
	inteiro x = w_bird / 2
	
	
	funcao desenhar_tela_inicial(){
		se(trava_inicio == 0 ou colisao()){
			g.desenhar_imagem(0, 0, fundo)
		}
		senao{
			g.desenhar_imagem(0 - mov_piso, 0, fundo)
			g.desenhar_imagem(w_fundo - mov_piso, 0, fundo)
		}

		mov_piso++
		se(mov_piso == w_fundo) mov_piso = 0

		// desenho da tela inicial
		se((nao t.tecla_pressionada(t.TECLA_ESPACO) e nao m.botao_pressionado(0)) e trava_inicio == 0){
			g.desenhar_imagem(w_fundo / 2 - 184 / 2, h_fundo / 2 - 267 / 2, tela_inicial)
			
		}
		senao{
			trava_inicio = 1
			desenhar_jogo()
		}

		se(trava_inicio == 0 ou colisao()){
			g.desenhar_imagem(0, h_fundo-112, piso)
		}
		senao{
			g.desenhar_imagem(0 - mov_piso, h_fundo-112, piso)
			g.desenhar_imagem(w_fundo - mov_piso, h_fundo-112, piso)
		}
		
	}

	funcao desenhar_jogo(){
		se(x < 50){
			x += 2
			y += 2
		}
		para(inteiro i = 0; i < 2; i++){
			se(canos_x[i] == -w_cano){
				canos_x[i] = w_fundo
				canos_y[i] = u.sorteia(50, 250)
			}
			se(canos_x[i] == w_fundo/2 - w_cano/2){
				se(i == 1) canos_x[0] = -w_cano 
				senao canos_x[1] = -w_cano
			}
			g.definir_rotacao(180)
			g.desenhar_imagem(canos_x[i], canos_y[i] - h_cano, cano)
			g.definir_rotacao(0)
			g.desenhar_imagem(canos_x[i], canos_y[i] + intervalo, cano)
			se(nao colisao()) canos_x[i]--
		}
		passaro()
		se(contador % 10 < 10){
			g.desenhar_imagem(w_fundo / 2, 20, n_contador[contador % 10])
		}
		se(contador / 10 < 10 e contador / 10 > 0){
			g.desenhar_imagem(w_fundo / 2 - w_cont / 2, 20, n_contador[contador / 10])
		}
	}
	
	funcao passaro(){
		se(nao colisao()){
			se(trava_bird == 1){
				altura -= gravidade
				y -= altura
			}
			se(t.tecla_pressionada(t.TECLA_ESPACO) ou m.botao_pressionado(0)){
				s.definir_posicao_atual_musica(tap, 0)
				altura = 2.5
				trava_bird = 1
				s.reproduzir_som(tap, falso)
			}
		}
		g.desenhar_imagem(x, y, bird[index])
		se(nao colisao()){
			se(index < 1) index++
			senao index = 0
		}
	}

	funcao logico colisao(){
		para(inteiro i = 0; i < 2; i++){
			se(x + w_bird > canos_x[i] e x < canos_x[i] + w_cano){
				se(y < canos_y[i]) retorne verdadeiro
				se(y + h_bird > canos_y[i] + intervalo) retorne verdadeiro
				trava_cont = 0
			}
			se(y + h_bird > h_fundo - 112 ou y <= 0) retorne verdadeiro
			
			se(x > w_cano + canos_x[i] e x + w_bird < canos_x[i] + 100 e trava_cont == 0){
				s.reproduzir_som(passagem, falso)
				contador++
				trava_cont = 1
			}
			
			
		}
		retorne falso
	}

	funcao game_over(){
		se(colisao()){
			s.interromper_som(passagem)
			s.interromper_som(tap)
			s.definir_posicao_atual_musica(hit, 0)
			s.reproduzir_som(hit, falso)
			g.desenhar_imagem(w_fundo / 2 - w_end / 2, h_fundo / 2 - h_end / 2, end)
			se(t.tecla_pressionada(t.TECLA_ESPACO) ou m.botao_pressionado(0) e trava_end == 1){
				u.aguarde(1000)
				trava_inicio = 0
				trava_end = 0
				contador = 0
				canos_x[0] = -w_cano
				canos_x[1] = -500
				y = h_bird
				x = w_bird / 2
				desenhar_jogo()
			}
			trava_end = 1
			
		}
	}
	
	funcao inicio(){
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(w_fundo, h_fundo)
		g.definir_titulo_janela("Flappy Bird")
		enquanto(verdadeiro){
			desenhar_tela_inicial()
			game_over()
			g.renderizar()
			u.aguarde(10)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3876; 
 * @DOBRAMENTO-CODIGO = [66];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */