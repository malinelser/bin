function alignPortsMalin(~)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% selected inports and/or outports will auto align.
% X position is taken from first selected port
% Y position is taken from connected port in subsystem or other block
% added 2024-12-06 by Malin Elser
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Get the currently selected port blocks and find their corresponding subsystem ports Y position (target Y position)

selectedBlocksPaths = find_system(gcs, 'SearchDepth', 1, 'Selected', 'on');
selectedBlocks = cell2mat(get_param(selectedBlocksPaths, 'Handle'));
% Initialize
selectedInports = [];
targetYposInports = [];
selectedOutports = [];
targetYposOutports = [];

% Loop through each selected block
for i = 1:length(selectedBlocks)
    % Sort out the port blocks handles
    try
        blocktype = get_param(selectedBlocks(i), 'BlockType');
        % Add input ports
        if strcmpi(blocktype, 'Inport')
            % store selected inports handles
            selectedInports = [selectedInports; selectedBlocks(i)];
            % find inports target Y positions
            portHandles = get_param(selectedBlocks(i), 'PortHandles');
            outPortHandle = portHandles.Outport;
            % Get the lines connected to the output port
            lines = get_param(outPortHandle, 'Line');
            if lines == -1
                errorMsg = sprintf('The Inport block %s is not connected to any lines!', get_param(selectedBlocks(i), 'Name'));
                error(errorMsg);
            end
            % Find the destination port handles of the connected line
            subsysinPortHandle = get_param(lines, 'DstPortHandle');
            % get the upper connected subsystems ports position
            targetYposInport = get(min(subsysinPortHandle), 'position'); 
            % store inports target Y positions
            targetYposInports = [targetYposInports; targetYposInport(2)]; % [X Y]
        end
        % Add output ports
        if strcmpi(blocktype, 'Outport')
            % store selected outports handles
            selectedOutports = [selectedOutports; selectedBlocks(i)];
            % find inports target Y positions
            portHandles = get_param(selectedBlocks(i), 'PortHandles');
            inPortHandle = portHandles.Inport;
            % Get the lines connected to the output port
            lines = get_param(inPortHandle, 'Line');
            if lines == -1
                errorMsg = sprintf('The Inport block %s is not connected to any lines!', get_param(selectedBlocks(i), 'Name'));
                error(errorMsg);
            end
            % Find the source port handles of the connected line
            subsysOutportHandle = get_param(lines, 'SrcPortHandle'); 
            % get the first connected subsystems ports position
            targetYposOutport = get(subsysOutportHandle(1), 'position'); 
            % store inports target Y positions
            targetYposOutports = [targetYposOutports; targetYposOutport(2)]; % [X Y]            
        end
    catch
        continue
    end
end


%% finding target X position
if ~isempty(selectedInports)
    targetXposInport = get(selectedInports(1), 'position');
end
if ~isempty(selectedOutports)
    targetXposOutport = get(selectedOutports(1), 'position'); % get_param(selectedOutports(1), 'Name')
end

%% move the selected inports / outports
for i = 1:length(selectedInports)
    newpos = [targetXposInport(1) targetYposInports(i)-7 targetXposInport(3) targetYposInports(i)+7]; % [left top right bottom] 
    set_param(selectedInports(i), 'position', newpos);
end

for i = 1:length(selectedOutports)
    newpos = [targetXposOutport(1) targetYposOutports(i)-7 targetXposOutport(3) targetYposOutports(i)+7]; % [left top right bottom] 
    set_param(selectedOutports(i), 'position', newpos);
end
end
