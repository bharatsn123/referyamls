# Steps to be followed

## Step 0 : Setting up the enviornment to do it mannually

### Step 0.1 - SSH into the Master node

```
ssh pirate@10.100.38.36
```

Enter the password as ```hypriot```

### Step 0.2 - Get the token for the Dashboard login (useful in further steps)

execute the following command and copy the token (weird looking string of characters)
```
kubectl get secret $(kubectl get serviceaccount my-admin-user -n kube-system -o jsonpath="{.secrets[0].name}") -o jsonpath="{.data.token}" -n kube-system | base64 --decode
```

### Step 0.3 - Opening the Dashboard in your normal browser

Go to 
URL : ``` https://10.100.38.36:30069 ```

Choose "Token" as your login method and paste the token code obtained from ```step 0.2```
Now, your login session will be saved for quite sometime, so you don't need to login every time now.

### Step 0.4 - Installing ```Load Time``` execution time calculator 

Install this firefox extension, which will be useful for us in the further steps : [Link](https://addons.mozilla.org/en-US/firefox/addon/load-time/)
Read the documentation and check pictures on how it is working with respect to giving us the ```execution time```

## Recursive Steps (Repetative steps)

### Step 1.1 - Run ```free``` command on the terminal on Master Node (pirate@10.100.38.36)

Run ```free``` command on the terminal and copy the values to the Google Sheets here
Append to the existing entries:  [Open Google Sheets](https://docs.google.com/spreadsheets/d/1BBxSKgURed4FGozgqnRRwXNfxaYqSdMDG7c3oPr1SPM/edit?usp=sharing)

### Step 1.2 - Refresh the DashBoard Page to send requests mannually and note down execution time (Use Browser)

Use ```Ctrl + R``` on your keyboard or the <Refresh Symbol> near the address bar to refresh the Dashboard.

Click on the <Load Time Extension Symbol> on the right side of the address bar and copy the ```Load Time``` reading into the Google Sheets.

### Step 1.3 - Check if the requests were sent successfully (terminal) 

Run the following command and check if the requests were sent successfully 
```
kubectl logs kubernetes-dashboard-5fd66ff4f7-ljlrg -n kube-system
```

if you can see the requests being sent at the end of the log then.... good for you! If not, redo it and remove the free and execution time you noted down in this iteration. After first couple of iterations, this checking step can be avoided after it becomes obvious that the cluster is in a good state.

Redo the steps ```step 1.1``` to ```step 1.3``` until you get tired. :)

