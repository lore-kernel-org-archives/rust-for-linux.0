Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A584218845;
	Wed, 25 Mar 2026 03:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774409234; cv=fail; b=bJHPty/xbvxsQkMAgRurolW/lH1idII2BdjZky8XhmgNK9L3r9LdLkiLa8vIwVEw+TUhHw34V75x0GYwEvsRCEOXJlyTaDsc0nDzrOImCM7cVXdkxgZp4yEtCFSOtQ2rFrDwsGp+ZyHOvYxE222AcSaB6AJ9WtxV4fuBpFBAr5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774409234; c=relaxed/simple;
	bh=czCyPZdsasfILeyo3pQw9M6b/2DB8HPTT76GYIHMUxU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VH05cCrLe1e/53OK9lLqz80DQJ8X1OZtc0+1LxZ8GbnUZdOFpLdz55hdwHX7G23jeS8JKyYAEkrCyfZUr7AZcK8+hYw44kJAAjS8TlRxCPTzf23JxOpDqGZKxTiX7emIfnjs1BGs8wmFUIlJHBNENemU6n6J3j+g0Bv7k8MPC9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RgLct1dD; arc=fail smtp.client-ip=52.101.46.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RgLct1dD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTFrvSNJv+fcHG/vl+Aa1FnFeMAq5QR059aRP/VjcgNKKXPYN3rgVkBpDayKIvs/nP0fI6AJKfyb5zJOwZdAuxgGFHcMi5K/jE0jvm+lErGGzxCKU0VfU5+J6cEyeNLRwk9K4tHAyV/exGwAw0pq+4qtUg0N30NJ78VQegKbFqgsS8wD7yiPAL63tSzjSm2ETTCG81VO5aINBLp9ut9PBnVBveWRz9nD/UUNOZ2+sBK2LChgE1kmUZuNi9B/P/ZscxARznRlTszO6J4YD+XwN7CHD+tBriTX6KF9cXZtVo+4zs+OnyWVUaV3LqWHM2YbEv6cDQOmPI8hUaMHqKxMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIenUiiMYkjftDH8vQJDHS3ffIW0aRm8tCdrBc5pHMo=;
 b=zHaV8SnrAfiGbHjnM+Lm/VzHwhPwiyyg3TQD9bY4JlCQNIBux65m34ggx7NDX9aUVWnntvqlUVxEaMcpTT1QEZ6QCqxDjGl14s/4Y5xRS9xrZE9RYhRG3T4pZrcVRFKBP5WykhGPTZKEF5AJgtrb2nfMnknHhh0Pb56/sVAGndsXGqqyg+2sszgkjvdC23Cr+mOK1rnqpJj8PtSXF0n0EjgIhYWoLTQQv1R9tQLFLPSutjQZHduyIPeSeMwWT+mDOE3dSAyWQJTDljZhbxsK+VRKj6TE3PinyVwZmwZm6I8CFfEUlTeC+EpQERK/UPquc3X9Yv7sQqAZWaSC69aFzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIenUiiMYkjftDH8vQJDHS3ffIW0aRm8tCdrBc5pHMo=;
 b=RgLct1dDqaWCoSiv3CJ3D30YLOc5vJe878Kf8qRn3fcGYhM/oRtkm6rV3EhB5fv2ugoMSzlZPXvlfPYCODopqSCokQAuYY8rA5APUckEraBb/cBw7wRNGbxvNcdz8dWWScAkxAJdGqZvsZed4LVmld6KEborGwhk/E0O4X6r+Z99G1v8KoeartwsffHzFSe4VLFXD4/SreZXzVBpgif0MPv01Q8niXZ4ALwzW4oVSvp2XzWZRI/nbmTopN/ISj5ziGh5LRekwMkXDjwqxNmzzlze4stqWJ+UV41E9tfjKE3IaXmQCASBtTfCkswZ8/atA/T5ZaPZIGumPO9pDrgI1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH1PPF7A6EE32B1.namprd12.prod.outlook.com (2603:10b6:61f:fc00::616) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 03:27:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:27:01 +0000
Message-ID: <ba8c18d3-0cb8-4116-8b2b-3d86f0668727@nvidia.com>
Date: Tue, 24 Mar 2026 20:26:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW boot
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
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-7-jhubbard@nvidia.com>
 <DHA6SWNZI9PT.5YBQUG4BB31@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHA6SWNZI9PT.5YBQUG4BB31@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0060.namprd02.prod.outlook.com
 (2603:10b6:a03:54::37) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH1PPF7A6EE32B1:EE_
X-MS-Office365-Filtering-Correlation-Id: 920854bd-2300-46af-6cf7-08de8a1e60c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info:
	KJx2hUpe1l1byMc08E2N0WgR846NAOYBVH/HlRrO0LMSeNmZrbYZHrB2QXNvblyxxEuT1JSvE1JOwoIlp4ACledWBojUDq6pBJPyK66MyIArsgr6KcJD1Ihu/dR4hn95m9/yy0aqO3Q2O/irqlH5ZcX5vfPw6cb0h79hOi41Gy3260331X8dbsG1pnGhla1KPJTJ1Ihb37ZKR+vNxgB8PMqkuzHu5SEwGKBHkFTDaEsfbpZNsPl+GS92KqNeOk8jwKnVHkrTeMxkqN8B6Jt017dNc8moRJ7kmddL7NCeG36OhAxkAqwfeu5h1c/D7faULgV3+TpEpzUvkzwRhCmgkU+R2M3YulTOPQU1sNlL+hwd87c5cx76mcNCPXMNAS8WcV9c3lisyWpyKtnVDKusEuGCI7Z+VOToJPai7eFfCb/L0LerN75vmfr72pFgDSjZpB64WZ2ezCoSb5Yd+yZsOiNUFWP4rw1o8x5IydVy8uW67uqlzPpRa1UR1OAQVbVqBaTANwPez6R6Wmp1kKJYDRXrvOoQtiBUh09oM0gz8G2v9TGJUwAS2RN6LyChr34xaVvHHKoKKTbyGeoBCBpHl3PMPV+WWUHYVi1Y0wXl9Y5HeOOcQ3XJCB0/kNSBWn5XDGZlx14Rfb1eYXpTY1m93ob7dyw0oe7AogTY4FUcRc74eHaqo033G7LW0mUInccbGOktQJdMDLuEzjJ1yKVgK8PnfCIjaA9Ho7IJ8ueEEjs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anJhOW5qUVJJYTU5aEZmVGhPRTIvRVdJUkFJdWtRM21rVGFOSkRzbUdLNm9G?=
 =?utf-8?B?MURJbDhyYXdHeUtBMVBTZTA3QmRLV01HTndON2VkaVVnSjR1L2VoMG5Cbzk4?=
 =?utf-8?B?T2FzTFgrWHZaY1ljOGw5M0oyVGZQY3BRUjh0M2xvSlhaOVdJVm1hUHV6K0RJ?=
 =?utf-8?B?bitsMlNLMSsxTGhPZjdLcU1uUTB5L28vd2RKZndTWGN4REVXaDUwRnBCYno2?=
 =?utf-8?B?cmJINDR2dzN0dGNQNHJCQ1BkMUZIZVBjOERoaWVvcFo3SGFpcU5wcjVsQnp4?=
 =?utf-8?B?NW51cXFQZUQ4bTBjb3RCVTFlaGhaakhwSGp3WkxpNUlRSzZJMFNaakc0U0tp?=
 =?utf-8?B?NmlPYTZQckRscDlsRjIxT2JjMG5CclA5Z0xnV1k1ZmdFeVBBMHFsNWdzSTJH?=
 =?utf-8?B?N2VMNkV3QndsQ29LemRabGk4ODU3b0FGRWpWekczNU84VEZiOUhKRHRCcmla?=
 =?utf-8?B?MEVKRHNUNExHT3psbnVLYyswRXZaM2lNRGFmY1dWcWRsbGRnUVQrYTNRSnJ2?=
 =?utf-8?B?US9yb1VGdSsvc2xsUDZ6UzNmbkduaDgvamhvTHZaVUVJOTZmVU1udVl3d2cy?=
 =?utf-8?B?a3h6YXlXSWhldDlSd2d3NmtlblFKVjhpT0N0M0svZEMzQU1GWnNmSGtTY3Bk?=
 =?utf-8?B?VTk3a0ZidkdJQURnM24zWXhjRjVqa01oamU3eUxsdjlQRUQ2ZnFsdkZaaGpx?=
 =?utf-8?B?RTA5SllxTXVwcStkTnZQS1lBanV1cytuU1JQQU5ydXVaenRMeVVkYVNMdHVJ?=
 =?utf-8?B?VHh4OXE5dXFrVVAwMUVQNXN6Y1lUUmpxVVdWWko4NjJrWmdscFl6VUhJdjJz?=
 =?utf-8?B?WHlzUU5PczdDQUJkQUJFekZsSndhYWlWZ3lIMmRTMllVcmVDZDRWUjVINnUz?=
 =?utf-8?B?UytSaDdVcmJFYVBwZVJnZStOc0FoWTJFLysxMWFtbytaV2MycS9QWGFjU0VI?=
 =?utf-8?B?WldGQ1VmV2VKRGdscDRTbkpBTGNDOTF3NzI2N250ZnFHSG1mRjhYaUkvQy9M?=
 =?utf-8?B?QnVtSnZsYjJyL1Fxa3FNNk1oMCtUVndOcGpSQnN6bG5UeGpHbWVvTkliSlR5?=
 =?utf-8?B?dmlWTGQvekxVdUZJZmUvcTZKR0djR0hKWDJIQndEL2l3YTMwbTVPakVLSzhF?=
 =?utf-8?B?MkpJdUFSa21zYUhncnFwdHZPeUw5TzQ2eXFsNUxSeXg5bTgweFp5VVUrL1Zy?=
 =?utf-8?B?a0hadUNPWG9Sb3pPbFB1RXZOYXBHcURsYXdPc2d1SzA3akVRMFdTeVMvRWN3?=
 =?utf-8?B?Wm5wOEZIa3JRTEwvUmZ5ejhYK0xRVk55SkM2Zzk5OXU2THBoYy9GanNDUWIr?=
 =?utf-8?B?TEN3dGJ4czdpL2FkTldGYnEvbnA1SDA2ZHBybG0wRGNSYWk2STYrR2h3ekVO?=
 =?utf-8?B?TnQ4d2RiUlNZRVFnSlZhajlRQmptVmNZV2pqL0lBWjRBeURXOHBpMEpzdnNv?=
 =?utf-8?B?d1UyaGF0dmpESVFYTmE1eHZHMWFUVk1tejBZR2V6VktBTXVnUzQ4WEcvbldh?=
 =?utf-8?B?bElOdjVpc0RJZytBU2pUQ1Jham5QM2t6d0hLalJLYUtidEJaeDI3RExXOUpF?=
 =?utf-8?B?a1QwTTM5THdzTmVWcU43RWg3bktuTGlzWldEbUI3TmNPYUx1RGxJS3VmZmFa?=
 =?utf-8?B?bk1VQzF6Tnl2YUpnQng4czh5a0RQNE1zTDlTMElmalE2eTJHbzBmakdSa3Yy?=
 =?utf-8?B?b2tIYU9EVUZ0eWJielQwLzFMZnJnWC9Tam80UDNDMnRLdWdTYktSdnNjTW9R?=
 =?utf-8?B?MXZzZFZrUHdkcDE0Nm5GTnA1SEpnR0NVZFNNcFF1bG5WdEwrRG83dHJUZDAr?=
 =?utf-8?B?VWZiczVtQTlUL0JnNkRaemhHSXFjc1AzNDVBampNMkk4amMwaEpWMDFpd3Z0?=
 =?utf-8?B?KytJeDdNM0FraTdtLzhsZ24xb1N1L3lVYWUyU052dzViUjZXS2I3TVZXZTFB?=
 =?utf-8?B?c0RWNXhsWGxmemYrZUlld2t4aWp5QURUdU9UZjNsdEt4ckU0alFNNTJEVXlx?=
 =?utf-8?B?L214dVJYdjJNZjZBZVE2ZW5oazU2YStpTVUydHRndnBhY1hmd1MyYXNVd013?=
 =?utf-8?B?dDRQU2RXRTFyazc5Zm9rQ0FFczFlblo0MEwyeDNvUHJmWHB0N2phMmZ3RFM3?=
 =?utf-8?B?SWliSWxOc2xWS2NxczRleFl3dGowK0lFWGFoMkJHRllncVkwQVRxMHBUSDNi?=
 =?utf-8?B?dXhHWE5vWE83MFkrYzF4MnppUnFrNWM3QUg5TWczejhqUSthZ0xNcGdybEcw?=
 =?utf-8?B?N3hlcytqaWJIOTZ4ajZsTmNLVUNLL0I1YmEzcm1PQlF6bVNOYWJtSjhTVWNW?=
 =?utf-8?B?Y1JtNFd0WFJiYmhCVjYwTW5TZ0l3YWpQdVd3ZzkxL2tyRUFDYmVxdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 920854bd-2300-46af-6cf7-08de8a1e60c3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:27:01.1866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvrbLRPdaY0bcrc0sR/rP3eCIX17Yk9mDbMzvDC3NVCeRuDpuqt+5iNVdUmwrljmUfNIXNztci1zIOQSC1is8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF7A6EE32B1

