clc
clear all;
close all;
[filename,pathname] = uigetfile ('*.*','Escolha o arquivo de audio');
[y,fs] = audioread(num2str(filename));

[M,N] = size(y);

if N == 1
    error('há apenas uma faixa de áudio');
elseif N > 2
    error ('há mais de duas faixas de áudio');
end

left_channel = y(:,1);
right_channel = y(:,2);
instrumental = left_channel - right_channel;

subplot(221)
plot(y);
title ('música original');
subplot (222)
plot(left_channel);
title ('canal esquerdo');
subplot (223)
plot (right_channel);
title ('canal direito');
subplot (224)
plot (instrumental);
title ('instrumental');

audiowrite ('instrumental.wav', instrumental, fs);
