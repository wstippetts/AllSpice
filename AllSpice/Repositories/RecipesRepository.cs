namespace AllSpice.Repositories;

public class RecipesRepository
{
  private readonly IDbConnection _db;
  public RecipesRepository(IDbConnection db)
  {
    _db = db;
  }
  internal Recipe CreateRecipe(Recipe recipeData)
  {
    string sql = @"
    INSERT INTO recipe
    (creatorId, title, instructions, img, category)
    VALUES
    (@creatorId, @title, @instructions, @img, @category)
    SELECT LAST_INSERT_ID();
    ";
    int id = _db.ExecuteScalar<int>(sql, recipeData);
    recipeData.Id = id;
    return recipeData;
  }
  internal List<Recipe> GetAll()
  {
    string sql = @"
    SELECT
    rec.*,
    acc.*
    FROM Recipes rec
    JOIN accounts acc ON rec.creatorId = acc.id;
    ";
    List<Recipe> recipes = _db.Query<Recipe, Profile, Recipe>(sql, (rec, prof) =>
    {
      rec.Creator = prof;
      return rec;
    }).ToList();
    return recipes;
  }
}