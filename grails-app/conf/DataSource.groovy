dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    dialect = org.hibernate.dialect.PostgreSQLDialect
    username = "Admin"
	password = "admin"
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql:salias"
       
        }   
    }   
    test {
         dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql:salias"
            
        }  
    }   
    production {
         dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql:salias"
          
        }  
    }   
}