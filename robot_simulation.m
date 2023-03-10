
clear MM
%%Data simulation code
figure
xlabel('X axis (m)')
ylabel('Y axis (m)')
% Define the points for the triangle
triangle_points = [0 0; 2 0; 1 1];

x0 = [0 1 0.5];
y0 = [0 0 1];
z0 = [0 0 0];







cam=[1:length(x.data)]

for i=1:length(x.data)
    % Rotate the triangle points by theta
    R = [cos(theta.data(i)) -sin(theta.data(i)); sin(theta.data(i)) cos(theta.data(i))];
    rotated_points = triangle_points*R ;
    
    % Translate the rotated points to the x and y position
    translated_points = rotated_points + [x.data(i) y.data(i)];
    
    % Plot the triangle at the current position
    % Create a triangular mesh
    tri = delaunay(translated_points(:,1),translated_points(:,2));

% Plot the triangle
    triplot(tri, translated_points(:,1), translated_points(:,2));
    %hold on
    %scatter([x.data(i)],[y.data(i)],1000,'k','d','LineWidth',2)
    %hold off
    xlim([0 max(x.data)+1])
    ylim([0 max(y.data)+1])
    grid on
    xlabel('X axis (m)', 'FontSize', 14);
    ylabel('Y axis (m)', 'FontSize', 14);
    legend('Simulated differential robot', 'FontSize', 14)
    pause(0.4)
    MM(i)=getframe(gcf);
end


drawnow;

v = VideoWriter('animation.mp4','MPEG-4');
open(v)
writeVideo(v,MM)
close(v)
