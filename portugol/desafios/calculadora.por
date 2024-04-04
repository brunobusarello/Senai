programa
{
	inclua biblioteca Util --> u
	inclua biblioteca Mouse --> m
	inclua biblioteca Teclado --> t
	inclua biblioteca Graficos -->g

	inteiro pos_quadrados[2][4] = {{11, 111, 211, 313},{204, 300, 396, 492}}
	inteiro pos_numeros[2][4] = {{37, 135, 237, 339},{216, 312, 408, 504}} 
	cadeia numeros_calc[4][4] = {
		{"7", "8", "9", "+"},
		{"4", "5", "6", "-"},
		{"1", "2", "3", "*"},
		{".", "0", "=", "/"}
	}
	cadeia resposta = ""

	funcao desenhar(){
		g.definir_cor(g.COR_PRETO)
		g.limpar()

		g.definir_cor(g.COR_BRANCO)
		g.desenhar_retangulo(20, 40, 360, 100, verdadeiro, verdadeiro)

		para(inteiro c = 0; c < 4; c++){
			para(inteiro v = 0; v < 4; v++){
				se(v == 3){
					g.definir_cor(g.COR_AZUL)
				}
				senao{
					g.definir_cor(g.COR_BRANCO)
				}
				g.desenhar_retangulo(pos_quadrados[0][v], pos_quadrados[1][c], 75, 75, verdadeiro, verdadeiro)
				g.definir_cor(g.COR_PRETO)
				g.definir_fonte_texto("Arial")
				g.definir_tamanho_texto(50.0)
				g.desenhar_texto(pos_numeros[0][v], pos_numeros[1][c], numeros_calc[c][v])
			}
		}

		g.definir_cor(g.COR_VERDE)
		g.definir_fonte_texto("Arial")
		g.definir_tamanho_texto(50.0)
		g.desenhar_texto(37, 60, resposta)
		
		g.renderizar()
	}

	funcao tecla_pressionada(inteiro v1){
		escolha(v1){
			caso t.TECLA_0_NUM:
				resposta += "0"
	
			caso t.TECLA_1_NUM:
				resposta += "1"
			
			caso t.TECLA_2_NUM:
				resposta += "2"
			
			caso t.TECLA_3_NUM:
				resposta += "3"
			
			caso t.TECLA_4_NUM:
				resposta += "4"
			
			caso t.TECLA_5_NUM:
				resposta += "5"
			
			caso t.TECLA_6_NUM:
				resposta += "6"
			
			caso t.TECLA_7_NUM:
				resposta += "7"
			
			caso t.TECLA_8_NUM:
				resposta += "8"
			
			caso t.TECLA_9_NUM:
				resposta += "9"

			caso t.TECLA_ADICAO:
				resposta += "+"
				
			caso t.TECLA_SUBTRACAO:
				resposta += "-"

			caso t.TECLA_MULTIPLICACAO:
				resposta += "*"

			caso t.TECLA_DIVISAO:
				resposta += "/"

			caso t.TECLA_DECIMAL:
				resposta += "."
		}
	}

	funcao calcular(){
		
	}
	
	funcao inicio()
	{
		inteiro tecla
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(400, 600)
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
			desenhar()
			calcular()
			tecla = t.ler_tecla()
			tecla_pressionada(tecla)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1973; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {resposta, 16, 8, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */