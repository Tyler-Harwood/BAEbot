for(i = 2; i <= 127; i++) {
    test = vk_control
    char = chr(i);
    if(keyboard_check(i)) {
        return char;
    }
}