programa
{
	inclua biblioteca Teclado --> t
	inclua biblioteca Matematica --> m
	inclua biblioteca Graficos --> g

	inteiro cor_traco = g.criar_cor(212, 212, 212)	
	
	funcao eixo(){
		g.definir_cor(g.COR_VERMELHO)

		// definindo o eixo X
		g.desenhar_linha(500, 350, 1000, 350)

		// definindo o eixo Y
		g.desenhar_linha(750, 100, 750, 600)

		inteiro espacamentos[2] = {-5, 5}
		para(inteiro i = 0; i < 2; i++){
			para(inteiro c = 1; c <= 50; c++){
				se(c % 10 == 0){
					 g.desenhar_linha(750 + espacamentos[i] * c, 342, 750 + espacamentos[i] * c, 358)
				}
				senao{
					g.desenhar_linha(750 + espacamentos[i] * c, 347, 750 + espacamentos[i] * c, 353)
				}
			}
			para(inteiro c = 1; c <= 50; c++){
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
 * @POSICAO-CURSOR = 1306; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */