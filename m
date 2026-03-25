Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3C93C9EF6;
	Wed, 25 Mar 2026 11:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436819; cv=fail; b=kF28zMaHLwaVETdZcQPzifFOzWZ0wb3gzRqWK8UbQ1le0q/FNMp/IAxuCO74kX2ydcf8jpjmM9jp8uTZkRFSoN8Mw9DUVbfjrJ3mYWDOoTWVrO3V3lVzVzslVGQp8SZ2vwS65qWDbuL570y56wS2rlvKiu2k/XaNfAqWjDPIvBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436819; c=relaxed/simple;
	bh=gXh9kSqGLp4Ng6QVAUtCla8qBdk/ARaCU4k9ZAqR66I=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qDEUEme2Op66Pz+kuVpNgfuHs9M2x+YhXktPgbV45qz9lFGkjd22RGV37+t0fBOX3I74zC7vd0ETFxV/wgROSNm9HpODRgOCk1Fiv4GUv+c2viY0wT6VAt9QyUDW5afwTz5rQnWSqrGd4t87c3YbSPlo8LUEPKatsWpS3J9HtrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CpUwJZLb; arc=fail smtp.client-ip=52.101.52.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CpUwJZLb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P75Lag43SSMVrwYgzp7ogwTk9wtYUdkVg55h+tlUPW1MoLrTUFVdBpYKrYgiKvcCZI6Ei0uurD86tc4inSwLymx+gQQoI62HeQbnGx7sDcG5zfJbNNIjK1SyvZiXvQx+We3gsfetDdxPLen8v0H7bih71ccG+9oLMLp4sawGE7uyXwRVYupoN/A3suzPzrapXJuxVuTWvwP7iE/i2N66gxMG9rPmN1/+fXYouD/EA7tl4pIb/jsgSJvTpLgN+Un/I87EkPIE71nH8C0u8l3wW7X3tdX6kvoUxrt3WrA3v+H7Neh+9zUBG2t4+5xnIMCFWZPZc2IjAH1ZsSVDN6rVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dti3DXkNwLiRWp7WE0kcmrVXR9SRHNjdjdudGhvU1q0=;
 b=UcZ1lWSTMoSrZohavHgp2AIGbYaRo4b77KouIc+9IKHr6Kxua5hjlNdIPtxTPOKH2OaLNqCf2gnQ8TPWKTaV9N21MWCF6Hai+BE+goInjVmfBab2xRYNhT+Fo9GU+EMDsrZG+sgWN/01AU1Bp8AS7gPDbImDIbWm4pEVslF4LIfGBPUoBBnXtoRdO+4RZu0UhqTgecCf1a/rdeukEpWTZKbNx+rpc7MjFHV501yLxeRRZmk2ywDnkGWE2LW21zr1fPHKltvt2t7OCLPyNq7qUxDRLzxpvw4+598i38yM9DIzkdmL6SLgrR3azCsaGM+GNfENEkYdowrE3TVRBQ6uxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dti3DXkNwLiRWp7WE0kcmrVXR9SRHNjdjdudGhvU1q0=;
 b=CpUwJZLbrszFs8nO2XKFQElj4PDtMEYN+FGhPyEyM9hhczAy4wYFdsf9w6ZieyRccfhSOX7mPt1pSJVM6GNFK0anQusmGZYrdNS2o6lSGZsYTfcywBsIglhqAB6RbJo4uYdiYjOH+CqCm6ct3ICw6e/ctPecq5z+tMNWOLCLL7T4o39RdCD4S/CVCZUT5eJkUGWaFMQWm9Ou/gdU6Yb0xv7EKKeMgk3cUKCG1Rr+Hq8b3rVgdzekr8Lpm3cdP+jNpw1MeWr2/aoGcpsD5qs1LnN3lIxztDYsw7bv6pOEMfGms1V7aRaTLn/vozlX0OBE/EzF6ItQGCjEyfl+BjbsSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB8498.namprd12.prod.outlook.com (2603:10b6:8:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Wed, 25 Mar
 2026 11:06:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 11:06:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 20:06:45 +0900
Message-Id: <DHBTCMREXRBS.3RLSMFX8U1RXC@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 07/31] gpu: nova-core: move firmware image parsing
 code to firmware.rs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
 <20260317225355.549853-8-jhubbard@nvidia.com>
 <DHA6XCMN83HZ.35I7YETBZUV7B@nvidia.com>
 <b3780f18-a762-498e-aac5-6a0938d26c5d@nvidia.com>
