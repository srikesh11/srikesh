function dwdt = dcmot(t,w,Kt,Ke,b,J,V,R,T)
    E = Ke*w;
    I = (V-E)/R;
    dwdt = (Kt*I - T - b*w)/J;
end
