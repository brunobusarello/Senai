programa
{
	
	funcao inicio()
	{
		logico controle
		caracter continuar

		controle = falso
		
		enquanto(controle != verdadeiro){
			escreva("Estou executando o laço\n")
			escreva("Deseja continuar executando o laço? (S ou N): ")
			leia(continuar)
			
			se(continuar == 'S'){
				controle = falso
			}
			senao se(continuar == 'N'){
				controle = verdadeiro
			}
			senao{
				escreva("Caracter errado\n")
			}
		}
		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 0; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */