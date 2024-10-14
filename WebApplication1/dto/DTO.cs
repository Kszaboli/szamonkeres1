namespace WebApplication1.dto
{
    public class DTO
    {
        public record JegyDto(Guid Id, int jegy, string leiras, DateTime letrehozas_ideje);
        public record CreateJegyDto(int jegy, string leiras);
    }
}
