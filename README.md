# n3m
The repo for the n3m team app. It is awesome!

To get started some prerequisites should be installed. To begin make sure you have python and that it's using version 2.7.

### Local Install
1. Pip (https://pip.pypa.io/en/latest/installing.html)
  1. wget https://bootstrap.pypa.io/get-pip.py
  2. python get-pip.py
2. PostgreSQL (http://www.postgresql.org/download/)
3. NPM (https://docs.npmjs.com/getting-started/installing-node)


### Alternatively Use Docker
You can use the docker file included in this repo which will create a working development environment for you. To do so perform these steps. The initial docker build will take a while:

1. Install Docker (https://www.docker.com/products/docker)
2. execute the following commands from the repository root:
```
sh build_docker.sh 
sh run_docker.sh

```
3. This will bring you to a command prompt with everything installed, the database daemon started, the app ready to start running. 

docker start -ai n3m

After that run 
```
sh server.sh &
sh web.sh &
```
You should then be able to access the web interface of the app from your local dev machine at http://localhost:5000. Note that you cannot have a running process on your host machine at port 5000.. 

### To add a new screen and experiment.

cd statics/src/
modify routes.js by adding an import line for a new page.
e.g. add the following toward the top of routes.js
```
import Profile from '.components/Profile';
```
Then in the default Route Path add a route. e.g.
```
<Route path="profile" component={requireAuthentication(ProfileView)} />
```
Notice that here I have chosen to require authentication. Take a look at the Authentication components to see more about how this works.

Now lets create a basic view ./components/ProfileView.js. From the most basic perspective all that is needed to import is the following: 
```
import React from 'react';
```
but seeing as we are using material-ui, you also want to import some components:
```
import Avatar from 'material-ui/Avatar';
```
and because we will need to read data we want to use our redux components:
```
import { bindActionCreators } from 'redux';  
import { connect } from 'react-redux'; 
```

Because this view will only be displaying data, we use a function that pulls data from the global state object provided by redux and maps is to properties used locally:
```
 function mapStateToProps(state) {
    return {
      data: state.data,
      loaded: state.data.loaded
    };
  }
```
We also map events that modify properties back to the state:
```
function mapDispatchToProps(dispatch) {
  return bindActionCreators(actionCreators, dispatch);
}
```
Then connect both back to the present view
```
@connect(mapStateToProps, mapDispatchToProps)
```
and  the begin to actually create the view:
```
export default class ProfileView extends React.Component {
  render() {
    return ({ DOM STUFF GOES HERE });
  }
}
```
Finally, we need a way to get to this view. So we add a link into the header menu. src/components/Header/index.js:
```
  <MenuItem onClick={() => this.dispatchNewRoute('/profile')}>
    Profile
  </MenuItem>
```
That's it!

### Next Steps
coming soon.
