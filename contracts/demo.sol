// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract demo{
    string public str = "HELLO WORLD";      // state variable => gas cost too and auto getter made 
    uint public num  = 7;
    function setter (uint _num) public {
        num = _num;
    }
    function getter() public view returns(uint){
        return num;
    }

    function loop() public pure returns (uint){
        // loops can be used only at function level not at contratc level
        uint count = 0;
        uint sum = 0;
        while(count <= 5){
            sum+=count;
            count++;
        }

        for(uint i = 0 ; i <= 5; i++){
            sum+=i;
        }

        do{
            sum+=count;
        }while(count<5);

        return sum;
    }

    function conditionals(uint num1) public pure returns(uint){
        // conditionals cant be called at contract level like loops
        if (num1 <10) {
            return num1;
        }
        else return num1%10;
    }

    // booleans => default value is false if not initialized
    bool public flag ;
    function ret () public view returns(bool){
        return flag;
    }

    // REQUIRE STATEMENT && REVERT STATEMENY

    function isZero (uint a) public pure returns(bool){
        require(a==0, "a is not zero here , it throws a error");    // require(condn,"error message")
        return true;                                                // if true what to do
    }
    // alternative
    function isZeroIF (uint a) public pure returns(bool) {
        if(a==0) return true;
        revert("a is not zero here , it throws a error");
    }
    // modifier => if some cod eis repeated in different functions use it
    modifier isTrue{
        require(true==true, "ERROR THROW");
        _;  // rest of code pasted here
    }
    function f1() public isTrue pure returns(uint){
        return 1;
    }

    // MOdifier with arguments
    modifier isEven(uint a){
        require(a%2==0, "Throw error not even");
        _;
    }
    function Even(uint a) public isEven(a) pure returns(bool){
        return true;
    }

    // addrress data type
    // used to store addresses
    address public addr = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2; // 160 bits

    // arrays(fixed size)

    uint[5] public arr;

    function display()public view returns(uint[5] memory){
        // use memory bcoz state variable like array is a reference var &&  is stored in the blockchain storage
        return arr; // returns all ele
    }
    // returns a single element
    function singledisplay(uint idx) public view returns(uint){
        return arr[idx];
    }
    function updater(uint idx ,uint val) public{
        arr[idx] = val;
    }

    // DYNAMIC ARRAYS;

    uint[] public array; // like vector
    // push,pop,length functions like vector
    function insert(uint val) public{
        array.push(val);
    }
    function removeLast() public{
        array.pop();
    }
    function len() public view returns(uint){
        return array.length;
    }
    function Display() public view returns(uint[] memory) {
        return array;
    }

    // reference dtypes => arrays, strings, struct
    // for passing any kind of reference data type inside a function we have to use memory keyword
    // memory => value updatable but calldata=> non updatable // non mutable
    // memory can be used elsewise but call data can only be used only during argument passing not in return

    // memory vs storage

    uint[3] public brr=[1,2,3]; // made in storage 

    function fmemory() public view{ // view since no modifications occur to state var
        uint[3] memory arr2 = brr;  // made a copy of brr in arr2
        arr2[2] = 9;
    }
    function fstorage() public {    // modifying state var => no view/pure
        uint[3] storage arr3 = brr;  // pointer to brr
        arr3[2] = 9;
    }
    //  # storage -> contract level, # memory => function level

    // STRUCT DATA TYPE: A composite of other dtypes

    struct Student{
        string name;
        uint roll;
        bool pass;
    }

    Student public s1;
    function setter(string memory _name, uint _roll, bool _pass) public {   // since string is a reference dtype
        s1 = Student(_name, _roll, _pass);
    }

    function getter1() public view returns(Student memory){
        return s1;
    }

    function getName() public view returns (string memory){
        return s1.name;
    }
    // similarly you can create array of struct dtype too we can use dynamic arrays

    // MAPPING
    // SYNTAX BELOW
    
    mapping (uint=>string) public data;     // (dtype1 => dtype2) // (key => value) // like c++

    // you can call a function as many times you want without loop in solidity
    function insert(uint _roll, string memory _name) public {
        data[_roll] = _name;
    }

    function NAMEdisplay(uint _roll) public view returns(string memory){
        return data[_roll];
    }   
    // similarly you can do mapping with struct 

    // NESTED MAPPING JUST LIKE C++
    // mapping (d1 => mapping(d2 => d3))public var; // var[d1][d2] = d3;

    mapping (uint => mapping( uint => bool ) ) public DATA;

    function insert1 (uint _row, uint _col, bool val) public {
        DATA[_row][_col] = val;
    }
    
    function View (uint _row, uint _col) public view returns(bool){
        return DATA[_row][_col];
    }

    // mapping with arrays samelike C++;
    
}