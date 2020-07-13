//Valores Linealizados analiticamente del pendulo

// Carga los parámetros
exec('edsonjParameters.sce', -1);

AA=[0 1 0 0;...
   0 -((b*(I+m*l^2))/((M+m)*(I+m*l^2)-m^2*l^2)) ((m^2*l^2*g)/((M+m)*(I+m*l^2)-m^2*l^2)) 0;...
   0 0 0 1;...
   0 -((b*m*l)/((M+m)*(I+m*l^2)-m^2*l^2)) ((m*g*l*(M+m))/((M+m)*(I+m*l^2)-m^2*l^2)) 0];
   
BB=[0;...
   ((I+m*l^2)/((M+m)*(I+m*l^2)-m^2*l^2));...
   0;...
   ((m*l)/((M+m)*(I+m*l^2)-m^2*l^2))];
   
CC=[1 0 0 0;
   0 0 1 0];
  
DD=[0;
   0];
   
sysa=syslin('c', AA, BB, CC, DD);
// Guardar datos
save("edsonjLTIanalitPendulo.sod","sysa")
