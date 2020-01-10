clear all
close all
% image_path = '../../../Users/nimac/Desktop/matlab/IMG_6052.JPG';
image_path = 'Data/IMG_6052.JPG';
KERNEL_SIZE = 3;
i1 = imread(image_path);
i32 = int32(i1);
ilap = i1;
ismo = i1;
ismooth = i1;
row = size(i1,1);
col = size(i1,2);

% for i=2:KERNEL_SIZE:row
%    for j=2:KERNEL_SIZE:col
% %        ilap(i, j) = do_kernel_laplase(i1, i, j);
%        ismo(i,j) = do_kernel_smooth(i1, i, j, KERNEL_SIZE);
%    end
% end
imshow(i1)
figure
i_histeq = histeq(i1);
imshow(i_histeq)
figure
% imshow(ilap)
% figure
% imshow(ismo)
ismooth = i1/3;
i2 = i1(2:end, :, :);
i2(row, :, :) = i1(1, :, :);
ismooth = ismooth + i2/3;
i2 = i1(:, 2:end, :);
i2(:, col, :) = i1(:, 1, :);
ismooth = ismooth + i2/3;

imshow(ismooth)
% i2 = histeq(i1);
% tmp = rand(100,100,3);
% i2(1:100, 1:100, :) = tmp;
% len = size(i2);
% x = i1>0.7;
% loglog(i1(:,:,1))
% imagesc(i1)
% for x=1:len(1,1)
%     for y=1:len(1,2)
%         p = i2(x,y,:);
%     end
% end
% imshow(rgb2gray(i1))

function y=do_kernel_smooth(im, i, j, KERNEL_SIZE)
    y = 0;
    gap = floor(KERNEL_SIZE/2);
    for l= -gap:gap
        for k=-gap:gap
            y = y + im(i + l, j + k);
        end
    end
    y = y / 9;
end

function y=do_kernel_laplase(im, i, j)
    y = 4 * im(i, j);
    y = y - im(i + 1, j) - im(i - 1, j) - im(i, j + 1) - im(i, j - 1);
    y = y - im(i + 1, j + 1) - im(i - 1, j - 1) - im(i - 1, j + 1) - im(i + 1, j - 1);
end