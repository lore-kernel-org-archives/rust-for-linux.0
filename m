Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A545FDF6C
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Sep 2026 01:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789521926; cv=fail; b=bxKwspWjr9Az4J48hJTOpsQkvf0FqNYywhvTDdlu5lRZ1K3FzYFJHDxKxmcWrAqZP1nj6CJwBgay8XIBaGUTr6hmZJsyC25qXx3BeDpc0Y4GQT4OE6vuLA+4GDJJ9mCK2lbi8JCWlKc1VGax/xELYnJkZhMadLXSCtWtMhwVBfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789521926; c=relaxed/simple;
	bh=lfNp9SABaZiGxUfU32lG1A4OgGoJMAclQ1qBg2iPTwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mItbAteZm+VBDNpuoH872KPzxtOYMkM0jCAUn01v3zekMeRpKtt1IWxK1gN2pmIrDyrqqu/0NYBKuyd02SGhpUZJdxtF/bbhm04Fh/+riskws2D5uczHQoXTJHaIqm6bduEf029qLFS/xa9DX1DGooaRt9uIARpAmeVhek8fV6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q0teQGq1; arc=fail smtp.client-ip=52.101.43.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q0teQGq1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXtzSs44USCRIqjWWjECsF91EAYVIXHJlLiYLtDp9/RjCOxX+cWf0U7pIYzPdTgu4rcfWCr/jMHsxHuZIk6ARrlf6VZPueWkt/7nBmQTfib/Y/ErqMn+UaGjmoPSfZu2RMYPiU41WK19lVMJnKqtDwtlz7xXvA5mEUqqzeRUKpmPqfXEg5K1UsNR4sK+1V5GeVwimk6P6uqDzvzLw56Cyc1jcynlRKeyYSjnBIhKGTvJDCFmqwLyufokaq2ZIoCr2apJqM2MTvGG8t7wU8nslu9Q75IRK89MorVCLcD21jxcDh2l0t6wH23CUWXy4kX34LS3bAGS/euarX5SNXkp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5asyj6zC2dyoP7EGc5ieNg6E2SQYalG3LmNfpXeVuE=;
 b=gNfycQlLX8EaxbYQPWjc+SLcDA1jWzxXfzkaXc3fJRG4bVdXRrxmzoC/YuUg6fb4EaX3QEGlTkOeiP38m143IE8OyqSswcZ2JhOYaW1qkOkq5cEIhBlPus4iTtwpNlPthYpWaZ+JAKqfY6qdLvPoea4b6wgNf4p07qJD6kfDSDAPoUXokH+JvdPTl+PV1raAsp7uI3G45Mkpdhu5dRc7mIRSe+Qrrmq7rWYZ2APpo+46sTQ8K0OPlmB5BNnecvDRGSUhT/gMQdzLCJ7E2Hl8Ba5kIVq+AwxItOSsdB8fINf3wx5ggVO5u0Qd2Ra8nuJUZHZA/2bH54AVpe5vkxVmAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5asyj6zC2dyoP7EGc5ieNg6E2SQYalG3LmNfpXeVuE=;
 b=Q0teQGq1K5Q3h4GJuraw3d8HRJbRfrQgco2QAg6AZdt7D0NKU+nkJwU+w/PdhD4dFEfuT1T23+/u1Gk/B4znZXdranMWHTGmpJpwMBol3wyFIYjRA6yWaw7LppvuE1ig6GwE1bJX9BYFWHW0RsHn/f2HugT7AWZrIzBHz2pLTZntKlH6eoZtH9jUZOJvu+HJOqFCHP9ZZ1MlQmPMkOwAmaywD8osc7FWPNmQpt+wjL/e+mi/WnsZIM+bC9bCo9r+0L/hdjakvfM/RYQiUcLUpKmTjmGnitCc7UClxMxjoTvm1ZeGAZP5nuF72wT+znK7J+AOS9E1mXN1tZpcmmZkjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22)
 by BY5PR12MB4289.namprd12.prod.outlook.com (2603:10b6:a03:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 01:25:20 +0000
Received: from MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28]) by MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28%4]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 01:25:19 +0000
Date: Wed, 16 Sep 2026 11:25:13 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Asahi Lina <lina+kernel@asahilina.net>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Subject: Re: [PATCH] rust: kbuild: export symbols from the `uapi` crate
Message-ID: <aqnqBivf3is_1N7x@nvdebian.thelocal>
References: <20260909060623.888777-1-apopple@nvidia.com>
 <DLAUS65AAH2A.39ZT3OE05AR1K@garyguo.net>
 <aqIQNhGdRTsv4v52@nvdebian.thelocal>
 <DLBLTKG6KVE9.VNWH1D3896J6@garyguo.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLBLTKG6KVE9.VNWH1D3896J6@garyguo.net>
