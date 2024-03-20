programa
{
	inclua biblioteca Matematica --> m
	
	funcao inicio()
	{
		// definição variáveis
		real va, vb, vc, x1, x2, delta
		caracter continuar = 's'
		// inicialização variáveis
		delta = 0.0
		x1 = 0.0
		x2 = 0.0

		enquanto(continuar == 's'){
			// inputs
			escreva("Digite o valor de A: ")
			leia(va)
			escreva("Digite o valor de B: ")
			leia(vb)
			escreva("Digite o valor de C: ")
			leia(vc)
			limpa()

			// cálculo do Delta
			delta = m.potencia(vb, 2.0) - 4 * va * vc
			
			// cálculo de x1 e x2, se delta > 0
			se(delta < 0){
				escreva("==============================================")
				escreva("\nDelta negativo, não é possível calcular a raíz\n")
			}
			senao{
				x1 = (-vb + m.raiz(delta, 2.0)) / 2 * va
				x2 = (-vb - m.raiz(delta, 2.0)) / 2 * va
				escreva("== RESULTADO ==")
				escreva("\n  x1 = ", m.arredondar(x1, 2))
				escreva("\n  x2 = ", m.arredondar(x2, 2))
			}
			escreva("\n----------------")
			escreva("\nQuer continuar? (S/N) ")
			leia(continuar)
			limpa()
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 107; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */