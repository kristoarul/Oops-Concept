public class CreatingAccount {
    public Account createAccount(String name) {
		Account acc = new Account();
		acc.Name = name;
		return acc;
	}

}