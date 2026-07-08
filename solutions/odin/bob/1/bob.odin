package bob

import "core:strings"
import "core:unicode"

response :: proc(input: string) -> string {
	trimmed := strings.trim_space(input)
	if (len(trimmed) == 0) {
		return "Fine. Be that way!"
	}

	is_question := trimmed[len(trimmed) - 1] == u8('?')
	is_upper := is_upper(trimmed)

	if (is_question && is_upper) {
		return "Calm down, I know what I'm doing!"
	} else if (is_question) {
		return "Sure."
	} else if (is_upper) {
		return "Whoa, chill out!"
	}

	return "Whatever."
}

@(private = "file")
is_upper :: proc(s: string) -> bool {
	containsAlpha := false
	for ch in s {
		if (!containsAlpha && unicode.is_alpha(ch)) {
			containsAlpha = true
		}
		if unicode.is_alpha(ch) && !unicode.is_upper(ch) {
			return false
		}
	}
	return containsAlpha
}
