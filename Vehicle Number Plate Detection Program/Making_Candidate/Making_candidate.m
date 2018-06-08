clear;

candy(:,:,1)=sum(imread('candy_1.jpg'),3);
candy(:,:,2)=sum(imread('candy_2.jpg'),3);
candy(:,:,3)=sum(imread('candy_3.jpg'),3);
candy(:,:,4)=sum(imread('candy_4.jpg'),3);
candy(:,:,5)=sum(imread('candy_5.jpg'),3);
candy(:,:,6)=sum(imread('candy_6.jpg'),3);
candy(:,:,7)=sum(imread('candy_7.jpg'),3);
candy(:,:,8)=sum(imread('candy_8.jpg'),3);
candy(:,:,9)=sum(imread('candy_9.jpg'),3);
candy(:,:,10)=sum(imread('candy_0.jpg'),3);

save candy.mat candy;