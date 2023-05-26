const Contracts = artifacts.require('StudentListStorage.sol')

module.exports = async function (calldata) {
    const studentListStorage = await Contracts.deployed()

    await studentListStorage.addList('kerwinliu', 888)


    const list = await studentListStorage.getList()

    console.log(list)

    calldata()
}