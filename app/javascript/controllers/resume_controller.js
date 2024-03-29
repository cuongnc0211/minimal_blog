import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('connected')
  }

  download() {
    var element = document.getElementById('portfolio-content');
    var opt = {
      margin:       1,
      filename:     'Cuong_Nguyen_Resume.pdf',
      image:        { type: 'jpeg', quality: 0.98 },
      html2canvas:  { scale: 2 },
      jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
    };

    // New Promise-based usage:
    html2pdf().set(opt).from(element).save();

    alert('download started')
  }
}
