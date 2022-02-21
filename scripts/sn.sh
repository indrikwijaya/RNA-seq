hisat2_indexes_dir=/content/genome
index=genome
inputdir=/content/clean
outdir=/content/align
echo "export HISAT2_INDEXES=$hisat2_indexes_dir" > Hisat.sh

cat /content/align/SRR_Acc_List.txt|while read id
do
# echo "nohup hisat2 -p 2 -x $index -U $inputdir/${id}_trimmed.fq.gz|samtools sort -@ 5 -o $outdir/${id}_aln.sorted.bam  && samtools index $outdir/${id}_aln.sorted.bam $outdir/${id}_aln.sorted.bam.bai && samtools flagstat $outdir/${id}_aln.sorted.bam >$id.txt &"
echo "hisat2 -p 2 -x $index -U $inputdir/${id}_trimmed.fq.gz|samtools sort -@ 5 -o $outdir/${id}_aln.sorted.bam  && samtools index $outdir/${id}_aln.sorted.bam $outdir/${id}_aln.sorted.bam.bai && samtools flagstat $outdir/${id}_aln.sorted.bam >$id.txt"
done >>Hisat.sh
echo "" >> Hisat.sh