async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);
    // console.log("Account balance:", (await deployer.getBalance()).toString());

    const MicroEdgeCertificate = await ethers.getContractFactory("MicroEdgeCertificate");
    const contract = await MicroEdgeCertificate.deploy();

    console.log("Contract deployed to address:", contract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
