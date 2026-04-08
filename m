Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012000.outbound.protection.outlook.com [52.101.43.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB733363089;
	Wed,  8 Apr 2026 02:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775617198; cv=fail; b=sh0txFK7t4X/cBm+lp8dOgLHjH+gMg38JSrwEPUwp8TomZ/yfFVcu2tfPEyT4rNSbbsONNR4lPS8jESHxwUE2ot7dIhAgLCl4SOd0sciJRaS0qOj/LWzzfKnkfnYCilRON7vmDFcqeFS3i2sCR8Jb4nKg47r7lBNB0/yMcdLFck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775617198; c=relaxed/simple;
	bh=E2CscY1sV9W2kJAWb8QsyIhHeu0EfbOqMPuGbGbef6M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b8PO8V1aKst1ODOVMDI5LF/8JGSDAyw56i19IpjXaDgX8jxJsAsRb6ce+vrhJ0Q4S0kzz6eXrZl/fdLCXo/npZ3WQj1XX/fQ12SxpVh9bEhack4nkrfDfKUHQXoDy+UyRPVYHdLOGmKPBNgeRbJRGw7+t+CW/Vw66xhYtG0qlOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sMM+O8tw; arc=fail smtp.client-ip=52.101.43.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sMM+O8tw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9d4SsfPOPELtIZBILu4LJ9soQj4mmLzGMdoi6tln6x4TSARkdKMzRuXBhvNdFVFunLzsjJ5UvYGMZHyQbJMZ2r6StcnaEMLnnXJOKadCqhTeTHQ9Fe1L5fSSLvGQysi4szQQTIM/DRGPJzINIjB4lucOtAb/IWVOosl1buIJKadQzu3FW8EBAe9AyHkMcOUJgdslBteA6Zz6kVRrO28Dcndd7Jta8xud9yEqkXlv25ha9PQDuNqUgBtXMPWbo+abuDl2QsgqzWwDyzSMZLO6CO4wo+aXiUWiD09BafxZ5m5TwGyD4qiLl3AzTILxKhmqFVIu1/T2u2b5wTtlcHysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQmnXfIRMRAocggoGDKn173BJc4SgYhdOIxzbeBaWLU=;
 b=Y+iI0oezdAmO9KZCOVyRLIlOhdda1X+fsliZGHFQ4SESGVUmcj+71idqj4gXOlSHYf0bK2CuNq2Yjtdbqc2x+Lizyw1Cf6SLsZVXKqixtOZBUky2XkNsY093GH3rzEAeBrFDS3B+ZOI2SAmnQcYCROrayDWjl9L/cK2aT5AQ1k4C4MvhfT6kuwCyUWhKcbbczKdm0oELjZGBEfHBGFA/0WsckYEK9+n6IBgY/mnBDCx1TytN3dIeGAkkiINSJAWaAcmNkOiYFP+bJ1SGFxIBVZD3hkTsx+3wjIMEMZM5ZXhCTioen4um2+yXbyZH6jRQytJsO9Ol7Sv1655NkV97GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQmnXfIRMRAocggoGDKn173BJc4SgYhdOIxzbeBaWLU=;
 b=sMM+O8twK4lPP1QtsqzD82dumzDfKw379oPm+3WaZ1iu9p3iZyJkTBCoiNzNnnRXOGMV4oS9tqMcua18mLCWuFpz8s8KElO8hRCCt6T1kcaBpmjNKYMWXxlj9HJll9UDA2bHJI+HUfHi6hDPs4cZY3E2TpWHvyU2HOnN1Nh5pAMbNAzk/zLHjEKcxr3y4luQ6Gc/o+77uZV9S0DyjL+g20qSwtUkk+PALEwrB/r0eEV4quLIXF0NMHZLiQUf4lwsBBpkmowhb3heCZKFsyDVEOmPiqGcnTepTcqFpuRPlQDT4Pja0VSF1vPArARzs8G+4Ny8aL6TIOYPQ7ukfqVl+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB8873.namprd12.prod.outlook.com (2603:10b6:a03:53d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 02:59:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 02:59:53 +0000
Message-ID: <3f568167-5a1d-4ec2-8bfe-cadc5f88c898@nvidia.com>
Date: Tue, 7 Apr 2026 19:59:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 19/31] gpu: nova-core: Hopper/Blackwell: add FSP secure
 boot completion waiting
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
References: <20260326013902.588242-1-jhubbard@nvidia.com>
 <20260326013902.588242-20-jhubbard@nvidia.com>
 <DHNEBXMYZQH1.G10QHOA6EH5R@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHNEBXMYZQH1.G10QHOA6EH5R@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB8873:EE_
X-MS-Office365-Filtering-Correlation-Id: 073530fe-c68d-4f20-2e6d-08de951ae84e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1AowKoRWHhMFCBL63Kw9TPsHaTXLd0z0uki5nd+ff5qDFySEIW1vfSDeFluTqMQMnMzuRTq1ubk5Zr3AEY/3beFU9ACL3ozkktylYMGyScfd1NMFjg1qwqETxXLiEwNMTAbkNEcqq/Dn+4uNVy3rY/gBMWsxZQohpWXGqrtTVp52QT5Q6vPWfpa8ujAWOsdzZawY4yttToetTKS3RjGyzhwoISpgur0Q1HnTEfkf4d0Z/eTu7Mx39Qdj5TxlPbgcIq/ELu0xeIHKLTwaz7EONexjFrw5kbWg6mbwVkWMSKvvIU9b1xRpZ77aP98tEBOLd1JgTY1q8uoqfNyF+q87gY9zxtWlb7wp5jVR3jzYlpCnIxQRNhQR4xVz8bebwR1Lw/U1IULnyIGzPC44ur3JAVMvbidD62EEYqCCXhdy3SJ/q3ZleaIFv3RfuuGtwgwPsYZ1ZxF9niWjlFudvVydFxhlvafQH9FY07I4cUDdfSqlUkYCyt3hjKH0SCraqETeRC3+EekyTHIPrBO0Ac1qgXbB853FQnWudeOVmNbJpJ8neWmc1n3zuJPyjcnmn4L2oylLVrgZ1DbkaTtH4/tCMxRZVkuAEHFSmBXYsJ7xKq7SreC0bMOfO+U0MBpblJlmZH/rFFVxLckeASHorCPXbSeUz4f05N5wVAMLbDVuKcU9AL4cyZ0yxi5NinyfUTG2Xs7Wte7rA9Ttk84q4MwGPBj7hlFBy/YxlgBcfQEsMgE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUZUZ2IvR2ZTbWpnbW16M09NQTVEZlVDcGdYTWZtMzRLOGlYRzQ0Mk9MWXJu?=
 =?utf-8?B?eFA5OS9URW1xRG5iYXhlMkEwRWtCYU5xa0FzdHJVMGJ6ZWdNYVJFNitJVGZQ?=
 =?utf-8?B?dENLVlJnOHh3aTE1aDllRkQ1dHZZU2FLNjFteUFkN1M4YTRQZG5VZEkxckFy?=
 =?utf-8?B?Y2g1UWJYVDBGd3hOQU1OZnlzT0pzVmUrU2c1bjdBNmRJL1NUcy9Va1JxN3px?=
 =?utf-8?B?NkFaYThxZFdDcDFaNDNlV3FRbHVqdS81aU9oY09pTGNCc3FxdGVBODZTekha?=
 =?utf-8?B?cGFMdkc3aWw1ZHo1TVQwNFJ1NzVwaFpJUW1MalF4Rk5KNjFPWDkzSkFyVHVR?=
 =?utf-8?B?Vk1zMG9JbVBqbnhHUlJjTWtIRUxLTTNBQVZTd202cEp5czJKbG9PU1VLVmxP?=
 =?utf-8?B?c1JtdWlJbldrVU5JL1oyTXozZktpTEZLQVZadXQ0RWJ5UGQrMWx1U1JRZjlB?=
 =?utf-8?B?SmprNEx3TTArazcyVTA5aUtKMjk4QzhGdHdOak8wMXJDK09Zb3NPVW10VVp1?=
 =?utf-8?B?RDV0UW1sSk0zeWd1YTVndFdVd1NQTmJ4QWduaGFxcm1HdGgyVUs2NVZVY3dQ?=
 =?utf-8?B?Nm5PVWV5TmxWKzcyTjlkRWpRM1gxWllpVytVWmREeWZ4OElvaFl0MCtiSFVv?=
 =?utf-8?B?Um5NZFZjWW1IR0FSVUpSeTRCVWlwT0lTR0w5bDMwZkV3cUZuMUtINlBWMThp?=
 =?utf-8?B?b01Hcm13NU50amU3Z0dSUytaUUJ6MkVxYlliV204NEFHYTh2WHc5TFJ3Unc4?=
 =?utf-8?B?Smd2Vmt4OUJpSVkwRGZjKzFYbEtVN0lJQVhLc0VBOENTTis0RVp0bWZiRzlM?=
 =?utf-8?B?bUxKYzlpdTMwbElsblB4cGRTNGdnZlhGZmkyN2tneS8rUkVYbWhwWC9KYVhW?=
 =?utf-8?B?dm5raWplai9YNzhMRndZRkpIcXVrMHk0Q3Q2VVRYQTRVclhUZ3lMNkVFY0k5?=
 =?utf-8?B?Rk80TUNGa0UrTGxkT1Q2YWUzK2NhRDdURVYrajFieW5FTlJHR2kvbTBhbHNr?=
 =?utf-8?B?MFVwelV5WFFVM1Z1c1QvVkZqL0ZJQ01WWm91T29NQ1ZYTjJuLzQ1WXJ5bjV0?=
 =?utf-8?B?YnVRR3NCUzloTENoRUZKb2IxL0dLRk9SNHYyRnBDTXo1Ky9Tby94YTFPaHNL?=
 =?utf-8?B?cE1UcElaWk9nbTRNSkd1dGt4WTFMMUxUdGpNdzloVmpZSTlTSVk3VzNlUUFa?=
 =?utf-8?B?NmJVYUdmQ2trRFU1eUlDQmVuQnFJcWRPVkZFQWlaMmFkRHRwZWl3N2lBN2xz?=
 =?utf-8?B?K0hMNzh0TjdETHJ5L2l5Q1dIa2VpaDU2R3BQNSs3VkM1TWF4Y1BrVHphc3dW?=
 =?utf-8?B?Q0VzY3JKOGVIVndOOFo2bXQzVzVFcmFWanMzRjBoTUVQdUR2NFBaQ2tYR1dm?=
 =?utf-8?B?SW5jWVd4WE0wZ1Jqb2doN1MwUEViOWVEandlTkhwYWRBRXpkczVTSWtwL0VH?=
 =?utf-8?B?VE15MVV3dHZJaGZXS2tDdzYxWlExb3E5OW13UGlmdEhPVEFqcGJVdzlWUlBG?=
 =?utf-8?B?eWxQNkxRZXZETlJCM2NJSXRGWWozam9QcjVNNVBPY05PTWE2d2oxYVQ2S29I?=
 =?utf-8?B?aFRWRG5IME5ZT2hPSFFHc1YySUZqd0FqWTRsK0xsRVdHRVFzb1dscDZ0YWhF?=
 =?utf-8?B?UFZJN2ZJbG90cG5oc05OU2tUUlBuMTZhdEZMb0ZLNmNLQy93dVo4K0pmU2ph?=
 =?utf-8?B?QVNZUmVENG5SNUlUSVZZb00vbno2NHM2cDh3NVVVcTQ5UkxZSEZtak5iVGt1?=
 =?utf-8?B?Nkl5Z1BpZFZjOTI0bVNIVzZSbXVVQmZtUGVHYkRvTjhERFlLR1JTM1hyN1lZ?=
 =?utf-8?B?Wm9DU1FkaUJZOGpzem1RRVV6ODN0Z3plOXNWU0NjVkpkU3Voc2ZUNDJnZHlN?=
 =?utf-8?B?RWVmZU13dTlzVlgxSkZqUUYxWHY3ZWd3d09BVDJWSlB3ZzNMK0gzTUJ0eGNa?=
 =?utf-8?B?U1pOdDBjekZlaTdyYnRJK0x2TER0M1B5ZmFCRmNUL2REVGlUYU5BaFZzcVJq?=
 =?utf-8?B?ZzlVcXZQRTJyT0tobDE4UFY1T2t5akxMUVRScTYyL3hFem85NjR2Z0w1NTJy?=
 =?utf-8?B?ak1TZVZEZEpOSFgzbUFNRVBUUHdJTEFGZkNXU1o1Z0lvSVlBZGlEQTArOUFn?=
 =?utf-8?B?T0QzbWU5d0lKTUhTbXNmQVVYOGhTUERNTE9MdU9pTUNlZklRK1k5aWtNZlZm?=
 =?utf-8?B?Y1FjSytaNlIwY2dQUTRUc2E5RG5jVm1jRThNUlZLNGZHTjg1S2dsOVdVQndx?=
 =?utf-8?B?N3F0bXVycmNVcW9nZVkxay9Dd3RXd0g4cVoxN1Y5aHhzY0FBWXRPQlpnQWNa?=
 =?utf-8?B?QUNhTGc2R2owWUhWRCtDZlU1STdzQ3pqQWRsWU5ZcCtEeWtGUjltdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073530fe-c68d-4f20-2e6d-08de951ae84e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 02:59:53.4293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zK3ZdbrAJQHJiu9Kw+hbzsz1dbOEw9/7/HnD0AqERVpRdKqCWfrRyA3QhxfFOwswB7IzoVrHSkxzHa8n9jUDFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8873

On 4/7/26 6:52 PM, Alexandre Courbot wrote:
> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
>> Add the FSP (Firmware System Processor) module for Hopper/Blackwell GPUs.
>> These architectures use a simplified firmware boot sequence:
>>
>>     FMC --> FSP --> GSP, with no SEC2 involvement.
>>
>> This commit adds the ability to wait for FSP secure boot completion by
>> polling the I2CS thermal scratch register until FSP signals success.
> 
> This does more than just the boot completion waiting (which is just the
> `wait_secure_boot` method) - it looks like most of the content of
> `fsp.rs` should be moved to different patches.

"I" will do that, no problem. Especially no problem since you
already did it for me in a branch. :)  Thanks!

...
>> +
>> +/// FSP secure boot completion timeout in milliseconds.
>> +///
>> +/// GB20x requires a longer timeout than Hopper/GB10x.
>> +const fn fsp_secure_boot_timeout_ms(arch: crate::gpu::Architecture) -> i64 {
>> +    match arch {
>> +        crate::gpu::Architecture::BlackwellGB20x => 5000,
>> +        _ => 4000,
>> +    }
>> +}
> 
> Since this is a timeout, how about harmonizing to 5000 for everyone and
> turning this into a constant? Waiting 1 more second in case of a boot
> failure should be acceptable. :)
> 

Yes, will do.

thanks,
-- 
John Hubbard

