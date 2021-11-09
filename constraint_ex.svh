class Constraint_Ex;
  rand bit [6:0] lower_bound, upper_bound, const_val;
  rand bit [6:0] Data_in;
  constraint m_range{
    /*
  	lower_bound >= 0; upper_bound < 128;
    Data_in > lower_bound; Data_in < upper_bound;
    */
    //Data_in inside {2,3,4,5};                        // Data_in from the specified set
    // ! (Data_in inside{[10:50]});                    // not inside range
    
    Data_in inside {[0:127]};
    
    //Data_in dist{0:=10, [100:110]:/10, [1:99]:=17}; // Weighted constraint
    const_val == 99;
  }  
  function string display();
    return $sformatf("Data_in=%0d,Const=%0d",Data_in,const_val);
  endfunction
endclass

module tb;
  Constraint_Ex cls = new();
  initial begin
    repeat(100) begin
      cls.randomize();
      $display(cls.display());
    end
  end
endmodule