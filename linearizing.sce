// linearizing.sce

// Pasos antes
// 1. Abra edsonj.m y ejecútelo desde el editor "Ejecutar> archivo con eco".
// 2. Abra edsonjXcosLincos.zcos ejecute la simulación usando el botón "star".
// 3. Luego ejecuta este archivo
// Busca el SUPERBLOQUE en Xcos
for i=1:length(scs_m.objs)
    if typeof(scs_m.objs(i))=="Block" & scs_m.objs(i).gui=="SUPER_f" then
        scs_m = scs_m.objs(i).model.rpar;
        break;
    end
end

// Establecer el punto de equilibrio
X=[0.001;0.001;%pi;0.001];//Se modifico el numero de entradas y salidas
U=[0.001];

// linealiza el modelo
sys = lincos(scs_m,X,U);

// Obteniendo las matrices A, B, C, D
A=sys.A
B=sys.B
C=sys.C
D=sys.D

// Guardar datos
save("edsonjLTI.sod","X","U","sys") // Habilitamos el guardado de datos

// Cargar los datos
//load("edsonjLTI.sod","X","U","sys")

