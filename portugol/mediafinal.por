programa
{
	
	funcao inicio()
	{
		// definição de variáveis
		real nota1, nota2, nota3, mf
		cadeia status

		// inicialização das variáveis
		nota1 = 5.5
		nota2 = 8.5
		nota3 = 4.7

		// calcular média final
		mf = (nota1+nota2+nota3)/3

		se(mf >= 7.0)
		{
			status = "APROVADO"
		}
		senao
		{
			se(mf < 5)
			{
				status = "REPROVADO"
			}
			senao
			{
				status = "RECUPERAÇÃO"
			}
		}

		escreva("O aluno foi: " + status + ", com média final de: ", mf)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 445; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */