###############################################################
# Calculate approximate yearly salary from hourly pay and hours per week
# Andrew Goldsborough - 12/12/2015
###############################################################

function salary_wk(wage_hr,hours_wk)
    
    #assume minimum holiday days = 28 including bank holidays => 232 days
    salary = hours_wk*wage_hr*232/5;

    return round(salary,2);

end

