# TM-align Nextflow Pipeline

A Nextflow pipeline based on [TM-align](https://zhanggroup.org/TM-align/).

## Running Nextflow

### Install Nextflow

Follow this to install Nextflow: https://www.nextflow.io/docs/latest/getstarted.html

### Pull Nextflow pipeline

```sh
nextflow pull juyeongkim/nf-tmalign
```

Downloaded pipeline are stored in the folder `$HOME/.nextflow/assets`.

### Run pipeline

#### A) Locally

```sh
cd /where/you/want/to/store/logs/and/intermediate/files
nextflow pull juyeongkim/nf-tmalign
```

##### Option 1 - If your input directory has $N$ number of pdb files, this will run TM-align on all combinations - ${N \choose 2}$. For example:

| `--p1` | `--output` |
| ------ | ---------- |
| 1.pdb  | 1._.2.out  |
| 2.pdb  | 1._.3.out  |
| 3.pdb  | 1._.4.out  |
| 4.pdb  | 2._.3.out  |
|        | 2._.4.out  |
|        | 3._.4.out  |

```sh
nextflow run juyeongkim/nf-tmalign -r main --p1 /your/input/dir --output /your/output/dir
```

##### Option 2 - Or if you would like to compare these files against another set of files - $M$, this will run TM-align on all pairs - $N \times M$. For example:

| `--p1` | `--p2` | `--output` |
| ------ | ------ | ---------- |
| 1.pdb  | x.pdb  | 1._.x.out  |
| 2.pdb  | y.pdb  | 1._.y.out  |
| 3.pdb  |        | 2._.x.out  |
| 4.pdb  |        | 2._.y.out  |
|        |        | 3._.x.out  |
|        |        | 3._.y.out  |
|        |        | 4._.x.out  |
|        |        | 4._.y.out  |

```sh
nextflow run juyeongkim/nf-tmalign -r main --p1 /your/input/dir --p2 /your/other/input/dir --output /your/output/dir
```


#### B) Cluster

Alternatively, you can run the pipeline on HPC with slurm. First, load the environment modules if they are available. If not, please follow the Apptainer and Nextflow documentation to install them first.

```sh
module load Apptainer
module load Nextflow

cd /where/you/want/to/store/logs/and/intermediate/files
nextflow pull juyeongkim/nf-tmalign

# option 1
nextflow run juyeongkim/nf-tmalign -r main -profile cluster --p1 /your/input/dir --output /your/output/dir

# option 2
nextflow run juyeongkim/nf-tmalign -r main -profile cluster --p1 /your/input/dir --p2 /your/other/input/dir --output /your/output/dir
```
