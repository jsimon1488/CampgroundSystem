﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Capstone.DAL
{
    public class SiteSqlDAO
    {
        private string connectionString;
        public SiteSqlDAO(string connectionString)
        {
            this.connectionString = connectionString;
        }
    }
}
