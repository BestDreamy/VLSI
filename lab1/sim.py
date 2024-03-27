import subprocess as sp
import sys
import os

def run_sim():
	flag = " -full64 -kdb -debug_acc+r "
	vsrc = " multiplier_tb.v multiplier.v half_adder.v full_adder.v "  
	path = os.path.dirname(os.path.abspath(__file__))
	for filename in os.listdir(path):
		if filename.endswith('.fsdb'):
			wave = filename

	sim_cmd = [
		'echo vcs running',
		f'vcs {vsrc} {flag}',
		'./simv',
		f'verdi {wave}',
	]

	for cmd in sim_cmd:
		res = sp.run(cmd, shell=True)


if __name__ == '__main__':
	if len(sys.argv) == 1:
		arg = "default"
	else: 
		arg = sys.argv[1]

	if arg == "sim" or arg == "default":
		run_sim()
