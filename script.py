import sys
import subprocess as sp

def run_git(commit):
	git_cmd = [
		"git add .",
		f'git commit -m {commit}',
		"git push",
	]
	for cmd in git_cmd:
		print(cmd)
		sp.run(cmd, shell=True)


if __name__ == "__main__":
	arg = '"Update"'
	if len(sys.argv) > 1:
		arg = sys.argv[1]
	
	run_git(arg)
