function myui
global NIVEL NUMERO_JUGADOR J_1 J_2
NUMERO_JUGADOR = 0;
J_1 = 0;
J_2 = 0;
NIVEL=100;
close('all');
figure('Color',[1 1 1]);

clf;
im=imread('Portada_4er.jpg');
image(im);
axis('off');
%nodither('save');
%savtoner('save');
% Create push button
hlp = uicontrol('Style', 'pushbutton', 'String', 'AYUDA',...
    'Position', [20 350 60 20],...
    'Callback', 'type ayuda.txt');

% Create push button
btn = uicontrol('Style', 'pushbutton', 'String', 'SALIR',...
    'Position', [20 20 50 20],...
    'Callback', 'beep;close all');

% Create push button
JUGAR = uicontrol('Style', 'pushbutton', 'String', 'JUGAR',...
    'Position', [100 20 50 20],...
    'Callback', 'j4e;');

% Create slider
txt = uicontrol('Style', 'text','String','NIVEL',...
    'Position', [400 50 120 20]);

sld = uicontrol('Style', 'slider',...
    'Min',1,'Max',6000,'Value',2000,...
    'Position', [400 20 120 20],...
    'Callback', @capt_nivel);

%Create CheckBox
chb=uicontrol('style','checkbox','units','pixels',...
                'position',[170,22,180,20],'String','JUGADOR VERDE PRIMERO','Callback',@cc);
chbp1=uicontrol('style','checkbox','units','pixels',...
                'position',[10,220,160,20],'String','JUGADOR VERDE MAQUINA','Callback',@ccp1);
chbp2=uicontrol('style','checkbox','units','pixels',...
                'position',[10,240,160,20],'String','JUGADOR ROJO MAQUINA','Callback',@ccp2);



end

function cc(source,event)
% Es necesario declarar como global cada variable global que se desee
% utilizar en una funci�n.
global NUMERO_JUGADOR
NUMERO_JUGADOR=get(source,'Value');
end

function ccp1(source,event)
% Es necesario declarar como global cada variable global que se desee
% utilizar en una funci�n.
global J_1
J_1=get(source,'Value');
J_1 = J_1;
end

function ccp2(source,event)
% Es necesario declarar como global cada variable global que se desee
% utilizar en una funci�n.
global J_2
J_2=get(source,'Value');
J_2 = J_2;
end

function capt_nivel(source,event)
global NIVEL
NIVEL = round(get(source,'Value'));
end