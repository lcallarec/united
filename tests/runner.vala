void main (string[] args) {

    Test.init(ref args);

    register_value_test();
    register_prefix_test();
    register_bytes_test();
    register_binary_bytes_test();

    Test.run();
}