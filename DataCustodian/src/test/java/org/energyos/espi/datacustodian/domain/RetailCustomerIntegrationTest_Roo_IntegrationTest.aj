// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.datacustodian.domain;

import org.energyos.espi.datacustodian.domain.RetailCustomerDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect RetailCustomerIntegrationTest_Roo_IntegrationTest {
    
    declare @type: RetailCustomerIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: RetailCustomerIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: RetailCustomerIntegrationTest: @Transactional;
    
    @Autowired
    private RetailCustomerDataOnDemand RetailCustomerIntegrationTest.dod;
    
    @Test
    public void RetailCustomerIntegrationTest.testCountRetailCustomers() {
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to initialize correctly", dod.getRandomRetailCustomer());
        long count = org.energyos.espi.datacustodian.domain.RetailCustomer.countRetailCustomers();
        org.junit.Assert.assertTrue("Counter for 'RetailCustomer' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void RetailCustomerIntegrationTest.testFindRetailCustomer() {
        org.energyos.espi.datacustodian.domain.RetailCustomer obj = dod.getRandomRetailCustomer();
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to provide an identifier", id);
        obj = org.energyos.espi.datacustodian.domain.RetailCustomer.findRetailCustomer(id);
        org.junit.Assert.assertNotNull("Find method for 'RetailCustomer' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'RetailCustomer' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void RetailCustomerIntegrationTest.testFindAllRetailCustomers() {
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to initialize correctly", dod.getRandomRetailCustomer());
        long count = org.energyos.espi.datacustodian.domain.RetailCustomer.countRetailCustomers();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'RetailCustomer', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.energyos.espi.datacustodian.domain.RetailCustomer> result = org.energyos.espi.datacustodian.domain.RetailCustomer.findAllRetailCustomers();
        org.junit.Assert.assertNotNull("Find all method for 'RetailCustomer' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'RetailCustomer' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void RetailCustomerIntegrationTest.testFindRetailCustomerEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to initialize correctly", dod.getRandomRetailCustomer());
        long count = org.energyos.espi.datacustodian.domain.RetailCustomer.countRetailCustomers();
        if (count > 20) count = 20;
        java.util.List<org.energyos.espi.datacustodian.domain.RetailCustomer> result = org.energyos.espi.datacustodian.domain.RetailCustomer.findRetailCustomerEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'RetailCustomer' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'RetailCustomer' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void RetailCustomerIntegrationTest.testFlush() {
        org.energyos.espi.datacustodian.domain.RetailCustomer obj = dod.getRandomRetailCustomer();
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to provide an identifier", id);
        obj = org.energyos.espi.datacustodian.domain.RetailCustomer.findRetailCustomer(id);
        org.junit.Assert.assertNotNull("Find method for 'RetailCustomer' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyRetailCustomer(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'RetailCustomer' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void RetailCustomerIntegrationTest.testMerge() {
        org.energyos.espi.datacustodian.domain.RetailCustomer obj = dod.getRandomRetailCustomer();
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to provide an identifier", id);
        obj = org.energyos.espi.datacustodian.domain.RetailCustomer.findRetailCustomer(id);
        boolean modified =  dod.modifyRetailCustomer(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.energyos.espi.datacustodian.domain.RetailCustomer merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'RetailCustomer' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void RetailCustomerIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to initialize correctly", dod.getRandomRetailCustomer());
        org.energyos.espi.datacustodian.domain.RetailCustomer obj = dod.getNewTransientRetailCustomer(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'RetailCustomer' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'RetailCustomer' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void RetailCustomerIntegrationTest.testRemove() {
        org.energyos.espi.datacustodian.domain.RetailCustomer obj = dod.getRandomRetailCustomer();
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'RetailCustomer' failed to provide an identifier", id);
        obj = org.energyos.espi.datacustodian.domain.RetailCustomer.findRetailCustomer(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'RetailCustomer' with identifier '" + id + "'", org.energyos.espi.datacustodian.domain.RetailCustomer.findRetailCustomer(id));
    }
    
}