X-ClientProxiedBy: SY5P282CA0192.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:249::18) To MN0PR12MB5977.namprd12.prod.outlook.com
 (2603:10b6:208:37c::22)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5977:EE_|BY5PR12MB4289:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c1427b-7026-4e74-2eac-08df13915ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|23010399003|376014|366016|6133799003|22082099003|18002099003|3023799007|10067099003|5023799004|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	VyRvNpzJ7LguzlmLfpPipz+snC7v0qxWdM3asZdlgxr6TgGw4LA+BYKlJ90CHYI2SOi8O2N5KFPGbARyDh3kNH/VTra8mwh/xxPHAUiKbSZl5ixWdlsCSDY8+EzsMdeZ9lJxGPCAJNZpA4jEEq9+qeeZDHJIKp45GOboLnrTph47x4WvCLGIAhbdN07gFYr37ZY5QHnmMIZqxZutr0szL27sRN6Ah8WHKD1EiNqTzVcUVId/sLa2ssl4TcDz44a+THcODvTftY1rsRhWUNhfyl1nId887n0tPKAUl1ide4lzjnTAcgaGLB61u1ZTnXy4rnZJHOF1cWMndqo4SimTF81X27NP1yvpQcMMixr1S5z47f63Ug25YGtf1XaDftgVAJ05zy+dZpnyCRM2PpuT49h7v4RzYSA5YGa7Z6zRgLytMcVnl7ZpLoks1QYsd/lFClgABhfEVeFsrgkldVYroWpcyPiokM7eC2j6IZjzTZI9Hg41ed8XcLihtWIFDLM4ACVBQJ/zyQTroyJ9fYRGeg/oPpXRnvICejPQJS0KBPZgyy6EqOvVe6Hs+apUP7a3WToJueiGPAfXmR9OYKqMlDyQYlaiICZHuzIuzVPL1jkodhSyTQkfSXQ9B8d/eW/i0LTmODWxkB0mTnUfmNuskPtOHFyU5Jo6TC7TMf89c/8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5977.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(23010399003)(376014)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(10067099003)(5023799004)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p7LUNc6Wbo9d5zWTnpCi/IJXHNOShUzAN7Wk+WST93/J17Bkc/PJ/2VtNuZ9?=
 =?us-ascii?Q?uoIYeGiRI6MdkiZCiQw65y3A9SMme4DGSAtlNmdXix6ia9aURnsspw/Aq1sE?=
 =?us-ascii?Q?OrK5CKJk6NP6nvSOkwLeCdSRYDgHDSpVuBI0ARKQKkXv3Mz03fZ3guqrl9Au?=
 =?us-ascii?Q?inSH8zr+0FIamAcHzRkUCV8D6ejPUQ/zGdsLthg/lMUJoY3H+q0x8550GnG/?=
 =?us-ascii?Q?4R8Osx4Q5eKE2iaEMTnEB+NVY0ShuTKFj+1WkajVjrC8KjPJ2Tu0bfhRTcN+?=
 =?us-ascii?Q?6NeDTevBahPkdoZEWvRywWNvwys2DWobzH4tiHfXqvdUWisKgx+VVWf5i8hs?=
 =?us-ascii?Q?HG5/9mkdYnKFrDqvbZ4p8TsrageG2Iu7RvkoCrL0Fft1T3fsPflk0NsCB7DM?=
 =?us-ascii?Q?Z5GzGUYYWqfzw3uXBgJH52zggQhn10GgXesqCINvfBFAJ7BjUcClf9yxOMtJ?=
 =?us-ascii?Q?ZBGStXTMTL/bUTw1UgMLW9m/J2T9KoNGgPdjU86pcXQCOmFpUpWwoygUdUZS?=
 =?us-ascii?Q?WyQtbFJ+PdFX4G9mxFzF0SBuo10hkz6+0OxTqga4QW4RZslDHIxRWgnNg0mG?=
 =?us-ascii?Q?4STkiFftWip849WxMFsRG5CMOGs6VoHYGITkANncDP1YNlqc/Q1sWoUZRRJq?=
 =?us-ascii?Q?5SyUa4o9jpEc6Q89kQZ7xuahHmhAR2/xyqnYC/AMKxJ3gbkJ0e94+MgpBAPR?=
 =?us-ascii?Q?lzzXTwCRQ7q54uT4LdpvW4GuHHgcUsDhmlQIAJWvd7KjSQMoXKWX0qIum+vu?=
 =?us-ascii?Q?MnhkeGlHqt1BYcjTKOldD7GLt1V7AHOQjrxF0TwQB8a5qp2R6BOGoYS2qfvo?=
 =?us-ascii?Q?8Pa7geY2n5z7fOjdjjrIOuXEddF2hmwoa5NZsLB3qZaD5c1oUDUxQ2k8SOTI?=
 =?us-ascii?Q?hPLhlwCNA13gMzm4DhsSo+S7rsJBfUc8vcT6BAnFbmEjmapuPQ6jaZivmIEE?=
 =?us-ascii?Q?Yk2HXYTf/j7gEzTe5/XS2F2pDDsSk4wLWZJ0OSk0jaFK3HCtu9TLL4orfhdm?=
 =?us-ascii?Q?ZejO2lRdSEqv0w8pghUXLGl5a9CgfKk+uYF/29VPaQDHX/FfdvlDdHPZyLgn?=
 =?us-ascii?Q?4snKJ2ykwbcZPyQUuTMOsiFaEORVxuPcMEhrFT9dqf22jU5Sv+hvwvilZms6?=
 =?us-ascii?Q?IC342dIuwQRkBI6nwHZNPI0Y0PZ8OlcVqbApioj61ERgJ0bZ/xrK1P6Ces3C?=
 =?us-ascii?Q?AFqv8HqytXm0SL7vkUwqROJ97wxyyJz604j7DC6UPcjKRXEJP1p7o31RcvS6?=
 =?us-ascii?Q?BldWldPohm2wBT46GVBuVw4ixLQh6CXQFyTDFlI0TQx70q7+AgMYFpphvPa2?=
 =?us-ascii?Q?8GsAg1NYa52MHTaFZw8B7CBACecW18B/Paazp8QWGM5Mb+ZgOmHzCgbDfL8m?=
 =?us-ascii?Q?/eEpY18S7cMp/6nQ5wziUYqHzAYMvg139AOlBND2nviVoQf7GrCstz9faFwH?=
 =?us-ascii?Q?lZNMkZdp492fW/OoMrnaU/X9OEuWmcFnKbotS2wtZCSSw76Dpfq/PiglTCN1?=
 =?us-ascii?Q?rOjRckzHc25uLzGPWCfRApfhJcfo4Ial2M3YcRzxpplhjqAhaHW0ACFPu7NA?=
 =?us-ascii?Q?zCR4OPEEwcBX5jra3RQszGuXT2fbyiVoHWchuSqRaNid4LrRbNKF/j1YFVPY?=
 =?us-ascii?Q?nTS8ykk027olH/o4XuimiUQhR2lbZK7X3hUzzQ6sZ6wMe88zi3HdU0ps2K5k?=
 =?us-ascii?Q?YUKz5HzXw8AIoPFbjPpgLidEgiInuVz48Z5baoT/++e9NW60doKi04YJOXNB?=
 =?us-ascii?Q?XgmDeACcyQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c1427b-7026-4e74-2eac-08df13915ecb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5977.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 01:25:19.3693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCvaEzODpkYLpjdnnP+Cl7W0+NboqCi8eV9cD13TPo8Kl1FPxXYR04FAadPX+KR5ygm9urq3uU+5pfPCvrYQOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4289

On 2026-09-10 at 21:36 +1000, Gary Guo <gary@garyguo.net> wrote...
> On Thu Sep 10, 2026 at 3:21 AM BST, Alistair Popple wrote:
> > On 2026-09-10 at 00:25 +1000, Gary Guo <gary@garyguo.net> wrote...
> >> On Wed Sep 9, 2026 at 7:06 AM BST, Alistair Popple wrote:
> >> > Symbols from the `bindings` crate and the C helpers are exported so
> >> > that loadable modules can link against code the compiler chose not to
> >> > instantiate in the module itself. The `uapi` crate has the same problem
> >> > but nothing from it is exported.
> >> >
> >> > In practice this goes unnoticed because the only functions in `uapi`
> >> > are the trivial `Default` implementations generated by `bindgen`,
> >> > which rustc inlines across crates. With CONFIG_RUST_DEBUG_ASSERTIONS=y
> >> > however, the `Default` implementation for structs can grow past the
> >> > automatic cross-crate inlining threshold. The module then references the
> >> > copy in `uapi.o`, which is not exported, and the build fails:
> >> >
> >> >   ERROR: modpost: drivers/gpu/nova-drm.ko: symbol '_RNvXsH_Csk9v2ZIpWbWt_4uapiNtB5_17drm_nova_info_gpuNtNtCsfr3MPOfBGpN_4core7default7Default7default' undefined!
> >> 
> >> Hmm, uapi' ideally should just be type exports and produce no code.
> >> 
> >> Default implementation should carry `#[inline]` annotation so they're
> >> only codegenned in actual user crate. Rust's `#[derive(Default)]` would always
> >> add that. Can you check if that's bindgen-produced manual Default impl that
> >> somehow misses the attribute?
> >
> > Right, bindgen-produced Default impl do not have that attribute. For example
> > here is the bindgen generated implementation I see:
> 
> Perhaps you can open an issue upstream? 

