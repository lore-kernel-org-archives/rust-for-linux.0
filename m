Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021130.outbound.protection.outlook.com [52.101.100.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9982823EAB8;
	Mon, 23 Feb 2026 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856221; cv=fail; b=Bj7/C2xCmbSuQYvr3j8JxMC1VK2Bkg+O2C4SwJkpg6dXGWZpNMP5nQUH270Uh3SM8BgWf1WQ2q7wFaSu+sIqUNAuchDrCeCumZWA6i6c+IoaAeb08xl9up2asmIptlow48m5xvlU/05cr5qIKOL2HH+yD45rrOqgR3gn4DnMvTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856221; c=relaxed/simple;
	bh=9iRPJjL0kVx4mhvU6k3uNRYYn+2a2BKiG9t7NFNTD2k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:MIME-Version; b=O7TpbrFdwt+hFxhW8n+b5gvjre+ZWlY+XQ0q5B/tl9PF3RT8ATO4fb1fDO8frqQH9+ayxwTsfSBryaApusxukprtUgRpqpJzvUAWnhIFgkyHQIcOLlM2mLJqcYOi5aBk6lnBz0fChpvK1RjnltG1K8WM3P171/AR/HlfQOMtlSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=evMIUGL0; arc=fail smtp.client-ip=52.101.100.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="evMIUGL0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9zTjOQzHxw80FfSbqUVR37BZ2gx7N4AN9bLErtpqQiWRMh9ycHBJHfpNxF3kNY7E0erxOWlPjyPQWHOt4wCGHpDP8a2r9FtZC383pSTUH6RRHIiY7xrcpRR5cSvHx4Q/B7E9zoNPdwUCgRPOvwrjw7Tgsmo3hKCnsNrUknMyotnqQWGcpEkWJ+Wu9cww4/CfEPxdWcfLGoSUEXg9ej22KTO6hNX5tx68wWUb5UbNDddpCmRip0A14FkhID3iL4UhqNj9M5GmCpJGaXO25qoiqfRq+qxBjV3kuQA5FhNSfwZVeRT3tWv+rp/nzzV7QWeaocD+X7ceVzAd4xnU4j5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OVzjw6Oi5dxS3fi2yh+ZM/PAGAOL714PTHWVr2U0YI=;
 b=b40NBOiLQBxLBvQxWayvFo5u8fcsM+CpWo9QyXSHQZisjttTS8VE3yACa8WMpNlQsdBIjxEIJZSkddhJ8xWod68omwjTjdMLz6sTc+nwujKLRQeQMov59mcVQmCp1fvd6Ua1bhb+L9k5TQmFzWbUCeukWJYrtHRbD+8wxLHnNmV0pGfSVYoGhbaMKGVQeN4WUrn4D7HTfO1GEZrXiwEpK1RX4ifcLK79N2FgMMByPev6RdP+Zb+s7KChsia7oYZCvtxsNiQVYlrzmtdNjqwGfsdr7rNYYU/7CtyHAEwype1r6halok0i2vFihc3DInzKL0kzB2Pe9feYZOJAx+Pmqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OVzjw6Oi5dxS3fi2yh+ZM/PAGAOL714PTHWVr2U0YI=;
 b=evMIUGL05DpT+nwdIYHG0UnAO+SkTNgo6ChHTz+q0rJqYa+Ib4pWE/3+q7V0YbnXd4nUkrypw0iFxUy157yCuz797acnZ5hK+eVAGmR7JlvvtjTqB1BBBasuGubWkYRjyaV+bUCLCKsidBDSDJNAHxQxwBrXJWfkicuOyPKBMJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8613.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:16:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:16:56 +0000
Date: Mon, 23 Feb 2026 14:16:55 +0000
From: Gary Guo <gary@garyguo.net>
To: Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot
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
In-Reply-To: <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
 <20260221020952.412352-22-jhubbard@nvidia.com>
 <ee76d46cc0cab88ce6dbdeda6a8850dc@garyguo.net>
 <89b240a4-33ec-44dc-8f7c-1a3f8d379e0d@nvidia.com>
 <DGMAKO04ZM3J.1NJDI9SYE354S@kernel.org>
Message-ID: <ba7aec533e083622be9055e77c30fee0@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0549.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d252fc-7f54-4a2e-5d2f-08de72e6331b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B3YfK46NbLbDsldyhvGXivWG2aTqifUXJJ8UdjHMnjnqQZYDxE85NcZew9hW?=
 =?us-ascii?Q?XZ4nynHcOETVg/QPtMW0YXy/Hnve67Uv/bXW/d93zc0uRBX5wW3mRIGBvS0o?=
 =?us-ascii?Q?hU04wgqcQdIMLglE472yp9nbHI64VI5/cPcwH/iE73yzEgezAOKUc2D0xfSb?=
 =?us-ascii?Q?kzp9Ad/8PjVy6EV9yME/x+YGnpEZNEwDF8mMWGHU5eMTVmilSqyG2mFOpY4P?=
 =?us-ascii?Q?gEJLmpvkiP/sVCVog8MGFU0qwrgPeGya7kFDcGYl79YBzh9CR18DnCmvb5Li?=
 =?us-ascii?Q?8tTBoapq52MyX96/A4m5R2ouM+3/3fjLz8tnlv1rjncyElW8DX/FBmYLyCPs?=
 =?us-ascii?Q?k+fnpSOPf8UeroHSAkW00BC/yANtjnSINvmuWiNLo60uw3ZtJaE+iqUfSKmJ?=
 =?us-ascii?Q?G4i6FHpdEzWoHvq39KspoWHoZxwjQtRmMqwH/lptPh9ukdbCsytVEa6mcv48?=
 =?us-ascii?Q?I8sn8R1eS4jS3oE3JPPXspTVEG9sQLUHoiS+sboheu2gVReStYJGOHP0Gz3U?=
 =?us-ascii?Q?lrX6EGO7RCt6r6g91akcVKtS7bqC1yg5INtJ3df37OagIO4VXv5p67VP+cQD?=
 =?us-ascii?Q?6i4FFAlo/u2vt2xz9bErdMldLIchCrxjMMUL56gVUYXxZawsJqIkO+PoQLyH?=
 =?us-ascii?Q?L9r3GVguvi4e1u6xHZ7I9b83ss1l+u7hrp2jcWZ2l7yawrnNdCGYA3rdgOpA?=
 =?us-ascii?Q?H5pK88WCZaWpRXY16nCOw8/OvZPZYK5n3a3aw/Sj9rhQwkEX1u2FWt9socCR?=
 =?us-ascii?Q?SmBpdlRklZbSxF21TYJLZEqbzoIHVxVRotWkI082aTbFVjYGxWrFozXEKc7d?=
 =?us-ascii?Q?0SbGntYIDlMZAH7VB3A0zzk5llPoZQSYhXllbZKmJ5d+O2Ek12jyJdtow/p4?=
 =?us-ascii?Q?w9WTcVBYVld/f7TxG+yXE9OLgrvdiN5wk/+AHL/jIg/oEGQ39MSzPV/8+VPu?=
 =?us-ascii?Q?2Wcru1Vv1n0Bs3sjSyUMR0bl7V9CqNodN2u9YmXRjdfSkOfd/sZ/GaR6xWeI?=
 =?us-ascii?Q?uSLtpo90qmp8sQUzeBa3W8Bt2FjejXKT3Xe0yS7gGgAQ3Fn5VBHWfqBDGWj1?=
 =?us-ascii?Q?ZPq5Z01qrwiKfJjcmgsqk7/U7TxpCpqBd1pit6x/lKvkpuaoYtNzEQ7eyUn1?=
 =?us-ascii?Q?cQ3orTL3rIsQzg+7hZLXoLGoVK18LZ1K5SIxaBGu0kZ0CuZWwQFqAh6zLdfR?=
 =?us-ascii?Q?N912+EQnt3bB4cXYqevJfyswHN6mNGQu9nMf7JqXha0jr0mfdnWgXWnqS8l1?=
 =?us-ascii?Q?H3U9B50y7ZonU4D2NQmEWZoCEyfp4bsdAC6AuvdOUySQPnczNE7C6pqpsWqj?=
 =?us-ascii?Q?iD+lkFhXDrNooxM2FXR96mKd4NInK6zev44ikjAfSfiX/Eb+sQT9dnDogNma?=
 =?us-ascii?Q?A+d8zX8q5vDpOJVzRYuX5uRN05NQqUbRSJHJalbQoUjBakwUr2BprkNbc4R5?=
 =?us-ascii?Q?kFNScoHlIBAcoI4hVnQll6y0kCCPc7vehGZMk+XGebO2mobAta4egM8kpcnU?=
 =?us-ascii?Q?kY9gyJXrLGBGAUyqqc8dXTGO7+1gEW9zjjB5ceRMBmP2/qACXt3mwDue8DbY?=
 =?us-ascii?Q?geBPTl5588P/vmmhZ2w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kv3xaimwFHKRhtg4bkcUOm3BDPvQnuBNNeYxYahCPKxmt5PEheaI7hqsAtHx?=
 =?us-ascii?Q?jmxFgegVq53TdJ1eeczZklqbpLnfgvI/te67wBXLAn1QaR02UhwPlbW9Uwfa?=
 =?us-ascii?Q?KyPz54bpKqOoVtwAckCfPAapY+FceCLu7X8WH1YbZ9Psrdir0HwgMGgXo7Zb?=
 =?us-ascii?Q?mUhXibhjOWdEuxL3PE6Zqb/E1JuR5C6H7Kr+4AormEFS8a+FJNElDBmXxSOM?=
 =?us-ascii?Q?KAOC/W6uLco5Svrfs/xwNAs8XLH/R7Ir5SI5BcyL5py5EOsUWIUDImACqONV?=
 =?us-ascii?Q?ST8QESbrep45LQSGzkqdov3CABrVxw2SP+p38km88pQDhgNX5rrn5lT5DNcy?=
 =?us-ascii?Q?7kABO1h+RaS+Bn9DsU7Uhwv6fbeSvt001KvASWysmSb5IZHwE5o++2x/ZEYV?=
 =?us-ascii?Q?3TvBbULs/ZZR75SQTKH6JittjQauJQTiKZnHsUrd5Ax6BqshmtmmHdUmHykn?=
 =?us-ascii?Q?uIPlvFvp+VvZrXypRPHYdgbIsWmUwuAYRe5Ro1tYCOvuEfFm4HDoCqdtRkyn?=
 =?us-ascii?Q?B5w2cukyfFZgA8QBzJgWhq2WAXK9Ry/nVYyHbxaxo58lsD8XiEWRNEfnR7pc?=
 =?us-ascii?Q?KTG8Mg2rcBYh1D2HYh/aCB3hd44x52l2in+yGCqRMOO1D+W9Ywqd4+GUIyae?=
 =?us-ascii?Q?tw/GdZ3UaiZlVBABvtb1a3niX4amaBy7mz16TnviNTXRk2BrkI+Amvs+3OPM?=
 =?us-ascii?Q?x3pYqfEYMneMSo1FiWj3sTWGxZ245uIEsRClB6ZHyyzn7NQUio12ha/D3t/e?=
 =?us-ascii?Q?gz+D4m/3am5V4+979Xq9EFMmeKL6v10nuqJER9ZCComXQz0QwuEOSJ1fquCa?=
 =?us-ascii?Q?4YN0bGp/SiRjxz12roiO7KE4Fejwm3+jkcTbzun95Hiy2Kc+/j4ggGngWqO/?=
 =?us-ascii?Q?qsZ8cfjmgJPIFjopdZWpVuVGKSa6QzW1nXRw73AQLq/4JDNrJk8+PXJwGgxC?=
 =?us-ascii?Q?/smFOGdcJi8FpnnMLdi8cARyDzZLCSnXViDhV+T/B7aIpX3Quij7k7qUBvw5?=
 =?us-ascii?Q?4Vv9mFdiNy/K6jQp/cFdgwxMPIVuCa30a8CLaKmjUHzT9A4m4NAEdEShFsKa?=
 =?us-ascii?Q?eIFmtCvoQlkK3URA05X5dpuBVJ/YjZRtPuAyfttcmnWznQ2kQh/Sq1gi04kR?=
 =?us-ascii?Q?+VL5C7FteA+HMqIa/WHqygHahvAipHWw8hd5JIzVX9sQ2JQSFpvLt2DwEy2f?=
 =?us-ascii?Q?9gEp4Y6BS/Y4HxAd64GVRWFuhX5+Q0iIUqdJdKdqBK4e1oGMYSF/GAtHL7Y1?=
 =?us-ascii?Q?TfnstZBCnhCyL4oj1mLiCJHPAe7qCbXgKZfeJ42owSMMzOci5T5OdcvwsRrz?=
 =?us-ascii?Q?EYLaDPLY9wUn+HgRjB8wPXTs4YyeV06TT0Kp8lBonlWwdl/k2fGW78dzOPvm?=
 =?us-ascii?Q?TOl0jg6C8r8PIqqYespFX8ijvCu1dOnE9AHDGwT1YhX2xnzLZt9q41IzrIU1?=
 =?us-ascii?Q?Lhn4r5qXYKRmn0go5l31HcTJbt98SZnpNSnF3Q6sZPirDGaW+nmQ/Xz8XRrl?=
 =?us-ascii?Q?8Rh57mqh1NGh8U8O2SyQH2091xLQGCVI3f1S+3KpjYERxX5dzXrzq1PJu56U?=
 =?us-ascii?Q?PsH/Va5mvB56yqNITADH5Q1qgIjK/7LAcjjaeBYT9iXBjAPJuxWdXkh8HYsl?=
 =?us-ascii?Q?a6fTlYI+jZ/hMv6/dbVevPnUqMGqkFxX0IHjahZhxNb70KrUCQ967c8ZCP9D?=
 =?us-ascii?Q?nNkXNa9Dm2g59pBUTdNhi4pD2wFi6zDwyhgfhkjCDRLGf17XcAVRgTBG06mU?=
 =?us-ascii?Q?Jr9u5wRMVQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d252fc-7f54-4a2e-5d2f-08de72e6331b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:16:55.9755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfDargJar4cV7OH4MWckiDFF+hm3la4a/4d1DzLWUOKDl2Vv2CCVP07BBhBRv7Jjq3yA48JslgrGT210XFGaJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8613

On 2026-02-23 11:07, Danilo Krummrich wrote:
> On Sun Feb 22, 2026 at 8:04 PM CET, John Hubbard wrote:
>> On 2/21/26 11:46 PM, Gary Guo wrote:
>>> On 2026-02-21 02:09, John Hubbard wrote:
>>>> Add const_align_up<ALIGN>() to kernel::ptr as the const-compatible
>>>> equivalent of Alignable::align_up(). This uses inline_const to validate
>>>> the alignment at compile time with a clear error message.
>>>>
>> ...
>>
>>>> +#[inline(always)]
>>>> +pub const fn const_align_up<const ALIGN: usize>(value: usize) -> usize {
>>>> +    const { assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of two") };
>>>> +    match value.checked_add(ALIGN - 1) {
>>>> +        Some(v) => v & !(ALIGN - 1),
>>>> +        None => panic!("const_align_up: overflow"),
>>> 
>>> This is wrong. Either this function is always used in const context, in which case
>>> you take `ALIGN` as normal function parameter and use `build_assert` and `build_error`,
>>> or this function can be called from runtime and you shouldn't have a panic call here.
> 
> I think the most common case is that ALIGN is const, but value is not.
> 
> What about keeping the function as is (with the panic() replaced with a Result)
> and also add
> 
> 	#[inline(always)]
> 	pub const fn const_expect<T: Copy>(opt: Result<T>, &'static str) -> T {
> 	    match opt {
> 	        Ok(v) => v,
> 	        Err(_) => panic!(""),
> 	    }
> 	}
> 

We already have `Alignable::align_up` for non-const cases, so this would only be used
in const context and I don't see the need of having explicit const_expect?

Best,
Gary

> for when it is entirely called from const context, e.g.
> 
> 	pub(crate) const PMU_RESERVED_SIZE: u32 =
> 	    const_expect(const_align_up::<SZ_128K>(SZ_8M + SZ_16M + SZ_4K), "...");
> 
>> I will have another go at this, and put it in nova-core as per Miguel's
>> comment as well.
> 
> I think Miguel didn't mean to say it should not be in this file. I think the
> current place makes sense, let's keep it there.
