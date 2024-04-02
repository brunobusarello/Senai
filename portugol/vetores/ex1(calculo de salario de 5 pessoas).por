programa
{
	
	funcao inicio()
	{
		//definição variáveis
		cadeia nomes[5]
		real sal_base[5], val_venda[5], sal_final[5]

		//inputs
		para(inteiro c=0; c<5; c++){
			escreva("Digite o nome do funcionário ", c + 1, ": ")
			leia(nomes[c])
			escreva("Digite o salário base do funcionário ", c + 1, ": ")
			leia(sal_base[c])
			escreva("Digite as vendas do funcionário ", c + 1, ": ")
			leia(val_venda[c])
			sal_final[c] = sal_base[c] + val_venda[c] * 0.015
			escreva("----------------------------------------\n")
		}

		// output
		para(inteiro v=0; v<5; v++){
			escreva("\nNOME: ", nomes[v], "\t | SALÁRIO: R$", sal_final[v])
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 243; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {nomes, 7, 9, 5}-{sal_base, 8, 7, 8}-{val_venda, 8, 20, 9}-{sal_final, 8, 34, 9}-{c, 11, 15, 1};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */