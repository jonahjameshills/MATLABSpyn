
%UI (a figure window don't close it)
hf=figure('position',[0 0 eps eps],'menubar','none');

%Color names HAVE to be ALL lower-case
pickUp = "blue";    %Will change based on our pickup location
dropOff = "green";  %Will change based on our dropoff location
stopSign = "red";

brickName = "BRICK";    %Name of the EV3 Brick
nextMove;

%Color sensor stuff
sameColor = 0;  %A counter to check if we've seen the same color for awhile
curColor;
lastColor;

ignoreNextStop = false;
t = timer('timerFnc', 'ignoreNextStop = false;',...
                'StartDelay',3);

%-------------------- Essentially the main() --------------------
while(1)
    task = taskCheck();
    
    if((task == pickUp) || (task == dropOff))
        manualTakeOver();
    elseif((task == stopSign) && (ignoreNextStop == false))  
        pause(2);   %Stops for 2 seconds
        start(t);   %Start the timer
        ignoreNextStop = true;
    end    
    
    nextMove = checkNextMove();
    move(nextMove); %Figure out how to stop at stop signs
    
    if (strcmp(get(hf,'currentcharacter'),'q')))
          close(hf)
          break
    end
end

delete(t);
%----------------------------------------------------------------


%-------------------- Function Definitions --------------------
function[] = getColor() %Used to read the current color from sensor
    curColor = readColor(brickName);
    %Possible outputs:  none | black | blue | green | yellow
    %                   | red | white | brown
end

function[command] = taskCheck()
    getColor();
    if(curColor == lastColor)
        sameColor = sameColor + 1;
    else
        sameColor = 0;
    end
    lastColor = curColor;
    
    if(sameColor >= 5)  %May need to change this based on how fast the tic rate is
        command = curColor;
    else
        command = "none";
    end
end

function[] = manualTakeOver()
    % TODO: Implement the manual take over code, make sure to include a way
    %       to exit out and return.
end

function[nextMove] = checkNextMove()
    % TODO: This
    nextMove = "ERROR";
    
    %AI follows this pattern:   Left -> Forward -> Right -> Backward
    
    %if left is open return LEFT
    %elseif forward is open return FORWARD
    %elseif right is open return RIGHT
    %elseif backward is open return BACKWARD
    
    %else returns error
end

function[] = move(nextMove) %The general AI movement function (has all the AI stuff)
    % TODO: Do the AI Stuff
    
    if(nextMove == "ERROR")
        disp("Error :: No route available")
        return
    end
    
    %Might need a pause to compensate for the motor doing the task
end
%--------------------------------------------------------------


