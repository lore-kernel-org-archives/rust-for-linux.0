Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013048.outbound.protection.outlook.com [40.93.196.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FE336A014;
	Mon, 30 Mar 2026 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774893077; cv=fail; b=te9ePWBzTw1vdwvCHt8oD42Z2Ww9+9gWZnCU7EBDaONNuov5TL017FWNtxQ/3tG/5ZAu/iyd6UG3Q8Zcqe2UZisVL0PGMF7e8XJ0X2lISPkN9EKJwhuK4fHEMhcWQfJxaySUb73nkyQwkwUx10+OVIAPW8x+tPlwF2cgA9mWbe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774893077; c=relaxed/simple;
	bh=9fBrg5wfkIsmgS6NaPFFwOPzONnVKJreiAMjAASV2wM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sCjAiY97u7tWgodIP2mgSiojlmere7U22GSopc3zEWtkKdu2xL3mw34vSgNTCnnUIXzKNs43syLb+kpB8sKjvtLVZDs/yDj5z7om7RYenQJOGm90XXxeZpi1Hu95zHiStZV9DUo/nfyc0eFSFtbFx7uBJbf6LW8bls0ZFbqBaSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Qj82JeUz; arc=fail smtp.client-ip=40.93.196.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qj82JeUz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6gD6hHLpIh20FptmifQXvU0ij78BuDlYLUtJLkjhbffs61fW3uP0sDQs8K0iEl1DhkqasCL3vXEf/cFQd9QhactlgADEmvxludunnRLomWxzsep5FgdPA2cyhonJrtLyDE4DzpBqBGub1QQ07Qc7ZtEbFQVtnk3etVmlA2tPSd8DqPbuQIxN3sN/KAH3nCvOAMO/sToZZvsN/EVl7ea9fmd4SMi7vEaT6eDdnfzZh9qCmkvVbK+rgwisicqEU1i/YLyc7kgMTHVbD4T2hLjm51PY8XUQIbXfhIn6h32AHMYjvSKQtuPsAh+tb2uISbIJtdVLDffWtZorrKhVOOTRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DylcSUnJpD1DME/zkOfeghnHhcBSYH/O/rt1dHdunTg=;
 b=MtupGn2C1JXJrWvPbX7JH6T9qoHvFWc94V5Fk/CS8JoHtj2zsifw1zEHwW8EwIHyAZtaLQK/z0rBizQoFzM04h+4OzGRij42OjoaSLIiMijhTE16zq/qTwVwxZlVB28w6SsZN6NRXyoU3gL1lP2GHZjmHQuphSMzqiiC0Lo7lNd8AK4W9QgdzagJPlgod83UEqvXiFYcihcBfEfa+p0/UCauJ3nxq0Bk73tl+w9olRC4Ele6nfwU1vnDfpPZiCJRBPorvX3JadQSecj7/DSNJplbBppqdNfwwC74K/9BRc7WF+0Jvbak1sTJayE4PNefcE+dGYdJmVFoXFyWg8WqCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DylcSUnJpD1DME/zkOfeghnHhcBSYH/O/rt1dHdunTg=;
 b=Qj82JeUzjInxoJ0Cvdi4m9NsFGzZ0aDKE3EkUvgeirWDIpSLysxNeNrqC8nxq7kV3Tbs3JnvJ5foI9TFOoKZxi0/x08WrqJrRBv4QB4wD/8RXvtdnCxUQ59gjAqaeuHuwMhVU9nHCa20wIKpAd27eaXw1zh5Z/LPSk1ZqKBG0fcaYmEDLz17irLRAuyhFo1Lm03lEjG7ESIi4xz5ulTiZEAfxbIG/aLGJjJEvEUlQWzZexAl3EZfNgJ3Vr13av/LVTLYcuNTBO4xwLERIoJXHacPAvKpP36t+aJ4kO3/R9E1l3aKYPMEAYysdY70AVqi0xx6NTVOCbJaZregR+T32w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4229.namprd12.prod.outlook.com (2603:10b6:610:a5::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Mon, 30 Mar 2026 17:51:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.011; Mon, 30 Mar 2026
 17:51:10 +0000
Message-ID: <1ac3c837-f3f6-44c8-8522-c9911532f6f0@nvidia.com>
Date: Mon, 30 Mar 2026 10:51:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/31] gpu: nova-core: factor .fwsignature* selection
 into a new find_gsp_sigs_section()
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
 <20260326013902.588242-3-jhubbard@nvidia.com>
 <DHG6SDIQKPJK.2866FUFZXM14Y@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DHG6SDIQKPJK.2866FUFZXM14Y@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0178.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4229:EE_
X-MS-Office365-Filtering-Correlation-Id: b0452cbb-98c5-4efe-c1f9-08de8e84ed25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PEzJGHfasMMQnugYCX6CZqPT/TZbZvnvoLVnwhZkKk1tkp6L/Yj8nfODc9Ooc+40MeJFLbBQDb5QvVJRK9ll5ZMiCB+YU3Ow3/VsxFuI9sGGozSM7e+nIR41k8JIWuxbm1RYKGXJ9h1ocZfImlsRu65Mpi/LrsmAACm7XIdJN5yVMXKQEOTTSvZyRQd21OKTlVQFUHKeOnd9RxNWriu6vKSSMvTnSZ6rwFzWJT9PwZjWKeqPwm1yH8Le1MSJVku7Zezd4wY+krXZfG8mEH4mMTjOPpjFC/TxAui06Z+/A9MaiLBALgsO4/LoVNefg4M9+GKgeDLhtjkMeZ2xRmkTffqCwen9JlnCLHfmPvpMF/8EhwDS2f65RqsR1pUEfnl4ludf8dsD+eRNTdS01DjjfiaHYThlAqR6j5Uwck5oEhQ9eLWwT9VtjGA9EzJblxXFBmF2T4yv+EJTejuctRihcXt6QOZwVMmwltBJskMqCG+CY6qVyikWYK31stCAy0J3psVdOxpzWRNZX8o9wPoPY2u9M/pKQjfvtv4VkgMIfMBFhY7aylSoJ51AsLZSXqY919blsFIQ02xCpdB0rgfHtFCuAxJ+IrzGjfuPCO8WiVYnKQ0Gs7ZJKuzTzoIeXWH95vFgFCWPgxch3eV79UubxXeTj9rCizkchnftdDf+MYex2i7yCETJQGu+j1ygh8MUKqsePY/xullTVbI/vf1O5BsIvnFdn3i1wsKAZ/vL2oU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dmgvbkpSR1BNbndCK1hWTk1UR3o1NjRPNXIzN0VwVFJCVHlkTjFCTXVsSGd2?=
 =?utf-8?B?dWdtL0l0ZUx3dWllVmFxYmIrbk9QSElnalpKenlySjlDK3U2STVscGhGbU94?=
 =?utf-8?B?UGdJTy82Nkt2V29aM2ZML0RTci93N0NPanYwanI2OFg2aGwvdEJaZHVMNzRD?=
 =?utf-8?B?dFlzYXRqZmMwWXo5dXRvdUd3V3k1WDQyU2YyOUtSbENMZEgvL1JhQnY0ZnpY?=
 =?utf-8?B?UGs0SlpiUUE1ZGFMTTVEWEk3VkF1SEtHMFdhSU04RThWMElESnJ4OVhpK1pO?=
 =?utf-8?B?OUIyTzIyaTNBaUJNQjM3YXNVOEdKSTE2dzdNZ3Q0ZWtkNmUrMFduWVlZMk1H?=
 =?utf-8?B?SC9FY1VmV3FxdjJRaXoybTI2QWZWYTRvSDl6OTkrQk9XTGVMb3dsanpENmNB?=
 =?utf-8?B?M0txbFUrR0Y4dUlVRS8vTHlyTkYzUWRKMEx0SCt3OEg1L2dGelpZbVVIRUJk?=
 =?utf-8?B?OTVMZFErcytQZDRwNXhsMGNMYTQ1dlpNaWpUZ3gzSFRqZW5UQUV0b01YMGtK?=
 =?utf-8?B?WkJCV3UvK0tqRlZuZThWMzJsbmM5azBTN3l3M29DLzFaUHYxZUp0bU96M0kv?=
 =?utf-8?B?OGpKQzBITVFiSlBBalI2Qm1mcCtIemdlblMzWUhhUm5UZjlieXM3TVVhRGZl?=
 =?utf-8?B?SDFzT1llWVpLK1JsZnUyWkZEc3hSWmIwNWJhRTdQMGs0WnRpSTJUa1NVdEFN?=
 =?utf-8?B?VEJlZktLVEJPTUYyellKVGVZZFRHZmd6NytGNlBSUTJheUIrczdDQXE4eGJJ?=
 =?utf-8?B?V0hmTllSdi9zMWpKMmsyampmZGJCVTdlU2JZMnMwNE9GUzFwczNpSE9pRXhm?=
 =?utf-8?B?R1g4VVhNRjh2cjAwZ2xwdnI2R09udGo1NkxUSDJXTkxwTmFDRk9YMFllLzFV?=
 =?utf-8?B?T1pnOFRnc0VZRmtuWG5Fd0Ivcm9namdnNTVKd0ovUWNQdFc1bVVuNTNtaEdx?=
 =?utf-8?B?Y3JIc25EVkNvVzFGdlN4QnAxcm5DdnVHUElXckdWRnh2c29HZTk2bGhEQndv?=
 =?utf-8?B?RlEyRzkvUktHTFFINkU1R3J3Um55bllFa25IOVArR1p6VE85eHdLbDZhY1Ra?=
 =?utf-8?B?R1ZpUW1HdTdzREM1aTFVcXJsQUcra1pWUnUvVEFINWhUMW1TMzV2WDluVUcr?=
 =?utf-8?B?U2hhVVNKQkwySlVMeUdEU3lxNnRKNm14RDhzTTZ0WHlJVFpkbmZsQ2NVSjlZ?=
 =?utf-8?B?c1JtczViT1ExR0NyUXFkRHViWGFqc2R3b2lpVUZ0RzduUDR4Zkx0QlZ4VGFB?=
 =?utf-8?B?N29sRUZTeDlCa2tNOHR6dmczZnFHSU9kckY5Mjh0enkyaHkxbnRkSEJWUVhy?=
 =?utf-8?B?OHcxVlVsNmhPWENhOEtBMjJWT1hmdXRBWVpiN0o3RXI3YUxtRUVCOTFwUk9X?=
 =?utf-8?B?cVVDRWU1MXZsK0V5WWhKNzJJZWlzd2RhVVBoekZOeXp0R2gxdDhTNXluZU1F?=
 =?utf-8?B?UW5uY0hNek9lanR2Y1o5cDFrSzIrYzZONzdBRGVTanZXZ0Z0OTBSUHU1YkRL?=
 =?utf-8?B?ckRhZTgzY1JodnBWeHBuMnkvanRaR3BrUkNtVy84Yys2MGs4NnRpVmE0SjEz?=
 =?utf-8?B?RVJFcE42TjNPeEFIS09UNnMzWDNjNmpkemtNVlRVaG81L1ZsYytIWTZ5YTQx?=
 =?utf-8?B?eUtndWlraGVobnhTT3cwRzZDaFFhYmRYSWtYYzVQem52UHFMTTE4MWpTZ1dV?=
 =?utf-8?B?K0RIUy8yWm5rRkdjS2hMQ2NMcFo0NzVQY3FWcjRxTDdGamIyV0xiVlR3ME5t?=
 =?utf-8?B?NUxUNG9ra2tyeFVudTNYa2doUlZjc2h3Zlh5WnBnc1dTVzQrSkpwQVhlcFlB?=
 =?utf-8?B?dUxMd3d6UlM4dmpiZWx6OTQ2N3dOVm9JY2I1V2VWR0UvZWlEYWN1V213VzBl?=
 =?utf-8?B?L2dpL0xkZGNRZjJRcWZkdnhPZjRzLzJpeFBoMDdrMDg2TWNKYmVnang4S28v?=
 =?utf-8?B?RHBvODlhNW9yU0pReFBYZzhzMXNNZWhoVWNmOWpWWWFJWUZuUTRaV0RiSUdU?=
 =?utf-8?B?em9vYnQwZCthakg3Q3Zsai9JclRnazJJeFVNN2pTNCtLYUFUWWlzNDMxQ2pa?=
 =?utf-8?B?Q3JnTWhmTDZJN0lLV0lHL215RUZNREc1VXNCQ0ZRQ0JSTHpWK1V5N284UVZR?=
 =?utf-8?B?VGhSWmRmSDU2K3F3cjFNTmIwWTE5Wjdadmw3NzFDV2xMc3d1d2srQ3lrbHp2?=
 =?utf-8?B?SmxlNk5zSGcxajUzZm5iTWpzR0I1WXJmWkdtS2QrbUhxRmtnSndHRWRpNVlT?=
 =?utf-8?B?VC9tM1BCRVZ6UmdJMmxRcWpOVDNiUGVQSDVTcURTaTMrVG9nZGo2TnlWdUM4?=
 =?utf-8?B?dzFFTmxYNmp0ZDJzSzhQR00xa3ZLQU9rNGtHTVNaeHU2OFBCQ0xLZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0452cbb-98c5-4efe-c1f9-08de8e84ed25
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 17:51:10.0703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSsvCeIKKVf2oINegn3tsCoxJu46LDR69kdDsNPjfi2FvKWtaKgBv39sMcybTnqRrnC9rKtXLG1agMoZktZJBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4229

On 3/30/26 7:29 AM, Alexandre Courbot wrote:
> On Thu Mar 26, 2026 at 10:38 AM JST, John Hubbard wrote:
>> Keep Gsp::new() from getting too cluttered, by factoring out the
>> selection of .fwsignature* items. This will continue to grow as we add
>> GPUs.
>>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware/gsp.rs | 31 +++++++++++++++------------
>>  1 file changed, 17 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
>> index 2bbea1db0238..60ea730d1bd5 100644
>> --- a/drivers/gpu/nova-core/firmware/gsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
>> @@ -146,6 +146,22 @@ pub(crate) struct GspFirmware {
>>  }
>>  
>>  impl GspFirmware {
>> +    fn find_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {
>> +        match chipset.arch() {
>> +            Architecture::Turing if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
>> +                Some(".fwsignature_tu11x")
>> +            }
>> +            Architecture::Turing => Some(".fwsignature_tu10x"),
>> +            // GA100 uses the same firmware as Turing
>> +            Architecture::Ampere if chipset == Chipset::GA100 => Some(".fwsignature_tu10x"),
>> +            Architecture::Ampere => Some(".fwsignature_ga10x"),
>> +            Architecture::Ada => Some(".fwsignature_ad10x"),
>> +            Architecture::Hopper => Some(".fwsignature_gh10x"),
>> +            Architecture::BlackwellGB10x => Some(".fwsignature_gb10x"),
>> +            Architecture::BlackwellGB20x => Some(".fwsignature_gb20x"),
>> +        }
>> +    }
>> +
> 
> So in v8 I pointed out, on this very patch, that this method doesn't
> need to return an `Option` [1]. Which you agreed to [2]. And yet this is
> unchanged?
> 
> Oh, actually this is fixed in the next patch, for whatever reason. Why?

It's an off-by-one error in chosing which commit to edit during git
rebase.

> The original match statement was even exhaustive to begin with, so I
> don't see why that `Option` was even introduced in the first place.

Because at various points during the many months that this patchset
has existed, there were unsupported Arches. Turing, for example.


thanks,
-- 
John Hubbard

