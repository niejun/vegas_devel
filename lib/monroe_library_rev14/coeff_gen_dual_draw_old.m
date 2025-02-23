function coeff_gen_dual_draw(coeff, memory_type, bit_width, register_output)
% This is a generated function based on subsystem:
%     coeff_gen_plan/coeff_gen_dual
% Though there are limitations about the generated script, 
% the main purpose of this utility is to make learning
% Sysgen Script easier.
% 
% To test it, run the following commands from MATLAB console:
% cfg.source = str2func('coeff_gen_dual');
% cfg.toplevel = 'coeff_gen_plan/coeff_gen_dual';
% args = {my_coeff, my_bit_width, my_register_output, my_memory_type};
% xBlock(cfg, args);
% 
% You can edit coeff_gen_dual.m to debug your script.
% 
% You can also replace the MaskInitialization code with the 
% following commands so the subsystem will be generated 
% according to the values of mask parameters.
% cfg.source = str2func('coeff_gen_dual');
% cfg.toplevel = gcb;
% args = {coeff, bit_width, register_output, memory_type};
% xBlock(cfg, args);
% 
% To configure the xBlock call in debug mode, in which mode,
% autolayout will be performed every time a block is added,
% run the following commands:
% cfg.source = str2func('coeff_gen_dual');
% cfg.toplevel = gcb;
% cfg.debug = 1;
% args = {coeff, bit_width, register_output, memory_type};
% xBlock(cfg, args);
% 
% To make the xBlock smart so it won't re-generate the
% subsystem if neither the arguments nor the scripts are
% changes, use as the following:
% cfg.source = str2func('coeff_gen_dual');
% cfg.toplevel = gcb;
% cfg.depend = {'coeff_gen_dual'};
% args = {coeff, bit_width, register_output, memory_type};
% xBlock(cfg, args);
% 
% See also xBlock, xInport, xOutport, xSignal, xlsub2script.


%% inports
xlsub2_sync = xInport('sync');

%% outports
xlsub2_coeff = xOutport('coeff');

%% diagram

% block: coeff_gen_plan/coeff_gen_dual/Concat
xlsub2_Constant1_out1 = xSignal('xlsub2_Constant1_out1');
xlsub2_Counter_out1 = xSignal('xlsub2_Counter_out1');
xlsub2_Concat_out1 = xSignal('xlsub2_Concat_out1');
xlsub2_Concat = xBlock(struct('source', 'Concat', 'name', 'Concat'), ...
                       [], ...
                       {xlsub2_Constant1_out1, xlsub2_Counter_out1}, ...
                       {xlsub2_Concat_out1});

% block: coeff_gen_plan/coeff_gen_dual/Concat1
xlsub2_Constant4_out1 = xSignal('xlsub2_Constant4_out1');
xlsub2_Concat1_out1 = xSignal('xlsub2_Concat1_out1');
xlsub2_Concat1 = xBlock(struct('source', 'Concat', 'name', 'Concat1'), ...
                        [], ...
                        {xlsub2_Constant4_out1, xlsub2_Counter_out1}, ...
                        {xlsub2_Concat1_out1});

% block: coeff_gen_plan/coeff_gen_dual/Concat2
xlsub2_Reinterpret_out1 = xSignal('xlsub2_Reinterpret_out1');
xlsub2_Reinterpret1_out1 = xSignal('xlsub2_Reinterpret1_out1');
xlsub2_Concat2_out1 = xSignal('xlsub2_Concat2_out1');
xlsub2_Concat2 = xBlock(struct('source', 'Concat', 'name', 'Concat2'), ...
                        [], ...
                        {xlsub2_Reinterpret_out1, xlsub2_Reinterpret1_out1}, ...
                        {xlsub2_Concat2_out1});

% block: coeff_gen_plan/coeff_gen_dual/Constant
xlsub2_Constant_out1 = xSignal('xlsub2_Constant_out1');
xlsub2_Constant = xBlock(struct('source', 'Constant', 'name', 'Constant'), ...
                         struct('arith_type', 'Boolean', ...
                                'const', 0, ...
                                'explicit_period', 'on'), ...
                         {}, ...
                         {xlsub2_Constant_out1});

% block: coeff_gen_plan/coeff_gen_dual/Constant1
xlsub2_Constant1 = xBlock(struct('source', 'Constant', 'name', 'Constant1'), ...
                          struct('arith_type', 'Boolean'), ...
                          {}, ...
                          {xlsub2_Constant1_out1});

