% Import the data with import data
function [total_noise_per_instance,cpu_available_per_istance,max_noise_per_instance,hw_counter,nmi_counter,irq_counter,...
    softIRQ_counter,thds_counter] = osnoise_parser(osnoisetable,n_start)
    total_noise_per_instance=table2array(osnoisetable(:,6));
    cpu_available_per_istance=table2array(osnoisetable(:,7));
    max_noise_per_instance=table2array(osnoisetable(:,8));
    hw_counter=table2array(osnoisetable(:,9));
    nmi_counter=table2array(osnoisetable(:,10));
    irq_counter=table2array(osnoisetable(:,11));
    softIRQ_counter=table2array(osnoisetable(:,12));
    thds_counter=table2array(osnoisetable(:,13));
    % Remove the first n dirties entries
    total_noise_per_instance=total_noise_per_instance(n_start:end);
    cpu_available_per_istance=cpu_available_per_istance(n_start:end);
    max_noise_per_instance=max_noise_per_instance(n_start:end);
    hw_counter=hw_counter(n_start:end);
    nmi_counter=nmi_counter(n_start:end);
    irq_counter=irq_counter(n_start,end);
    softIRQ_counter=softIRQ_counter(n_start:end);
    thds_counter=thds_counter(n_start:end);
end

