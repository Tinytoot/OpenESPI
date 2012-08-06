/*******************************************************************************
 * Copyright (c) 2011, 2012 EnergyOS.Org
 *
 * Licensed by EnergyOS.Org under one or more contributor license agreements.
 * See the NOTICE file distributed with this work for additional information
 * regarding copyright ownership.  The EnergyOS.org licenses this file
 * to you under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License.  You may obtain a copy
 * of the License at:
 *  
 *   http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 *  
 ******************************************************************************
*/

// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.thirdparty.common;

import java.util.List;
import org.energyos.espi.thirdparty.common._RetailCustomer;
import org.energyos.espi.thirdparty.common._RetailCustomerDataOnDemand;
import org.energyos.espi.thirdparty.common._RetailCustomerIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect _RetailCustomerIntegrationTest_Roo_IntegrationTest {
    
    declare @type: _RetailCustomerIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: _RetailCustomerIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: _RetailCustomerIntegrationTest: @Transactional;
    
    @Autowired
    private _RetailCustomerDataOnDemand _RetailCustomerIntegrationTest.dod;
    
    @Test
    public void _RetailCustomerIntegrationTest.testCount_RetailCustomers() {
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to initialize correctly", dod.getRandom_RetailCustomer());
        long count = _RetailCustomer.count_RetailCustomers();
        Assert.assertTrue("Counter for '_RetailCustomer' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void _RetailCustomerIntegrationTest.testFind_RetailCustomer() {
        _RetailCustomer obj = dod.getRandom_RetailCustomer();
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to provide an identifier", id);
        obj = _RetailCustomer.find_RetailCustomer(id);
        Assert.assertNotNull("Find method for '_RetailCustomer' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for '_RetailCustomer' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void _RetailCustomerIntegrationTest.testFindAll_RetailCustomers() {
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to initialize correctly", dod.getRandom_RetailCustomer());
        long count = _RetailCustomer.count_RetailCustomers();
        Assert.assertTrue("Too expensive to perform a find all test for '_RetailCustomer', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<_RetailCustomer> result = _RetailCustomer.findAll_RetailCustomers();
        Assert.assertNotNull("Find all method for '_RetailCustomer' illegally returned null", result);
        Assert.assertTrue("Find all method for '_RetailCustomer' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void _RetailCustomerIntegrationTest.testFind_RetailCustomerEntries() {
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to initialize correctly", dod.getRandom_RetailCustomer());
        long count = _RetailCustomer.count_RetailCustomers();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<_RetailCustomer> result = _RetailCustomer.find_RetailCustomerEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for '_RetailCustomer' illegally returned null", result);
        Assert.assertEquals("Find entries method for '_RetailCustomer' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void _RetailCustomerIntegrationTest.testFlush() {
        _RetailCustomer obj = dod.getRandom_RetailCustomer();
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to provide an identifier", id);
        obj = _RetailCustomer.find_RetailCustomer(id);
        Assert.assertNotNull("Find method for '_RetailCustomer' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modify_RetailCustomer(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for '_RetailCustomer' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void _RetailCustomerIntegrationTest.testMergeUpdate() {
        _RetailCustomer obj = dod.getRandom_RetailCustomer();
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to provide an identifier", id);
        obj = _RetailCustomer.find_RetailCustomer(id);
        boolean modified =  dod.modify_RetailCustomer(obj);
        Integer currentVersion = obj.getVersion();
        _RetailCustomer merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for '_RetailCustomer' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void _RetailCustomerIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to initialize correctly", dod.getRandom_RetailCustomer());
        _RetailCustomer obj = dod.getNewTransient_RetailCustomer(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected '_RetailCustomer' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected '_RetailCustomer' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void _RetailCustomerIntegrationTest.testRemove() {
        _RetailCustomer obj = dod.getRandom_RetailCustomer();
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for '_RetailCustomer' failed to provide an identifier", id);
        obj = _RetailCustomer.find_RetailCustomer(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove '_RetailCustomer' with identifier '" + id + "'", _RetailCustomer.find_RetailCustomer(id));
    }
    
}