In-Reply-To: <b3780f18-a762-498e-aac5-6a0938d26c5d@nvidia.com>
X-ClientProxiedBy: OS3P286CA0084.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f6::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ffe1569-c12d-4173-c9bf-08de8a5e9c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	TDJKRYj5qBkESMzry638uw0t4axPqMHg5wqPsnLTyX/4CrwkdGPOc0c2VcW+M4YeFqAoR/UD6+pao4d92017wq1SPueqGT3k4CUYNb3m4yOTrkkHU3A1/SSOMCffvoVCC9wkXv+fiXB8wJJ6aXOPu0kALuZ+LERNqXXbCaMH7S9yyp5VgLLhNxvqxS7hTJ1y902ssR1T7IpXTx6q5zHXhI+HUdy8V9/RDF48KyyonquIN4/L/6yTQ+zXBnwb1lbWuifjC9N2Jyd/EB0IEZ8Vb4x+x9ToaLcZjmYGTnl+4tWwxwJw6Us6xzo708M2lvztbkeWiaHTCqVU2etu/AHsRSzptl/WrDjJzdJZrbI/SjFQpXUpMGxZ1vSlbXwFhZGJsgE+OXdsnqhiGgOmktil/4vXpAyaxmFEzpB9y3GoLOXNs6SCbEguU9tb/By0IXPb5OdhmrqzCL4YuMqY9kyKtAyHRU2Au4dxxWo4crXzWBaL/NhZUTkIRuNI/HVB7hytrOjy4GCGq3FGTeznxVAuFagYh2BCL/YE9mRDRhTEsLEyVYOrz++U0V3lgkEukoJbgaY/mJS6yZvs0EmRw341m1hRhBkmoBPktrbgk60bWe1Tb8lbHMQ3SXMYHmv6Z/ZLfcNFhlkK63i/NqE+p7WunN48J3eGwAWmBx3AZVtx3O0JXgcbFkJdP4+hHI5Ggxd7Dl+dOqeQrSmuG/Yt3Gsw+1NxXzKXPozZNQOo956QSFs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFlLbWIrRDJ3NzVxRGw0blh1ZTlRVkU0bTFwekdmcmhGMVMvdldaN2VrYktk?=
 =?utf-8?B?MmJMdmRZOFdIV2Y2YjhhZFRGR1RLVk1jVWdmOWFvdWoxQ2x3dnZwMnBpaDZy?=
 =?utf-8?B?V25KVUtMd1c3RTRXZVZ1N2ZIY1JjOE1hQnMvWTNtc3ljZWJxb1RPeVNIdnJy?=
 =?utf-8?B?S0dPSEVBckE5T2VTNi9adHdzZjFKVmN4cFBoN0tRakF0aEZ6eTc0RlVJelBX?=
 =?utf-8?B?Z29udjJJQVRjZFl0VHBybDg0MHNib1pDcDZyc1BIWXRUMUlyNDJ5N256WVBy?=
 =?utf-8?B?V0xSaHNucnoyWjd3OWU4MENrb1NaM3drVVNza2xZa2Vwc3pyamhuak9haEd5?=
 =?utf-8?B?V2grUHVWc0tBQ2pWc0RRWXVzVU9yS0ppTnZoWHorNXd0Y1p6VEs5SjV4MHFa?=
 =?utf-8?B?ZE9RV1lFd2NPQm10Q1VBdWhkL1FsWlVPdURSTzd0NnM4N0ZSMElrUU1ZWEF1?=
 =?utf-8?B?MnJRZENMY0Yza2RWVy92cDRzRmJkWjkzcUtUeGlyUTgyR3pSdjV5L1l1bU5P?=
 =?utf-8?B?cElIVlowcmE0ZVh3aTBUdTVtUkNaa0dja2pVSDRVa1pDQlFQbmtMY1pQM2s1?=
 =?utf-8?B?dTl1R29EeDdjNkp5bHZZQjNZdDVvRkJlWHZCWEJvZ0dOdlpxMTAzWldPMFBv?=
 =?utf-8?B?Mkk5bXZlNEVOaUo4d2JYTVo0RzNncnRmWTB1Q1lXRnZSV05mbEI3V3ZnYWRK?=
 =?utf-8?B?bkFBWWt0OFM0eG5BK2F3bzFEV2dzRUZaOHJPUVcvYWNxTFNDdnRkSis4MEZk?=
 =?utf-8?B?VEVySEpqcjdsZkVBV0lyWUVCWmxSRHJLZFhidW92ZncvMUFPQ0N5VjNPMXRK?=
 =?utf-8?B?OVNRZmwyVE1IWjhrUi84dllWTFRFR0JDY2VzbVMzcGI5MU1aakdjUnRad3hT?=
 =?utf-8?B?ZnZaQ3d5TitsQWVGQzdsa0p4NytKeGFIZWQ5YnpRQ0loY0UraU9TSkNnekdB?=
 =?utf-8?B?SWlMeWRKSTFOTGlXKzg2Nzl6ZXlUcEh0bERnT05aL25oR1M3ejRLYTR3cU9H?=
 =?utf-8?B?aG5MdksyQVltV3ZjeEdhZFNNWWR6akdleVhHVUhpeEYwcUxLMy85NWcvaGsy?=
 =?utf-8?B?bDdrVWFiL0VnYzJqMXppVmc1NUMvVVlnQURrZ2lCeGhnQzVqZ1JZcnlRSXJC?=
 =?utf-8?B?WTNGY3kvWndDOG1FMFpHVHNLc3dpemRpWWdNYzBMMm9VNUx5ODRNMlBKcXl2?=
 =?utf-8?B?bzQraWtZQklpOUNST2ZIVFl5anZDUW9jRmhSUmVwZSs2eFliY1dCMkl4ZUZP?=
 =?utf-8?B?NCtlYlJnSWQwbVNTdzY2QllOYzdkMlo2YVYvZEVudllCTEY1WWNqWHlra3Zx?=
 =?utf-8?B?azZHR3BDQVZac08xR1hQVldtVEtjc2VnNDhkMll5aEtiUWd0V2VrV1d5QjdL?=
 =?utf-8?B?NSt2aW8yWm1TTlk3MHNEa3QxYVpBSDVtd0ZNR054Zm05MHVsSUh4bUd3eitq?=
 =?utf-8?B?TWQ4NkZZajdkVzRIMi83YzV4NmxYUm9HN2tOaCtnT2V3V2ZkM0I3WWdESkxm?=
 =?utf-8?B?ckZzaDBpSWhvM3diZDd2S1RySVBURUx3SGNKeXUxcXI3cE9JQUlNQzIxRkdM?=
 =?utf-8?B?UjR4QWZyWDFmdmR4MXRQMlkwZTBaellPYk9Jem1leVJMMDZUSUU5ZWRBbytq?=
 =?utf-8?B?Z1p2VmZxcSticmdMbHMyeUZwcDIxdW9CZEROenRpYXl6azFhUEFjUDUrZ2hn?=
 =?utf-8?B?QjloZkxVOVlORVVRSTl5ckJ4L3JXZWNWVndDUTQ5OGh1NUM2SHpIOTB6cHAy?=
 =?utf-8?B?NGZZKzFBcS9PWGZmYmJRbzNzeE5mWURIZ1lONFJGRkRoRTZHcEo3RW53OXRF?=
 =?utf-8?B?VE9qSkU4TCtOelVtTWNCbGY4b05sajFPRUcwenlpclkzblNLRFhySmUwNjgv?=
 =?utf-8?B?VFplVGNTNXl4ZkNnbGg0Rnd6MXd5czYyWTlNb0Y1UlBqYmcyQlJBTXRJVmU0?=
 =?utf-8?B?ZDdXbHVIUnpqWkh5ODZGY040dW5BTDdrWjRVZDZLRXUxL01hcll6cGlHQzZ5?=
 =?utf-8?B?WVNDamxBUDJieU1DanVtOGU1UDlZS2k1V2tCMGl0ckd5THcwdjlUSll5NkVL?=
 =?utf-8?B?cm9Ld3RVS3ZmVXRJUk9GZlR4NkljZEJCNVpQajhhWmZabzdaTWlzT1JseTU4?=
 =?utf-8?B?d3AycW80ZDJleVJLdjFhemRKdWZLWnZKdS82MEpxb3dPTExocnl1bnphN0Na?=
 =?utf-8?B?QTFJeXBmS2p4b1c5TlRrd3VaTE9NMHRTM2JGd3ZLcFdvamFNRlMrL09MS2ZV?=
 =?utf-8?B?ZDdNd1RDaWdBTWQ4dW9TQ2dGWnJQZ0tvVEEvek1xWktacVViWVFDcWtrV1pJ?=
 =?utf-8?B?VTB3bVhncWUxQngycm5kU3R6THhIQWdrUlFqaW8wZ3Rkc256cnpQcUp2YXJZ?=
 =?utf-8?Q?TEyU+NxsjlQRu8szuNUsE8nSOdmY6t59+gRsoxcp+OtZ0?=
