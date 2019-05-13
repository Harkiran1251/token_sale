pragma solidity ^0.5.0;

contract DappToken{
//name
string public name="Dapp Token";
//symbol
string public symbol="DAPP";
string public standard="Dapp Token v1.0";
uint256 public totalSupply;

event Transfer(
address indexed _from,
address indexed _to,
uint256 _value
);

mapping(address=>uint256) public balanceOf;
constructor(uint256 _initialSupply) public{
    
    balanceOf[msg.sender]=_initialSupply;//
	totalSupply=_initialSupply;
    //allocate theinitialSupply
    
}

	//transfer
	
	//returnboolean
	//transfer event

	function transfer(address _to,uint256 _value)public  returns(bool success){
	//exception if account doesn't have enough
	require(balanceOf[msg.sender]>=_value);
	//transfer the balance
	balanceOf[msg.sender]-=_value;

	balanceOf[_to]+=_value;

	 emit Transfer(msg.sender,_to,_value);
	 //returnboolean value
	 return true;

	}

} 