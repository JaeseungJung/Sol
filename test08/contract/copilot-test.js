function calculateDaysBetweenDates(begin, end) {
    var oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds
    var firstDate = new Date(begin);
    var secondDate = new Date(end);
    var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime()) / (oneDay)));
    return diffDays;
}

// 0부터 10까지 반복문으로 더하는 함수
function add(n) {
    var sum = 0;
    for (var i = 0; i <= n; i++) {
        sum += i;
    }
    return sum;
}



// 현재 이더리움 블록넘버를 반환하는 함수
function getBlockNumber() {
    return web3.eth.blockNumber;
}


// 현재 클레이튼 블록넘버를 반환하는 함수
function getClietBlockNumber() {
    return web3.eth.getBlockNumber();
}

// 메타마스크 지갑 연결하는 함수
function connectMetaMask() {
    if (typeof web3 !== 'undefined') {
        web3 = new Web3(web3.currentProvider);
    } else {
        // set the provider you want from Web3.providers
        web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
    }
}


// mbti 조사하는 함수
function mbti(n) {
    var mbti = "";
    if (n >= 0 && n <= 10) {
        mbti = "신중함";
    } else if (n >= 11 && n <= 20) {
        mbti = "자기계발";
    } else if (n >= 21 && n <= 30) {
        mbti = "자기계발";
    } else if (n >= 31 && n <= 40) {
        mbti = "자기계발";
    } else if (n >= 41 && n <= 50) {
        mbti = "자기계발";
    } else if (n >= 51 && n <= 60) {
        mbti = "자기계발";
    } else if (n >= 61 && n <= 70) {
        mbti = "자기계발";
    } else if (n >= 71 && n <= 80) {
        mbti = "자기계발";
    } else if (n >= 81 && n <= 90) {
        mbti = "자기계발";
    } else if (n >= 91 && n <= 100) {
        mbti = "자기계발";
    }
    return mbti;
}
    



