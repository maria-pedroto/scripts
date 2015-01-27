#GEN_PROC_RABBITS - number of generations until a rabbit can procreate.
#GEN_PROC_FOXES - number of generations until a fox can procreate.
#GEN_FOOD_FOXES - number of generations for a fox to die of starvation.
#N_GEN - number of generates for the simulation
#R C - number of Rows and Columns of the array representing the ecosystem.
#N_OBJS - number of objects in the initial ecosystem.
#N_OBJS follow, one per line, using the format OBJECT X Y where OBJECT can be a ROCK, FOX or RABBIT, and X and Y are the coordinates where the OBJECT is positioned in the array.

main <- function(numberFiles, limitProcRabbits, limitProcFoxes, limitFoodFoxes, limitGenerations, rowLimit, colLimit, limitObjs) {
	count_files <- 1;
	
	GEN_PROC_RABBITS <-  sample(1:limitProcRabbits, numberFiles, replace=TRUE);
	GEN_PROC_FOXES <- sample(1:limitProcFoxes, numberFiles, replace=TRUE);
	GEN_FOOD_FOXES <- sample(1:limitFoodFoxes, numberFiles, replace=TRUE);
	N_GEN <- sample(1:limitGenerations, numberFiles, replace=TRUE);
	R <- sample(1:rowLimit, numberFiles, replace=TRUE);
	C <- sample(1:colLimit, numberFiles, replace=TRUE);
	N_OBJS <-sample(1:limitObjs, numberFiles, replace=TRUE);
	
	ROCK <- "PEDRA";
	FOX <- "RAPOSA";
	RABBIT <- "COELHO";
	
	FILENAME <- "SAMPLE_";
	
	setwd("D:\\PROJ\\COMPUTING\\");
	
	repeat {
		currentFilename <- paste0(FILENAME, count_files, ".txt");
		#create file
		f <- file.create(currentFilename);
		
		cat(GEN_PROC_RABBITS[count_files],file=currentFilename,sep="\n", append=TRUE);
		cat(GEN_PROC_FOXES[count_files],file=currentFilename,sep="\n", append=TRUE);
		cat(GEN_FOOD_FOXES[count_files],file=currentFilename,sep="\n", append=TRUE);
		cat(N_GEN[count_files],file=currentFilename,sep="\n", append=TRUE);
		cat(paste(R[count_files], C[count_files]),file=currentFilename,sep="\n", append=TRUE);
		cat(N_OBJS[count_files],file=currentFilename,sep="\n", append=TRUE);
		
		TYPES <- sample(1:3, N_OBJS[count_files], replace=TRUE);
		#POS_X <- sample(1:R[count_files], N_OBJS[count_files], replace=TRUE);
		#POS_Y <- sample(1:C[count_files], N_OBJS[count_files], replace=TRUE);
		
		AUX <- matrix(1:R[count_files] * C[count_files], nrow=R[count_files], ncol=C[count_files]) 
		SAMPLE <- sample(AUX, N_OBJS[count_files], replace=FALSE);
		
		count_items <- 1;
		repeat {
			type <- "";
			if(TYPES[count_items] == 1) {
				type <- ROCK;
			}
			if(TYPES[count_items] == 2) {
				type <- FOX;
			}
			if(TYPES[count_items] == 3) {
				type <- RABBIT;
			}
			
			POS_X <- which( B == SAMPLE[count_items], arr.ind=T)[1];
			POS_Y <- which( B == SAMPLE[count_items], arr.ind=T)[2];
			
			#criar uma linha por cada N_OBJS
			cat(paste(TYPES[count_items], POS_X, POS_Y),file=currentFilename,sep="\n", append=TRUE);
			count_items <- count_items + 1;
			if(count_items > N_OBJS[count_files]) break;
		}
		
		#write file
		count_files <- count_files + 1;

		if(count_files >  numberFiles) break;
	}
}

main(1, 2000, 2000, 100, 10000, 100000, 100000, 100000);