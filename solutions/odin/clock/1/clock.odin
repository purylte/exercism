package clock

import "core:fmt"
Clock :: struct {
	hour:   int,
	minute: int,
}

create_clock :: proc(hour, minute: int) -> Clock {
	clock := Clock{hour, minute}
	normalize(&clock)
	return clock
}

to_string :: proc(clock: Clock) -> string {
	return fmt.aprintf("%02d:%02d", clock.hour, clock.minute)
}

add :: proc(clock: ^Clock, minutes: int) {
	clock.minute = clock.minute + minutes
	normalize(clock)
}

subtract :: proc(clock: ^Clock, minutes: int) {
	clock.minute = clock.minute - minutes
	normalize(clock)
}

equals :: proc(a, b: Clock) -> bool {
	return a.hour == b.hour && a.minute == b.minute
}

@(private = "file")
normalize :: proc(clock: ^Clock) {
	total_minute := clock.hour * 60 + clock.minute
	hour := (total_minute / 60) %% 24

	minute := (total_minute %% 60)
	if (minute > 0 && total_minute < 0) {
		hour = (hour - 1) %% 24
	}

	clock.hour = hour
	clock.minute = minute
}
