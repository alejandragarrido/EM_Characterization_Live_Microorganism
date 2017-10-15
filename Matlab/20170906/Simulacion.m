classdef Simulacion
    %Simulacion
    %   We use this function to extract cell's permitivity, or their
    %   variation with a increment of distance/frequency.
    
    properties
        d1
        f
        Y11
        s
    end
    
    methods
        function  permitivity   = getPermitivy( Y11, Co, f)
            permitivity = -(Y11./(2*pi.*f.*Co)).*1i;
        end
        function Co = getCo(d1, s)
            Co = (8.85*10e-12*(s*s))./d1;
        end
    end
    
end

