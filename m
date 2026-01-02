Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020096.outbound.protection.outlook.com [52.101.196.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1315C30F53A;
	Fri,  2 Jan 2026 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358837; cv=fail; b=R8ovA/RZeAu5B/WvGhM377tv6gG9UPcw5w6s76DWs315uKmf5esfPoyRPqe8zLn72B+qjpvGJPeAsT5tHtpu/fLutG8HVh1bOFqZA7lx5oAOZxXNBW/KLnaUgoS5K3nF3D7FKZE8HiIAmiGZMhHKz+Bgm3zECGcFwja/mEv3nH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358837; c=relaxed/simple;
	bh=sqdWSS5qzG8P8LJ1JhVkwyBq2x1stEX54M9vRol5I08=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M6rus/XMWRtT9Ku71s+QwWiBK8+g5DFFv6894CHWkDgY/2PUEFm7j1JddTp4KsvBUmqg+EshIKDF2SNqZcr643ZtAdEiH4g04ao1RfDpBWjIl8rhNHgKhH04cBQqa8kk+tSO3Fk2/ls5IfD+AzqyVlNMx3vJIbYwbFLB50Tt/yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=FmCqeI5u; arc=fail smtp.client-ip=52.101.196.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="FmCqeI5u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtHuxIOlnaq6Ovx2cbYzOleK0XWihYVvaoSmbEtKws3P6CdXXOeCIEiU/Rbhploa3ErawssRWWfexCX3s3JkXo7IDb4qGaRBXZOpPqqRatRgoaKvarhg/ddUrdAfaTp4StsII/Mu/wZOpiLviTNTezktCIQM5tUX2b/4fMc0aTi1UGsZj4e468nXyNppBfdCeSofKtysSJcl8syidBsxN6I3+miOhZxQOT5V0ddV4qxZ083ZbkdgidQFtkerk6cD/5DOUXk9PaBXXixntm0mJqrhedrDw4s57jINww6PgOIhy3pL/a7H82rQj1lqLwuTAKKFnQqYnba3OnltfAxuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2s6+pJMEaHqbSsesxR+H1TrdcxWOJJW6hENRpPAbH5s=;
 b=w/aKQ5fNZ5T2ijuORYP2F0ihdBQt6FGnsS0HzEF3MvU1/UV8z5DbsgG/+jWy6GEss8RdTQHANjothayhGSLwow/Jg5u9EnDx5iSWG7ISzPz2+hm7mzk8Od95tK5leYs6w0JBklQQmWw+2InIUSmC3ARz1QajShgCWSiK3tzlJK8ii4yJkfiNjA2aUWhBTLcgL8fCRpzgtO0joOdJfX4XX+8GH58APaqUFSG2UnFaL35RUYD3HENqwJcNe0WV6urAcg/8wannyQsqGFHRbm7AbZfm85kayCq7HGCke0iCwKt37Bda/PdtDQwIjc0CQeVtBfORXSb/xyYSTDeO9EEc0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2s6+pJMEaHqbSsesxR+H1TrdcxWOJJW6hENRpPAbH5s=;
 b=FmCqeI5u5Nvcvwx0WaLB2qc9NLBf4mgI9poUZ6WUh5pMdelsvzPb+VA5IInFZ/5w32lWdJT6Ebwazepg6mEqV8bx2Oi9oqXWLZGF7kIa3BCB/litABit5Q1ZDb+rl/wsRR+YO4zikjFX0MulkIxtwJN6LHaUq87c1wRkSL6KzEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB2572.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 13:00:31 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::ea6a:3ec2:375d:1ce0%7]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 13:00:31 +0000
Date: Fri, 2 Jan 2026 13:00:29 +0000
From: Gary Guo <gary@garyguo.net>
To: Filipe Xavier <felipeaggger@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org, Lyude Paul
 <lyude@redhat.com>
