programa
{
	inclua biblioteca Texto --> t
	
	funcao inicio()
	{
		// definição das variáveis
		cadeia numero = "", numero_formatado = ""
		caracter numeros[10]
		logico numero_errado = verdadeiro
		inteiro tam_numero = 0

		// leitura do valor
		enquanto(numero_errado == verdadeiro){
			escreva("Digite o seu número de telefone (somente números): ")
			leia(numero)
			tam_numero = t.numero_caracteres(numero)
			se(tam_numero > 10){
				escreva("Certifique-se de que você não colocou nenhum espaço ou caracteres especiais\n")
			}
			senao se(tam_numero < 10){
				escreva("Certifique-se de que você digitou o código da cidade e o seu número completo\n")
			}
			senao{
				numero_errado = falso
			}
		}

		// transformação em vetor
		para(inteiro c = 0; c < tam_numero; c++){
			numeros[c] = t.obter_caracter(numero, c)
		}

		// formatação
		numero_formatado += "("

		para(inteiro c = 0; c < 2; c++){
			numero_formatado += numeros[c]
		}
		
		numero_formatado += ") "

		para(inteiro c = 2; c < 6; c++){
			numero_formatado += numeros[c]
		}

		numero_formatado += "-"

		para(inteiro c = 6; c < 10; c++){
			numero_formatado += numeros[c]
		}

		// resultado
		escreva("O seu número formatado fica: ", numero_formatado)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 350; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {numero_formatado, 8, 22, 16}-{numeros, 9, 11, 7};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */