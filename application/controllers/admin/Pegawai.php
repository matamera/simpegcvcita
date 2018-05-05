<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pegawai extends CI_Controller {

    function __construct(){
        parent::__construct();
        $this->load->model('admin/Admin_m');
        $this->load->model('admin/Pegawai_m');
    }
    public function index($offset=0){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->get();
                $data['title'] = $this->Admin_m->info_pt(1)->nama_info_pt;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['page'] = 'admin/pegawai-v';
                $jumlah = $this->Pegawai_m->jumlah_data(@$post['string'],@$post['skpd']);
                $config['base_url'] = base_url().'/index.php/admin/pegawai/index/';
                $config['total_rows'] = $jumlah;
                $config['per_page'] = '10';
                $config['first_page'] = 'Awal';
                $config['last_page'] = 'Akhir';
                $config['next_page'] = '&laquo;';
                $config['prev_page'] = '&raquo;';
                // bootstap style
                $config['first_link']       = 'Pertama';
                $config['last_link']        = 'Terakhir';
                $config['next_link']        = 'Selanjutnya';
                $config['prev_link']        = 'Sebelumnya';
                $config['full_tag_open']    = '<div class="pagging text-center"><nav><ul class="pagination justify-content-center">';
                $config['full_tag_close']   = '</ul></nav></div>';
                $config['num_tag_open']     = '<li class="page-item"><span class="page-link">';
                $config['num_tag_close']    = '</span></li>';
                $config['cur_tag_open']     = '<li class="page-item active"><span class="page-link">';
                $config['cur_tag_close']    = '<span class="sr-only">(current)</span></span></li>';
                $config['next_tag_open']    = '<li class="page-item"><span class="page-link">';
                $config['next_tagl_close']  = '<span aria-hidden="true">&raquo;</span></span></li>';
                $config['prev_tag_open']    = '<li class="page-item"><span class="page-link">';
                $config['prev_tagl_close']  = '</span>Next</li>';
                $config['first_tag_open']   = '<li class="page-item"><span class="page-link">';
                $config['first_tagl_close'] = '</span></li>';
                $config['last_tag_open']    = '<li class="page-item"><span class="page-link">';
                $config['last_tagl_close']  = '</span></li>';
                //inisialisasi config
                $this->pagination->initialize($config);
                $data['skpd'] = $this->Pegawai_m->select_data('master_lokasi_kerja');
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['agama'] = $this->Pegawai_m->select_data('master_agama');
                $data['golongan'] = $this->Pegawai_m->select_data('master_golongan');
                $data['eselon'] = $this->Pegawai_m->select_data('master_eselon');
                $data['sjabatan'] = $this->Pegawai_m->select_data('master_status_jabatan');

                // pengaturan searching
                $data['jmldata'] = $jumlah;
                $data['nmr'] = $offset;
                $data['hasil'] = $this->Pegawai_m->searcing_data($config['per_page'],$offset,@$post['string'],@$post['skpd']);
                $data['pagging'] = $this->pagination->create_links();
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function detail($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['agama'] = $this->Pegawai_m->select_data('master_agama');
                $data['eselon'] = $this->Pegawai_m->select_data('master_eselon');
                $data['golongan'] = $this->Pegawai_m->select_data('master_golongan');
                $data['sjabatan'] = $this->Pegawai_m->select_data('master_status_jabatan');
                $data['bagian'] = 'admin/data-pegawai-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function detail_keluarga($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['keluarga'] = $this->Pegawai_m->data_keluarga($id);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['stat_kawin'] = $this->Pegawai_m->select_data('master_status_kawin');
                $data['stat_keluarga'] = $this->Pegawai_m->select_data('master_status_dalam_keluarga');
                $data['bagian'] = 'admin/data-keluarga-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function detail_rgolongan($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['rgolongan'] = $this->Pegawai_m->data_rgolongan($id);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['sjabatan'] = $this->Pegawai_m->select_data('master_status_jabatan');
                $data['golongan'] = $this->Pegawai_m->select_data('master_golongan');
                $data['bagian'] = 'admin/data-rgolongan-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function detail_rjabatan($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['rjabatan'] = $this->Pegawai_m->data_rjabatan($id);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['jnsjabatan'] = $this->Pegawai_m->select_data('master_jenis_jabatan');
                $data['satuankerja'] = $this->Pegawai_m->select_data('master_satuan_kerja');
                $data['eselon'] = $this->Pegawai_m->select_data('master_eselon');
                $data['jabatan'] = $this->Pegawai_m->select_data('master_jabatan');
                $data['bagian'] = 'admin/data-rjabatan-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function detail_pendidikan($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['pendidikan'] = $this->Pegawai_m->data_pendidikan($id);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['ipendidikan'] = $this->Pegawai_m->select_data('master_pendidikan');
                $data['bagian'] = 'admin/data-pendidikan-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function detail_pelatihan($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['pelatihan'] = $this->Pegawai_m->data_pelatihan($id);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/data-pelatihan-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function detail_penghargaan($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['penghargaan'] = $this->Pegawai_m->data_penghargaan($id);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/data-penghargaan-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function detail_seminar($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['seminar'] = $this->Pegawai_m->data_seminar($id);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/data-seminar-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function detail_organisasi($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['organisasi'] = $this->Pegawai_m->data_organisasi($id);
                $data['satuankerja'] = $this->Pegawai_m->select_data('master_satuan_kerja');
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/data-organisasi-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function detail_gaji_pokok($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['gaji_pokok'] = $this->Pegawai_m->data_gaji_pokok($id);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/data-gaji_pokok-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function detail_hukuman($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['hukuman'] = $this->Pegawai_m->data_hukuman($id);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/data-hukuman-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function detail_dp3($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['dp3'] = $this->Pegawai_m->data_dp3($id);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/data-dp3-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function create(){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'nama_pegawai' => $post['nama_pegawai'],
                    'nip'=>$post['nip'],
                    'nip_lama'=>$post['nip_lama'],
                    'no_kartu_pegawai'=>$post['no_kartu_pegawai'],
                    'no_npwp'=>$post['no_npwp'],
                    'kartu_askes_pegawai'=>$post['kartu_askes_pegawai'],
                    'tempat_lahir'=>$post['tempat_lahir'],
                    'tanggal_lahir'=>$post['tanggal_lahir'],
                    'nomor_kk'=>$post['nomor_kk'],
                    'nomor_ktp'=>$post['nomor_ktp'],
                    'jenis_kelamin'=>$post['jenis_kelamin'],
                    'agama'=>$post['agama'],
                    'id_golongan'=>$post['id_golongan'],
                    'status_pegawai'=>$post['status_pegawai'],
                    'tanggal_pengangkatan_cpns'=>$post['tanggal_pengangkatan_cpns_thn'].'-'.$post['tanggal_pengangkatan_cpns_bln'].'-'.$post['tanggal_pengangkatan_cpns_hr'],
                    'alamat'=>$post['alamat'],
                    'gaji_pokok'=>$post['gaji_pokok']
                );
                $this->Pegawai_m->insert_data('data_pegawai',$datainput);
                $pesan = 'Data pegawai baru berhasil di tambahkan';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai'));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function create_keluarga($idpegawai){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'nama_anggota_keluarga' => $post['nama_anggota_keluarga'],
                    'id_pegawai' => $idpegawai,
                    'tanggal_lahir'=>$post['tanggal_lahir_thn'].'-'.$post['tanggal_lahir_bln'].'-'.$post['tanggal_lahir_hr'],
                    'status_keluarga'=>$post['status_keluarga'],
                    'status_kawin'=>$post['status_kawin'],
                    'tanggal_nikah'=>$post['tanggal_nikah_thn'].'-'.$post['tanggal_nikah_bln'].'-'.$post['tanggal_nikah_hr'],
                    'tanggal_cerai_meninggal'=>$post['tanggal_cerai_meninggal_thn'].'-'.$post['tanggal_cerai_meninggal_bln'].'-'.$post['tanggal_cerai_meninggal_hr'],
                    'tanggal_meninggal'=>$post['tanggal_meninggal_thn'].'-'.$post['tanggal_meninggal_bln'].'-'.$post['tanggal_meninggal_hr'],
                    'pekerjaan'=>$post['pekerjaan'],
                    'no_kartu'=>$post['no_kartu']
                );
                $this->Pegawai_m->insert_data('data_keluarga',$datainput);
                $pesan = 'Data kerluarga baru berhasil di tambahkan';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_keluarga/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function create_rgolongan($idpegawai){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'id_pegawai' => $idpegawai,
                    'id_golongan'=>$post['id_golongan'],
                    'nomor_sk'=>$post['nomor_sk'],
                    'tanggal_sk'=>$post['tanggal_sk_thn'].'-'.$post['tanggal_sk_bln'].'-'.$post['tanggal_sk_hr'],
                    'tmt_golongan'=>$post['tmt_golongan_thn'].'-'.$post['tmt_golongan_bln'].'-'.$post['tmt_golongan_hr'],
                    'nomor_bkn'=>$post['nomor_bkn'],
                    'tanggal_bkn'=>$post['tanggal_bkn_thn'].'-'.$post['tanggal_bkn_bln'].'-'.$post['tanggal_bkn_hr'],
                    'id_status_jabatan'=>$post['id_status_jabatan']
                );
                $this->Pegawai_m->insert_data('data_riwayat_golongan',$datainput);
                $pesan = 'Data riwayat golongan baru berhasil di tambahkan';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_rgolongan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function create_rjabatan($idpegawai){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'id_pegawai' => $idpegawai,
                    'id_jenis_jabatan'=>$post['id_jenis_jabatan'],
                    'nm_jabatan'=>$post['nm_jabatan'],
                    'id_satuan_kerja'=>$post['id_satuan_kerja'],
                    'id_eselon'=>$post['id_eselon'],
                    'tmt_jabatan_rj'=>$post['tmt_jabatan_rj_thn'].'-'.$post['tmt_jabatan_rj_bln'].'-'.$post['tmt_jabatan_rj_hr'],
                    'tanggal_sk_rj'=>$post['tanggal_sk_rj_thn'].'-'.$post['tanggal_sk_rj_bln'].'-'.$post['tanggal_sk_rj_hr'],
                    'tmt_pelantikan_rj'=>$post['tmt_pelantikan_rj_thn'].'-'.$post['tmt_pelantikan_rj_bln'].'-'.$post['tmt_pelantikan_rj_hr'],
                    'nomor_sk'=>$post['nomor_sk']
                );
                $this->Pegawai_m->insert_data('data_riwayat_jabatan',$datainput);
                $pesan = 'Data riwayat jabatan baru berhasil di tambahkan';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_rjabatan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function create_pendidikan($idpegawai){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'tingkat_pendidikan' => $post['tingkat_pendidikan'],
                    'id_pegawai' => $idpegawai,
                    'jurusan'=>$post['jurusan'],
                    'sekolah'=>$post['sekolah'],
                    'tempat_sekolah'=>$post['tempat_sekolah'],
                    'tanggal_lulus'=>$post['tanggal_lulus_thn'].'-'.$post['tanggal_lulus_bln'].'-'.$post['tanggal_lulus_hr'],
                    'nomor_ijazah'=>$post['nomor_ijazah']
                );
                // echo "<pre>";print_r($datainput);echo "<pre/>";exit();
                $this->Pegawai_m->insert_data('data_pendidikan',$datainput);
                $pesan = 'Data pendidikan baru berhasil di tambahkan';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_pendidikan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function create_pelatihan($idpegawai){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'uraian' => $post['uraian'],
                    'id_pegawai' => $idpegawai,
                    'lokasi'=>$post['lokasi'],
                    'tanggal'=>$post['tanggal_thn'].'-'.$post['tanggal_bln'].'-'.$post['tanggal_hr'],
                    'tahun'=>$post['tahun']
                );
                $this->Pegawai_m->insert_data('data_pelatihan',$datainput);
                $pesan = 'Data pelatihan baru berhasil di tambahkan';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_pelatihan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function create_penghargaan($idpegawai){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'jenis_penghargaan' => $post['jenis_penghargaan'],
                    'id_pegawai' => $idpegawai,
                    'no_keputusan' => $post['no_keputusan'],
                    'tanggal'=>$post['tanggal_thn'].'-'.$post['tanggal_bln'].'-'.$post['tanggal_hr'],
                    'tahun' => $post['tahun']
                );
                $this->Pegawai_m->insert_data('data_penghargaan',$datainput);
                $pesan = 'Data Penghargaan baru berhasil di tambahkan';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_penghargaan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function create_seminar($idpegawai){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'uraian' => $post['uraian'],
                    'id_pegawai' => $idpegawai,
                    'lokasi'=>$post['lokasi'],
                    'tanggal'=>$post['tanggal_thn'].'-'.$post['tanggal_bln'].'-'.$post['tanggal_hr']
                );
                $this->Pegawai_m->insert_data('data_seminar',$datainput);
                $pesan = 'Data seminar baru berhasil di tambahkan';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_seminar/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function create_organisasi($idpegawai){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'id_satuan_kerja'=>$post['id_satuan_kerja'],
                    'id_pegawai' => $idpegawai,
                    'nomor'=>$post['nomor'],
                    'tanggal'=>$post['tanggal_thn'].'-'.$post['tanggal_bln'].'-'.$post['tanggal_hr']
                );
                $this->Pegawai_m->insert_data('data_organisasi',$datainput);
                $pesan = 'Data organisasi baru berhasil di tambahkan';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_organisasi/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function create_gaji_pokok($idpegawai){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'nomor_sk' => $post['nomor_sk'],
                    'id_pegawai' => $idpegawai,
                    'tanggal_sk'=>$post['tanggal_sk_thn'].'-'.$post['tanggal_sk_bln'].'-'.$post['tanggal_sk_hr'],
                    'dasar_perubahan'=>$post['dasar_perubahan'],
                    'gaji_pokok'=>$post['gaji_pokok'],
                    'tanggal_mulai'=>$post['tanggal_mulai_thn'].'-'.$post['tanggal_mulai_bln'].'-'.$post['tanggal_mulai_hr'],
                    'tanggal_selesai'=>$post['tanggal_selesai_thn'].'-'.$post['tanggal_selesai_bln'].'-'.$post['tanggal_selesai_hr'],
                    'masa_kerja'=>$post['masa_kerja'],
                    'pejabat_menetapkan'=>$post['pejabat_menetapkan']
                );
                $this->Pegawai_m->insert_data('data_gaji_pokok',$datainput);
                $pesan = 'Data gaji pokok baru berhasil di tambahkan';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_gaji_pokok/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function create_hukuman($idpegawai){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'uraian' => $post['uraian'],
                    'id_pegawai' => $idpegawai,
                    'nomor_sk'=>$post['nomor_sk'],
                    'tanggal_sk'=>$post['tanggal_sk_thn'].'-'.$post['tanggal_sk_bln'].'-'.$post['tanggal_sk_hr'],
                    'tanggal_mulai'=>$post['tanggal_mulai_thn'].'-'.$post['tanggal_mulai_bln'].'-'.$post['tanggal_mulai_hr'],
                    'tanggal_selesai'=>$post['tanggal_selesai_thn'].'-'.$post['tanggal_selesai_bln'].'-'.$post['tanggal_selesai_hr'],
                    'masa_berlaku'=>$post['masa_berlaku_thn'].'-'.$post['masa_berlaku_bln'].'-'.$post['masa_berlaku_hr'],
                    'pejabat_menetapkan'=>$post['pejabat_menetapkan']
                );
                $this->Pegawai_m->insert_data('data_hukuman',$datainput);
                $pesan = 'Data hukuman baru berhasil di tambahkan';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_hukuman/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function create_dp3($idpegawai){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'tahun' => $post['tahun'],
                    'id_pegawai' => $idpegawai,
                    'kesetiaan'=>$post['kesetiaan'],
                    'prestasi'=>$post['prestasi'],
                    'tanggung_jawab'=>$post['tanggung_jawab'],
                    'ketaatan'=>$post['ketaatan'],
                    'kejujuran'=>$post['kejujuran'],
                    'kerjasama'=>$post['kerjasama'],
                    'prakarsa'=>$post['prakarsa'],
                    'kepemimpinan'=>$post['kepemimpinan'],
                    'rata_rata'=>$post['rata_rata'],
                    'atasan'=>$post['atasan'],
                    'penilai'=>$post['penilai'],
                    'mengetahui'=>$post['mengetahui']
                );
                $this->Pegawai_m->insert_data('data_dp3',$datainput);
                $pesan = 'Data riwayat jabatan baru berhasil di tambahkan';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_dp3/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function edit_rgolongan($id,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['detail'] = $this->Pegawai_m->detail_data('data_riwayat_golongan','id_riwayat_golongan',$idr);
                $data['bagian'] = 'admin/edit-rgolongan-v';
                $data['jeniskp'] = $this->Admin_m->select_data('master_status_jabatan');
                $data['golongan'] = $this->Admin_m->select_data('master_golongan');
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function update_rgolongan($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'id_golongan'=>$post['id_golongan'],
                    'nomor_sk'=>$post['nomor_sk'],
                    'tanggal_sk'=>$post['tanggal_sk_thn'].'-'.$post['tanggal_sk_bln'].'-'.$post['tanggal_sk_hr'],
                    'tmt_golongan'=>$post['tmt_golongan_thn'].'-'.$post['tmt_golongan_bln'].'-'.$post['tmt_golongan_hr'],
                    'nomor_bkn'=>$post['nomor_bkn'],
                    'tanggal_bkn'=>$post['tanggal_bkn_thn'].'-'.$post['tanggal_bkn_bln'].'-'.$post['tanggal_bkn_hr'],
                    'id_status_jabatan'=>$post['id_status_jabatan']
                );
                $this->Pegawai_m->update_data('data_riwayat_golongan','id_riwayat_golongan',$idr,$datainput);
                $pesan = 'Data riwayat golongan baru berhasil di diubah';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_rgolongan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function edit_rjabatan($id,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['detail'] = $this->Pegawai_m->detail_data('data_riwayat_jabatan','id_riwayat_jabatan',$idr);
                // echo "<pre/>";print_r($data['detail']);echo "<pre/>";exit();
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['golongan'] = $this->Pegawai_m->select_data('master_golongan');
                $data['sjabatan'] = $this->Pegawai_m->select_data('master_status_jabatan');
                $data['jnsjabatan'] = $this->Pegawai_m->select_data('master_jenis_jabatan');
                $data['satuankerja'] = $this->Pegawai_m->select_data('master_satuan_kerja');
                $data['eselon'] = $this->Pegawai_m->select_data('master_eselon');
                $data['jabatan'] = $this->Pegawai_m->select_data('master_jabatan');
                $data['bagian'] = 'admin/edit-rjabatan-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function update_rjabatan($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'id_pegawai' => $idpegawai,
                    'id_jenis_jabatan'=>$post['id_jenis_jabatan'],
                    'nm_jabatan'=>$post['nm_jabatan'],
                    'id_satuan_kerja'=>$post['id_satuan_kerja'],
                    'id_eselon'=>$post['id_eselon'],
                    'tmt_jabatan_rj'=>$post['tmt_jabatan_rj_thn'].'-'.$post['tmt_jabatan_rj_bln'].'-'.$post['tmt_jabatan_rj_hr'],
                    'nomor_sk'=>$post['nomor_sk'],
                    'tanggal_sk_rj'=>$post['tanggal_sk_rj_thn'].'-'.$post['tanggal_sk_rj_bln'].'-'.$post['tanggal_sk_rj_hr'],
                    'tmt_pelantikan_rj'=>$post['tmt_pelantikan_rj_thn'].'-'.$post['tmt_pelantikan_rj_bln'].'-'.$post['tmt_pelantikan_rj_hr'],
                    'nomor_sk'=>$post['nomor_sk']
                );
                $this->Pegawai_m->update_data('data_riwayat_jabatan','id_riwayat_jabatan',$idr,$datainput);
                $pesan = 'Data riwayat jabatan baru berhasil di diubah';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_rjabatan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function edit_pendidikan($id,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['detail'] = $this->Pegawai_m->detail_data('data_pendidikan','id_pendidikan',$idr);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['ipendidikan'] = $this->Pegawai_m->select_data('master_pendidikan');
                $data['bagian'] = 'admin/edit-pendidikan-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function update_pendidikan($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                // echo "<pre>";print_r($post) ;echo "<pre/>";exit();
                $datainput = array(
                    'tingkat_pendidikan' => $post['tingkat_pendidikan'],
                    'id_pegawai' => $idpegawai,
                    'jurusan'=>$post['jurusan'],
                    'sekolah'=>$post['sekolah'],
                    'tempat_sekolah'=>$post['tempat_sekolah'],
                    'tanggal_lulus'=>$post['tanggal_lulus_thn'].'-'.$post['tanggal_lulus_bln'].'-'.$post['tanggal_lulus_hr'],
                    'nomor_ijazah'=>$post['nomor_ijazah']
                );
                $this->Pegawai_m->update_data('data_pendidikan','id_pendidikan',$idr,$datainput);
                $pesan = 'Data riwayat pendidikan baru berhasil di diubah';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_pendidikan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function update_pegawai($idpegawai){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                // echo "<pre>";print_r($post) ;echo "<pre/>";exit();
                $datainput = array(
                    'nama_pegawai' => $post['nama_pegawai'],
                    'nip'=>$post['nip'],
                    'nip_lama'=>$post['nip_lama'],
                    'no_kartu_pegawai'=>$post['no_kartu_pegawai'],
                    'no_npwp'=>$post['no_npwp'],
                    'kartu_askes_pegawai'=>$post['kartu_askes_pegawai'],
                    'tempat_lahir'=>$post['tempat_lahir'],
                    'tanggal_lahir'=>$post['tanggal_lahir'],
                    'nomor_kk'=>$post['nomor_kk'],
                    'nomor_ktp'=>$post['nomor_ktp'],
                    'jenis_kelamin'=>$post['jenis_kelamin'],
                    'agama'=>$post['agama'],
                    'status_pegawai'=>$post['status_pegawai'],
                    'tanggal_pengangkatan_cpns'=>$post['tanggal_pengangkatan_cpns_thn'].'-'.$post['tanggal_pengangkatan_cpns_bln'].'-'.$post['tanggal_pengangkatan_cpns_hr'],
                    'alamat'=>$post['alamat'],
                    'gaji_pokok'=>$post['gaji_pokok']

                );

                if (!empty($_FILES["foto"])) {
                    $config['file_name'] = strtolower(url_title('pegawai'.'-'.$post['foto']));
                    $config['upload_path'] = './asset/img/pegawai/';
                    $config['allowed_types'] = 'gif|jpg|png';
                    $config['max_size'] = 2048;
                    $config['max_width'] = '';
                    $config['max_height'] = '';

                    $this->load->library('upload', $config);
                    if (!$this->upload->do_upload('foto')){
                        $error = $this->upload->display_errors();
                        $this->session->set_flashdata('eror', $error );
                        redirect(base_url('index.php/admin/pegawai'));
                    }
                    else{
                        $file = $this->Admin_m->data_pegawai(1)->row('foto');
                        if ($file != "avatar.png") {
                            unlink("asset/img/user/$file");
                        }
                        $img = $this->upload->data('file_name');
                        $data['nama'] = $img;
                        $file = "asset/img/pegawai/$img";
                        //output resize (bisa juga di ubah ke format yang berbeda ex: jpg, png dll)
                        $resizedFile = "asset/img/pegawai/$img";
                        $this->resize->smart_resize_image(null , file_get_contents($file), 250 , 250 , false , $resizedFile , true , false ,100 );
                    }
                }
                $this->Pegawai_m->update_data('data_pegawai','id_pegawai',$idpegawai,$datainput);
                $pesan = 'Data riwayat pendidikan baru berhasil di diubah';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function edit_pelatihan($id,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['detail'] = $this->Pegawai_m->detail_data('data_pelatihan','id_pelatihan',$idr);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/edit-pelatihan-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function update_pelatihan($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                 'uraian' => $post['uraian'],
                 'lokasi'=>$post['lokasi'],
                 'tanggal'=>$post['tanggal_thn'].'-'.$post['tanggal_bln'].'-'.$post['tanggal_hr'],
                 'tahun'=>$post['tahun']
             );
                $this->Pegawai_m->update_data('data_pelatihan','id_pelatihan',$idr,$datainput);
                $pesan = 'Data riwayat pelatihan baru berhasil di diubah';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_pelatihan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function edit_penghargaan($id,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['detail'] = $this->Pegawai_m->detail_data('data_penghargaan','id_penghargaan',$idr);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/edit-penghargaan-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function update_penghargaan($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                 'jenis_penghargaan' => $post['jenis_penghargaan'],
                 'no_keputusan' => $post['no_keputusan'],
                 'tanggal'=>$post['tanggal_thn'].'-'.$post['tanggal_bln'].'-'.$post['tanggal_hr'],
                 'tahun' => $post['tahun']
             );
                $this->Pegawai_m->update_data('data_penghargaan','id_penghargaan',$idr,$datainput);
                $pesan = 'Data riwayat penghargaan baru berhasil di diubah';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_penghargaan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function edit_seminar($id,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['detail'] = $this->Pegawai_m->detail_data('data_seminar','id_seminar',$idr);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/edit-seminar-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function update_seminar($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                 'uraian' => $post['uraian'],
                 'lokasi'=>$post['lokasi'],
                 'tanggal'=>$post['tanggal_thn'].'-'.$post['tanggal_bln'].'-'.$post['tanggal_hr']
             );
                $this->Pegawai_m->update_data('data_seminar','id_seminar',$idr,$datainput);
                $pesan = 'Data riwayat seminar baru berhasil di diubah';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_seminar/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function edit_organisasi($id,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['detail'] = $this->Pegawai_m->detail_data('data_organisasi','id_organisasi',$idr);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/edit-organisasi-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function update_organisasi($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                 'id_satuan_kerja'=>$post['id_satuan_kerja'],
                 'nomor'=>$post['nomor'],
                 'tanggal'=>$post['tanggal_thn'].'-'.$post['tanggal_bln'].'-'.$post['tanggal_hr']
             );
                $this->Pegawai_m->update_data('data_organisasi','id_organisasi',$idr,$datainput);
                $pesan = 'Data riwayat organisasi baru berhasil di diubah';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_organisasi/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function edit_gaji_pokok($id,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['detail'] = $this->Pegawai_m->detail_data('data_gaji_pokok','id_gaji_pokok',$idr);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/edit-gaji_pokok-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function update_gaji_pokok($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                 'nomor_sk' => $post['nomor_sk'],
                 'tanggal_sk'=>$post['tanggal_sk_thn'].'-'.$post['tanggal_sk_bln'].'-'.$post['tanggal_sk_hr'],
                 'dasar_perubahan'=>$post['dasar_perubahan'],
                 'gaji_pokok'=>$post['gaji_pokok'],
                 'tanggal_mulai'=>$post['tanggal_mulai_thn'].'-'.$post['tanggal_mulai_bln'].'-'.$post['tanggal_mulai_hr'],
                 'tanggal_selesai'=>$post['tanggal_selesai_thn'].'-'.$post['tanggal_selesai_bln'].'-'.$post['tanggal_selesai_hr'],
                 'masa_kerja'=>$post['masa_kerja'],
                 'pejabat_menetapkan'=>$post['pejabat_menetapkan']
             );
                $this->Pegawai_m->update_data('data_gaji_pokok','id_gaji_pokok',$idr,$datainput);
                $pesan = 'Data riwayat gaji pokok baru berhasil di diubah';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_gaji_pokok/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function edit_hukuman($id,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['detail'] = $this->Pegawai_m->detail_data('data_hukuman','id_hukuman',$idr);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/edit-hukuman-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function update_hukuman($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                 'uraian' => $post['uraian'],
                 'nomor_sk'=>$post['nomor_sk'],
                 'tanggal_sk'=>$post['tanggal_sk_thn'].'-'.$post['tanggal_sk_bln'].'-'.$post['tanggal_sk_hr'],
                 'tanggal_mulai'=>$post['tanggal_mulai_thn'].'-'.$post['tanggal_mulai_bln'].'-'.$post['tanggal_mulai_hr'],
                 'tanggal_selesai'=>$post['tanggal_selesai_thn'].'-'.$post['tanggal_selesai_bln'].'-'.$post['tanggal_selesai_hr'],
                 'masa_berlaku'=>$post['masa_berlaku_thn'].'-'.$post['masa_berlaku_bln'].'-'.$post['masa_beralaku_hr'],
                 'pejabat_menetapkan'=>$post['pejabat_menetapkan']
             );
                $this->Pegawai_m->update_data('data_hukuman','id_hukuman',$idr,$datainput);
                $pesan = 'Data riwayat hukuman baru berhasil di diubah';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_hukuman/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function edit_dp3($id,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['detail'] = $this->Pegawai_m->detail_data('data_dp3','id_dp3',$idr);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/edit-dp3-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function update_dp3($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                 'tahun' => $post['tahun'],
                 'kesetiaan'=>$post['kesetiaan'],
                 'prestasi'=>$post['prestasi'],
                 'tanggung_jawab'=>$post['tanggung_jawab'],
                 'ketaatan'=>$post['ketaatan'],
                 'kejujuran'=>$post['kejujuran'],
                 'kerjasama'=>$post['kerjasama'],
                 'prakarsa'=>$post['prakarsa'],
                 'kepemimpinan'=>$post['kepemimpinan'],
                 'rata_rata'=>$post['rata_rata'],
                 'atasan'=>$post['atasan'],
                 'penilai'=>$post['penilai'],
                 'mengetahui'=>$post['mengetahui']
             );
                $this->Pegawai_m->update_data('data_dp3','id_dp3',$idr,$datainput);
                $pesan = 'Data riwayat dp3 baru berhasil di diubah';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_dp3/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }
    public function edit_keluarga($id,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                // echo "<pre>";print_r($result);echo "<pre/>";exit();
                $data['title'] = $result->nama_pegawai;
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['brand'] = 'asset/img/lembaga/'.$this->Admin_m->info_pt(1)->logo_pt;
                $data['users'] = $this->ion_auth->user()->row();
                $data['aside'] = 'nav/nav';
                $data['hasil'] = $result;
                $data['detail'] = $this->Pegawai_m->detail_data('data_keluarga','id_data_keluarga',$idr);
                $data['status'] = $this->Pegawai_m->select_data('master_status_pegawai');
                $data['bagian'] = 'admin/edit-keluarga-v';
                $data['page'] = 'admin/detail-pegawai-v';
                // pagging setting
                $this->load->view('admin/dashboard-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }
    public function update_keluarga($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $post = $this->input->post();
                $datainput = array(
                    'nama_anggota_keluarga' => $post['nama_anggota_keluarga'],
                    'tanggal_lahir'=>$post['tanggal_lahir_thn'].'-'.$post['tanggal_lahir_bln'].'-'.$post['tanggal_lahir_hr'],
                    'status_keluarga'=>$post['status_keluarga'],
                    'status_kawin'=>$post['status_kawin'],
                    'tanggal_nikah'=>$post['tanggal_nikah_thn'].'-'.$post['tanggal_nikah_bln'].'-'.$post['tanggal_nikah_hr'],
                    'tanggal_cerai_meninggal'=>$post['tanggal_cerai_meninggal_thn'].'-'.$post['tanggal_cerai_meninggal_bln'].'-'.$post['tanggal_cerai_meninggal_hr'],
                    'tanggal_meninggal'=>$post['tanggal_meninggal_thn'].'-'.$post['tanggal_meninggal_bln'].'-'.$post['tanggal_meninggal_hr'],
                    'pekerjaan'=>$post['pekerjaan'],
                    'no_kartu'=>$post['no_kartu']
                );
                $this->Pegawai_m->update_data('data_keluarga','id_data_keluarga',$idr,$datainput);
                $pesan = 'Data riwayat keluarga baru berhasil di diubah';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_keluarga/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }
    public function delete_dp3($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $this->Pegawai_m->delete_data('data_dp3','id_dp3',$idr);
                $pesan = 'Data riwayat dp3 baru berhasil di diubah dihapus';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_dp3/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }
    public function delete_keluarga($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $this->Pegawai_m->delete_data('data_keluarga','id_data_keluarga',$idr);
                $pesan = 'Data riwayat keluarga baru berhasil di diubah dihapus';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_keluarga/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }
    public function delete_rgolongan($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $this->Pegawai_m->delete_data('data_riwayat_golongan','id_riwayat_golongan',$idr);
                $pesan = 'Data riwayat golongan baru berhasil di diubah dihapus';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_rgolongan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }
    public function delete_rjabatan($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $this->Pegawai_m->delete_data('data_riwayat_jabatan','id_riwayat_jabatan',$idr);
                $pesan = 'Data riwayat jabatan baru berhasil di diubah dihapus';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_rjabatan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }
    public function delete_pendidikan($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $this->Pegawai_m->delete_data('data_pendidikan','id_pendidikan',$idr);
                $pesan = 'Data riwayat pendidikan baru berhasil di diubah dihapus';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_pendidikan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }
    public function delete_pelatihan($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $this->Pegawai_m->delete_data('data_pelatihan','id_pelatihan',$idr);
                $pesan = 'Data riwayat pelatihan baru berhasil di diubah dihapus';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_pelatihan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }
    public function delete_penghargaan($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $this->Pegawai_m->delete_data('data_penghargaan','id_penghargaan',$idr);
                $pesan = 'Data riwayat penghargaan baru berhasil di diubah dihapus';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_penghargaan/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }
    public function delete_seminar($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $this->Pegawai_m->delete_data('data_seminar','id_seminar',$idr);
                $pesan = 'Data riwayat seminar baru berhasil di diubah dihapus';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_seminar/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }
    public function delete_organisasi($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $this->Pegawai_m->delete_data('data_organisasi','id_organisasi',$idr);
                $pesan = 'Data riwayat organisasi baru berhasil di diubah dihapus';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_organisasi/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }
    public function delete_gaji_pokok($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $this->Pegawai_m->delete_data('data_gaji_pokok','id_gaji_pokok',$idr);
                $pesan = 'Data riwayat gaji baru berhasil di diubah dihapus';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_gaji_pokok/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }
    public function delete_hukuman($idpegawai,$idr){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $this->Pegawai_m->delete_data('data_hukuman','id_hukuman',$idr);
                $pesan = 'Data riwayat hukuman baru berhasil di diubah dihapus';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/pegawai/detail_hukuman/'.$idpegawai));
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/admin//login'));
        }
    }



public function uploadImage() {
        $this->load->helper(array('form', 'url'));  
        $config['upload_path'] = 'assets/images/pegawai';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size'] = '1000';
        $config['max_width'] = '';
        $config['max_height'] = '';
        $config['width'] = 75;
        $config['height'] = 50;
        if (isset($_FILES['foto']['nama_pegawai'])) {
            $filename = "-" . $_FILES['foto']['nama_pegawai'];
            $config['file_name'] = substr(md5(time()), 0, 28) . $filename;
        }
        $config['overwrite'] = TRUE;
        $config['remove_spaces'] = TRUE;
        $field_name = "foto";
        $this->load->library('upload', $config);
        if ($this->input->post('selsub')) {
            if (!$this->upload->do_upload('foto')) {
                //no file uploaded or failed upload
                $error = array('error' => $this->upload->display_errors());
            } else {
                $dat = array('upload_data' => $this->upload->data());
                $this->resize($dat['upload_data']['full_path'],           $dat['upload_data']['file_name']);
            }
            $ip = $_SERVER['REMOTE_ADDR'];
            if (empty($dat['upload_data']['file_name'])) {
                $catimage = '';
            } else {
                $catimage = $dat['upload_data']['file_name'];
            }
            $data = array(            
                'ctg_image' => $catimage,
                'ctg_dated' => time()
            );
            $this->b2bcategory_model->form_insert($data);

        }
    }
    public function cetak_data_pegawai($id){
        if ($this->ion_auth->logged_in()) {
            $level = array('admin','members');
            if (!$this->ion_auth->in_group($level)) {
                $pesan = 'Anda tidak memiliki Hak untuk Mengakses halaman ini';
                $this->session->set_flashdata('message', $pesan );
                redirect(base_url('index.php/admin/dashboard'));
            }else{
                $result = $this->Pegawai_m->detail_pegawai($id);
                $data['infopt'] = $this->Admin_m->info_pt(1);
                $data['title'] = $result->nama_pegawai;
                $data['hasil'] = $result;
                $data['pelatihan'] = $this->Pegawai_m->data_pelatihan($id);
                $data['statpeg'] = $this->Admin_m->detail_data_order('master_status_pegawai','id_status_pegawai',$result->id_status_pegawai);
                $data['agama'] = $this->Admin_m->detail_data_order('master_agama','id_agama',$result->agama);
                $data['unit_org'] = $this->Admin_m->detail_data_order('master_satuan_kerja','id_satuan_kerja',$result->id_satuan_kerja);
                $data['keluarga'] = $this->Admin_m->select_data_order('data_keluarga','id_pegawai',$id);
                $data['golongan'] = $this->Admin_m->select_data_order('data_riwayat_golongan','id_pegawai',$id);
                $data['jabatan'] = $this->Admin_m->select_data_order('data_riwayat_jabatan','id_pegawai',$id);
                $data['pendidikan'] = $this->Admin_m->select_data_order('data_pendidikan','id_pegawai',$id);
                $data['pelatihan'] = $this->Admin_m->select_data_order('data_pelatihan','id_pegawai',$id);
                $data['penghargaan'] = $this->Admin_m->select_data_order('data_penghargaan','id_pegawai',$id);
                $data['seminar'] = $this->Admin_m->select_data_order('data_seminar','id_pegawai',$id);
                $data['organisasi'] = $this->Admin_m->select_data_order('data_organisasi','id_pegawai',$id);
                $data['gaji_pokok'] = $this->Admin_m->select_data_order('data_gaji_pokok','id_pegawai',$id);
                $data['hukuman'] = $this->Admin_m->select_data_order('data_hukuman','id_pegawai',$id);
                $data['data_dp3'] = $this->Admin_m->select_data_order('data_dp3','id_pegawai',$id);
                // pagging setting
                $this->load->view('admin/cetak-detail-pegawai-v',$data);
            }
        }else{
            $pesan = 'Login terlebih dahulu';
            $this->session->set_flashdata('message', $pesan );
            redirect(base_url('index.php/login'));
        }
    }

}
?>