// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.energyos.espi.datacustodian.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.energyos.espi.datacustodian.domain.IntervalReading;
import org.energyos.espi.datacustodian.domain.MeterReading;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect IntervalReadingController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String IntervalReadingController.create(@Valid IntervalReading intervalReading, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("intervalReading", intervalReading);
            addDateTimeFormatPatterns(uiModel);
            return "intervalreadings/create";
        }
        uiModel.asMap().clear();
        intervalReading.persist();
        return "redirect:/intervalreadings/" + encodeUrlPathSegment(intervalReading.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String IntervalReadingController.createForm(Model uiModel) {
        uiModel.addAttribute("intervalReading", new IntervalReading());
        addDateTimeFormatPatterns(uiModel);
        return "intervalreadings/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String IntervalReadingController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("intervalreading", IntervalReading.findIntervalReading(id));
        uiModel.addAttribute("itemId", id);
        return "intervalreadings/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String IntervalReadingController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("intervalreadings", IntervalReading.findIntervalReadingEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) IntervalReading.countIntervalReadings() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("intervalreadings", IntervalReading.findAllIntervalReadings());
        }
        addDateTimeFormatPatterns(uiModel);
        return "intervalreadings/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String IntervalReadingController.update(@Valid IntervalReading intervalReading, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("intervalReading", intervalReading);
            addDateTimeFormatPatterns(uiModel);
            return "intervalreadings/update";
        }
        uiModel.asMap().clear();
        intervalReading.merge();
        return "redirect:/intervalreadings/" + encodeUrlPathSegment(intervalReading.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String IntervalReadingController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("intervalReading", IntervalReading.findIntervalReading(id));
        addDateTimeFormatPatterns(uiModel);
        return "intervalreadings/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String IntervalReadingController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        IntervalReading.findIntervalReading(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/intervalreadings";
    }
    
    @ModelAttribute("intervalreadings")
    public Collection<IntervalReading> IntervalReadingController.populateIntervalReadings() {
        return IntervalReading.findAllIntervalReadings();
    }
    
    @ModelAttribute("meterreadings")
    public Collection<MeterReading> IntervalReadingController.populateMeterReadings() {
        return MeterReading.findAllMeterReadings();
    }
    
    void IntervalReadingController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("intervalReading_startdate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("intervalReading_enddate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("intervalReading_intervalduration_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String IntervalReadingController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
