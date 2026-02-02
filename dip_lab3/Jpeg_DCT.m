clc;
clear all;
close all;

% Read image
I = imread('Hitler.jpg');
if size(I,3) == 3
    I = rgb2gray(I);        % Convert to grayscale
end
I = double(I);              % Convert to double

% JPEG quantization matrix
Q = [16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62;
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];

Q = Q * 10;                 % High compression factor
blockSize = 8;

[m,n] = size(I);
reconstructed = zeros(m,n);

% Manual DCT basis matrix
C = zeros(8,8);
for u = 0:7
    for x = 0:7
        if u == 0
            alpha = 1/sqrt(8);
        else
            alpha = sqrt(2/8);
        end
        C(u+1,x+1) = alpha * cos(((2*x+1)*u*pi)/16);
    end
end

% Block-wise JPEG processing
for i = 1:blockSize:(m-blockSize+1)
    for j = 1:blockSize:(n-blockSize+1)

        block = I(i:i+7,j:j+7) - 128;     % Level shift

        dctBlock = C * block * C';        % Forward DCT
        quantBlock = round(dctBlock ./ Q);
        dequantBlock = quantBlock .* Q;

        idctBlock = C' * dequantBlock * C; % Inverse DCT
        idctBlock = idctBlock + 128;

        reconstructed(i:i+7,j:j+7) = idctBlock;

    end
end

reconstructed = uint8(reconstructed);

figure; imshow(uint8(I)); title('Original Image');
figure; imshow(reconstructed); title('Reconstructed Image');
