###############################################################
# Run Tax script for various variables
# Andrew Goldsborough - 28/12/2015
# calculate tax
###############################################################

#load scripts
include("salary_wk.jl");
include("tax_fn.jl");
include("tax_fn_proposed.jl");
include("tax_WTC_CTC.jl");
include("tax_WTC_CTC_wk.jl");
include("tax_WTC_CTC_proposed.jl");
include("tax_WTC_CTC_wk_proposed.jl");

## yearly wage ##
## tax credit calculated before tax and NI deduced

#no child, over 30 hours per week
outfile = open("tax_CTC_nochild_30.txt","w")
outfilep = open("tax_CTC_nochild_30_proposed.txt","w")

for i=0:1000:200000

    #current
    tax_out = tax_fn(i);
    TC_out = tax_WTC_CTC(i,1,0,0,0,0);
    println(outfile,i," ",TC_out," ",round(tax_out[3]+TC_out,2));

    #proposed
    tax_outp = tax_fn_proposed(i);
    TC_outp = tax_WTC_CTC_proposed(i,1,0,0,0,0);
    println(outfilep,i," ",TC_outp," ",round(tax_outp[3]+TC_outp,2));
end

close(outfile);
close(outfilep);

#1 child, over 30 hours per week
outfile = open("tax_CTC_1child_30.txt","w")
outfilep = open("tax_CTC_1child_30_proposed.txt","w")

for i=0:1000:200000

    #current
    tax_out = tax_fn(i);
    TC_out = tax_WTC_CTC(i,1,0,1,1,0);
    println(outfile,i," ",TC_out," ",round(tax_out[3]+TC_out,2));

    #proposed
    tax_outp = tax_fn_proposed(i);
    TC_outp = tax_WTC_CTC_proposed(i,1,0,1,1,0);
    println(outfilep,i," ",TC_outp," ",round(tax_outp[3]+TC_outp,2));
end

close(outfile);
close(outfilep);

#2 children, lone parent, 300 in childcare, over 30 hours per week
outfile = open("tax_CTC_2child_lone_30_300.txt","w");
outfilep = open("tax_CTC_2child_lone_30_300_proposed.txt","w");

for i=0:1000:200000

    #current
    tax_out = tax_fn(i);
    TC_out = tax_WTC_CTC(i,1,0,1,2,300);
    println(outfile,i," ",TC_out," ",round(tax_out[3]+TC_out,2));

    #proposed
    tax_outp = tax_fn_proposed(i);
    TC_outp = tax_WTC_CTC_proposed(i,1,0,1,2,300);
    println(outfilep,i," ",TC_outp," ",round(tax_outp[3]+TC_outp,2));
end

close(outfile);
close(outfilep);

## hourly pay, per week ##

#no child, 40 hours
outfile = open("tax_CTC_wk_nochild_40.txt","w");
outfilep = open("tax_CTC_wk_nochild_40_proposed.txt","w");

for i=5.10:0.10:30.00
    
    #current   
    TC_out = tax_WTC_CTC_wk(i,40,0,0,0,0);
    tax_out = tax_fn(salary_wk(i,40));
    println(outfile,i," ",round(salary_wk(i,40),2)," ",TC_out," ",round(tax_out[3]+TC_out,2));

    #proposed
    if i < 7.85
        ip = 7.85;
    else
        ip = i;
    end    
    TC_outp = tax_WTC_CTC_wk_proposed(ip,40,0,0,0,0);
    tax_outp = tax_fn_proposed(salary_wk(ip,40));
    println(outfilep,i," ",round(salary_wk(ip,40),2)," ",TC_outp," ",round(tax_outp[3]+TC_outp,2));
end

close(outfile);
close(outfilep);

#1 child, 40 hours
outfile = open("tax_CTC_wk_1child_40.txt","w");
outfilep = open("tax_CTC_wk_1child_40_proposed.txt","w");

for i=5.10:0.10:30.00
    
    #current   
    TC_out = tax_WTC_CTC_wk(i,40,0,1,1,0);
    tax_out = tax_fn(salary_wk(i,40));
    println(outfile,i," ",round(salary_wk(i,40),2)," ",TC_out," ",round(tax_out[3]+TC_out,2));

    #proposed
    if i < 7.85
        ip = 7.85;
    else 
        ip = i;
    end    
    TC_outp = tax_WTC_CTC_wk_proposed(ip,40,0,1,1,0);
    tax_outp = tax_fn_proposed(salary_wk(ip,40));
    println(outfilep,i," ",round(salary_wk(ip,40),2)," ",TC_outp," ",round(tax_outp[3]+TC_outp,2));
end

close(outfile);
close(outfilep);

#2 children, lone parent, 300 in childcare, 40 hours
outfile = open("tax_CTC_wk_2child_lone_40_300.txt","w");
outfilep = open("tax_CTC_wk_2child_lone_40_300_proposed.txt","w");

for i=5.10:0.10:30.00
    
    #current   
    TC_out = tax_WTC_CTC_wk(i,40,0,1,1,300);
    tax_out = tax_fn(salary_wk(i,40));
    println(outfile,i," ",round(salary_wk(i,40),2)," ",TC_out," ",round(tax_out[3]+TC_out,2));

    #proposed
    if i < 7.85
        ip = 7.85;
    else
        ip = i;
    end    
    TC_outp = tax_WTC_CTC_wk_proposed(ip,40,0,1,1,300);
    tax_outp = tax_fn_proposed(salary_wk(ip,40));
    println(outfilep,i," ",round(salary_wk(ip,40),2)," ",TC_outp," ",round(tax_outp[3]+TC_outp,2));
end

close(outfile);
close(outfilep);



