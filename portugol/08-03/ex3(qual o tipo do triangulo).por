programa
{
	
	funcao inicio()
	{
		// definição das variáveis
		inteiro r1, r2, r3
		cadeia status
		
		// entradas dos valores
		escreva("Digite o comprimento da reta 1: ")
		leia(r1)
		escreva("Digite o comprimento da reta 2: ")
		leia(r2)
		escreva("Digite o comprimento da reta 3: ")
		leia(r3)

		// verificação se as retas formam um triangulo
		se(r1 < r2 + r3 e r2 < r1 + r3 e r3 < r1 + r2){
			se(r1 == r2 e r1 == r3 e r3 == r2){
        			status = "EQUILÁTERO"
			}	
    			senao se(r1 == r2 ou r1 == r3 ou r2 == r3){
        			status = "ISÓSCELES"
			}
    			senao{
        			status = "ESCALENO"
    			}
			escreva("\nESSAS RETA FORMAM UM TRIÂNGULO ", status)
		}
		senao{
			escreva("\nNÃO É POSSÍVEL FORMAR UM TRIÂNGULO")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 304; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */