programa
{
	funcao real mediaFinal(real n1, real n2, real n3){
		real mf
		mf = (n1 + n2 + n3)/3
		retorne mf
	}

	funcao status(real mf){
		se(mf >= 7.0) escreva("APROVADO")
		senao se(mf < 5.0) escreva("REPROVADO")
		senao escreva("RECUPERAÇÃO")
	}
	
	funcao inicio()
	{
		real nota1, nota2, nota3, mf
		nota1 = 5.5
		nota2 = 8.2
		nota3 = 4.5
	
		mf = mediaFinal(nota1, nota2, nota3)

		status(mf)

	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 9; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */