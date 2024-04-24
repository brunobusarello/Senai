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
	real x1, x2
	real delta

	inteiro casas[3]
	caracter operador
	inteiro trava = -1
	
	funcao eixo(){
		// desenho linhas de grade
		para(inteiro i = 1; i < 20; i++){
			se(i % 2 == 0) g.definir_cor(cor_traco_f)
			senao g.definir_cor(cor_traco)
			g.desenhar_linha(500, 100 + 25 * i, 1000, 100 + 25 * i)
			g.desenhar_linha(500 + 25 * i, 100, 500 + 25 * i, 600)
		}

		// definindo o eixo X
		g.definir_cor(g.COR_VERMELHO)

		g.desenhar_linha(500, 350, 1000, 350)

		// definindo o eixo Y
		g.desenhar_linha(750, 100, 750, 600)

		inteiro espacamentos[2] = {-5, 5}
		para(inteiro i = 0; i < 2; i++){
			para(inteiro j = 1; j <= 50; j++){
				// desehna as linhas de marcação
				se(j % 10 == 0){
					 g.desenhar_linha(750 + espacamentos[i] * j, 342, 750 + espacamentos[i] * j, 358)
				}
				senao{
					g.desenhar_linha(750 + espacamentos[i] * j, 347, 750 + espacamentos[i] * j, 353)
				}

				se(j % 10 == 0){
					 g.desenhar_linha(742, 350 + espacamentos[i] * j, 758, 350 + espacamentos[i] * j)
				}
				senao{
					g.desenhar_linha(747, 350 + espacamentos[i] * j, 753, 350 + espacamentos[i] * j)
				}
			}
		}
	}

	funcao equacao(){
		inteiro a = casas[0], b = casas[1], c = casas[2]
		
		delta = m.potencia(b, 2.0) - 4 * a * c
		escreva(delta)

		se(delta >= 0){
			x1 = (-b + m.raiz(delta, 2))/2*a
			x2 = (-b - m.raiz(delta, 2))/2*a
		}

		escreva(x1)
		escreva(x2)
	}

	funcao texto(){
		
	}

	funcao parabola(){
		
	}

	funcao coeficientes(){
		cadeia formula[3] = {"x²", "x ", "= 0"}
		inteiro cores[3] = {g.COR_PRETO, g.COR_PRETO, g.COR_PRETO}
		cadeia operadores[3] = {" ", "+", "+"}
		para(inteiro i = 0; i < 3; i++){
			// verifica se o ponteiro do mouse clicou em alguma das caixas
			se(mo.botao_pressionado(0)){
				se(mo.posicao_y() >= 120 e mo.posicao_y() <= 120 + 30){
					se(mo.posicao_x() >= 45 + i * 95 e mo.posicao_x() <= 45 + i * 95 + 45){
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
			
			// desenha os quadrados
			g.definir_cor(cores[i])
			g.desenhar_retangulo(45 + i * 92, 120, 30, 30, falso, falso)
			
			// desenha a fórmula
			g.definir_cor(g.COR_AZUL)
			g.definir_tamanho_texto(30.0)
			g.desenhar_texto(78 + i * 92, 120, formula[i])
			
			//desenha o operador
			se(casas[i] >= 0){
				se(i != 0){
					operadores[i] = "+"
				}
				g.definir_tamanho_texto(20.0)
				g.desenhar_texto(46 + i * 92, 126, casas[i]+"")
			}
			se(casas[i] < 0){
				operadores[i] = "-"
				g.definir_tamanho_texto(20.0)
				g.desenhar_texto(46 + i * 92, 126, (casas[i] * -1)+"")
			}
			
			g.definir_tamanho_texto(30.0)
			g.desenhar_texto(20 + i * 92, 120, operadores[i])
			
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
		
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
			paint()
		}
		equacao()
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1688; 
 * @DOBRAMENTO-CODIGO = [71, 75];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */