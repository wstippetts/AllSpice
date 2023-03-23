namespace AllSpice.Repositories;

public class FavoritesRepository
{
  private readonly IDbConnection _db;
  public FavoritesRepository(IDbConnection db)
  {
    _db = db;
  }
  internal Favorite Create(Favorite favoriteData)
  {
    string sql = @"
  INSERT INTO favorites
  (recipeId, profileId)
  VALUES
  (@recipeId, @profileId);
  SELECT LAST_INSERT_ID();
  ";
    int id = _db.ExecuteScalar<int>(sql, favoriteData);
    favoriteData.Id = id;
    return favoriteData;
  }

  internal List<MyRecipe> GetMyRecipes(string profileId)
  {
    string sql = @"
    SELECT
    profiles.*,
    recipes.*,
    favorites.*

    FROM favorites 
    JOIN recipes ON recipes.id = favorites.recipeId
    JOIN profiles ON recipes.creatorId = profile.id
    WHERE favorites.profileId = @profileId;
    ";
    List<MyRecipe> myRecipes = _db.Query<MyRecipe, Favorite, Profile, MyRecipe>(sql, (Recipe, Favorite, Profile) =>
    {
      Recipe.FavoriteId = Favorite.Id;
      Recipe.Creator = Profile;
      return Recipe;
    }, new { profileId }).ToList();
    return myRecipes;
  }


}
