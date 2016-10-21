#srun --gres=gpu:2 --cpus-per-task=2 --ntasks=2 --time=36:00:00 --pty --partition=savio2_gpu bash -i
import argparse
parser = argparse.ArgumentParser(description='Parse gpu job arguments.')
parser.add_argument('--ngpus', type=int, help='number of required gpus')
parser.add_argument('--nhrs', type=int, default=24, help='number of hours')
parser.add_argument('--nmin', type=int, default=0, help='number of minutes')
parser.add_argument('--nsec', type=int, default=0, help='number of seconds')
args = parser.parse_args()
#print args

command = 'srun --gres=gpu:{0} --cpus-per-task=2 --ntasks={0} --time={1:02d}:{2:02d}:{3:02d} --pty --partition=savio2_gpu bash -i'.format(args.ngpus, args.nhrs, args.nmin, args.nsec)
print command
