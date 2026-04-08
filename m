Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D5818C933;
	Wed,  8 Apr 2026 03:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775617527; cv=fail; b=mLxii0ncdtBirEYOp/lpWkdqPDuIuTKyivOPvCMAmk+Hy1XUP5at/+tkLbiUuVHRts/wzkmhqAZPjgqptBQRYP821jKJjUp42zLNYLJUMhJNefb0263czzkLzgQ7XTrc5TbWch6uh0ijAeSecssgES+HEHonudvMvLMwDhyOltY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775617527; c=relaxed/simple;
	bh=DoYQAkh/cwPiqFZ42PDre77jOC+hkJskSRBWeiJ1bEY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XBnyG6SsbKwcalBDu5GlFl6WXnGCnA13gAVI2R8X8jLHZmnYN+2r5XBWS9BTY0rtgRty/i0yUc+ntkrKV67SsqhcWuFQ58Dqm2nUDx9d+gTx00Ko8XamXjH3RkiyCGtToXVAnveNQE4I0U548qkcKfbZ1wgWZO3h4NGI3Xprsmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fHvAtNco; arc=fail smtp.client-ip=52.101.201.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fHvAtNco"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brofwI9iqtjNmbVDDYfYuRcdrPIt/hBmqqha4I4kfhN3RVtL3ooSw/gTe66k9X++iBdXqMh2Dkts/iKDfB0CWQUskUZLFmOVApb2qL9FWzF+kUL6crup3fgyPUwYr+rMyK4vIpDRFaweYwPNX9dgMT4ZFoDutBRpvq6BhLD1ObTXTC42Of/IAfxahrTVb4VgES0v0pS0Sd+UtMynC2JQcA6yPPLYgPQaFvf9pe86rDHx9AGNSQmUbeQW+yhZIqvdUgMKHVtA++dTvq78imlaRzujj+7l7cMjyRzsMamN2huDU1PN29O7E1sWUE9/KwU+CH5xzHyQSw1egGsOc9HwQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=likNYMQC1V1tF83z+UNTBYTPXVhoZFjP0WcuARBmE/Y=;
 b=Dy/yuN0hTQibTV0jadu7dB26VkupYZMXarWX1uggqKx/A8Bef8l6djnq3Ls6VObMSyqnmHFOzeTZfeC2k0ukFBr9RQvjruPmBYoKyDiA8yuyjjQrjSYWGAQYWc9Wmadmsymyzbm8PL3ZW20gd7pnR08IjpPbY+vVlAtN0oXpQ/HuIB4y9fT4sx4LqPG+hLz2lUyTCKqY5DQUPytOodJRGl5RIF+PlWA6wC2J90D5lCUlDCJixQjLWG8e/6+XC7+DvXzAl6WMs6SC9XoR4pjMDnn+EkRYUsgsmzwbFazRjvFS7ZoxgeNhSafybcGou4WnvbsS5L1Mef3k3NlMJQXxuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=likNYMQC1V1tF83z+UNTBYTPXVhoZFjP0WcuARBmE/Y=;
 b=fHvAtNcocYEUI179z4OpN3T6SX+XTFhMlvUXdF3Q15JvApDHHt5G3k388SUA2IEDeByv8Kn/ISk0l85Uhg/cHRKxgh421irmlDO46ZA5JqWNAhx01W3BJbmM7iVj4XpzOIkrZqIuuB5U+AcZoobsFTgqbFTdw3kt5xy6jG/eRrGFxiJZCS0rcxqOTVQnBtLbT5KIbWGxYzPOtJIypFWmdOIUTDCMyfLjrYMbHB1jdHpeOi1Y6GEcl8Hf13IfHZQbAnCr9VRdSIZePKHrN6CK6U/goATVLzAWmvkpkIkQ85AjdZlzUabEro7ZiNK2++u7ZObSzvdecol8KZdEXkirrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Wed, 8 Apr 2026 03:05:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 03:05:22 +0000
