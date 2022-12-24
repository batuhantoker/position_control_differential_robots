function [v, w] = controller(rho,alpha,beta,kp,ka,kb)


v =kp*rho;
w = ka*alpha + kb*beta;
alphak=alpha;
rhos=rho;
%%
function [rhod,alphad,betad] = plant(v, w, alpha,rho)

if -pi<alpha<-pi/2
    v1=v;
    w1=w;
else
        if pi/2<alpha<pi
        v1=v;
        w1=w;
            else
            v1=-v;
            w1=-w;
        end

end
    rhod = cos(alpha)*v1;
    alphad = -sin(alpha)*v1/rho+w1;
    betad = sin(alpha)*v1/rho;
%%
function [x,y,theta] = motiontrajecktory(rho,alpha,beta)
theta=-beta-alpha;
x=rho*cos(theta+alpha);
y=rho*sin(theta+alpha);

