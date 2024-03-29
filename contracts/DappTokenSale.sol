pragma solidity ^0.5.0;

import "./DappToken.sol";
contract DappTokenSale{

	address payable admin;
    DappToken public tokenContract;
	uint256 public tokenPrice;
	uint256 public tokensSold;


	event Sell(
	address _buyer,
	uint256 _amount
	);

    constructor(DappToken _tokenContract,uint256 _tokenPrice)public{
        
        //assign admin

		admin=msg.sender;
        //token contract
		tokenContract=_tokenContract;

		tokenPrice=_tokenPrice;
        //token price
    }


	//multiply fxn

	function multiply(uint x,uint y)internal pure returns (uint z){
	require(y==0||(z=x*y)/y==x);
	}

	//Buy Tokens

	function buyTokens(uint256 _numberOfTokens)public payable{
	
	//require that value is equal to tokens
	require(msg.value == multiply(_numberOfTokens,tokenPrice));

	//require taht the contracthas enough tokens
	require(tokenContract.balanceOf(address(this))>=_numberOfTokens);

	//require that a transfer is successful

	require(tokenContract.transfer(msg.sender,_numberOfTokens));
	//keep track of tokenssold
	tokensSold+=_numberOfTokens;

	//trigger sell event
	emit Sell(msg.sender,_numberOfTokens);
	}



	//Ending Token DappSaleToken

	function endSale() public payable{
	
	//require admin
	require(msg.sender==admin);

	//transfer remainingdapp tokens to admin

	require(tokenContract.transfer(admin,tokenContract.balanceOf(address(this))));
	//destroy the contract

	//selfdestruct(msg.sender);

	}
    
}