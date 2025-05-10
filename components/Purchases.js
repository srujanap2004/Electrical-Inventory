import React, { useState, useEffect } from "react";
import { Form, Input, Button, message, DatePicker, Table, Space, Select } from "antd";
import { PlusOutlined, DeleteOutlined } from "@ant-design/icons";
import axios from "axios";
import { port } from "./porturl";
const { Option } = Select;

const Purchases = () => {
  const [cart, setCart] = useState([]);
  const [loading, setLoading] = useState(false);
  const [billNo, setBillNo] = useState(null);
  const [categories, setCategories] = useState([]);
  const unitOptions = ["kgs", "liters", "no"];
  const [suppliers, setSuppliers] = useState([]); // State to store suppliers

  useEffect(() => {
    // Fetch categories from the backend
    const fetchCategories = async () => {
      try {
        const response = await axios.get(`${port}categories`);
        setCategories(response.data);
      } catch (error) {
        console.error("Error fetching categories:", error);
        message.error("Failed to fetch categories. Please try again later.");
      }
    };

    fetchCategories();

    // Fetch suppliers from the backend
    const fetchSuppliers = async () => {
      try {
        const response = await axios.get(`${port}suppliers`); // Replace with your actual endpoint
        setSuppliers(response.data);
      } catch (error) {
        console.error("Error fetching suppliers:", error);
        message.error("Failed to fetch suppliers. Please try again later.");
      }
    };

    fetchSuppliers();
  }, []);

  const handleAddItem = (values) => {
    console.log("Adding item to cart:", values);

    const isDuplicate = cart.some((item) => item.item_name === values.item_name);
    if (isDuplicate) {
      message.error("This item is already in the cart.");
      return;
    }

    setCart((prev) => [...prev, values]);
    message.success("Item added to cart!");
  };

  const handleAddPurchase = async (values) => {
    console.log("Form values:", values);
    console.log("Cart items:", cart);

    if (cart.length === 0) {
      message.error("Please add at least one item to the cart.");
      return;
    }

    setLoading(true);
    try {
      const payload = {
        supplier_id: values.supplier_id,
        purchase_date: values.purchase_date.format("YYYY-MM-DD"),
        items: cart.map(item => ({
          ...item,
          expiry_date: item.expiry_date ? item.expiry_date.format("YYYY-MM-DD") : null,
          SED: item.SED ? item.SED.format("YYYY-MM-DD") : null, // Format SED
          SPN: item.SPN,
        })),
      };
      console.log("Payload being sent to backend:", payload);

      const response = await axios.post(`${port}purchases`, payload);

      if (response.data.success) {
        message.success(`Purchase added successfully! Bill Number: ${response.data.bill_no}`);
        setBillNo(response.data.bill_no);
        setCart([]);
      } else {
        message.error("Failed to add purchase. Please try again.");
      }
    } catch (error) {
      console.error("Error adding purchase:", error);
      message.error("Failed to add purchase. Please try again later.");
    }
    setLoading(false);
  };

  const handleRemoveFromCart = (record) => {
    setCart((prev) => prev.filter((item) => item.item_name !== record.item_name));
    message.success("Item removed from cart!");
  };

  const cartColumns = [
    { title: "Item Name", dataIndex: "item_name", key: "item_name" },
    { title: "Quantity", dataIndex: "quantity", key: "quantity" },
    { title: "Unit Price", dataIndex: "unit_price", key: "unit_price" },
    { title: "Brand", dataIndex: "brand", key: "brand" },
    {
      title: "Expiry Date",
      dataIndex: "expiry_date",
      key: "expiry_date",
      render: (expiry_date) => (expiry_date ? expiry_date.format("YYYY-MM-DD") : "N/A"),
    },
    {
      title: "SED",
      dataIndex: "SED",
      key: "SED",
      render: (SED) => (SED ? SED.format("YYYY-MM-DD") : "N/A"),
    },
    { title: "SPN", dataIndex: "SPN", key: "SPN" },
    { title: "Category", dataIndex: "category_name", key: "category_name" },
    { title: "Domain", dataIndex: "domain", key: "domain" },
    {
      title: "Total Cost",
      key: "total_cost",
      render: (_, record) => <span>{(record.quantity * record.unit_price).toFixed(2)}</span>,
    },
    {
      title: "Action",
      key: "action",
      render: (_, record) => (
        <Space size="middle">
          <Button
            type="danger"
            icon={<DeleteOutlined />}
            onClick={() => handleRemoveFromCart(record)}
            style={{ color: "red", borderColor: "red" }}
          >
            Delete
          </Button>
        </Space>
      ),
    },
  ];

  return (
    <div style={{ padding: 20 }}>
      <h2>Add Purchase</h2>

      <h3>Manage Cart</h3>
      <Form
        layout="vertical"
        onFinish={handleAddItem}
        style={{ maxWidth: 600, marginBottom: 20 }}
      >
        <Form.Item
          label="Item Name"
          name="item_name"
          rules={[{ required: true, message: "Please enter the item name" }]}
        >
          <Input placeholder="Enter item name" />
        </Form.Item>
        <Form.Item
          label="Quantity"
          name="quantity"
          rules={[{ required: true, message: "Please enter the quantity" }]}
        >
          <Input type="number" placeholder="Enter quantity" />
        </Form.Item>
        <Form.Item
          label="Unit Price"
          name="unit_price"
          rules={[{ required: true, message: "Please enter the unit price" }]}
        >
          <Input type="number" placeholder="Enter unit price" />
        </Form.Item>
        <Form.Item
          label="Brand"
          name="brand"
          rules={[{ required: true, message: "Please enter the brand" }]}
        >
          <Input placeholder="Enter brand" />
        </Form.Item>
        <Form.Item
          label="Expiry/Warranty Date"
          name="expiry_date"
        >
          <DatePicker style={{ width: "100%" }} />
        </Form.Item>
        <Form.Item
          label="Invoice"
          name="invoice"
          rules={[{ required: true, message: "Please enter the invoice" }]}
        >
          <Input placeholder="Enter invoice" />
        </Form.Item>
         <Form.Item
          label="SED"
          name="SED"
          rules={[{ required: true, message: "Please enter the item name" }]}
        >
          <DatePicker style={{ width: "100%" }} />
        </Form.Item>
        <Form.Item
          label="SPN"
          name="SPN"
          rules={[{ required: true, message: "Please enter the SPN" }]}
        >
          <Input type="number" placeholder="Enter SPN" />
        </Form.Item>
        <Form.Item
          label="Category Name"
          name="category_name"
          rules={[{ required: true, message: "Please select the category" }]}
        >
          <Select placeholder="Select category">
          <Select.Option value="Wire Coils">Wire Coils</Select.Option>
          <Select.Option value="Cables">Cables</Select.Option>
<Select.Option value="Cable joint kit">Cable joint kit</Select.Option>
<Select.Option value="MCBs">MCBs</Select.Option>
<Select.Option value="Enclosures">Enclosures</Select.Option>
<Select.Option value="DB's">DB's</Select.Option>
<Select.Option value="Busbars">Busbars</Select.Option>
<Select.Option value="Fuses">Fuses</Select.Option>
<Select.Option value="Switches">Switches</Select.Option>
<Select.Option value="Sockets">Sockets</Select.Option>
<Select.Option value="Plug tops">Plug Tops</Select.Option>
<Select.Option value="Modular metals boxes">Modular metals boxes</Select.Option>
<Select.Option value="Plates">Plates</Select.Option>
<Select.Option value="Connectors">Connectors</Select.Option>
<Select.Option value="Dummies gang boxes">Dummies gang boxes</Select.Option>
<Select.Option value="PVC tape rolls">PVC tape rolls</Select.Option>
<Select.Option value="Street lights">Street lights</Select.Option>
<Select.Option value="Tube lights">Tube lights</Select.Option>
<Select.Option value="Chokes">Chokes</Select.Option>
<Select.Option value="Ceiling fans">Ceiling fans</Select.Option>
<Select.Option value="Wall mounted fan">Wall mounted fan</Select.Option>
<Select.Option value="Exhausted fans">Exhausted fans</Select.Option>
<Select.Option value="Ceiling roses">Ceiling roses</Select.Option>
<Select.Option value="Fan Regulators">Fan Regulators</Select.Option>
<Select.Option value="Fan Capacitors">Fan Capacitors</Select.Option>

<Select.Option value="Trunking Materials">Trunking Materials</Select.Option>
<Select.Option value="PVC Pipes">PVC Pipes</Select.Option>
<Select.Option value="Bends">Bends</Select.Option>
<Select.Option value="Junction boxes">Junction boxes</Select.Option>
<Select.Option value="PVC Tap rolls">PVC Tap rolls</Select.Option>
<Select.Option value="Casing">Casing</Select.Option>
<Select.Option value="Packing taps">Packing taps</Select.Option>
<Select.Option value="End caps">End caps</Select.Option>

<Select.Option value="Glands">Glands</Select.Option>
<Select.Option value="Legs">Legs</Select.Option>
<Select.Option value="Earth pipes">Earth pipes</Select.Option>
<Select.Option value="Copper strips">Copper strips</Select.Option>
<Select.Option value="Earth copper plates">Earth copper plates</Select.Option>

<Select.Option value="Drilling Machine">Drilling Machine</Select.Option>
<Select.Option value="Spare parts">Spare parts</Select.Option>
<Select.Option value="Drill bits">Drill bits</Select.Option>
<Select.Option value="Crimping Tool">Crimping Tool</Select.Option>
<Select.Option value="Cutting blades">Cutting blades</Select.Option>
<Select.Option value="Nails">Nails</Select.Option>
<Select.Option value="Air Curtains">Air Curtains</Select.Option>
<Select.Option value="Other">Other</Select.Option>

          </Select>
        </Form.Item>
        <Form.Item
          label="Units"
          name="units"
          rules={[{ required: true, message: "Please select the units" }]}
        >
          <Select placeholder="Select units">
            <Select.Option value="kgs">Kgs</Select.Option>
            <Select.Option value="ltrs">Ltrs</Select.Option>
            <Select.Option value="no">No.</Select.Option>
            <Select.Option value="mtrs">Mtrs</Select.Option>
          </Select>
        </Form.Item>
        <Form.Item
          label="Domain"
          name="domain"
          rules={[{ required: true, message: "Please select the domain" }]}
        >
          <Select placeholder="Select domain">
            <Select.Option value="Electrical Inventory">Electrical Inventory</Select.Option>
            <Select.Option value="IT Stationary">IT Stationary</Select.Option>
          </Select>
        </Form.Item>

        <Form.Item>
          <Button type="dashed" icon={<PlusOutlined />} htmlType="submit">
            Add Item to Cart
          </Button>
        </Form.Item>
      </Form>

      <Table
        dataSource={cart}
        columns={cartColumns}
        rowKey={(record, index) => `${record.item_name}-${index}`}
        pagination={false}
        style={{ marginBottom: 20 }}
      />

      <h3 >Submit Purchase</h3>
      <Form
        layout="vertical"
        onFinish={handleAddPurchase}
        style={{ maxWidth: 600 }}
      >
        {billNo && (
          <Form.Item label="Bill Number">
            <Input value={billNo} readOnly />
          </Form.Item>
        )}

        <Form.Item
          label="Supplier"
          name="supplier_id"
          rules={[{ required: true, message: "Please select the supplier" }]}
        >
          <Select
            showSearch
            placeholder="Select a supplier"
            optionFilterProp="children"
            filterOption={(input, option) =>
              (option.children).toLowerCase().indexOf(input.toLowerCase()) >= 0
            }
          >
            {suppliers.map((supplier) => (
              <Option key={supplier.supplier_id} value={supplier.supplier_id}>
                {`${supplier.supplier_id} - ${supplier.supplier_name}`}
              </Option>
            ))}
          </Select>
        </Form.Item>

        <Form.Item
          label="Purchase Date"
          name="purchase_date"
          rules={[{ required: true, message: "Please select the purchase date" }]}
        >
          <DatePicker style={{ width: "100%" }} />
        </Form.Item>

        <Form.Item>
          <Button type="primary" htmlType="submit" loading={loading}>
            Submit Purchase
          </Button>
        </Form.Item>
      </Form>
    </div>
  );
};

export default Purchases;