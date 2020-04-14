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
        var GB = B.to(new Prefix(Prefix.GIGA));


        // When
        var B2 = GB.to(new Prefix(Prefix.NONE));
        
        // Then
        assert(B2.value == bytes);
        assert(B2.unit == "B");
        assert(B2.prefix.equals(Prefix.NONE));
        
        // When
        var MB = B.to(new Prefix(Prefix.MEGA));
        
        // Then
        assert(MB.value == 5800);
        assert(MB.to_string() == "5800MB");

        // When
        var KB = MB.to(new Prefix(Prefix.KILO));
        
        // Then
        assert(KB.value == 5800000);
        assert(KB.to_string("%.0f") == "5800000kB");


        // When
        var GB2 = KB.to(new Prefix(Prefix.GIGA));
        
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
        var MiB = B.to(new BiPrefix(BiPrefix.MEBI));

        // Then
        assert(MiB.to_string() == "1.66893MiB");
    });

    //Bytes to Binary to bigger Binary
    Test.add_func("/United/Bytes#B -> KiB -> MiB", () => {

        // Given
        var bytes = 1750000;

        // When
        var B = new United.Bytes(bytes);
        var KiB = B.to(new BiPrefix(BiPrefix.KIBI));
        var MiB = KiB.to(new BiPrefix(BiPrefix.MEBI));

        // Then
        assert(KiB.to_string("%0.6f") == "1708.984375KiB");
        assert(MiB.to_string() == "1.66893MiB");

    });    

    //Bytes to Binary to smaller Binary
    Test.add_func("/United/Bytes#B -> MiB -> KiB", () => {

        // Given
        var bytes = 1750000;

        // When
        var B = new United.Bytes(bytes);
        var MiB = B.to(new BiPrefix(BiPrefix.MEBI));
        var KiB = MiB.to(new BiPrefix(BiPrefix.KIBI));

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
        var KiB = B.to(new BiPrefix(BiPrefix.KIBI));
        var MB = KiB.to(new Prefix(Prefix.MEGA));

        // Then
        assert(KiB.to_string("%0.6f") == "1708.984375KiB");
        assert(MB.to_string() == "1.75MB");
    });

    Test.add_func("/United/Bytes#B -> MiB -> kB", () => {

        // Given
        var bytes = 2 * 1024 * 1024; //2097152

        // When
        var B = new United.Bytes(bytes);
        var MiB = B.to(new BiPrefix(BiPrefix.MEBI));
        var kB = MiB.to(new Prefix(Prefix.KILO));

        // Then
        assert(MiB.to_string() == "2MiB");
        assert(kB.to_string() == "2097.15kB");
    });

    Test.add_func("/United/Bytes#B -> KiB -> MiB????", () => {

        // Given
        var bytes = 2 * 1024 * 1024; //2097152

        // When
        var B = new United.Bytes(bytes);
        var KiB = B.to(new BiPrefix(BiPrefix.KIBI));
        var MiB = KiB.to(new BiPrefix(BiPrefix.MEBI));
        
        // Then
        assert(KiB.to_string() == "2048KiB");
        assert(MiB.to_string() == "2MiB");
    });

    Test.add_func("/United/Bytes#B -> KiB -> kB ggg", () => {

        // Given
        var bytes = 2 * 1024 * 1024; //2097152

        // When
        var B = new United.Bytes(bytes);
        var KiB = B.to(new BiPrefix(BiPrefix.KIBI));
        var kB = KiB.to(new Prefix(Prefix.KILO));
        
        // Then
        assert(kB.to_string() == "2097.15kB");
    });


    Test.add_func("/United/Bytes#B -> kB -> KiB hhh", () => {

        // Given
        var bytes = 1000;

        // When
        var B = new United.Bytes(bytes);
        var kB = B.to(new Prefix(Prefix.KILO));
        var KiB = kB.to(new BiPrefix(BiPrefix.KIBI));
        
        // Then
        assert(KiB.to_string() == "0.976562KiB");
    });

    Test.add_func("/United/Bytes#B -> kB -> KiB hhhhhhh", () => {

        // Given
        var bytes = 2097152;

        // When
        var B = new United.Bytes(bytes);
        var GB = B.to(new Prefix(Prefix.GIGA));

        // Then
        assert(GB.to_string("%.9f") == "0.002097152GB");
    });

    Test.add_func("/United/Bytes#B -> kB -> KiB hhhhhhffdfdhhh", () => {

        // Given
        var bytes = 2 * 1024 * 1024; //2097152

        // When
        var B = new United.Bytes(bytes);
        var MiB = B.to(new BiPrefix(BiPrefix.MEBI));
        var B2 = MiB.to(new BiPrefix(BiPrefix.NONE));
        
        // Then
        assert(MiB.to_string() == "2MiB");
        assert((int) B2.value == 2097152);
    });    
}
