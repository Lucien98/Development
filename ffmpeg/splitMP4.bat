rem mkdir %2
rem ffmpeg -ss 00:00:00 -i %1 -c copy -t 00:04:00 %2/%2-part1.mkv 
rem ffmpeg -ss 00:04:01 -i %1 -c copy -t 00:04:00 %2/%2-part2.mkv 
rem ffmpeg -ss 00:08:01 -i %1 -c copy -t 00:04:00 %2/%2-part3.mkv 
rem ffmpeg -ss 00:12:01 -i %1 -c copy -t 00:04:00 %2/%2-part4.mkv 
rem ffmpeg -ss 00:16:01 -i %1 -c copy -t 00:04:00 %2/%2-part5.mkv 
rem ffmpeg -ss 00:20:01 -i %1 -c copy -t 00:04:00 %2/%2-part6.mkv 
rem EnableDelayedExpansion and !var! should be consistent
rem what will happen when enable/disable the the option /L

setlocal EnableDelayedExpansion

for /L %%e in (2,1,9) do (
	mkdir e0%%e
	set timeoffset=0
	for /l %%p in (0,1,5) do (
		set /a timeoffset=4*%%p
		echo %timeoffset%
		ffmpeg -ss 00:!timeoffset!:00 -i e0%%e.mkv -c copy -t 00:04:00 e0%%e/e0%%e-part%%p.mkv
		ffmpeg.exe -i e0%%e/e0%%e-part%%p.mkv -map 0:s:0 e0%%e/e0%%e-part%%p.srt
	)
) 

for /L %%e in (10,1,11) do (
	mkdir e%%e
	set timeoffset=0
	for /l %%p in (0,1,5) do (
		set /a timeoffset=4*%%p
		echo %timeoffset%
		ffmpeg -ss 00:!timeoffset!:00 -i e%%e.mkv -c copy -t 00:04:00 e%%e/e%%e-part%%p.mkv
		ffmpeg.exe -i e%%e/e%%e-part%%p.mkv -map 0:s:0 e%%e/e%%e-part%%p.srt
	)
) 