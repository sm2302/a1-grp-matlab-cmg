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