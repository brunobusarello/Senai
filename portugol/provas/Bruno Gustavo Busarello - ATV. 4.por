programa
{
	inclua biblioteca Texto --> t
	
	funcao inicio()
	{
		// definição das variáveis
		cadeia texto = "", texto_caixa_alta = ""
		caracter letras[100]
		logico quant_digitada = falso
		inteiro index = 0

		// ler o texto do usuário
		enquanto(quant_digitada == falso){
			escreva("Digite um texto contendo entre 50 e 100 caracteres: ")
			leia(texto)
			se(t.numero_caracteres(texto) > 100){
				escreva("Você digitou mais de 100 caracteres!\n")
			}
			senao se(t.numero_caracteres(texto) < 50){
				escreva("Você digitou menos de 50 caracteres!\n")
			}
			senao{
				quant_digitada = verdadeiro
			}
		}

		// transformando as letras em maiiúsculas
		texto_caixa_alta = t.caixa_alta(texto)

		limpa()

		// armazenando a palavra em um vetor com as letras maiúsculas
		para(index; index < t.numero_caracteres(texto); index++){
			letras[index] = t.obter_caracter(texto_caixa_alta, index)
		}

		// invertendo a palavra
		escreva("A seu texto ao contrário, fica: \n")
		
		index--
		para(index; index >= 0; index--){
			escreva(letras[index]) 
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 139; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */