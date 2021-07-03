param($fn = "", $fDir = "../video")
if ($fn -eq ""){
	echo "e.g. ./generateTS.ps1 17sai.mp4 ../video/"
	exit
}
cd $fDir
$fBasename = $fn.Substring(0, $fn.LastIndexOf('.'))
ffmpeg -i $fn -c:v libx264 -strict -2 ($fBasename + 'out.mp4')
ffmpeg -i ($fBasename +'out.mp4') -c copy -map 0 -f segment -segment_list ($fBasename + '_playlist.m3u8') -segment_time 5 ($fBasename + '%03d.ts')
cd -
echo ""
echo ("jsdelivr url is:     https://cdn.jsdelivr.net/gh/Freddd13/picBed/" + $fBasename + "_playlist.m3u8")
