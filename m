Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020117.outbound.protection.outlook.com [52.101.196.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520C81D6195;
	Sun, 22 Feb 2026 07:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771746413; cv=fail; b=sF1BenVWvOFrZ9wEdJBSrxUuf4pUTTWetMCy87qapFcXLGxPlaOPVPqMnm37fxyw2fDRZqr/WoWxN9B366UaAnRN2Y5ZYeN1c0Vreoa6bDEiP0VF4vN0Fp2IiL1Vq8xv4t8/HLF8PtOOjweQwk5LguQSerHCjyhzo97Yqgypd0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771746413; c=relaxed/simple;
	bh=NiBE+IAfem6hw2fA6HK76IFUwFuLjHBoJ8so4CDK5bM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=hRlaH/Vuw52sks2A4nToIDl0DBJ2VhlEa6kQyBEr8uPk/kl+c4PWniCnRvgEI7NuwKw6H20r3Vy/GbOBbmGnDQ70veLn2qbNz+4CwsqP1/cnDCkw7vWCP9Dr5ZVffdODW28/Px8h+4ZhKh6mFdKabXgsLGixdRjP8c0yVQ2Rtbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=gsNnXpUL; arc=fail smtp.client-ip=52.101.196.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="gsNnXpUL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmYn9xvt+cLRrpeCQWaLtBmr/y0jy5uU2gIpEFgcL+fgaaF8A4a/vUDJMyEdE9oGmAcTDzpydiWo36cWroE8pz9C4ntsS7Z1NyIxm/gsrt4ufgqFAN/5PdITqLcmkwPyMYRQy+nzVPaEHvdRKRaeZivyTwJ5G6dXRGbW7LIh2A/1Px5NngV/SoVBpn5+uOZRy4bFEqueIFNpO14veBsB2qWIs+xauw3ytOk3aMZPMqTWhou9hAZCiiPsTnyTVbGr+7QSupDcJJ/WvkY8P7uiBk+syXaF8uSH0AlBcmbsFwmpjzYIT3BMO6Ii4k+PeZYfJpYAuY95S3vqEClHZSWpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BC8KGfQ39uBwWuTsGkN/6dZH4VclzB8sMd9OvLtp/M=;
 b=XXnz82uzR5YEQsWnjziS1NTsnptXEJhTgW7vgj6iMcko3Jb/MV4NBr53Mjt0raYDSCCF2pcfTECw37nMbjWSyIOIie++rwSPSndnoblyNszQwd91XSWaxSm67nJIydVTjTZjHmme+2kwvIlH4D64o8okaLadVpXXc0o44JIlfMvGMPVUsGEJdT2Srs/1x8sDkROFZ84H6H6qa4wLlc7KBebPWbFjxPsSrnOHYDTaKxYq+mSGMKms5xWpIpwYNH2+y+Gyk+TTnQUd5N3Ie7II9YOsZ5/vL6N2MpwuGYf3VkfQFVTWiv93BIuxMPmtNTXyYp4zSoMOmXqGpLqlA8x30A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BC8KGfQ39uBwWuTsGkN/6dZH4VclzB8sMd9OvLtp/M=;
 b=gsNnXpULrtUVvM2qQqegytGPiTe4BCE+BO6tn8J5bYVtRXoYmGqY/bb0fXSw+OCVZp4hMgIk/Ej7QVxWxeHfopCUlPeHt9IhWQfnzAXS0OWaLP/cfaJ9X58tqUaB172EOfZwbYhblljHUJdlms5F5NzkD4qLWwrshbIcdKi+4tg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7612.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Sun, 22 Feb
 2026 07:46:48 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.017; Sun, 22 Feb 2026
 07:46:48 +0000
Date: Sun, 22 Feb 2026 07:46:47 +0000
From: Gary Guo <gary@garyguo.net>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
 <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Eliot Courtney
 <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas
 <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 21/38] rust: ptr: add const_align_up() and enable
 inline_const feature
In-Reply-To: <20260221020952.412352-22-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
Message-ID: <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0004.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: da71ef50-694e-4dfa-a0c7-08de71e6886a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2D7tWcZbBxqgGsPQJlAj+d7smALvIktTqmcKC9Y51KNcrmxI2uL/UCErJkuD?=
 =?us-ascii?Q?NZpOTo/YClK8MGK01PK9EClE/ZJN3cZuzPW7s3QT4OZi0PbPUoyacTWb9S7B?=
 =?us-ascii?Q?eonLJ8YofMMvlGkMV30onpKNTlS9HK5oL4qlMAvppmUHhv8ZN1Kt5FSxnt/d?=
 =?us-ascii?Q?zEAq+MZRN6d51bUJE8f59IElkTkEYK5k4ZPV8fNVTTTuxKLdmyCepzuHHin5?=
 =?us-ascii?Q?CwoPTlFi0Vw4W+EiDr9TBh69+DnJJDs4qFSPIXKccwUWxh6rltwfKLT9SCVz?=
 =?us-ascii?Q?LLSjlW9NhDCPWQj6atnNJajuc29/dgJ8jsOe+T+6x4UZUq/yqPQGKeRj5yNL?=
 =?us-ascii?Q?LcFyCzLWXAOy0p7qn9sJjTdzLJ2dilcRdhsUjTkgsYqXJi5C3Qgp6L1P2rbr?=
 =?us-ascii?Q?kEAZUR6Tv2wBajZ4X7MOyjgLy1Fb1FWyuIaO+0zVkB/d5fuC1QtF8yfphRQv?=
 =?us-ascii?Q?V6gPpVd1ZeaAqVgSDR5Q1H3tW72eWEceW1rygEo9jtX54o7MkgDuB53B5AKZ?=
 =?us-ascii?Q?vLnRKsFyG2J63DgVGuwDdEyeINXbz+B7OL/wBWkO5adXTm1FZKSopKswmkN+?=
 =?us-ascii?Q?8+TFOdHqzqRH64/jlzaeZepfeNw9G8nzjUcPXIGHvdFf6ijky5vVqMaW8LhM?=
 =?us-ascii?Q?fbgvjWAC6GXk4w0HM4Z490ULSo1fr44P6PopNVmy61atHyCpH0wyIMjOzA9+?=
 =?us-ascii?Q?N+z37wBQWrHuEBsss0g7ZhWAk7WexLHNYZjr66XbZN4rpKcd9dvYEsFCNSSG?=
 =?us-ascii?Q?Qe3fwRkaEy3ygWCJqvnFz5wleKzCoo0nIiL0CvoSyiU2nU6ptqGcUmdBF4z0?=
 =?us-ascii?Q?Wtw7/LX20uPLgpc8JCpfG7tPNZt0XRzUVIy6/eVjQ7QzmPYmT1SobZZFxOUo?=
 =?us-ascii?Q?tb6n3b3w/Jnsy18s2qRdgi29mwFeX3lq3/vFArs3BrbNptY16BEE2i6oJaTQ?=
 =?us-ascii?Q?W3LpZTKIgvgpLFr8Gs2/dVOo2jyn4jTzNkklFBNE7pv/Lvfm7fQJa0VuV+wv?=
 =?us-ascii?Q?alRLb34Yj9VxB/p2C7bGX8C/CZP5lOkM971rD8vYYMxLbIG1Z+y56f353iLk?=
 =?us-ascii?Q?oOTGn4XzFNuwSNqe4aFrgw7nshukHMrCm521QOrLawywPojG3WzhssV5FNhj?=
 =?us-ascii?Q?3/N/pv31pTcFOzx8bU9v1prWBJdU6gnxRE/bYfSPyQ3KUW196n0ixf4kZcLP?=
 =?us-ascii?Q?j+CfotVAXgiu6/b+1A1nPrSriOHt5OjZEVwIB1GYulOQwxtzmA2+JYVklIxV?=
 =?us-ascii?Q?LkcEfb+jyuG773svnOxJDFAJ813B93vJoEgXC7dr8rcB26u3hYazKnNZLYl9?=
 =?us-ascii?Q?F4lcst4FhWg5Z0WrcuKnsiU08DD1dBAeocllEYXaxCZpO+HO/sDr6x89a+Jf?=
 =?us-ascii?Q?bbx503ezmO8aJktHxADMhyCWQ99SHmF+OlmD94eQ8H/p4JV/PZCFHpA+4f/U?=
 =?us-ascii?Q?5XFH0pK2tlDBLMATPRkv52j345ARHule6f6KLTzYt2sacUwrK5Iw5IBaScsm?=
 =?us-ascii?Q?5wMTYclSGbHp2++nkKdFUJN+YwSmhLxVg4mzSUaqNDWwbYWwu0IXrovBJU53?=
 =?us-ascii?Q?ePnPv3FvpAb5DTKko7s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c+8IKjMgF5OTfX2kiDdtmM3OPkOhkrJNqqk417A9I2lLuGqH2ocQCVGI5hNK?=
 =?us-ascii?Q?a6xV17huEflIIhbFNEXRSj7IQn3qaiHS+3HbHefhtx5Q0C1Rb3cEa1nGwdM6?=
 =?us-ascii?Q?TAaXGSeewQon85cmAVAbz/aRquYjfwfB9hPl/Ykrs6GCwaTQLjxk5IWTK+j4?=
 =?us-ascii?Q?A4Urqrw5XhBeD4GT2PIavc4so+80ZvcKNcn7ZRxtGgyvsyUYXTwA02m2EEBo?=
 =?us-ascii?Q?aVDsqznaSOWA++JHfNd9OoY4ewRSEnku1E0MlXda16hQYgHdff4eFg/Pk31P?=
 =?us-ascii?Q?SCkt9PLjwOrYJbIC2czuZV7OSwXyGayNuKwtV8KVhT5pVkdcmNjdcEuYyO2A?=
 =?us-ascii?Q?yGSPuqwCSE+3W38gW1y7um7rZOciP9aFOWCla9WtSFA/vDjWWyh0FL7RfCm4?=
 =?us-ascii?Q?K0dp6bFYzr8Yy5c1lj5v6pIyAniuqZRdoB6gP/z7Oa+8LwaGFXd6XMMqM9Fv?=
 =?us-ascii?Q?vPyq+PSbMvDZrDQxt99p9jjfGPfozH9YIOTz+2S8aG4zXfjeeEHqLoDLcLRt?=
 =?us-ascii?Q?9mP5kgAHYb7wgw2tIsw9mU5D3a+dodIr1kN2yHrppFfwW0FGelOpf4B1GSZV?=
 =?us-ascii?Q?/NHrhFW6RpMhdg5Ex1np/tf9XphBlQ7/kGGhMYNIVsKN66pD8DV1TWfel0we?=
 =?us-ascii?Q?aC9+zMfnSsr0YT4V9E1q6sd9kq+HW7HNMypVBx6LigcyjhKryVLaLXpCnLbq?=
 =?us-ascii?Q?gFjmPQ7pUaX90dqs9gmBYqprpLXedVDC/MuHNTp8mKMu85a5zBfl0LuAwn7W?=
 =?us-ascii?Q?3Bgrdg+fN4FKFlvvAGt3HZqtUDlVC7af++NMsKdTE5WlSoDWh6QCRAGeRdrf?=
 =?us-ascii?Q?K7+Q8m4Babg0HUfIH7FrGwJNthRJRatIMqBRc9IDt38rpPN+81rdzZlLnK1J?=
 =?us-ascii?Q?S2z6cd0xPSFCZ7SL/Of1yHF2xdz0Lj0fk2w17R58kDA1KdI2MOsh6sfDJ78K?=
 =?us-ascii?Q?UtdhrLnIgfpGOUJyYzprxV7nAX+HI3t0aByLMr6/ii9nMpkXeH+DnilsK+ev?=
 =?us-ascii?Q?cSVwLQoKTxg5ODMO4x3/YmY2G4p7uqGDQsGDdnxyEYXNroXndh30cO4jjXs6?=
 =?us-ascii?Q?l7JHayp1e0Wfkl60ZND1A7fJXd/Kq51OsVed6hvE0HCa+QT65KfjDGFTORN/?=
 =?us-ascii?Q?LpGvkWiL1ADOMRYXU36b0e0OZoFb0VqqVGUZRngrIfHgrkStddnbWF3x87kE?=
 =?us-ascii?Q?QpVc6ZMAhOouoJ8kDNJagnd99aPy/NduE5sB4EGYGIp5YBqpAZhHT/C0NlXq?=
 =?us-ascii?Q?pHZE810DZEMjf6ilXq/Ciriht7HPRmnyve7zfl0ievlO/DglN4b8CIoLgHoa?=
 =?us-ascii?Q?lFgNsuRCWs8JCiBG3kjj9W2PpfAfStrj7/sYtOqyX7OPq8FiuIjJubEumxYw?=
 =?us-ascii?Q?p8GRdiemWDkGvh4CFWA/ReU8ajIdDUwxwfhOfjg5EhKiv/e3g80tpm5avFEG?=
 =?us-ascii?Q?ux/hvHRFoa6AwqJfoiV7ATOYRAQD1Aaa3764mrx6m6knGZkegr3HiZk7O3P6?=
 =?us-ascii?Q?PLMNWmjHntHt4tT6qmw0tD991rVxryekmiwP+IFE93dS8bEXb4CeF8EArUjI?=
 =?us-ascii?Q?oNQWltEll3CT1I5iKzPvGPAEWelhMUDCgRLOlXAtXN0HtVDHY55/4Xqf1pCg?=
 =?us-ascii?Q?FJw52ioXFSoWkKBLCaW0rIl6YRXyEuIavJL2MAIx4NOZt6SEoiRSsOJndLyC?=
 =?us-ascii?Q?vG3bZwfAQidEzC51hsSQxzVDytfBZkxQFx5ROPYht7YFovyBZPNh7C+UW4XI?=
 =?us-ascii?Q?+iuFme7b6w=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: da71ef50-694e-4dfa-a0c7-08de71e6886a
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 07:46:47.9702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aLCkZSuqqOMd5Z5zwZpedWPVoUINtIv+NAmgguXGF94zWMXcPR9Kt5ok39+s2owOYrsZGnZKoc9L9j0DO47AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7612

