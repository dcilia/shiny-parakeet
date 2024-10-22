import SwiftUI
import OpenAPIClient
import ComposableArchitecture
import Kingfisher

struct RecipeListView: View {
    
    @Bindable var store: StoreOf<RecipeFeature>
    
    var body: some View {
        baseContent()
            .animation(.easeInOut, value: store.data)
        .onAppear {
            self.store.send(.fetchRecipes)
        }
        .alert(item: $store.alertText.sending(\.isAlertTextChanged)) { item in
            Text(item)
        } actions: { _ in
            
            Button("Okay", role: .cancel) {
                store.send(.isAlertTextChanged(nil))
            }
            Button("Cancel", role: .destructive) {
                store.send(.isAlertTextChanged(nil))
            }.foregroundStyle(.red)
        }
    }
}

//ViewBuilders
extension RecipeListView {
    
    @ViewBuilder
    func baseContent() -> some View {
        Group {
            switch store.data {
            case .empty:
                emptyDataContent
                    .transition(.opacity)
            case .initial:
                Text("Loading...")
                    .transition(.opacity)
            case .success:
                mainContent
                    .transition(.opacity)
            }
        }
        .searchable(
            text: $store.filter.sending(\.updateFilter),
            placement: .navigationBarDrawer(
                displayMode: .always
            ),
            prompt: "Search recipes by name or cuisine"
        )
    }
    
    @ViewBuilder
    var mainContent: some View {
        List(store.filteredRecipes, id: \.uuid) { recipe in
            LazyVStack {
                CardWidgetView {
                    topContent(recipe: recipe)
                        .padding()
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .refreshable {
            //Don't refresh if the state is in progress or if user is searching.
            if store.progress == .idle && store.filter.isEmpty {
                store.send(.fetchRecipes)
            }
        }
        .navigationTitle("Recipes")
    }
    
    @ViewBuilder
    func getImage(from url: String) -> some View {
        
        KFImage(URL(string: url))
            .cacheOriginalImage()
            .fade(duration: 0.25)
            .resizable(
                capInsets: EdgeInsets(
                    top: 10,
                    leading: 10,
                    bottom: 10,
                    trailing: 10
                )
            )
            .placeholder({
                Image(systemName: "photo")
                    .resizable()
            })
            .scaledToFit()
    }
    
    @ViewBuilder
    func topContent(recipe: AnyRecipe) -> some View {
        LazyVStack(alignment: .leading) {
            if let name = recipe.name {
                Text(name)
                    .font(.title)
                    .bold()
            }
            if let cuisine = recipe.cuisine {
                Text(cuisine)
                    .font(.subheadline)
            }
            if let path = recipe.photoUrlLarge {
                getImage(from: path)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
            }
            
            shelfContent(recipe: recipe)
                .padding(.top)
        }
    }
    
    @ViewBuilder
    var emptyDataContent: some View {
        LazyVStack {
            Text("No Recipes Found :-(")
                .font(.largeTitle)
                .lineLimit(nil)
                .padding()
            
            //only show the refresh button
            //if the user has not filtered the
            //list
            if store.filter.isEmpty {
                Button("Refresh") {
                    store.send(.fetchRecipes)
                }
                .buttonStyle(.bordered)
            }
        }
    }
    
    @ViewBuilder
    func shelfContent(recipe: AnyRecipe) -> some View {
        HStack {
            Spacer()
            if let _ = recipe.sourceUrl {
                Button {
                    
                    store.send(.isAlertTextChanged("Open in Safari?"))
                } label: {
                    HStack {
                        Image(systemName: "safari")
                        Text("View Recipe")
                            .font(.subheadline)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .font(.subheadline)
            }
            
            if let _ = recipe.sourceUrl, let _ = recipe.youtubeUrl {
                Divider()
            }
            
            if let _ = recipe.youtubeUrl {
                Button {
                    //launch video
                    store.send(.isAlertTextChanged("Watch on YouTube?"))
                } label: {
                    HStack {
                        Image(systemName: "video")
                        Text("Watch Video")
                            .font(.subheadline)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .font(.subheadline)
            }
            Spacer()
        }
    }
}



extension AnyRecipe: Identifiable {
    var id: String {
        self.uuid ?? UUID().uuidString
    }
}


#Preview {
    var recipeData: [AnyRecipe] {
        let decoder = JSONDecoder()
        if let path = Bundle.main.path(forResource: "valid", ofType: "json"), let url = URL(string: path), let data = try? Data(contentsOf: url), let recipes = try? decoder.decode(
            [RecipesInner].self,
            from: data
        ) {
        
            return recipes.map {
                AnyRecipe($0)
            }
            
        }
        
        return []
    }
    
    NavigationStack {
        RecipeListView(store: Store(initialState: RecipeFeature.State(recipes: recipeData, filteredRecipes: recipeData), reducer: {
            RecipeFeature()
        }))
        .navigationTitle("Recipes")
    }
    
}


