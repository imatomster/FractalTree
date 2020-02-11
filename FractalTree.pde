private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  

private boolean baBool = true;

public void setup() 
{   
	size(640,480);
	frameRate(10);    
} 
public void draw() 
{   
	background(0);
	stroke(#ffc1c1);   
	line(320,480,320,380);   
	drawBranches(320,380, 100, 3*Math.PI/2); 


	if(baBool == true){
		branchAngle*= 2;
	}else if(baBool == false){
		branchAngle/= 2;
	}

	if(branchAngle > 1){
		baBool = false;
	}else if(branchAngle < 0){
		baBool = true;
	}


} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength *= fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);  
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);  
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);

	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);

	if(branchLength > smallestBranch){
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 
