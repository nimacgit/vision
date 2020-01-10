clear all
close all
image_path = 'IMG_2919.JPG';
img = imread(image_path);

row = size(img,1);
col = size(img,2);


% figure
% i_histeq = histeq(img);
% imshow(i_histeq)
% figure

img_final = img;
img_final2 = img;
SELECT_THRESH = 255;
REWARD_THRESH = 300;
MINUS_THRESH = 50;
COEF_THRESH = 0.1;
% 
% for i=1:20
%     select = img_final(img_final < SELECT_THRESH);
%     img_final(img_final < SELECT_THRESH) = select + uint8(log2(double(REWARD_THRESH - select)));
%     img_final = img_final - MINUS_THRESH;
% end

for i=1:1
    img_final2 = uint8(255*log2(double(1 + COEF_THRESH*uint32(img_final2)))/log2(1+COEF_THRESH*255));
%     img_final2 = img_final2 + uint8(log2(double(REWARD_THRESH - img_final2)));
    img_final2 = img_final2 - MINUS_THRESH;
end
imshow([img, img_final2]);

imwrite(img_final, 'im01.jpg')