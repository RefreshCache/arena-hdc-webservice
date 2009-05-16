﻿
using System;
using System.Collections;
using System.Web;
using System.Web.SessionState;
using Jayrock.Json;
using Jayrock.JsonRpc;
using Jayrock.JsonRpc.Web;


namespace Arena.Custom.HDC.WebService
{
    [JsonRpcHelp("This service provides an interface into Arena via a JSON-RPC web query system.")]
    public class JsonRpc : JsonRpcHandler, IRequiresSessionState
    {
        [JsonRpcMethod("Version", Idempotent = false)]
        [JsonRpcHelp("Return the version of the API in use by the server.")]
        public int Version()
        {
            return CoreRpc.Version();
        }


        [JsonRpcMethod("FindPeople", Idempotent = true)]
        [JsonRpcHelp("Retrieves an array of all person IDs that match the search criterea.")]
        public int[] FindPeople(IDictionary credentials, IDictionary query)
        {
            CoreRpc rpc = new CoreRpc(credentials);

            return rpc.FindPeople(query);
        }


        [JsonRpcMethod("GetPersonInformation", Idempotent = true)]
        [JsonRpcHelp("Get the basic person information for the given person ID.")]
        public IDictionary GetPersonInformation(IDictionary credentials, int personID)
        {
            CoreRpc rpc = new CoreRpc(credentials);

            return rpc.GetPersonInformation(personID);
        }


        [JsonRpcMethod("GetPersonContactInformation", Idempotent = true)]
        [JsonRpcHelp("Get the contact information for the given person ID.")]
        public IDictionary GetPersonContactInformation(IDictionary credentials, int personID)
        {
            CoreRpc rpc = new CoreRpc(credentials);

            return rpc.GetPersonContactInformation(personID);
        }

        
        [JsonRpcMethod("GetPersonProfiles", Idempotent = true)]
        [JsonRpcHelp("Get the profile IDs that the member is a part of.")]
        public IDictionary GetPersonProfiles(IDictionary credentials, int personID)
        {
            CoreRpc rpc = new CoreRpc(credentials);

            return rpc.GetPersonProfiles(personID);
        }
    }
}
