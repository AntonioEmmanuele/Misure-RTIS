% Indice degli elementi
actual=1;
mx=2;
min=3;
avg=4;
%Latenza è in nanosecondi
period100_ns=100*1000;
period1000_ns=1000*1000;

%CFG BASE

%Cache
base_Cache_100=[9871   451428008   4388   87673.619081];
base_Cache_1000=[22918   540306721   8566   180745.856396];
%VM
base_Vm_100=[8583   539894004   4849   182044.784922];
base_Vm_1000=[25768   451297373   8042   101440.984539];
%Load
base_Load_100=[8987  , 540061825  , 4446  , 113777.958492];
base_Load_1000=[24550   538844309   7467   220163.136129];
%context
base_context_100=[13431   15880558   5508   19891.523093];
base_context_1000=[29006   14962404   8087   21727.518760];
%No Stress
base_noStress_100=[11832   880689   10035   11804.417858];
base_noStress_1000=[19545   746468   9933   12794.044589];

base_mx_lat_100=max( [base_Cache_100(mx),base_Vm_100(mx),base_Load_100(mx),...
base_context_100(mx) ,base_noStress_100(mx)]);

base_mx_lat_1000=max([base_Cache_1000(mx),base_Vm_1000(mx),base_Load_1000(mx),...
base_context_1000(mx) ,base_noStress_1000(mx)]);

base_perc100_lat=(period100_ns+base_mx_lat_100)/period100_ns;
base_perc1000_lat=(period1000_ns+base_mx_lat_1000)/period1000_ns;
%CFG ll

%Cache
ll_Cache_100=[15148   228358   10242   14049.615277];
ll_Cache_1000=[30890   273455   10453   30444.330885];
%VM
ll_Vm_100=[11837   1263133   9787   12417.257120];
ll_Vm_1000=[15287   1627058   10208   22164.733858];
%Load
ll_Load_100=[11873   685338   9988   11837.593723];
ll_Load_1000=[10524   746343   9828   13548.603589];
%context
ll_context_100=[12776   755686   10482   12413.938665];
ll_context_1000=[13123   831709   10152   13795.928469];
%No Stress
ll_noStress_100=[11832   880689   10035   11804.417858];
ll_noStress_1000=[19545   746468   9933   12794.044589];

ll_mx_lat_100=max([ll_Cache_100(mx),ll_Vm_100(mx),ll_Load_100(mx),...
ll_context_100(mx) ,ll_noStress_100(mx)]);

ll_mx_lat_1000=max([ll_Cache_1000(mx),ll_Vm_1000(mx),ll_Load_1000(mx),...
ll_context_1000(mx) ,ll_noStress_1000(mx)]);

ll_perc100_lat=(period100_ns+ll_mx_lat_100)/period100_ns;
ll_perc1000_lat=(period1000_ns+ll_mx_lat_1000)/period1000_ns;

%CFG Preempt

%Cache
Preempt_Cache_100=[16141   191410   10951   14985.035327];
Preempt_Cache_1000=[34622   186830   11907   31718.911010];
%VM
Preempt_Vm_100=[12567   288570   10422   12852.009032];
Preempt_Vm_1000=[24104   351878   11503   21345.328429];
%Load
Preempt_Load_100=[15966   206816   9695   12487.052397];
Preempt_Load_1000=[14178   155838   11464   15507.014515];
%context
Preempt_context_100=[12394   242055   10320   12723.896520];
Preempt_context_1000=[13240   200168   11318   15585.227426];
%No Stress
Preempt_noStress_100=[15699   195240   10239   12134.251149];
Preempt_noStress_1000=[12605   160660   11312   14122.422969];

Preempt_mx_lat_100=max([Preempt_Cache_100(mx),Preempt_Vm_100(mx),Preempt_Load_100(mx),...
Preempt_context_100(mx) ,Preempt_noStress_100(mx)]);

Preempt_mx_lat_1000=max([Preempt_Cache_1000(mx),Preempt_Vm_1000(mx),Preempt_Load_1000(mx),...
Preempt_context_1000(mx) ,Preempt_noStress_1000(mx)]);

Preempt_perc100_lat=(period100_ns+Preempt_mx_lat_100)/period100_ns;
Preempt_perc1000_lat=(period1000_ns+Preempt_mx_lat_1000)/period1000_ns;

% Plotting delle figure

figure(1);
bar([100,1000],[[ ll_perc100_lat, ll_perc1000_lat]; ...
    [ Preempt_perc100_lat, Preempt_perc1000_lat]]);
xlabel("Period  in Us");
legend("Low Latency","PreemptRT");

%Cache  
figure(2);
bar([100,1000],[[ll_Cache_100(mx),...
    Preempt_Cache_100(mx)];[ll_Cache_1000(mx),...
    Preempt_Cache_1000(mx)]]);
xlabel("Period  in Us");
legend("Low Latency","PreemptRT");

figure(3);
bar([[ll_Cache_100(avg),...
    Preempt_Cache_100(avg)];[ll_Cache_1000(avg),...
    Preempt_Cache_1000(avg)]]);
xlabel("Period  in Us");
legend("Low Latency","PreemptRT");

%Vm  
figure(4);
bar([100,1000],[[ll_Vm_100(mx),...
    Preempt_Vm_100(mx)];[ll_Vm_1000(mx),...
    Preempt_Vm_1000(mx)]]);
xlabel("Period  in Us");
legend("Low Latency","PreemptRT");

figure(5);
bar([[ll_Vm_100(avg),...
    Preempt_Vm_100(avg)];[ll_Vm_1000(avg),...
    Preempt_Vm_1000(avg)]]);
xlabel("Period  in Us");
legend("Low Latency","PreemptRT");

%context  
figure(6);
bar([100,1000],[[ll_context_100(mx),...
    Preempt_context_100(mx)];[ll_context_1000(mx),...
    Preempt_context_1000(mx)]]);
xlabel("Period  in Us");
legend("Low Latency","PreemptRT");

figure(7);
bar([[ll_context_100(avg),...
    Preempt_context_100(avg)];[ll_context_1000(avg),...
    Preempt_context_1000(avg)]]);
xlabel("Period  in Us");
legend("Low Latency","PreemptRT");

%Load  
figure(8);
bar([100,1000],[[ll_Load_100(mx),...
    Preempt_Load_100(mx)];[ll_Load_1000(mx),...
    Preempt_Load_1000(mx)]]);
xlabel("Period  in Us");
legend("Low Latency","PreemptRT");

figure(9);
bar([[ll_Load_100(avg),...
    Preempt_Load_100(avg)];[ll_Load_1000(avg),...
    Preempt_Load_1000(avg)]]);
xlabel("Period  in Us");
legend("Low Latency","PreemptRT");

%noStress  

%noStress  
figure(10);
bar([100,1000],[[ll_noStress_100(mx),...
    Preempt_noStress_100(mx)];[ll_noStress_1000(mx),...
    Preempt_noStress_1000(mx)]]);
xlabel("Period  in Us");
legend("Low Latency","PreemptRT");

figure(11);
bar([[ll_noStress_100(avg),...
    Preempt_noStress_100(avg)];[ll_noStress_1000(avg),...
    Preempt_noStress_1000(avg)]]);
xlabel("Period  in Us");
legend("Low Latency","PreemptRT");

