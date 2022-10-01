%%%%
%Conway's Game of Life

%%%Rand Seed
size_of_game = 100;
mylife = round(rand(size_of_game,size_of_game));
%mylife = [0 0 0 0 0;0 0 0 0 0;0 1 1 1 0;0 0 0 0 0;0 0 0 0 0];

%%%Plot

while 1%for ll = 1:100
  axis([-size_of_game size_of_game -size_of_game size_of_game])
  clc;
  spy(mylife)
  grid on
  %Propagate
  newlife = mylife;
  for ii = 1:size_of_game
    si = ii-1;
    ei = ii+1;
    veci = si:ei;
    veci(veci==0)=size_of_game;
    veci(veci==size_of_game+1)=1;
  for jj = 1:size_of_game  
      sj = jj-1;
      ej = jj+1;
      vecj = sj:ej;
      vecj(vecj==0)=size_of_game;
      vecj(vecj==size_of_game+1)=1;
      num_neighbours = sum(sum(mylife(veci,vecj)))-mylife(ii,jj);
      if mylife(ii,jj)
          %Any live cell with fewer than two live neighbours dies (underpopulation).
          if num_neighbours < 2
              newlife(ii,jj) = 0;
          end
          %Any live cell with two or three live neighbours lives on to the next generation.
           if num_neighbours == 2 || num_neighbours == 3
               newlife(ii,jj) = 1;
           end
          %Any live cell with more than three live neighbours dies (overpopulation).
          if num_neighbours > 3
              newlife(ii,jj) = 0;
          end
     else
          %Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
          if num_neighbours == 3
              newlife(ii,jj) = 1;
          end
      end
    end
  end
  drawnow
  pause(0.05)
  mylife = newlife;
end

_____________________________________________________________________
%% PEER REVIEW

% Code solution: output = 10/10

% All codes run smoothly, and every line contributes to the output of the game.
% Very beautiful visuals.

% Code solution: context = 6/10

% Majority of the lines does not consists of comments.
% Some comments are very vague (e.g. mylife = [0 0 0 0 0;0 0 0 0 0;0 1 1 1 0;0 0 0 0 0;0 0 0 0 0];) maybe requires further explanation

% Code solution: figures = 9/10

% Very unique labelling. Perhaps if the labels can mean something, it is more understandable in a glance.
% e.g.: instead of labeling as sj, you can label it sizej probably

% Creativity = 3/5

% Consistent use of 'for' loop
% But ability to add elements such as: 
%  newlife = mylife;
%  for ii = 1:size_of_game
%    si = ii-1;
%    ei = ii+1;
%    veci = si:ei;
%    veci(veci==0)=size_of_game;
%    veci(veci==size_of_game+1)=1;
% This is a unique element

% Code styling = 2/5

% Repetitive use of 'for' loops

% Ability to follow instructions = 3/5

% The instruction requests for codes that does not include too much 'for' loops however this one is using 'for' loops in two sections of the codes. However, good use in sprand()

% Use of GitHub = 3/5

% Only uses upload feature and edited once.
% However, useful screenshots of the game is shown, which is useful to see.

% TOTAL MARKS: 36/50
