dir='/content/align'
outfile='mapinfo.txt'
cd $dir

if  [ -f  $outfile  ]; then
rm  -rf  $outfile
fi

ls *txt|while read id;do(echo $id|awk -F "." '{print $1}'>>sample);done

ls *txt|while read id;do(cat $id|cut -d " " -f 1|sed -n "1p"|awk '{printf "%18.0f\n",$0}' >>totalreads);done
ls *txt|while read id;do(cat $id|cut -d " " -f 1|sed -n "2p"|awk '{printf "%18.0f\n",$0}'>>secondary);done
ls *txt|while read id;do(cat $id|cut -d " " -f 4,5|sed -n '5p'|awk -F "(" '{print $2}' >>mapratio);done
echo "sample    totalreads      secondary       mapratio" >$outfile
paste -d "\t" sample totalreads secondary mapratio >>$outfile

rm sample totalreads secondary mapratio