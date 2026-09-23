Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022090.outbound.protection.outlook.com [52.101.101.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8AF477999
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158979; cv=fail; b=Pe99ReBcukVG9fMCKu732I46wYUOA9TcnD/pfc/5MHJs6IJuMeFiYHG6x9/FGnjyu4kEAnTe5pyUJMW8NEx0spi84gkJoCn0iMMMXZBYeG+ZT2e7Ra2v05ha+RXv7SEC4Ntizjq/q5Bzl0CedvdF6QPF6Ntcah2MSMkHIv6KzRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158979; c=relaxed/simple;
	bh=VkuKcXx+bwCi2CjyNsQ0Vo50+/WbOdHSvhG9ibwVInk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iy9+ZvZ+FqAwh058BjfeiPKWW0FipJ8nghVILu76/T2PJ4/FMnWcTleWvhjCZlkF54pCWZffv0XETrELJS0Xsk5ZPd1DeEA3yOXxo4B0XBShJU5KA7iRzuu674u0FBpduYpysu77jOxkoDKAGyVLw6KiR3OurPGZzYkv06cxZOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DPzHo+WS; arc=fail smtp.client-ip=52.101.101.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DPzHo+WS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdwZ/xoQiGb/umIOcLgzimRJ/G+SzikPzGheMklV0eo4Wd2zo37J15IBxsH3s/WtYSNnVeOH5QS7vjsSb5fYOCIBw3r7hBo/bxippFKrWhnaohMTfqGWp9ZjaxLTspXJyMFCiSRqwLtCF+eQLjDMnBTgvxv+6LgEiHY1V4KDZq0Q6+TzT743ulPlDQCXcy7/dUdG+T2BxGuggs6BZSBCcCQC76QgkdzOiRYgi9ViXcuETc4kDPkAbw+tOKElbJgCBtDsS9p7x42S7IiUtRBGB1rFPavYn1/KHURYtEG0SraKkYlo1RJJ9uxvno04vPlyfcU1alXceKJB1N+oQ/Ra5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hG+76dbPVZzrdRcewaTMIiO88eywREukiSALFRPI6IQ=;
 b=cL0iIzboUZ9SB+b5oEEhCIl4AenIhzq2BYpQFXnRdf0elHprbWIpGq34wbVO3wmphTJIYWTgbUo9cPR70AK/BOYzPeIr6f7OITg7j8KsPp8D9N50xAu/BC1WdtOcWI5ENzTNlldYHRQMk8K7/6M88oUJLYYIe/RZ8k7m8A2gYG2i9Ltn0DPjM0IBseqY8Q/aKYaVndGsT8BfD04HGyDX0uL97yEUHikD4oxKkYJnUPV9VnGUmgUN3a45aRaU6+qrgcf8FbibuBY5ayKfDczdud/QVZDfVUyhxT4Kd7RRHs9TXti9Ee7URpZ/yLuLSeu4EaDBgdnTN9wGoFCIh6O67g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hG+76dbPVZzrdRcewaTMIiO88eywREukiSALFRPI6IQ=;
 b=DPzHo+WSMVmuhRXtSEmYpDbhrGaECYFbrIWgMV2gYMWJcQce+w7PyylopwINxJWBABHfy3o32lGKDTx3Iiohz3KOtxaBVOQ2Amnym72saa65z43CysorRNvltKAF/Zb1wWAZOFDUu3nDMZUcDFSp3S+ex4DU1qnESploZ569E6s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO4P265MB6217.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 10:22:55 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:22:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 11:22:55 +0100
Message-Id: <DLMME808ZLTS.XVZ17WEI9S9D@garyguo.net>
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <anna-maria@linutronix.de>, <bjorn3_gh@protonmail.com>, <boqun@kernel.org>,
 <dakr@kernel.org>, <daniel.almeida@collabora.com>, <frederic@kernel.org>,
 <gary@garyguo.net>, <jstultz@google.com>, <lossin@kernel.org>,
 <lyude@redhat.com>, <sboyd@kernel.org>, <tamird@kernel.org>,
 <tglx@kernel.org>, <tmgross@umich.edu>, <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3 1/2] rust: bindings: set HZ to CONFIG_HZ
From: "Gary Guo" <gary@garyguo.net>
To: "FUJITA Tomonori" <tomo@flapping.org>, <a.hindborg@kernel.org>,
 <ojeda@kernel.org>
X-Mailer: aerc 0.22.0
References: <20260908230445.2430296-1-tomo@flapping.org>
 <20260908230445.2430296-2-tomo@flapping.org>
