Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEB9375F76;
	Mon,  1 Jun 2026 18:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780336918; cv=fail; b=ZfqbzkldJtnYBVPo/n8byAdLbiBAjvezleImBXRp6Kap3Ddui6KEqSQGksC9SQPXrb7GPVng00W7O6oydRwuSovikTDsMFUsujSc3MnoZwwbWntGPHoN60NgtpxYfdGT0foG8BhRBqEnICRFQwWv0xEguuJBy8ozxjs4gifOdjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780336918; c=relaxed/simple;
	bh=bKGhj8fZQ5Mtot6TBVnxEatUcujWjMAlKq567Esbc8o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QMJl1FHLw3qTZLgr7D6NPQC4idB8MMam8/XFdnyEo/pWxX6SiSyErrbW8ysQgF9AQCHtbZqjNFINssx8y9Mz3Qzv/r2U/6kwqVh8ib4L8uztpxiFjFaffzjHV3LrRhF8wTZ17pUrGQXkernkdmi7tZJ+uWsXoh5N5J7NEgXHAww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WBLT5Zk8; arc=fail smtp.client-ip=40.107.201.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WBLT5Zk8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVdL4qHb+en8Li19dVCCJmT5XDZvFd4I6DLI7+gO5azfcJKhQqmGc18Ou0uF+olk5qdiNNznmcf3pwgfVq/o6tyIIh+/jCj13cYgpnT8L3hOvgr1JhzXfq0rl/Eni0HWvslmlJfosbT2WoXBxRxxd/irAbUhGeGx4xDRA8DJmgTStBUyBhi4IEGNBj7OI0JgJDmkZQpTq734G/CfrTtV5q5fapb7yWHSPXrc3cnNrq1Rn8XdK6es6w34gql3NYSkFh2gCLjRBSQgLNNP4C60A9TA4zUOX0TcpMdoaiovMNPmhtQZg2D2k+9wkbbbB9/0hk9MfsBcF+33CaH5vVAe6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMc6dVdiLNZlW+jTMCngXBBoLXFmxfMr41taoqfPNNk=;
 b=aLXyf79U++QREgDo3Ti8/ctlqRd7grBlVH9PSW6a18mSjXrwwqHZhvVwi+F2dYELD0flzUcEQu/LhIvGvPX5HBKRWSuPHcvlcY8NcPqpendzaE9MPPCoBvaZX9j8Xn+Q5Le6i6SMMWiOKxnrNdqf7rtzH7bexCm6vOtu2ALurHtZ3FX1uUYwWqWUJYcHYjNt/B6l6EAA9P3ev2Zvf3cOJxoZGF46H3x3qLA/foCyDLKJ1bQ/RR0cwZqZCINkFMQcRQbotRKN8KNj6+L6SapvPCfFvzwzxo9z2lW6KgzCUfBr47083eVxK3Y38RoMbCheIBXZzYdLOT6ZjGRIwFHwvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMc6dVdiLNZlW+jTMCngXBBoLXFmxfMr41taoqfPNNk=;
 b=WBLT5Zk88Dcs30n9eQi9iBnP5yQXFPTkCkqUBpqSN6iIvrPIf1NnSax3iVgD2dLc9CWOJxP6Ep7id9qEpgS53WbqztI/7SDjEyUomlVt5e9ycrmSwndAqqEZVWfIVpDWvoKQ0WbZvxwnUoiOWjTJAjiYgJcORdUDWW0Y07CFoXYAz2kwCGPOsCY1QNsEfXP1Bx07QbS2Br/W+5mLbpg9ongwLekM6ZOi3dmu0WFjvZuN02fbykL015MgQ+s2Z0p3keHlxC5/O9frjp98nTOZAIUarnGzmqOKJjro0l5/KliS4aFPCPAUQqir73iV7x+ttGtBQSd4PprreAA7tiq6Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB7970.namprd12.prod.outlook.com (2603:10b6:8:149::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Mon, 1 Jun 2026 18:01:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 18:01:52 +0000
Message-ID: <7a03b79a-838c-4a5e-a8b2-2719963dc981@nvidia.com>
Date: Mon, 1 Jun 2026 11:01:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 03/22] gpu: nova-core: Blackwell: compute PMU-reserved
 framebuffer size
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
References: <20260530030953.740561-1-jhubbard@nvidia.com>
 <20260530030953.740561-4-jhubbard@nvidia.com>
 <DIXCGM5BG9PE.1ZA1O9T94CGC@nvidia.com>
 <DIXGV7OEGZUB.2Z9JSH3DS8XK1@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DIXGV7OEGZUB.2Z9JSH3DS8XK1@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a673fa2-e485-4b17-8436-08dec007dbde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|56012099006|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	q7n4XBjm/XR+GUWqkfLr03Mblr8Z0SVIdGsXVKVhwSG1KTj3kvp5c3+Fi3LbJmmrixuXZiPtiZV7GlwUcRzJ0IRjOcxwFxgWOY5kX5cFPIRuIFVxbAjZSt1HXy2sxt+XMI1tUuddeSWdE5qbdM+6X2PoWOnPxVoEpntjM7cksvdzrxy2OkXEJYbl3sMTtHybmxrtb7JEmiZ6bPEOmzEdKAD+vncMIYKcK3CEVbKnHW98f9QHQQlD2KJNBoFQRahXIWCH1/vKxHhxxVVzCsVR7JCESOgImIY7G+ZXP8IQ5aMBD/C5bthuS1YVZj6ME9BfhYRX/B2dNQNJIl3zdcWNB28V9L/ZB0RzHlv5fRTYlnoWt3lAyHVRKOqDIopPUAHAcUf8Lhw5Ffg4OVwRvPLdSArwbe/K2uB5TY8tJdfekGU4sQat4hN3d3sepFrLP/eB6qtEtareRrecRScY/IfK7qva6sTaVcApMgV09PxUTo1oSu5Nj/CMtNH6Tfp01BAWLcuE40SwrOC/MSOSBXf0EXdUqtmBvTwkQZkiQUI2JiccbaaIcQ8SMb2HXxUqG/gsVr5NycL5gc8laXAMGHDqQytLPjTnG3amLsvewfWlFjm+0mdgbllQyrQfPj0Nr0sTIS2RP9XehAa3z1kcA6yyAz9Zlpe1gsl+QtJSV48xy0+I4iGNm1LgAIAn2cKSzuX2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(56012099006)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0NISUExKzBhNHZVNVYyMjNYZ2QwbkRGR2dUU1o4bGpndVFWYzRLbFFoanBx?=
 =?utf-8?B?ejkwREpVWW5PQVRIdFl4anJkemJyUWdPSVZPN2RqOG0rOW1pMFVCN0Jjckpi?=
 =?utf-8?B?c0F0ck5LQmZ3VDdWU3VEdFdEUkR1a2lvaGduY0ZWNTNjSEk3RDlTa0h5YW40?=
 =?utf-8?B?MVhtZytHWGs4cEhuMWZoU0VMemIyQ1BienozV3pmVWpBNDM1dHlpRlhacjZw?=
 =?utf-8?B?MXNYZjYvekczYzA1VnBQMWc5UHRQMmd6RzF4T01nejU4MkNYRUdLT2EwcEFp?=
 =?utf-8?B?WWhsVHQwRm1MZEZLZWhWNEpPb2E1ejhIY0pLVVdhQUI3dUVwSGR2aHc0RDlP?=
 =?utf-8?B?SXZSY0FDZDhxSHdINGpIeVlZMnVuYkp0Q1FxZ0lRWlZaRTFNZ3RsZ256RkJz?=
 =?utf-8?B?bTk3ZDlBWThUaG52cmk5OEY5TDFhRm00c3IraE43NGtzZ2RvKzA1MmhhZmhK?=
 =?utf-8?B?K0Rad3F1NnRXUGxqK1BvcmtLY3FYZURtTmNuQXVidU9SYzV6S25majBRWi9V?=
 =?utf-8?B?RTRZRGx6V2NmMi93V2loZXlrbGw5MndaM2VHMFBqT2NlYURwcTR3Q2tnenVw?=
 =?utf-8?B?a1RYcHpSVFRlNHRTRXZuYXV3WjJqTm5TaUhjUStxd1FzaXErMkMwanVIZFJW?=
 =?utf-8?B?SXFialliUEV4S0MrUVMzNGxpN0g4OG83UXN2UERrbm5idHRydDBSNnA1ak96?=
 =?utf-8?B?a2hTcUttb1dVUzUvYXJQSkxxVHpJV0RFeUhqdTZkR0lmU2l6RWVocmMyb0hG?=
 =?utf-8?B?TkFWK3hYVlFzNlNOdEF6b3Z5SmkyUWRqYnFtZ0YxZFUvM21WaG9SZFY5eUwr?=
 =?utf-8?B?THE0VHNPMTE1S3dpUE5CcTh3dlFiTGpFRHV4dzJ3c1VmbkJrakJCUERDdEhY?=
 =?utf-8?B?OWQzNDhkaHQzdXpzWE9sV1J5b0ZHWUNGK0QrWXhxMGNRaDJBSG9jak9LU1FN?=
 =?utf-8?B?Q1pES1ZRYjFhRjViYTZyTVJDYUZ4cE91UTdvVTlEYzQvalNsbW13L3hSQXBl?=
 =?utf-8?B?Wmw4emlXRmdFV3hBYU1jV0dFWlNhZ3ZsZVo0cks3SU5ZdHorNE9Kenl3ck1y?=
 =?utf-8?B?ODFwUmNiU1dOckpWdUVaaG1wWmYzWGdmZFYybTVUY3hoZFhhSC80WWNaczZY?=
 =?utf-8?B?K3ExTlYySTczRXl4dlBpT3E0Y0F5eWR4MVVjNWdMSHBiSVNiNGdoS1dnbllF?=
 =?utf-8?B?blBjUmw1cllyS3diKzdNbkpXT2VhempnelBvVmxIaEo4bGs5TXRmd1Erd252?=
 =?utf-8?B?bDVxS3pUakVBSVhJKzJLUHBpM0FkbkZtZnF3NThNSFVtM2t1a2xkZ1l2MXZ5?=
 =?utf-8?B?VFBmM2RxTUNKaUl5S1JUZ2J0NGNxUHNsR3JDUjY3RUoycTVIZkNvTGtBWGJs?=
 =?utf-8?B?QWI1ZlFaWnNzQjBZQlVjU3p1akhUSDhCQVpFYjNoTHVYNVRJK0p2VUxSdnBy?=
 =?utf-8?B?LzkrK1V3YVNDVVE0OE5pcFp4YVhEYm9wL3J2YXpyTXFERUdiMEc4L2szb0hl?=
 =?utf-8?B?UDhMdExqRGNNUWFYbHRmZUUxWXpVenQzTTRzc0pETC9hWHpBUVZRRU02czNN?=
 =?utf-8?B?bzcvMGtpMVdXakowcndXSGlkTmg0cmpZYXhQNWR2THpET1JxOWtZZjBIbCtI?=
 =?utf-8?B?bzhlVVczSjN3MWdxWXcxcDB1TGRMdUlGdWdSUVhrVnUrWjBQbXZKUW9vNHlN?=
 =?utf-8?B?RkR2bThkaEhyYVp6dHlhOWpRelA1RnA5VDNRb0FlSytZWExXODU4dHpORzdi?=
 =?utf-8?B?QWozNmV5YVJTTTVISTFLcGRLWTVqOUhQb0R1SGYrMVQwdUtHanpVUzFpZnI4?=
 =?utf-8?B?OVdhamZ5aXVuZmpvUnVOcXpxUFBDZVpKRXBXenVWaktmQzZnbEJ0RWhCakY2?=
 =?utf-8?B?enp4VnN1OUp2bHVWOU9pZXREM3RTNDFOWFBkSEpEbHFJQWNWMUF3Q05iRFho?=
 =?utf-8?B?RlVSamxDbDVOMjJCK3c3bFFIL0o2c2o1djhLV3JoS2Q2czFHS2tESzlHQUNX?=
 =?utf-8?B?dnFMeWhEYjVLOEFYWDMxanh6QnNJeDR4a0VDNjRZaU9RQjcwUDR2Y0ZqU01m?=
 =?utf-8?B?SkMzU0xRQm54bWxjc1NUWjJWUzg4ZjVwclVsVlZVQThUMlBqTzJPNmh2MXY5?=
 =?utf-8?B?K1YxT2lZU2VNM0xBbVNISG1NcFU5TGdlWlI0THJ3cGtKOVJnR0tsaEpMeEJP?=
 =?utf-8?B?a3dTM3JTSnNDVzJWTTFpcS9WbXBoRHJJM0VRYS9kcHdPVWt0Y2k0YTUybTdO?=
 =?utf-8?B?SVpCR2VINnJMeXhQL3ptRmRKV0VHSTc3MEVWbnZXallqZlkzcDdDeGlUK01G?=
 =?utf-8?B?YTh0RnpYei9kdlpaWk5XSU0wSGRxMFZSUFptUDdWMXN1VjNoOThiQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a673fa2-e485-4b17-8436-08dec007dbde
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:01:52.1490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: he504/jQXFTrvsm2tAkF25URbhOdysWm4nGonE06/oON6qTShzKrfPdTgk1UybM4eWqdWnVfCh/1nOTom+VBZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7970

