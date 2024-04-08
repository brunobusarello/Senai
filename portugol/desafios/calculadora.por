programa
{
	inclua biblioteca Texto --> txt
	inclua biblioteca Tipos --> ty
	inclua biblioteca Matematica --> mat
	inclua biblioteca Util --> u
	inclua biblioteca Mouse --> m
	inclua biblioteca Teclado --> t
	inclua biblioteca Graficos -->g

	// variável que faz o programa parar
	logico continuar = verdadeiro

	// variáveis de cálculo
	cadeia num1 = "", num2 = ""
	real n1 = 0.0, n2 = 0.0, resp = 0.0
	
	// cores
	inteiro visor = g.criar_cor(212, 212, 212)
	inteiro fundo = g.criar_cor(143, 143, 143)
	inteiro btn_operacoes = g.criar_cor(236,150,71)

	// posições
	inteiro col = 0, lin = 0
	inteiro pos_q_x[4] = {0, 101, 202, 303}
	inteiro pos_q_y[5] = {114, 215, 316, 417, 518}
	inteiro pos_nums_x[4] = {20, 121, 222, 323}
	inteiro pos_nums_y[5] = {140, 240, 340, 441, 542}
	inteiro pos_mouse = 0

	// variáveis de visor e resposta do usuário
	caracter valores[13]
	caracter op
	cadeia resposta = ""
	cadeia mostrar = ""
	inteiro pos_vetor = 0
	inteiro pos_op = 0
	inteiro flag = 0
	inteiro c_op = 0, c_pontos = 0
	
	
	// matriz contendo os caracteres da calculadora
	cadeia numeros_calc[5][4] = {
		{"AC", "  ", " %", " +"},
		{" 7", " 8", " 9", " -"},
		{" 4", " 5", " 6", " x"},
		{" 1", " 2", " 3", " /"},
		{"00", " 0", " .", " ="}
	}

	// toda parte gráfica é desenhada e renderizada aqui
	funcao desenhar(){
		g.definir_cor(fundo)
		g.limpar()
		g.definir_cor(visor)
		g.desenhar_retangulo(0, 0, 400, 110, falso, verdadeiro)

		para(col; col < 4; col++){
			para(lin; lin < 5; lin++){
				se(col == 3){
					desenhar_btn(pos_q_x[col], pos_q_y[lin], btn_operacoes, g.COR_BRANCO, pos_nums_x[col], pos_nums_y[lin], numeros_calc[lin][col])
				}
				senao{
					desenhar_btn(pos_q_x[col], pos_q_y[lin], g.COR_BRANCO, g.COR_PRETO, pos_nums_x[col], pos_nums_y[lin], numeros_calc[lin][col])
				}
			}
		}

		g.definir_cor(fundo)
		g.definir_fonte_texto("Arial")
		g.definir_tamanho_texto(50.0)
		resposta = ""
		para(inteiro c = 0; c < pos_vetor; c++){
			resposta += valores[c]
		}
		g.desenhar_texto(15, 27, resposta)	
	}

	// desenha os quadrados de acordo com os parâmetros
	funcao desenhar_btn(inteiro x_btn, inteiro y_btn, inteiro cor_btn, inteiro cor_texto, inteiro x_texto, inteiro y_texto, cadeia texto){
		g.definir_cor(cor_btn)
		g.desenhar_retangulo(x_btn, y_btn, 97, 97, falso, verdadeiro)

		se(m.posicao_x() >= 0 e m.posicao_x() <= 97)
		
		g.definir_cor(cor_texto)
		g.definir_tamanho_texto(40.0)
		g.definir_fonte_texto("Arial")
		g.desenhar_texto(x_texto, y_texto, texto)
	}

	// lê as teclas apertdas e estabelece funções a elas
	funcao tecla_pressionada(inteiro v1){
		se(pos_vetor < 13){
			escolha(v1){
				caso t.TECLA_0_NUM:
					valores[pos_vetor] = '0'
					pos_vetor++
		
				caso t.TECLA_1_NUM:
					valores[pos_vetor] = '1'
					pos_vetor++
				
				caso t.TECLA_2_NUM:
					valores[pos_vetor] = '2'
					pos_vetor++
				
				caso t.TECLA_3_NUM:
					valores[pos_vetor] = '3'
					pos_vetor++
				
				caso t.TECLA_4_NUM:
					valores[pos_vetor] = '4'
					pos_vetor++
				
				caso t.TECLA_5_NUM:
					valores[pos_vetor] = '5'
					pos_vetor++
				
				caso t.TECLA_6_NUM:
					valores[pos_vetor] = '6'
					pos_vetor++
				
				caso t.TECLA_7_NUM:
					valores[pos_vetor] = '7'
					pos_vetor++
				
				caso t.TECLA_8_NUM:
					valores[pos_vetor] = '8'
					pos_vetor++
				
				caso t.TECLA_9_NUM:
					valores[pos_vetor] = '9'
					pos_vetor++
	
				caso t.TECLA_ADICAO:
					se(c_op < 1){
						c_op++
					}
					senao{
						mostrar_resultado()
					}
					valores[pos_vetor] = '+'
					op = '+'
					pos_op = pos_vetor
					pos_vetor++
					
					
				caso t.TECLA_SUBTRACAO:
					se(c_op < 1){
						c_op++
					}
					senao{
						mostrar_resultado()
					}
					valores[pos_vetor] = '-'
					op = '-'
					pos_op = pos_vetor
					pos_vetor++
					c_op++
	
				caso t.TECLA_MULTIPLICACAO:
					se(c_op < 1){
						c_op++
					}
					senao{
						mostrar_resultado()
					}
					valores[pos_vetor] = 'x'
					op = 'x'
					pos_op = pos_vetor
					pos_vetor++
					c_op++
	
				caso t.TECLA_DIVISAO:
					se(c_op < 1){
						c_op++
					}
					senao{
						mostrar_resultado()
					}
					valores[pos_vetor] = '/'
					op = '/'
					pos_op = pos_vetor
					pos_vetor++
					c_op++
	
				caso t.TECLA_DECIMAL:
					se(c_op < 1){
						se(c_pontos <= 0){
							valores[pos_vetor] = '.'
							pos_vetor++
							c_pontos++
						}
					}
					senao se(c_pontos <= 1){
						valores[pos_vetor] = '.'
						pos_vetor++
						c_pontos++
					}
						
			}
		}

		escolha(v1){
			caso t.TECLA_BACKSPACE:
				se(pos_vetor >= 1){
						pos_vetor--
					}
				se(valores[pos_vetor] == '.'){
					c_pontos--
				}
				valores[pos_vetor] = ' '

			caso t.TECLA_ESC:
				continuar = falso

			caso t.TECLA_ENTER:
				mostrar_resultado()
				c_op = 0
		}
	}

	// separa os valores pelo sinal de operação
	funcao separar_valores(){
		num1 = ""
		num2 = ""
		para(inteiro v = 0; v < pos_vetor; v++){
			se(v < pos_op){
				num1 += valores[v]
			}
			senao se(v > pos_op){
				num2 += valores[v]
			}
		}
	}

	// realiza o cálculo dos valores
	funcao calcular(){
		n1 = ty.cadeia_para_real(num1)
		n2 = ty.cadeia_para_real(num2)
		
		escolha(op){
			caso '+':
				resp = n1 + n2
			pare
			caso '-':
				resp = n1 - n2
			pare
			caso 'x':
				resp = n1 * n2
			pare
			caso '/':
				resp = n1 / n2
			pare
		}

		mostrar = ty.real_para_cadeia(resp)
	}

	// mostra o resultado obtido na função calcular
	funcao mostrar_resultado(){
		inteiro c = 0
		inteiro tam = txt.numero_caracteres(mostrar)
		para(c; c < tam; c++){
			valores[c] = txt.obter_caracter(mostrar, c)
		}
		pos_vetor = c
		c_pontos = 1
	}

	// inicializa as principais funções
	funcao inicio()
	{
		inteiro tecla
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(400, 614)
		enquanto(continuar == verdadeiro){
			desenhar()
			g.renderizar()
			tecla = t.ler_tecla()
			tecla_pressionada(tecla)
			separar_valores()
			se(num1 != "" e num2 != ""){
				calcular()
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1791; 
 * @DOBRAMENTO-CODIGO = [42, 92, 224, 238, 261, 272];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {num1, 15, 8, 4}-{num2, 15, 19, 4}-{n1, 16, 6, 2}-{n2, 16, 16, 2}-{resp, 16, 26, 4}-{resposta, 34, 8, 8};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */