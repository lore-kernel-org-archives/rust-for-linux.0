Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013011.outbound.protection.outlook.com [40.93.196.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1912548EE;
	Sat, 18 Apr 2026 01:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776476537; cv=fail; b=KkiPBH8TO2dbixl/kXsMTbsIHtg5A8JTEr4wqbBHROxjPWKdBXGPel1p/kcluqrtLWf9Q9hXV1GwGQbPtosT3mQA7yBT/bQFHi/9+zu1wBA7mbtp27cVJXC1U1knYptA80/eUwgni7df63sKdbgIxRKuqxTVV0VeNmXu4eNo5eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776476537; c=relaxed/simple;
	bh=ke+RfOnQ1FtjG5ndv4GV05oiQfTFbhUY+m5rqL3CHsA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bhuOLfQntMo0JfuwQ6GcCXrm5mBfizOlEqG/869r6ddP7mwhghHduc0RuwM9ExMPLxSYu0sfV+sz1Cs/ihWddUwIpOrMltCtdSSMM5AFMepDdY8MiwkZHBWsSNO7JAKWqSxEzPEWRTpRLZrGxiYZE+mRVU/Nd36lfT9YE5YEwac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fctPdysq; arc=fail smtp.client-ip=40.93.196.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fctPdysq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+bBfzSI5ciWYdg+SCArkdaFYuvNQnaxxxojfGKxl9FxlQps+OgLno5B8fjhcUx9K10R4OpcGagjQcq8uCu12ZPnKcDdAxWrjw0WTtdSzXCOWmtmXN2d/uAf1aoFk8x3+BsMSEFrrBKI4u5cZfSDsh9WEiDCtSw6BLgVnJxcWfoyIWe/ewoetgPHkpFuVy+y9b0oiqDVXSmaMyqLScbbQZJWHh798UWO05sfh6Pq9Unsx//XdM5GcUniFfhNv4N6gHUHeIpzPMbc3dXJTIJNmQLiOjPi8IxhzI//IxGzUZdNABjrQ4LkcweaSvU5iKjlLkL4VsNDPc5aDVdekq14vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NemqReGc1OGLZ57p0yNOE7evZ2oR5huibWh5HIXZVmk=;
 b=gRE6WPlrl6JXUMieXkMauc3tnAJnQlsmtufQ8kkCFYVwPvqXDixzVqCArSY3H1Zt+SViVkw3fCIzkEQhR4VN/nJugRFWOR76MXMUNNE77Ax9AboRUIOwz9zU6X1Ax2cdnUmQD/zkiodOrmx4DlnvXj3MRtbsvkGSoUdxv3sv6sSewqDmTVZvJ+bwSENJgUq6XS2saCFLArD16+6MW3m3Z7zLRfcAquy5CwCwn7kas6B6xRbOPavIBZeMEcS/rjvjHhVC8pqpQjvd703Sn5SbmAHV2NbME7nh//qGJjygybcywusrr91D+47g2DqHhG4tsoMxC9N03wleZN71PuplFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NemqReGc1OGLZ57p0yNOE7evZ2oR5huibWh5HIXZVmk=;
 b=fctPdysqKDVwqRb7hJj6WJ6dXoxl+7YeOzEevcznIyq+DzO2PgI3XZl72PcsQiywXY8ccVtat8h/HEYTU7Z/VDwJoJGJW0s6wgO9lrUmHtcw7/DhTZ50INf3oXbRv5dp/qekGMEevnOvMObhO6wNVcWYVAcZslhGgVPv1hOfrgXupc6kF4pH5l2k09A5Yirli8lLy3VY53uDk8Wl4FTHI7WCzZ6eM/Ft6F3+QNkR0HDzGBDEpXE7QmyNvEqHaGWOzkn85ZlnrdhkCNXNiMxbwOHjR8PYSbJ+4RhorM6e28FwbGmw7KOoOUW4Fg+VuKwr0cAuMC71HakNIV0g4ANplg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CYXPR12MB9318.namprd12.prod.outlook.com (2603:10b6:930:de::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.25; Sat, 18 Apr 2026 01:42:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9818.023; Sat, 18 Apr 2026
 01:42:12 +0000
Message-ID: <bf7a4b9b-3e33-4d0c-9563-7ce39a0f1eef@nvidia.com>
Date: Fri, 17 Apr 2026 18:42:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/28] gpu: nova-core: Blackwell: calculate reserved
 FB heap size
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-9-jhubbard@nvidia.com>
 <DHVHXZL72CJT.2R0Q6BBZWFIUK@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHVHXZL72CJT.2R0Q6BBZWFIUK@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0039.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CYXPR12MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7eb0bc-1329-4674-2a81-08de9cebb62f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fonsZYrdAYVJlZLGEs8ZFWgGGc5O7St1fUfX7PdgmLv3NZsskFqn28756HdrSsEtT7fefWj7zflIcFOD9piF1vlB2vw/tULalrXZ1OM8kCSqEB+bMv06uh/txVQ5yGy6bRYfvZqh2LcoQvM0vIGRF02kUk6Gv9Gek+J+iW7fLSpZF0IblX0BHcQDqTn4K/wEGf7//Hk9lZHXGAA5W87rmWDE/P/BFQ2R8euDwrY9rZDRlqiriWHSWdvf+YMaQ9Qmj6odVNFFHZqxMMNtXv/cR21Ys9uHcdFbsnFrwd0lhfVEfb9Y/mfkI1KRXzKxy62IIvKXQXvpPeFIvB7LgpM1pxT/xtJcuNuAj0+rtu2HczY6tYWvaQJ+ISPe0VkPSObnkdVhO00zr5AZpk1QdMb0KocDfrncGWkCZGRWVQfHroKxD1G7enZNiyWVZar7Lcn+vpOhKYxS2kG53P6bJQZ3fWQf/d4+/NpcxR5T0sP+FMqdGKjoI/90gDFSBGCPP3Yg5xcUqc+M1zW9TCvf2tm6wozK6U8QGKJHytu7nO+3E1/ksyByRV7ynPPD0djJGUvGLP3ofH97pAoFQveMNJG7GW6gr5NoE4v0094geHNf/mKqPLdTKdzZJZD6aaqAurp+HrnRZSaayzpOhXBI8ZGPq2/lN7Jxj4DV8/InbjrJn5SxeDR7S6OXE8a5X/TOTk8IPgH0DgcWxASJlEZrrFAoDdnYgg8Uezy0d3qybRSNRFU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1BqazFDVzhKMXhYa1hzMnVlaFZSWHFFeVMyTUo2eXl2UkpSZlJ0bWlJUGov?=
 =?utf-8?B?azNHNmkvdFNqUEdMd3JFcDRkdERDTHFTbFl6bkQyUmo0bjBnM21FWXkvWUkz?=
 =?utf-8?B?K29ML0h4ZVB4ZFhTRjhCenFlZUZKNmxwWUpqL0NLdm52elA5a3Zpc3ltWWdn?=
 =?utf-8?B?SzJuVmJFMVNqNUJpRmZEaWZkc2hZWVVMNUhFZG9HOE5mUEZBSm5YNWRLTmpi?=
 =?utf-8?B?eHAwc2JCUU1UMFRpMDd0V01GcmZla2tuQW5DYk54S0w5eTZhSHlENVFnK2Ft?=
 =?utf-8?B?VjdUZGhKMHFWa1N2QXlRbTg2bkNGQlU0OE03MWhsUmdDY1dDWURMTXRZaDg3?=
 =?utf-8?B?K2N3Zk9ibTY5UER2ZEEzK0VWU1dqT04xbmM2bWdmTGV3VUx6NWpqUWlmSzc5?=
 =?utf-8?B?NkFzMW43MmNlWFBHbk90ZHEvTmo3TmZVYTJPb0RLcDhXN2syMkx0NlJLZ3lt?=
 =?utf-8?B?M01nRE42dnZpV3JSVzZyL01pNnRHTnF2dnZkMkppNWg1cW9LTWRuVlpUQVhK?=
 =?utf-8?B?SHFhKytXUjNydjh3Sy9NUHcvenFPcnBOalR4clZBTW14Y1A4MEk3bUk3cXRa?=
 =?utf-8?B?ME1kM3FCeGVwcGhRRml4aFRLS0dSN1ZhS0Fvbk1yd2MwaU1VM2lSdWJFT1Vx?=
 =?utf-8?B?WGFRZFVOVU1hQWk5Si93TzNtQ1pjRC96ZW1qbTgvc3NlOVVjczJZcHV4endV?=
 =?utf-8?B?V3gyMVBuY2wybkxHZGllSmgvQlRPZWxJRWgxT3VZNUlVMGkrRVIvdHJ5UEF4?=
 =?utf-8?B?MENIRmZZRXd4NjFma2ZBSStwZit5YzdKNkNRK2J5bmJQOFFJeEpZN05HaFVV?=
 =?utf-8?B?THpXeS9IaHdNcGk2N2JLYjR5dHFGTFBvbWdyVEZHM1RsdmFPTnZ3YjFsemJY?=
 =?utf-8?B?NlJyUCtlT1lhRWtmcmdXQXBrOVZyZ3hJWENYU3pPNWFxbWI5SFBsemxINm9K?=
 =?utf-8?B?UEpkNlBWcUhNamRnRlJMYSttNFhCZUFxV0VsOWhJK3lLbUpFY01Kd0FNY2Rn?=
 =?utf-8?B?dmYyY3FZSk1FWVpSbTVvbiszdWpzYy9BME5GVC9PV1V0Q0xPaWg3cFVOYU1h?=
 =?utf-8?B?WmN0Mk5YVmRzUEJtdllwSkltM0g2OWJhMG1LMEtFdmI0dzNIdGVlRWtmdTYv?=
 =?utf-8?B?d244cGpXYzdDRjBZeTNvNFMzM3VaYXNRS1V0bk9MSVB2RmQ2ZUZQRVFsSDN3?=
 =?utf-8?B?Uk9MR0hKa1V2MWhFQlo0TUlqOGJmcW1ZOW5xYS9aWjl6WlVoQUdWU0FCN1FU?=
 =?utf-8?B?cmdSdElLL1M4S05kNXRKdTRESlY2aHZ6S2hhRldIWTltVzFTN0Y3T2FqNlpp?=
 =?utf-8?B?bzlmY2dSUVZpYjNXYndjZTIrNGpJL3VsNm03R1UzK1RSdkZrWTBCamI5dHpB?=
 =?utf-8?B?QTZXUGlra0ZvV2wvK2V5bzQ1aE40Wm45cS9kNEMrUGo3OU1seGJ5N0k1TTBH?=
 =?utf-8?B?RmQ0SGtDYUUvZDFvNHFiMjZqRnVWdmJxeFZrMU8xMVVWdWZ0cTVmTUc1Rjdt?=
 =?utf-8?B?UGVaLzZMZDN3RWpteUJzN1B4WHV1cWk2Qk9iS1RFMzRLZTk3dlQ4WTgweDNF?=
 =?utf-8?B?OXlSbjdIMmh4bFV4YlBFK1ZqLzhpMHNEU0l3aHMzV2l5NU9RN2ZmaVZtaGha?=
 =?utf-8?B?UWpLSXpjR0F5TEVLZUw0aENBa3lKeHFLNTc1UlV1RzQrankyMEJPUlBib3p2?=
 =?utf-8?B?RlVESTM0bHgzdDljQ0w1ODVvMW93UnQxcENMRkREQkZWSWpETnBpWGt6T1FU?=
 =?utf-8?B?dmdUQnNWSDI4TU0zbitQd3d5cVhFc255UEx5KzRMYzRWdXM3NE5hU0hTQ3dO?=
 =?utf-8?B?YnlOK2N0OUgxWnZYYzNBRDdIM3cyangwUU9WVGVCYzJ4VFg2TVdvRlBnWUZI?=
 =?utf-8?B?N0NMc0pFa1h5Z2YzQ016K1h0cUJsZTRJRERTUzFVdXJBTnJ6ZXF2RXJ3R3dz?=
 =?utf-8?B?dERNcnMzK29QWndFUFRYbFk3dDlxczdVNytDbm1KdU5XTzF5UXZkUVZhbDE0?=
 =?utf-8?B?VjRuZWFYVnB0VkJzV1c3dG10ak5mb3NSV1VaSElzODYvTGdWNEFXK1Jkdm1l?=
 =?utf-8?B?MjFZNDRCNlVYNm9ibFQ3aFR6amU0SXBDeVFVVXpMRGVaejQ1VzZGbE04aVQ0?=
 =?utf-8?B?c3hCWHIrb0ZjVFFpQkF2OGVvYit6a2pDNlJacTZvU0MzNDFQWkNqVHY5QnhG?=
 =?utf-8?B?dlptZzRPNTFrbHh5SmtoeDIzbTJ5Vi90YWJ3bWFWZEFFRElOMlVjRFNPY1l1?=
 =?utf-8?B?aWJZa2FXUEtZYkY0b3NZRDBiamhTckNocUtTODF0bFRvbHlEczROYzQ2SjdV?=
 =?utf-8?B?VjZzaldxUlJkcDJIdjFCSDNhMS9PbGZJZEV5V2lZWUlLTklRYU5oUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7eb0bc-1329-4674-2a81-08de9cebb62f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2026 01:42:12.3138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePosElT/ZJYW5HPL9tkk5QCPnBc2HTAo99j2bY8r4QPebK5I86vGhV7H/OzZJ2OviM/SFVZyfZkve+zyvh57Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9318



On 4/17/26 7:23 AM, Alexandre Courbot wrote:
> On Sat Apr 11, 2026 at 11:49 AM JST, John Hubbard wrote:
> <snip>
>> @@ -168,6 +175,8 @@ pub(crate) struct FbLayout {
>>      pub(crate) wpr2: FbRange,
>>      pub(crate) heap: FbRange,
>>      pub(crate) vf_partition_count: u8,
>> +    /// PMU reserved memory size, in bytes.
>> +    pub(crate) pmu_reserved_size: u32,
>>  }
>>  
>>  impl FbLayout {
>> @@ -268,6 +277,29 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
>>              wpr2,
>>              heap,
>>              vf_partition_count: 0,
>> +            pmu_reserved_size: match chipset.arch() {
>> +                Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => PMU_RESERVED_SIZE,
>> +                _ => 0,
>> +            },
> 
> I suspect you can just call `calc_pmu_reserved_size`, which seem to
> perform the exact same computation?

Yes. 

> 
>>          })
>>      }
>>  }
>> +
>> +/// Returns the PMU reserved memory size for `chipset`.
>> +#[expect(dead_code)]
>> +pub(crate) fn calc_pmu_reserved_size(chipset: Chipset) -> u32 {
>> +    match chipset.arch() {
>> +        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => PMU_RESERVED_SIZE,
>> +        _ => 0,
>> +    }
> 
> We should avoid these matches on Architecture in common code as much as
> possible - that's what the HALs are for. Which means that
> `calc_pmu_reserved_size` should call a HAL method to obtain the right
> size (I'd also rename it to just `pmu_reserved_size` as we are not
> computing anything at runtime).
> 

Yes.

>> +}
>> +
>> +/// PMU reserved size, aligned to 128KB.
>> +pub(crate) const PMU_RESERVED_SIZE: u32 = usize_into_u32::<
>> +    {
>> +        match const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()) {
>> +            Some(v) => v,
>> +            None => panic!("PMU_RESERVED_SIZE: alignment overflow"),
>> +        }
>> +    },
>> +>();
> 
> Consequently, this should be moved into the Blackwell HAL - which is
> where is belongs, as contrary to what its name implies in the current
> module, this reserved size does not apply to all architectures.

Right. This originated in bringup, when I didn't fully understand where
and when PMU reserved size came into play. Now it's clear, and yes it
needs a HAL.


thanks,
-- 
John Hubbard

