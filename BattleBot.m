global key
InitKeyboard();

bWheels = 'B';
turnMotor = 'A'; 

turnSpeed = 50;
curSpeed = 100;

while 1
    pause(0.05);
    switch key
        case 'uparrow'
            brick.MoveMotor(bWheels,-curSpeed);
        case 'downarrow'
            brick.MoveMotor(bWheels,curSpeed);
        case 'leftarrow'
                brick.MoveMotorAngleRel(turnMotor,50,turnSpeed/2,'Brake');
        case 'rightarrow'
                brick.MoveMotorAngleRel(turnMotor,50,-turnSpeed/2,'Brake');
        case 0
            brick.StopMotor(bWheels);
        case 'q'
            brick.ResetMotorAngle(bWheels);
            brick.ResetMotorAngle(turnMotor);
            break;
    end
end

CloseKeyboard();