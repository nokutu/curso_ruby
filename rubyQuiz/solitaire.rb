# encoding: UTF-8

def solitaire(n, deck)
    ret = []
    while ret.size < n
        # Move first joker
        a = deck.index('A')
        deck.delete_at(a)
        if a == 53
            a = 0
        end
        deck.insert(a+1, "A")
        # Move second joker
        b = deck.index("B")
        deck.delete_at(b)
        if b == 52 || b == 53
            b -= 53
        end
        deck.insert(b+2, "B")
        # Triple cut
        a = deck.index('A')
        b = deck.index("B")
        if b < a
            x,y = b,a
        else
            x,y = a, b
        end
        cut1 = deck.slice(0, x)
        cut2 = deck.slice(y+1, deck.size-y)
        cut3 = deck.slice(x..y)
        deck = cut2 + cut3 + cut1
        # Count cut
        x = deck[-1]
        if x == "A" || x == "B"
            x = 53
        end
        cut1 = deck.slice(0...x)
        cut2 = deck.slice(x...deck.size-1)
        cut3 = deck.slice(deck.size-1, 1)
        deck = cut2 + cut1 + cut3
        # Return
        if deck[0] == "A" || deck[0] == "B"
            cha = deck[53]
        else
            cha = deck[deck[0]]
        end
        if cha.class == String
            next
        end
        while cha > 26
            cha -= 26
        end
        cha += 64
        ret.push(cha.chr)
    end
    ret
end

def cipher(mes, deck)
    mes.upcase!
    mes.each_char do |c|
        unless /[A-Z]/ === c
            mes.delete!(c)
        end
    end
    if mes.size%5 != 0
        mes += "X"*(5-mes.size%5)
    end
    keystream = solitaire(mes.size, deck)
    res = []
    mes.size.times do |i|
        x = mes[i].ord+keystream[i].ord-128
        while x > 26
            x -= 26
        end
        x += 64
        res.push(x.chr)
    end
    res.join
end

def decipher(mes, deck)
    keystream = solitaire(mes.size, deck)
    res = []
    mes.size.times do |i|
        x = mes[i].ord-keystream[i].ord
        while x < 0
            x += 26
        end
        x += 64
        res.push(x.chr)
    end

    res.join
end

DEFAULT_DECK = (1..52).to_a + ["A", "B"]
