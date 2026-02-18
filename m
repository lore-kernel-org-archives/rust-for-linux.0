Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021081.outbound.protection.outlook.com [52.101.95.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0763C2FE066;
	Wed, 18 Feb 2026 11:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771414586; cv=fail; b=WBT7UIqTMw3YJrmKzkr+KcI3mEY49S/wvmDSN+CBAd2mLO6kzgSdEiJzzGiRUmdbyGp6h8UNPZ9eAEMe+0rKQ/HLVhAut/BSH9oAq4l2W7yab1iXJj/xG0oZizxcghQWRwKf3f92J9fhfk2MlicHLHnhGqx7mlZdBUemmpAbiiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771414586; c=relaxed/simple;
	bh=z8k3M+IeTOTyB/CUlqXpeHGAX/L9lXTU594YTWMLljU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=oj1qKUSlLSJ4T3jQpHJWL/vOAhFz5wp4xIrZ3TYc88/cLd8kEiRVL9vV1tn6nWRiHoW+jNrIM2imne90qKi/miW680iU47WdrXbvJtaJPghdWNaSH0P6YEjsHk9qq8R/0DP8prqVwMLlMwm5H/QCSoO+YKdjr9FHAkKQRj1SCbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=LJK3geeW; arc=fail smtp.client-ip=52.101.95.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="LJK3geeW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joRpA15/5wVyTBLqmaEv9buAO/f5O0gL+VmjytozY8IiBR4odlwYI7pVKeW6OTQ8PBGIzc6wB8iWamXnQ+M5CZHaYRTn9idzuxJdhwSBPDcMbwZaRjjVXKxZcPWkGxB35ovMjzUJMULPIe3MS/ilTl50UmZrdpP3gg2TNXK3QWEzACkHkVcO5Nwrf182fFEIxOkGsCgG9MNWIQnluzW+5WkCHIlMyH+3HgEsRWFnm9IaH/NAKt5Je6jouoWVRGmgm+foH5061WAOYPFUl6OOQIm5KNVESLqq7aA5Ttkv28Wawg9OtcDeP2Ny0J0GDWoBUPHWKofjRbkerzqZnuBoAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Md77f5H9sv+hG7H9KOze+cgm78Nt622jfw+GfYYXAec=;
 b=P25Nkb4Kt/yyAW0DBYA1/yI4l1CevcnKvzJSpJtL4z4yJxZYpGZVW2GMR+8GsE2EqX7cXSYqcYrkikfCXWdW9wD9Q5DN9WQYoBLvHQ6+hJtcDIcI1T6JXoFXPBUot0ZG7DOJrqyRmh7LRYasv+dx/gWQoyeQuYZ2W7adQELw/gkn/JeeoaEFCRSDy8ytpQtOpMDhIlGZbiK1XRCEtSJ8gEj9KqufvsbOXikkLGCrdcFKO0lByCMzhEZKWvTpdedt5DrEaFoqeIswjFzwSk/FWciL+3Yw2q+Phtog7ns9M/U9MaUTLwoybW2No0HWnA1Kl+FpzHaK55jY4q9yM0xC0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Md77f5H9sv+hG7H9KOze+cgm78Nt622jfw+GfYYXAec=;
 b=LJK3geeWdD8mElFF21m6v0TXG09aFu2KTPysD+gaWsTVRp2riK6b0O2U4faM20Bmfh+XLzHuFaFCZ64F2EFGgKbWN49xbTu8ORVeP1d/nrTYUPtJrBIhOCIthkT5d7y6/19rCviSDp/mE/SKaY3Jh3zPqb7ndc62wQvmHIp/Tec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6529.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 11:36:21 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 11:36:21 +0000
Date: Wed, 18 Feb 2026 11:36:20 +0000
From: Gary Guo <gary@garyguo.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam
 R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <20260218102045.GD1282955@noisy.programming.kicks-ass.net>
References: <20260213-page-volatile-io-v3-1-d60487b04d40@kernel.org>
 <aZRY9HthKwVJrAf1@google.com> <67aea464d25c8cafb3113eea62c8221b@garyguo.net>
 <20260218102045.GD1282955@noisy.programming.kicks-ass.net>
Message-ID: <9029143b048c9385768d883d93da6531@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: ea293948-eab1-4d7e-8e88-08de6ee1f012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FRFgx6R38st7uyEM4Hw35F6RFnwf9HldwgfSUa+ERNRB3dFX/Z3lsM7Qmgs+?=
 =?us-ascii?Q?OeAZlBt34bW+8pKFffOssbBx01j1LaVRdFOcyiFmAd9LAdzuFpp9EdaaGU6e?=
 =?us-ascii?Q?hfWaFLBvEwhxAn2EvZVd30py9egzM2Y4+p2RgrVUCJlZlIvqVDUvLpSEJGfx?=
 =?us-ascii?Q?QzcHNkAcrabzrjkNaUUTjHZxCPdDftbc32VzZM376BR4AfOmCTGQ88QwXSMN?=
 =?us-ascii?Q?lERegr9RcrVeMfQeOclpUXmbf5oSYCBZSsggmUGXhL9ZFx3QrP+CBaR61AUv?=
 =?us-ascii?Q?XwGuWszIL72jh42popO+7sQ0VCFe9BQYwG/fPtDH0QiOqyIYxZbLPlWn63p3?=
 =?us-ascii?Q?B4PUcqswi5XnJW5zbUMOLX3/xbwram8Ub2F9fJNWAVBfK/XIDoq4vDa2FOqA?=
 =?us-ascii?Q?dczPS9OsK+zViJlfkiNdPMhzC2qnPDPPev3DBmhYDFHFx+B+NceWEYLiBme0?=
 =?us-ascii?Q?x1Q1AwRyIdDdekptthp+JaiDw0LQz/L5A57D2hMAlHjLfXC/F67f+bbfGEa5?=
 =?us-ascii?Q?IgGZJwpY5phVyuZLkkXzUaeVKYa4hAXCNuQIlF5VRv1W+Gti3LC5dlUzcrGq?=
 =?us-ascii?Q?CmyfIu3bEZ+18Lf9K+coQqFHr5Z3azbJTSIkf+0q/PsiQYooRYyi3Jc9JybH?=
 =?us-ascii?Q?IJVoY5EBdpLZ2i+pm1dVkYg/iyWv1ZzXbOTI/nCdAvSKLUv6zMbEL5ILxEM0?=
 =?us-ascii?Q?wmsQHnA4W4fQ3A5HIwnISJjwMqxyUhLfIY72lRHpms2RxRxz1w/B2X+WhYtC?=
 =?us-ascii?Q?1TgXSYAYBy8eIK32CDvv54lMnI7C62o2vOtCIgS9QdSv02VW3afGX/YWsmwu?=
 =?us-ascii?Q?ml9qxFfNCCFVsZY2UshkXUOHVUeux/U+I8Y+e56i9GCRwyLt2zPT4InhmP5S?=
 =?us-ascii?Q?fnEw+Mug8u8bJ41M34MdHiGN2nUaaoeN9nLenChEsgGGjK2Vk2mr+rMYRCgM?=
 =?us-ascii?Q?3wvHS89gZe361iFw7d8Y7QWJFVh3aRYIhvq5ETSUuLSBvp5aPvPkbwtcCErx?=
 =?us-ascii?Q?kbm5ru1DxpDtVQjncbEDXipzDlXvNgB2RQhgHKukT2L4V1I0d2pbyULF1T/i?=
 =?us-ascii?Q?IFOYsYokUXmFwotZguzyNOyJUF5ro5I37xRz78ObF5YQwgS0npU+6eSAaYqv?=
 =?us-ascii?Q?++MzsYI0ESztLwA9H8fuHXH4VDLdqp3VvTAPkk3cuUAD/KfpZiQKhSebBOXZ?=
 =?us-ascii?Q?/e+u4bkhD3NeAdTrDEMDWl+Otw6/BSmVXq/RcxPhZszMLUm6GFIb16SjCleo?=
 =?us-ascii?Q?Wy1ufSfVvzZpRkqlWlFCBnZ61a1bJH6ITwgmPV6rQ6+KGZhhSL6OoKpl8s7a?=
 =?us-ascii?Q?5/y3xb+Tuee5An5Ag6GOJU46A4Z0elDmRyu3Ue+sD1rvsBO/1JnnndwAeXKw?=
 =?us-ascii?Q?fWdxQLJA4y/sEcIrQuQr4wV/9AZjsPaSfJbKg9MPrRvbFmMX90C3ZVflVkcW?=
 =?us-ascii?Q?enTk2TG9zahAauGKzm7kEZzU2/qnYwQB/Ng7jYUSPlUwbwJIoxwdI2NQs1/L?=
 =?us-ascii?Q?q5sq0IBvHxoAL29XmPVEWZLEuWbvAonH3jArVhK4IzALIzUOArcT9Z2YFfBU?=
 =?us-ascii?Q?f+sfKCox+1PZdAD6Scw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dNf9BuE829L8i5DRkDKz5LHERxnl8yQPnCstfTCZoqt2ysUy4mHJeHwvtURt?=
 =?us-ascii?Q?K2xOtr9Egc9q6/po0B1mzJ3+yeBMzyf1RtKHNC60qyGSBnV5pcC1tYMIBub9?=
 =?us-ascii?Q?hfyqxFc48KjIGU1Skxk0O9Unjy+cPPVj3qlWGlle01ZYWbwDHmbswC0qendy?=
 =?us-ascii?Q?PYwW6CgLejz9sZMHe4wA0HKQ78DAaOGVn2vW0SyZ8StS+AvyOgHefKvF4qNm?=
 =?us-ascii?Q?RCV+zScKG+JkEWJTsaH+eNOSgQwXm4knwHZ4BUZWSyukhmx5cZrgSM3CHjTR?=
 =?us-ascii?Q?U7VzNG/F4cttqsVZspBIUMPsCH4ZbpcTNeCwxFM2RUP5qhvBtKEv56j1A0gw?=
 =?us-ascii?Q?c+WUpVhF0TwLJ5e1b4GSDk9DACDAarYl37xwhI0gfls0VCKdgx+F7BjYadlY?=
 =?us-ascii?Q?s87strNbAYZEjqKv32+8Xp0X7HqUZKvX0NoSD1twnUNUhMzmSaIFl7ELqyGv?=
 =?us-ascii?Q?Ky9ysrZ+v3uW/Zg5NgXPSq1Kf5AH+u75CTu92VbdRgx/e7f4TFc0rIFNwgz0?=
 =?us-ascii?Q?ujfLL3mxiHMmghqGzDBv5T9jMH0qbBJpFsv2c/e3LngMfb7N8iATvM/AeMIT?=
 =?us-ascii?Q?vQ0XzFGqDAKShLgK3auFlk9dwc3qTAVolDm9D/lJfHvsQAfSZ2MlFOImllyQ?=
 =?us-ascii?Q?TNjibJvFXJoJSvffKF/93TXmZkJkklZx3Bpc04gkVFNKz4ajhR2YCkPB7tKy?=
 =?us-ascii?Q?QE1aLamCRyk03+05XG6lQoFDqBHG79MF+/ZCzHEcqdaHTQbtgpbEiDbUZV++?=
 =?us-ascii?Q?XfjEJYnpi/XfqJoX5fb78Jii00FFYFFjnM4v9+Y+/eTrTOK1kfjQkWS8x2uI?=
 =?us-ascii?Q?gV6JLZX1kmfOGboar04s7q80LQ7YDL7kph/U4TJa8/TJSHVqV7mYJNI9g2KX?=
 =?us-ascii?Q?F+jvKBKsRo+KcThhwx97BZO4ilPqk8FcR4Yb298nn32QQPaFLQisjk5mhEIN?=
 =?us-ascii?Q?Qpb+6ERCuxw1cUgblCjNGbgliYIvN4sBqW7hWopBWnmF5fFm46FkY5EYcevL?=
 =?us-ascii?Q?6fzMXDoST5/i/HdSXQKJwJnv+j2tc+oi3F53QwB23mhV19AyErSWLjJfuRaI?=
 =?us-ascii?Q?C71AXcnXOPvVwnc3iPnXpI+RrYmD0rLgVP8UNgEnVHqT4bvwyH2jLjyoR/t5?=
 =?us-ascii?Q?OMb7O+xclJ+PY+ISlfLsVKbSXph6SIjmrYnrfSvQsCaQdWw+ZBUNSXG5XDlF?=
 =?us-ascii?Q?U3KkNuCSh/vP3ldHFviSVMKya1alP4sjxGzMjO0Ib7+8BnKRwmte2JtMqInc?=
 =?us-ascii?Q?1feE4gv8LI3CfdZMpblGZkG6ad5oXWJjhx34e0G6kBbxcDtVeT3DgbCTnW4T?=
 =?us-ascii?Q?5yl6mRlELsp76/WxIknNM+AbRy+Vn20hxbMlWVyRge8oAw2Rwx+CmK+EeQEb?=
 =?us-ascii?Q?bntz0xTIYrtFCjpVrnq9F7SytxqLYs+rBVtf6E/aPSIalDN4oovbfp9ic0a5?=
 =?us-ascii?Q?Pm6M6N6QR36zVRJctELByZST8SklHMCftol5akowALUHyRWFd0VO4rh7bnZn?=
 =?us-ascii?Q?P8ZB/blTifFSUTfQNi0MRylaJ2Ld5j6Of5mnsFc4RQzNCZ5nEAhxQPVzmfyR?=
 =?us-ascii?Q?oFo/XV1lt2y9jKi+Fj1EUycQ6Dk9cUF9o3uljeIwCqIpUmITDOecQjw8HIxS?=
 =?us-ascii?Q?dgntlvZ89dzpE0gx8a2nopak3c7fnGJjltGCBc+THEvxIv1mZeCA0r/B0vcu?=
 =?us-ascii?Q?mvNZ8XVoG08mZz8NTczCFT/eU/h3KzpI+ytV5oC8xC2/BOgu7jhlFpUakeQR?=
 =?us-ascii?Q?CS1S9VOKDA=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ea293948-eab1-4d7e-8e88-08de6ee1f012
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 11:36:20.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAzXrUbX24vrQWJhPmhDlphD7XtssPoZ3JthjhqHAdRqu797kPAvO94Do3fNaFO5YhaaX44tL6DXClVKDbqZ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6529

On 2026-02-18 10:20, Peter Zijlstra wrote:
> On Tue, Feb 17, 2026 at 11:10:15PM +0000, Gary Guo wrote:
> 
>> If we have this in stable, I think it's sufficient for LKMM. However
>> for Rust/C11 MM says that volatile ops are not atomic and use them for
>> concurrency is UB.
>> 
>> I recall in last Rust all hands the vibe at discussion is that it's
>> desirable to define volatile as being byte-wise atomic, so if that
>> actually happens, this would indeed be what we want (but I think
>> semantics w.r.t. mixed-size atomics need to be figured out first).
> 
> I would strongly suggest for volatile to be single-copy 'atomic' for any
> naturally aligned word sized access. This is what we have with
> GCC/Clang.
> 
> If you pick anything else, you're explicitly creation interoperability
> issues.

AFAIK LLVM IR only "guarantees" this for primitives, so if you have a struct
that happens to be word-aligned and word-sized, it can still tear, which is
why the the "byte-wise atomicity" semantics is what's being proposed.

I recall it was being discussed that, for the MMIO use case, it is desirable
to have this defined in such way that one single instruction is generated for
an aligned access of small-enough integer primitive.

This is exactly the same situation in C too. If you have a volatile struct load
then Clang actually generates a volatile memcpy for you, and it can tear.

Best,
Gary
