document.addEventListener("DOMContentLoaded",function (){
    let disableForm = document.querySelectorAll(".formshow");
    let showForm = document.querySelectorAll(".formresult");
    let showadd = document.querySelector(".themdiachi");
    for(let i=0;i<disableForm.length;i++)
    {       let t=i;
        disableForm[i].addEventListener("click",function (){

            for(let i=0;i<disableForm.length;i++)
            {

                disableForm[i].classList.remove('is-active');
                showForm[i].classList.add('disableForm');
            }
            this.classList.add('is-active');
            showForm[t].classList.remove('disableForm');
            showadd.classList.add('disableForm');
        })
    }
})
document.addEventListener("DOMContentLoaded",function (){
    let showForm = document.querySelectorAll(".formresult");
    let showadd = document.querySelector("#a");
    let addadress = document.querySelector("#addadress");
    showadd.addEventListener("click", function (){
        for(let i=0;i<showForm.length;i++)
        {
            showForm[i].classList.add('disableForm');
        }
        addadress.classList.remove('disableForm');
    })

})
//dropdown
const buttonshowDropdown = document.querySelector(".buttonDropdown");
const showdropdown = document.querySelector(".UserHeader_UserDropDown");
buttonshowDropdown.addEventListener("click", function (){
    showdropdown.classList.toggle('disableForm');
})
const imgDiv=document.querySelector('.temp');
const img=document.querySelector('#photo');
const file=document.querySelector('#file');
const uploadBtn=document.querySelector('#uploadBtn');

imgDiv.addEventListener("mouseenter",function (){
    uploadBtn.style.display = "block";

})
imgDiv.addEventListener("mouseleave",function (){
    uploadBtn.style.display = "none";

})

file.addEventListener("change",function (){
    const choosedFile = this.files[0];
    if(choosedFile){
        const reader =new FileReader();
        reader.addEventListener("load",function (){
            img.setAttribute("src",reader.result);
        })
        reader.readAsDataURL(choosedFile);

    }
})