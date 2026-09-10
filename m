Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012003.outbound.protection.outlook.com [40.107.209.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5EF36A35A
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 02:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789006930; cv=fail; b=Rbi2xWCAoQ65dFSKcwdUbtCAmpKUz8bP0HWpacYnO1tGfQ6x5Li1/HoA9ReOgsebxWpxqCat9i4umb/lpR7umIDVbkGMbQjhN1+UwK34h0RUSP6L0vGzTJYzhcdN+B4qBzUp111h6GxmVVGeqVvGNc2jRPIZvkfo8/u21MFV/H4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789006930; c=relaxed/simple;
	bh=SoDNtLyG77hKJo4SpE2QAA5wlKoRfvERE5hjKFydcSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YXsoV2+xpIbx66mzbTJpK8F7ZFa769DXGZ0HPe/KAyS7EGeWFcXZVBYAVT+Eo14fkCGD+yhTMhorAeZV1ZwU0WVAAn0WMDY4ldS6qkE6y48ecHifbGMIkc6zulMCg7FOjJe9+0HYM2ZYPVWqaAIv/b2W+4ynTfQ2f+h/n5iZEcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=npZTCVI4; arc=fail smtp.client-ip=40.107.209.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="npZTCVI4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcNj6kvqM70R2rJ7VGn72HSglJy/wLQuOrZH4H4+QEw8Yoy77d7U0jthGebB3GaqBlYV4VZcuRLWBhM0Z31zj0KrUOLjA9/0Rat+gIyEKK6qMzTh9T6emse4dmvoJFd2M2C+mVv4GKc7JNbsXO+feUjKQWTC6qp6y/ypx6F9u6fchz4k+qHROA3vy5h6p2JOn1CEVdVtgqwDDdsCuz5YUNMjFIzTlc/k4mv6j3R3i7kSjz6HT6VdV2Y6R4AlNohSanfRYnjBPLJm9ZOfFd2WYSiUCNyEkt+2aMLtw38EUlvg4/tLIQk+uMT4Rv8wamVQV4EpvbPNIaNvg0G+Fvo+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5p9UNx1cOcEp/dcsekdnCs4Sg35R4ckd2npdT9ak0g0=;
 b=zR1cJ13giSx2lEyQuJeAOp9pl4YLNM0Cw/tTSjVSf7YbGZGqyP5brVFFLnCk5wuxDyjZOWB8LCqrA7r6b+EvWjiN69mLdCqPHCIWnYk9eud6C3hO/o9As8G4QVlILiA02Z9d/cXxAZbCea7oXpvQxW/OgmayDIPsgWsc0M9w5IFsBhvhSBQh4u7w2G0wbrwPdZwV0+yrc+OjxBksSGUhW1JSiCLaJ2dlPl4IjuRXayaJyPpPwV7bUbhrYMeW4G1bIlvU/ay9hNNWl3dYVHrN9gXMRov5o1AJROlv+VyDQkTKig6A5kuL5y6Q/dkMA5Zm7BfZCWdeg5meuhptkiW9Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5p9UNx1cOcEp/dcsekdnCs4Sg35R4ckd2npdT9ak0g0=;
 b=npZTCVI4Fqlja1oKhaDV8lruYMUvMu4f+3qHG6Z4ciHYp7RBNWTPtLu9pqOETU2Vy2oRFLCvLMnyWd+ls1i2QlMNQmVmMmm5KP0GFXZqeZI7nUDepL2yBroZZMln3Z+RiDpqdFiTe/7UveunxZ/NWUFptpfQs3LG7eoytGAMY/ltfJzwrfKEi753qDJp8uvwoteBIQ9m34X7d9UCEQkw1c3CZk7tqM167modoaOU3DvsvUMOZ7OMBnoH6a9tMm8O30DyG0yaBAGKnc+lMu1Q0KrDcT4ElXn5TnY/IT0vJZc2wz8aOPyRJDCt2Z2mSD37/MGRySC2VsgUYxktn3lblQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22)
 by MW6PR12MB8736.namprd12.prod.outlook.com (2603:10b6:303:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 02:22:05 +0000
Received: from MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28]) by MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28%4]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 02:22:05 +0000
Date: Thu, 10 Sep 2026 12:21:59 +1000
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
Message-ID: <aqIQNhGdRTsv4v52@nvdebian.thelocal>
References: <20260909060623.888777-1-apopple@nvidia.com>
 <DLAUS65AAH2A.39ZT3OE05AR1K@garyguo.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLAUS65AAH2A.39ZT3OE05AR1K@garyguo.net>
