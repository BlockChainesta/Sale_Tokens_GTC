pragma solidity ^0.5.0;

/**
 * The contractName contract does this and that...
 */

contract Token {

  /****** Token's caracters ******/	
  // Token's name
  string public tokenName ="Ghof Token";
  // Token's Symbol
  string public tokenSymbol ="GTC";
  //Token's Standard
  string public tokenStandard ="Ghof Token v1.0";

  // State-variable that design the total of tokens
  uint256 public totalSupply;

  //Event object for the transfer function
  event Transfer(
  	    address indexed from,
  	    address indexed recipient,
  	    uint256 _sendBalance
  	);
  event Approval(
  	    address _owner,
  	    address _spender,
  	    uint256 _value
  	);
  
  

  //Collection of addreses's balances
  mapping (address => uint256) balanceOf;
  mapping (address => mapping (address => uint256) allowance;
  ) myMapping;
      

  //Constructeur	
  constructor(uint256 _initialSupply) public {
    balanceOf[msg.sender]=_initialSupply;
    totalSupply=_initialSupply;
  }

  //Transfer function will
  /*Throws an excepton if the sender doesn't have enough balance*/
  /*Trager an event object */
  /*Return a boolean*/

  function transfer(address _recipient, uint256 _value) public view returns(bool success) {
    
    //Cancel the transaction if the sender doesn't have enough balaces
    require(balanceOf[msg.sender]>=_value);
    //Calculating
    balanceOf[msg.sender]-=_value;
    balanceOf[_recipient]+=_value;
    //Triggering the transfer event
    Transfer(msg.sender, _recipient, _value);
    //Return the boolean
    return true;
  }

  function approve (address _spender,uint256 _value) public returns(bool success){
  	
  	Approval(msg.sender,_spender,_value);

  	return true;
  }
  
  

}


