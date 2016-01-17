###############################################################
# Calculate Working tax crdits (WTC) and child tax credits (CTC) weekly 
# proposed changes in 2015
# Andrew Goldsborough - 13/12/2015
# calculate tax back based on hourly wage
# minimum wage £6.50, £5.13 (18-20)
# living wage £7.85, £9.15 (London)
# PhD stipend £13,863, £15,863 (London)
###############################################################

function tax_WTC_CTC_wk_proposed(wage_hr,weekly_hrs,disability,lone_parent,children,childcare_wk)

#maximum elements (annual)
WTC_basic = 1960.0;
WTC_30 = 810.0;
WTC_disability = 2970.0;
WTC_loneparent = 2010.0;
CTC_child = 2780.0;
#CTC_family = 545.0;

#childcare assistance = 70%
childcare_rate = 0.7;

#thresholds
WTC_threshold = 3850.0;

#taper rate = 48%
taper = 0.48;

#calculate maximum TC
max_TC = WTC_basic;

if weekly_hrs > 30
    max_TC = max_TC + WTC_30;
end

if disability == 1
    max_TC = max_TC + WTC_disability;
end

if lone_parent == 1
    max_TC = max_TC + WTC_loneparent;
end

if children < 3
    max_TC = max_TC + children*CTC_child;
elseif children > 2
    max_TC = max_TC + 2*CTC_child;
end

#if children > 0
#    max_TC = max_TC + CTC_family;
#end

#childcare, done weekly
if children == 1
    if childcare_wk > 175.0
        childcare_wk = 175.0;
    end
elseif children > 1
    if childcare_wk > 300.0
        childcare_wk = 300.0;
    end
end

max_TC = max_TC + childcare_rate*childcare_wk*366/7;
       
#calculate approx salary from hours
#use 232 days as that is the 52*5-28 using the minimum 28 days holiday
salary = weekly_hrs*232*wage_hr/5; 

#reduce due to salary
if salary > WTC_threshold
    TC = max_TC - (salary - WTC_threshold)*taper;
else
    TC = max_TC;
end

if TC < 0
    TC = 0;
end

#remove anyone who does not qualify
if weekly_hrs < 30 && children == 0 && disability == 0
    TC = 0;
end

if weekly_hrs < 16
    TC = 0;
end

TC = round(TC,2);

return TC;

end



