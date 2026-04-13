Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631BC233704;
	Mon, 13 Apr 2026 21:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776115793; cv=fail; b=LVazc9ly0SokAYz/5VCb9H0mVYNHxsZN5H+anef5LOFKZOgJKAxlHIAd4lZP9xJ+5uCVhQS5jEZBPkPoHFVN2FPOLh9sTODBY4ff/FO52EFC/gRIM1MYqeGT7YMTcXQgOppcHuzPOlZf+y8IHeI68OfIr1NZcCFiyfNt0lL/3aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776115793; c=relaxed/simple;
	bh=OQmOSub9FMqV2fizMN7x+szn7F/mh4f7EiqWCw9AoTY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aa0+4KY9QetiQ5srQa7JgMl0jDyLIrhomv6tTBZdJJ6Wimilvu64/K78SjMu8I7HS2nqWco+2JUvOAZSz2GvwyVyNtIz8gkT/HIjemQKWaH18dXXHYLkXjW4En9dR7e0TuEaf2ah3RW3aKT2dtM7ncHAQx/+0t1nKKoxsloC0s4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Pf/qDonO; arc=fail smtp.client-ip=52.101.201.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Pf/qDonO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MA4Pgzd+TS04oPlYNa/7MSt53Gy1m6H2I1QXnVdP+PrvexzBz63uwmFZHt9wwvRyQQdNa86ONjAeSVYCXQ8aUeP49/OHwyAjQVewVz9YkokTjlULFY6X0bPE3IHXZxwVRjbHbYdZ9MJHC0DsB4XesxEyn/X7GwkSuEyzVQ7qzVBxlzMEWZEB6u6yCRqYfi4E/FBJ4McXoIm56e2nAiSMzQPhAyluDTtO/15bRAJDYU0ERmdA8E49nX/s1W0pDsJOyBooLpKzx8EYmhgjwua+chALmJOpNsX7My6jhO5IaZULglb714HMfRyCArEX0FJsfugKSZzLSM0b3B1kGGHVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5MGh9RKtqfPXOt8/KfvF8s+I3Xi/KfDHQwSmIiqJQc=;
 b=ZMtKgsaUkd0fRyaHu0Xeyp/vlF1dyS8dEW34+4Cauw+NjNrZCnXp1ZQXXPyvx1aC3am6QIaiJczvaUf3yZ2tMRhbzLY/7fP3ZS4B9cLl1szF4z/WM9keiIhUxVr/COyu3AMxdxi39W4BG86vJcjmYy6/uftH++5aou4LLmFGW0rEipX1dl1AuUrYQBoYHCZXOD3ixxGfP4bH1AETqEibKmIwf4hz2ujPhL8fFRnEgN9GIS0nFsp8H3ibaGj7IzYh/+x3xqxuZli0NIN66FIZlkR0BAdH6MQeJoHRABOREwCKX7orIXoSxsezEglapsKPDXYs8gZZwMdddQ73N76jrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5MGh9RKtqfPXOt8/KfvF8s+I3Xi/KfDHQwSmIiqJQc=;
 b=Pf/qDonO8T/Z0zUUu9w0m5BcIUEzHTXUPxEve29gVNsKks5Z5rheWQL979K2soEX+d+IkD/LZOo4NsYAy5GQDCJTUos0cEQx8b8mEI/Osva/wa8gYPgvJStnNQj0JU3HFBgauPwegTM46HWcWIlswsbCYPSA8vHkPLVKzzGStKQULp6JW5hkXQif9w8jpd9ede+cm4p1Cc17NzpuDyvPa9ct04FUz2obGnXaMEiUEaGBMIiW1aW6vyRi2FebWepTTzun7DiQaFzXxNN71DJisv9KKnOJeKsyrpok3vZn8klUf9xGZDYQ6yDVyKfB6k5ZNx58xq/EhgcTUvcB8j3TlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by PH7PR12MB6635.namprd12.prod.outlook.com (2603:10b6:510:210::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 21:29:48 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 21:29:47 +0000
Message-ID: <8fb6c933-0cad-40b7-be0f-5aea648f56f7@nvidia.com>
Date: Mon, 13 Apr 2026 14:29:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/28] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 Shashank Sharma <shashanks@nvidia.com>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "lossin@kernel.org" <lossin@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
 <20260411024953.473149-4-jhubbard@nvidia.com>
 <2a4c06e1616ec84e29166d881ec3240a1fd441d6.camel@nvidia.com>
 <cb2bf998-55cf-466b-a6ba-1851278bbf43@nvidia.com>
 <8e47b4697c213ce11dbdae8a1a3fcb591c69b34b.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <8e47b4697c213ce11dbdae8a1a3fcb591c69b34b.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::33) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|PH7PR12MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e9728af-ff70-49f6-a3dc-08de99a3c9b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4pkq24MZrNrACeMYKAvl+BosyNxs5kj2qarw9f/DpGa5qq8OM0tHZADLsR6ECCDh7fle5531xQb1SPD67HbcfIha2nER6s9OgrsTecUnQO6MR8tMXcvwshLz+6nCYzsvF1g5fNyK3AdyydHaBmvH21W3YZo0HuhS4YC0fZh4vsSFLTKLXmkBi9zefsXwP4y8Pt2u6kGUJO2GgP43m4Puu/SkxtMLk5PwMEclV4j7sj6Mi1zbpP/nFA/bvf9QfMmj1BcumnbYZHA1IT9/pudyXaWpulS51aUqzxUmRb/q3hRXJvnAPB3WPvKy6//8JuD8OIAFLxRh+VxOgX7MUERATzr/5Q+rLzcFHTW0/9H2LhlUiHPEfSJsUWFYqYw9WmTT3i0E+xxBITZJXuf9r/ryl7Wj7CfrG4xfm14YJr6qKWGRs2iRHekBfzy+JYJr616ZCKg3qr57TDRIu/ucC+GWvQSnutsw+u8VnJYbQeBbOd3YEv/rXeacUGvAHlw6HJrsu59bPLd+/yV1kW/iSrImqyFwuI1AjdebRTwBbbJklg8knE25dLpAN6+PoEnEVSRcPlW1ML72AhhSipENxQr0rD9MBQ04vNUe1SqnAU2gLuDvyxE+W91iihRJLqdExOXxmBIENS8+uMiXMi0bRePikvSfOOzXTws5mAyNJJXwBGUh00zZwtWPyqwReA36TpeCoygmHxMykRuMNuSblNGa67SdDvMlwVciMErQfLhs1MM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWhKNEk1RkhFUUxHblY1MHFGRnZNMVg1NnBHVnIwUERld2t5ZUo5Z3AzaGZt?=
 =?utf-8?B?djdvSXFxRCtabFkwbGVydFgxdC9aajRIUkc4T29tdHd4RSsrRXVyanF4ME10?=
 =?utf-8?B?ZExRNXNCZVJGeENWbGtDejV2ZVdVYVZEM3NZcFVEWGl6czBSOTAvUG5UTWFx?=
 =?utf-8?B?Z3lBS0k5Q250NnN1R25CR096bjc1NDV6OUl3SXJacG1hMGxOLzl4WDh0anBk?=
 =?utf-8?B?T0ttdFp3eUxvUUd2V05ibGVJVFhpbStPYjhwMXlwVUlYUm8xdkpTcnA1Uy9p?=
 =?utf-8?B?a2xES2F6VWxZN0FkVDV0UXUwYVU2YTVxdzBMc1Y5dStQaW1hQWtlRTBNdEJB?=
 =?utf-8?B?MC9DM3pRL05HVGdTRDhYZ0ZYU1V6NStmRW8zQWZqc1lsQkJPL1NhbkFQb1Zz?=
 =?utf-8?B?V282di9ha01uNkd1ajlCMmFwRkdRNVArOE5TeGJiaTZEOVh6SmYwK2ZkZ3RS?=
 =?utf-8?B?WTI2aFVMVUlLbEpPVm9KOGpBTmUzVVB4L0ZnY1RsbU80VkJFVXJ4a3MrUW45?=
 =?utf-8?B?NGdKUlRHblRPTWNqaFNOUXFINzl4QUpKd0FrOEVab3dPSEpsNHNmZXZVVmNC?=
 =?utf-8?B?MEtpRkNBMFJmZmx4Z2ZqYkJzZ3VBS1hweGZTTUVMakpRQW9aZ1d3UDlvNTFX?=
 =?utf-8?B?NlUvcWJBc0xBVEFoRENseG4vdklnT3VjWkVkNjFxcFE0NDJQSzhmTHJuSkJn?=
 =?utf-8?B?WHY4OS9mSGZvZHVISGx1bnR0R3BPNnpDNzlqYU84OWhldHU1YTBiVUtuL1pB?=
 =?utf-8?B?RkRFa2tkcnZkZ2JQYzEzeXdOQ3lJUVNRSzR4MVRZbFh6MkxuOEw4NUcxaTNq?=
 =?utf-8?B?aXhPR0c1UDBINTFBTVZ4QzFnZFVaR2lwaFNnZk9Lbnh3L1F2eUJFd2J1TUhR?=
 =?utf-8?B?VURVZ1F0VzBkekFkOUlUcnVwN2RUem1ERFVhQlRBa1Z3TWlBa1BUN21wU2Jt?=
 =?utf-8?B?OEVpSE10Wk5oVzdwWGsyOWdnL1hHeGc4MXh6RTRVa2VyMlRPamhuRS9DZkw1?=
 =?utf-8?B?c1d3OHZaL2x6Z1UrY3NVTE9YZ0hibWlQYWhUUFphTlFaVTdGTFdEbVh6T3BW?=
 =?utf-8?B?RlBBTnhZcGRYNVBOSE1QK2JvNnV1NWN4NUFlMkNUbnFNZ2xIYVpCNkg2Z1Js?=
 =?utf-8?B?dlQrUyt5NFFXRDM5bkVzdmo1dlN2aHlKVXY4ajV2UHIydDJlTHpnTTlxczJw?=
 =?utf-8?B?V0hiQ3h4YjFhMG9jT3E5T1lmTkFwdm9VT1RJL2ViZmxucmR6dFFic245M25K?=
 =?utf-8?B?M00zdy9PYUtFZ2pNK3c4UCtuN0tJWFEyWk12bmxURE5XQU1CYndlNC9pbHNW?=
 =?utf-8?B?VTNLSUZsNEx3Q2xhOHcrNkNycFV4ZE9sZW5DZXBuUlQ2ZTZSWDFobkUrNzFP?=
 =?utf-8?B?djhROWtKc0RRWUM2TFIyclNsNHJwRDFPTFF1UXVkSEF6UVpVNGpwOCswRGhx?=
 =?utf-8?B?V2Qwc0JLUWNmY1R4R0pQaDhRSVd2ZU83Rm9QQzJUWHl2U1h1M3ZQdEFjWGNI?=
 =?utf-8?B?WjlyTCs4clJLbm5CaytNdlNOYjU3REc1dTZlOUQvMDNrVk50aHBMK3Jid3I3?=
 =?utf-8?B?NmcrcjVFVXY4LzBRaWJraDdINW9yVGxsTTNYN0hiclpZKytBaW9ZYTVTd3FJ?=
 =?utf-8?B?bzM3WTNFMVNtNEZ2VTJZRGJEMWxheEl1ZGF2V3ZpVHJOYzNMU01wRnJBQ2FH?=
 =?utf-8?B?eGtKQktBc3dieDIvVFhIdTNneURvWjc0aWU1UDhpNXZEaWZTSDZFRzhOSjlD?=
 =?utf-8?B?M2xWRkxZZkYvQjJCSldrL0JUWXFIZGJBSWNyRndTdWZDQS94RXJQRWlPaFpE?=
 =?utf-8?B?cWZFMHRPS1BzNFZrOVF1c0dqUGlMemNpbnNNajhkV2dIaExWckNwNWoxRlBN?=
 =?utf-8?B?b05XNzJHWHYwcFptU0hra2dWOWNWNGpYZGZQQTNSMDBlNWU4T1o3cWtBcEY3?=
 =?utf-8?B?OGpESktvalVxUllvczJQY003aFczcFZHTjg4VDkxK2syaXVqclE2ZXdNQjZL?=
 =?utf-8?B?VHdwaGhDK2R5VHVHY3h0VG9uU1JOUUZjWFF3TUNsSURQZFR6d2R3MzNuVTNE?=
 =?utf-8?B?ekJaeWQ5cGhLOFpUeVFPNWloc3drNGlyM3BaaGUrSkRRNjFidEpnQXEyNVFQ?=
 =?utf-8?B?UU13V0oyZ0tzNDBTcm5wVGFzaVhGVVpMQWFNajdJNTlHY3Ezc3NvV1FuU3NY?=
 =?utf-8?B?cU5CWER3ZkpZY25VMEdrN0RNckphNjJkWVJsaCtiRjlRTTZoc1NESVUxb2h6?=
 =?utf-8?B?amFpZmhpL3F5amY0SWpqUHBBbk4ycDg3WmZTcXJmNEZYR1dCN1N2SFE4Q0pJ?=
 =?utf-8?B?TEROLzdlNVdzZXlmRUhQVmJkS3JCZ0IwNTdKVXkvL3JVckZwV2VjZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9728af-ff70-49f6-a3dc-08de99a3c9b9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 21:29:47.8289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/gKf+G6a4gxL3qhyACQOKtjAP3Xe7ePzuDpdMKvKzY8NP7UYC8DtW5ujFltwr/HUjNUvSX3cMWerSkxC0xEdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6635

