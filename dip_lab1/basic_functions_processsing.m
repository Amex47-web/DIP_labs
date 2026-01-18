clc;                % Clear Command Window
clear all;          % Remove all variables from workspace
close all;          % Close all open figure windows


% Create an 8x8 matrix with random values between 0 and 255
% Stored as unsigned 8-bit integers (like image pixel values)
A = uint8(randi([0 255], 8, 8));


% Read the RGB image from the specified file path
I = imread("C:\Users\student\Pictures\Screenshots\Screenshot 2024-09-10 113757.png");

% Display the original color image
imshow(I);
title('Original RGB Image');


% Create a new figure window
figure();

% Convert the RGB image to grayscale
Ig = rgb2gray(I);

% Display the grayscale image
imshow(Ig);
title('Grayscale Image');


% Create a new figure window
figure();

% Perform histogram equalization to enhance image contrast
Ieq = histeq(Ig);

% Display the contrast-enhanced image
imshow(Ieq);
title('Histogram Equalized Image');


% Create a new figure window
figure();

% Convert grayscale image to black and white using a fixed threshold
% Pixels > 128 become white (1), others become black (0)
bw = Ig > 128;

% Display the binary (black and white) image
imshow(bw);
title('Black and White Image');


% Create a new figure window
figure();

% Extract the red channel by setting green and blue channels to zero
Ired = I;
Ired(:,:,2) = 0;    % Remove green channel
Ired(:,:,3) = 0;    % Remove blue channel

% Display the red-channel image
imshow(Ired);
title('Red Channel Image');
