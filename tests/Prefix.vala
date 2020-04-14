using United;

private void register_prefix_test() {

     Test.add_func("/United/Prefix#micro_to_string", () => {

        // Given
        var prefix = Prefix.micro();

        // When
        var micro = prefix.to_string();

        // Then
        assert(micro == "μ");
    });
 
    Test.add_func("/United/Prefix#none_to_string", () => {

        // Given
        var prefix = Prefix.none();

        // When
        var none = prefix.to_string();

        // Then
        assert(none == "");
    });
}
