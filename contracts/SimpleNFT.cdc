import "NonFungibleToken"
import "MetadataViews"
import "UniversalCollection"

access(all) contract interface SimpleNFT: NonFungibleToken{

    access(all) identifier: String
    access(all) nftType:Type

    //TODO: here we cannot override the build in createEmptyCollection method because the post condition will fire in the wrong order
    access(all) fun createEmptyUniversalCollection(): @{NonFungibleToken.Collection} {
        return <- UniversalCollection.createEmptyCollection(identifier: self.identifier, type: self.nftType)
    }

    access(all) view fun getCollectionDisplay() : MetadataViews.NFTCollectionDisplay

    access(all) view fun getCollectionData() : MetadataViews.NFTCollectionData {
        return MetadataViews.NFTCollectionData(
            storagePath: StoragePath(identifier: self.identifier)!,
            publicPath: PublicPath(identifier: self.identifier)!,
            publicCollection: Type<&UniversalCollection.Collection>(),
            publicLinkedType: Type<&UniversalCollection.Collection>(),
            createEmptyCollectionFunction: (fun(): @{NonFungibleToken.Collection} {
                return <-self.createEmptyCollection(nftType: self.nftType)
            })
        )
    }

    /// Function that returns all the Metadata Views implemented by a Non Fungible Token
    ///
    /// @return An array of Types defining the implemented views. This value will be used by
    ///         developers to know which parameter to pass to the resolveView() method.
    ///
    access(all) view fun getContractViews(resourceType: Type?): [Type] {
        return [
        Type<MetadataViews.NFTCollectionData>(),
        Type<MetadataViews.NFTCollectionDisplay>()
        ]
    }


    /// Function that resolves a metadata view for this contract.
    ///
    /// @param view: The Type of the desired view.
    /// @return A structure representing the requested view.
    ///
    //
    access(all) fun resolveContractView(resourceType: Type?, viewType: Type): AnyStruct? {
        switch viewType {
        case Type<MetadataViews.NFTCollectionData>():
            return self.getCollectionData()
        case Type<MetadataViews.NFTCollectionDisplay>():
            return self.getCollectionDisplay()
        }
        return nil
    }

}

