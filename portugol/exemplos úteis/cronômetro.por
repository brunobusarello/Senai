programa
{
	inclua biblioteca Calendario --> c
	inclua biblioteca Graficos --> g
	inclua biblioteca Teclado --> t

	inteiro segundos = 0
	inteiro segundo_base = c.segundo_atual()
	inteiro cont = 0
	
	funcao desenhar(){
		g.definir_cor(g.COR_BRANCO)
		g.limpar()
		g.definir_cor(g.COR_VERDE)
		g.definir_tamanho_texto(50.0)
		g.desenhar_texto(300, 200, segundos+"")
		
		g.renderizar()
	}
	
	funcao inicio(){
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(800, 600)
		enquanto(nao t.tecla_pressionada(t.TECLA_ESC)){
			desenhar()
			segundo()
			se(cont == 0){
				segundo_base = c.segundo_atual()
				cont = 1
			}
		}
	}

	funcao segundo(){
		inteiro segundo_atual = c.segundo_atual()
		se(segundo_base != segundo_atual){
			segundo_base = segundo_atual
			segundos++
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 328; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */