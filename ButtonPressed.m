display('Push the button.') 
 
while brick.TouchPressed(1) == 0
    brick.playTone(5, 300, 500);
    pause(0.75);
end 
 
display('Done!') 