On 5/31/26 10:34 PM, Alexandre Courbot wrote:
> On Mon Jun 1, 2026 at 11:07 AM JST, Alexandre Courbot wrote:
>> On Sat May 30, 2026 at 12:09 PM JST, John Hubbard wrote:
>> <snip>
>>> diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
>>> new file mode 100644
>>> index 000000000000..c122ac2091f8
>>> --- /dev/null
>>> +++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
>>> @@ -0,0 +1,42 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
>>> +
>>> +use kernel::prelude::*;
>>> +
>>> +use crate::{
>>> +    driver::Bar0,
>>> +    fb::hal::FbHal, //
>>> +};
>>> +
>>> +struct Gh100;
>>> +
>>> +impl FbHal for Gh100 {
>>> +    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
>>> +        super::ga100::read_sysmem_flush_page_ga100(bar)
>>> +    }
>>> +
>>> +    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
>>> +        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
>>> +
>>> +        Ok(())
>>> +    }
>>> +
>>> +    fn supports_display(&self, bar: &Bar0) -> bool {
>>> +        super::ga100::display_enabled_ga100(bar)
>>> +    }
>>> +
>>> +    fn vidmem_size(&self, bar: &Bar0) -> u64 {
>>> +        super::ga102::vidmem_size_ga102(bar)
>>> +    }
>>> +
>>> +    fn pmu_reserved_size(&self) -> u32 {
>>> +        super::tu102::pmu_reserved_size_tu102()
>>> +    }
>>> +
>>> +    fn frts_size(&self) -> u64 {
>>> +        super::tu102::frts_size_tu102()
>>> +    }
>>> +}
>>
>> As of this patch this HAL is strictly equivalent to GA102's, with the
>> first difference between the two introduced by the "larger non-WPR
>> heap". Could you move the introduction of this HAL to this patch as
>> well?
> 
> Actually please let me know if you prefer me to roll this minor change
> and merge the result (and same for the next patch) as we have another
> review and there is little point in respinning just for that. I just
> want to confirm that this wasn't done on purpose for a reason that
> escaped me.

Sure, that's fine. There's no particular reason, other than lots
of patch churn over the months.

thanks,
-- 
John Hubbard

