#srun --nodes=1 --time=36:00:00 --pty --partition=savio2 bash -i
import argparse
parser = argparse.ArgumentParser(description='Parse cpu job arguments.')
parser.add_argument('--nhrs', type=int, default=24, help='number of hours')
parser.add_argument('--nmin', type=int, default=0, help='number of minutes')
parser.add_argument('--nsec', type=int, default=0, help='number of seconds')
args = parser.parse_args()
#print args

command = 'srun --nodes=1 --time={1:02d}:{2:02d}:{3:02d} --pty --partition=savio2 bash -i'.format(args.nhrs, args.nmin, args.nsec)
print command