% block: coeff_gen_plan/coeff_gen_dual/Constant3
xlsub2_Constant3_out1 = xSignal('xlsub2_Constant3_out1');
xlsub2_Constant3 = xBlock(struct('source', 'Constant', 'name', 'Constant3'), ...
                          struct('const', 0, ...
                                 'n_bits', bit_width, ...
                                 'bin_pt', bit_width-1, ...
                                 'explicit_period', 'on'), ...
                          {}, ...
                          {xlsub2_Constant3_out1});

% block: coeff_gen_plan/coeff_gen_dual/Constant4
xlsub2_Constant4 = xBlock(struct('source', 'Constant', 'name', 'Constant4'), ...
                          struct('arith_type', 'Boolean', ...
                                 'const', 0), ...
                          {}, ...
                          {xlsub2_Constant4_out1});

% block: coeff_gen_plan/coeff_gen_dual/Constant5
xlsub2_Constant5_out1 = xSignal('xlsub2_Constant5_out1');
xlsub2_Constant5 = xBlock(struct('source', 'Constant', 'name', 'Constant5'), ...
                          struct('const', (length(coeff)/2)-2-register_output, ...
                                 'n_bits', log2(length(coeff))-1, ...
                                 'arith_type', 'Unsigned', ...
                                 'bin_pt', 0, ...
                                 'explicit_period', 'on'), ...
                          {}, ...
                          {xlsub2_Constant5_out1});

% block: coeff_gen_plan/coeff_gen_dual/Counter
xlsub2_Counter = xBlock(struct('source', 'Counter', 'name', 'Counter'), ...
                        struct('n_bits', log2(length(coeff))-1, ...
                               'load_pin', 'on'), ...
                        {xlsub2_sync, xlsub2_Constant5_out1}, ...
                        {xlsub2_Counter_out1});

% block: coeff_gen_plan/coeff_gen_dual/Delay
xlsub2_Delay = xBlock(struct('source', 'Delay', 'name', 'Delay'), ...
                      struct('latency', register_output), ...
                      {xlsub2_Concat2_out1}, ...
                      {xlsub2_coeff});

% block: coeff_gen_plan/coeff_gen_dual/Dual Port RAM4
xlsub2_Dual_Port_RAM4_out1 = xSignal('xlsub2_Dual_Port_RAM4_out1');
xlsub2_Dual_Port_RAM4_out2 = xSignal('xlsub2_Dual_Port_RAM4_out2');
xlsub2_Dual_Port_RAM4 = xBlock(struct('source', 'Dual Port RAM', 'name', 'Dual Port RAM4'), ...
                               struct('depth', length(coeff), ...
                                      'initVector', coeff, ...
                                      'latency', 3, ...
                                      'distributed_mem', memory_type, ...
                                      'write_mode_A', 'No Read On Write', ...
                                      'write_mode_B', 'No Read On Write'));
if(strcmp(memory_type,'Block RAM'))
    xlsub2_Dual_Port_RAM4.bindPort({xlsub2_Concat_out1, xlsub2_Constant3_out1, xlsub2_Constant_out1, xlsub2_Concat1_out1, xlsub2_Constant3_out1, xlsub2_Constant_out1}, ...
         {xlsub2_Dual_Port_RAM4_out1, xlsub2_Dual_Port_RAM4_out2});
else
    xlsub2_Dual_Port_RAM4.bindPort({xlsub2_Concat_out1, xlsub2_Constant3_out1, xlsub2_Constant_out1, xlsub2_Concat1_out1}, ...
         {xlsub2_Dual_Port_RAM4_out1, xlsub2_Dual_Port_RAM4_out2});    
end
% block: coeff_gen_plan/coeff_gen_dual/Reinterpret
xlsub2_Reinterpret = xBlock(struct('source', 'Reinterpret', 'name', 'Reinterpret'), ...
                            struct('force_arith_type', 'on', ...
                                   'force_bin_pt', 'on'), ...
                            {xlsub2_Dual_Port_RAM4_out1}, ...
                            {xlsub2_Reinterpret_out1});

% block: coeff_gen_plan/coeff_gen_dual/Reinterpret1
xlsub2_Reinterpret1 = xBlock(struct('source', 'Reinterpret', 'name', 'Reinterpret1'), ...
                             struct('force_arith_type', 'on', ...
                                    'force_bin_pt', 'on'), ...
                             {xlsub2_Dual_Port_RAM4_out2}, ...
                             {xlsub2_Reinterpret1_out1});



end

