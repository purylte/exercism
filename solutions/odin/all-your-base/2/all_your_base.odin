package all_your_base

Error :: enum {
	None,
	Invalid_Input_Digit,
	Input_Base_Too_Small,
	Output_Base_Too_Small,
	Unimplemented,
}

rebase :: proc(input_base: int, digits: []int, output_base: int) -> ([]int, Error) {
	if (input_base <= 1) {return nil, Error.Input_Base_Too_Small}
	if (output_base <= 1) {return nil, Error.Output_Base_Too_Small}


	nIn10: int = 0
	for num in digits {
		if (num < 0 || num >= input_base) {return nil, Error.Invalid_Input_Digit}
		nIn10 = num + (nIn10 * input_base)
	}

	res: [dynamic]int
	for nIn10 >= 1 {
		inject_at(&res, 0, nIn10 % output_base)
		nIn10 = nIn10 / output_base
	}

	if (len(res) == 0) {append(&res, 0)}

	return res[:], .None
}
