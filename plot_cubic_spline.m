function plot_cubic_spline(x,s0,s1,s2,s3)
%PLOT_CUBIC_SPLINE Plot a cubic spline given the spline coefficients
%
%   plot_cubic_spline(x, s0, s1, s2, s3) plots a cubic spline given the
%   spline coefficients s0, s1, s2, and s3. The input x is a vector of the
%   x-coordinates of the spline's control points.
%
%   Inputs:
%       x   - a vector of the x-coordinates of the spline's control points
%       s0  - a vector of the y-coordinates of the spline's control points
%       s1  - a vector of the first derivatives of the spline at each control point
%       s2  - a vector of the second derivatives of the spline at each control point
%       s3  - a vector of the third derivatives of the spline at each control point
%
%   Outputs:
%       None
%
%   Example:
%       x = [0, 1, 2, 3, 4];
%       y = [0, 1, 0.5, 2, 3];
%       [s0, s1, s2, s3] = cubic_spline(x, y);
%       plot_cubic_spline(x, s0, s1, s2, s3);
%

n = length(x);

if any(diff(x) < 0)
    error('Input x must be sorted in ascending order.');
end

inner_points = 20;

for i=1:n-1
   xx = linspace(x(i),x(i+1),inner_points);
   xi = repmat(x(i),1,inner_points);
   yy = s0(i) + s1(i)*(xx-xi) + ... 
     s2(i)*(xx-xi).^2 + s3(i)*(xx - xi).^3;
   plot(xx,yy,'b')
   plot(x(i),0,'r');
end
end