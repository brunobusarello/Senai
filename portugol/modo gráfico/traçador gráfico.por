programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Mouse --> mo
	inclua biblioteca Teclado --> t
	inclua biblioteca Matematica --> m
	inclua biblioteca Graficos --> g

	inteiro cor_quadrado = g.COR_PRETO
	inteiro cor_traco = g.criar_cor(212, 212, 212)
	inteiro cor_traco_f = g.criar_cor(140, 140, 140)

	inteiro casas[3]
	caracter operador
	inteiro trava = -1
	
	funcao eixo(){
		// desenho linhas de grade
		para(inteiro c = 1; c < 20; c++){
			se(c % 2 == 0) g.definir_cor(cor_traco_f)
			senao g.definir_cor(cor_traco)
			g.desenhar_linha(500, 100 + 25 * c, 1000, 100 + 25 * c)
			g.desenhar_linha(500 + 25 * c, 100, 500 + 25 * c, 600)
		}

		// definindo o eixo X
		g.definir_cor(g.COR_VERMELHO)

		g.desenhar_linha(500, 350, 1000, 350)

		// definindo o eixo Y
		g.desenhar_linha(750, 100, 750, 600)

		inteiro espacamentos[2] = {-5, 5}
		para(inteiro i = 0; i < 2; i++){
			para(inteiro c = 1; c <= 50; c++){
				// desehna as linhas de marcação
				se(c % 10 == 0){
					 g.desenhar_linha(750 + espacamentos[i] * c, 342, 750 + espacamentos[i] * c, 358)
				}
				senao{
					g.desenhar_linha(750 + espacamentos[i] * c, 347, 750 + espacamentos[i] * c, 353)
				}

				se(c % 10 == 0){
					 g.desenhar_linha(742, 350 + espacamentos[i] * c, 758, 350 + espacamentos[i] * c)
				}
				senao{
					g.desenhar_linha(747, 350 + espacamentos[i] * c, 753, 350 + espacamentos[i] * c)
				}
			}
		}
	}

	funcao texto(){
		
	}

	funcao parabola(){
		
	}

	funcao coeficientes(){
		cadeia formula[3] = {"x²", "x ", "= 0"}
		inteiro cores[3] = {g.COR_PRETO, g.COR_PRETO, g.COR_PRETO}
		cadeia operadores[3] = {" ", "+", "+"}
		para(inteiro c = 0; c < 3; c++){
			// verifica se o ponteiro do mouse clicou em alguma das caixas
			se(mo.botao_pressionado(0)){
				se(mo.posicao_y() >= 120 e mo.posicao_y() <= 120 + 30){
					se(mo.posicao_x() >= 45 + c * 95 e mo.posicao_x() <= 45 + c * 95 + 45){
						trava = c
					}
				}
				senao{
					cores[0] = g.COR_PRETO
					cores[1] = g.COR_PRETO
					cores[2] = g.COR_PRETO
					trava = -1
				}
			}
			se(trava == c){
				cores[c] = g.COR_VERMELHO
			}
			
			// desenha os quadrados
			g.definir_cor(cores[c])
			g.desenhar_retangulo(45 + c * 92, 120, 30, 30, falso, falso)
			
			// desenha a fórmula
			g.definir_cor(g.COR_AZUL)
			g.definir_tamanho_texto(30.0)
			g.desenhar_texto(78 + c * 92, 120, formula[c])
			
			//desenha o operador
			se(casas[c] >= 0){
				se(c != 0){
					operadores[c] = "+"
				}
				g.definir_tamanho_texto(20.0)
				g.desenhar_texto(46 + c * 92, 126, casas[c]+"")
			}
			se(casas[c] < 0){
				operadores[c] = "-"
				g.definir_tamanho_texto(20.0)
				g.desenhar_texto(46 + c * 92, 126, (casas[c] * -1)+"")
			}
			
			g.definir_tamanho_texto(30.0)
			g.desenhar_texto(20 + c * 92, 120, operadores[c])
			
			// desenha o valor desejado dentro do quadrado
			
		}

		// verifica o operador pressionado e retorna na casa selecionada
		se(trava >= 0){
			se(t.tecla_pressionada(t.TECLA_ADICAO) e casas[trava] < 99){
				operador = '+'
				casas[trava]++
				u.aguarde(100)
				
			}
			se(t.tecla_pressionada(t.TECLA_SUBTRACAO) e casas[trava] > -99){
				operador = '-'
				casas[trava]--
				u.aguarde(100)
			}
		}
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

		eixo()
		coeficientes()
		
		g.renderizar()
	}
	
	funcao inicio()
	{
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(1024, 630)
		g.definir_titulo_janela("Traçador Gráfico de Funções")
	
		enquanto(verdadeiro){
			paint()
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1483; 
 * @DOBRAMENTO-CODIGO = [16, 54, 58, 62, 131, 152];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */