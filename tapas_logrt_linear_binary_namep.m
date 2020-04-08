function pstruct = tapas_logrt_linear_binary_namep(pvec)
% --------------------------------------------------------------------------------------------------
% Copyright (C) 2016 Christoph Mathys, TNU, UZH & ETHZ
%
% This file is part of the HGF toolbox, which is released under the terms of the GNU General Public
% Licence (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.

pstruct = struct;

pstruct.ze1 = pvec(1);
pstruct.ze2 = pvec(2);
pstruct.be0 = pvec(3);
pstruct.be1 = pvec(4);
pstruct.be2 = pvec(5);
pstruct.be3 = pvec(6);
pstruct.be4 = pvec(7);
pstruct.ze3  = pvec(8);

return;
