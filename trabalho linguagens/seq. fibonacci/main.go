package main

import("fmt")

func main(){
	var i int
	inicial := 0
	proximo := 1

	fmt.Println("\n-- Sequência de Fibonacci --\n")
	for i < 1{
		fmt.Print("Digite quantos valores da sequência gostaria de ver: ")
		fmt.Scan(&i)
	}
	
	print(" ", inicial)
	if i > 1 {
		print(" ", proximo)
	}

	for c:=2; c < i; c++ {
		resultado := inicial + proximo
		fmt.Print(" ", resultado)
		inicial = proximo
		proximo = resultado
	}
}