Message-ID: <6e26d1d7-4b77-4fa2-a744-03a3783739fe@nvidia.com>
Date: Tue, 7 Apr 2026 20:05:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 17/31] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
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
 <20260326013902.588242-18-jhubbard@nvidia.com>
 <DHNEBLL5OFJ5.1VYQN7NLHUS9H@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHNEBLL5OFJ5.1VYQN7NLHUS9H@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:a03:40::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: edbfd0fb-d598-4656-fdcd-08de951bac78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dpSxJzy0PDGFS04DJjlSPX/CmI1AAxt9m7iHuWkXc/WCzu+jOcg71hdV22OlvPaRN6NcV25PAmoi28KtGZxG6Wle0x1kGjGMIAUynkoEp2nT/cfKvpE6+9mu+BAJKIaE/4TxXgT0dMRGf+w3EmupzSe9KzwuPP/Xls1bej09DFxCXXbVggPOEKefQLYmapj1WoAd2GUbMwHmleskevzK5w+qqlZTFUOd59HytO2XHhCNI0cmfE5PfwPA73vkYfwbQ1SgmbPFIieCO4B7B9/IX0fS/eJ/k1wMNKLOCdAPsduMm8+EWjGSzZHOJUgvQM/bs448O8Oy1Jr87cxZg0iBz62pOAWFDvY1AOgsuK9IKw3Y/7VarKueOSUUt8600dTnVpx6EYjuix+30O4qqZIX1duDPiMVMvpYhT44DDju4yBSw3H8rszTu6leVVJZ5m19hQxt+soo+47AfyjP6rsc/OR3y1Dxr+trNgBmtP27eNoEeucfJ1t48jX1Cko83nxwOuGmOE7B4hSfbRpu8DNCHFWtawZfPUbw1zlQ7rxpeVANwnu97liPTZ12XoQCkItH8DN+8+oUFgIqhWIGsbyKiibrpJCq91+7VXBNd4P7nFMAyeM8LXSovI7heUJo15QblpsvWTTHUA61n+UPGtpkYCQRW1xCLKF6ykmi/nUggSytVfhA+Ov/pwuKq1nfal85tcIg2BisrQYx4hogixosHxD5h0Rd2u76ckxipBsIG24=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGdiRDY1YXlCM1NSOUIvT29NUXFuRkxUUmt6TVpQSzFkNzlrY3RxTVR0WGJ4?=
 =?utf-8?B?amlieHZyYWN3STFrQUYrQWZlT0NPQkhadGpkS0YzdGNCeGNsYmU2NXJLNlpD?=
 =?utf-8?B?ajNEUEhwMUZGKzYxdDluQWUxeVE4RGdRakF6dGN0OUlZR2ltMVlidVp3b1FZ?=
 =?utf-8?B?S3FLK3lSRTZOM0dSMmRaVFBENWlKUWJVK3U1djVMMG1CMDBoUzJDU0pWcmNk?=
 =?utf-8?B?akNGbEgwVmV3MXBRRktISm9IbHlqQTFCeVB5dzY0VkFOUWVVN3lsdzNxaUUw?=
 =?utf-8?B?Sm5qRzBILys3ZU8xUmQ5ZlI2N21tYkpHYXFSZTZqa1ZibmFxTDZ1cnJkQU1l?=
 =?utf-8?B?VStSd3pSeWg4NEFxQzBtVy9IenpPakZHWGJHcFlmdVNMa0tNbXNMSlZaUFpn?=
 =?utf-8?B?S2F1Z21palFsUWVNUWl1c25XUGlvMG52SlJGOTBHUGlFN0xuejA1ek5IRjBh?=
 =?utf-8?B?STVXK2RPVGJKRlc3TzdKNkRnL1lqOTlNUEwvY3VNZUxKT1Azb1NhdDVYTzFz?=
 =?utf-8?B?RmtwamFHUmFBVTMwR0NQR2N1VXFaRjJNUW9ldy9ranRjQ04vSzVqem5DVzdR?=
 =?utf-8?B?cTdoa1NMeU1NK2kxTkhwTDdNMGRoeTZhRVF1a3V2QVlEZkFVcFNyYlo3RVVQ?=
 =?utf-8?B?bk1NeWYvWC9qT0VrRFl6MTFpYStXVHdUU245RlVpSXh4cGZ5WmljRjRaZUtU?=
 =?utf-8?B?Vm8vTHhEalAvdlJzZ0pINjhtMkF5bFNiOVRkc3pQTG5iNlRuendVdXoyUzhY?=
 =?utf-8?B?TmZFQmtwSW8rNXVFZGFhQlNnTmlnalBPdDRwaTRsUXZGQWhIWWFiSXYrSFFL?=
 =?utf-8?B?b3N5d3VZZmVnd3RrTk9ab0dtMXFiTVQxUGR4ZFJqTHhvSGJxVVg5bnM3MVh2?=
 =?utf-8?B?R1FEZU01dUYrN09LNVl2ZE9nQ2UrZCtnaEF2K25jcmRKb2lpb0lzYzlaWm11?=
 =?utf-8?B?SEhRVFJkUHYwckxlY0dUT3l5eUZuOFJZNTJVb1dDeTduSk40cTRmQ0NjTjhY?=
 =?utf-8?B?OXVwbFQvTkp5djJRTmxYYnI1YXFjek8vY0MyYnVlL2pzRHhoZU1sMnZJcGxI?=
 =?utf-8?B?T0NyODNxU2ovUGJkYnR0OEQ1SnpCUmpVMS92KzY3WkxjNzhuM0ZpK0tvUWJ2?=
 =?utf-8?B?TUIxTVJYU3NvZGNSUk5LVDkyVExZRDVXa1AyTzFmZTJDYWxYSk5nWHpMLzNR?=
 =?utf-8?B?QkJOdkhWMlJEVU90cGVFQ29wRkx4elplVVpwRWVjZlgvbU9FNWRac3pTdng3?=
 =?utf-8?B?ZW8yVUpFaDZMUE0rNEpGUmpWQ3JXL1VzZkhTVXBHNjhiNXVLR2F0Y0JDWEdu?=
 =?utf-8?B?YlAwS0w3ZWtyVzlJZlJJS2U0cVBKU3pZNTFtVUN1NU1Iakc0REx1aVlEcThU?=
 =?utf-8?B?L084ZzNvWWdGaXJ4dHNaM2J6Q2o0dHdsTncxcU5ZclZ6T05yWUVLTlpqWFlR?=
 =?utf-8?B?Wk1oaWdocUpHemRnbHlUbkttdVk2YVA1THF5NFRFbE5QS3JUNkd3ZmFGNDg5?=
 =?utf-8?B?SGZ0Z2UyRForQURVWXUrc1RpNUJ0QVFrbmQ0VStqRG5OQkpVRGlGM0k2dktY?=
 =?utf-8?B?d1BLcms2Qm9PT1hCUDg5WklnZ3NFZ1A4SFozSU9XT1BGZFVzQVVrck5iZnZ2?=
 =?utf-8?B?L25Ea3pGdTc1a1ZUT1dUQUpleUxDbFIreWs0blNOVWNGQklaby9GNDhvc2M3?=
 =?utf-8?B?Y05jVGp5cUVvcHVTVGh4cTZIdm5jbGZBU1VuMnZHclRKQmg5cDk3K1A2bXF3?=
 =?utf-8?B?TU8vT054amVOZGhMUjhyMVR3VlBJVnlod2NpV0Y0NGkxVVdaZGZuUld5Kzc0?=
 =?utf-8?B?K05wT1BvTDc5MnRzbjFmUFJ1N2NoRTJHUy80TUh2eTFodHNXSloxR003Z0k3?=
 =?utf-8?B?NnJ1blNjOFllUCtSemsxYWtldmM0VlhNVTd1bzlVdlh5RnA0eWdGUmhZRGdY?=
 =?utf-8?B?aW5NSlBLQzlRcjg1OGFiVWoxQ3dIVWdLWS9DUW5VZ2daTDJucDJ5R0dGTUlV?=
 =?utf-8?B?SEkwMS9uVUVSV3Z0aU82bG9TLzB2MUhNVHZXS1BPVGNWT0Y5TlJobFhWNUJj?=
 =?utf-8?B?cVVlNUtUZVZRZzBRNkNTZVNmRmZOWEw4SjIzcndUbFlTajJSa1BhR0NiaFFG?=
 =?utf-8?B?clk4dXAzQndtY1FaVktpa09La2YrSUszU25Wc3pSVWNYazZYVVMwL0lRMFFk?=
 =?utf-8?B?dDkxTHJ6ZjV2c0E4UlJhdmRCTUMrVU92bjlCb29oSEc0ZHVwSW54dUZmUWtp?=
 =?utf-8?B?R3VVYXFTQS9lQjgrOWpldkRnMjc5d3M1OGZHQXh0SkQybTBlbzVGVjZSaW11?=
 =?utf-8?B?eUhVSVRrRStUQ0FZTmJBZmVRbU5vcDVzZk1wc09DdWh0UlJCWjBDUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edbfd0fb-d598-4656-fdcd-08de951bac78
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 03:05:22.5806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Y85unW8+8PT9nI97K8+xBBC9/drXunCjE7O5rQZiQYjGFEj7pazDWUuYtuA/LhowWFYKbS50gwK8isBCQXNlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963