Subject: Re: [PATCH v7] rust: add new macro for common bitmap operations
Message-ID: <20260102130029.18119c07.gary@garyguo.net>
In-Reply-To: <20260101-feat-add-bitmask-macro-v7-1-e58a2ef69f0b@gmail.com>
References: <20260101-feat-add-bitmask-macro-v7-1-e58a2ef69f0b@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0451.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::31) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB2572:EE_
X-MS-Office365-Filtering-Correlation-Id: ed8d023e-027e-49ae-918f-08de49fee934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YIJB3xONkJESVJ3cUuYxqtRHcBgYUMbK7UCtq+glrpx+Fx9NGvzpSp9AEUXq?=
 =?us-ascii?Q?63ILSxuUhf09sTPfd+NePLMyBAxmzSanmO0J/y4r4idIau3njKKehWcXYJRu?=
 =?us-ascii?Q?mHEea9XLRfYB0KvmZPjD8yFA2yov/IKegLghutpuH+k8dgcJnsUpr9ooqZtu?=
 =?us-ascii?Q?svPrnBewFkxvu6AGAlicGkGMCH4P8q6lLYEwB13QrNb/ezTMKMg2xGF1jfCP?=
 =?us-ascii?Q?9V1G7e/ZKUvtOUYkpgBIQ4S2DRm5ZPC1LjymMSBMfOspjGO/ZsGwRNAk2pyJ?=
 =?us-ascii?Q?2n565ahTQTeg/eBsebUYLLeRseuStvOdWrBOjNO+JffMTBdQCVb+sW7ILx1C?=
 =?us-ascii?Q?j6mdTyuRlbUSlkEOgxU4BJOnG3q4QOy9xGgSIqXtoOqihbQaSgMbH+nccA50?=
 =?us-ascii?Q?+XC/c59OZivgcAlAyPsL0LGvJkNGS6z2xdBcV7OmROxJd+wvBMT0CmevK2Wo?=
 =?us-ascii?Q?Cs/I/jkQSiPmy4lO6kcpFFuNibuNdK436stE7ZOHUrWE03ov4heT/u1jzcPY?=
 =?us-ascii?Q?sRQYNQrZzArfeVGzONI8m/NO/gw6JyHq/6iQGDn/nr2PI3m/y/Rdck/kJcJu?=
 =?us-ascii?Q?S3+gKQ4Tex4CvvIL+MucTUEKkvCeen/nl2d1uVcXcs9ee8C5uKuAAXRTisER?=
 =?us-ascii?Q?JBFjfji2m2n6ZQXRMM40W/jqU696COHxwMHjqs9GmYVCcNjBUCkISanQlntn?=
 =?us-ascii?Q?b/JvQjJNoqvPbi+dWw0vzWD4MhgffQM33Pl0nor45GM8hniuEPp6uUHVn9Y+?=
 =?us-ascii?Q?/Tgz8lGhT729OgDuaQF8CH+EkQFXplQbOp/ucpKM9WlMR9U9npiQ/+06vnYz?=
 =?us-ascii?Q?JCvNoBWAGbb9wgD+Ucf4v+rAiLcXJhxW74EZuAOVd5SOS/OCrSe9bZ2yoHi6?=
 =?us-ascii?Q?G0vQq8emGXhFOl1tYU5wcV3JdL7HgCvLPUWWkIqosQM0grjs8OogLCeURKL3?=
 =?us-ascii?Q?M87qZShS3lmJmYxA2Reu6yBVPRe7h64nszqnpgHqpEaiUfTz1yZwlrPx3+tx?=
 =?us-ascii?Q?O97K3wgCTgpL81wZXL7508M+cz9bonNgzfCuEfPH0NQjHnvEuNKiHLNX/MF/?=
 =?us-ascii?Q?K1Hi982hm2LSAYsuav9rUiq0evDis3At1HOSn5XxiyfG0fQbkMZrMcY1zt9v?=
 =?us-ascii?Q?aoWfSKdm1yhP+sY7HO1QxSsmbVCo3G4TrnlvI8xR4cDlbqxzTRHVUSHq+ZxK?=
 =?us-ascii?Q?ADqnrEwOxUpn7HO/HdGNJtrk6F5r16EUp5Xkl76AlsPljDHqulpjyBY7YUTq?=
 =?us-ascii?Q?GSsjesqjENqGKVFlbHvVLftyaqW/3QeYPRFk7c+VJqitlTTjAYTwxlZVfGQL?=
 =?us-ascii?Q?XRWwox7EllN7kQIxkqKZPqcEEk2tKcAfv+HKOpWXdgZ1TzWS2ep5Uytl0PU/?=
 =?us-ascii?Q?knLKYrWzXZmjRV00CIM8TEoa7zYgSFG2MLNxpFkee7hn7m68FQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aw5wfmb2yXlSEzFrf7D75B5hYn9qmARZR1pEx6ptkU6QfcuvJk0V8P35haAf?=
 =?us-ascii?Q?pZ3DOlESqTEpzwR8ZMxEmXJ5WUJ4PCMOalKE70RawKvMBo9Y6BzCfV3efDty?=
 =?us-ascii?Q?TKxU1O4esIg/m+euPIbgvV5M+MWT6tu4dfnEpQNpP+hQCQ1i3mya3ytkS+Zx?=
 =?us-ascii?Q?3p91/FoPY/rq2cvZDXc5++eoEqeTEaYkvjDvg0AzFgtjStBYcasjDaAmYo0+?=
 =?us-ascii?Q?kyoz5g3yV4G4hV7RE9cwVku8oFhF7ChoLrKg77+/m0WPjikFj9cO6cqAIX0j?=
 =?us-ascii?Q?CkCgCC/gjLgJJ5VC+1ZgMHiu0IrER6b4J4Sx2mI4+9i6ppr4KfTrOmJHj4Ij?=
 =?us-ascii?Q?7HEzFvhVkm170ouzlffUdv/wjv+7QEyJuwIIHp1gieWndoAs3nYywleTBMHi?=
 =?us-ascii?Q?2W/9JmwuZrSRzHfgkybyZT9Ffzf/fK7rGr2vTfoTnVyv66QXBNcHKyAI7Yt8?=
 =?us-ascii?Q?q7D9e5rbT86fUzYd+lUuXBrL7JKsvOqKfww9inIcmhCz3Ya0w3Ud8OQpEtum?=
 =?us-ascii?Q?GP3cIOPIWZvQDTGL5ZBlpnsHKIQXrXiptOh0JFSQC35zGQnXeEi52I6YFq92?=
 =?us-ascii?Q?CIsN7mpk/wyDcxtuNscnM88NE9vh94dvLd7gFoGAfNwwT5dpiNBnbO7hKGts?=
 =?us-ascii?Q?GXJgFsohixQ6b/QMwtx9Qb8Kw/AfLTMJ9Q7szzBr+Ckh+8EGIA4rpKNlncv3?=
 =?us-ascii?Q?iYXltq2vXRcOZ2GHL/yxu9I0X4MMbuHz+T9Ncjy0oWFZy2R7+HiJ/TQluKGU?=
 =?us-ascii?Q?AaLmusdCVaoD7b4kAPl4id3XPcgxJyljKBrG5heq0m2JpaAa7Trlhq1vx3w0?=
 =?us-ascii?Q?nO1bjVeqqnXuZd97p+hDICP78EqwFmDBRxftH1GxyumHE974lIDS8opv+DPo?=
 =?us-ascii?Q?jzmn9Hxvq8XEOS81ioe8lSaHa/r9io8CydPoQewM4EZRhAM0XsKn7TmLQSB9?=
 =?us-ascii?Q?odAf9VFbpeE1u+2zq/ZxC2CAARfvK60Ex3guwbI7P2RzvZufZyszj+NJlUr0?=
 =?us-ascii?Q?FK77drEvm5PcAssv0zYTPuviEE0itT5eV4IIItMVAvOu80GgLV6hcsE3B3+i?=
 =?us-ascii?Q?p1jIIUtt2yVD37ytB7t/BfARRBOv/AbNh6NgoLAs2lbobRELmOWxSyjAdART?=
 =?us-ascii?Q?veF4T4BNQvXZqgUxI6OxcwdlTPWsMv6FQ4j+b0ycavVP8U6A+wJ1uz8a47n+?=
 =?us-ascii?Q?mXVzL69Ts8SIBot5s/CZGOp4eS7qkHRTFsIOCF2HL7bgnJDbqaiDZsd5dxF4?=
 =?us-ascii?Q?A2S6PI3MThQOaPLaQ/PeM7JrDkWOn38Kd1+iO6rxjqWx/0ppTWZ7pJ1lcbSw?=
 =?us-ascii?Q?V+0rdQghxPgtfvVP2kOG7JUYybVaFPtHAFZRvTHUDAu/cAooxCbCNdCDv40f?=
 =?us-ascii?Q?q4Rjz8TEUnv5I1BbF34Jb5Np4ohjkHH0jlPSqdV4gyPfLQLCfX6tirR3Ss0j?=
 =?us-ascii?Q?B1NYf0nHUfquuBhk6MjMDFsU6OXrzbekB9/yg5g/Cdgn2FwxpXDRrn/zuK9K?=
 =?us-ascii?Q?q+lNOTC8LEsWw0sGxL+BuzA1dXGVs7jRGZqrJbE/6A4I/f1yfNqY//f/Qclc?=
 =?us-ascii?Q?T7HoaqJQXx9Qbz21ccAoYCfQSVTJW1DngyOQ5yKsrNx7D41bNGUzTDUJ9YUs?=
 =?us-ascii?Q?ehzWuAj6oq5lm2xD9nYjAgnG93KYtWxSoHyLMdj9UivMOz5g7AVwNRGiw1MD?=
 =?us-ascii?Q?+8orxHtpQmktXP5XXwTjokO7Cu5VmfHJC58S7kAegyXb5U8YqqiYBgyONLOY?=
 =?us-ascii?Q?pepKzFDZcQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8d023e-027e-49ae-918f-08de49fee934
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 13:00:31.7227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1p0gGrp78TP1D7l2RgY3DHSrtrkST3PuyP/mqdxGwgWt37ul0CqhJif00sE+z+tdroYBxoEnuiBjCfupq7/ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2572

