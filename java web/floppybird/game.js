const canvas = document.getElementById("gameCanvas");
const ctx = canvas.getContext("2d");

const bird = {
    x: 50,
    y: 150,
    width: 20,
    height: 20,
    gravity: 0.6,
    lift: -10,
    velocity: 0,
    draw() {
        ctx.fillStyle = "yellow";
        ctx.fillRect(this.x, this.y, this.width, this.height);
    }
    update() {
        this.velocity += this.gravity;
        this.y += this.velocity;
        if (this.y + this.height > canvas.height) {
            this.y = canvas.height - this.height;
            this.velocity = 0;
        }
        if (this.y < 0) {
            this.y = 0;
            this.velocity = 0;
        }
    },
    flap() {
        this.velocity = this.lift;
    }
};

const pipes = [];
const pipeWidth = 40;
const pipeGap = 120;
const pipeSpeed = 2;
let frame = 0;

function createPipe() {
    const topPipeHeight = Math.floor(Math.random() * (canvas.height - pipeGap));
    const bottomPipeHeight = canvas.height - topPipeHeight - pipeGap;
    pipes.push({
        x: canvas.width,
        topHeight: topPipeHeight,
        bottomHeight: bottomPipeHeight
    });
}

function drawPipes() {
    pipes.forEach(pipe => {
        ctx.fillStyle = "green";
        ctx.fillRect(pipe.x, 0, pipeWidth, pipe.topHeight);
        ctx.fillRect(pipe.x, canvas.height - pipe.bottomHeight, pipeWidth, pipe.bottomHeight);
    });
}

function updatePipes() {
    pipes.forEach(pipe => {
        pipe.x -= pipeSpeed;
    });

    if (pipes.length > 0 && pipes[0].x < -pipeWidth) {
        pipes.shift();
    }

    if (frame % 90 === 0) {
        createPipe();
    }
}

function detectCollision() {
    for (let i = 0; i < pipes.length; i++) {
        const pipe = pipes[i];
        if (bird.x < pipe.x + pipeWidth &&
            bird.x + bird.width > pipe.x &&
            (bird.y < pipe.topHeight || bird.y + bird.height > canvas.height - pipe.bottomHeight)) {
            return true;
        }
    }
    return false;
}

function gameLoop() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    bird.update();
    bird.draw();

    drawPipes();
    updatePipes();

    if (detectCollision()) {
        alert("Game Over!");
        document.location.reload();
    }

    frame++;
    requestAnimationFrame(gameLoop);
}

canvas.addEventListener("click", () => {
    bird.flap();
});

createPipe();
gameLoop();
