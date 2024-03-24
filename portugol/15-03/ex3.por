programa
{

	// Inversão de frase utilizando estrutura de controle e vetores

	//definição das variáveis
	caracter frase[200]
	inteiro tot_caracter = 0
	cadeia tot_frase
	
	
	funcao inicio()
	{
		inteiro index = 0
		logico continuar = verdadeiro

		
		enquanto(continuar == verdadeiro){
			escreva("Digite uma frase: ")
			para(inteiro c=0; c < index; c++){
				escreva(frase[c])
			}
			leia(frase[index])
			se(frase[index] == '.')
				continuar = falso
			index++
			tot_caracter++
			limpa()
		}

		escreva("\nFrase digitada: ")
		para(inteiro c=0; c < index - 1; c++){
			escreva(frase[c])
		}

		escreva("\n")
		index--
		escreva("Frase digitada ao contrário: ")
		para(index; index >= 0; index--){
			escreva(frase[index])
		}

		escreva("\nTotal de caracteres: ", tot_caracter)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 693; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */