programa
{
	
	funcao inicio()
	{
		inteiro c=0
		cadeia nomes[200]
		real sal_base[200], val_venda[200], sal_final[200]
		caracter continuar = 's'

		enquanto(continuar == 's'){
			escreva("Digite o nome do funcionário ", c + 1, ": ")
			leia(nomes[c])
			escreva("Digite o salário base do funcionário ", c + 1, ": ")
			leia(sal_base[c])
			escreva("Digite as vendas do funcionário ", c + 1, ": ")
			leia(val_venda[c])
			sal_final[c] = sal_base[c] + val_venda[c] * 0.015
			escreva("----------------------------------------\n")
			escreva("Continuar? (s/n): ")
			leia(continuar)
			escreva("----------------------------------------\n")
			c++
		}

		para(inteiro v=0; v<c; v++){
			escreva("\nNOME: ", nomes[v], "\t | SALÁRIO: R$", sal_final[v])
		}
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 724; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {nomes, 7, 9, 5}-{sal_base, 8, 7, 8}-{val_venda, 8, 22, 9}-{sal_final, 8, 38, 9};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */