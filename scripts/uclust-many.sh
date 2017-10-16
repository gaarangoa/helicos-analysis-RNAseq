# pre analysis
# this script runs uclust in several samples in parallel. You need to give the input a text file that contains the following information:

# tag   genome  input 

# tag: the sample name
# genome: the reference genome used to compare
# input: the sample fasta file  

mypath="/research/gustavo1/USDA/pipeline/helicos-analysis-RNAseq/scripts"
reference="/research/gustavo1/USDA/pipeline/helicos-analysis-RNAseq/"
rawreads="/research/gustavo1/USDA/AUG2017/rawdata"
inputF="/research/gustavo1/USDA/AUG2017/metadata"

# inputF=$1 # this is the metadata file 

while IFS=" " read -r tag genome input
do
    echo $genome
    # sh $mypath/run_rna_seq_analysis.sh $rawreads/$input $reference/reference_genomes/$genome/gene_features.fa.txt $reference/reference_genomes/$genome/GB.gb $tag $genome $mypath &
done < "$inputF"


python $mypath/postprocess.py $inputF $rawreads $mypath 










# cat fc2.ch10.filtered.fq.fa.uc.functions fc2.ch11.filtered.fq.fa.uc.functions fc2.ch12.filtered.fq.fa.uc.functions fc2.ch14.filtered.fq.fa.uc.functions > ../results/Bifidobacterium_catenulatum.functions

# cat fc2.ch19.filtered.fq.fa.uc.functions fc2.ch20.filtered.fq.fa.uc.functions fc2.ch21.filtered.fq.fa.uc.functions fc2.ch22.filtered.fq.fa.uc.functions > ../results/Enterococcus_caccae.functions


# cat fc2.ch15.filtered.sorted.fa.uc.functions fc2.ch16.filtered.sorted.fa.uc.functions fc2.ch17.filtered.sorted.fa.uc.functions fc2.ch18.filtered.sorted.fa.uc.functions >  ../results/Lactobacillus_rhamnosus_GG.functions


# cat fc2.ch01.filtered.fq.fa.uc.functions fc2.ch02.filtered.fq.fa.uc.functions fc2.ch03.filtered.fq.fa.uc.functions fc2.ch04.filtered.fq.fa.uc.functions > ../results/Ruminococcous_gauvreauii.functions




# python $mypath/build_matrix.py Enterococcus_caccae.functions
# python $mypath/build_matrix.py Bifidobacterium_catenulatum.functions
# python $mypath/build_matrix.py Lactobacillus_rhamnosus_GG.functions
# python $mypath/build_matrix.py Ruminococcous_gauvreauii.functions



# python $mypath/gene_expression.py Enterococcus_caccae.functions.matrix.csv 3
# python $mypath/gene_expression.py Bifidobacterium_catenulatum.functions.matrix.csv 2
# python $mypath/gene_expression.py Lactobacillus_rhamnosus_GG.functions.matrix.csv 3
# python $mypath/gene_expression.py Ruminococcous_gauvreauii.functions.matrix.csv 4


# inchlib_clust.py Enterococcus_caccae.functions.matrix.csv.log2.normalized.csv -dh -a both -o  Enterococcus_caccae.functions.matrix.csv.log2.normalized.csv.json
# inchlib_clust.py Bifidobacterium_catenulatum.functions.matrix.csv.log2.normalized.csv -dh -a both -o  Bifidobacterium_catenulatum.functions.matrix.csv.log2.normalized.csv.json
# inchlib_clust.py Lactobacillus_rhamnosus_GG.functions.matrix.csv.log2.normalized.csv -dh -a both -o  Lactobacillus_rhamnosus_GG.functions.matrix.csv.log2.normalized.csv.json
# inchlib_clust.py Ruminococcous_gauvreauii.functions.matrix.csv.log2.normalized.csv -dh -a both -o  Ruminococcous_gauvreauii.functions.matrix.csv.log2.normalized.csv.json






# ############################
# ######## GENES #############
# ############################


# cat fc2.ch10.filtered.fq.fa.uc.genes fc2.ch11.filtered.fq.fa.uc.genes fc2.ch12.filtered.fq.fa.uc.genes fc2.ch14.filtered.fq.fa.uc.genes > ../results/Bifidobacterium_catenulatum.genes

# cat fc2.ch19.filtered.fq.fa.uc.genes fc2.ch20.filtered.fq.fa.uc.genes fc2.ch21.filtered.fq.fa.uc.genes fc2.ch22.filtered.fq.fa.uc.genes > ../results/Enterococcus_caccae.genes

# cat fc2.ch15.filtered.sorted.fa.uc.genes fc2.ch16.filtered.sorted.fa.uc.genes fc2.ch17.filtered.sorted.fa.uc.genes fc2.ch18.filtered.sorted.fa.uc.genes >  ../results/Lactobacillus_rhamnosus_GG.genes

# cat fc2.ch01.filtered.fq.fa.uc.genes fc2.ch02.filtered.fq.fa.uc.genes fc2.ch03.filtered.fq.fa.uc.genes fc2.ch04.filtered.fq.fa.uc.genes > ../results/Ruminococcous_gauvreauii.genes


# python $mypath/process_genes.py Enterococcus_caccae.genes
# python $mypath/process_genes.py Bifidobacterium_catenulatum.genes
# python $mypath/process_genes.py Lactobacillus_rhamnosus_GG.genes
# python $mypath/process_genes.py Ruminococcous_gauvreauii.genes













#
