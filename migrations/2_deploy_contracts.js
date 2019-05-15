const DappToken = artifacts.require("DappToken");
const DappTokenSale = artifacts.require("DappTokenSale");

module.exports = function (deployer) {
    deployer.deploy(DappToken, 1000000).then(function () {

        //token pric ein ether 0.01ether
        var tokenPrice = 1000000000000000;;//in wei
        return deployer.deploy(DappTokenSale,DappToken.address,tokenPrice);
    });
        
};
