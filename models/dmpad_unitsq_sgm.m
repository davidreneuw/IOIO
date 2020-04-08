function [logp, yhat, res] = dmpad_unitsq_sgm(r, infStates, ptrans)
% Calculates the log-probability of response y=1 under the unit-square sigmoid model
%
% --------------------------------------------------------------------------------------------------
% Copyright (C) 2012-2013 Christoph Mathys, TNU, UZH & ETHZ
%
% This file is part of the HGF toolbox, which is released under the terms of the GNU General Public
% Licence (GPL), version 3. You can redistribute it and/or modify it under the terms of the GPL
% (either version 3 or, at your option, any later version). For further details, see the file
% COPYING or <http://www.gnu.org/licenses/>.

% Transform zeta to its native space
ze1 = tapas_sgm(ptrans(1),1);
ze2 = exp(ptrans(2));
ze = ze2;

% Initialize returned log-probabilities as NaNs so that NaN is
% returned for all irregualar trials
n = size(infStates,1);
logp = NaN(n,1);
yhat = NaN(n,1);
res  = NaN(n,1);

% Weed irregular trials out from inferred states and responses
mu1hat = infStates(:,1,1);
mu1hat(r.irr) = [];
c = r.u(:,2);
c(r.irr) = [];
y = r.y(:,1);
y(r.irr) = [];

% Avoid any numerical problems when taking logarithms close to 1
x = ze1.*mu1hat + (1-ze1).*c;
logx = log(x);
log1pxm1 = log1p(x-1);
logx(1-x<1e-4) = log1pxm1(1-x<1e-4);
log1mx = log(1-x);
log1pmx = log1p(-x);
log1mx(x<1e-4) = log1pmx(x<1e-4);

% Calculate log-probabilities for non-irregular trials
reg = ~ismember(1:n,r.irr);
logp(reg) = y.*ze.*(logx -log1mx) +ze.*log1mx -log((1-x).^ze +x.^ze);
yhat(reg) = x;
res(reg) = (y-x)./sqrt(x.*(1-x));

return;
