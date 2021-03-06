// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\controllerPeripheralHdlAdi\controllerHdl\controllerHdl_Frequency_To_Volts.v
// Created: 2014-09-08 14:12:04
// 
// Generated by MATLAB 8.2 and HDL Coder 3.3
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: controllerHdl_Frequency_To_Volts
// Source Path: controllerHdl/Field_Oriented_Control/Open_Loop_Control/Generate_Position_And_Voltage_Ramp/Frequency_To_Volts
// Hierarchy Level: 5
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module controllerHdl_Frequency_To_Volts
          (
           F,
           param_open_loop_bias,
           param_open_loop_scalar,
           V
          );


  input   signed [31:0] F;  // sfix32_En22
  input   signed [17:0] param_open_loop_bias;  // sfix18_En14
  input   signed [17:0] param_open_loop_scalar;  // sfix18_En16
  output  signed [17:0] V;  // sfix18_En12


  wire signed [31:0] Double_Range_out1;  // sfix32_En21
  wire signed [17:0] Convert_Data_Type_out1;  // sfix18_En7
  wire signed [18:0] Abs1_cast;  // sfix19_En7
  wire signed [18:0] Abs1_cast_1;  // sfix19_En7
  wire signed [17:0] Abs1_out1;  // sfix18_En7
  wire signed [35:0] freq_to_volts;  // sfix36_En23
  wire signed [36:0] Add_add_cast;  // sfix37_En23
  wire signed [36:0] Add_add_cast_1;  // sfix37_En23
  wire signed [36:0] volts;  // sfix37_En23
  wire signed [17:0] volts_dt;  // sfix18_En12

  // Frequency To Volts


  // <S21>/Double_Range
  controllerHdl_Double_Range   u_Double_Range   (.In1(F),  // sfix32_En22
                                                 .Out1(Double_Range_out1)  // sfix32_En21
                                                 );

  // <S21>/Convert_Data_Type
  controllerHdl_Convert_Data_Type   u_Convert_Data_Type   (.In1(Double_Range_out1),  // sfix32_En21
                                                           .Out1(Convert_Data_Type_out1)  // sfix18_En7
                                                           );

  // <S21>/Abs1
  assign Abs1_cast = Convert_Data_Type_out1;
  assign Abs1_cast_1 =  - (Abs1_cast);
  assign Abs1_out1 = (Convert_Data_Type_out1 < 18'sb000000000000000000 ? $signed(Abs1_cast_1[17:0]) :
              Convert_Data_Type_out1);



  // <S21>/Product
  assign freq_to_volts = Abs1_out1 * param_open_loop_scalar;



  // <S21>/Add
  assign Add_add_cast = freq_to_volts;
  assign Add_add_cast_1 = {{10{param_open_loop_bias[17]}}, {param_open_loop_bias, 9'b000000000}};
  assign volts = Add_add_cast + Add_add_cast_1;



  // <S21>/Voltage_Data_Type
  assign volts_dt = volts[28:11];



  assign V = volts_dt;

endmodule  // controllerHdl_Frequency_To_Volts

