programa{
    
    inclua biblioteca Util --> u
    
    // inicialização das variáveis
    const inteiro tam = 5
    inteiro vetor[tam]

    funcao inicio(){
        inteiro i
        
        // preenchimento do vetor e saída do vetor original
        para(i = 0; i < tam; i++){
            escreva("Digite o ", i + 1, "º valor: ")
            leia(vetor[i])
            limpa()
        }
        
        escreva("\n")
        
        // chamada da função que organiza o vetor
        quickSort(vetor, 0, tam -1)

        // saída do vetor organizado
        escreva("Vetor Ordenado: ")
        para(i = tam - 1; i >= 0; i--){
            escreva(vetor[i], " ")
        }
    }

    funcao quickSort(inteiro vetor[], inteiro inicio, inteiro fim){
        inteiro i, j, pivo, aux
        i = inicio
        j = fim
        pivo = vetor[(inicio + fim) / 2]

        enquanto(i <= j){
            enquanto(vetor[i] < pivo){
                i++
            }
            enquanto(vetor[j] > pivo){
                j--
            }
            se(i <= j){
                aux = vetor[i]
                vetor[i] = vetor[j]
                vetor[j] = aux
                i++
                j--
            }
        }
        se(j > inicio){
            quickSort(vetor, inicio, j)
        }
        se(i < fim){
            quickSort(vetor, i, fim)
        }
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 380; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */