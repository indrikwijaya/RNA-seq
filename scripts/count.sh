gtf="/content/counts/Homo_sapiens.GRCh38.86.gtf"
inputdir="/content/align"
    
featureCounts -T 10 -g gene_id -a $gtf -o SRR8984523.txt $inputdir/*.sorted.bam
    
multiqc -f SRR8984523.txt.summary

cat SRR8984523.txt | cut -f1,7- > counts.txt