Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B489535B62F;
	Thu, 26 Mar 2026 01:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488080; cv=fail; b=uDqiKH/pHt5UdQs8j2a0cTYsclwL5HB6sPGiYaiG1wImHDptvRMMDe1rzIfQHos33JS5SMoNArod0jjcuYaiWiwDCr/4FlC78bXdVMleN67+PRZzsFQjOZ9qki6jdNdmgeAIW5xxb0Bcq5OdeUx8DotjW7WEcnenj10Tntyb4W0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488080; c=relaxed/simple;
	bh=N0Ig5/dbG7fjnwPPKaibcOmKV5veyFrMeYgB1e62RhM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XGA1QwwYUtf6cSDRgSY29P9UybPEKawfxBVdfkiEHujs4j7YM3tUd88bZieM1YuAThoxe6yLc3wbuK56IMnanOaUzeiRTP0Fz4oC2YKiTi2XqeNP9TJd+N2jOAolsRnSqE13khx1HHzSZdGt/+Lj1r3aqh7Ac4uQg/o9ll0V5Xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GZUfRhnJ; arc=fail smtp.client-ip=40.107.209.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GZUfRhnJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRcYOciNmKakcl+6oLIRTuLnXNsoQPRMp1Wp9hHvVYOmgYdSL82+AI7RZQnwPRmYJU6HJedPG51e3w0WFgI87k5m/LHAwtzvl/Hrz6ZZ7s0b8kYQgDxrx1eTnynI1XTjfEf/L5DbXPxggV0ai7wYO55v2j2cWP26pF6ofeOsWGBTAf6w0bRfg2FYzPTl90+e/Bx9RwsH+JsM+Sd1VfXokTDPigMIO0tyc2Jl5e4YMSOnaO9KioMszMuUDo/5PDlrQ1i0Sh5Ud2F4KeUXaPvexvrrz/2y61o3Ag2IyBFQPzd4c19kw40pkTC8125xlEibjzGFWfAV/gqY+YZYYJ4M6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Dw3Ga8c0JX6B+nzBMOfvMLs/qYf43gCLTVQFsr+tw8=;
 b=c0KjRFe71OwVEeJjDQQ/HwAjiXZTUFT7CT6QelsX1M6WdY2R+Bpj3nxOJpFqGitG1uTxGbBPs13oFlp321BMbpZoS/jJV5DbqpA7RNfNWZX74wtNQJ3b4/tZdnsYbRZ9NkDOWXObGycCW/y6iS+Ghmwchw+4nk1vKzITaRJ5aFsXbnBhlRYXsbpIJS1QK45ZckO4v1bivIuJBtVV1B3+HcQ+2MUFbRrF8pcLIun1Uko+Uht64qgazJ/sWgV1Skr4BdZTv2qF5AoZH8PSR93DdKN665xCzj+Mf6FtHMFX5s/VKS36/1dC22vdYMEsj8nU8pdr5pZF3APITVJZNduDGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Dw3Ga8c0JX6B+nzBMOfvMLs/qYf43gCLTVQFsr+tw8=;
 b=GZUfRhnJ9+1fINHask0TLWC49XG5/1ul2Rs/aG6iO9vN75T8gSVDmytsje4J1imok+ERiSiXruSPwqu5h7QhKAKc123VHLsZlilsLAP1YXMlLZXlGTI1RUHcxrAndA9ps3b8ofOfs3zsOw62uGc9qsmnKyjfb7l+uqd1qXfy3TCs5skqKR3x3ABi6UJXOnvsUQQw92rZn34qTAqpgcSFyexE9dU29Rm9ZyU8sXA8hjtH6WyeqcWXF7H/EB49rFrMaJY/iVCwtqE5ojkNOw5jwsYHr/CzSeq9kXXHlsjZaIPf1One6UUKSWtL9F91Z0uFnahfBGYHcmCa54EaQh8RCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8354.namprd12.prod.outlook.com (2603:10b6:610:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 01:21:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:21:09 +0000
Message-ID: <f671a23c-958f-4c18-bdf8-872c3a1556bc@nvidia.com>
Date: Wed, 25 Mar 2026 18:21:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/31] gpu: nova-core: add Copy/Clone to Spec and
 Revision, add chipset() accessor
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
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-5-jhubbard@nvidia.com>
 <177443567642.105362.18071452933227174303.b4-review@b4>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <177443567642.105362.18071452933227174303.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c2f33f-c637-4a25-3ca6-08de8ad5f5cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YxBpVr6O9iX3uqMBxcDTHqnYFIdxxektQ5pjJ3ogvzHk8K9PZZU9nbEq7G6BZqZx8K9VqCk2cYefZ7HngAMFNdTuptXqX7IgCGYR+dONnz2qTbnbsOnD0TfMFRLouqd/bYhsF4Cf9Bb24FMSS0NUo8AYszeieI+/UgUu1zBI6xzHwuLPrslpZYN75PzotkqKokW9RyS3VRAkFSgMMQrC6wtufr5nAdx0bKU+vOUQNDaqH2n2oH0jioMk2v6zM/42j09+9iUNay/x1C69o4f/Mw92tPm1hmqKVT01wdeAp/oOogvVHMgM0Hcwnmc2t3euW47tTg28EkkMpS9hbM1S/CSC8IFuOPIWQdIfpVRJserfG3w9wav8dKPwEXpxK1lN9GVbfge1p/YR/oJNsf5CA2BMTfE0GJSTtmE3AP2S7o6gehStr62DKRMEtHexyeGJInUeYcGWL4paBdcoVnkoVHh+9HzUYu7VTee7wfy8ZR5KtFiJ6dvrtBRwUg3IZRF4gwQf0I5aUiV8mNZGFSQOEyFDzpFmgS8EivYVqbZD3JR9Jyrs9IdtFCjGYho3M4OGIHx7dCo0b5xX626c0P6fw3p2Sw93SwjKbtwpzjpDd+VXAzJ8gDt4Ty+zp1Vvg5WVugaeK2PtG4W2c0FH1aQ46a4DiQx2sfXJ77oXvW0Un5t1B00crTzYUyQC2bUgRBloeca0Q4isIhreiWx0MHrJD28muL1BnP7XO7cjAMlwVII=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmJsYnErSkx3dmtPeEtGRFQ3WGo4bjBJUFdNMC9oajJ2OW1QK25oem9XSFJt?=
 =?utf-8?B?QVlOYlJBMksyMDkyV0d1OCtFTUpSV3NLNm1UZ2I0QTZJRDdmeHBVYlZCNity?=
 =?utf-8?B?WUsxR2NSNTBCMjJrZmhIb2pldVJkbjBoSytIRmhodVRNN2VxTGJrNWJNQnNW?=
 =?utf-8?B?SEJoRjBQOWh4czBUbWhseUlLYVNMSmZSeEtTS2lxMEFHaWxlTXk2UFNZck12?=
 =?utf-8?B?dEhXYnZFc0ppM1YyVGxHa0t4ZHJVZ2JrMG9BUjh1NDhmdkNmZDhvNVI4NXNi?=
 =?utf-8?B?ZWpzYmlQNXRlcnVaYno4RFpvZnBrQmttam5kbkIwdUZ3UDdSb2MwMzJ3ay9w?=
 =?utf-8?B?YzVkbGZnK1ZVclNLdXJQbVM4T3BZd0pTQlQ0eldwOTFBQ3NKa0s2Z2s5ZVFl?=
 =?utf-8?B?NkN3QlNRenNEb2ZDS2UwMEN6OFBWeDQzcmwrcDIzV2ZCYTE1ZERpTGRISWZ0?=
 =?utf-8?B?Q1JEa3RiUDdiRi9yK09pNGFCQUhsRngrWS9weGZaMy9HeEg1UUtHSVlaRlRG?=
 =?utf-8?B?T2lPZEFCK3RsNlltb0tmakpDU050bEN6S3Y1QkVNYnAvR1Avd2ppVDZrbmd6?=
 =?utf-8?B?YkhMdUx5RG1uaWQrNm8yT0pHL2hCdGZDV0M3THRlYlpDWGJTNkpJeWpUNll0?=
 =?utf-8?B?a0FSNVhUb0I3QmZlandOcHV1cUc0eWttYkNNdUxWMStqUHVXVlpGMDJtUFFT?=
 =?utf-8?B?Wm54TWRjdi9nRXptd3BnMERORmwweGJ5MTYzRHpXN1lLWjluekJ5SlFCRzVB?=
 =?utf-8?B?cnpKeDRFa3RraG5QbnlURXUzeUlVbXJpeXQzaWZqaksxU0Z3RzF4em1wR1h1?=
 =?utf-8?B?RzBHT3BHSnF0UHJtbUIvSXVIWVliK25MQUhNZTd0WWJENWVnRTZyazdRbkdn?=
 =?utf-8?B?eFNiSWhyOTVGZ1o4NEQ1emwwQjBtTnVPY3NxMCtxekFsQzFSYnZrN1YyTjJR?=
 =?utf-8?B?T0c1VTEwc3RrSlNobHZwd3p4c2xDZ2RMQWl4NDR3YURlT1RvTWhBNllrM0Nx?=
 =?utf-8?B?ZjBZcUo5elQ3OG1EbTV1eEFqVkFQN1E3QlBCRFYwLzJPa0JGenFHSkRuV3Jj?=
 =?utf-8?B?WTZVTXAxM2hKV0tFMjFOMFRhL1RDa2toMWRCelJQS3o3SnoySG5OcmNTb2Yv?=
 =?utf-8?B?Qlg3QkxGNVM2eHJIS2laMTN3OVBuaS90emFPY0dxdXdJUVhsck1FL3djZmhQ?=
 =?utf-8?B?a0U5ajJpeHJvSmZyWGgzNWE2dmMrczYvU2ROVkdGZUhRVWJhUk45LzE5QWk0?=
 =?utf-8?B?akxFRWhGM0hnTHhSMkY1ajdJbERtM2Y2eitab1ZGaG5oTHNkYXFOQjhsRmNy?=
 =?utf-8?B?VXRzVTZSdGtKZlAzTkJJWDZVRytxaG1UNWlPVTdFSXNhSG9aUEc4STZzZk1N?=
 =?utf-8?B?ck01VVQxSzVnUk92L3l6ZkxhSEhYa1A2akx5M2RVWURiMGZmUEtIb3RqY3FE?=
 =?utf-8?B?NXlNckM3dTQrS3A4c09FcXlHRGRiWU9qSW13a3JhVHZxTUFRaDVuRkxSZ256?=
 =?utf-8?B?NXIvTDd3R01tdFVSYXhJbEUwQlI0YlRKRTA2SDMrWkdZVlFPNEE4eW5jQVo5?=
 =?utf-8?B?dTZNODQ0R0x4b3BCekVwR1QzSEFlMEJoekgrd01tWGFXdDEzV3E1RitsWTlF?=
 =?utf-8?B?dUg2V1JuSHczdDhYWHRJZ2pnZ01Rd0NNbEYrZ0Z4MHVJSU5sdHZVOHRvb0pt?=
 =?utf-8?B?K05LeVJWQ0ZkcUV6TVZrd01ZMnkyUDY3N1MySlFSV3NsWWx5OHkvRVVjU2xU?=
 =?utf-8?B?L2J2bjJmOXFEbU5YN0d4UFFkZzdNZkU3R2kzRUVwMjZDV0MyMnZyODFrbHk2?=
 =?utf-8?B?QU5ralkxK01RN3NKMmVlbUxuc3RuVGtHQmFOYVlxM2hac3Fta2lKeiswV3Bo?=
 =?utf-8?B?RVErc1dBSGdXaGZ4KzFVT0JaSU1UcVhzVmNVYS9CSExOMitDc3FaWW5oTFVm?=
 =?utf-8?B?R1dVOFFYTmR5d1FnWUdpQm00NlpOZDdkYXpNOG9LQkF2OTI4M1haRGtWREoy?=
 =?utf-8?B?dGdFckRvOFh0c2VBS2szYWR6WXZVTG5jOXFabjJhSHZJQW5UaDVPM2VBWCtz?=
 =?utf-8?B?eStBVHAvVTF2dk1LM1d1L2xQaWpOTlAybW9VTlN0MTlnT3AvTFhLc0t0MkQ0?=
 =?utf-8?B?MjU0V2R0L2pRby93V0IvT1FrRmMvbjVsdC9OT214WmNnanhpUmNrU25GcVNH?=
 =?utf-8?B?VnZ5YVNFa2Yzb3V0eWF3NUlhaDRZNVg0UFFJejNHSWNmVU1vRGd2MzJlYzBU?=
 =?utf-8?B?STlScTAyaG1KUGxoVFNMSVpqSFZzcVBhYVZkNXFPS0RWb050aWp1NEQvSmxC?=
 =?utf-8?B?QW0xaU5iSEZGWjYvOFFpK2w3TTZjbUNRTWJhZGZLMXZiRGFWSXdHdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c2f33f-c637-4a25-3ca6-08de8ad5f5cf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:21:09.2000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7apzoIOkS8Aun76kZFLaKxAAORY/l1jjGO/PbzHp99eU9Ahs0znkYJ4DNm88RRmMQgThiGAUfRBX0e/rpQnDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8354

On 3/25/26 3:47 AM, Alexandre Courbot wrote:
> On Tue, 24 Mar 2026 20:52:15 -0700, John Hubbard <jhubbard@nvidia.com> wrote:
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 3b4ccc3d18b9..3cd7709883be 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -291,10 +298,9 @@ pub(crate) fn new<'a>(
>>      ) -> impl PinInit<Self, Error> + 'a {
>>          try_pin_init!(Self {
>>              spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
>> -                dev_info!(pdev,"NVIDIA ({})\n", spec);
>> +                dev_info!(pdev, "NVIDIA ({})\n", spec);
> 
> This doesn't belong to this patch - let's apply this when we actually
> touch this part of the code. The next patch removes this line, so that's
> the right place to fix formatting.
> 
>>              })?,
>>  
>> -            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
> 
> Same here, why remove this in this patch?
> 

Fixed both, thanks.

thanks,
-- 
John Hubbard

