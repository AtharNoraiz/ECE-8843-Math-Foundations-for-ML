function b2 = funcb2(t)

% This function calculates the b2(t) according to the question based on the
% values of t.

if (t >=-1.5) && (t<=-0.5)
    b2 = ((t + 1.5)^2)/2;
 else if (t>=-0.5) && (t<=0.5)
        b2 = 0.75 - (t^2);
    else if (t>=0.5) && (t<=1.5) 
            b2 = ((t- 1.5)^2)/2;
        else
             b2 = 0;
        end
     end
end
end






 












