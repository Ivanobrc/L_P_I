//Funcion  edsonj.sce modificada
function xdot=edsonj(u1,u2,u3,u4,u5)
// Se a modificado para tener el modelo de péndulo no lineal

// Cardar datos
exec('edsonjParameters.sce', -1);

// Variables de estado
x=u1;		
v=u2;
theta=u3;
vtheta=u4;

// Variable de control
F=u5;	// fuerza


// Modelo MoDiCA-X
//Estado 1 Posicion del carro respecto a superficie fija
e1dot= v;
//Estado 2 Velocidad lineal del carro respecto a posicion
e2dot= ((F*(I+m*l^2))/((M+m)*(I+m*l^2)-(m^2*l^2*(cos(theta))^2)))-...
        ((v*b*(I+m*l^2))/((M+m)*(I+m*l^2)-(m^2*l^2*(cos(theta))^2)))+...
((m^2*l^2*g*sin(theta)*cos(theta))/((M+m)*(I+m*l^2)-(m^2*l^2*(cos(theta))^2)))+...
((m*l*vtheta^2*sin(theta)*(I+m*l^2))/((M+m)*(I+m*l^2)-(m^2*l^2*(cos(theta))^2)));
//Estado 3 Angulo theta de la vara del pendulo respecto a la vertical
e3dot= vtheta;
//Estado 4 Velocidad Angular respecto del angulo
e4dot= -((m*l*cos(theta)*F)/((M+m)*(I+m*l^2)-(m^2*l^2*(cos(theta))^2)))+...
        ((v*b*m*l*cos(theta))/((M+m)*(I+m*l^2)-(m^2*l^2*(cos(theta))^2)))-...
        ((m^2*l^2*vtheta^2*sin(theta)*cos(theta))/((M+m)*(I+m*l^2)-(m^2*l^2*(cos(theta))^2)))-...
        ((m*g*l*(M+m)*sin(theta))/((M+m)*(I+m*l^2)-(m^2*l^2*(cos(theta))^2)));

//Salida 
xdot =[e1dot;e2dot;e3dot;e4dot]; 
endfunction

