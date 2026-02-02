% Arithmetic Coding Demonstration (NO TOOLBOX REQUIRED)
clc;
clear;
close all;

I = imread('Hitler.jpg');

if size(I,3) == 3
    I = rgb2gray(I);
end

figure;
imshow(I);
title('Grayscale Image');

% ---- Histogram ----
counts = histcounts(I(:), 0:256);
counts = counts(:);

% ---- Probability calculation ----
p = counts / sum(counts);

symbols = find(p > 0) - 1;
p = p(p > 0);

% ---- Cumulative probabilities ----
cumProb = cumsum(p);
low = [0; cumProb(1:end-1)];
high = cumProb;

% ---- Take a small sequence for demo ----
sequence = symbols(1:10);

L = 0;
H = 1;

for k = 1:length(sequence)
    sym = sequence(k);
    idx = find(symbols == sym);

    range = H - L;
    H = L + range * high(idx);
    L = L + range * low(idx);
end

code = (L + H) / 2;

disp("Arithmetic Coding Output:");
fprintf("Final Lower Bound = %.10f\n", L);
fprintf("Final Upper Bound = %.10f\n", H);
fprintf("Encoded Tag Value = %.10f\n", code);
