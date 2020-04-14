using United;

private void register_bytes_test() {

    Test.add_func("/United/Bytes#B->MB", () => {

        // Given
        var bytes = 1750000;

        // When
        var result = new United.Bytes(bytes);

        // Then
        var human = result.to_human().to_string();
        assert(human == "1.75MB");
    });

    Test.add_func("/United/Bytes/to_human#B->GB", () => {

        // Given
        var bytes = 5050000000;

        // When
        var result = new United.Bytes(bytes);

        // Then
        assert(result.to_human().to_string()  == "5.05GB");
    });

    Test.add_func("/United/Bytes/to#units_back_and_forth", () => {

        // Given
        var bytes = 5800000000;

        // When
        var B = new United.Bytes(bytes);

        // Then
        var GB = B.to(Prefix.giga());


        // When
        var B2 = GB.to(Prefix.none());
        
        // Then
        assert(B2.value == bytes);
        assert(B2.unit == "B");
        assert(B2.prefix.equals(Prefix.NONE));
        
        // When
        var MB = B.to(Prefix.mega());
        
        // Then
        assert(MB.value == 5800);
        assert(MB.to_string() == "5800MB");

        // When
        var KB = MB.to(Prefix.kilo());
        
        // Then
        assert(KB.value == 5800000);
        assert(KB.to_string("%.0f") == "5800000kB");


        // When
        var GB2 = KB.to(Prefix.giga());
        
        // Then
        assert(GB2.value == 5.8);
        assert(GB2.to_string() == "5.8GB");
    });
}

private void register_binary_bytes_test() {

    //Bytes to Binary 
    Test.add_func("/United/Bytes#B->MiB", () => {

        // Given
        var bytes = 1750000;

        // When
        var B = new United.Bytes(bytes);
        var MiB = B.to(BinaryPrefix.mebi());

        // Then
        assert(MiB.to_string() == "1.66893MiB");
    });

    //Bytes to Binary to bigger Binary
    Test.add_func("/United/Bytes#B -> KiB -> MiB", () => {

        // Given
        var bytes = 1750000;

        // When
        var B = new United.Bytes(bytes);
        var KiB = B.to(BinaryPrefix.kibi());
        var MiB = KiB.to(BinaryPrefix.mebi());

        // Then
        assert(KiB.to_string("%0.6f") == "1708.984375KiB");
        assert(MiB.to_string() == "1.66893MiB");
    });   
    
    Test.add_func("/United/Bytes#B -> KiB -> MiB (bis)", () => {

        // Given
        var bytes = 2 * 1024 * 1024; //2097152

        // When
        var B = new United.Bytes(bytes);
        var KiB = B.to(BinaryPrefix.kibi());
        var MiB = KiB.to(BinaryPrefix.mebi());
        
        // Then
        assert(KiB.to_string() == "2048KiB");
        assert(MiB.to_string() == "2MiB");
    });

    //Bytes to Binary to smaller Binary
    Test.add_func("/United/Bytes#B -> MiB -> KiB", () => {

        // Given
        var bytes = 1750000;

        // When
        var B = new United.Bytes(bytes);
        var MiB = B.to(BinaryPrefix.mebi());
        var KiB = MiB.to(BinaryPrefix.kibi());

        // Then

        assert(MiB.to_string() == "1.66893MiB");
        assert(KiB.to_string("%0.6f") == "1708.984375KiB");

    });  

    //Bytes to Binary to bigger non Binary
    Test.add_func("/United/Bytes#B -> KiB -> MB", () => {

        // Given
        var bytes = 1750000;

        // When
        var B = new United.Bytes(bytes);
        var KiB = B.to(BinaryPrefix.kibi());
        var MB = KiB.to(Prefix.mega());

        // Then
        assert(KiB.to_string("%0.6f") == "1708.984375KiB");
        assert(MB.to_string() == "1.75MB");
    });

    Test.add_func("/United/Bytes#B -> MiB -> kB", () => {

        // Given
        var bytes = 2 * 1024 * 1024; //2097152

        // When
        var B = new United.Bytes(bytes);
        var MiB = B.to(BinaryPrefix.mebi());
        var kB = MiB.to(Prefix.kilo());

        // Then
        assert(MiB.to_string() == "2MiB");
        assert(kB.to_string() == "2097.15kB");
    });

    Test.add_func("/United/Bytes#B -> KiB -> kB", () => {

        // Given
        var bytes = 2 * 1024 * 1024; //2097152

        // When
        var B = new United.Bytes(bytes);
        var KiB = B.to(BinaryPrefix.kibi());
        var kB = KiB.to(Prefix.kilo());
        
        // Then
        assert(kB.to_string() == "2097.15kB");
    });


    Test.add_func("/United/Bytes#B -> kB -> KiB", () => {

        // Given
        var bytes = 1000;

        // When
        var B = new United.Bytes(bytes);
        var kB = B.to(Prefix.kilo());
        var KiB = kB.to(BinaryPrefix.kibi());
        
        // Then
        assert(KiB.to_string() == "0.976562KiB");
    });

    Test.add_func("/United/Bytes#B -> GB", () => {

        // Given
        var bytes = 2097152;

        // When
        var B = new United.Bytes(bytes);
        var GB = B.to(Prefix.giga());

        // Then
        assert(GB.to_string("%.9f") == "0.002097152GB");
    });

    Test.add_func("/United/Bytes#B -> MiB -> B", () => {

        // Given
        var bytes = 2 * 1024 * 1024; //2097152

        // When
        var B = new United.Bytes(bytes);
        var MiB = B.to(BinaryPrefix.mebi());
        var B2 = MiB.to(BinaryPrefix.none());
        
        // Then
        assert(MiB.to_string() == "2MiB");
        assert((int) B2.value == 2097152);
    });    
}
