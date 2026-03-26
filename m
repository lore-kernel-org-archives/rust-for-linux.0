Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010041.outbound.protection.outlook.com [52.101.56.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535F130EF7D;
	Thu, 26 Mar 2026 01:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488178; cv=fail; b=dWfKcbQRGPD4g+W13NMu4H92i6Fv294dazLM5uRyKsWRNEfpiELvNeviNLHYzXSP8HwXxXSf1hEUGG37EO6hA3GkaZMc3XPInElLKEa6wm1Y4TOJuSRZhgLUAyw+gMme9wNM9XxyO5GSCcJHDEAIVMHo8tXi9LY4EUPs8mk3JNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488178; c=relaxed/simple;
	bh=aW9RqL6QmNNP+VouopPRaH7nekAdAdNnNCC+8YP0Adk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D7rtyn8V4c7JgxJDidZUMbkPM+lHAwKzNlI2G2Bz+fQGav7NPN7MPtYKpyx6nUkNnFrntK/4TfCwg+mo+Pm28Sou4OSmo9nNGUEDpePOZbs77nIdQJGPeAqyQXPbf6NVlGLAupwp1sfqre7fxTAPc7GNsNA6a4dVfW02kPJTsTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MD136t6X; arc=fail smtp.client-ip=52.101.56.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MD136t6X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+5fwUxCxDuEJw2Xvj7csh56xQqqVuYsSZlDDy76TMZqUZek3oj99vYJvaTgA5CPqqbi09sL8QX4XSehSu4PUj7fLUNRl/uhApuQ1bzERfBq9Fv/+c3xXJM0lY0dhoYk65hOisN1lCeF4mOCTNkyK1W+V9CC6cyv80mUmLL6+LyIMF7gYsLk+VhevahoaW9TsInoyOnikvGVT1eqGwXMPFURyj8SVvrRf1j8f+4quUUQdP8VoRjOoiK8MtexlH7YE4jmonIsG7jdjEbIK7XnLKqZAftX9nTS/+Eap3gf9YNQZxuFbB27b+39uMimUTWpr8OjLarV1PKzmyh3Hc6NZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vG+842zYF79AeuT386sRSkuWx/vh8+N79aXS7eib9A=;
 b=P+IFcOOMjl+CwySj9+UVXneStQF9KDc68Pl7clbYLFVAmx9flZp0wvIOOQNY2p9cBM6KeV9dzFw49VKoLnIvc/t7vIF8LEM9QFT0HgDqJWehctHlpEWlvG1G91lllaw84i3c5LwJ3Cqc9QgToXAShmAWFs9BB/hMvdPiurGavJBr1k78/IY7tdtyDKa20tD47mKXjXx8v6KjMBv8guWNQEqZcC7MV5dfXZRa2I/hEPV8fUR1cqi9qx/oR1bL5HWqs55fLfOMYD4/61fdLlINumqr4vOF4fF85mes9pZPD/b3h/sIPVr56gqSt6duKALQFJa6ehA9HcKZxMDbgM7Ddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vG+842zYF79AeuT386sRSkuWx/vh8+N79aXS7eib9A=;
 b=MD136t6XGrBuY20+Xvx7LDG3tTSDpKT3Hv6OjYLRFYKzfbVrCon1aaNRfLcxgKBrT62//0/6qezN9N+Qtgjm0RnHNmcICPtK4hAEPmTgjiZo9eEXvorLNMlXcM/VoECUb7rECeFw/irw0WHV53wA+wBzndAcTEnSY55EPhck2rZHCQdxJK1514SFtRKgkrDCvcrAfeMxXVp7akjJ3enDJ1yS6kICiGAM2OGpUg7iOueMQoaNbgnaA3iECgPFxcnfC4gsI1iIWE/9PIwdElUVHo6WVgc14FfegWR97hE7RWSAiSqFZrvR7NGHSQoOpVwVOBLYzoNRvdZcS1u5/STaOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8354.namprd12.prod.outlook.com (2603:10b6:610:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 01:22:47 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:22:47 +0000
Message-ID: <eccfcd8b-a53b-4335-b234-ca092735c7af@nvidia.com>
Date: Wed, 25 Mar 2026 18:22:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW boot
 waiting
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
 <20260325035242.368661-7-jhubbard@nvidia.com>
 <177443602197.105362.14648260973264175300.b4-review@b4>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <177443602197.105362.14648260973264175300.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0034.namprd08.prod.outlook.com
 (2603:10b6:a03:100::47) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: b8102da7-2ca0-4087-933d-08de8ad63068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	t5Tvv2xD+q8alUjlxLkrWYYh1fF8FKaCuIDIPxXghj20Nj7Kh63O1nS/akygzMds0bBLeecl27lqNdi6DFzihsK+3+NwdOvwujBXwEU198VDL3hjwAFhvRVW1GdkLE0c7/ArbIablfo1wod0SG72t36Pp4zPApuKr4U6KCNhLnStfZqR+K/G4rXMVWhvi/p7cZ0EHI6lTmOE0VlpyxsxYf91Wr25iM0L9ymehPhXm/hPvMwy8J0gI0tnv0Fz/OcfRVoOoq5WbSXQwuNb1tny6xpgxbbccp45wgWY9Aki4BAb07sOsOFUJREdFfn0Cmud/PRzSfctvKy1QhQMP/noUKPk/Qjq0d0eemxtqWjoUE3MZzhB5bNMTMfhgmZ+4HhRmF5ZaKMyzAosUts2f1x29ww1AE1KOr9eotslZAt/RcMnd/dfXIn2snDvQNwEZK35rQC6XHf/Abckav8oEIEWQRMB7pACZNYY0Lf3VfsLD7wkqVaVDSOoEmjloLAdrEGHO0ZzBaWaNH6CU3UlzlpqonE4aZdSyY3SsXRmj5GgZkxujOouyw45dxOVnF9jiVXKLeYQyIe/3Vtd3Mh34tJOGRuceiXjkwyS5ci+Nl7TMttcgKxgj6Gmp2ytxFcSdNb/32ek+CvW59IXCgZZKgTxV0qLhzIYcGXA8Cqvvhb9ze9wpr3p5WZkZW1E4YksZhnP0sAISUFz+SEkvGtPvxtDOJfbHlUrprISNmcH7I5EmKE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2Vja0NERmVOZitFSUR5SmVZNWw2ME50V0wrQXB1YUVMd25SNGpaUXF1ZGRr?=
 =?utf-8?B?czVtRU4wQ1F0aHJQRm5RQklNbXNYZitRMDlOTTZwb1lzRUJNdDVmMlRxWEJv?=
 =?utf-8?B?eE9FVUdrRmRnMjRaTS80MUxlV1ZiaVdLR01YelNZVVUxZVhwQzVkMDFpcnZn?=
 =?utf-8?B?bTdvZ0NjRTFjQ0lYZ2IzbHJFd0dKTHlQL1FEU1BDOHBkcVpNMHdzWW51b2JW?=
 =?utf-8?B?ZXUzSTJMSk43RlVSR2lmS0h2TmtxQW1xTnVxVklWS3BRSzdwcjZCMTJJMzVx?=
 =?utf-8?B?MWFmNUc3Znp4b0RqVHVNZExYcTl2aXZXYkF6aTU3Zi9uekwwZzhWQlB2YUVy?=
 =?utf-8?B?ak9USGh5R3MrNVlhVlozVVJxK3FaY1NJb1NSYjd0YXV2aGw1c2xRNFVQWDA5?=
 =?utf-8?B?WmUybFdBMnhobzdoL3V4M1QrdzI5bVVOMmprS3lPdzZFazRkNnVCRjRNVUpx?=
 =?utf-8?B?dWcxaWhQRXFzcUt1ajZ6cDA5b1NsRDhhMnZrbkpYUzlqdDk0U014aEdFejRT?=
 =?utf-8?B?Y3luYWJRZmY4VUdFR1hEQVhqcWwwVVNKUHZXME5sWUtLQ2pJZ0g3Q1FjUERF?=
 =?utf-8?B?SHJnOG9NcndSQ1lmd0cvN0tmY3c3MkwreHRlSThralI3eG8wZXZra0hjSm9R?=
 =?utf-8?B?UlBGOG14aUl0Wnd1RnR4OEZKSVZSRno1ZVNDemJUaThHZElDQk5LWGxlcGZn?=
 =?utf-8?B?bFhzbWgwRE1Wcy9Xb2RPeHR3Y08wcWJWQk1uL1poLzB6bW1RVDdRUzlvRjBx?=
 =?utf-8?B?aUl2dC8zZjBiNVlZK2tsaXJPdW1EOXYxVVpDRDg0NlFIdTlyTFpZeExSb2tU?=
 =?utf-8?B?UjgwTUsrVVBYMlQ1TWphK3F4bEN0QUkrbnViTm1DNzJlenByb3dyMVdKUGdh?=
 =?utf-8?B?eGdmQkZKT3ovSnNjMStNdnJTbFptMlV3TGlKalRWaWR1MUM1ZmM1U0lvZWNV?=
 =?utf-8?B?N0wydzhPNnpWeHVZL2lFZGo0T1N6bnhCb0RSZWNZSHdKMUo1Qk5WTG9vM21z?=
 =?utf-8?B?YU5BMVQvcUdwYk5DZWNZSFY5eDh0c2VldVpPM0lndHIxNnJPQ1BqbjVKTVZj?=
 =?utf-8?B?ekZMOSsrek1WNnU1czFoRzc0ZW5aTURaSXplVTV3N0svVHpmNTdrb1llNEpy?=
 =?utf-8?B?ak1QTG4xUEJGazBBWXRLVXkzVFR4ckl1ZENpZ0pENWF4aWZQTDJCUzB2RWpv?=
 =?utf-8?B?c1hZMk9zWDd3WFRhdE5qdWl3VDR0Nk9OS3lsNitzSGFQR0dsNU9tMXpkTHQv?=
 =?utf-8?B?RzYzNDR3dWx5TlNJeU9rTHJQQVZOZzNDRXJDMGZUNWpXUFRlejVpMnpRYjM2?=
 =?utf-8?B?VHpFZDA3ZUw4a2hzRmRaUHhtOUxRVzI3Y0pkWXJOM3VuYWpLOG55ZHR0cHlQ?=
 =?utf-8?B?NTJCM0tjd1oza3h6L3RheEppeENIeEh2Tk1temxxZ1cvdFNEK1kveXVkd0tx?=
 =?utf-8?B?UjFwNzc2by9QQ1VIRmV2aCtKQktLcTd0RmJMK2g0a3EzeWZxcFpkdkx6c1Nu?=
 =?utf-8?B?QWRYejZaKzA2dzFYNjY0c2h6YUprcE1HeWxjU3ZUOWd0b2MxcEtCWUtiSE45?=
 =?utf-8?B?blNRV28vTmtHOEdrZVh5VmMyRHhDVHN4d2hzWEtRR290aE9oY1NuU0ZIUyto?=
 =?utf-8?B?SXZkUFZyYUJIOWFjQUxWZFg2dGR6Y3JTd3A4OU14UytaQ1VLOWJYL2E3Ullm?=
 =?utf-8?B?eGNMMXlZVHFjWUdVK3FINmR2amkxWkNvWTJUTEpIYmQ5ZzdYOEU1ZGI2MkZS?=
 =?utf-8?B?Q2V2aXYyQ1FaaFBXcEQ0eXN5MmhxZitCdDVwREIwV1BGbmxCM01jand3SENn?=
 =?utf-8?B?cEF2R2NISVVEc2tVQlQ1MjdLRUZmREhZZi82ZUVMOEZkczczVzRyVWFhOFFO?=
 =?utf-8?B?c2J0NzNLNEc0Qm5rc0lub09hV09XV0ZiOHp1d3dLZ2NEUVNkL0lUQk43VXVK?=
 =?utf-8?B?QnYxZ21YNnhZaTB5dVkrb1hjcnA0cjI5dUYyTy85R1dRQ1Z2Tm4vNFVnUXZx?=
 =?utf-8?B?OUpRSS9DcG1YanRhZVVVQjFyK1BuaXBkeHByOWRRam9zNHNFZzR4OTlvMWJr?=
 =?utf-8?B?NmUxaTQxZ05RQWZxa2t2YXNTa2JNWGE0MTR6Zk5kNmhKWTdnZjFrNnRiQzlk?=
 =?utf-8?B?N2lIWWRER3RKZFFVZnB5c2h6MjFhaUJlUlVHOThUWExmZkJCdWNJbCtVSDVB?=
 =?utf-8?B?NCtrREhrenpERFpkWnFweGVocHozdXQraWN6M1FWNk85M3JpditxNTFwY1FU?=
 =?utf-8?B?RkI5cUVqMmRXNDlmajViRGxCck93bUpndUZFaXE2eFM2ZFExTWNmbmptSjJ6?=
 =?utf-8?B?cEVxMXZFMkg3VXQxTGtMdGk4OWhScm5icHlZN2NldVRTNDZSK0x2dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8102da7-2ca0-4087-933d-08de8ad63068
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:22:47.4558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zTjVolVeMDMxgWEJRekVJPUwhGgh9jItBmoAa8bHdoq55exrhscmn7A6Pt+gOMvHgmWRFP5QL6EgE4t3eBqxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8354

On 3/25/26 3:53 AM, Alexandre Courbot wrote:
> On Tue, 24 Mar 2026 20:52:17 -0700, John Hubbard <jhubbard@nvidia.com> wrote:
>> diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
>> new file mode 100644
>> index 000000000000..2f9e18e67a35
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/gpu/hal.rs
>> @@ -0,0 +1,42 @@
>> [ ... skip 18 lines ... ]
>> +struct Tu102;
>> +struct Gh100;
>> +
>> +impl GpuHal for Tu102 {
>> +    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
>> +        gfw::wait_gfw_boot_completion(bar)
> 
> My suggestion was to move the body of `gfw::wait_gfw_boot_completion`
> here and remove the `gfw` module entirely. But let's do that as a
> follow-up.
> 

Ack.

thanks,
-- 
John Hubbard

