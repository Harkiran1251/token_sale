var DappToken = artifacts.require("./DappToken.sol");

contract('Dapptoken',function(accounts){
    it('sets the total supply upon deployment', function() {
        return DappToken.deployed().then(function (instance) {
            tokenInstance = instance;//passing the abv instance here and will use tokenInstanc ein the promisecahin
            return tokenInstance.totalSupply();//totalSupply we defined in our smartcontract
        }).then(function (totalSupply) {//execute a promisechain here..call back function for totalSupply
            //here we will chk it is equal to expected value
            assert.equal(totalSupply.toNumber(), 1000000,'sets the totalsupply to 1000000');

        });
    });

})

