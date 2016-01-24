

%Independent component analysis

%  [Y,W,P] = ica(X,G,opts)

% 

%Input parameters

%  X    : Matrix with original components in the columns.

%  G    : Nonlinearity used in nongaussianity estimate: (optional)

%           'kurt'   G(y) = y^4             

%           'cosh'   G(y) = log(cosh(y))

%           'gauss'  G(y) = -exp(-1/2*y^2)     (default)

%  opts : Vector with three elements. The first two are used in stopping

%         criteria for each component: (optional)

%           Number of iterations>opts(1) or

%           1-abs(w'*wOld)<opts(2). (Dot product close to 1).

%         opts(3) decides how decorrelation is performed. If the difference

%         (one-norm) between two rows in W is less than or equal to opts(3),

%         one of them is replaced by a decorrelated version. Use opts(3)=inf

%         to decorrelate after all iterations. Decorrelation gives less

%         nongaussianity, but prevent two components from being equal.

%         Default is opts = [100,10e-6,1]

%

%Output parameters

%  Y : Matrix with independent components in the columns.

%  W : Transformation matrix so that Y = (W*X')'

%  P : Convergence. Sum of abs(w'*wOld) for all components in all iterations.

%

%2002-12-04 | Michael Vinther | mv@logicnet.dk

function [Y,W,P] = ica(X,G,opts)

 

if nargin<2

  G = 'gauss';

end 

if nargin<3

  opts = [100,10e-6,1];

end 

 

[Xw WhiteT Xc V D] = decorrelate(X);

 

% Select G

switch lower(G)

  case 'skew'

    g = inline('x.^2');

    gg = inline('2*x');

  case 'kurt'

    g = inline('x.^3'); 

    gg = inline('3*x.^2');
   
  case 'kurt2'

    g = inline('x.^4'); 

    gg = inline('4*x.^3');

  case 'cosh'

    g = inline('tanh(x)'); 

    gg = inline('1-tanh(x).^2');

  case 'gauss'

    g = inline('x.*exp(-0.5*x.^2)');

    gg = inline('exp(-0.5*x.^2)-x.^2.*exp(-0.5*x.^2)');

  otherwise

    error('Illegal value for G');

end

 

% Estimate W by FastICA

if nargout>2

  [Ww,P] = FastICA1(Xw,opts,g,gg);

else

  Ww = FastICA1(Xw,opts,g,gg);

end 

 

% Reconstruct

W = Ww*WhiteT;

Y = (W*X')';


