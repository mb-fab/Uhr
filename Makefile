
all: gears.svg stand.svg

%.svg: %.scad
	openscad $< -o temp.svg
	cat temp.svg | sed -e "s/lightgray/none/" | sed -e "s/black/red/" | sed -e "s/\"0.5\"/\"0.1px\"/" > $@
	rm temp.svg

video: clock.mp4

clock.mp4: clock.scad
	ffmpeg -r 30 -f image2 -i "frame00%03d.png" -vcodec libx264 -crf 25 $@

clean:
	rm -fr gears.svg stand.svg clock.png frame*.png clock.gif clock.mp4