On Thu, 01 Jan 2026 15:21:16 -0300
Filipe Xavier <felipeaggger@gmail.com> wrote:

> We have seen a proliferation of mod_whatever::foo::Flags
> being defined with essentially the same implementation
> for BitAnd, BitOr, contains and etc.
> 
> This macro aims to bring a solution for this,
> allowing to generate these methods for user-defined structs.
> With some use cases in KMS and upcoming GPU drivers.
> 
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Suggested-by: Lyude Paul <lyude@redhat.com>
> ---
> Changes in v7:
> - Mask invalid bits: add all_bits mask to preserve only valid bits in Not and BitXor ops.
> - Link to v6: https://lore.kernel.org/r/20251205-feat-add-bitmask-macro-v6-1-31fbbf14b15a@gmail.com
> 
> Changes in v6:
> - New methods: add new methods contains_any and contains_all.
> - Link to v5: https://lore.kernel.org/r/20251109-feat-add-bitmask-macro-v5-1-9d911b207ef4@gmail.com
> 
> Changes in v5:
> - Docs: improve macro documentation.
> - Link to v4: https://lore.kernel.org/r/20251026-feat-add-bitmask-macro-v4-1-e1b59b4762bc@gmail.com
> 
> Changes in v4:
> - Use enum: changed flag type from struct to enum.
> - Minor fix: airect casting (flag as $ty) instead of field access (.0).
> - Link to v3: https://lore.kernel.org/r/20250411-feat-add-bitmask-macro-v3-1-187bd3e4a03e@gmail.com
> 
> Changes in v3:
> - New Feat: added support to declare flags inside macro use.
> - Minor fixes: used absolute paths to refer to items, fix rustdoc and fix example cases.
> - Link to v2: https://lore.kernel.org/r/20250325-feat-add-bitmask-macro-v2-1-d3beabdad90f@gmail.com
> 
> Changes in v2:
> - rename: change macro and file name to impl_flags.
> - negation sign: change char for negation to `!`. 
> - transpose docs: add support to transpose user provided docs.
> - visibility: add support to use user defined visibility.
> - operations: add new operations for flag, 
> to support use between bit and bitmap, eg: flag & flags.
> - code style: small fixes to remove warnings.
> - Link to v1: https://lore.kernel.org/r/20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com
> ---
>  rust/kernel/impl_flags.rs | 250 ++++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs        |   2 +
>  rust/kernel/prelude.rs    |   1 +
>  3 files changed, 253 insertions(+)
> 
> diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..e908142f9a474ed79a5168bad2bcfe2b2e06ee40
> --- /dev/null
> +++ b/rust/kernel/impl_flags.rs
> @@ -0,0 +1,250 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/// Common helper for declaring bitflag and bitmask types.
> +///
> +/// This macro handles:
> +/// - A struct representing a bitmask, and an enumerator representing bitflags which
> +/// may be used in the aforementioned bitmask.
> +/// - Implementations of common bitmap op. ([`::core::ops::BitOr`], [`::core::ops::BitAnd`], etc.).
> +/// - Utility methods such as `.contains()` to check flags.
> +///
> +/// # Examples
> +///
> +/// Defining and using impl_flags:
> +///
> +/// ```
> +/// use kernel::impl_flags;
> +///
> +/// impl_flags!(
> +///     /// Represents multiple permissions.
> +///     #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
> +///     pub struct Permissions(u32);
> +///     /// Represents a single permission.
> +///     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +///     pub enum Permission {
> +///         Read    = 1 << 0,
> +///         Write   = 1 << 1,
> +///         Execute = 1 << 2,
> +///     }
> +/// );
> +///
> +/// // Combine multiple permissions using operation OR (`|`).
> +/// let read_write: Permissions = Permission::Read | Permission::Write;
> +///
> +/// assert!(read_write.contains(Permission::Read));
> +/// assert!(read_write.contains(Permission::Write));
> +/// assert!(!read_write.contains(Permission::Execute));
> +/// assert!(read_write.contains_any(Permission::Read | Permission::Execute));
> +/// assert!(read_write.contains_all(Permission::Read | Permission::Write));
> +///
> +/// // Removing a permission with operation AND (`&`).
> +/// let read_only: Permissions = read_write & Permission::Read;
> +/// assert!(read_only.contains(Permission::Read));
> +/// assert!(!read_only.contains(Permission::Write));

This comment is confusing. It should say "Masking a permission" instead of
"removing a permission" as it's the flags not mentioned that are removed.

Best,
Gary

> +///
> +/// // Toggling permissions with XOR (`^`).
> +/// let toggled: Permissions = read_only ^ Permission::Read;
> +/// assert!(!toggled.contains(Permission::Read));
> +///
> +/// // Inverting permissions with negation (`!`).
> +/// let negated = !read_only;
> +/// assert!(negated.contains(Permission::Write));
> +/// assert!(!negated.contains(Permission::Read));
> +/// ```
