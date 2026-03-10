Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012063.outbound.protection.outlook.com [40.107.200.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD03A900B;
	Tue, 10 Mar 2026 03:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773115024; cv=fail; b=TzhWWpqaQB5u3rjQqhGkY8XWnSlOwFO7vxAuFI+yRZcw7aOKW5+eQnSjoAW7NyHF7yMRn5YXuof0bhtHp3/o+8aB2KtcQNhrcWAgYrROBRl0nneogRP9XGHM3NT7GkCIkbOn1Rzr8ihSAya9EG2exB5D6nve83OMfoX7j24SRsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773115024; c=relaxed/simple;
	bh=q90V8SpSAHQB8IBUSh0pAzRLfQ16A+aEErUReQXYwrs=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=pcpJSGela5qOb1KOqQ0/wJ9EheKYNw7iXuKPGPrdBgXYwTfM36zjILXRfUGIpzLCcXeTIJYP/J/TpokwOXqKV7eqCqvwTYP4lIa1HYd6NYctCRx68hYgu/9JbGJe+4HQG+ix95Jn00CyDdBR56u9ccutMqsSHZH4tVgM6e9i3CM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MGiOJWAh; arc=fail smtp.client-ip=40.107.200.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MGiOJWAh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0bhmZYV3EtotTl5XCshSsNVAFWsvcFdWJjWrwLd0JD930LJHKoNjJXl/1gfhaVntP4Gyxxp8V08KuEOolsZt4p+VPE9CrAcDLr4x0ZHxqpmq0SrGJblhhEh9+Bp2BbdeaeWJAm7FQS7f1KJkWWIZyAZNdoyGCNSA8o51lpEhDrDd4IyULspra8HA1UbesG074KYJ4u4PeVLmpxiAo48I/ehyPY84FJ456D0hGmSmEZlFklA9NWNuScgWuouUSKBOyHnDqXQRYtJ6zcQB6WsJ/wR6uyfzitxVCpikS6+Z3usXQ1pqLex9dtx9Y9KCHFSn/bkRjhBlwwAeaU6yAPDWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6r72CTYEBC/ysZMHQCMGlBRe3G55mwezIxuaBvTHg0=;
 b=YiMeP6UKeyf+d5IpbPI69Ua2RtUlEKKM1tQYFBQh2N2vntMaPg/RTy4fC3tgsQj5PrAslFbC2hzK0IaA7x2cV4Cf0TRCUNn6p3nhPXlsOzpniDrm79YFEcUUFRrU6pEF7ERWfvo56uKT4g45pcSJAKDCMHz0zj42Uzo/Me1ZzO1LhkHAAFCR7vyuf9pIABjmQBuEN1PqBzApQB0bkYJGSO/y7UBNL5jP3B+Urb/Jv80AvGRQMN1iN4ct3LiF+def6Zl/XXFQUBxNllgbo7GuO7glcVCbwDeuzwM7Qr4PLeR8oPG/bniDti4YjvDfYszOl78bAcIlEZ6I5jWPFpvMtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6r72CTYEBC/ysZMHQCMGlBRe3G55mwezIxuaBvTHg0=;
 b=MGiOJWAhQ9iI/vrfxyQGWB09YkgmbdR16SL54x1knKChFg4dB6O4GI1tnLCeEATeSNeIPPyFQ3AR0eT0/B52IvvICsTjNjxuvD3WcxOHQ5kC2HFGlVGeaM82frtA8E9eDnd1jPLkRv/woXr0t1Eh/MHb3fWVrpWtbuyNRiFmxdo+XWWmuMHH5jNIJZ14PmGAfBXFk0C5/3L2wBO1keFoWUOYQbFwQbxCQSZnZcRhoOhNMNXfVW/+MgCkAMXpZiqZZcJEL12/tyanURH2Wi1aduc/QTkPZJSL5qmOAsbwrwFEgexiMrleMQKm5OD3B0iMZWpfFoJjtORfQee7p73jAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7822.namprd12.prod.outlook.com (2603:10b6:a03:4ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 03:56:57 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 03:56:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 12:56:52 +0900
Message-Id: <DGYSTBMF931L.3OV1I4IWUW4ON@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 <acourbot@nvidia.com>, <aliceryhl@google.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260309225408.27714-1-dakr@kernel.org>
 <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
In-Reply-To: <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
X-ClientProxiedBy: TY4P301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: afd5f153-16b0-470b-3ef2-08de7e59129c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	SmM4K/rJTr2rpE4gkS7AEjtdqkBfTltlEFwZPkBb+Hn/JrTU5SsC2yO+3zHGRNjtHE7ykJZGwnc4UTxUApjnEekBlkk5u4jtQyzHh1uDCirTOZLL0u5tQFoIOLcXOR1jmraHs3Mvfe19aJI238jV9LQwQonUcNxA7gCCMSr//nGWzgnj45192VFE9hs8wCHlS9yQ7jpFY6ckszLZ6OrEzpjVvEkVBZQ+3jFrn5GvdVUSsEjfJFVZfkEnrzHaS83dcTlHCD/W5E5gpEiOV7E3IMS02+mgmWNTTMRinwbvT87OFtz7vdtfvfPFF96QWcGidG14VdSbPLhSTj5CO06Id6BzegzENnuTvyQbG/7MnP52Hhl24d2AZdhEVFBUsTN0jygW6liI2l/HhvRy8QgQ89Yntvs3GsWojS+J3WRRfVtCuiVUBSFbvQfHKvE1lOBwuylQEwcpRgCy8L8AZx39aZDvnusba6/bNMFGzyRacZv2+5zkIZ/PGrn081iUj0JAbSax4+iFR+eibnrV2gtXXztoIJVatENV7MYA2EXXwMewmwSsFBKj49ZpuHIZKY6dgFKiNbR9PwByiAOJkO9loWHt8RYZUCWepkwr0X+3WeNf3s3S+m2615Rva6TGUmJo3UUIGy2zJP4C+0dqEQn2DcXZsNQe0wsYgvglwOer0LrA0DDdRbXDFE8Wd+FRserx9FOOeJm57wCUOKdudmh3Hqm/AZhlkzq4CCLDkNhM4DNRb+XSw2hfTD2gJZGevgNe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVJVU291V0xWSnVLZG5CZFh1SndzYURJSXpTYVQyR25OZnBVakRaTzFXdyt3?=
 =?utf-8?B?SFUrSHlkVG9ha3QzQlI1aXNKUUNBcDZ5bG55QjVaZDI3a1d0OVdIREIxU1RU?=
 =?utf-8?B?WDZ1dzlQaG9WdlljRmRLVnNRYm1pMUtXWXNaaTgvYWZYSXZOTEFPU0E1bEJJ?=
 =?utf-8?B?Q1RUUlp1SnZQbzZwanFaRi9hUXFzVGszMUUvUDl6eDFVZ0N2WXhLZlhiOC9M?=
 =?utf-8?B?TysvTmxhbDZYUDAxQVNtRkltQVFQbVQ0ZWVoK1lNK1JVc3Vtdi9HcWo2Z0s1?=
 =?utf-8?B?ZHJHNk1DU1dEd1BjVENHNnZaTUEzQ3ViV3cvS1EzSE9UdUlxN1pUVjhoN2FZ?=
 =?utf-8?B?N0tudFh3bm95VmxXS3ZEV21NcktFSU80MzRnTXVjUldRTDA3anNjaXYxd0VP?=
 =?utf-8?B?dG13dThYZWtRSjZ6NWEwd21rMHBLbkJCd3l6UWdBMnc1UXBtV20zbUEwY0ZD?=
 =?utf-8?B?MFg0YTRpdStIWDlaTEtaM0VjMUpEdnR5RmJqM3RwL2NmSlY2Njh3VUpMb2JK?=
 =?utf-8?B?L1B5M2JjeFVPMW9oWWxOaEh3LzV6citMWUxJUkRNSUowT1Z3MzFZc1RUV1Vo?=
 =?utf-8?B?VW5iSzRhUldnME9PZldKQ3RhQ3ltbkNmSVNOWFVhWi9NcHBxbHd4Zm1majFY?=
 =?utf-8?B?KzdhYTE3RTFmTmtsNVJtaFVVR3QrczhCbmRyVTZ6bGFVUHlUR3VGSXFsZm9K?=
 =?utf-8?B?Snc0eFpxN2JXb3d3dXIvTHhkQis1eWNjYW0rQ0dCQ0dXK3UrVVlYNGUzNUda?=
 =?utf-8?B?aHFzakxIQWM5blFTUXBveVpxSHFGN2MzS2kvbVkyT2dMay9jTlM0RzUrRFlU?=
 =?utf-8?B?WEJPSWdnLzFGK1hVLzBZOTN3TEFVeHBkQ2xRdGVrUklUU1pNSExDU01pQlVz?=
 =?utf-8?B?TWJocmswSStsTG1ZbWVmRnA1R2NKZHFlTkNEVEdMTmx2SWpnVXJyakF3NktU?=
 =?utf-8?B?R29OVDh0UUloV1ZIODBiLzlIUDFlZVhhL3J1MjNiVkJoN1FHc0s0Q1NGaDV2?=
 =?utf-8?B?dmtSZHhmWFUrNE1vSHRaay85aWJlUEkwa3RmZDNCVkhWaXNLNjdTZFNmanI5?=
 =?utf-8?B?RnRFZkdnSTJxMllsUVZMOCtZMmNOODh3S0hORkxZenlodTkycmxzcllkUXYw?=
 =?utf-8?B?dTZMbmJMbUdzUXNUMUQ3Qjl5anpDMUloUGZTN1BpTXptN0NqVzFlNzlTMjVH?=
 =?utf-8?B?U2M4VzdKZDQwUUhGcDAzUVlha2V0NWl6dEVvR0U5RmFXbFpyc1dJNzBmVm5I?=
 =?utf-8?B?NmpFaG9pUTdlYzFsTWVBL0J3UXFZdE83YnJIUnc3SXdlWFVxSFBsbCtIdFVZ?=
 =?utf-8?B?aXpwNWxtbmw0cHNmUEEwcDRBWVdUeENxRzF2TW5MZUZ5azFLUEFuaUNLSkto?=
 =?utf-8?B?U0pZb0xldzBvUVJBSXQ0T1V1Q1g1STEzbmwweUpzellFYzRxd1ZOY1hwM25Z?=
 =?utf-8?B?aDM3Q3hvVm5EZmpMNzlObVRzL015aEFrNkVnTVJqVVlBZyswNng4KzIvZENG?=
 =?utf-8?B?cWJPVXRDUkU1RjVRNDNqcTRDVWlpWUhhbCsrRjhwMys0MzErbU56YmtacGlT?=
 =?utf-8?B?bWVOMDQ3aE9ZSk9BeUdxQUxGYitJTitZaUZlWS9JTHV6UFdYYVY4QUVaZFp6?=
 =?utf-8?B?VktLUFZSRHgxZFJRMEMybjdzcnp1UkZnVUl6dThNc2o1Szl5bFJLUVZDY3U5?=
 =?utf-8?B?T3dxTmpzWU4xSEU2U0hJSzc2a1k5cFZsUzFzOUtUWHd6VTJTcFE1Q29yZVl4?=
 =?utf-8?B?MExHUnZTQmpkeGlpSDVsSFlXSlM1Z09VVUtPdU8xVnc1Rjl2Q0lpLzdhK2ZW?=
 =?utf-8?B?YTJzN1J0VTl0SXFid29kd2pnOEdnZVUxcVNCTTVBU2pJdCtjRkRFNVVOOWo5?=
 =?utf-8?B?dlUwai9ncTQ2MmxlVnRMK2Uwb0MzOHBYMmc3Z28rVjlUd29hUnBVa2lvQ3ZR?=
 =?utf-8?B?M0lsUG9IcUdJQXlUc0x4V3lhL3JoTjIwc3o1SjNvamV3UkNzcFVYM3dDRUNZ?=
 =?utf-8?B?WWFXQlkyR0NISzNCWFJjQ2IvMDNEVnBZMmRITnZyV2RZTWZKUm9Lemp2TVdV?=
 =?utf-8?B?Z090aHl6Q2RIdjhaRTg2b1JOYW5YNFBTT0JCcjhNNERIN3JORE0wdW9OVTJr?=
 =?utf-8?B?c05NcmZMK1pScTNnNFhXM1U1RElhZGpCTXEyeUpHQ28zYXU1VDNLVzVaUnA2?=
 =?utf-8?B?azdnQVFxTHNHZGZ5T2NTZmJwZXJFNFBZUDVEMmlhMlAyRkxwM2FBaktlaXlC?=
 =?utf-8?B?WHRoTk1aeG1GU3lRa0tLZytxOUpzSHFwdXhnbkdZZW9VK09IUlpQNnFBWndM?=
 =?utf-8?B?YTdoOEVTeFB5cTAwZkZ5U2lJVzR0amdIUEFtN1p2dzJzWXVtemN6NXlWNzZx?=
 =?utf-8?Q?2GZ2JK8/GpeozapYuFrfFor8jYQ8Gmgc8iDKliUERIl21?=
X-MS-Exchange-AntiSpam-MessageData-1: gCzbSYMitg8Ntw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd5f153-16b0-470b-3ef2-08de7e59129c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 03:56:56.8335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ls0OoQqiu4NihSsY1rM8OetbywwQtCXdiPehDDbEviHJhUKi+FvbnaBP3avqpslRB968MUlWS9C7csWiDngaSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7822

On Tue Mar 10, 2026 at 11:01 AM JST, Gary Guo wrote:
>> +    pub(in crate::gsp) fn advance_cpu_read_ptr(qs: &CoherentAllocation<=
GspMem>, count: u32) {
>> +        let rptr =3D cpu_read_ptr(qs).wrapping_add(count) % MSGQ_NUM_PA=
GES;
>> +
>> +        // Ensure read pointer is properly ordered.
>> +        fence(Ordering::SeqCst);
>> +
>> +        // PANIC: A `dma::CoherentAllocation` always contains at least =
one element.
>> +        || -> Result {
>> +            dma_write!(qs, [0]?.cpuq.rx.0.readPtr, rptr);
>> +            Ok(())
>> +        }()
>> +        .unwrap()
>> +    }
>> +
>> +    pub(in crate::gsp) fn cpu_write_ptr(qs: &CoherentAllocation<GspMem>=
) -> u32 {
>> +        // PANIC: A `dma::CoherentAllocation` always contains at least =
one element.
>> +        || -> Result<u32> { Ok(dma_read!(qs, [0]?.cpuq.tx.0.writePtr) %=
 MSGQ_NUM_PAGES) }().unwrap()
>> +    }
>> +
>> +    pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &CoherentAllocation=
<GspMem>, count: u32) {
>> +        let wptr =3D cpu_write_ptr(qs).wrapping_add(count) & MSGQ_NUM_P=
AGES;
>
> Not really related to your change, but this `&` probably require a commen=
t, as
> it has different behaviour compared to `%` given the `MSGQ_NUM_PAGES` is =
not
> power of two. I suppose this is actually intended so there's a way to
> distinguish between empty and full ring buffer?
>
> Best,
> Gary

This is actually incorrect and I have fixed it here[1]. I think it
should be merged in drm-rust-next now.

[1]: https://lore.kernel.org/all/20260129-nova-core-cmdq1-v3-0-2ede85493a27=
@nvidia.com/
