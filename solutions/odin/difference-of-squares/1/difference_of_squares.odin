package difference_of_squares

square_of_sum :: proc(n: int) -> int {
	sum := 0
	if (n % 2 == 0) {
		sum = (n / 2) * (1 + n)
	} else {
		// 1 2 3 4 5
		// 1+5 + 2+4
		// +3
		sum = ((n / 2) * (1 + n)) + ((n / 2) + 1)
	}

	return sum * sum
}

sum_of_squares :: proc(n: int) -> int {
	return (n * (n + 1) * ((2 * n) + 1)) / 6
}

difference :: proc(n: int) -> int {
	return square_of_sum(n) - sum_of_squares(n)
}
