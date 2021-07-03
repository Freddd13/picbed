$fn = "17sai.mp4"
ffmpeg -i $fn -c:v libx264 -strict -2 ($fn.Substring(0, $fn.LastIndexOf('.'))+'out.mp4')
ffmpeg -i ($fn.Substring(0, $fn.LastIndexOf('.'))+'.mp4') -c copy -map 0 -f segment -segment_list ($fn.Substring(0, $fn.LastIndexOf('.'))+'_playlist.m3u8') -segment_time 5 ($fn.Substring(0, $fn.LastIndexOf('.'))+'%03d.ts')
