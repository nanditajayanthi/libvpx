echo pwd
wget -O scripts/vid.mp4 "https://storage.googleapis.com/shorts-hdr-dataset/videos/sdr/SDR_Animal_01ld.mp4"
echo "Video downloaded!"


ffmpeg -i scripts/vid.mp4 -pix_fmt yuv420p scripts/vid.y4m
echo "Video converted!"


cd build 
../configure --enable-vp9 --enable-examples --disable-unit-tests
make -j$(nproc)
make install
echo "Project built"
echo pwd

./vpxenc --codec=vp9 --passes=2 --pass=1 --fpf=firstpass.stt ../scripts/vid.y4m -o /dev/null
#./vpxenc --codec=vp9 --passes=2 --pass=2 --fpf=firstpass.stt ../scripts/vid.y4m -o /dev/null 