On 4/13/26 2:21 PM, Timur Tabi wrote:
> On Mon, 2026-04-13 at 14:08 -0700, John Hubbard wrote:
>>> Can you add something to the patch description that explains why Blackwell, unlike all of the
>>> olther architectures, is represented by two Architecture enums?
>>
>> How's this:
>>
>> Blackwell uses two Architecture variants because the hardware itself
>> exposes two distinct architecture IDs in NV_PMC_BOOT_0: 0x1A for

This is really what drove it, for me, though: the hardware itself
saw fit to identify these two variants as architectures. It's
encoded into the very fabric of space-time itself! haha :)

>> GB10x (GB100, GB102) and 0x1B for GB20x (GB202, GB203, GB205, GB206,
>> GB207). Open RM maps these into separate chip families with distinct
>> HAL routing and different firmware signature sections.
> 
> We don't need two arch's for Ampere to handle different firmware signature sections.  Looking
> through your patches, the vast majority do this:
> 
> 	Architecture::BlackwellGB10x | Architecture::BlackwellGB20x
> 
> Looking through your patches, it seems overkill to separate these two.  The one or two instances
> where it makes a difference, an if-statement will suffice.

It's arguably worse, however, to save a (very) few lines of code, in
favor of adding special cases into the basic Arch/chipset categorization.

Again, it would be one thing if this were a software decision. But the
HW itself set this up. So it's reasonable to follow the HW.

> 
> As for OpenRM, IMHO RM is very much HAL-happy.  There's a whole built-in mechanism for hal-ifying
> any function at any chip level.  Nova isn't really like that.

This is not something that Open RM did. It's something that HW did.
And so while Open RM criticisms about HAL granularity are reasonable,
they do not apply here.

> 
> Anyway, I don't want to belabor this point.  It just seems to me that since you have "GB10x | GB20x"
> more more frequently than you don't, I don't think this warrants two architecture enums.
> 

thanks,
-- 
John Hubbard

