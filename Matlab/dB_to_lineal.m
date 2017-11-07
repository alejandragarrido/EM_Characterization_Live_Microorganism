%%Script to plot S21 linear.
freq = FreqGHz*10^9;
S12 = 10.^(dBS12./10);
figure
plot(freq, S12);