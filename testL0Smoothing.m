Im = imread('./MyImage/coin/coin.jpg');
S = L0Smoothing(Im,0.01);
figure, imshow(S);
imwrite(S,'./MyImage/coin/coin_L0.jpg','jpg');