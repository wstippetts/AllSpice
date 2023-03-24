namespace AllSpice.Services;

public class RecipesService
{
  private readonly RecipesRepository _repo;

  public RecipesService(RecipesRepository repo)
  {
    _repo = repo;
  }

  internal Recipe CreateRecipe(Recipe recipeData)
  {
    Recipe recipe = _repo.CreateRecipe(recipeData);
    return recipe;
  }

  internal List<Recipe> Get(string userId)
  {
    List<Recipe> recipes = _repo.GetAll();
    recipes = recipes.FindAll(r => r.CreatorId == userId);
    return recipes;
  }
}
