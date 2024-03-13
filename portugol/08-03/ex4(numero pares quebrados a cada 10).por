programa
{
	
	funcao inicio()
	{
		inteiro cont_10 = 10
		para(inteiro cont = 2; cont <= 200; cont+=2){
			se(cont == cont_10){
				se(cont < 100){
					escreva(" 0", cont, "\n")
				}
				senao{
					escreva(" ", cont, "\n")
				}
				cont_10 += 10	
			}
			senao{
				se(cont < 10){
					escreva(" 00", cont, " ")
				}
				senao se(cont < 100){
					escreva(" 0", cont, " ")					
				}
				senao{
					escreva(" ", cont, " ")
				}
				
			}
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 211; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */