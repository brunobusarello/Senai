programa
{
	inclua biblioteca Calendario
	inclua biblioteca Util --> u
	inclua biblioteca Teclado --> t
	// incluir biblioteca gráfica
	inclua biblioteca Graficos --> g

	inteiro bola_x = 385
	inteiro bola_y = 285
	inteiro aguardar = 5
	inteiro velocidade = 6
	inteiro cor = g.criar_cor(128, 128, 128)
	inteiro auxiliar = 0

	// movimento da figura
	funcao mover(){
		se(t.tecla_pressionada(t.TECLA_SETA_ACIMA) ou t.tecla_pressionada(t.TECLA_W)){
			bola_y--
			u.aguarde(aguardar)
		}
		se(t.tecla_pressionada(t.TECLA_SETA_ABAIXO) ou t.tecla_pressionada(t.TECLA_S)){
			bola_y++
			u.aguarde(aguardar)
		}
		se(t.tecla_pressionada(t.TECLA_SETA_DIREITA) ou t.tecla_pressionada(t.TECLA_D)){
			bola_x++
			u.aguarde(aguardar)
		}
		se(t.tecla_pressionada(t.TECLA_SETA_ESQUERDA) ou t.tecla_pressionada(t.TECLA_A)){
			bola_x--
			u.aguarde(aguardar)
		}
	}

	funcao desenhar(){
		
		g.definir_cor(cor)
		g.limpar()
		g.definir_cor(g.COR_BRANCO)
		g.desenhar_elipse(bola_x, bola_y, 30, 30, falso)
		g.definir_cor(g.COR_VERDE)
		g.desenhar_texto(10, 10, "Velociddade: " + (velocidade)+"")
		g.renderizar()
	}

	funcao velocidade_bolinha(){
		se(t.tecla_pressionada(t.TECLA_SUBTRACAO) e aguardar < 10){
			aguardar++
			velocidade--
			u.aguarde(100)
		}
		se(t.tecla_pressionada(t.TECLA_ADICAO) e aguardar > 1){
			aguardar--
			velocidade++
			u.aguarde(100)
		}
	}

	funcao tocando_borda(){
		se(bola_x < 15){
			bola_x = 785
		}
		se(bola_x > 785){
			bola_x = 15
		}
		se(bola_y < 15){
			bola_y = 585
		}
		se(bola_y > 585){
			bola_y = 15
		}
	}

	funcao tiro(){
		se(t.tecla_pressionada(t.TECLA_ESPACO)){
			inteiro aux = bola_x
			enquanto(bola_x < 900){
				bola_x += 10
				u.aguarde(5)
				desenhar()
			}
			u.aguarde(20)
			bola_x = aux
		}
	}

	
	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(800, 600)
		g.definir_titulo_janela("index.html")
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){ 
			desenhar()
			mover()
			velocidade_bolinha()
			tocando_borda()
			tiro()
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1753; 
 * @DOBRAMENTO-CODIGO = [35, 46, 59, 74];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {bola_x, 9, 9, 6}-{bola_y, 10, 9, 6}-{aguardar, 11, 9, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */