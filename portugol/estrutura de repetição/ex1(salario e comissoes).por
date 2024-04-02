programa
{
	
	funcao inicio()
	{
		// definição das variáveis
		cadeia nome
		real sal_fixo, tot_sal
		inteiro tot_vendas
		const real COMISSAO = 0.15
		
		// inputs do usuário
		escreva("Nome: ")
		leia(nome)
		escreva("Salário Fixo: ")
		leia(sal_fixo)
		escreva("Quantidade de vendas: ")
		leia(tot_vendas)

		// cálculo do salário
		tot_sal = sal_fixo + tot_vendas*COMISSAO

		// resultado
		escreva("\n\n", nome, " recebe R$", sal_fixo, ", porém com suas vendas no mês, seu salário final foi de, R$", tot_sal)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 519; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */