$files = @(
   <# @{
        uri = 'https://eservices.mohre.gov.ae/Mohre.Domestic.UI/Scripts/EIDA/EmiratesIDCardToolkitService_Installation_Guide.pdf'
        outfile = 'C:\EmiratesIDCardToolkitService_Installation_Guide.pdf'
    },
    @{
        uri = 'https://eservices.mohre.gov.ae/Mohre.Domestic.UI/Scripts/EIDA/ICAVG2ToolkitService.msi'
        outfile = 'C:\ICAVG2ToolkitService.msi'
    },#>

        @{
        uri = 'https://docs.google.com/uc?export=download&id=1HNXgKna5_7Awsd7LZ-QqJ88Gh6xvVW-J'
        outfile = 'C:\Program Files (x86)\Emirates ID Card Toolkit Service\config_ag'
    },
    @{
        uri = 'https://docs.google.com/uc?export=download&id=1uBFz_nvBh4zxGpw0otM53z7aGpfa3lVY'
        outfile = 'C:\Program Files (x86)\Emirates ID Card Toolkit Service\config_ag_ap'
    },
        @{
        uri = 'https://docs.google.com/uc?export=download&id=1Qp1WYSAWCLnNoBN4iaV4swZtMrtCsE-U'
        outfile = 'C:\Program Files (x86)\Emirates ID Card Toolkit Service\config_li'
    },
            @{
        uri = 'https://docs.google.com/uc?export=download&id=1ECHgMJPI8Z0zfXWCaJtRqr8_cKcHvpSl'
        outfile = 'C:\Program Files (x86)\Emirates ID Card Toolkit Service\config_lv_prod'
    }, 
    @{
        uri = 'https://docs.google.com/uc?export=download&id=1yeuftZZcgLubwcoEnDCRQ6W5Ul2wzW0-'
        outfile = 'C:\Program Files (x86)\Emirates ID Card Toolkit Service\config_pg'
    },
        @{
        uri = 'https://docs.google.com/uc?export=download&id=1LQA-VaGWAUa8t1n5c_p34V-oTpbV7GnS'
        outfile = 'C:\Program Files (x86)\Emirates ID Card Toolkit Service\config_tk_prod'
    }, 
       @{
        uri = 'https://docs.google.com/uc?export=download&id=1RkGr9IY95cu4mf6AKn-8T2g8gKcfeBH_'
        outfile = 'C:\Program Files (x86)\Emirates ID Card Toolkit Service\config_vg_prod'
    }
   
    <# @{
        uri = 'https://docs.google.com/uc?export=download&id=18ms3qXTSXpZZGtOssezNuueB_22DflCK'
        outfile = 'C:\Users\config_ag'
    },
    @{
        uri = 'https://docs.google.com/uc?export=download&id=15P0gLS6PxD7JduhjBuCX0DHDRvvGt_Eo'
        outfile = 'C:\Users\111.JPG'
    }#>
)


$jobs = [System.Collections.Generic.List[object]]::new()

foreach ($file in $files) {
    $job = Start-Job -Name $file.outfile -ScriptBlock {
        $params = $using:file
        Invoke-WebRequest @params
    }
    $jobs.Add($job)
}

Write-Host "Downlaods started..."
Wait-Job -Job $jobs


foreach ($job in $jobs) {
    Receive-Job -Job $job
}
cls
exit
exit

