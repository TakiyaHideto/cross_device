package com.mr.utils;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Partitioner;

public class FirstPartitioner extends Partitioner<TextLong,Text>{
	@Override  
	public int getPartition(TextLong key, Text value,   
		int numPartitions) {
			return Math.abs(key.getKey().hashCode() % numPartitions);
	}  
}  