X-ClientProxiedBy: SY5PR01CA0033.ausprd01.prod.outlook.com
 (2603:10c6:10:1f8::10) To MN0PR12MB5977.namprd12.prod.outlook.com
 (2603:10b6:208:37c::22)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5977:EE_|MW6PR12MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: c254e89a-5a84-40b7-9192-08df0ee24e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|4143699003|6133799003|10067099003|11063799006|5023799004|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	b3EW7SDqQtijb6OlKusaLKOMlb7IrIFKZp2A0yUVY7jx/zOfqgThcNNwjNirbKAu41dEgogSw6fvizl+7wdhIPhpq5jLXzhwPseIti4ZyUEx7WSdpHdnSiB2QD+/G37ckw7pOwCEBvfigrFxSz9RcQv+Y7m/usVWHcs7Ftk4A62UGEPOJzXfhu53durGqR4ehJCA8gj+HvxBp+49bLRGAFvEt8evHb2BOFuFNveKMyrPVa1Zzf/CUVE2v9gvkqi4XliC4cRM7wz8IMUHsLyLLxDCRaHmobDrt3UsrNHm+VWEqn3Dn50ypiSBzzu1MiZHv9Pvf69/2UaiwO4GkyCm+PhZvimNo8u7CvXwn5J/pvgiQbz0EgxXJpexgLjeR1jkuSmL3/cb2MRTGFPAfL/fU+GOGh4h/5pYAsiXd+HaScHv1gh8PSlk/jlBW3y7bjrvvUmzrJxOLK2oZJLw8iZr1VqLX7jEyaaTQ2kt1JIWox9vgjN/+pt3QdbZ4wHyjAvWQJhFJSNib9iR8muSru8WXKyW8zFxFFj+MsBMX5f08UUddkkpjYqFVqvLTXQnnUscLDozbKjhsMY8z5hrx6eV9lv8J0dqKWEYgiZgEWOmNp0BggDNtrYhd+RsvhkK1tAbQT90w25PKoKzY91nxKGlkKxW6R6p/addadQoseQv3vU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5977.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(4143699003)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kBl5qpFa90dp9L4qXtR+5s7YNDcb2zjqgiaX/MS8Gktt3STurbRq5mAUPGGk?=
 =?us-ascii?Q?FicKcpPwOwBbxhVr7Flttn/LXveZIgBolTpjKHpiF5QkB94RY/sa99O6FrdU?=
 =?us-ascii?Q?wukkCpblHw2hvFd95/8g8SAMGHIZ4Q5V5xNUGpSPp0D8Wwrghw1wAx3ojhka?=
 =?us-ascii?Q?kGVk1ITU5hr85y+NjnFH8RXSet626IRvBGz0eRnjI2uP8DdAh9a82AmvsZIP?=
 =?us-ascii?Q?OIXklN8eerZtQXW/mKoRo3rN3BnJPBRqvP7+MqECETUWizsYxAGIU/bXYSTh?=
 =?us-ascii?Q?Oi/x3+mJqGYunSuqQkE1+m40bAIX3wh5c20HMXaUSxjFYbuABZXHUGgkoZEh?=
 =?us-ascii?Q?vJckiXRSxSVTCbW8Rg2uynGStIH9GEY4GQFAdRpCsCydXcQaHRf0uPXVXBpn?=
 =?us-ascii?Q?RY5ZeqyrO3d/ki7s/zHaT87x+2yryBL2KQAajyyj+reERGzxXFzDQirUSncq?=
 =?us-ascii?Q?UEiO/RfcEeWT8As0RKnRFcXIX0ZDNk85dmFGyxMdKx9w+AGbuz9pZwKIDMHE?=
 =?us-ascii?Q?X0HpXDbA565G+blbSMj2UVJ/D6wUymyXmqfRti5XmIwvdJKOkMNgC+r5S6zR?=
 =?us-ascii?Q?eCvzFhdHcmwy5k9AHhGJGvaLUcqcO9RaXOZRcZbyVQL+CyWk0scXwQ/rcEBD?=
 =?us-ascii?Q?zKAkTKbR3E4iztVfi+cyPSzpp386JVgpnd2zONkOht6zd3zMB3Mo8Z0S9RE1?=
 =?us-ascii?Q?3/H8WC4HcHRkKd5ZJ1VjBDrdgwVip+Z0pT7+/FuPWHGHyDFBWrqaoWuunPjq?=
 =?us-ascii?Q?lLaz5rw950VCrh6nYaCTkSlzlSeTzdFskEDCCVxQz+L8w2kiHa06ABZM9Pf1?=
 =?us-ascii?Q?e/78attTeSQQIjP63ImtZaZrDNl+44AzkWgGNtZRgnhxYhBx5g1jOEcpORFP?=
 =?us-ascii?Q?OGnwYy8PUsmXu55zdqP1cPrxQlKM5tIkvIdfMxAcdqjYuTWjgdNin4sXfvl6?=
 =?us-ascii?Q?gxaIklkYMN+OqTmqItv02rKmA2IrC2Mjj0QLVrWkDnYYLbA4HcuKBK/7izr+?=
 =?us-ascii?Q?Iiq/VYebKX8AHetE3Gq9P4vTOucdxWzQ9UVQAEuqAuJZvG41BKEANxjwS+Zc?=
 =?us-ascii?Q?KavO4A33x6eSiXxJoxW8pkLJV18Z7YrKyr3SQ6uw23MiXXQDEJ9EutAqLOrw?=
 =?us-ascii?Q?BLmRDYwZwqJ7rfDWZjhEJqYZjtmm+G252HVpw97RrEDoKo5R80a2C50suDAc?=
 =?us-ascii?Q?go67uvk2WesJcrMfOKkBriYTDN/5lM1vGBwNPyIUBQvBLUID/UnAX4BDy/ZU?=
 =?us-ascii?Q?bLV36hDaj5J02dcG/x6ArbG+zYzIxPcrDYh9nMbHixBdsZNCag+hdMVeQ0eu?=
 =?us-ascii?Q?Iv5S2WgGiVBe/8iphxqyc4Kg1NT1gbi6LsQ7rqF8EO2nzxvPeBR8F0JFH1/V?=
 =?us-ascii?Q?yZRu7xHJ0RTFjazDqI7M2YEYhxZEpw9w5aoqkgV667m6XS2qgxSQF7OJ+vLj?=
 =?us-ascii?Q?E5gFCH5lVSUgNkiUzEt0NDPydqMQDodkE4iovD7WZ1f2KlIwDXWZ3qHe7C00?=
 =?us-ascii?Q?UW/dGuRRkJyGiCD35PLXbwr6tlV/1JpcsWND6NRNEd0EqYE6ZPau8NbotZht?=
 =?us-ascii?Q?aTbklJ9gKSvw+A8gC/vU/x2vv4mx5IF9PQ7N1eeYiE2WGgR38FueKyaOtNjg?=
 =?us-ascii?Q?PmmlQ86shHOWX+H/rqMBwU5nJyWnwo0l323goCr3ZF5B+Bw0f1MjO2viA60N?=
 =?us-ascii?Q?a8Ie8LPt6DycP0ge5iVjyTTARfDKlNNnaCcieAMpivgh5l06bXDcJBR4wFF8?=
 =?us-ascii?Q?mk9xWtbQjA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c254e89a-5a84-40b7-9192-08df0ee24e57
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5977.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 02:22:05.3502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCiR4KQo3k6NC89sBEL0+ZUbh/L24yf1OZykT7UD6taM+aicCSrD1emDRCKlTvg8eq9EwtRUNXonX5vDKKR9ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8736