On 4/7/26 6:52 PM, Alexandre Courbot wrote:
> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
>> Various "reserved" areas of FB (frame buffer: vidmem) have to be
>> calculated, because the GSP booting process needs this information.
>>
>> PMU_RESERVED_SIZE is computed at compile time using const_align_up().
>> The total reserved size is computed at runtime using Alignable::align_up
>> because it depends on the heap layout.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> Is this Blackwell-specific? Because it seems to be done unconditionally,
> contrary to what the title says.

Let me work through this again. Blackwell wouldn't boot without this,
but I am not sure that unconditional changes are what I intended.

Some of my rebases have been rather violent, and I may have lost
a conditional clause somewhere along the way. I'll check.

> 
>> ---
>>  drivers/gpu/nova-core/fb.rs     | 8 ++++++++
>>  drivers/gpu/nova-core/gsp/fw.rs | 6 +++++-
>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
>> index 6536d0035cb1..ffb996b918f8 100644
>> --- a/drivers/gpu/nova-core/fb.rs
>> +++ b/drivers/gpu/nova-core/fb.rs
>> @@ -10,6 +10,7 @@
>>      fmt,
>>      prelude::*,
>>      ptr::{
>> +        const_align_up,
>>          Alignable,
>>          Alignment, //
>>      },
>> @@ -270,3 +271,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
>>          })
>>      }
>>  }
>> +
>> +/// PMU reserved size, aligned to 128KB.
>> +pub(crate) const PMU_RESERVED_SIZE: u32 =
>> +    match const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()) {
>> +        Some(v) => v as u32,
>> +        None => panic!("PMU_RESERVED_SIZE: alignment overflow"),
>> +    };
> 
> I had hoped we could use `unwrap()`, but it is only stable in a const
> block from 1.83. Maybe we can revisit once is MSRV is bumped.
> 
> Meanwhile, we can replace  the `as u32` with `usize_into_u32` from
> Nova's `num` module.

OK. And in fact, SizeConstants may help, I'll check.

thanks,
-- 
John Hubbard

