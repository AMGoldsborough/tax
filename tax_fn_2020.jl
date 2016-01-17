###############################################################
# Tax as a function - Proposed for 2020 
# Andrew Goldsborough - 13/12/2015
# calculate tax
###############################################################

function tax_fn_2020(salary)

#salary = parse(Float64,salary);

#calculate national insurance contributions (NIC)
NIC_threshold = 8060.0;
NIC_upper = 42385.0;

if salary > NIC_threshold 
    if salary > NIC_upper
        #salary above upper => 2%
        NIC = (NIC_upper - NIC_threshold)*0.12 + (salary - NIC_upper)*0.02;
    else
        #salary above threshold => 12%
        NIC = (salary - NIC_threshold)*0.12;
    end
else 
    #no NIC
    NIC = 0.0;
end

NIC = round(NIC,2);


#allowance goes down £1 for every £2 above £100k
tax_allowance = 12500.0;
allowance_threshold = 100000.0

if salary < tax_allowance
    salary_taxable = 0.0;
elseif salary < allowance_threshold
    salary_taxable = salary - tax_allowance;
elseif salary < (allowance_threshold + 2*tax_allowance)
    salary_taxable = salary - tax_allowance + floor((salary - allowance_threshold)/2);
else
    salary_taxable = salary;
end

#calculate tax (thresholds on taxable income)
tax_basic = 31785.0;
tax_higher = 150000.0;

if salary_taxable > tax_higher
    #additional rate = 45%
    tax = tax_basic*0.2 + (tax_higher - tax_basic)*0.4 + (salary_taxable - tax_higher)*0.45;
elseif salary_taxable > tax_basic
    #higher rate = 40%
    tax = tax_basic*0.2 + (salary_taxable - tax_basic)*0.4;
elseif salary_taxable > 0.0 
    #basic rate = 20%
    tax = salary_taxable*0.2;
else
    #no tax
    tax = 0.0;
end

tax = round(tax,2);

data_return = [NIC,tax,round(salary-NIC-tax,2)];

return data_return;

end
            



