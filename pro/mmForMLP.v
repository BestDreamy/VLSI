// Generator : SpinalHDL v1.7.0    git head : eca519e78d4e6022e34911ec300a432ed9db8220
// Component : mmForMLP

`timescale 1ns/1ps

module mmForMLP (
  input               start_valid,
  output reg          start_ready,
  input               init_valid,
  output reg          init_ready,
  output reg          load_ready,
  input      [15:0]   load_payload,
  output reg          result_valid,
  output reg [15:0]   result_payload,
  input               clk,
  input               resetn
);
  localparam fsm_enumDef_BOOT = 4'd0;
  localparam fsm_enumDef_IDLE = 4'd1;
  localparam fsm_enumDef_loadWeight = 4'd2;
  localparam fsm_enumDef_Wait_1 = 4'd3;
  localparam fsm_enumDef_loadInput = 4'd4;
  localparam fsm_enumDef_CalcRead = 4'd5;
  localparam fsm_enumDef_CalcAcc = 4'd6;
  localparam fsm_enumDef_CalcWB = 4'd7;
  localparam fsm_enumDef_output_1 = 4'd8;

  reg        [9:0]    memForWeight_0_ADR;
  wire       [15:0]   memForWeight_0_D;
  reg                 memForWeight_0_WE;
  reg                 memForWeight_0_ME;
  reg        [9:0]    memForWeight_1_ADR;
  wire       [15:0]   memForWeight_1_D;
  reg                 memForWeight_1_WE;
  reg                 memForWeight_1_ME;
  reg        [7:0]    memForAorB_0_ADR;
  reg        [15:0]   memForAorB_0_D;
  reg                 memForAorB_0_WE;
  reg                 memForAorB_0_ME;
  reg        [7:0]    memForAorB_1_ADR;
  reg        [15:0]   memForAorB_1_D;
  reg                 memForAorB_1_WE;
  reg                 memForAorB_1_ME;
  wire       [15:0]   memForWeight_0_Q;
  wire       [15:0]   memForWeight_1_Q;
  wire       [15:0]   memForAorB_0_Q;
  wire       [15:0]   memForAorB_1_Q;
  wire       [7:0]    temp_fsm_cntGP_valueNext;
  wire       [0:0]    temp_fsm_cntGP_valueNext_1;
  wire       [2:0]    temp_fsm_cntLayers_valueNext;
  wire       [0:0]    temp_fsm_cntLayers_valueNext_1;
  wire       [3:0]    temp_fsm_cnt16_valueNext;
  wire       [0:0]    temp_fsm_cnt16_valueNext_1;
  wire       [12:0]   temp_fsm_adrForWeight;
  wire       [11:0]   temp_fsm_adrForWeight_1;
  wire       [12:0]   temp_fsm_adrForWeight_2;
  wire       [9:0]    temp_fsm_adrForWeight_3;
  wire       [8:0]    temp_fsm_adrForWeight_4;
  wire       [3:0]    temp_fsm_adrForWeight_5;
  wire       [13:0]   temp_fsm_adrForWeight_6;
  wire       [4:0]    temp_fsm_adrForWeight_7;
  wire       [8:0]    temp_fsm_adrForInput;
  wire       [9:0]    temp_fsm_adrForInput_1;
  wire       [4:0]    temp_fsm_adrForInput_2;
  wire       [3:0]    temp_fsm_adrForInput_3;
  wire       [10:0]   temp_ADR;
  wire       [10:0]   temp_ADR_1;
  wire       [35:0]   temp_partialSum;
  wire       [31:0]   temp_partialSum_1;
  wire       [15:0]   temp_partialSum_2;
  reg        [15:0]   temp_partialSum_3;
  wire       [0:0]    temp_partialSum_4;
  wire       [15:0]   temp_partialSum_5;
  reg        [15:0]   temp_partialSum_6;
  wire       [0:0]    temp_partialSum_7;
  wire       [0:0]    temp_temp_when_Utils_l931_3;
  wire       [28:0]   temp_temp_when_SInt_l130;
  wire       [28:0]   temp_temp_when_SInt_l130_1;
  wire       [28:0]   temp_temp_when_SInt_l130_2;
  wire       [1:0]    temp_when_SInt_l131;
  wire       [0:0]    temp_when_SInt_l137;
  wire       [11:0]   temp_when_SInt_l131_1;
  wire       [10:0]   temp_when_SInt_l137_1;
  wire       [28:0]   temp_temp_when_SInt_l130_4;
  wire       [28:0]   temp_temp_when_SInt_l130_4_1;
  wire       [28:0]   temp_temp_when_SInt_l130_4_2;
  wire       [1:0]    temp_when_SInt_l131_2;
  wire       [0:0]    temp_when_SInt_l137_2;
  wire       [11:0]   temp_when_SInt_l131_3;
  wire       [10:0]   temp_when_SInt_l137_3;
  reg                 fsmCtrlSig_weightValid;
  reg                 fsmCtrlSig_inputValid;
  reg                 fsmCtrlSig_outputValid;
  reg        [35:0]   partialSum;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg                 fsm_cntGP_willIncrement;
  reg                 fsm_cntGP_willClear;
  reg        [7:0]    fsm_cntGP_valueNext;
  reg        [7:0]    fsm_cntGP_value;
  wire                fsm_cntGP_willOverflowIfInc;
  reg                 fsm_cntLayers_willIncrement;
  reg                 fsm_cntLayers_willClear;
  reg        [2:0]    fsm_cntLayers_valueNext;
  reg        [2:0]    fsm_cntLayers_value;
  wire                fsm_cntLayers_willOverflowIfInc;
  reg                 fsm_cnt16_willIncrement;
  reg                 fsm_cnt16_willClear;
  reg        [3:0]    fsm_cnt16_valueNext;
  reg        [3:0]    fsm_cnt16_value;
  wire                fsm_cnt16_willOverflowIfInc;
  wire       [13:0]   fsm_adrForWeight;
  wire       [9:0]    fsm_adrForInput;
  reg        [3:0]    fsm_stateReg;
  reg        [3:0]    fsm_stateNext;
  wire                init_fire;
  wire                when_mmForMLP_l79;
  wire       [0:0]    temp_when_Utils_l931;
  wire                when_Utils_l931;
  wire                when_Utils_l931_1;
  wire                init_fire_1;
  wire                start_fire;
  wire                when_mmForMLP_l113;
  wire       [0:0]    temp_when_Utils_l931_1;
  wire                when_Utils_l931_2;
  wire                when_Utils_l931_3;
  wire       [0:0]    temp_when_Utils_l931_2;
  wire                when_Utils_l931_4;
  wire                when_Utils_l931_5;
  wire                when_mmForMLP_l141;
  wire       [0:0]    temp_when_Utils_l931_3;
  wire                when_Utils_l931_6;
  wire       [27:0]   temp_when_SInt_l130;
  wire       [27:0]   temp_when_SInt_l130_1;
  wire       [27:0]   temp_when_SInt_l130_2;
  reg        [26:0]   temp_when_SInt_l130_3;
  wire                when_SInt_l130;
  wire                when_SInt_l131;
  wire                when_SInt_l137;
  reg        [15:0]   temp_D;
  wire                when_SInt_l130_1;
  wire                when_SInt_l131_1;
  wire                when_SInt_l137_1;
  wire                when_Utils_l931_7;
  wire       [27:0]   temp_when_SInt_l130_4;
  wire       [27:0]   temp_when_SInt_l130_5;
  wire       [27:0]   temp_when_SInt_l130_6;
  reg        [26:0]   temp_when_SInt_l130_7;
  wire                when_SInt_l130_2;
  wire                when_SInt_l131_2;
  wire                when_SInt_l137_2;
  reg        [15:0]   temp_D_1;
  wire                when_SInt_l130_3;
  wire                when_SInt_l131_3;
  wire                when_SInt_l137_3;
  wire                when_mmForMLP_l153;
  wire                when_mmForMLP_l156;
  wire                when_mmForMLP_l169;
  wire                when_mmForMLP_l178;
  `ifndef SYNTHESIS
  reg [79:0] fsm_stateReg_string;
  reg [79:0] fsm_stateNext_string;
  `endif


  assign temp_fsm_cntGP_valueNext_1 = fsm_cntGP_willIncrement;
  assign temp_fsm_cntGP_valueNext = {7'd0, temp_fsm_cntGP_valueNext_1};
  assign temp_fsm_cntLayers_valueNext_1 = fsm_cntLayers_willIncrement;
  assign temp_fsm_cntLayers_valueNext = {2'd0, temp_fsm_cntLayers_valueNext_1};
  assign temp_fsm_cnt16_valueNext_1 = fsm_cnt16_willIncrement;
  assign temp_fsm_cnt16_valueNext = {3'd0, temp_fsm_cnt16_valueNext_1};
  assign temp_fsm_adrForWeight = ({1'b0,temp_fsm_adrForWeight_1} + temp_fsm_adrForWeight_2);
  assign temp_fsm_adrForWeight_1 = (fsm_cntLayers_value * 9'h100);
  assign temp_fsm_adrForWeight_3 = {1'b0,temp_fsm_adrForWeight_4};
  assign temp_fsm_adrForWeight_2 = {3'd0, temp_fsm_adrForWeight_3};
  assign temp_fsm_adrForWeight_4 = (temp_fsm_adrForWeight_5 * 5'h10);
  assign temp_fsm_adrForWeight_5 = (fsm_cntGP_value >>> 4);
  assign temp_fsm_adrForWeight_7 = {1'b0,fsm_cnt16_value};
  assign temp_fsm_adrForWeight_6 = {9'd0, temp_fsm_adrForWeight_7};
  assign temp_fsm_adrForInput = (fsm_cnt16_value * 5'h10);
  assign temp_fsm_adrForInput_2 = {1'b0,temp_fsm_adrForInput_3};
  assign temp_fsm_adrForInput_1 = {5'd0, temp_fsm_adrForInput_2};
  assign temp_fsm_adrForInput_3 = fsm_cntGP_value[3:0];
  assign temp_ADR = {fsm_cntLayers_value,fsm_cntGP_value};
  assign temp_ADR_1 = {fsm_cntLayers_value,fsm_cntGP_value};
  assign temp_partialSum_1 = ($signed(temp_partialSum_2) * $signed(temp_partialSum_5));
  assign temp_partialSum = {{4{temp_partialSum_1[31]}}, temp_partialSum_1};
  assign temp_partialSum_2 = temp_partialSum_3;
  assign temp_partialSum_5 = temp_partialSum_6;
  assign temp_partialSum_7 = fsm_cntLayers_value[0:0];
  assign temp_temp_when_Utils_l931_3 = fsm_cntLayers_value[0:0];
  assign temp_temp_when_SInt_l130 = ($signed(temp_temp_when_SInt_l130_1) + $signed(temp_temp_when_SInt_l130_2));
  assign temp_temp_when_SInt_l130_1 = {temp_when_SInt_l130_2[27],temp_when_SInt_l130_2};
  assign temp_temp_when_SInt_l130_2 = {temp_when_SInt_l130_1[27],temp_when_SInt_l130_1};
  assign temp_when_SInt_l131 = temp_when_SInt_l130[27 : 26];
  assign temp_when_SInt_l137 = temp_when_SInt_l130[26 : 26];
  assign temp_when_SInt_l131_1 = temp_when_SInt_l130_3[26 : 15];
  assign temp_when_SInt_l137_1 = temp_when_SInt_l130_3[25 : 15];
  assign temp_temp_when_SInt_l130_4 = ($signed(temp_temp_when_SInt_l130_4_1) + $signed(temp_temp_when_SInt_l130_4_2));
  assign temp_temp_when_SInt_l130_4_1 = {temp_when_SInt_l130_6[27],temp_when_SInt_l130_6};
  assign temp_temp_when_SInt_l130_4_2 = {temp_when_SInt_l130_5[27],temp_when_SInt_l130_5};
  assign temp_when_SInt_l131_2 = temp_when_SInt_l130_4[27 : 26];
  assign temp_when_SInt_l137_2 = temp_when_SInt_l130_4[26 : 26];
  assign temp_when_SInt_l131_3 = temp_when_SInt_l130_7[26 : 15];
  assign temp_when_SInt_l137_3 = temp_when_SInt_l130_7[25 : 15];
  assign temp_partialSum_4 = (3'b011 < fsm_cntLayers_value);
  sramSp memForWeight_0 (
    .Q   (memForWeight_0_Q[15:0] ), //o
    .ADR (memForWeight_0_ADR[9:0]), //i
    .D   (memForWeight_0_D[15:0] ), //i
    .WE  (memForWeight_0_WE      ), //i
    .ME  (memForWeight_0_ME      ), //i
    .clk (clk                    )  //i
  );
  sramSp memForWeight_1 (
    .Q   (memForWeight_1_Q[15:0] ), //o
    .ADR (memForWeight_1_ADR[9:0]), //i
    .D   (memForWeight_1_D[15:0] ), //i
    .WE  (memForWeight_1_WE      ), //i
    .ME  (memForWeight_1_ME      ), //i
    .clk (clk                    )  //i
  );
  sramSp_2 memForAorB_0 (
    .Q   (memForAorB_0_Q[15:0] ), //o
    .ADR (memForAorB_0_ADR[7:0]), //i
    .D   (memForAorB_0_D[15:0] ), //i
    .WE  (memForAorB_0_WE      ), //i
    .ME  (memForAorB_0_ME      ), //i
    .clk (clk                  )  //i
  );
  sramSp_2 memForAorB_1 (
    .Q   (memForAorB_1_Q[15:0] ), //o
    .ADR (memForAorB_1_ADR[7:0]), //i
    .D   (memForAorB_1_D[15:0] ), //i
    .WE  (memForAorB_1_WE      ), //i
    .ME  (memForAorB_1_ME      ), //i
    .clk (clk                  )  //i
  );
  always @(*) begin
    case(temp_partialSum_4)
      1'b0 : temp_partialSum_3 = memForWeight_0_Q;
      default : temp_partialSum_3 = memForWeight_1_Q;
    endcase
  end

  always @(*) begin
    case(temp_partialSum_7)
      1'b0 : temp_partialSum_6 = memForAorB_0_Q;
      default : temp_partialSum_6 = memForAorB_1_Q;
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT      ";
      fsm_enumDef_IDLE : fsm_stateReg_string = "IDLE      ";
      fsm_enumDef_loadWeight : fsm_stateReg_string = "loadWeight";
      fsm_enumDef_Wait_1 : fsm_stateReg_string = "Wait_1    ";
      fsm_enumDef_loadInput : fsm_stateReg_string = "loadInput ";
      fsm_enumDef_CalcRead : fsm_stateReg_string = "CalcRead  ";
      fsm_enumDef_CalcAcc : fsm_stateReg_string = "CalcAcc   ";
      fsm_enumDef_CalcWB : fsm_stateReg_string = "CalcWB    ";
      fsm_enumDef_output_1 : fsm_stateReg_string = "output_1  ";
      default : fsm_stateReg_string = "??????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT      ";
      fsm_enumDef_IDLE : fsm_stateNext_string = "IDLE      ";
      fsm_enumDef_loadWeight : fsm_stateNext_string = "loadWeight";
      fsm_enumDef_Wait_1 : fsm_stateNext_string = "Wait_1    ";
      fsm_enumDef_loadInput : fsm_stateNext_string = "loadInput ";
      fsm_enumDef_CalcRead : fsm_stateNext_string = "CalcRead  ";
      fsm_enumDef_CalcAcc : fsm_stateNext_string = "CalcAcc   ";
      fsm_enumDef_CalcWB : fsm_stateNext_string = "CalcWB    ";
      fsm_enumDef_output_1 : fsm_stateNext_string = "output_1  ";
      default : fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign memForWeight_0_D = load_payload;
  assign memForWeight_1_D = load_payload;
  always @(*) begin
    memForWeight_0_WE = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
        if(fsmCtrlSig_weightValid) begin
          if(when_Utils_l931) begin
            memForWeight_0_WE = 1'b1;
          end
        end
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
        if(when_Utils_l931_2) begin
          memForWeight_0_WE = 1'b0;
        end
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForWeight_0_ME = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
        if(fsmCtrlSig_weightValid) begin
          if(when_Utils_l931) begin
            memForWeight_0_ME = 1'b1;
          end
        end
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
        if(when_Utils_l931_2) begin
          memForWeight_0_ME = 1'b1;
        end
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForWeight_0_ADR = 10'h0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
        if(fsmCtrlSig_weightValid) begin
          if(when_Utils_l931) begin
            memForWeight_0_ADR = temp_ADR[9:0];
          end
        end
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
        if(when_Utils_l931_2) begin
          memForWeight_0_ADR = fsm_adrForWeight[9:0];
        end
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForWeight_1_WE = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
        if(fsmCtrlSig_weightValid) begin
          if(when_Utils_l931_1) begin
            memForWeight_1_WE = 1'b1;
          end
        end
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
        if(when_Utils_l931_3) begin
          memForWeight_1_WE = 1'b0;
        end
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForWeight_1_ME = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
        if(fsmCtrlSig_weightValid) begin
          if(when_Utils_l931_1) begin
            memForWeight_1_ME = 1'b1;
          end
        end
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
        if(when_Utils_l931_3) begin
          memForWeight_1_ME = 1'b1;
        end
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForWeight_1_ADR = 10'h0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
        if(fsmCtrlSig_weightValid) begin
          if(when_Utils_l931_1) begin
            memForWeight_1_ADR = temp_ADR_1[9:0];
          end
        end
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
        if(when_Utils_l931_3) begin
          memForWeight_1_ADR = fsm_adrForWeight[9:0];
        end
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForAorB_0_WE = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
        if(fsmCtrlSig_inputValid) begin
          memForAorB_0_WE = 1'b1;
        end
      end
      fsm_enumDef_CalcRead : begin
        if(when_Utils_l931_4) begin
          memForAorB_0_WE = 1'b0;
        end
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
        if(when_Utils_l931_6) begin
          memForAorB_0_WE = 1'b1;
        end
      end
      fsm_enumDef_output_1 : begin
        if(when_mmForMLP_l169) begin
          memForAorB_0_WE = 1'b0;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForAorB_0_ME = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
        if(fsmCtrlSig_inputValid) begin
          memForAorB_0_ME = 1'b1;
        end
      end
      fsm_enumDef_CalcRead : begin
        if(when_Utils_l931_4) begin
          memForAorB_0_ME = 1'b1;
        end
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
        if(when_Utils_l931_6) begin
          memForAorB_0_ME = 1'b1;
        end
      end
      fsm_enumDef_output_1 : begin
        if(when_mmForMLP_l169) begin
          memForAorB_0_ME = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForAorB_0_ADR = 8'h0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
        if(fsmCtrlSig_inputValid) begin
          memForAorB_0_ADR = fsm_cntGP_value;
        end
      end
      fsm_enumDef_CalcRead : begin
        if(when_Utils_l931_4) begin
          memForAorB_0_ADR = fsm_adrForInput[7:0];
        end
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
        if(when_Utils_l931_6) begin
          memForAorB_0_ADR = fsm_cntGP_value;
        end
      end
      fsm_enumDef_output_1 : begin
        if(when_mmForMLP_l169) begin
          memForAorB_0_ADR = fsm_cntGP_value;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForAorB_0_D = 16'h0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
        if(fsmCtrlSig_inputValid) begin
          memForAorB_0_D = load_payload;
        end
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
        if(when_Utils_l931_6) begin
          memForAorB_0_D = temp_D;
        end
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForAorB_1_WE = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
        if(when_Utils_l931_5) begin
          memForAorB_1_WE = 1'b0;
        end
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
        if(when_Utils_l931_7) begin
          memForAorB_1_WE = 1'b1;
        end
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForAorB_1_ME = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
        if(when_Utils_l931_5) begin
          memForAorB_1_ME = 1'b1;
        end
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
        if(when_Utils_l931_7) begin
          memForAorB_1_ME = 1'b1;
        end
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForAorB_1_ADR = 8'h0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
        if(when_Utils_l931_5) begin
          memForAorB_1_ADR = fsm_adrForInput[7:0];
        end
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
        if(when_Utils_l931_7) begin
          memForAorB_1_ADR = fsm_cntGP_value;
        end
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    memForAorB_1_D = 16'h0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
        if(when_Utils_l931_7) begin
          memForAorB_1_D = temp_D_1;
        end
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_cntGP_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
        if(fsmCtrlSig_weightValid) begin
          fsm_cntGP_willIncrement = 1'b1;
        end
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
        if(fsmCtrlSig_inputValid) begin
          fsm_cntGP_willIncrement = 1'b1;
        end
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
        fsm_cntGP_willIncrement = 1'b1;
      end
      fsm_enumDef_output_1 : begin
        if(when_mmForMLP_l169) begin
          fsm_cntGP_willIncrement = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_cntGP_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
        if(fsmCtrlSig_weightValid) begin
          if(fsm_cntGP_willOverflowIfInc) begin
            if(fsm_cntLayers_willOverflowIfInc) begin
              fsm_cntGP_willClear = 1'b1;
            end
          end
        end
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
        if(fsmCtrlSig_inputValid) begin
          if(fsm_cntGP_willOverflowIfInc) begin
            fsm_cntGP_willClear = 1'b1;
          end
        end
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
        if(!when_mmForMLP_l153) begin
          if(when_mmForMLP_l156) begin
            fsm_cntGP_willClear = 1'b1;
          end else begin
            fsm_cntGP_willClear = 1'b1;
          end
        end
      end
      fsm_enumDef_output_1 : begin
        if(fsmCtrlSig_outputValid) begin
          if(when_mmForMLP_l178) begin
            fsm_cntGP_willClear = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign fsm_cntGP_willOverflowIfInc = (fsm_cntGP_value == 8'hff);
  always @(*) begin
    fsm_cntGP_valueNext = (fsm_cntGP_value + temp_fsm_cntGP_valueNext);
    if(fsm_cntGP_willClear) begin
      fsm_cntGP_valueNext = 8'h0;
    end
  end

  always @(*) begin
    fsm_cntLayers_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
        if(fsmCtrlSig_weightValid) begin
          if(fsm_cntGP_willOverflowIfInc) begin
            fsm_cntLayers_willIncrement = 1'b1;
          end
        end
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
        if(!when_mmForMLP_l153) begin
          if(when_mmForMLP_l156) begin
            fsm_cntLayers_willIncrement = 1'b1;
          end
        end
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_cntLayers_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
        if(fsmCtrlSig_weightValid) begin
          if(fsm_cntGP_willOverflowIfInc) begin
            if(fsm_cntLayers_willOverflowIfInc) begin
              fsm_cntLayers_willClear = 1'b1;
            end
          end
        end
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
        if(!when_mmForMLP_l153) begin
          if(!when_mmForMLP_l156) begin
            fsm_cntLayers_willClear = 1'b1;
          end
        end
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  assign fsm_cntLayers_willOverflowIfInc = (fsm_cntLayers_value == 3'b111);
  always @(*) begin
    fsm_cntLayers_valueNext = (fsm_cntLayers_value + temp_fsm_cntLayers_valueNext);
    if(fsm_cntLayers_willClear) begin
      fsm_cntLayers_valueNext = 3'b000;
    end
  end

  always @(*) begin
    fsm_cnt16_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
        fsm_cnt16_willIncrement = 1'b1;
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_cnt16_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
        if(!when_mmForMLP_l141) begin
          fsm_cnt16_willClear = 1'b1;
        end
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  assign fsm_cnt16_willOverflowIfInc = (fsm_cnt16_value == 4'b1111);
  always @(*) begin
    fsm_cnt16_valueNext = (fsm_cnt16_value + temp_fsm_cnt16_valueNext);
    if(fsm_cnt16_willClear) begin
      fsm_cnt16_valueNext = 4'b0000;
    end
  end

  assign fsm_adrForWeight = ({1'b0,temp_fsm_adrForWeight} + temp_fsm_adrForWeight_6);
  assign fsm_adrForInput = ({1'b0,temp_fsm_adrForInput} + temp_fsm_adrForInput_1);
  always @(*) begin
    init_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
        init_ready = 1'b1;
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
        init_ready = 1'b1;
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    load_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
        if(when_mmForMLP_l79) begin
          load_ready = 1'b1;
        end
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    start_ready = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
        start_ready = 1'b1;
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    result_valid = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
        if(fsmCtrlSig_outputValid) begin
          result_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    result_payload = 16'h0;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
      end
      fsm_enumDef_loadWeight : begin
      end
      fsm_enumDef_Wait_1 : begin
      end
      fsm_enumDef_loadInput : begin
      end
      fsm_enumDef_CalcRead : begin
      end
      fsm_enumDef_CalcAcc : begin
      end
      fsm_enumDef_CalcWB : begin
      end
      fsm_enumDef_output_1 : begin
        if(fsmCtrlSig_outputValid) begin
          result_payload = memForAorB_0_Q;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_IDLE : begin
        if(init_fire) begin
          fsm_stateNext = fsm_enumDef_loadWeight;
        end
      end
      fsm_enumDef_loadWeight : begin
        if(fsmCtrlSig_weightValid) begin
          if(fsm_cntGP_willOverflowIfInc) begin
            if(fsm_cntLayers_willOverflowIfInc) begin
              fsm_stateNext = fsm_enumDef_Wait_1;
            end
          end
        end
      end
      fsm_enumDef_Wait_1 : begin
        if(init_fire_1) begin
          fsm_stateNext = fsm_enumDef_loadWeight;
        end else begin
          if(start_fire) begin
            fsm_stateNext = fsm_enumDef_loadInput;
          end
        end
      end
      fsm_enumDef_loadInput : begin
        if(fsmCtrlSig_inputValid) begin
          if(fsm_cntGP_willOverflowIfInc) begin
            fsm_stateNext = fsm_enumDef_CalcRead;
          end
        end
      end
      fsm_enumDef_CalcRead : begin
        fsm_stateNext = fsm_enumDef_CalcAcc;
      end
      fsm_enumDef_CalcAcc : begin
        if(when_mmForMLP_l141) begin
          fsm_stateNext = fsm_enumDef_CalcRead;
        end else begin
          fsm_stateNext = fsm_enumDef_CalcWB;
        end
      end
      fsm_enumDef_CalcWB : begin
        if(when_mmForMLP_l153) begin
          fsm_stateNext = fsm_enumDef_CalcRead;
        end else begin
          if(when_mmForMLP_l156) begin
            fsm_stateNext = fsm_enumDef_CalcRead;
          end else begin
            fsm_stateNext = fsm_enumDef_output_1;
          end
        end
      end
      fsm_enumDef_output_1 : begin
        if(fsmCtrlSig_outputValid) begin
          if(when_mmForMLP_l178) begin
            fsm_stateNext = fsm_enumDef_Wait_1;
          end
        end
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_IDLE;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign init_fire = (init_valid && init_ready);
  assign when_mmForMLP_l79 = (! (fsm_cntGP_willOverflowIfInc && fsm_cntLayers_willOverflowIfInc));
  assign temp_when_Utils_l931 = (3'b011 < fsm_cntLayers_value);
  assign when_Utils_l931 = (temp_when_Utils_l931 == 1'b0);
  assign when_Utils_l931_1 = (temp_when_Utils_l931 == 1'b1);
  assign init_fire_1 = (init_valid && init_ready);
  assign start_fire = (start_valid && start_ready);
  assign when_mmForMLP_l113 = (! fsm_cntGP_willOverflowIfInc);
  assign temp_when_Utils_l931_1 = (3'b011 < fsm_cntLayers_value);
  assign when_Utils_l931_2 = (temp_when_Utils_l931_1 == 1'b0);
  assign when_Utils_l931_3 = (temp_when_Utils_l931_1 == 1'b1);
  assign temp_when_Utils_l931_2 = fsm_cntLayers_value[0:0];
  assign when_Utils_l931_4 = (temp_when_Utils_l931_2 == 1'b0);
  assign when_Utils_l931_5 = (temp_when_Utils_l931_2 == 1'b1);
  assign when_mmForMLP_l141 = (! fsm_cnt16_willOverflowIfInc);
  assign temp_when_Utils_l931_3 = (! temp_temp_when_Utils_l931_3[0]);
  assign when_Utils_l931_6 = (temp_when_Utils_l931_3 == 1'b0);
  assign temp_when_SInt_l130_1 = {27'h0,1'b1};
  assign temp_when_SInt_l130_2 = partialSum[35 : 8];
  assign temp_when_SInt_l130 = (temp_temp_when_SInt_l130 >>> 1);
  assign when_SInt_l130 = temp_when_SInt_l130[27];
  assign when_SInt_l131 = (! (&temp_when_SInt_l131));
  always @(*) begin
    if(when_SInt_l130) begin
      if(when_SInt_l131) begin
        temp_when_SInt_l130_3 = 27'h4000000;
      end else begin
        temp_when_SInt_l130_3 = temp_when_SInt_l130[26 : 0];
      end
    end else begin
      if(when_SInt_l137) begin
        temp_when_SInt_l130_3 = 27'h3ffffff;
      end else begin
        temp_when_SInt_l130_3 = temp_when_SInt_l130[26 : 0];
      end
    end
  end

  assign when_SInt_l137 = (|temp_when_SInt_l137);
  assign when_SInt_l130_1 = temp_when_SInt_l130_3[26];
  assign when_SInt_l131_1 = (! (&temp_when_SInt_l131_1));
  always @(*) begin
    if(when_SInt_l130_1) begin
      if(when_SInt_l131_1) begin
        temp_D = 16'h8000;
      end else begin
        temp_D = temp_when_SInt_l130_3[15 : 0];
      end
    end else begin
      if(when_SInt_l137_1) begin
        temp_D = 16'h7fff;
      end else begin
        temp_D = temp_when_SInt_l130_3[15 : 0];
      end
    end
  end

  assign when_SInt_l137_1 = (|temp_when_SInt_l137_1);
  assign when_Utils_l931_7 = (temp_when_Utils_l931_3 == 1'b1);
  assign temp_when_SInt_l130_5 = {27'h0,1'b1};
  assign temp_when_SInt_l130_6 = partialSum[35 : 8];
  assign temp_when_SInt_l130_4 = (temp_temp_when_SInt_l130_4 >>> 1);
  assign when_SInt_l130_2 = temp_when_SInt_l130_4[27];
  assign when_SInt_l131_2 = (! (&temp_when_SInt_l131_2));
  always @(*) begin
    if(when_SInt_l130_2) begin
      if(when_SInt_l131_2) begin
        temp_when_SInt_l130_7 = 27'h4000000;
      end else begin
        temp_when_SInt_l130_7 = temp_when_SInt_l130_4[26 : 0];
      end
    end else begin
      if(when_SInt_l137_2) begin
        temp_when_SInt_l130_7 = 27'h3ffffff;
      end else begin
        temp_when_SInt_l130_7 = temp_when_SInt_l130_4[26 : 0];
      end
    end
  end

  assign when_SInt_l137_2 = (|temp_when_SInt_l137_2);
  assign when_SInt_l130_3 = temp_when_SInt_l130_7[26];
  assign when_SInt_l131_3 = (! (&temp_when_SInt_l131_3));
  always @(*) begin
    if(when_SInt_l130_3) begin
      if(when_SInt_l131_3) begin
        temp_D_1 = 16'h8000;
      end else begin
        temp_D_1 = temp_when_SInt_l130_7[15 : 0];
      end
    end else begin
      if(when_SInt_l137_3) begin
        temp_D_1 = 16'h7fff;
      end else begin
        temp_D_1 = temp_when_SInt_l130_7[15 : 0];
      end
    end
  end

  assign when_SInt_l137_3 = (|temp_when_SInt_l137_3);
  assign when_mmForMLP_l153 = (! fsm_cntGP_willOverflowIfInc);
  assign when_mmForMLP_l156 = (! fsm_cntLayers_willOverflowIfInc);
  assign when_mmForMLP_l169 = (((fsm_cntGP_value == 8'h0) && (! fsmCtrlSig_outputValid)) || (8'h0 < fsm_cntGP_value));
  assign when_mmForMLP_l178 = ((fsm_cntGP_value == 8'h0) && fsmCtrlSig_outputValid);
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      fsmCtrlSig_weightValid <= 1'b0;
      fsmCtrlSig_inputValid <= 1'b0;
      fsmCtrlSig_outputValid <= 1'b0;
      partialSum <= 36'h0;
      fsm_cntGP_value <= 8'h0;
      fsm_cntLayers_value <= 3'b000;
      fsm_cnt16_value <= 4'b0000;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      fsm_cntGP_value <= fsm_cntGP_valueNext;
      fsm_cntLayers_value <= fsm_cntLayers_valueNext;
      fsm_cnt16_value <= fsm_cnt16_valueNext;
      fsmCtrlSig_weightValid <= 1'b0;
      fsmCtrlSig_inputValid <= 1'b0;
      fsmCtrlSig_outputValid <= 1'b0;
      fsm_stateReg <= fsm_stateNext;
      case(fsm_stateReg)
        fsm_enumDef_IDLE : begin
        end
        fsm_enumDef_loadWeight : begin
          if(when_mmForMLP_l79) begin
            fsmCtrlSig_weightValid <= 1'b1;
          end
        end
        fsm_enumDef_Wait_1 : begin
        end
        fsm_enumDef_loadInput : begin
          if(when_mmForMLP_l113) begin
            fsmCtrlSig_inputValid <= 1'b1;
          end
        end
        fsm_enumDef_CalcRead : begin
        end
        fsm_enumDef_CalcAcc : begin
          partialSum <= ($signed(partialSum) + $signed(temp_partialSum));
        end
        fsm_enumDef_CalcWB : begin
          partialSum <= 36'h0;
        end
        fsm_enumDef_output_1 : begin
          if(when_mmForMLP_l169) begin
            fsmCtrlSig_outputValid <= 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

//sramSp_2 replaced by sramSp_2

module sramSp_2 (
  output     [15:0]   Q,
  input      [7:0]    ADR,
  input      [15:0]   D,
  input               WE,
  input               ME,
  input               clk
);

  wire                ram1rw_4_ap_memoryEnable;
  wire       [15:0]   ram1rw_4_dp_writeData;
  wire       [15:0]   ram1rw_4_dp_readData;
  wire       [15:0]   subD_0;
  wire       [15:0]   subQ_0;

  Ram1rw_2 ram1rw_4 (
    .ap_memoryEnable (ram1rw_4_ap_memoryEnable   ), //i
    .ap_address      (ADR[7:0]                   ), //i
    .dp_writeData    (ram1rw_4_dp_writeData[15:0]), //i
    .dp_readData     (ram1rw_4_dp_readData[15:0] ), //o
    .dp_writeEnable  (WE                         ), //i
    .clk             (clk                        )  //i
  );
  assign subD_0 = D[15 : 0];
  assign subQ_0 = ram1rw_4_dp_readData;
  assign Q = subQ_0;
  assign ram1rw_4_ap_memoryEnable = (ME && 1'b1);
  assign ram1rw_4_dp_writeData = subD_0;

endmodule

//sramSp replaced by sramSp

module sramSp (
  output     [15:0]   Q,
  input      [9:0]    ADR,
  input      [15:0]   D,
  input               WE,
  input               ME,
  input               clk
);

  wire                ram1rw_4_ap_memoryEnable;
  wire       [15:0]   ram1rw_4_dp_writeData;
  wire       [15:0]   ram1rw_4_dp_readData;
  wire       [15:0]   subD_0;
  wire       [15:0]   subQ_0;

  Ram1rw ram1rw_4 (
    .ap_memoryEnable (ram1rw_4_ap_memoryEnable   ), //i
    .ap_address      (ADR[9:0]                   ), //i
    .dp_writeData    (ram1rw_4_dp_writeData[15:0]), //i
    .dp_readData     (ram1rw_4_dp_readData[15:0] ), //o
    .dp_writeEnable  (WE                         ), //i
    .clk             (clk                        )  //i
  );
  assign subD_0 = D[15 : 0];
  assign subQ_0 = ram1rw_4_dp_readData;
  assign Q = subQ_0;
  assign ram1rw_4_ap_memoryEnable = (ME && 1'b1);
  assign ram1rw_4_dp_writeData = subD_0;

endmodule

//Ram1rw_2 replaced by Ram1rw_2

module Ram1rw_2 (
  input               ap_memoryEnable,
  input      [7:0]    ap_address,
  input      [15:0]   dp_writeData,
  output     [15:0]   dp_readData,
  input               dp_writeEnable,
  input               clk
);

  wire       [15:0]   ram_Q;

  mem55lpw256d16sp ram (
    .CLK   (clk               ), //i
    .ADR   (ap_address[7:0]   ), //i
    .D     (dp_writeData[15:0]), //i
    .Q     (ram_Q[15:0]       ), //o
    .WE    (dp_writeEnable    ), //i
    .ME    (ap_memoryEnable   ), //i
    .TEST1 (1'b0              ), //i
    .RME   (1'b0              ), //i
    .RM    (4'b0010           )  //i
  );
  assign dp_readData = ram_Q;

endmodule

//Ram1rw replaced by Ram1rw

module Ram1rw (
  input               ap_memoryEnable,
  input      [9:0]    ap_address,
  input      [15:0]   dp_writeData,
  output     [15:0]   dp_readData,
  input               dp_writeEnable,
  input               clk
);

  wire       [15:0]   ram_Q;

  mem55lpw1024d16sp ram (
    .CLK   (clk               ), //i
    .ADR   (ap_address[9:0]   ), //i
    .D     (dp_writeData[15:0]), //i
    .Q     (ram_Q[15:0]       ), //o
    .WE    (dp_writeEnable    ), //i
    .ME    (ap_memoryEnable   ), //i
    .TEST1 (1'b0              ), //i
    .RME   (1'b0              ), //i
    .RM    (4'b0010           )  //i
  );
  assign dp_readData = ram_Q;

endmodule
