import os 


if __name__ == "__main__":

    traj_folder_path = "./static/bridge_vis"

    files_to_match = ["all.mp4", "all_gt_ks.mp4", "gpt4v.mp4", "gemini_pro.mp4"]
    
    
    dirs = os.listdir(traj_folder_path)
    
    dirs = [os.path.join(traj_folder_path, d) for d in dirs]
    
    valid_paths = ""
    
    for file in dirs:
        traj_files = os.listdir(file)
        for traj_file in traj_files:
            if traj_file not in files_to_match:
                continue
            
        
        cur_paths = ""
        for traj_file in traj_files:
            if traj_file in files_to_match:
                cur_paths += os.path.join(file, traj_file) + ","
        
        valid_paths += cur_paths+ ";"
        
    
    with open("valid_paths.txt", "w") as f:
        f.write(valid_paths)
        
        
                
            




