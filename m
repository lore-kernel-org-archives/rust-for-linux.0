Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022104.outbound.protection.outlook.com [52.101.101.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20AB383C8D;
	Wed, 16 Sep 2026 12:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560727; cv=fail; b=EHX5GLVLINVkEHQ2SfWAWK0XpaHVLfx7AxccMFKm8xA/xfp9x4VLEsjkLEP6rf6TlzyP+z9Q2WmEArsrKQAzq6iROi+kdrBJ2T4BGyQg3S1s0RSzd/3bi/C8t+/LubnhB133sOxFV2V1Vvoxh3DOIBJI/dXF3KlKcco11IAR4OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560727; c=relaxed/simple;
	bh=LCrmIdd4GhRIDnPRatlnHc41av4wF6QbVm9CpcOvar0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lS8ssAliMDmmmi1wnNOvVyEqjbt+Y4qsGJC7aD0HzupLosYbv8STyxhqSJjl/45TBQ6BcfRYqOrbsabDLYvNg1Ja0Zneqk7Ygo/JB0ivSu69SgKjq3v1M5y4J6UlQtNDIkc157ZwwddLv77OHzXyt+hS6yqd8aa79EK1UcE7Eq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=L4+DWxM8; arc=fail smtp.client-ip=52.101.101.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="L4+DWxM8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTFgSE9ikbtAahlyM6gchvkBT8IKR8IF2v/AZzJNFk2JJemeSFzzgszm4cpBjTgxKKOLDVfgbW16mTvX3hioRV5CWxPomJFGVhkk6SPOwlwSviAIhh+Wbyo4iaY8J4kG2OdNNkoeEI51Zo/JRXfmwLQsRCtXF7FURDwUXiz5Vxjz52WN/TAVhyoio84px/elA2zIKxDFS74P1vKGsWZLOwrX4zlqubGOT+Df8Nb2fMPNvWy4hkRvo68CQi9HuBMVPu0GerdniGBDLWzLRNdWNzUDA7aIdFSeHpmiqNI7BZCHv1FXdrwBXXAovCRu+hhKdS6Zg1SaJ6+gZTzYlwR8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PE5SP8QkQ0jHFHAbDKnYQSoUkeWTmtFaRjLmTOO4/mQ=;
 b=UU7/5rF9l0lF3LnjO5PY4czFkUKtUV462jGv4xD8L6s+RdIofnWQdrtCZjffi/dkL8e63Onx/K+hM9QuBIB7pVJZaOrBdRFENv+8RBl7zUuIFmRljjGs3mwyFfI3a6CUQIodDMUsXLWnG6UjSk1wznyCMqqV+l+Q752HVQzSd/392rTvWRGbSZbrMG2kjckl00kdogyNLchZcCvARqeTqBwU/KlyhldSmrYvoUdQT0Uvf1uaxjCyYij06X/eaqYTkjUvnTfYVJhMz8bTHD6ruQ/rUB8ZZnjIhxC8X8BOF3sPhOSwf7ZFb7QuH+1OfdMDCcLADbsafdzeaTcuDnsztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PE5SP8QkQ0jHFHAbDKnYQSoUkeWTmtFaRjLmTOO4/mQ=;
 b=L4+DWxM8WrwgMcBwrUSqiJnJ6OIAMdsgsCaYEhghmB6Wns4ypcyqvH7oY9WBuZQbIjrD6cVhgEf9ldXG+hqUcZJbHWHMxRg9sil9ENneUNyOR+4BfMdQzJZheP1ggJag4TWrBKB1ytHcDKuUY9Ej7Adn6pYdXAUgR/Ccd+J//Nc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB3421.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:19b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 12:11:59 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 12:11:59 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 16 Sep 2026 13:11:32 +0100
Subject: [PATCH 1/3] rust: pin-init: internal: pin_init: emit `slot` using
 mixed site hygiene
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-dev-hygiene-v1-1-dfb6ae2588ba@garyguo.net>
References: <20260916-dev-hygiene-v1-0-dfb6ae2588ba@garyguo.net>
In-Reply-To: <20260916-dev-hygiene-v1-0-dfb6ae2588ba@garyguo.net>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2597; i=gary@garyguo.net;
 h=from:subject:message-id; bh=LCrmIdd4GhRIDnPRatlnHc41av4wF6QbVm9CpcOvar0=;
 b=owJ4nJvAy8zAJca/kLG6/oLwNsbTakkMWavae/4tELa4elTj6ZHGfY/DvnrnTZb+58o/uf/kt
 IRzIRpGO5Z2lLIwiHExyIopsnh0M6ZtYpwte1mr/CXMHFYmkCEMXJwCMJFL7Qz/fVo23q6fv7bg
 tJF06vU/h8s/hlfvXiR2xtxIb9JTs61lbAz/882eL7jU0Hb/0sWEepvz2U1Ozv8fy/O5Xgx8sVD
 oYOdGVgCo4kzq
X-Developer-Key: i=gary@garyguo.net; a=openpgp;
 fpr=E25A77AED6FDB55D05B304A09D8C6F14E3E60652
X-ClientProxiedBy: MA3P292CA0014.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::15) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB3421:EE_
X-MS-Office365-Filtering-Correlation-Id: 220c1d9b-682f-4ae0-2b21-08df13ebb595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|10067099003|6133799003|22082099003|18002099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	3YqAQg7LqsUcbHjn2+N1TSeZJEd7ahcFWxYOI7+6GqDg7d2VVgqn+qr0j0rssafm8VbAuNosdjjJbYtC7ON2a1wp5tnMlJP6lOSpN7VErJevAMTUDz7oOeve4lVqBWBwGLOaBa5mXCzpDK0Ru/9rUQdHKbvBdOZKh/OWeGmBen1/Or5REaYMq8adLWGCKJaa5qiQ1QnK08B8JOdvOTzJVs9K96AsqVS7DbraYJ9SklEi5ZQnG8ApH5EDHyrSVc9PPpU5hLS30hbCwfLv1KIrwdx91aNMnxV7pNRjcEM74VVEcZFI/fJdlHAU/FgYwmSwWHc7AOu+4XoW/YC7/qjimGXl6dnkquMhZP18hNLYKoJztOqi9pZqMPZ+m5cwOP2ba1waWTPeKMXFhveevFWwWAIEbUbDF5YiRAHFtnWeQXx0HGVSZoopGA2lo9/8tj+FNHiZZnUJIcojE4g55I0vlsjEnmmf9hD8/Xi68Tgb5qKDXK/yPQl9JXtAONPOYJzdn/HwNjtk5R1kuuNPwHjXtAsbLCbKgbs5uvbgAJ30dU3Upz1fX79NpLGgWDmtLIRzaMbJEjo5cLKF7n+XxHPtERwBuDZ7JIk1cxbxHKhpTW3zpDS8gTybIDMR/5WqaKHBMNhFbhOWCBoSvOH/MkGERKo+PuQxd6FrMjYExr3EYcJMKePQM2snqhz+xibHISuwHRuB0uSqqTv/2hhO347IjA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWZOOWFKSXlLZnNmTHJjMm01K2g1V3dlTjlaZGFVUjlaMkVCM1BYb0NsV1V3?=
 =?utf-8?B?YXcvb0UxY3lrNktYV1BlNUd4VUtpOE9ZWW9NUkcvbjVmcG1Ua0JMRGk0QVA4?=
 =?utf-8?B?OEljZnRwTTBnTzQ0WnU5NTdBWVY2N2hDZTlOS0xxUUpwUjRjSjJoS0U1Rk9O?=
 =?utf-8?B?dXloSTVNblRnVktGM2trY2xlalFYVjY2eGpScllKaHU4a1NtaDRIYUtJZHMy?=
 =?utf-8?B?R1RULzlvMk5HajkzY0piSHlpdU8rNXlPczFqS0ZGUk96ZVRNaVkrN2FwSWIv?=
 =?utf-8?B?c00wZVBMWm9JT3c0OEcrSlVZTUprdzlQWUhhS0hRSmZVZUdsNWc2QlVaNWxr?=
 =?utf-8?B?dWc4WTZ1ZlVzYmo5VUFEbWlmVWtHWWVZSG1pbzl1Tm5ZUVZqQXRnTStOekFx?=
 =?utf-8?B?VTl3TTNsV0FZby9LNlpnM2xRRzBxai9pQUN5bWhXY3EyS2tRU2l2cTZWazRS?=
 =?utf-8?B?bXhpOVVlSm81TlZSTHFMaGxXMVNOZGxWOWNaRVY5R2trbXdCcmptNk1CeWZO?=
 =?utf-8?B?UTR1cGpGaXB3aEI2ZndOZGRQT1lHZzM1YzNkcmpmRnZ1ZHFCRzQ4emxUbTg5?=
 =?utf-8?B?N2xTWVhUbllibTRDOEtoZ1ZaanNLejFyeEtVQlZWbVlORzlGZ2xKamIydWpY?=
 =?utf-8?B?UkFjT0RoMGh6MnBzbjVuL0pJb25kTGpEQS9pcnRmOGhiWG1CalBzbXI2eUhh?=
 =?utf-8?B?cE0rKzJaU3lXanRBYkQyY21Yc1hveVgxWWladmhxc09QajUyZHJVc0kyYTZG?=
 =?utf-8?B?MDlKTm9LWkVTekRBMjdlNUdKN2dDQUpGSnpKclZqc05KSk1oM3ZjTkhuZkFn?=
 =?utf-8?B?ZG9nM1Iza1I0MHNmRnhNUkpWTmRxQUE0WTVnK21hTGRtVnR3TU9sQmlaZC9s?=
 =?utf-8?B?SEFCQmNmN2JRNmt1MnZyaDQwTGVEb3lqUHpXK1ZZczFVUmF2QUZEN3grcG1m?=
 =?utf-8?B?czVsejRYMU82eUpLQkFXLy92ZE00ZE1xOHBGanM2MnkxSDkyYUFRa3h5djdW?=
 =?utf-8?B?bk1aOXZiaWtPekF1akN3b0U4NTM0U2VvZkp0amVnN0V6YUpEUUpNeUo4S2E4?=
 =?utf-8?B?MzQ0bGJjeERjZlM4c0NuSWxyWFNKMjk3ODlSODljbldhcitGa0ZvYVpPRFB6?=
 =?utf-8?B?R284alBDYStyVC9YUlBFbU01bE40Y1lpcGtXT01pWXRLQ1crYUlvd3J4NWQ2?=
 =?utf-8?B?NVY3Q1JaaVppSkd1S3VxTkRQaHlKano4Qm9LZmJnTXdqc0Q0NkNqNkZ4QWk5?=
 =?utf-8?B?d21yL3c0SUd0TVdWV2xMY0JJcHEvNk1ENFh0Yk5YSHI5K05CUUtNVVAzK0xv?=
 =?utf-8?B?WGh4Q0ttb2lZdTJCRXJYYmhIYnNTSUFpTU94WW9YeDA2NEgycmVUekNWMGNX?=
 =?utf-8?B?MVFmUDZGczIxOWE2MGcvc3B3dWtOSTVKVDFmL0FsWndzak9nRVBGdjgycmcr?=
 =?utf-8?B?TmZyVW9CVWFwc1V5dkNOcExKbmRRZEJqdTVTK0R1NUZoTUp6R2lBR3AyS0VG?=
 =?utf-8?B?dzR0NURmaVFNRVgydnhXYXN3RjduMTVqWkdrWUtuVkZDNFc1YWYvYVp1QWZF?=
 =?utf-8?B?UzFTY01iS0tTZG96MzliejBjTGNpRzBmQnB4WWZCbkFScU53Y3VSZU1wdEp6?=
 =?utf-8?B?V0Yrc2VzbU00MjNqWmVHNW9LMml2ZnMyemxmYkZCcVhiOEx4V1hpc0Zwa05t?=
 =?utf-8?B?dk95WG1GWk81Tk00MUxiRnJTc3YxbTBiM2xSZEZHSGRSb2U0VVJXeUFydjRs?=
 =?utf-8?B?TFpIWnEyeldPUEdCVWxqd1pMZ1Fia05tbys4cVByNHAvL09QbHlYOXNxVkJL?=
 =?utf-8?B?M0R2czkvVnNSdEtZZTNTdnhoZEJyYjdqQmYwRTlHQkQreHcwc3RJWGJvWFNo?=
 =?utf-8?B?cUJ3RVc1ZEpDeHZyZ0RyL3M2NmdlTzFCZlVvSWM5MFZuWmR4ZjVaaGtQSUZi?=
 =?utf-8?B?OEZGeU5scWRjT0IwVTljbklLcXdzRWZBUElHOXBOZ0lrUERlWGRFVjVhMjJq?=
 =?utf-8?B?VWpiRUdpSVp6ZVZ6K3huZFBRWWpZa0hTQzRTQkpyKys1cEZya3JpOFY2V3dT?=
 =?utf-8?B?M0h1RzFhbFZkZG1FYmhkWWs4YjV2dXF5Tm1JZ25DTTl2cFJVSklKb1dYWVkz?=
 =?utf-8?B?VUFMaVdqSmxXUU5IaWlXYkY3K0ZVTjdkZ2cvVmVpMStKaldrQzVUaXBhRklv?=
 =?utf-8?B?dFl2Q2l4eTZ3elBJVXoyUytWTVdPYjgyaUdoK0FjVW9jcmpYb0hSM1BTY3Y3?=
 =?utf-8?B?MHhFVlNUVCtmclBHOWxNYU42UVNEUWtPOEJzVzFtc3A2VWF2SzZXeWpKNHZE?=
 =?utf-8?B?VGpXNUNOSnBrSFRwZldkLzM2VW02a2pxS0xZbm0vUkhSTG5CTWFZUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 220c1d9b-682f-4ae0-2b21-08df13ebb595
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 12:11:59.5727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rj6A+CuBmRaBc2H5IjbkxafSEF2vjm54hk0fbfXM7ncrw0iFmendVWicDdOVdaSSUJxZlMbdyr/zEFgLAhAdrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3421

