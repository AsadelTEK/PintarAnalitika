#!/bin/bash

# Set script to exit if any command fails
set -e

# Define the project name and root directory
PROJECT_NAME="pintar_analitika"
ROOT_DIR=$(pwd)

# Step 1: Download and install CodeIgniter
echo "Downloading CodeIgniter..."
wget https://github.com/bcit-ci/CodeIgniter/archive/3.1.11.zip -O codeigniter.zip
unzip codeigniter.zip
mv CodeIgniter-3.1.11 $PROJECT_NAME

# Step 2: Move into the project directory
cd $PROJECT_NAME

# Step 3: Set up the application
echo "Setting up CodeIgniter..."
mkdir -p application/controllers application/models application/views/public/css application/views/public/js

# Step 4: Download Bootstrap and integrate into the project
echo "Downloading Bootstrap..."
wget https://github.com/twbs/bootstrap/releases/download/v5.1.0/bootstrap-5.1.0-dist.zip
unzip bootstrap-5.1.0-dist.zip -d application/views/public

# Step 5: Generate Controllers

cat <<EOL > application/controllers/BusinessData.php
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class BusinessData extends CI_Controller {
    public function __construct() {
        parent::__construct();
        \$this->load->model('BusinessData_model');
    }

    public function add() {
        if(\$this->input->post()) {
            \$data = [
                'data_type' => \$this->input->post('data_type'),
                'value' => \$this->input->post('value'),
                'date' => \$this->input->post('date'),
                'user_id' => \$this->session->userdata('user_id')
            ];
            \$this->BusinessData_model->insert(\$data);
            redirect('businessdata/list');
        }
        \$this->load->view('data/add');
    }

    public function list() {
        \$data['business_data'] = \$this->BusinessData_model->get_all();
        \$this->load->view('data/list', \$data);
    }
}
EOL

# Step 6: Generate Models

cat <<EOL > application/models/BusinessData_model.php
<?php
class BusinessData_model extends CI_Model {
    public function get_all() {
        return \$this->db->get('business_data')->result();
    }

    public function insert(\$data) {
        \$this->db->insert('business_data', \$data);
    }
}
EOL

# Step 7: Generate Views

# Form to add business data
cat <<EOL > application/views/data/add.php
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Data Bisnis</title>
    <link href="<?= base_url('public/css/bootstrap.min.css') ?>" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Tambah Data Bisnis</h1>
        <form action="<?= base_url('businessdata/add') ?>" method="post">
            <div class="mb-3">
                <label for="data_type" class="form-label">Jenis Data</label>
                <input type="text" class="form-control" name="data_type" id="data_type" required>
            </div>
            <div class="mb-3">
                <label for="value" class="form-label">Nilai Data</label>
                <input type="number" class="form-control" name="value" id="value" required>
            </div>
            <div class="mb-3">
                <label for="date" class="form-label">Tanggal</label>
                <input type="date" class="form-control" name="date" id="date" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
    <script src="<?= base_url('public/js/bootstrap.bundle.min.js') ?>"></script>
</body>
</html>
EOL

# View to list business data
cat <<EOL > application/views/data/list.php
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Bisnis</title>
    <link href="<?= base_url('public/css/bootstrap.min.css') ?>" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Daftar Data Bisnis</h1>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Jenis Data</th>
                    <th>Nilai</th>
                    <th>Tanggal</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach(\$business_data as \$data): ?>
                <tr>
                    <td><?= \$data->data_type ?></td>
                    <td><?= \$data->value ?></td>
                    <td><?= \$data->date ?></td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <script src="<?= base_url('public/js/bootstrap.bundle.min.js') ?>"></script>
</body>
</html>
EOL

# Step 8: Modify config files
echo "Configuring CodeIgniter..."
sed -i "s/\$config\['base_url'\] = '';/\$config\['base_url'\] = 'http:\/\/localhost\/$PROJECT_NAME\/';/" application/config/config.php
sed -i "s/\$db\['default'\]\['username'\] = '';/\$db\['default'\]\['username'\] = 'root';/" application/config/database.php
sed -i "s/\$db\['default'\]\['database'\] = '';/\$db\['default'\]\['database'\] = '$PROJECT_NAME';/" application/config/database.php

# Step 9: Instructions
echo "Setup complete! You can now open your browser and navigate to http://localhost/$PROJECT_NAME/"

# End of script
