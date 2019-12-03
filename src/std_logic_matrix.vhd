library IEEE;
	use IEEE.std_logic_1164.all;
	use IEEE.numeric_std.all;

package std_logic_matrix is

    type std_logic_matrix is array (natural range <>, natural range <>) of std_logic;

    procedure slm_row_from_slv(signal slm : out std_logic_matrix; constant row : natural; signal slv : in std_logic_vector);
    procedure slm_row_from_slv_strb(signal slm : out std_logic_matrix; constant row : natural; signal slv : in std_logic_vector;
                                    signal strb : in std_logic_vector);
    procedure slv_from_slm_row(signal slv : out std_logic_vector; signal slm : in std_logic_matrix; constant row : natural);
    procedure slv_from_slm_row_var(slv : out std_logic_vector; signal slm : in std_logic_matrix; constant row : natural);

	--Operadores
    -- function "+"   (l:std_logic_matrix; r: std_logic_matrix) return std_logic_matrix;
    
	-- function "-"   (l:std_logic_matrix; r: std_logic_matrix) return std_logic_matrix;
    
	-- function "*"   (l:std_logic_matrix; r: std_logic_matrix) return std_logic_matrix;
    
	-- function "/"   (l:std_logic_matrix; r: std_logic_matrix) return std_logic_matrix;
    
	-- function "mod"   (l:std_logic_matrix; r: std_logic_matrix) return std_logic_matrix;
    
	-- function "rem"   (l:std_logic_matrix; r: std_logic_matrix) return std_logic_matrix;
    
	-- function "="   (l:std_logic_matrix; r: std_logic_matrix) return boolean;
    
	-- function "/="   (l:std_logic_matrix; r: std_logic_matrix) return boolean;
    
	-- function ">"   (l:std_logic_matrix; r: std_logic_matrix) return boolean;
    
	-- function "<"   (l:std_logic_matrix; r: std_logic_matrix) return boolean;
    
	-- function ">="   (l:std_logic_matrix; r: std_logic_matrix) return boolean;
    
	-- function "<="   (l:std_logic_matrix; r: std_logic_matrix) return boolean;

end std_logic_matrix;

--a arquitetura
package body std_logic_matrix is

    procedure slm_row_from_slv(signal slm : out std_logic_matrix; constant row : natural; signal slv : in std_logic_vector) is
    begin
        for i in (slv'length-1) downto 0 loop
            slm(row, i) <= slv(i);
        end loop;
    end procedure;
    procedure slm_row_from_slv_strb(signal slm : out std_logic_matrix; constant row : natural; signal slv : in std_logic_vector;
                                    signal strb : in std_logic_vector) is
    begin
        for s in 0 to (strb'length-1) loop
            if (strb(s) = '1') then
                for i in (s*8) to ((s+1)*8-1) loop
                    slm(row, i) <= slv(i);
                end loop;
            end if;
        end loop;
    end procedure;

    procedure slv_from_slm_row(signal slv : out std_logic_vector; signal slm : in std_logic_matrix; constant row : natural) is
    begin
        for i in slv'range loop
            slv(i) <= slm(row, i);
        end loop;
    end procedure;
    -- Same as slv_from_slm_row but the output is in a variable
    procedure slv_from_slm_row_var(slv : out std_logic_vector; signal slm : in std_logic_matrix; constant row : natural) is
    begin
        for i in slv'range loop
            slv(i) := slm(row, i);
        end loop;
    end procedure;

	-- function "+" (l:gray_vector; r: gray_vector        ) return gray_vector is
	-- 	variable tmp : gray_vector(l'range);
	-- begin
	-- 	tmp := to_gray( to_unsigned(l) + to_unsigned(r) );
	-- 	return tmp;
	-- end "+";

	-- function "-" (l:gray_vector; r: gray_vector        ) return gray_vector is
	-- 	variable tmp : gray_vector(l'range);
	-- begin
	-- 	tmp := to_gray( to_unsigned(l) - to_unsigned(r) );
	-- 	return tmp;
	-- end "-";

	-- function ">" (l:gray_vector; r: gray_vector        ) return gray_vector is
	-- 	variable tmp : boolean;
	-- begin
	-- 	tmp := to_unsigned(l) > to_unsigned(r);
	-- 	return tmp;
	-- end ">";

	-- function ">=" (l:gray_vector; r: gray_vector        ) return gray_vector is
	-- 	variable tmp : boolean;
	-- begin
	-- 	tmp := to_unsigned(l) >= to_unsigned(r);
	-- 	return tmp;
	-- end ">=";

	-- function "<" (l:gray_vector; r: gray_vector        ) return gray_vector is
	-- 	variable tmp : boolean;
	-- begin
	-- 	tmp := to_unsigned(l) < to_unsigned(r);
	-- 	return tmp;
	-- end "<";

	-- function "<=" (l:gray_vector; r: gray_vector        ) return gray_vector is
	-- 	variable tmp : boolean;
	-- begin
	-- 	tmp := to_unsigned(l) <= to_unsigned(r);
	-- 	return tmp;
	-- end "<=";

end std_logic_matrix;
