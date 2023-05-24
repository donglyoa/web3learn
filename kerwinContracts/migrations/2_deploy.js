// 直接导出合约名，它会定位到contracts文件夹下
const Contracts = artifacts.require('./StudentListStorage.sol')

module.exports = function (deployer) {
    deployer.deploy(Contracts)
}