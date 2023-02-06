%Base
[total_noise_per_instance_BASE,cpu_available_per_istance_BASE,max_noise_per_instance_BASE,hw_counter_BASE, ...
    nmi_counter_BASE,irq_counter_BASE,softIRQ_counter_BASE,thds_counter_BASE]=osnoise_parser(osnoisecfgbase,50);
%LL
[total_noise_per_instance_LL,cpu_available_per_istance_LL,max_noise_per_instance_LL,hw_counter_LL, ...
    nmi_counter_LL,irq_counter_LL,softIRQ_counter_LL,thds_counter_LL]=osnoise_parser(osnoiselowlat,1);

%Preempt
[total_noise_per_instance_Preempt,cpu_available_per_istance_Preempt,max_noise_per_instance_Preempt,hw_counter_Preempt, ...
    nmi_counter_Preempt,irq_counter_Preempt,softIRQ_counter_Preempt,thds_counter_Preempt]=osnoise_parser(osnoisepreempt,1);

names=["As Is","LowLat","LowLatPreempt"];
x=[1,2,3];

% Min CPUS
mins_CPU=[min(cpu_available_per_istance_BASE),min(cpu_available_per_istance_LL),min(cpu_available_per_istance_Preempt)];
figure(1);
hold on;
bar(1,mins_CPU(1),0.4,"grouped","yellow");
%legend("As Is");
bar(2,mins_CPU(2),0.4,"grouped","red");
%legend("LowLat");
bar(3,mins_CPU(3),0.4,"grouped","green");
legend("As Is","LowLat","PreemptLowLat");
hold off;

mean_CPU=[mean(cpu_available_per_istance_BASE),mean(cpu_available_per_istance_LL),mean(cpu_available_per_istance_Preempt)];
figure(2);
hold on;
bar(1,mean_CPU(1),0.4,"grouped","yellow");
%legend("As Is");
bar(2,mean_CPU(2),0.4,"grouped","red");
%legend("LowLat");
bar(3,mean_CPU(3),0.4,"grouped","green");
legend("As Is","LowLat","PreemptLowLat");
hold off;

% Max Noise

total_noise=[max(total_noise_per_instance_BASE),max(total_noise_per_instance_LL),max(total_noise_per_instance_Preempt)];
figure(3);

hold on;
bar(1,total_noise(1),0.4,"grouped","yellow");
%legend("As Is");
bar(2,total_noise(2),0.4,"grouped","red");
%legend("LowLat");
bar(3,total_noise(3),0.4,"grouped","green");
legend("As Is","LowLat","PreemptLowLat");
hold off;

total_noise=[mean(total_noise_per_instance_BASE),mean(total_noise_per_instance_LL),mean(total_noise_per_instance_Preempt)];
figure(4);
hold on;
bar(1,total_noise(1),0.4,"grouped","yellow");
%legend("As Is");
bar(2,total_noise(2),0.4,"grouped","red");
%legend("LowLat");
bar(3,total_noise(3),0.4,"grouped","green");
legend("As Is","LowLat","PreemptLowLat");
hold off;

% Resources 

hw_counters=[max(hw_counter_BASE) max(hw_counter_LL) max(hw_counter_Preempt)];
nmi_counters=[max(nmi_counter_BASE) max(nmi_counter_LL) max(nmi_counter_Preempt)];
irq_counters=[max(irq_counter_BASE) max(irq_counter_LL) max(irq_counter_Preempt)];
sIRQ_counters=[max(softIRQ_counter_BASE) max(softIRQ_counter_LL) max(softIRQ_counter_Preempt)];
thds_counters=[max(thds_counter_BASE) max(thds_counter_LL) max(thds_counter_Preempt)];
counters= [hw_counters; nmi_counters;irq_counters;sIRQ_counters;thds_counters];
figure(5);

bar(counters,0.4);
xlabel("1=HW 2=NMI 3=IRQs 4=softIRQs 5=Thds");
legend("As Is","LowLat","PreemptLowLat");

total_noise_per_instance_Preempt=total_noise_per_instance_Preempt(1:5277);
%kstest2(total_noise_per_instance_LL,total_noise_per_instance_Preempt);
figure(6);
plot(total_noise_per_instance_Preempt-total_noise_per_instance_LL,'.');
max_noise_per_instance_Preempt=max_noise_per_instance_Preempt(1:5277);
diff=max_noise_per_instance_Preempt-max_noise_per_instance_LL;
positive_ctr=0;
negative_ctr=0;
for i=1:length(diff)
    if diff(i)>0
        positive_ctr=positive_ctr+1;
    else
        negative_ctr=negative_ctr+1;
    end

end
disp((positive_ctr/length(diff))*100);
disp((negative_ctr/length(diff))*100)