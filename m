Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021081.outbound.protection.outlook.com [52.101.100.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E47372665;
	Mon,  8 Jun 2026 11:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919947; cv=fail; b=UVHDFIairaGBgkHBKX/n+ZinRmEawuMbdU8+h/JLsE8o2YzDRhPTE9NV48n1eNuB/R4YuD98l7YKNreD/ug81Vn3QbNMu2PYnFI+Jd/x9G2ZTdN94pN90neTjCLHQUqEohvB6nwjOUdcE7Mt2oLQWZw6laZXSM+65eMkqyMcTzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919947; c=relaxed/simple;
	bh=VIflxfSMjMeNtkUyDzNmfQHTZ+q/BZSc3EH9kM2PWe8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=l/CBGL7gf4O5QBE/Q85nH1/awbpW3FrQ1uSDNayAeZjGBdTj6jnoKZU3lOa7vItqGxH5pfm8yafuM7TKR1FNmAt00TIlOiLaLo0gBrUWxjCssENUKwo0qnozQd5riLYTOKnN088KThnr1oDYCGSb19dCms1AV/GE7yxvfJvKhwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Mk++gIkC; arc=fail smtp.client-ip=52.101.100.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Mk++gIkC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zmwn5BrTFcZhUZPqTIqlpRIgtitIpK0jFgr39Jououy8zIvHf/zTZ4fyIiDRC3LQpGKuvYeocZ5/CHP8zTLAA1zDC6NfWSP+mv0/Aw2KuJBBYfFv6EB069UpPmB+kfj//usTLG0mw50jsnjhMqhcjLPzAlaxFZyzYmN01Akv7eDHBagXrD7AQItp+Eap3FRQjVwyDXfPe5xAw/MsnQqYQYCqK5B2QwG4O+Uww3N17ja5hWvDSWmHqtYdqbI46oUxxe6xHPzP4h+kIJ4JNxp5TyPaxv6FYgKzEx1eSTsf1jOMMmtb2Ctn38zFzFEAbm+CCAXrbK+uxlmY+3MEMG1Nyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doopFIhTShK4t59GheTh0wXiWyAeFsGFHpRmM0gRSlE=;
 b=mCXA28q0UJJEG7eSRjVvXS0JgPAWpV6aBnVnarKEtfxh2I5HcnTLO4lrfIFbCFgwfFohtcPDxkHla5xnAK6UJPzw5xrkmuY+ZiUHsYhgywXiYm/lWLI0a7jkOMNS/j3f6iCZDOD6Yy/L0xI5Q60AKthSo6SKg66bzT0XGU0a51Det3QWHI7SGzGG1QC/PYlffhJ5YMNeAM9UfFDiYgOhKuI4dhdzhNPOj5Bz77m66+FS2KBkXbqjjLU1nuFP5wFpbjROpy097LcnUt1g2aInTFelAXRjSREmxhq6UlpSYlDK1n0f7VSWPA3fNHuzHkMgSAkey0K6PYzDSPAy9jIgBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doopFIhTShK4t59GheTh0wXiWyAeFsGFHpRmM0gRSlE=;
 b=Mk++gIkC7Iv1sesZtAQyiH+zMg0FgzSjxRbMzyUC+oMBpBjZgKyX40KqRCTJr6ZkTSafHyhhQqczMiIKaNxr5CxQUZb39+HsBafsxq6wRFl1OekikLrVcYzLJknOCrbOeHNToN8Ji5A0TC+xuXdntTLPPSr0lyeHAf0qVkyXrgM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2733.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:140::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 11:59:01 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:59:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 12:58:59 +0100
Message-Id: <DJ3NFHS2N5PB.1W7NB3EETHMIB@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: add `NumaNode::id()` accessor
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, "Uladzislau
 Rezki" <urezki@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260608-numa-node-id-v1-1-28480299c62d@kernel.org>
In-Reply-To: <20260608-numa-node-id-v1-1-28480299c62d@kernel.org>
X-ClientProxiedBy: LO6P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2733:EE_
X-MS-Office365-Filtering-Correlation-Id: ab91c291-69bf-4c01-8819-08dec55553d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|366016|1800799024|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	rDtwBNJK+02BvwMXqKV/ZY1BpIgNF1wh/RS5bHUXAtRUXK78kgAfWxHmXv44G2KlXHVfaVaB6yuKgW4BvKtADxBLXxWnWXB4HWCU8+qvas/oXyLyKNgq7Yk570dCuZDVMx08gOGvnHelNGNFP0YGwUX1bxuD+5Ww+NwKH718iqjSwuiw9CE1eWVlDDP8qfbxBpUCsYMoMeiSR18sqqNrMh/d/0Jelmrfe8u9tZm8CtDR4GquxbB6Xb25KdJ+eyzmPrffrftl61kQpnDcVvAJZ4OygjkuyUO88SATBr1JdpBCBDCoMN4dV3bM852/vYtJ65ufgTvtYYeUm7LLvzuqp8POLt3l1dILGsejRbYj+4ryLBhERJ0NuyRG7mv65k1AaeHjgYZESWSaa8B85wK9eVYa93WhID55oW8X5062JIofY4DyEhxiiH/3bK7QE771c18us19yQ6AcBJY7qWSrMKcaiOoIs4By7n4slnIVRKVG1JSeZFH7y+5dG4AG7byycgEL5cVzDZDWmIlPOdlyYvdvcwf7shOyCAOBnh+bhCt8/b+rrXXHTdiRtLrnY6SHvVbLR2HgudtSf+nbbtls61gg6KQBrvaEaQNc4/gCy+olLhqMrb7T6GF8E+npJ1rdYoZRHSR4BWuwhtGGc/uXsoxb4+9nVbGyPn2W+3vTPIbpWiHa9N9ek71m/+v3eYcM8y5wrp2nl5HL84kfSJNusdLE3nzgTsXPmvSeZ9WDMKQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW9yUjVWUkxnKzNDRUl0cGZrc2NJYjVXdng2aVdQOHZPZ2o0N0NkOEY2dmJp?=
 =?utf-8?B?bjJqZ3dUTDdQNGZocUxlRGVnNld4dkY4dFBsMm9lN1FVUFFES24wVFQvNnBD?=
 =?utf-8?B?aHRXRGZTYjVyYjlBZ2N3dlhBcmhZaFdzYWZ0ZjB4YURzdjZQRDBmckNNb21J?=
 =?utf-8?B?dy9PRlVISFRGWmJrSDNxbmVvWjIyQU4ySSs2UGJ4NGxwUzFOQXFsYUllRlkx?=
 =?utf-8?B?b2xnWUFDVlUzVWtyQ1paYzV1YXB0ZUtCbmFHVVVjaTcxMitOMGdIejZsRWFM?=
 =?utf-8?B?ZTVHaDQrNXRPKzQxdUZNKysvWjl5Q2cyR3dEdFR6TmFPd2paNDZTczZmZnZ3?=
 =?utf-8?B?Y1BqUFBKN0lKdHJYNDZhelBkNitNaDJLRjhaRkM5M0dTWlBTeWNWWSs1Y1U5?=
 =?utf-8?B?a1N5cWZZS1Z5L2dsQzNVeGJ6OG05SEx6TjY5Z2pmc2Zacjd3RmJJU0tpUHl5?=
 =?utf-8?B?aU9pUGxMTG1JbC9Nb1I3elFFRnRFNzNNdlEwYktGYmRjRzJQamZpZ2ljOUhG?=
 =?utf-8?B?bzFqNVAvUXI3ZjdmZFI4dWZyZER1V2srQ011M05IU1R2aGd6NHRUVEFvblli?=
 =?utf-8?B?Vm0wVjRDMnZRNllsQi9jUjJTdUNXWWxha0xaTDJFUHp3eDlXTjVXMVhGTGk0?=
 =?utf-8?B?d1lIVHdLOFBSdXJJdWZZekRBd3hEVUxOeUNBbmpwT1gyVlRnZlNhSWxkSXEw?=
 =?utf-8?B?U05DWXZxSi8xMGtxeGZTN0JuZXI1NHpIWWh6RWhDY1VaUG9wWlZuOXl1dDl5?=
 =?utf-8?B?SFk1SEZydmpNTHlmMHBuckxPcmRjMkZJL0sxOUdDdXBXa0tUa1p2OTdCOXdK?=
 =?utf-8?B?RVBYQVlrVmpxbzNwaDlXbWVHSnJ0Z3BJYlljZUkyM2ZDTm53REFaOTZoWVZY?=
 =?utf-8?B?emVCTGJFYzIwbDhER01nQW5JblFxOWR3UmlYSmpJQ0dmVFdDVDJnQ01uN3E1?=
 =?utf-8?B?dkh0SHFRWlhyOVo0Q3N6aUxmdmhRbmV3MFNWcFZsdzNRaVpIZ1R1UFVYZTND?=
 =?utf-8?B?TkVhQ0xDVEZIMHZJeDNXMmJteGtFYW1kYjUvQlVOVklQZVM2bDhtVi8vbDRw?=
 =?utf-8?B?eWw4MU5UOHF2L0hSRVlxMUV2aThmSDJ2ZjRpOHlsbXM3bTNsbjdvVFR2ZUk3?=
 =?utf-8?B?M1NSRWFVODlXbHF5OEdzdEI4dXNWcXIrYnpLdUVvU3UxbmpuQ0gvd29uS3Ja?=
 =?utf-8?B?cXhNZWZ0N2ZBaVVwd2FUbDJlakNKb1FDSzhoaHdXcUk0Mk5DdzV3QTYrYlZi?=
 =?utf-8?B?SUhTSFQ0OEhWU3NET0hkdk1XY1F1K2FvOEFUaG5sQ1VwQ2ZZbzZsV1RFcVZH?=
 =?utf-8?B?QjhUb1JZcFBvNS9HVEJRZW14V0pKWkJ4WEFWKzFkc3hKb0RBMENaTVlwbVh5?=
 =?utf-8?B?ZGRFTGtsdUtyR0Z2U0xoeGM3MDNBbGRLWUFpc2VyYUoyY1ViRXVIa0prTFJu?=
 =?utf-8?B?QVp1QnJRcTB5LzhRZ1BmaXM0U1hGcmxQQUlqaTYwNzVFSFc4ajlSYzZQNUth?=
 =?utf-8?B?eXlpRzJmdkxMSkZNSmRwTlMzV2lkdmZFK2ZrR2Nvc2M1VE9rTnNwRnBmOUtz?=
 =?utf-8?B?N3dNendIaU1ZM2puVVUybzdEQnl0T1VVZlh1aTB1aUhRVCtEc2xZMjVoT2lz?=
 =?utf-8?B?RE4rRTV1SUNhQ1RkU01qTUlYRlVNZTRBUGFVMUpkVSsrT09Td0p0V2ZuK0JQ?=
 =?utf-8?B?b0UwWWx6UFkvalFtYkxJRStrMlFKS09MQWhxaDJlS0R4Z1cxL0t2NEwzUitN?=
 =?utf-8?B?dTAzVjVoMW1hYWZ3MGdzVTd3MUh6ZzVsVXVSd2d1cTIrK2NVNHVzdzJDOHRa?=
 =?utf-8?B?UEd5Tzg2aElYVXZRWXhTdHc1MFh3ckl2Sm41U3BuTG9rSGhmUFg1dUJtSVZr?=
 =?utf-8?B?VEVNcjJ2ajJiZ1NHZVU1cUV1KzJjOVlOZUNCbUhuaVhvRkNVWTMyVElVU3hF?=
 =?utf-8?B?SDBWb0p2WWNja0hOSDQwOHc5YkdHZmRQcTdMcms1NU5Cdi9mdnc2ZnVqZG8r?=
 =?utf-8?B?VTlxaFAreDFqZGdDck4xTEVudm1lQjNrNUE3aTRIMWhCNkhIemc3TmFoMENu?=
 =?utf-8?B?TzNpekp5TVBxMTBmWG50YkM0ZjIxcncwdnJqTUVHNDJaTzl5RWdoQ1RrQk1B?=
 =?utf-8?B?aWxrRFpJTnduWGg0NkR0U1BlVjZYYUdmR2ZnYTZqdHV1bERpcWdQMGpPUEMr?=
 =?utf-8?B?d1dNN0VPWEMwOVRzdlRlWDM5VDJZVkxEZWg3SUdKMmJjUHBOdnpCZTNtZnB4?=
 =?utf-8?B?b2s2a3FFS2gzRXFDME41UFZJR3lNN3MweW1UbGJMUkgvcStBTTczZkRFaURH?=
 =?utf-8?B?anFEK0M3WVNYQzN4OVVrTmVBbzQybGM3alVoZUdFZWNPVFR1V3NsUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ab91c291-69bf-4c01-8819-08dec55553d2
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 11:59:00.3292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVJVga6tG3RTEdyExlEl+0fPGWuUg+9HOQhbClS4PBzW6OeD1i8WOO0cT7gs0xQVyA9o6HobWxUWmJcIvKFlYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2733

On Mon Jun 8, 2026 at 12:47 PM BST, Andreas Hindborg wrote:
> `NumaNode` wraps an `i32` but offers no way to read it back. Add a
> trivial `id()` getter so callers that need to pass the node id to a
> C binding can recover the underlying `c_int` without reaching into
> the private field.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> This will be used by an upcoming change that adds a home node parameter t=
o
> the block layer `TagSet::new()` constructor.
> ---
>  rust/kernel/alloc.rs | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
> index e38720349dcf..c02290bb79d9 100644
> --- a/rust/kernel/alloc.rs
> +++ b/rust/kernel/alloc.rs
> @@ -126,6 +126,11 @@ pub fn new(node: i32) -> Result<Self> {
>          }
>          Ok(Self(node))
>      }
> +
> +    /// Returns the raw NUMA node identifier as an `i32`.

#[inline]

> +    pub fn id(&self) -> i32 {
> +        self.0
> +    }
>  }
> =20
>  /// Specify necessary constant to pass the information to Allocator that=
 the caller doesn't care
>
> ---
> base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
> change-id: 20260608-numa-node-id-85de708d4e8d
>
> Best regards,
> -- =20
> Andreas Hindborg <a.hindborg@kernel.org>


