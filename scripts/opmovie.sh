#!/bin/sh

# Step 1: Create a folder called MOVIES
mkdir MOVIES

# Step 2: Change the current directory to MOVIES
cd MOVIES

# Step 3: Download all videos one by one and rename them
for i in {1..524}; do
  wget "https://xrec99e0.sw-cdnstream.com/hls2/01/00555/p1h18r6p9xhm_h/seg-${i}-v1-a1.ts?t=N1yo65dNas2QoPFZpSR4K5YeiPSMpRKnhun4RUb3jzA&s=1689933352&e=129600&f=2776836&srv=150ygmgxf1vw&i=0.0&sp=500&p1=150ygmgxf1vw&p2=150ygmgxf1vw" -O "${i}.mp4"
done

# Step 4: Keep the file names in a text file
for ((i=1; i<=524; i++)); do
  printf "file '%d.mp4'\n" "$i" >> video_list.txt
done

# Step 5: Concatenate all videos with ffmpeg
ffmpeg -f concat -i video_list.txt -c copy Oppenheimer.mp4

# Step 6: Remove all the other files and just keep the movie
find . -type f -name '*.mp4' | grep -vE '(Oppenheimer\.mp4)' | xargs rm -f 

echo "All operations completed successfully!"
