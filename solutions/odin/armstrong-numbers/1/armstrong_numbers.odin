package armstrong_numbers

is_armstrong_number :: proc(n: u128) -> bool {
	l := countDigit(n)
	cur := n
	raisedTotal: u128 = 0
	for cur > 0 {
		digit := cur % 10
		raisedTotal += power(digit, l)
		cur = cur / 10
	}
	return n == raisedTotal
}

countDigit :: proc(n: u128) -> int {
	c := 0
	x := n
	for x > 0 {
		c += 1
		x /= 10
	}
	return c
}

power :: proc(n: u128, p: int) -> u128 {
	res: u128 = 1
	for i := 0; i < p; i += 1 {
		res *= n
	}
	return res
}
