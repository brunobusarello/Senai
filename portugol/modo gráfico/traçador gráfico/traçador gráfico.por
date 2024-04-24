programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Mouse --> mo
	inclua biblioteca Teclado --> t
	inclua biblioteca Matematica --> m
	inclua biblioteca Graficos --> g

	// variáveis para carregar as imagens das fórmulas
	inteiro x_vertice = g.carregar_imagem("/src/x_vertice.png")
	inteiro y_vertice = g.carregar_imagem("/src/y_vertice.png")
	inteiro img_delta = g.carregar_imagem("/src/delta.png")

	inteiro zoom = 50

	// constantes que indicam as posições iniciais, finais e do meio do quadrado
	const inteiro INICIO_X = 500
	const inteiro FINAL_X = 1000
	const inteiro MEIO_X = 750
	const inteiro INICIO_Y = 100
	const inteiro FINAL_Y = 600
	const inteiro MEIO_Y = 350

	// inicialização de cores
	inteiro cor_traco = g.criar_cor(212, 212, 212)
	inteiro cor_traco_f = g.criar_cor(140, 140, 140)

	
	real x1, x2
	real delta
	real xV, yV
	
	real xt[2000]
	real fx[2000]

	real a = 0.0, b = 0.0, c = 0.0


	inteiro casas[3] = {1, 6, 5}
	caracter operador
	inteiro trava = -1
	
	funcao eixo(){
		// desenho linhas de grade
		para(inteiro i = 1; i < 20; i++){
			se(i % 2 == 0) g.definir_cor(cor_traco_f)
			senao g.definir_cor(cor_traco)
			g.desenhar_linha(INICIO_X, 100 + 25 * i, FINAL_X, 100 + 25 * i)
			g.desenhar_linha(500 + 25 * i, 100, 500 + 25 * i, 600)
		}

		// definindo o eixo X
		g.definir_cor(g.COR_VERMELHO)

		g.desenhar_linha(INICIO_X, MEIO_Y, FINAL_X, MEIO_Y)

		// definindo o eixo Y
		g.desenhar_linha(MEIO_X, INICIO_Y, MEIO_X, FINAL_Y)

		inteiro limite = 50
		
		para(inteiro j = 1; j <= limite; j++){
			// desehna as linhas de marcação
			se(j % 10 == 0){
				 g.desenhar_linha(MEIO_X + 5 * j, 342, MEIO_X + 5 * j, 358)
				 g.desenhar_linha(MEIO_X - 5 * j, 342, MEIO_X - 5 * j, 358)
			}
			senao{
				g.desenhar_linha(MEIO_X + 5 * j, 347, MEIO_X + 5 * j, 353)
				g.desenhar_linha(MEIO_X - 5 * j, 347, MEIO_X - 5 * j, 353)
			}

			se(j % 10 == 0){
				 g.desenhar_linha(742, MEIO_Y + 5 * j, 758, MEIO_Y + 5 * j)
				 g.desenhar_linha(742, MEIO_Y - 5 * j, 758, MEIO_Y - 5 * j)
			}
			senao{
				g.desenhar_linha(747, MEIO_Y + 5 * j, 753, MEIO_Y + 5 * j)
				g.desenhar_linha(747, MEIO_Y - 5 * j, 753, MEIO_Y - 5 * j)
			}
		}
	}

	funcao parabola(){
		inteiro cor_p1 = g.criar_cor(0, 0, 128)

		a = casas[0]
		b = casas[1]
		c = casas[2]
		
		delta = m.potencia(b, 2.0) - 4 * a * c

		yV = -delta / 4 * a
		xV = -b / 2 * a

		se(delta >= 0){
			x1 = (-b + m.raiz(delta, 2)) / 2 * a 
			x2 = (-b - m.raiz(delta, 2)) / 2 * a 
		}
		senao{
			escreva("A equação não possui raízes reais\n")
			limpa()
			x1 = 0.0
			x2 = 0.0
		}

		real valorX = -5.0
		para(inteiro x = 0; x < 2000; x++){
			valorX += 0.02
			xt[x] = valorX
			fx[x] = (a*m.potencia(xt[x], 2.0) + b*xt[x] + c) * -zoom

			se(xt[x] + MEIO_X > 500 e xt[x] + MEIO_X < 755 e fx[x] + MEIO_Y > 100 e fx[x] + MEIO_Y < 600){
				g.definir_cor(cor_p1)
				g.desenhar_elipse(xt[x] * zoom + MEIO_X, fx[x] + MEIO_Y, 2, 2, verdadeiro)
			}
		}
	}

	funcao coeficientes(){
		inteiro pos_quadrados[3] = {45, 135, 215}
		cadeia formula[3] = {"x²", "x ", "= 0"}
		inteiro cores[3] = {g.COR_PRETO, g.COR_PRETO, g.COR_PRETO}
		cadeia operadores[3] = {" ", "+", "+"}
		para(inteiro i = 0; i < 3; i++){
			// verifica se o ponteiro do mouse clicou em alguma das caixas
			se(mo.botao_pressionado(0)){
				se(mo.posicao_y() >= 120 e mo.posicao_y() <= 120 + 30){
					se(mo.posicao_x() >= pos_quadrados[i] e mo.posicao_x() <= pos_quadrados[i] + 30){
						trava = i
					}
				}
				senao{
					cores[0] = g.COR_PRETO
					cores[1] = g.COR_PRETO
					cores[2] = g.COR_PRETO
					trava = -1
				}
			}
			se(trava == i){
				cores[i] = g.COR_VERMELHO
			}
			
			// desenho dos quadrados
			g.definir_cor(cores[i])
			g.desenhar_retangulo(pos_quadrados[i], 120, 30, 30, falso, falso)

			//desenha os valores em cada quadrado
			g.definir_cor(g.COR_PRETO)
			se(casas[i] >= 0){
				se(i != 0){
					operadores[i] = "+"
				}
				g.definir_tamanho_texto(20.0)
				g.desenhar_texto(pos_quadrados[i] + 4, 126, casas[i]+"")
			}
			se(casas[i] < 0){
				operadores[i] = "-"
				g.definir_tamanho_texto(20.0)
				g.desenhar_texto(pos_quadrados[i] + 4, 126, (casas[i] * -1)+"")
			}
		}

		// verifica o operador pressionado e retorna na casa selecionada
		se(trava >= 0){
			se(t.tecla_pressionada(t.TECLA_ADICAO) e casas[trava] < 99){
				casas[trava]++
				u.aguarde(100)
				
			}
			se(t.tecla_pressionada(t.TECLA_SUBTRACAO) e casas[trava] > -99){
				casas[trava]--
				u.aguarde(100)
			}
		}

		// desenho dos operadores de cada parte
		g.definir_cor(g.COR_PRETO)
		g.definir_tamanho_texto(30.0)
		g.desenhar_texto(30, 120, operadores[0])

		g.definir_tamanho_texto(30.0)
		g.desenhar_texto(110, 120, operadores[1])

		g.definir_tamanho_texto(30.0)
		g.desenhar_texto(190, 120, operadores[2])

		// desenho da base da fórmula
		g.definir_tamanho_texto(30.0)
		g.desenhar_texto(78, 120, formula[0])
		
		g.definir_tamanho_texto(30.0)
		g.desenhar_texto(170, 120, formula[1])
		
		g.definir_tamanho_texto(30.0)
		g.desenhar_texto(250, 120, formula[2])	
	}

	funcao paint(){
		//definir cor de fundo
		g.definir_cor(g.COR_BRANCO)
		g.limpar()

		// definir retângulo de eixo
		g.definir_cor(g.COR_PRETO)
		
		// definir retângulo do título
		g.desenhar_retangulo(20, 10, 980, 80, falso, falso)
		// definir retângulo da equação
		g.desenhar_retangulo(20, 100, 450, 500, falso, falso)
		// definir retângulo do eixo
		g.desenhar_retangulo(500, 100, 500, 500, falso, falso)

		// desenho da fórmula do delta
		g.desenhar_imagem(40, 170, img_delta)
		g.definir_cor(g.COR_AZUL)
		g.desenhar_retangulo(200, 175, 70, 30, falso, falso)
		g.definir_tamanho_texto(25.0)
		g.desenhar_texto(202, 178, delta+"")

		// desenho da fórmula do x do vértice
		g.desenhar_imagem(40, 220, x_vertice)
		g.definir_cor(g.COR_AZUL)
		g.desenhar_retangulo(200, 235, 70, 30, falso, falso)
		g.definir_tamanho_texto(25.0)
		g.desenhar_texto(202, 238, xV+"")

		// desenho da fórmula do y do vértice
		g.desenhar_imagem(45, 300, y_vertice)
		g.definir_cor(g.COR_AZUL)
		g.desenhar_retangulo(200, 310, 70, 30, falso, falso)
		g.definir_tamanho_texto(25.0)
		g.desenhar_texto(202, 313, yV+"")

		// desenho do valor de x1
		g.desenhar_texto(40, 400, "x1 = " + m.arredondar(x1, 2)+"")
		g.desenhar_texto(40, 450, "x2 = " + m.arredondar(x2, 2)+"")

		eixo()
		coeficientes()
		parabola()
		
		g.renderizar()
	}
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(1024, 630)
		g.definir_titulo_janela("Traçador Gráfico de Funções")
		
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
			paint()
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2534; 
 * @DOBRAMENTO-CODIGO = [42, 119, 198, 245];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */