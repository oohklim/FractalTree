private double fractionLength = .8; 
private double smallestBranch = 50; 
private double branchAngle = .3;
private double fractionStroke = .8;
public void setup() 
{   
	size(640,480);  
	colorMode(HSB, 100);
} 
public void draw() 
{   
	background(0, 0, 90);
	stroke(0);
	strokeWeight(8);   
	line(320,480,320,380);
	drawBranches(320,380,90,3*Math.PI/2,8);
	if(smallestBranch > 8 && keyPressed == false)
		smallestBranch--; 
}
public void keyPressed()
{
	if(key == 'a' && branchAngle < .7)
		branchAngle+=.01;
	if(key == 'd' && branchAngle > .3)
		branchAngle-=.01;
	smallestBranch = 50;
}
public void drawBranches(int x,int y, double branchLength, double angle, double sW) 
{   
	if(sW > 1)
		sW *= fractionStroke;
	strokeWeight((float)sW);
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength *= fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);;
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	if(branchLength > smallestBranch) {
		drawBranches(endX1, endY1, branchLength, angle1, sW);
		drawBranches(endX2, endY2, branchLength, angle2, sW);
	}
} 
