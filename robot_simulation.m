%%Data simulation code
figure
xlabel('X axis (m)')
ylabel('Y axis (m)')
cam=[1:length(x.data)]

for i=1:length(x.data)
    scatter([x.data(i)],[y.data(i)],1000,'k','d','DisplayName','Simulated drone','LineWidth',2)
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