On 2026-02-21 02:09, John Hubbard wrote:
> Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
> equivalent of Alignable::align_up(). This uses inline_const to validate
> the alignment at compile time with a clear error message.
> 
> Add inline_const to rust_allowed_features in scripts/Makefile.build,
> following the approach in [1].
> 
> [1] https://lore.kernel.org/rust-for-linux/20260206171253.2704684-2-gary@kernel.org/
> 
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  rust/kernel/ptr.rs     | 27 +++++++++++++++++++++++++++
>  scripts/Makefile.build |  2 +-
>  2 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> index 5b6a382637fe..b3509caa5ad7 100644
> --- a/rust/kernel/ptr.rs
> +++ b/rust/kernel/ptr.rs
> @@ -225,3 +225,30 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
>  }
>  
>  impl_alignable_uint!(u8, u16, u32, u64, usize);
> +
> +/// Aligns `value` up to `ALIGN` at compile time.
> +///
> +/// This is the const-compatible equivalent of [`Alignable::align_up`].
> +/// `ALIGN` must be a power of two (enforced at compile time).
> +///
> +/// Panics on overflow, which becomes a compile-time error when called in a
> +/// const context.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::ptr::const_align_up;
> +/// use kernel::sizes::SZ_4K;
> +///
> +/// assert_eq!(const_align_up::<16>(0x4f), 0x50);
> +/// assert_eq!(const_align_up::<16>(0x40), 0x40);
> +/// assert_eq!(const_align_up::<SZ_4K>(1), SZ_4K);
> +/// ```
> +#[inline(always)]
> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of two") };
> +    match value.checked_add(ALIGN - 1) {
> +        Some(v) => v & !(ALIGN - 1),
> +        None => panic!("const_align_up: overflow"),

This is wrong. Either this function is always used in const context, in which case
you take `ALIGN` as normal function parameter and use `build_assert` and `build_error`,
or this function can be called from runtime and you shouldn't have a panic call here.

Best,
Gary

> +    }
> +}
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 32e209bc7985..a58a7d079710 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -319,7 +319,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>  #
>  # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
>  # the unstable features in use.
> -rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
> +rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,inline_const,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
>  
>  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
>  # current working directory, which may be not accessible in the out-of-tree
