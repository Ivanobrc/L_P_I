// Comparacion de modelo linealizado por software y modelo linealizado analiticamente
// Cargar datos de modelo de software
load("edsonjLTI.sod","X","U","sys")
// Cargar datos de modelo analico
load("edsonjLTIanalitPendulo.sod","sysa")

// Obtener la matrices A,B,C,D
A=sys.A
B=sys.B
C=sys.C
D=sys.D

AA=sysa.A
BB=sysa.B
CC=sysa.C
DD=sysa.D

// Controlabilidad y observabilidad
// Cc=[B, AB, A^2 B,..., A^(n-1) B]
Cc = cont_mat(A,B)
rankCc=rank(Cc)
//
// O=[C; CA; CA^2;...; CA^(n-1) ]
O = obsv_mat(A, C)
rankO=rank(O)
// verificar si el rango de Cc es n, dimensión de un
// verificar si el rango de O es n, dimensión de un
/* Trazar valores singulares de LTI el modelo */
G = syslin('c', A, B, C, D);
tr = trzeros(G)
w = logspace(-3,3);
sv = svplot(G,w);

//valores analiticos
Ga = syslin('c', AA, BB, CC, DD);
tra = trzeros(Ga)
wa = logspace(-3,3);
sva = svplot(Ga,wa);
scf(1);
plot2d("ln", w, [20*log(sv')/log(10) 20*log(sva')/log(10)],leg="Caso Soft@Caso Analitico")
xgrid(12)
xtitle("Valores singulares","Frecuencia (rad/s)", "Amplitud (dB)");
/* Scaling */

//Obtenciion de los polors  zeros del modelo de software
scf(2);
plzr(sys);

//Obtencion de los polos  zeros del modelo analitico
scf(3);
plzr(sysa);

//Obtencion de las funciones de transferencia
[h]=ss2tf(sys)

[hA]=ss2tf(sysa)
//Bode de amplitud y fase del modelo de software
scf(4);
bode(h);
//Bode de amplitud y fase del modelo de analitico
scf(5);
bode(hA);


