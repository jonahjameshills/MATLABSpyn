
%brick.MoveMotor('A',100);
%pause(5);
%brick.StopMotor('A');

brick.ResetMotorAngle('A');

brick.MoveMotorAngleRel('A',25,45,'Brake');