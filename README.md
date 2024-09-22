# Simple NFT

Playing around with making nfts on flow less verbose


 - flow dependencies install
 - go run main.go


## Results 
```
🧑 Created account: emulator-alice with address: 179b6b1cb6755e31 with flow: 10.00
🧑 Created account: emulator-bob with address: f3fcd2c1a78f5eee with flow: 10.00
📜 deploy contracts UniversalCollection, SimpleNFT, BasicNFT
panic: transaction=./transactions/setup.cdc: execution error code 1: [Error Code: 1101] error caused by: 1 error occurred:
		* transaction execute failed: [Error Code: 1101] cadence runtime error: Execution failed:
	error: invalid member access: expected `auth(NonFungibleToken.Withdraw) &{NonFungibleToken.Collection}`, got `auth(NonFungibleToken.Withdraw) &Void`
	   --> f8d6e0586b0a20c7.NonFungibleToken:249:12
	    |
	249 |             result.getIDs().length == 0: "The created collection must be empty!"
	    |             ^^^^^^^^^^^^^
goroutine 1 [running]:
github.com/bjartek/overflow/v2.OverflowInteractionBuilder.Send({{0x106e90540, 0x107fe11e0}, {0x1064b35c0, 0x5}, 0x0, 0x140007c26c0, {0x1064b35c0, 0x5}, {0x0, 0x0}, ...})
	/Users/bjartek/go/pkg/mod/github.com/bjartek/overflow/v2@v2.0.0/interaction_builder.go:643 +0xee0
github.com/bjartek/overflow/v2.(*OverflowState).sendTx(0x140007c26c0, 0x140008448c0)
	/Users/bjartek/go/pkg/mod/github.com/bjartek/overflow/v2@v2.0.0/state.go:565 +0x78
github.com/bjartek/overflow/v2.(*OverflowState).Tx(0x140007c26c0, {0x1064b35c0?, 0x1400079fef8?}, {0x14000a11f18?, 0x1?, 0x104f77c34?})
	/Users/bjartek/go/pkg/mod/github.com/bjartek/overflow/v2@v2.0.0/state.go:561 +0x4c
main.main()
	/Users/bjartek/dev/simple-nft/main.go:18 +0x130
exit status 2````
```
