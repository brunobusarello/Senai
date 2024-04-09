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

	// variáveis de visor e resposta do usuário
	caracter valores[13]
	caracter op
	cadeia resposta = ""
	cadeia mostrar = ""
	inteiro pos_vetor = 0
	inteiro pos_op = 0
	inteiro c_op = 0, c_pontos = 0
	
	// matriz contendo os caracteres da calculadora
	cadeia numeros_calc[5][4] = {
		{"AC", "<-", " %", " +"},
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

		para(inteiro c = 0; c < 4; c++){
			para(inteiro l = 0; l < 5; l++){
				se(c == 3){
					desenhar_btn(0 + 101 * c, 114 + 101 * l, btn_operacoes, g.COR_BRANCO, 20 + 101 * c, 140 + 100 * l, numeros_calc[l][c])
				}
				senao{
					desenhar_btn(0 + 101 * c, 114 + 101 * l, g.COR_BRANCO, g.COR_PRETO, 20 + 101 * c, 140 + 100 * l, numeros_calc[l][c])
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

		g.renderizar()
	}

	// desenha os quadrados de acordo com os parâmetros
	funcao desenhar_btn(inteiro x_btn, inteiro y_btn, inteiro cor_btn, inteiro cor_texto, inteiro x_texto, inteiro y_texto, cadeia texto){
		g.definir_cor(cor_btn)
		g.desenhar_retangulo(x_btn, y_btn, 97, 97, falso, verdadeiro)

		se(m.posicao_x() >= x_btn e m.posicao_x() <= x_btn + 97 e m.posicao_y() >= y_btn e m.posicao_y() <= y_btn + 97){
				g.definir_cor(g.COR_PRETO)
				g.definir_opacidade(30)
				g.desenhar_retangulo(x_btn, y_btn, 97, 97, falso, verdadeiro)
				g.definir_opacidade(255)
				se(m.botao_pressionado(m.BOTAO_ESQUERDO)){
					btn_pressionado(x_btn, y_btn)
					u.aguarde(100)
				}
		}
		
		g.definir_cor(cor_texto)
		g.definir_tamanho_texto(40.0)
		g.definir_fonte_texto("Arial")
		g.desenhar_texto(x_texto, y_texto, texto)
	}

	// lê as teclas apertdas e estabelece funções a elas
	funcao tecla_pressionada(){
		inteiro v1 = t.ler_tecla()
		se(pos_vetor < 13){
			se(v1 >= 96 e v1 <= 105){
				valores[pos_vetor] = ty.inteiro_para_caracter(v1 - 96)
				pos_vetor++
			}
		
			escolha(v1){
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

	// verificação de que botão foi pressionado e retorna o valor
	funcao btn_pressionado(inteiro x, inteiro y){
		para(inteiro c = 0; c < 4; c++){
			para(inteiro l = 0; l < 5; l++){
				se(
			}
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
		g.iniciar_modo_grafico(verdadeiro)
		g.definir_dimensoes_janela(400, 614)
		enquanto(continuar == verdadeiro){
			desenhar()
			se(t.alguma_tecla_pressionada()){
				tecla_pressionada()
			}
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
 * @POSICAO-CURSOR = 4430; 
 * @DOBRAMENTO-CODIGO = [32, 41, 71, 93, 201, 215, 238, 249];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */