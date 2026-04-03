Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013011.outbound.protection.outlook.com [40.107.201.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831365477E;
	Fri,  3 Apr 2026 01:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775180221; cv=fail; b=dTuc5mL+tgFieNk5t/TCLFmujxlvsfNL5NuB0MLu84pN2MoHVyRScy1i8ikFDScATqVD2SbTB2PLelYWEUZV6+Ko2OBc7mfHQ27cKbm6oOOXAu7eH9QkB7g4fYUzJE0waM/QTYWcj1dZua/khvF1rAIusGVtCfegdDsdE+ziP30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775180221; c=relaxed/simple;
	bh=B+t4O4Umu0d7BhO7jmUL6mRnhVsTXDzJRVs3KNpFIZc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gekrwXUc11CM2PFDy5ChM7v5ccjFRXjQ8g8Gp8VI1E7Nn2q6YPCrt8a34PyH9Uur39G1Ud4BBsvNcbGhHC1yt7xCq7o291s1eZrCY/FF1ZpZUP2lUCOvOjtiHnUlniDzbrIYR+CbCrhIUcky5AqdW67M5YoAYr+hxLZIDB++ut4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rdvhasC2; arc=fail smtp.client-ip=40.107.201.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rdvhasC2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLIlmRSNFlaIzAioUDIBQDcKB2xrNNQ6tefEDAMi5HWBf0qpgLLdY9gqTb1HT9GlEWjkvdb3vOM82HABQ1d/RyQi66HeV02OSg3wiSnKWWNR+p8CsUjIjkFAboyN/BRdLErOeRQRLB7f3vbUAdqqqssniscXti9U4gORkWATKFY7u3gg9wj8jrgqSAjO27lNIDKbvecmbBYUa1NmqFO0m/dgwh+PkKsBVi/jHKNYX9FsbaHgDAGMIUeRxLYTIlMHSFotEb2Yh3JjBRZ/z1LONtwGimyNru9GBTvCnB10kSZ16LipRXGWTMBrv4ebLbgwOjvP53l4NpQK5feekzMJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RdFGqSuWvtsNV/AopYam5Az/9TnA3wIISWnJ0l1B6kI=;
 b=dOVRS/sGvklUrXTD9cZ05rV7yWOkENVYdrsN5JjYLmQ1uu4957Me+dcSJKIbQfV2PFre3MVx/PO7jlZZ0P9Tzy6RgNOEKEzRSVNSI9SaWhp3aWo2VAusiMi7KgifKfJ2IwwkeJF2HH0GtYSWoKdCxV1WuNAVE+5PXg5FsDDl/p1Gt3REZ5CL3/ONc4KDllcek43rhLNHWRuD0PwxN+rkgcXCpLEbNveUggSBeThTeMNr5XHeYMTp/d7bXIrFXUw7ozYWbNgUiUHx1LiBhRcf5lMGBGzKzBWx+Zxl5I5Hn0H1/YnVQ2JygZojquCzIb4wkPfgFvwcMGAOfXMXKyjqRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RdFGqSuWvtsNV/AopYam5Az/9TnA3wIISWnJ0l1B6kI=;
 b=rdvhasC20E99hunze+p5RuMxD9OWnxCqWc+SpNNkTrb0rsqWEBPnf8elsz5LbpTJwvKcuaIRY7ecPywztKP/7n4HtBsXz9EqM1qwA2xx++gZzQc47z3H7fGyKR3eWyL/7Foq3iEUBYJdqGlcRkgsKjbHYokC/ug2Um3muELiddFrNu5SbtXNxEbdR+rLzr9L2f4HtdRi/nxlllSilNqn0/lnqaUUPgyVQ/I/TgGgKTWA3cjpvfVCHAl0RrsqZ7b88VwvEr35/Syg9HkLJsK8zBtBw0Ep4OcjcZpYLo7PiKdUTTS159Y1lUPfIVztQ4VFhGqdwWg8mPBSE8sr+nzlyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Fri, 3 Apr 2026 01:36:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Fri, 3 Apr 2026
 01:36:55 +0000
Message-ID: <f2ba20ab-7c56-4e57-ae71-06b35a696a44@nvidia.com>
Date: Thu, 2 Apr 2026 18:36:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device
 address space constants
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, '@google.com,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260331224319.107082-1-jhubbard@nvidia.com>
 <20260331224319.107082-2-jhubbard@nvidia.com> <aczpifqz5CoOFB3N@google.com>
 <c42c7074-5f17-4f61-878d-414762461826@nvidia.com>
 <DHI4SCEVOQXG.1LN5Z1S7XYYLM@kernel.org>
 <DHIACQY3YL4M.3F7LSF1BZBUY6@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHIACQY3YL4M.3F7LSF1BZBUY6@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0198.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a1388c-1ab9-4a4c-fa68-08de91217d4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ctiuNqCI+oAtJzunVncA9JAUGobiFOSuxJtDS9IRGUrRnFkzC88b2YaCRRAu4vFq4WRMk+iVjUSfjwaTdUNSpKgaYgImsy2se37sTsyt8wAPX+m21nvCiefzjM4zEH5+M57nJLA/u0yYdBdFif/mcuymXaScTIr5xCt/FvzZIf4dXYeditVsZhr2VV2snG11hYdgkWjOa2m71uUTswaXUukbWagAtoda89hxEYfF5oRtvpEObQziN06c3BynxftYW4o2FKC5Wq7NxauYtNSWxDBOT8hFZzYgeM/6Hv7CTYCk0P5/EpVm3x3pmo8Ty+6pOAnZkriWTHVU6PkBfF/NeLpBYxUgdWxh5JYMqpiNLFwZ7RGdjiN3xbhNnKAEgRX730K25/gH5orY20cQZG1F8OFhECukqe0RrtkAf7fTnVlQLyHYMZnJoNZQ6RKSSMlZZVisD+LkM63w/IhIig5Cclbs0u+FFfJDtoLxl7IW9kt5GsEXi4K32/cBbnyqhTaV7ZyYCQokaOYl0mu7d8xmkav0+p8fzSg6SOpA2GhyEOY7/N4kARKZh59NTFZ2EZEu2IM/9E7aeydqrYemqxXfQD8LR4rQQb2x1JYDBgG5HWQXYaeSf4tJlTrrxkujhxKpUyEzm1K6PKmAblNvZ++1wdPsubCcCDGMI2qH2jduwrgKcUu/TtPwSAfsY1jkE5LH3agLgs/gJkKh4IcackEUaUernL0Jdv3HjTI8DtZLNtU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVVoczJ3Y1BoUDh5ejJSY2xrUjVNVmsxYisraHNVbFA1cjJ6V2I5dWdGOGxN?=
 =?utf-8?B?RGUrZVM5a2dZRzc3S0hkRWx5MW9RVVNsTzNsVitoTUV2UzhCQVVPbzVWU1Nu?=
 =?utf-8?B?V1NpcE9SL1NKTUdhQ2FoZGowMFZPQU1VdFU0dk96YVdtNDFqYnRNUllLT1Rs?=
 =?utf-8?B?aERPeVZGTnEyS1VrcHp0UnJBNmV3NUpsS242bW5LWnR3dWJoa1JoY0k3TUc5?=
 =?utf-8?B?SWhFc3FPOTBSWVptMmN2UHpNWllwMm9STWpjd09pSVRPcWpkM3E4WjJoQWgy?=
 =?utf-8?B?ZEFsLzE4UDVuazhuRDFUMmJkaEN6bWU2bWtNc21lR0VjaE9PbVZyTnJNbUdX?=
 =?utf-8?B?bmk4VWhhR29Qc1VoNDRUMlZxWnJSbTRUeGx3bFhoYnNOVmF1WGczNVBoRHh3?=
 =?utf-8?B?MEI1NWhUMC9sZ0NOL0xObVZJQ0NkN0VFWHc5V0E4MkpLZXRaQ3RYenlrWXU3?=
 =?utf-8?B?MGp1MSt4TTNiK3dOdnZMV2w3WUF0anRLU2dZT2JwWGtWQ0VkZ1A5cDNWckRH?=
 =?utf-8?B?cVFReGxrQllLbzREc3hVNVM3REUwVnF3TXAwbnZxTENITVNOS0xjbml0d0Ji?=
 =?utf-8?B?Qm14NzJhQ1YwOUFka1NFZ2FWUElJTFF6aVBHRktieGpwcUJsOEs1Z3AxUlhw?=
 =?utf-8?B?QXZGenhiYllKTDBRVndZNDRYSlFsalVKSGJ2N2trSXZxQThxUVBOYzU5dU83?=
 =?utf-8?B?MDNLYjM1Y1p4c0l6T3BacFZXbnhzUEFyK1BXMlJ6RTZGSzlmYmRsLy9idWFE?=
 =?utf-8?B?ZXpUZDE2eStoTmE3Z1NFK0Y4ako1TmJ2S3V5L2Jlc3dUaWFqTWF5djgxNEhM?=
 =?utf-8?B?OUdDTHM1L0E0WU5hU1ZsMWFvRHUyNXBHdkJTNFVWdTBOVVBvcjByVjRjdC9W?=
 =?utf-8?B?Y2U1QTBjTnpWb3VNWmdyNDBiWTFCM2wzbkMwOTBObWdIVHQwSVp2dVpDdlpy?=
 =?utf-8?B?YitGNW8wUUx2cEh2NlcydS9oVG1aRGdKT0RuVk1UOGtSNHRVUENkQ1VlMnE4?=
 =?utf-8?B?bVJKZjZlc1lKTVJjU2VDWmc5SjViVzVKMHBNNmxRSkhCdUV0c2dNbUdmNjVS?=
 =?utf-8?B?VXNSOUYrR05wV2dmaERCdFBWU3p1TnlDMGlPcUJTM3BCSzNYQUR2dG9BNXZT?=
 =?utf-8?B?SXZ6c1lXTGVJaWQxSGtUeHA4Rm85WDdMdlovK1VZWitRSUtEYkNXTDhZa0pm?=
 =?utf-8?B?ZHB1cFNFdFEwZ1ZVQnpHQVNDUS9pN3F2dnJaZjlIOUdMSGdQSk1sNjRJcU44?=
 =?utf-8?B?TDRGdExid2htYXM2aWtwSWg3R29SVU96S05HYmwyVHhOOFZ3UFp5RTBZYkMv?=
 =?utf-8?B?ak52MEt0aCs1TnpGdVVzSUhNNmlDMURsQURKdkhxTDRIWTJlc2Z5dXJ0dkgw?=
 =?utf-8?B?THNmVDgyOS92UkFhNHl1UHo5UjVlNkM5dmd5dDhhMTFKeUVCU2V3QkZwdmkx?=
 =?utf-8?B?VUpKUnhCK1FhODQvZHQ4dUZsOHFoN3NlVFBPOHhnaUw1UFlobFByd25NUXJP?=
 =?utf-8?B?S2thTVU0YU5VNC9vWUR1OFlWdjVJMVlRRWpsb0RTcE5OWFV2d1JNS0tUTHhN?=
 =?utf-8?B?MlFzZGs2OFBNdU83R3ozNENyZ0VQZXlXRXd0VzNndFl4K2s5Z2ZmdXJMQ2hJ?=
 =?utf-8?B?TGUxdXV5Qml2d25mOVNTNTJXV2Z1cjh4NUV5TTJ5MDF0N25kZTlkaEpkV3Ay?=
 =?utf-8?B?TWRaODNJUlIyVm1UTkozZWE0MHBoalIxd2dWVENMbThyNDhYK2lvdm5nRVVK?=
 =?utf-8?B?MENieGZRcXF4RXBwT1NhY25TankvMXZxRjZ6QnlIY2lTRmFtK1BhV3RGMkEy?=
 =?utf-8?B?UGJTN2JlajVBV0NLWkxBQzFrT1B1YjZKYmJ4dkpDZFJLbG5udE54VE4vbEZh?=
 =?utf-8?B?eXozYzdLRCtEcjJSdGtxU3UrY2E3d1p6cWJEME9kUDlYazNzTmtCSldxL0Fo?=
 =?utf-8?B?Y0JXZlZQUzJ5cWdlS3lLaVJZS01LVFRzUVQ3ZUZaS0djREdjUWVTanh5Q1JE?=
 =?utf-8?B?M0FOT0dYK0F3Ymw0WWRHanhPNWRCeEJpODZodTZ6ZE9NU3N6a0lzWTBJVytl?=
 =?utf-8?B?akFpb2FMNDhRd2U5cFA5d0c4SElja1ZrOUpIZ08rSVNLNTB6Uk9GNWFGY0VX?=
 =?utf-8?B?YVlyZ2hidEl2dlV2YytIdEdnRUp5UzNFQ25zV1d0K2F0SEtJdFExUGFwLyty?=
 =?utf-8?B?SVNTWTNoak90UWNJV000Y2lPdEpSeHVsUW5QbjQ0UUR1c1RMU0EwdHpkRWs5?=
 =?utf-8?B?WlVVdkdnMm9oemRHMGp2c3NvRE02N1F0TDVoci90SCtLemQxb09PUkptQUEz?=
 =?utf-8?B?Nk9JUUZnUUc5N242d0JkY1JJWUJ2ZHM0eEdVM0dvVTJESHlyN2UyQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a1388c-1ab9-4a4c-fa68-08de91217d4f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 01:36:55.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMQHTdgRnwj5Il6RLCDgnhp6OzoyZLUbUKtHmJkHNJDiwsro6XLdgcSVbr/D+t4kTJbsmaadI8g10FZN1HGw5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277

On 4/1/26 6:42 PM, Alexandre Courbot wrote:
> On Thu Apr 2, 2026 at 6:20 AM JST, Danilo Krummrich wrote:
>> On Wed Apr 1, 2026 at 10:22 PM CEST, John Hubbard wrote:
>>> On 4/1/26 2:46 AM, Alice Ryhl wrote:
...
>> The reason is that when I proposed this I was thinking of it as a marker trait
>> for "complex" types around u32, u64, etc. that we can use in DRM APIs (or any
>> other device centric API) though generics.
>>
>> For instance, instead of GpuVm<T>::vm_start() -> u64, it could be
>> GpuVm<T, V: DeviceSize>::vm_start() -> V.
> 
> With the proposed naming this becomes `GpuVm<T, V: SizeConstants>`. Why
> not just name it `Size`? Sure it's a very common word, but we have the
> module to scope the name properly.

I was waiting to see if anyone else weighed in.

SizeConstants accurately describes what this trait provides. Size is
too general. Again, I think it's best to name things for what they
are or what they provide. And then, if they look odd in some use case,
that's a hint to consider if that use case is precisely the best way
to compose what you want to do.

Anyway, I'm pretty sold on SizeConstants, so I'm hoping to stay with
that, are you OK with it?

thanks,
-- 
John Hubbard

