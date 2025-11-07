echo pwd
#wget -O vid.mp4 "https://storage.googleapis.com/shorts-hdr-dataset/videos/sdr/SDR_Animal_01ld.mp4"
echo "Video downloaded!"


#ffmpeg -i vid.mp4 -pix_fmt yuv420p vid.y4m
echo "Video converted!"


cd ../build 
#../configure --enable-vp9 --enable-examples --disable-unit-tests
#make -j$(nproc)
#make install
echo "Project built"

./vpxenc --codec=vp9 --passes=2 --pass=1 --fpf=firstpass.stt ../scripts/vid.y4m -o /dev/null 
