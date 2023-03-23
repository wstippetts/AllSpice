namespace AllSpice.Services;

public class FavoritesService
{
  private readonly FavoritesRepository _repo;
  private readonly RecipesService _recipesService;

  public FavoritesService(FavoritesRepository repo, RecipesService recipesService)
  {

  }

  internal List<MyRecipe> GetMyRecipes(string ProfileId)
  {
    List<MyRecipe> myRecipes = _repo.GetMyRecipes(ProfileId);
    return myRecipes;
  }
}
