# pre analysis
# this script runs uclust in several samples in parallel. You need to give the input a text file that contains the following information:

# tag   genome  input 

# tag: the sample name
# genome: the reference genome used to compare
# input: the sample fasta file  

# mypath="/research/gustavo1/USDA/pipeline/helicos-analysis-RNAseq/scripts"
# reference="/research/gustavo1/USDA/pipeline/helicos-analysis-RNAseq/"
# rawreads="/research/gustavo1/USDA/AUG2017/rawdata"
# inputF="/research/gustavo1/USDA/AUG2017/metadata"

mypath=$1
reference=$2
rawreads=$3
inputF=$4

stage=$5 # flag about the stage, first compute everyting or 2 postprocess

# inputF=$1 # this is the metadata file 

if [ $stage -eq 0 ]
then
    while IFS=" " read -r tag genome input
    do
        echo $genome
        sh $mypath/run_rna_seq_analysis.sh $rawreads/$input $reference/reference_genomes/$genome/gene_features.fa.txt $reference/reference_genomes/$genome/GB.gb $tag $genome $mypath &
    done < "$inputF"
fi


# second stage
if [ $stage -eq 1 ] 
then
    python $mypath/postprocess.py $inputF $rawreads $mypath 
fi