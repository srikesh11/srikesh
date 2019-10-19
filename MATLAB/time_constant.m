function tc = time_constant(t,r)
    r_tc = (63.2/100)*max(r); %corresponding value of rpm at time constant is 63.2% of peak value

    for i=1:length(r)
        if(r(i)==r_tc)
            index = i;
            break;
        end
    end
    
    tc = t(index)
end
