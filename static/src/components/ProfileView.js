/* eslint camelcase: 0, no-underscore-dangle: 0 */

import React from 'react';
import { bindActionCreators } from 'redux';
import * as actionCreators from '../actions/data';
import { connect } from 'react-redux';
import Avatar from 'material-ui/Avatar';
import Paper from 'material-ui/Paper';

function mapStateToProps(state) {
    return {
        data: state.data,
        token: state.auth.token,
        loaded: state.data.loaded,
        isFetching: state.data.isFetching
    };
}

function mapDispatchToProps(dispatch) {
    return bindActionCreators(actionCreators, dispatch);
}

const style = {
    marginTop: 50,
    paddingBottom: 50,
    paddingTop: 25,
    width: '100%',
    textAlign: 'center',
    display: 'inline-block',
};

@connect(mapStateToProps, mapDispatchToProps)
export default class ProfileView extends React.Component {


    render() {
        return (
            <div className="col-md-6 col-md-offset-3" >
                <Paper style={style}>
                    <div className="text-center">
                    {!this.props.loaded
                        ? <h1>Loading Profile...</h1>
                        :
                          <div>
                            <h2>Profile</h2>
                            <p>{this.props.userName}!</p>
                            <p>{this.props.data.data.email}</p>
                          </div>
                    }
                    </div>
                </Paper>
            </div>
        );
    }
}

