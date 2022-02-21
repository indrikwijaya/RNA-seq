trim_galore_cmd=/content/clean/trim_galore
dir='/content/clean'
file="config.txt"
cd $dir
cat $file |while read idpath
do
        rawdatapath=`echo $idpath`
        $trim_galore_cmd -q 25 --phred33 --length 36 --stringency 3 -o $dir $rawdatapath
done