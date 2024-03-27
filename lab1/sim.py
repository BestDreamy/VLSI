import subprocess as sp
import sys


def run_sim():
	flag = " -full64 -kdb -debug_acc+r "
	vsrc = " multiplier_tb.v multiplier.v half_adder.v full_adder.v "  

	sim_cmd = [
		'echo vcs running',
		# f'vcs {vsrc} {flag}'
	]

	for cmd in sim_cmd:
		res = sp.run(cmd, shell=True)


if __name__ == '__main__':
	if len(sys.argv) == 1:
		arg = "default"
	else: 
		arg = sys.argv[1]

	print(arg)
	if arg == "sim" or arg == "default":
		run_sim()	