In-Reply-To: <20260908230445.2430296-2-tomo@flapping.org>
X-ClientProxiedBy: LO4P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::21) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO4P265MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 48471e18-adec-45bb-58ac-08df195ca20a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|23010399003|366016|1800799024|4143699003|56012099006|5023799004|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DxLOd0ObQ1p4JIAHJtAHS/mEwnicOAASISH3AkNeB0hMQbHuxnd6/N0Nl3us7EVxHlJhMroZt0e7ZJWpwAROK8Z1O8TyGB38dFFSvh+6Z0s3QKvIi+RaJTsnbIpgziNLEzf1r9Rk6jGXSkpb8tgkDPbKm5s96hNgDXzk+AhhsBMzDBl5kt14C2elTeulHO9Be+/o8YSXR4NMmkbWbKPIz6LUqXaBqzxz1ZdnV2DS/IHHD48Wi1iJfpVOdvPPbdW8miESdAFj2pHQcd81G6HQrbYYogllRtwPkUAzQBT1kAdMqD1GyWxBNVD89ctLeJ/dJs0yFy9ZGUlpxqCZe95ofoZNRsv9UzCXIK8/WKAWbTA88+E50YLeRINVgXXS2ztvsJ9I3/CM4Aw6hZ2Ddo1M4KkfeNcmY8c+aYcOCjHuBHLxa5EHRAJqNzEaXLBWVqea47XaPsGsUPRnE9yk4G3F0CnO1AlrBoDVJZbtrbh5ODl1i9EHLoiv34GS1qSCr6M558GtAe7UpzcTYS2wRc8ueKs+myHDa1IYGgyGgPaJNfHGDsN84j8cD0be1DCmJbQleazbWxFkESbKTha9g/1MBDYoBjVEk2dkh52Uk2mDNoX/E4RlFvEWxMTLiyjBIw4Yl8pH4r+9v48n5JpiebQ/f8LqG8nh3jJBin6Xxxab008=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHh1TEorQmpSOElVR3JSWjZZTFdNU3BGSHNBWXkvWEszc1lraFJyTkh6dXYr?=
 =?utf-8?B?NnhnbXFYdHBibEtWakpQMzBSTHlKZEFCanZCalhlMk12SktrcnRiZnVrUWNt?=
 =?utf-8?B?STlPQi9nSnV5TEhtNjhKMjlzcFlKSTgwLzBOQnZnbUx2dnNQVXFJRDBvSklt?=
 =?utf-8?B?MEJ1OTZLbGh3M21wMEliUWpoZjQ1NjRqaE9jUDJSR2ZuL0M4UGErcXh1NDBQ?=
 =?utf-8?B?NmtGL2M1VTNxdUlZTjlUbm5DRVIwa1dsZG0zbTZEWEx6SHdzcFFPb045M21X?=
 =?utf-8?B?Ym8rTExORXZSMDRxdFNYd0F4WEVEMDJZRmh3S0NUbUpKOE9CSXNHVGV6U053?=
 =?utf-8?B?T1NkaWk1UTNTVFkzOXgxU0tZdzNnak5xbHhNNnZlUFRvVjF2YkxPT0RSSGZ5?=
 =?utf-8?B?a3lzbFhVcFVkNzVWNFUyQnR4dUwvc1MxUHR1UDJ6N2hQaHpSMUV6VTJpSHhh?=
 =?utf-8?B?VVBuSTJqTzhwR3BNclh0b3AyMEhnZkJ5TzhYd2dPQ0xEdERuSmd6T2F5bWxV?=
 =?utf-8?B?YXdEOHZpam4zbmY1SGV0aFUzZzVSbURUZjR1dDlLSUJ4Vk1YU2U5WVg0VFQx?=
 =?utf-8?B?cXNhT2d6TGZLZFFISmN0Y20xdmkzdDdDUFh0eXkydWs1T3licUFVWEViSlFO?=
 =?utf-8?B?Q21JMC8xSnJPK2RLOEpOYVQyUk13US9nZ1NkQllqMGtXRzVBNk9SZGgvRW1D?=
 =?utf-8?B?ZkE1ZElaVDZEWVV3SS9SSUgrdTF1VVVEZEo2eHpRS2FJUkJINjByd0hyUTJB?=
 =?utf-8?B?NVRhendPcEs4SjU1OFhGMy92MzFMVmtMcFF2aC90OFVCa1A3bmUyWFpLSGxI?=
 =?utf-8?B?dkJpbmkvblRXdGw4N2ozYzJIRTh6S0lPOTFUbDFrS3oyVjYySyt0WEhINFBZ?=
 =?utf-8?B?bGRpRjMyVS9WaExYT09HbVVKV2ZsUVFzdVdaSm1TU1BqdER6Tmd4VXQ2ZWtN?=
 =?utf-8?B?U1FyN2xMdng1TVY4bzAyWUp0MjZtQ2JTU2Jla2o5djJWWlE5NUhVNm9ydUhr?=
 =?utf-8?B?MUNCOVg1M25IaEoyeTlwT1NwR09ZN2w2ODNnN2M3SWd5ZWhyRjRYZWgyYmJI?=
 =?utf-8?B?TmtTRmFUMG9yM21qb1VDUXFTWnJCelk1bnBKS09DTlFaVGwrK2RwS1d2OXBZ?=
 =?utf-8?B?SEhkZTNiNWRLc2g1OHZ6UVlVMFA2ckdGYjY3aWZoeVhQVXVZNmorNG1Jemo1?=
 =?utf-8?B?Mnd5VjdCTlh6T1AzSFl3cGZnY0IrRy8yU0NYTzhpRlpwQStRb0dVcWcyZnFw?=
 =?utf-8?B?bEtvR0lmczMxVUNITVBoOExHb1EwdzdVSjJONUJiRXBxdThVWU5QellKZTBw?=
 =?utf-8?B?c2lxaWhtUTRaOVhSbDB2UnBPSW1YMTlrK2lZWXFDc3hQcVUxbnZQUUQvUFFI?=
 =?utf-8?B?a1JoTW9La1dDcHBUVGIyS2pMZzM4SGl0Sis5VW95K3lialVzQXE3a0o4NjNp?=
 =?utf-8?B?NlJVa3dtNVgvdjZOVDcxVTZ4UlBnT0ZjZDlSbUZIQWRNdmhUTW5XS3Y2NVV1?=
 =?utf-8?B?SXRIdFgzWUdQQVRLYUtmb213KzNOK1ZWMGRSdy9TNG9aMG5DSVRsSUc1SVRq?=
 =?utf-8?B?UC9nNVhWN05KZGNLSm56ZFlqbFB6K0kwWWwwM0FSOUNaeUwwWlUwSUF6MHgw?=
 =?utf-8?B?bjdXRk9sTW1vUG4rY2pUOFdKYVduZW9vVit0NFIxdmZwOERrVW4xalN6QmtO?=
 =?utf-8?B?b0hGZHg3QnhUQXdEKzNvUzBMK1RnNlByUTJKcjd6MnRleUIrTnp1WCt0R0VK?=
 =?utf-8?B?ZUl4SXl0Tmt0TzAwM0ZjQ1NyVjM3V1hBcGJObmdQZUhVZ2Zud1d2MzA2azNF?=
 =?utf-8?B?ejdVZDIwd01jV2tJUjlSeUYvdERUdEo1K1plaXVYaXpRSVl3NTk4YURCczc0?=
 =?utf-8?B?ZnRIeFJjeXhqYjlIU2RrQTJQMC8wcExkR2d2TXJwcTZIR09ZOS9yZW5LOXdW?=
 =?utf-8?B?b1N4ZStid1pweVpmUFZRR2NYOUNuUzE1UTY0QkswVWJaOEozUjdZVnY5MDhQ?=
 =?utf-8?B?VjVIYkpMOEh6V0NlOWxDVjhrekdXWkxMekRaTWFNQ0F2cEtnaHQrUjlRZ3ox?=
 =?utf-8?B?Q1ViL0VpT0ltV0VWRHVXV3V0ZWlmVU9JVUJQenRmNkw0UGhLaWxOZis0M3o1?=
 =?utf-8?B?UkQvdFFDOEFnK3VOR1JvNW9Qb2ozVWkwR2lWSjEydE9xaFIrcURIU1FueHZS?=
 =?utf-8?B?RWxIRTU3d0czS2hXRU5peFVvemd4cVN5UEdJRDR5Nk00NkMrMmRYRVJUNUx6?=
 =?utf-8?B?YVdPMzFwUlhvVXhQOFVqMnpVbnU2aFpKWXZGV2xZM1JBd2VyWUNvVnE5cE1M?=
 =?utf-8?B?cGZtZHcvVWlhSEVyVUJmNkdqRUR3UytQUC9yNkFwVXI4OC96MzRCdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 48471e18-adec-45bb-58ac-08df195ca20a
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:22:55.7178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9eFx/7/sA70Vl6vyp+xvyp72y3jWuA1XT1Xdq1l4JuFrC/qK6jGxjke8t4/e8ccTGw0Tt6SoRf4RrK6yEwfQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6217

On Wed Sep 9, 2026 at 12:04 AM BST, FUJITA Tomonori wrote:
> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>=20
> include/uapi/asm-generic/param.h defines HZ as __USER_HZ and
> include/asm-generic/param.h then sets it to CONFIG_HZ. bindgen keeps the
> first definition of a macro and ignores a later #undef, so the generated
> binding is __USER_HZ.
>=20
> Redefine HZ in rust/bindings/lib.rs, the same way compat_ptr_ioctl is
> redefined there. Nothing in the tree reads bindings::HZ today, so this
> prevents accidental misuse rather than fixing a bug.
>=20
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/bindings/lib.rs | 5 +++++
>  1 file changed, 5 insertions(+)

