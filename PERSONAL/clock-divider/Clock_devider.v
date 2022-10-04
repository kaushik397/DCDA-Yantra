module Clock_devider(
    input wire clk,
    input wire reset,

    input wire [15:0] datain,

    output wire spi_cs_l,
    output wire spi_sclk,
    output wire spi_data,
    output wire [4:0] counter
);

reg [15:0] MOSI;
reg [4:0] count;
reg cs_l;
reg sclk = 1'b0;
reg [2:0] state;

reg [4:0] clk_counter = 0;

// SPI Output Clock frequency = 1MHz

always @(posedge clk) begin
    if (clk_counter == 24) begin
        clk_counter <= 0;
        sclk <= ~sclk;
    end
    else begin
        clk_counter <= clk_counter + 1'd1;
    end
end

always @(posedge clk or posedge reset) begin
    if(reset) begin
        MOSI <= 16'b0;
        count <= 5'd16;
        cs_l <= 1'b1;
    end
    else begin
        case (state)
        0:begin
            cs_l <= 1'b1;
            state <= 1;
        end
        1:begin
            cs_l <= 1'b0;
            MOSI <= datain[count-1];
            count <= count-1;
            state <= 2;
        end
        2:begin
            if(count > 0) begin
                state <= 1;
            end
            else begin
                count <= 16;
                state <= 0;
            end
        end
        default:state<=0;
        endcase
    end
end

assign spi_cs_l = cs_l;
assign spi_sclk = sclk;
assign spi_data = MOSI;
assign counter = count;

endmodule