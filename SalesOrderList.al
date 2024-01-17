tableextension 50119 SalesHeaderExt extends "Sales Header"
{
    fields
    {
        field(50100; "Total Quantity"; Decimal)
        {
            Caption = 'Total Quantity';
            DecimalPlaces = 0 : 5;
            CalcFormula = sum("Sales Line".Quantity where("Document Type" = field("Document Type"),
                                                         "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50101; "Number Of Lines"; Integer)
        {
            Caption = 'Number Of Lines';
            CalcFormula = count("Sales Line" where("Document Type" = field("Document Type"),
                                                         "Document No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }
}

pageextension 50119 SalesOrderListExt extends "Sales Order List"
{
    layout
    {
        addafter(Amount)
        {
            field("Total Quantity"; Rec."Total Quantity")
            {
                ApplicationArea = All;
            }
            field("Number Of Lines"; Rec."Number Of Lines")
            {
                ApplicationArea = All;
            }
        }
    }
}
