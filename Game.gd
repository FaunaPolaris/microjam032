extends Node

const	ON_STAGE = 0
const	ON_RUN = 1

var	state	: int

func	_ready():
	state = ON_RUN
