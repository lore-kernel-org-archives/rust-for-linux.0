Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012014.outbound.protection.outlook.com [40.107.209.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7E12773DE;
	Thu, 26 Mar 2026 01:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488201; cv=fail; b=QZJP4a/Azz6mCA3Pf2AKh1jTRg28qN0MkNEP8CZSoBJLv2MO3rsxask3xwENW78rJUSz2PakOaFPfV03GZU78lxGsojP2wv/UQF79iSvPPKp2KNEzRMo3lcjA8OhcTdsGWkqcU+3q/kjty6cQZGhckDXywMmN2vNapqS1YV63XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488201; c=relaxed/simple;
	bh=4MX52aHsMMprZtH4otgG1OVB7VA3LSkB1OqU3+9bSbM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cneMrhpsZXmYeW7IwwBTU6KJ6ab9xuIvHe6mwtjiejaw5/Fxt0CPSLH2QT1zm6N9LdOgClhdRxLRzAm/cNvKd+bAtL0UbW34bXyPnQ9T163jc+oro7FhuqLPQAzzxQBIAS+cAQ+35OjR5llLGo9cahxOHm8qXEB5vGDpH22TEwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jC+xXyC5; arc=fail smtp.client-ip=40.107.209.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jC+xXyC5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RI60LEPyYUDekguJFmMK3Qm2sRZJokVJ9EWWEBSgr8imLVUvtUzO6xJuQPj6sK8I4ksSqQz0OuRuuSiEJfbz0tG7ZuHLUjsdzy9waqRJ1o1CaKVGUcP3+5b/s/Cc232YuTz49AAQHJLu4b82HdDsCwHk3vEFsSLFR4YnlUBozBKJpuXK21YKi1A/RwwNLnWlP7A7CzADz9skzSu6ssbW150O19kXoVRtwFTo7cJvcse7uFqheAbS9PiBWBVecohdLC0vxSCG375181uXS4pR0abQQiDyhSwoEbFGTokRtpC7BfmmB4I48osQsQE+98K9XukzpFetX/kEX/5nRHDPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnFFgM2Eb2SQ3c3m4O4IrplRIZGyvSCuX8pEzMV9O48=;
 b=hWtVynLjnfsXqWLRmNcT2MEuFVdJoWqwU6SIEqvaSvyw8xqDVgC3p1FG+4UBRHnFQoD2aqhW3c4d8RydVOIn8DDCblzof4K/g6J+OIq2XZU8X4yS+wQBbSoPNY9FadSuqMzLg8gj9GNRASdHgAiY+LLvShUSwno7F0MoaR/W9+PD880yIEh85zowchxQLzSo0C0NIJ7cIEqZ0ROK1YYTpnIXv/yqaRU5Kg3Y5JM8SKh/BS+qZga/PLtenJ3/GCnTAn4IPMQL4orBFVzQAIsTjDURuPtYrd+1f3/BdqMsKC7jh/rwZ9LalQbQI3OZQuQF42oSv5ppHJJdkcuzEq/6OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnFFgM2Eb2SQ3c3m4O4IrplRIZGyvSCuX8pEzMV9O48=;
 b=jC+xXyC513lP+gF8sfdHIU/OoBQqTvWgmvK8jlMAzuIB5exs8ak7hZ4M4imuc1ccyi3qG/irKa2jLFhr/DReV8UJSAuxD1m7TZjsHCuKAzf+XfaO1Q0Y3PqG3tOlCXry/JbYpA1Vw87EN/w22AaeGkMwcyGwoBS4MvMgkcxWyqN7WgBPWAroNbIlqn9MbLMVJQl1OlU48EocBxPkP4RDDEzV1klEt/LnEP8ofNp6ALykAmGVsqeGtxSAOLxiDyTm9KPxUFstOrug6S0Yer6McZIWOFFHZ6rUHtcFFnJe50t+YinBZg/S/LqQbaJRRUUVBvp0fvxgQgBil6YplaaK4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH3PR12MB8354.namprd12.prod.outlook.com (2603:10b6:610:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 01:23:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:23:15 +0000
Message-ID: <11c08d35-241a-4b0f-a345-d9823cde727b@nvidia.com>
Date: Wed, 25 Mar 2026 18:23:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW boot
 waiting
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
 <20260325035242.368661-7-jhubbard@nvidia.com>
 <DHBZA23V0KRU.36XBA6KHRKKOG@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHBZA23V0KRU.36XBA6KHRKKOG@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:a03:100::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH3PR12MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: e606d8cf-10be-4648-b2ab-08de8ad64123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nj2r7LiG7Op9jIV4TsQlKb+AsuotzhyH8oRBrWj0arngm+VTf8MJVWH6PD4fVwO3rd5q0r5EKK0PguqdhrTtKZefVtu57ttHW+VlA+QqZz0L4C46VFlgBClF8HuYQl0OWJFXcWTB2k5toTf3JERnKfA81kC30ac3NsGy7V5PpqwTL4cCs2aVVg4myCMQcvnyjP9btD2YGhs8mblSpUSfmV7qCQ5GtNVoaOo6Lwvzjjf7OFEkg5TC+Nd0OnpypQWfgSdamZ4aeKglsW0dLdLDkhYZE8+tLneNHxnKXJ628FSo8LQwBgi9bFTC5FDdTHIUcbqh01uceA9eC7M6HW/qV55on+mRXta5LaPbNO9TVMHU7YfF9qCns+0isx4wK1OttFcuY8t83vRwmnszmsGJRYEB3llWSs81Ps82R63S7zwnmrhcMHSxXk+xlHYSt4wV5PH6PCAAR2kZ/fppyOa7t97FYQDUoTnP//YTMIH/Loav8C+pRxzn9I5IRxLN+3hkVChtRuwzJu4dQwXL3Cjhgb86dr0Mr0u+MjmWxjJdNQ1hYGJz9mQ5b+yDA2k/AUqZghxHj82imlemlAiUaJRTlLxm1KDoC03tUwElRA6e7GGbRa2TKM24qUFHg96GgkkKIjRyrG4UCTiJV/c3DhR/XqbmKu1eXis4eeIrJnCOS+qG7gIdTuGEISSmztqOvCLnCkGZER/H3u2wCnqphHvfjmJYMnEgQOIzOwjM36TuBVE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0Y3SEJWTGd4b1g2SmNURm8ydW9ORktCNFpMeWY0VThpS3JZVjh5YkYwQ1Q1?=
 =?utf-8?B?aG45dWRhSU9uUTllSVlqWDNKZWdSLzJXWTdQT01rbW9pMEtTNGl2TUpwSjl1?=
 =?utf-8?B?Z0NyaDNhRVRuMHJVVWVhcXpHMWFVcDFYS0M0KzRiZE0zSm4zd3dDQ0RIZzBw?=
 =?utf-8?B?dVljYlByc0F2RlE2NmFZc3lKMVd4QkdTSmFmaWJ3ZHptRWxiOFBsT1pCbHI3?=
 =?utf-8?B?REFpM3BCaDdMV0dkekJDUGJuV2lqa2lHRlhReVhmZjRCLzd6aExiT2h5OVhi?=
 =?utf-8?B?Z0xuaTEwTkhXOVdjdDN4L3dicHVrd2FTQTdORnprQ01CNWc2MDlnRmduRHZL?=
 =?utf-8?B?OVNJV3JZaUJIbEcwOGVWRGFnaWc5RFBTeHRpSEtvV2dQUzVWNy9XOU9KZFRv?=
 =?utf-8?B?VWNUanZGV295Rng3RUYvcVFlZmtWRkFDSjlURzdvRmpWLzlla0pkVjRKT0wx?=
 =?utf-8?B?ZTVDQ29USmF4ZmVKYkdJQmpZbXBWbndXVVBmUkxQcTF5Y0ZaUi95LzJRMnNx?=
 =?utf-8?B?Qi84azB1b2t6cWNPcGU1Qy9HNTl6OE92WFk4SFdDQUd1bDAvZkxLM21OVDQ2?=
 =?utf-8?B?dGZadWhYRUh6SkZGQ3FLam0rSE9tSGcvK3V6YlBmbzVrTmIxOThEV0c1K3NZ?=
 =?utf-8?B?T28veTV1MTg5NzR6dVk0T0I1OVNtSzZVdlgxM0NBaUZMMlVnNis0ZG1xbUJ1?=
 =?utf-8?B?WEZnSUVkZk44S0htWXhFVzJtREMyNVlCVGRBQmFFUmpQb1I2SDZBZXRzSXMz?=
 =?utf-8?B?QjRzU29SbE5HNFpJRDMrWFZZc1F2RHFGZENIUGNyNmNJRkdxWWFPNDlFdERW?=
 =?utf-8?B?Y2d6b00wc1lKSHdvRXEyeHYvNW5wVlhHWDVzdFNYYXZMcEMrQUZTMGl1c1Yy?=
 =?utf-8?B?dVVZQzhOOVU5dEFUcDVXa2xvTVduVno5dnVNOHpNc21tRHZnWW93YlNCM25Z?=
 =?utf-8?B?bENwUXZxRC8ra2t3bk5RWGdsQWZlZUFsYVJhT3cvM2VwS0ppZHZUNEVuTWh1?=
 =?utf-8?B?S0w5aXZaQW1WRDIxcFFhU0wzSTdlZDgxdkdDU2IwV3ZSVzJFTEdpbDdtRENq?=
 =?utf-8?B?dUZ4OXpxdGU1V1BUc0Zqd3BTYXBZNHJxandXbC9QelluU2Q3dTBud0RxV1Fx?=
 =?utf-8?B?aks1L3RNbytNRDFacElIZml1TGV1bTFKYXZwNi9jY3JzVE1uc0o2STRJeUt1?=
 =?utf-8?B?NmV4T0dvdXN2Rk45a1FMTUN1dm96NHgreE9Ma050M0NZLzcrSE9HTGlqbUhk?=
 =?utf-8?B?NFM1VkYza1UrOWQ3d3ZyV0ZiU2pkSzBGZ2xwY3BBZEFWcTZ0SkRpUW9mN2dL?=
 =?utf-8?B?SHFoWHJiNWhLZWRHdmswdVhSTkI3RWI3N0xTL2ZydE0wRHZ4S0xYMUNYdXo2?=
 =?utf-8?B?WkVaWUVIYWJsNGVQKzMvbFFQU1VWQmdxcGdMMkduSS9pMkt5SVFESmRRWWRY?=
 =?utf-8?B?VjlURDJUZ0lTU05yTTdEamtyUjU0L2U4bzI0MFloZVdOS29FQzFZVTRwbWpO?=
 =?utf-8?B?MXptdkNZcDZrdnBlMHNaY1QvRmJXNThGRDU2NnYzb01FZjdwV3Jwd2UxZ3A3?=
 =?utf-8?B?L1B1bzc4eC92aE5mTFhvZkpLbUs5UDRGTzM2SHl1Ty95MXdQSHFDTXI3NWZB?=
 =?utf-8?B?WnBHaFhGWHFxWTVKRDZGYVBQNU5valBYNmJyTldPcFlOdW1jdm8yejBOTFRl?=
 =?utf-8?B?VU1PVDRqdXViKzdUTkZuUWVtbmtTcllGb28ybU9oaXdSUWxIUDY2MjFMSkNF?=
 =?utf-8?B?VVRSdjltczg4ZTVldG55QThQUSt6SUhuZ05rRC9RZnlQT28vVGpNSkJXbkl4?=
 =?utf-8?B?R3B2aVM1ZnJZNFNQdlBZdi8xY1ZnZFB0cnRYVldRWXBiTXV6bVY2NW5YVGI4?=
 =?utf-8?B?R1FicE1mMExScE1iYWZYN001dUszUmN4bDZ2SmhRcWYxQWNHT1IyTmFCNnly?=
 =?utf-8?B?ZG9LREdVb0lMY0JCM2hPMFpZdU9kd2NFVGhheGNqM3gzUVRkQzVTakg0Zkpa?=
 =?utf-8?B?dlF5dW42VHdpN1J0YU84aFBzNkN5LzAyVWp5S0YrdUZCWDBjdllEdkFYZEJx?=
 =?utf-8?B?WXFLV0ovbmEyZmgwNzFDRG96Z1BjVzZEalprN2k4NlR4cGpzOHBnRG1oV0pt?=
 =?utf-8?B?b2JCR2g5TGdBNHp1QUpBbTNkc20va3RobVlMUGZLS0R6TjRCYzFIc3htY0d6?=
 =?utf-8?B?MlBzY0o5NTRybTdBOVdvRGdDOHpjUzA2dXFhK1NwS1BXSHZ3cUxuVExWREdE?=
 =?utf-8?B?eUw1V0NWenpZYlhkWnh5KzdiMTJNMnliRUllUHMrR0FldnFMVFB1L3dwSWFK?=
 =?utf-8?B?bjlQendqUERUWDZnbG5IU09xZGQyR0hoMUpjWG90L1FOQnNScVpUQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e606d8cf-10be-4648-b2ab-08de8ad64123
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:23:15.5384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7WuYA7o5Br4yoJxKS9zawD9se8Qc5nE4lWBSgJoi05sr4nyISupiK8g90zJ0AKi9a/gzlnzHYPDLdUr+Q6CkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8354

On 3/25/26 8:45 AM, Gary Guo wrote:
> On Wed Mar 25, 2026 at 3:52 AM GMT, John Hubbard wrote:
>> Hopper and Blackwell GPUs use FSP-based secure boot and do not
>> require waiting for GFW_BOOT completion. Move the GFW_BOOT wait
>> into a GPU HAL so the decision and the wait both live in the HAL.
>>
>> Pre-Hopper families (Tu102 HAL) wait for GFW_BOOT completion.
>> Hopper and later (Gh100 HAL) skip it and boot via FSP instead.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gpu.rs     |  6 +++--
>>  drivers/gpu/nova-core/gpu/hal.rs | 42 ++++++++++++++++++++++++++++++++
>>  2 files changed, 46 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/gpu/nova-core/gpu/hal.rs
>>
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index e7c3860cfb28..5cef5b29cd3f 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -18,11 +18,12 @@
>>          Falcon, //
>>      },
>>      fb::SysmemFlush,
>> -    gfw,
>>      gsp::Gsp,
>>      regs,
>>  };
>>  
>> +mod hal;
>> +
>>  macro_rules! define_chipset {
>>      ({ $($variant:ident = $value:expr),* $(,)* }) =>
>>      {
>> @@ -309,10 +310,11 @@ pub(crate) fn new<'a>(
>>          spec: Spec,
>>      ) -> impl PinInit<Self, Error> + 'a {
>>          let chipset = spec.chipset();
>> +        let hal = hal::gpu_hal(chipset);
>>  
>>          try_pin_init!(Self {
>>              _: {
>> -                gfw::wait_gfw_boot_completion(bar)
>> +                hal.wait_gfw_boot_completion(bar)
>>                      .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
>>              },
>>  
>> diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
>> new file mode 100644
>> index 000000000000..2f9e18e67a35
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/gpu/hal.rs
>> @@ -0,0 +1,42 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +use kernel::prelude::*;
>> +
>> +use crate::{
>> +    driver::Bar0,
>> +    gfw,
>> +    gpu::{
>> +        Architecture,
>> +        Chipset, //
>> +    },
>> +};
>> +
>> +pub(crate) trait GpuHal {
>> +    /// Waits for GFW_BOOT completion if required by this hardware family.
>> +    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result;
>> +}
>> +
>> +struct Tu102;
>> +struct Gh100;
>> +
>> +impl GpuHal for Tu102 {
>> +    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
>> +        gfw::wait_gfw_boot_completion(bar)
>> +    }
>> +}
>> +
>> +impl GpuHal for Gh100 {
>> +    fn wait_gfw_boot_completion(&self, _bar: &Bar0) -> Result {
>> +        Ok(())
>> +    }
>> +}
>> +
>> +const TU102: Tu102 = Tu102;
>> +const GH100: Gh100 = Gh100;
>> +
> 
> Why this instead of using `Tu102` and `Gh100` directly? They already exist in
> value namespace due to the type being unit struct.
> 

Fixed, thanks.


thanks,
-- 
John Hubbard

> Best,
> Gary
> 
>> +pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
>> +    match chipset.arch() {
>> +        Architecture::Turing | Architecture::Ampere | Architecture::Ada => &TU102,
>> +        Architecture::Hopper | Architecture::Blackwell => &GH100,
>> +    }
>> +}
> 