On 3/23/26 6:13 AM, Alexandre Courbot wrote:
> On Wed Mar 18, 2026 at 7:53 AM JST, John Hubbard wrote:
>> Hopper and Blackwell GPUs use FSP-based secure boot and do not require
>> waiting for GFW_BOOT completion. Skip this step for these architectures.
>>
>> Move the GFW_BOOT policy into a dedicated GPU HAL in gpu/hal.rs. This
>> keeps the decision out of gpu.rs while avoiding unrelated subsystems
>> such as fb. Pre-Hopper families still wait for GFW_BOOT completion,
>> while Hopper and later use the FSP Chain of Trust boot path instead.
>>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gpu.rs     | 14 ++++++---
>>  drivers/gpu/nova-core/gpu/hal.rs | 54 ++++++++++++++++++++++++++++++++
>>  2 files changed, 64 insertions(+), 4 deletions(-)
>>  create mode 100644 drivers/gpu/nova-core/gpu/hal.rs
>>
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 9e140463603b..93f861ba20f3 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -23,6 +23,8 @@
>>      regs,
>>  };
>>  
>> +mod hal;
>> +
>>  macro_rules! define_chipset {
>>      ({ $($variant:ident = $value:expr),* $(,)* }) =>
>>      {
>> @@ -309,13 +311,17 @@ pub(crate) fn new<'a>(
>>          spec: Spec,
>>      ) -> impl PinInit<Self, Error> + 'a {
>>          let chipset = spec.chipset();
>> +        let hal = hal::gpu_hal(chipset);
>>  
>>          try_pin_init!(Self {
>> -            // We must wait for GFW_BOOT completion before doing any significant setup
>> -            // on the GPU.
>>              _: {
>> -                gfw::wait_gfw_boot_completion(bar)
>> -                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
>> +                // GFW_BOOT is the "GPU firmware boot complete" signal for the
>> +                // legacy devinit/FWSEC path. Pre-Hopper GPUs must wait for it
>> +                // before most GPU initialization. Hopper and later boot via FSP.
>> +                if hal.needs_gfw_boot() {
>> +                    gfw::wait_gfw_boot_completion(bar)
>> +                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
>> +                }
> 
> Good that this is moved to a HAL method, but we can go one step further
> and perform the actual wait in the HAL. I.e., this should become
> `hal.wait_gfw_boot_completion` and the wait would happen in the HAL
> itself (where such low-level stuff belongs), not here.
> 
> We could even move the contents of the `gfw` module into the correct HAL
> since it won't be used anywhere, and simplify our top-level directory.

Yes. Done.

> 
>>              },
>>  
>>              sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
>> diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
>> new file mode 100644
>> index 000000000000..859c5e5fa21f
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/gpu/hal.rs
>> @@ -0,0 +1,54 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +use crate::gpu::{
>> +    Architecture,
>> +    Chipset, //
>> +};
>> +
>> +pub(crate) trait GpuHal {
>> +    /// Returns whether this hardware family still requires waiting for GFW_BOOT.
>> +    fn needs_gfw_boot(&self) -> bool;
>> +}
>> +
>> +struct Tu102;
>> +struct Ga100;
>> +struct Ga102;
>> +struct Fsp;
>> +
>> +impl GpuHal for Tu102 {
>> +    fn needs_gfw_boot(&self) -> bool {
>> +        true
>> +    }
>> +}
>> +
>> +impl GpuHal for Ga100 {
>> +    fn needs_gfw_boot(&self) -> bool {
>> +        true
>> +    }
>> +}
>> +
>> +impl GpuHal for Ga102 {
>> +    fn needs_gfw_boot(&self) -> bool {
>> +        true
>> +    }
>> +}
>> +
>> +impl GpuHal for Fsp {
>> +    fn needs_gfw_boot(&self) -> bool {
>> +        false
>> +    }
>> +}
> 
> 3 of the HALs do exactly the same thing. You only need two: `Tu102` and
> `Gh100`. `Fsp` is also not a valid name for a HAL, so far they have been
> named after the first chip that makes use of them.

Right.

> 
>> +
>> +const TU102: Tu102 = Tu102;
>> +const GA100: Ga100 = Ga100;
>> +const GA102: Ga102 = Ga102;
>> +const FSP: Fsp = Fsp;
>> +
>> +pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
>> +    match chipset.arch() {
>> +        Architecture::Turing => &TU102,
>> +        Architecture::Ampere if chipset == Chipset::GA100 => &GA100,
>> +        Architecture::Ampere | Architecture::Ada => &GA102,
> 
> This must be a copy/paste from somewhere because GA100 does not warrant
> any exception here.

Fixed.

thanks,
-- 
John Hubbard