Syn/quote's default is the call site hygiene. If user provides a field
named `slot`, it will conflict with pin-init generated `slot` identifier.
Change it to use mixed site hygiene instead.

Fixes: 4883830e9784 ("rust: pin-init: rewrite the initializer macros using `syn`")
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/pin-init/internal/src/init.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index dc5dfb2ca114..6ade192d27e6 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
 use proc_macro2::{Span, TokenStream};
-use quote::{format_ident, quote, ToTokens, TokenStreamExt};
+use quote::{format_ident, quote, quote_spanned, ToTokens, TokenStreamExt};
 use syn::{
     braced, parenthesized,
     parse::{End, Parse},
@@ -269,7 +269,7 @@ fn expand(
         },
         |(_, err)| Box::new(err),
     );
-    let slot = format_ident!("slot");
+    let slot = Ident::new("slot", Span::mixed_site());
     let (has_data_trait, get_data, init_from_closure) = if pinned {
         (
             format_ident!("HasPinData"),
@@ -302,7 +302,7 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
     };
     let this = match this {
         None => quote!(),
-        Some(This { ident, .. }) => quote! {
+        Some(This { ident, .. }) => quote_spanned! { Span::mixed_site() =>
             // Create the `this` so it can be referenced by the user inside of the
             // expressions creating the individual fields.
             let #ident = unsafe { ::core::ptr::NonNull::new_unchecked(slot) };
@@ -312,7 +312,7 @@ fn assert_zeroable<T: ?::core::marker::Sized>(_: *mut T)
     let data = Ident::new("__data", Span::mixed_site());
     let init_fields = init_fields(&fields, pinned, &data, &slot);
     let field_check = make_field_check(&fields, init_kind, &path);
-    Ok(quote! {{
+    Ok(quote_spanned! { Span::mixed_site() => {
         // Get the data about fields from the supplied type.
         // SAFETY: TODO
         let #data = unsafe {
@@ -512,7 +512,7 @@ fn make_field_check(
             ..::core::mem::zeroed()
         }),
     };
-    quote! {
+    quote_spanned! { Span::mixed_site() =>
         #[allow(unreachable_code)]
         // We use unreachable code to perform field checks. They're still checked by the compiler.
         // SAFETY: this code is never executed.

-- 
2.54.0

