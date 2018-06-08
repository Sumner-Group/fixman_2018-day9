#!/bin/bash
#SBATCH --nodes=1
#SBATCH --time=06:00:00
#SBATCH --qos=normal
#SBATCH --partition=sgpu
#SBATCH --ntasks=1

module purge
module load cuda/9.0.176
module load gcc
#module load openmpi/2.0.1

export AMBERHOME="/projects/ptlake@colostate.edu/amber16"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${AMBERHOME}/lib"

$AMBERHOME/bin/sander -O -i heat.in -o heat.out -p ../LYS.prmtop -c ../min/min.rst7 -r heat.rst7 -x heat.nc