X-MS-Exchange-AntiSpam-MessageData-1: sKGHmIWc0FAsRw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ffe1569-c12d-4173-c9bf-08de8a5e9c2d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:06:48.7137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3NKTamdcizfvrWf22yXMCtn8U5f5ZcmylvPvTKb+GTE/8h0/BSeosa1Jkf05BAKF5B7Vu23xXi/LQSlgba6uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8498

On Wed Mar 25, 2026 at 12:30 PM JST, John Hubbard wrote:
> On 3/23/26 6:19 AM, Alexandre Courbot wrote:
>> On Wed Mar 18, 2026 at 7:53 AM JST, John Hubbard wrote:
>>> Up until now, only the GSP required parsing of its firmware headers.
>>> However, upcoming support for Hopper/Blackwell+ adds another firmware
>>> image (FMC), along with another format (ELF32).
>>>
>>> Therefore, the current ELF64 section parsing support needs to be moved
>>> up a level, so that both of the above can use it.
>>>
>>> There are no functional changes. This is pure code movement.
>>>
>>> Reviewed-by: Gary Guo <gary@garyguo.net>
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/firmware.rs     | 88 +++++++++++++++++++++++++
>>>  drivers/gpu/nova-core/firmware/gsp.rs | 93 ++-------------------------
>>>  2 files changed, 94 insertions(+), 87 deletions(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/=
firmware.rs
>>> index 2bb20081befd..177b8ede151c 100644
>>> --- a/drivers/gpu/nova-core/firmware.rs
>>> +++ b/drivers/gpu/nova-core/firmware.rs
>>> @@ -457,3 +457,91 @@ pub(crate) const fn create(
>>>          this.0
>>>      }
>>>  }
>>> +
>>> +/// Ad-hoc and temporary module to extract sections from ELF images.
>>> +///
>>> +/// Some firmware images are currently packaged as ELF files, where se=
ctions names are used as keys
>>> +/// to specific and related bits of data. Future firmware versions are=
 scheduled to move away from
>>> +/// that scheme before nova-core becomes stable, which means this modu=
le will eventually be
>>> +/// removed.
>>> +mod elf {
>>> +    use core::mem::size_of;
>>=20
>> This import is not needed, `size_of` is already in the prelude.
>
>
> The `mod elf` block is a nested module that doesn't have `use
> kernel::prelude::*;` in scope, so `size_of` isn't available without the
> explicit import.
>
> Or some it seems. I'm not experienced with the module scoping game,
> and so I may have it wrong.

No, you are correct; removing them works fine with the latest Rust, so I
assumed they were unneeded - but 1.78 fails to build without them.
