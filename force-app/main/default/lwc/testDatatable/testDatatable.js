import { LightningElement, wire } from 'lwc';
import getEventList from '@salesforce/apex/EventController.getEventList';

const columns = [
    {label: 'Subject', fieldName: 'Subject', editable: true},
    {label: 'Description', fieldName: 'Description'}
]

export default class TestDatatable extends LightningElement {
    error;
    columns = columns;

    @wire(getEventList)
    events;
}