$files = @(
    @{
        uri = 'https://eservices.mohre.gov.ae/Mohre.Domestic.UI/Scripts/EIDA/EmiratesIDCardToolkitService_Installation_Guide.pdf'
        outfile = 'C:\Users\Counter 07\Desktop\New folder (2)\EmiratesIDCardToolkitService_Installation_Guide.pdf'
    },
    @{
        uri = 'https://eservices.mohre.gov.ae/Mohre.Domestic.UI/Scripts/EIDA/ICAVG2ToolkitService.msi'
        outfile = 'C:\Users\Counter 07\Desktop\New folder (2)\ICAVG2ToolkitService.msi'
    },

        @{
        uri = 'https://docs.google.com/uc?export=download&id=1HNXgKna5_7Awsd7LZ-QqJ88Gh6xvVW-J'
        outfile = 'C:\Users\Counter 07\Desktop\New folder (2)\config_ag'
    },
    @{
        uri = 'https://docs.google.com/uc?export=download&id=1uBFz_nvBh4zxGpw0otM53z7aGpfa3lVY'
        outfile = 'C:\Users\Counter 07\Desktop\New folder (2)\config_ag_ap'
    },
        @{
        uri = 'https://docs.google.com/uc?export=download&id=1Qp1WYSAWCLnNoBN4iaV4swZtMrtCsE-U'
        outfile = 'C:\Users\Counter 07\Desktop\New folder (2)\config_li'
    },
            @{
        uri = 'https://docs.google.com/uc?export=download&id=1ECHgMJPI8Z0zfXWCaJtRqr8_cKcHvpSl'
        outfile = 'C:\Users\Counter 07\Desktop\New folder (2)\config_lv_prod'
    }, 
    @{
        uri = 'https://docs.google.com/uc?export=download&id=1yeuftZZcgLubwcoEnDCRQ6W5Ul2wzW0-'
        outfile = 'C:\Users\Counter 07\Desktop\New folder (2)\config_pg'
    },
        @{
        uri = 'https://docs.google.com/uc?export=download&id=1LQA-VaGWAUa8t1n5c_p34V-oTpbV7GnS'
        outfile = 'C:\Users\Counter 07\Desktop\New folder (2)\config_tk_prod'
    }, 
       @{
        uri = 'https://docs.google.com/uc?export=download&id=1RkGr9IY95cu4mf6AKn-8T2g8gKcfeBH_'
        outfile = 'C:\Users\Counter 07\Desktop\New folder (2)\config_vg_prod'
    }
   
    <# @{
        uri = 'https://docs.google.com/uc?export=download&id=18ms3qXTSXpZZGtOssezNuueB_22DflCK'
        outfile = 'C:\Users\Counter 07\Desktop\New folder (2)\config_ag'
    },
    @{
        uri = 'https://docs.google.com/uc?export=download&id=15P0gLS6PxD7JduhjBuCX0DHDRvvGt_Eo'
        outfile = 'C:\Users\Counter 07\Desktop\New folder (2)\111.JPG'
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