For sure - see https://github.com/rust-lang/rust-bindgen/issues/3494

I wasn't quite sure of the justification for why we don't want to just export
these, so please feel free to comment there.

> >
> > impl Default for drm_nova_info_gpu {
> >     fn default() -> Self {
> >         let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
> >         unsafe {
> >             ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
> >             s.assume_init()
> >         }
> >     }
> > }
> >
> > Manually adding #[inline] fixes the problem of course. I guess we could add some
> > sed Makefile hackery to manually add it. For example something like the below,
> > not sure if that would be preferred?
> 
> Yeah, textual hacks are a bit too fragile (especially that it'll break when
> upstream bindgen adds these annotations). So if you need these impls, I think
> exporting these symbols are fine.

Fun though :) But yes, I agree this is pretty hacky so would rather export the
symbols, at least until bindgen is fixed.

> That said, you can achieve what you need with `drm_nova_info_gpu::zeroed()`
> instead?

We could, but I'd rather fix this here as people are inevitably going to try and
use default::Default() and the linker errors that come from it are pretty obtuse
and difficult to diagnose what the problem really is.

 - Alistair

> Best,
> Gary
> 
> >
> > ---
> >
> > diff --cc rust/Makefile
> > index da1a7409d984,da1a7409d984..535a3bf181bb
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@@ -525,13 -525,13 +525,16 @@@ quiet_cmd_bindgen = BINDGEN $
> >   $(obj)/bindings/bindings_generated.rs: private bindgen_target_flags = \
> >       $(shell grep -Ev '^#|^$$' $(src)/bindgen_parameters)
> >   $(obj)/bindings/bindings_generated.rs: private bindgen_target_extra = ; \
> > --    sed -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub const \1/g' $@
> > ++    sed -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub const \1/g; \
> > ++        s/^([[:space:]]*)fn default\(\) -> Self \{/\1#[inline]\n\1fn default() -> Self {/' $@
> >   $(obj)/bindings/bindings_generated.rs: $(src)/bindings/bindings_helper.h \
> >       $(src)/bindgen_parameters FORCE
> >         $(call if_changed_dep,bindgen)
> >   
> >   $(obj)/uapi/uapi_generated.rs: private bindgen_target_flags = \
> >       $(shell grep -Ev '^#|^$$' $(src)/bindgen_parameters)
> > ++$(obj)/uapi/uapi_generated.rs: private bindgen_target_extra = ; \
> > ++    sed -Ei 's/^([[:space:]]*)fn default\(\) -> Self \{/\1#[inline]\n\1fn default() -> Self {/' $@
> >   $(obj)/uapi/uapi_generated.rs: $(src)/uapi/uapi_helper.h \
> >       $(src)/bindgen_parameters FORCE
> >         $(call if_changed_dep,bindgen)
> >
> 