On 2026-09-10 at 00:25 +1000, Gary Guo <gary@garyguo.net> wrote...
> On Wed Sep 9, 2026 at 7:06 AM BST, Alistair Popple wrote:
> > Symbols from the `bindings` crate and the C helpers are exported so
> > that loadable modules can link against code the compiler chose not to
> > instantiate in the module itself. The `uapi` crate has the same problem
> > but nothing from it is exported.
> >
> > In practice this goes unnoticed because the only functions in `uapi`
> > are the trivial `Default` implementations generated by `bindgen`,
> > which rustc inlines across crates. With CONFIG_RUST_DEBUG_ASSERTIONS=y
> > however, the `Default` implementation for structs can grow past the
> > automatic cross-crate inlining threshold. The module then references the
> > copy in `uapi.o`, which is not exported, and the build fails:
> >
> >   ERROR: modpost: drivers/gpu/nova-drm.ko: symbol '_RNvXsH_Csk9v2ZIpWbWt_4uapiNtB5_17drm_nova_info_gpuNtNtCsfr3MPOfBGpN_4core7default7Default7default' undefined!
> 
> Hmm, uapi' ideally should just be type exports and produce no code.
> 
> Default implementation should carry `#[inline]` annotation so they're
> only codegenned in actual user crate. Rust's `#[derive(Default)]` would always
> add that. Can you check if that's bindgen-produced manual Default impl that
> somehow misses the attribute?

Right, bindgen-produced Default impl do not have that attribute. For example
here is the bindgen generated implementation I see:

impl Default for drm_nova_info_gpu {
    fn default() -> Self {
        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
        unsafe {
            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
            s.assume_init()
        }
    }
}

Manually adding #[inline] fixes the problem of course. I guess we could add some
sed Makefile hackery to manually add it. For example something like the below,
not sure if that would be preferred?

---

diff --cc rust/Makefile
index da1a7409d984,da1a7409d984..535a3bf181bb
--- a/rust/Makefile
+++ b/rust/Makefile
@@@ -525,13 -525,13 +525,16 @@@ quiet_cmd_bindgen = BINDGEN $
  $(obj)/bindings/bindings_generated.rs: private bindgen_target_flags = \
      $(shell grep -Ev '^#|^$$' $(src)/bindgen_parameters)
  $(obj)/bindings/bindings_generated.rs: private bindgen_target_extra = ; \
--    sed -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub const \1/g' $@
++    sed -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub const \1/g; \
++        s/^([[:space:]]*)fn default\(\) -> Self \{/\1#[inline]\n\1fn default() -> Self {/' $@
  $(obj)/bindings/bindings_generated.rs: $(src)/bindings/bindings_helper.h \
      $(src)/bindgen_parameters FORCE
        $(call if_changed_dep,bindgen)
  
  $(obj)/uapi/uapi_generated.rs: private bindgen_target_flags = \
      $(shell grep -Ev '^#|^$$' $(src)/bindgen_parameters)
++$(obj)/uapi/uapi_generated.rs: private bindgen_target_extra = ; \
++    sed -Ei 's/^([[:space:]]*)fn default\(\) -> Self \{/\1#[inline]\n\1fn default() -> Self {/' $@
  $(obj)/uapi/uapi_generated.rs: $(src)/uapi/uapi_helper.h \
      $(src)/bindgen_parameters FORCE
        $(call if_changed_dep,bindgen)


> Best,
> Gary
> 
> >
> > Fix this by exporting the `uapi` symbols in the same way as `bindings`.
> >
> > Fixes: 4e1746656839 ("rust: uapi: Add UAPI crate")
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > Assisted-by: LLM
> > ---
> >  rust/Makefile  | 7 ++++++-
> >  rust/exports.c | 1 +
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/Makefile b/rust/Makefile
> > index da1a7409d984..083992a5c1c9 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -27,6 +27,7 @@ always-$(CONFIG_RUST) += exports_bindings_generated.h exports_kernel_generated.h
> >  
> >  always-$(CONFIG_RUST) += uapi/uapi_generated.rs
> >  obj-$(CONFIG_RUST) += uapi.o
> > +always-$(CONFIG_RUST) += exports_uapi_generated.h
> >  
> >  ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
> >  obj-$(CONFIG_RUST) += build_error.o
> > @@ -575,7 +576,8 @@ $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
> >  # in the crate where they are defined. Other helpers, called from non-inline
> >  # functions, may not be exported, in principle. However, in general, the Rust
> >  # compiler does not guarantee codegen will be performed for a non-inline
> > -# function either. Therefore, we export all symbols from helpers and bindings.
> > +# function either. Therefore, we export all symbols from helpers, bindings and
> > +# uapi.
> >  # In the future, this may be revisited to reduce the number of exports after
> >  # the compiler is informed about the places codegen is required.
> >  $(obj)/exports_helpers_generated.h: $(obj)/helpers/helpers.o FORCE
> > @@ -587,6 +589,9 @@ $(obj)/exports_bindings_generated.h: $(obj)/bindings.o FORCE
> >  $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
> >  	$(call if_changed,exports)
> >  
> > +$(obj)/exports_uapi_generated.h: $(obj)/uapi.o FORCE
> > +	$(call if_changed,exports)
> > +
> >  quiet_cmd_rustc_procmacrolibrary = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) PL $@
> >        cmd_rustc_procmacrolibrary = \
> >  	$(rustc_target_envs) \
> > diff --git a/rust/exports.c b/rust/exports.c
> > index 1b52460b0f4e..434f0b73151f 100644
> > --- a/rust/exports.c
> > +++ b/rust/exports.c
> > @@ -17,6 +17,7 @@
> >  
> >  #include "exports_core_generated.h"
> >  #include "exports_bindings_generated.h"
> > +#include "exports_uapi_generated.h"
> >  #include "exports_kernel_generated.h"
> >  
> >  #ifndef CONFIG_RUST_INLINE_HELPERS
> >
> > base-commit: b705c185105762676aa6ec16cf976101df87cc35
> 
> 
