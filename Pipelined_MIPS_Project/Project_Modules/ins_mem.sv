module instructionMemory(instruction, PC);

	integer j;
	input [31:0]PC;
	output [31:0]instruction;
     wire [31:0]instruction;
	reg [7:0] mem [16383:0];
	
	initial begin
			// SOME softwares would have a 5000 limit on for loop.
			// You can break this into multiple loops or initialize several locations in parallel
			for (j = 0; j<16384; j = j + 1)   // 16 K Memory
				begin
					mem[j] <= 8'b0;
				end		
				
			// ******************************************************	
			///Test Case 1: Load Operations 
			// ****************************************************** 
			//lw $t0,0($0)
			//lw $t1,4($0)
			//lw $t2,8($0)
			//lw $t3,12($0)
			//lw $t4,16($0)
			//lw $t5,20($0)
			//lw $t6,24($0)
			//lw $t7,28($0)
			
				
			mem[100] <= 'h48;
			mem[101] <= 'h08;
			mem[102] <= 'h00;
			mem[103] <= 'h00;
			
			mem[104] <= 'h48;
			mem[105] <= 'h09;
			mem[106] <= 'h00;
			mem[107] <= 'h04;
			
			mem[108] <= 'h48;
			mem[109] <= 'h0a;
			mem[110] <= 'h00;
			mem[111] <= 'h08;
			
			mem[112] <= 'h48;
			mem[113] <= 'h0b;
			mem[114] <= 'h00;
			mem[115] <= 'h0c;
			
			mem[116] <= 'h48;
			mem[117] <= 'h0c;
			mem[118] <= 'h00;
			mem[119] <= 'h10;
			
			mem[120] <= 'h48;
			mem[121] <= 'h0d;
			mem[122] <= 'h00;
			mem[123] <= 'h14;
			
			mem[124] <= 'h48;
			mem[125] <= 'h0e;
			mem[126] <= 'h00;
			mem[127] <= 'h18;
			
			mem[128] <= 'h48;
			mem[129] <= 'h0f;
			mem[130] <= 'h00;
			mem[131] <= 'h1c;
			
			// ******************************************************	
			///Test Case 2: Arithematic operations - No Forwarding
			// ****************************************************** 
			//addi $s1,$0,5
			//addi $s2,$0,10
			//addi $s3,$0,3
			//addi $s4,$0,2			
			//add  $s5,$s1,$s2
			//sub  $s6,$s1,$s3
			mem[200] <= 'h24;
			mem[201] <= 'h13;
			mem[202] <= 'h00;
			mem[203] <= 'h05;
			
      		mem[204] <= 'h24;
			mem[205] <= 'h14;
			mem[206] <= 'h00;
			mem[207] <= 'h0a;
			
			mem[208] <= 'h24;
			mem[209] <= 'h15;
    	    mem[210] <= 'h00;
			mem[211] <= 'h03;
			
			mem[212] <= 'h24;
			mem[213] <= 'h16;
			mem[214] <= 'h00;
			mem[215] <= 'h02;
			
			mem[216] <= 'h0e;
			mem[217] <= 'h74;
			mem[218] <= 'hb8;
			mem[219] <= 'h20;
			
			mem[220] <= 'h0e;
			mem[221] <= 'h75;
			mem[222] <= 'hc0;
			mem[223] <= 'h24;			

			// ******************************************************	
			///Test Case 3: Logical Operations - No Forwarding
			// ****************************************************** 
			//addi $s1,$0,15
			//addi $s2,$0,10
			//addi $s3,$0,3
			//addi $s4,$0,2			
			//and  $s5,$s1,$s2
			//or   $s6,$s2,$s3
			mem[300] <= 'h24;
			mem[301] <= 'h13;
			mem[302] <= 'h00;
			mem[303] <= 'h0f;
			
			mem[304] <= 'h24;
			mem[305] <= 'h14;
			mem[306] <= 'h00;
			mem[307] <= 'h0a;
			
			mem[308] <= 'h24;
			mem[309] <= 'h15;
			mem[310] <= 'h00;
			mem[311] <= 'h03;
			
			mem[312] <= 'h24;
			mem[313] <= 'h16;
			mem[314] <= 'h00;
			mem[315] <= 'h02;
			
			mem[316] <= 'h0e;
			mem[317] <= 'h74;
			mem[318] <= 'hb8;
			mem[319] <= 'h14;
			
			mem[320] <= 'h0e;
			mem[321] <= 'h95;
			mem[322] <= 'hc0;
			mem[323] <= 'h25;

			// ******************************************************	
			///Test Case 4: Store Operation
			// ****************************************************** 
			//addi $s1,$0,15
			//addi $s2,$0,10
			//addi $s3,$0,3
			//sw   $s1,100($0)			
			//addi $s1,$0,0
			//addi $s2,$0,10			
			//lw   $s3,100($0)						

			mem[400] <= 'h24;
			mem[401] <= 'h13;
			mem[402] <= 'h00;
			mem[403] <= 'h0f;
			
			mem[404] <= 'h24;
			mem[405] <= 'h14;
			mem[406] <= 'h00;
			mem[407] <= 'h0a;
			
			mem[408] <= 'h24;
			mem[409] <= 'h15;
			mem[410] <= 'h00;
			mem[411] <= 'h03;
			
			mem[412] <= 'hac;
			mem[413] <= 'h13;
			mem[414] <= 'h00;
			mem[415] <= 'h64;
			
			mem[416] <= 'h24;
			mem[417] <= 'h13;
			mem[418] <= 'h00;
			mem[419] <= 'h00;
			
			mem[420] <= 'h24;
			mem[421] <= 'h14;
			mem[422] <= 'h00;
			mem[423] <= 'h0a;
			
			mem[424] <= 'h48;
			mem[425] <= 'h15;
			mem[426] <= 'h00;
			mem[427] <= 'h64;
      
      // ******************************************************	
			///Test Case 5: Branch Equal - Not Taken
			// ****************************************************** 
			//addi $s1,$0,15
			//addi $s2,$0,10
			//addi $s3,$0,3
			//addi $s4,$0,2			
			//beq  $s1,$s2,-5
			//addi $s1,$0,30
			//addi $s2,$0,20
			//addi $s3,$0,6
			//addi $s3,$0,6
			//addi $s3,$0,6						
		
			mem[500] <= 'h24;
			mem[501] <= 'h13;
			mem[502] <= 'h00;
			mem[503] <= 'h0f;
			
			mem[504] <= 'h24;
			mem[505] <= 'h14;
			mem[506] <= 'h00;
			mem[507] <= 'h0a;
					
			mem[508] <= 'h24;
			mem[509] <= 'h15;
			mem[510] <= 'h00;
			mem[511] <= 'h03;
					
			mem[512] <= 'h24;
			mem[513] <= 'h16;
			mem[514] <= 'h00;
			mem[515] <= 'h02;
			
			// BEQ
			mem[516] <= 'h16;
			mem[517] <= 'h74;
			mem[518] <= 'hff;
			mem[519] <= 'hfb;
			
			mem[520] <= 'h24;
			mem[521] <= 'h13;
			mem[522] <= 'h00;
			mem[523] <= 'h1e;
					
			mem[524] <= 'h24;
			mem[525] <= 'h14;
			mem[526] <= 'h00;
			mem[527] <= 'h14;
					
			mem[528] <= 'h24;
			mem[529] <= 'h15;
			mem[530] <= 'h00;
			mem[531] <= 'h06;			
			
			mem[532] <= 'h24;
			mem[533] <= 'h15;
			mem[534] <= 'h00;
			mem[535] <= 'h06;
					
			mem[536] <= 'h24;
			mem[537] <= 'h15;
			mem[538] <= 'h00;
			mem[539] <= 'h06;	
		

			// ******************************************************	
			///Test Case 6: ALU-ALU FWD 
			// ****************************************************** 
			//addi $s1,$0,15
			//addi $s2,$0,10
			//addi $s3,$0,3
			//add  $s4,$s1,$s2			
			//add  $s5,$s4,$s3
			
			mem[600] <= 'h24;
			mem[601] <= 'h13;
			mem[602] <= 'h00;
			mem[603] <= 'h0f;
			
			mem[604] <= 'h24;
			mem[605] <= 'h14;
			mem[606] <= 'h00;
			mem[607] <= 'h0a;
			
			mem[608] <= 'h24;
			mem[609] <= 'h15;
			mem[610] <= 'h00;
			mem[611] <= 'h03;
			
			mem[612] <= 'h0e;
			mem[613] <= 'h74;
			mem[614] <= 'hb0;
			mem[615] <= 'h20;
			
			mem[616] <= 'h0e;
			mem[617] <= 'hd5;
			mem[618] <= 'hb8;
			mem[619] <= 'h20;
      
		//////// additional test cases
      
      // test case 1
            // addi $t2 $0 5
            mem[700] <= 8'b00100100;
            mem[701] <= 8'b00001010;
            mem[702] <= 8'b00000000;
            mem[703] <= 8'b00000101;

            // addi $t3 $0 10
            mem[704] <= 8'b00100100;
            mem[705] <= 8'b00001011;
            mem[706] <= 8'b00000000;
            mem[707] <= 8'b00001010;

            // sll  $t1 $t2 2
            mem[708] <= 8'b00001100;
            mem[709] <= 8'b00001010 ;
            mem[710] <= 8'b01001000;
            mem[711] <= 8'b10000000;
      
      // test case 2
            // addi $t2 $0 5
            mem[800] <= 8'b00100100;
            mem[801] <= 8'b00001010;
            mem[802] <= 8'b00000000;
            mem[803] <= 8'b00000101;

            // addi $t3 $0 10
            mem[804] <= 8'b00100100;
            mem[805] <= 8'b00001011;
            mem[806] <= 8'b00000000;
            mem[807] <= 8'b00001010;

            // lw $t4 16($0)
            mem[808] <= 8'b01001000;
            mem[809] <= 8'b00001100;
            mem[810] <= 8'b00000000;
            mem[811] <= 8'b00010000;

            // add $t5 $t2 $t4 
            mem[812] <= 8'b00001101;
            mem[813] <= 8'b01001100;
            mem[814] <= 8'b01101000;
            mem[815] <= 8'b00100000;
      
      
      // test case 3
      //lw $t0,0($0)
		
      mem[900] <= 8'b01001000;
      mem[901] <= 8'b00001000;
      mem[902] <= 8'b00000000;
      mem[903] <= 8'b00000000;
			
      //lw $t1,4($0)
      mem[904] <= 8'b01001000;
      mem[905] <= 8'b00001001;
      mem[906] <= 8'b00000000;
      mem[907] <= 8'b00000100;
      
      //div $t1,$t0
      mem[908] <= 8'b00001101; 
      mem[909] <= 8'b00101000;
      mem[910] <= 8'b00000000;
      mem[911] <= 8'b00011010;
	
      //mflo $t2
      mem[912] <= 8'b00001100; 
      mem[913] <= 8'b00000000;
      mem[914] <= 8'b01010000;
      mem[915] <= 8'b00010010;
			 
     ////// test case 4
      mem[0] <= 8'b00010101; // beq $t1, $t1, 2
      mem[1] <= 8'b00101001;
      mem[2] <= 8'b00000000;
      mem[3] <= 8'b00000001;

      mem[4] <= 8'b00100100;// addi $t0,zero,3
      mem[5] <= 8'b00001000;
      mem[6] <= 8'b00000000;
      mem[7] <= 8'b00000011;

      mem[8]  <= 8'b00100100; // addi $t1,$zero,4
      mem[9]  <= 8'b00001001;
      mem[10] <= 8'b00000000;
      mem[11] <= 8'b00000100;

      mem[12] <= 8'b00100100; // addi $t2,$zero,5
      mem[13] <= 8'b00001010;
      mem[14] <= 8'b00000000;
      mem[15] <= 8'b00000101;
      
      // test case 5
      mem[1000] <= 8'b00001100; // jr t5
      mem[1001] <= 8'b00011001;
      mem[1002] <= 8'b00000000;
      mem[1003] <= 8'b00001000;

      mem[1004] <= 8'b00100100; // addi $t0,zero,3
      mem[1005] <= 8'b00001000;
      mem[1006] <= 8'b00000000;
      mem[1007] <= 8'b00000011;

      mem[1008] <= 8'b00100100; // addi $t0,zero,4
      mem[1008] <= 8'b00001000;
      mem[1010] <= 8'b00000000;
      mem[1011] <= 8'b00000100;
      
      
      // test case 6
      mem[1100] <= 8'b00001000; // j 3
      mem[1101] <= 8'b00000000;
      mem[1102] <= 8'b00000000;
      mem[1103] <= 8'b00000011;

      mem[1104] <= 8'b00100100; // addi $t0,$zero,3
      mem[1105] <= 8'b00001000;
      mem[1106] <= 8'b00000000;
      mem[1107] <= 8'b00000011;

      mem[1108] <= 8'b00100100; // addi $t0,$zero,4
      mem[1109] <= 8'b00001000;
      mem[1110] <= 8'b00000000;
      mem[1111] <= 8'b00000100;

      mem[1112] <= 8'b00100100; // addi $t0,$zero,5
      mem[1113] <= 8'b00001000;
      mem[1114] <= 8'b00000000;
      mem[1115] <= 8'b00000101;
      
      
      // test case 7
      mem[1200] <= 8'b01000110; // add.s	f3,f2,f1
      mem[1201] <= 8'b00000001;
      mem[1202] <= 8'b00010000;
      mem[1203] <= 8'b11000000; 
      
      
      // test case 8
      
      mem[1300] <= 8'b00100100;// addi $t0,zero,3
      mem[1301] <= 8'b00001000;
      mem[1302] <= 8'b00000000;
      mem[1303] <= 8'b00000011;

      
      mem[1304] <= 8'b00010001; // bne $t1, $t0, 1
      mem[1305] <= 8'b00101000;
      mem[1306] <= 8'b00000000;
      mem[1307] <= 8'b00000001;
      
      mem[1308] <= 8'b00100100; // addi $t1,$zero,4
      mem[1309] <= 8'b00001001;
      mem[1310] <= 8'b00000000;
      mem[1311] <= 8'b00000100;

      mem[1312] <= 8'b00100100; // addi $t2,$zero,5
      mem[1313] <= 8'b00001010;
      mem[1314] <= 8'b00000000;
      mem[1315] <= 8'b00000101;
      
      // test case 9 
      
      mem[1400] <= 8'b00111100; // lui $t1 3
      mem[1401] <= 8'b00001001;
      mem[1402] <= 8'b00000000;
      mem[1403] <= 8'b00000011; 
      
    
        // test case 10 
      // Load Word New	3h  21h
      // Store Byte	28h
     
      mem[1500] <= 8'b00100100; // addi $t0,zero,3
      mem[1501] <= 8'b00001000;
      mem[1502] <= 8'b00000000;
      mem[1503] <= 8'b00000011;
      
      mem[1504] <= 8'b00100100; // addi $t1,zero,8
      mem[1505] <= 8'b00001001;
      mem[1506] <= 8'b00000000;
      mem[1507] <= 8'b00001000;
      
       
      mem[1508] <= 8'b00100100; // addi $t3,zero,11
      mem[1509] <= 8'b00001011;
      mem[1510] <= 8'b00000000;
      mem[1511] <= 8'b00001011;
      
      
     
      mem[1512] <= 8'b10100000;  //sb   $t0,8($0)
      mem[1513] <= 8'b00001000;
      mem[1514] <= 8'b00000000;
      mem[1515] <= 8'b00001000;
            
      
      mem[1516] <= 8'b00001100;  //lwn   $zero, $t1, $t2
      mem[1517] <= 8'b00001010;
      mem[1518] <= 8'b01001000;
      mem[1519] <= 8'b00100001;
      
      // test case 11 
      mem[1600] <= 8'b01000110;  // c.le.s 
      mem[1601] <= 8'b00000100;
      mem[1602] <= 8'b00000000;
      mem[1603] <= 8'b11100011;
      
      // test case 12
      mem[1700] <= 8'b00100100; // addi $t2,$zero,-5
      mem[1701] <= 8'b00001010;
      mem[1702] <= 8'b11111111;
      mem[1703] <= 8'b11111011;
      
      mem[1704] <= 8'b00001100; // sra $t1,$t2,1
      mem[1705] <= 8'b00001010;
      mem[1706] <= 8'b01001000;
      mem[1707] <= 8'b01000011;
      
      mem[1708] <= 8'b00001100; // srl $t3,$t2,1
      mem[1709] <= 8'b00001010;
      mem[1710] <= 8'b01011000;
      mem[1711] <= 8'b01000010;
					
    
      
	end	 
   assign instruction = {mem[PC],mem[PC+1],mem[PC+2],mem[PC+3]}; 
endmodule