% plot data

clear;

%% constants
dataName = 'MistryLiljeholmExp1';
try load pantoneSpring2015 pantone; catch load PantoneSpring2015 pantone; end
doPrint = true;

fontSize = 12;
colors = {pantone.Custard, pantone.DuskBlue};
gap = 0.2; scale = 10;

%% load data (originally parsed in consensus_1) and graphics support
load(dataName, 'd');

%% set up data
valDiffs = [-0.6:0.3:0.6];
nValDiffs = length(valDiffs);
majDiffs = [5/6 1];
nMajDiffs = length(majDiffs);

count = zeros(d.nSubjects, nValDiffs, nMajDiffs, 2); % 1 = numerator, 2 = denominator
for subjectIdx = 1:d.nSubjects
   for trialIdx = 1:d.nTrials
      matchValue = find(hist(d.values(subjectIdx, trialIdx, 1) - d.values(subjectIdx, trialIdx, 2), valDiffs) == 1);
      matchMajority = find(hist(d.majority(subjectIdx, trialIdx), majDiffs) == 1);
      count(subjectIdx, matchValue, matchMajority, 2) = count(subjectIdx, matchValue, matchMajority, 2) + 1;
      if d.decision(subjectIdx, trialIdx) == 1
         count(subjectIdx, matchValue, matchMajority, 1) = count(subjectIdx, matchValue, matchMajority, 1) + 1;
      end
   end
end
% check: sum(count(:, :, :, 2), 3)

%% data plot
figure(3); clf; hold on;
set(gcf, ...
   'color'             , 'w'               , ...
   'units'             , 'normalized'      , ...
   'position'          , [0.2 0.1 0.5 0.8] , ...
   'paperpositionmode' , 'auto'            );

%[nRows, nCols] = subplotArrange(d.nSubjects);
nRows = 10; nCols = 3;

for subjectIdx = 1:d.nSubjects
   subplot(nRows, nCols, subjectIdx); cla; hold on;
   set(gca, ...
      'xlim'          , [0.5 nValDiffs+0.5]  , ...
      'xtick'         , 1:nValDiffs          , ...
      'xticklabel'    , []                   , ...
      'ylim'          , [0.5 1]              , ...
      'ytick'         , 0.5:0.25:1           , ...
      'yticklabel'    , []                   , ...
      'box'           , 'off'                , ...
      'tickdir'       , 'out'                , ...
      'layer'         , 'top'                , ...
      'ticklength'    , [0.025 0]            , ...
      'fontsize'      , fontSize             );
   
   % plot choices for low majority
   %choice = count(subjectIdx, :, 1, 1) - (count(subjectIdx, :, 1, 2) - count(subjectIdx, :, 1, 1));
   prop = (count(subjectIdx, :, 1, 1)+1)./(count(subjectIdx, :, 1, 2)+2);
   prop = (prop+1)/2;
   plot(1:nValDiffs, prop, 'o-', ...
      'markersize'      , 7                , ...
      'color'           , pantone.Titanium , ...
      'markerfacecolor' , pantone.DuskBlue , ...
      'markeredgecolor' , 'w'              );
   % plot choices for high majority
   %choice = count(subjectIdx, :, 2, 1) - (count(subjectIdx, :, 2, 2) - count(subjectIdx, :, 2, 1));
   prop = (count(subjectIdx, :, 2, 1)+1)./(count(subjectIdx, :, 2, 2)+2);
   prop = (prop+1)/2;
   plot(1:nValDiffs, prop, 'o-', ...
      'markersize'      , 7                    , ...
      'color'           , pantone.Titanium     , ...
      'markerfacecolor' , pantone.ClassicBlue  , ...
      'markeredgecolor' , 'w'                  );
   
   % subject label
   text(nValDiffs, min(get(gca, 'ylim')), sprintf('p%d', subjectIdx), ...
      'fontsize' , fontSize , ...
      'vertical' , 'bottom' );
   
   % label a subplot
   if subjectIdx == (d.nSubjects - nCols + 1)
      set(gca, ...
         'xticklabel' , {'-0.6', '-0.3', '0', '0.3', '0.6'} , ...
         'yticklabel' , {'0.5', '0.75', '1'}                );
     xlabel('Value difference', 'fontsize', fontSize);
     ylabel('Choice', 'fontsize', fontSize);
   end
   
     % legend
   if subjectIdx ==1
      L = legend('low majority', 'high majority', ...
         'box'      , 'off'       , ...
         'location' , 'northwest' );
      set(L, 'position', get(L, 'position') + [0 0.06 0 0]);
   end
   
end

% print
if doPrint
   print(sprintf('figures/%s%s.png', dataName, 'Data'), '-dpng', '-r300');
   print(sprintf('figures/%s%s.eps', dataName, 'Data'), '-depsc');
end
