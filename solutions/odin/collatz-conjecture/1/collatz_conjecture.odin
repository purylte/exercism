package collatz_conjecture

// Returns the number of steps to get to a value of 1.
steps :: proc(start: int) -> (result: int, ok: bool) {
	if start <= 0 {return 0, false}
	res := start
	step := 0
	for ; res > 1; step += 1 {
		if res % 2 == 0 {
			res = res / 2
		} else {
			res = (res * 3) + 1
		}
	}
	return step, true
}
