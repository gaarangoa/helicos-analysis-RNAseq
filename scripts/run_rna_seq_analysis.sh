file=$1 #Load fastq file
gene_features=$2 # fasta file that contains the genes
gene_bank_file=$3 # genbank file with the data for the genes *.gb
sample_label=$4
genome_name=$5
mypath=$6
inputF=$7
rawreads=$8



# mypath="/Volumes/drive/projects/USDA/pipeline/function_helicos/scripts"

# awk '{if($_~/^@/){x=$_; gsub("@",">",x); getline;  print x"\n"$_}}' $file > $file.fa

uclust --input $file --lib $gene_features --uc $file.uc --id 0.80 --libonly

python $mypath/process_UCLUST.py $file.uc $gene_bank_file $sample_label $genome_name

python $mypath/postprocess.py $inputF $rawreads $mypath 