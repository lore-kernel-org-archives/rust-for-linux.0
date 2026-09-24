Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021097.outbound.protection.outlook.com [52.101.100.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00634495026;
	Thu, 24 Sep 2026 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246521; cv=fail; b=U3a+/4pKMzWQDDqQQsnLgXhhj2YB5KZWcfMgnWoUJUo4HUmAk+hx2/0JhY/qGJQKR0UglKy/VkrS2jpsQ5SLNCxRijlt2uTxeELkbGAfSH0I//n+2QUEHxmwXxli34mMBa9emusItTWJWsrtEXyDDo2OHisjQcqeAFgmumXzlvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246521; c=relaxed/simple;
	bh=enYm4RCcw/6ArLcupytTsrcyYQnkouA+BHYFSntZVm8=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=lKKeA2ByHy0B3240VMsPUe+YKoLy8IVDA7QOQX83pAAkNVjamBuIx3Mmof7cF8DsetboUtnG6Tcuwou77TjMXpllr4c+HoVRWRDAv/i7Sn/ASSgRxBB4Ph9RXsgspQjcTYB5VYGH7I5JVZPBBubbTj+k9rDLZWa82t5qepazCv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=SsAJuXZo; arc=fail smtp.client-ip=52.101.100.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="SsAJuXZo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Adjr+iCT9S4IFbCThCVBJBJBY9LxSmk/yKNDxdKLln8MokKXIol0TcYsaz74tr/sxZpFQxHM374j53JOWqaycI7mjEQyFdvmXJTSoOi2z9v8ku4IDMvavPToEx+/une71e205ju8uotBiIyOTC104kvMGZxuq8/Z21asWFKUjUWkI55O1/Oa4K+uGiGtv8oDzqWNx7flgZxWErN+OTNdP9YIigYcZ49B1Ff9Nmg1mQjYTuDpE7iVIqPUHz+OkBqK5bpoH7ldtmDNJ26R16MNHChNGxfQ7J3yDqDSmaVM/He32iSV1ipXjHSKKSJe+Xwft7FUNAchmzdsXW6nTsi/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtWKDLlHn/UlG3JoPT5APPSpHKcz42cOcoK7feZxA+0=;
 b=xubKKYb8E2xfC6/H2kYzcohwmVvOKYcIaLpGUwMCcs4OglQ/niZIItj7TJ0Zf9jzxNR2PWKPdOKTlHOXffbwJRCB1mpQX/D5OLviLTufkuYLqIDXBH4nMkAIPc672HsRMrP+i+Ojw+0TFVR+STSKaZP2hJT7tTQVhkcdNTTHn21uCFry9+dJjtpbCHRtBFoVtU/UeFtWhCgPfd4kWU9SKIcN164Llgxo1c+hkOX1KyzhRwGWT86778cvJ5ezbe9mEMz29/f7ckjAkqzGE+sHyGHnsRc3INspqiXlPIhhFD5lGOvl2S66uYsJRYsgqGk63kz0yRDKM5xWtHErSFJZyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtWKDLlHn/UlG3JoPT5APPSpHKcz42cOcoK7feZxA+0=;
 b=SsAJuXZoI/XCw688a/jbjg7vfh5Bz9QMX8T/U8SeCoVD4r9vTKE99KL0ZKchcfKBpc/mRmftCnwU0zQ6FVhKepHmhikftwI4y2RXc7T2L43wjo5FiKNF58WNoCTlvRuc9pI8yMq1F4h5E+mAFzOZbb6SzE19RpUHfSdVJOTjGBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWXP265MB2824.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 10:41:52 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 10:41:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 11:41:51 +0100
Message-Id: <DLNHF9TPLXK2.1VQ2LJ0U6Y07K@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Philipp Stanner" <phasta@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Waiman Long"
 <longman@redhat.com>, "Gary Guo" <gary@garyguo.net>, "Alice Ryhl"
 <aliceryhl@google.com>, "Lyude Paul" <lyude@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: sync: Accept errors for Lock payload data
X-Mailer: aerc 0.22.0
References: <20260924085523.2620704-2-phasta@kernel.org>
In-Reply-To: <20260924085523.2620704-2-phasta@kernel.org>
X-ClientProxiedBy: LO4P123CA0314.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::13) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWXP265MB2824:EE_
X-MS-Office365-Filtering-Correlation-Id: ef45cec2-81e4-450a-8c68-08df1a28721f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|23010399003|6133799003|10067099003|22082099003|18002099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	BgMyBgyrqVOs39WWiOFjNEMfPQLIFZa53uqwBK1QuvJ82bOAs16+GTSimveMZYwq8cKETnXCd05Et+fBUoyFgzc9wSPeyudYYis6cJbP4ccJ0yprvz73mWVuPxldoJsLiGe+y0Td7/WaX3UyZi4QYWFZIqSz8nk+Ze3WWCSj2CCP6cd8BVFhCFN83eYWNsfrlV0Px0CjiY0QmUqOJ4hlQ8YSDTqArfUnjwi+sN2B3R9koxdNbF7yMT+BWflwrL4tw7ESBJPW0JJEo/edDprNN4YkVzWqCM43Vm1lXPu4mOPkNH2NgzZ4ozoPZszJufJXiPpFOZTapprNFZf5wNFQ0RwIU+LXIMLtkzth+YWC9oGL/PJs9vFxZi8iKrI0R73hc0ZKvzhEDdV+gcG3c8Qmaa2jhuAPsetILxU1l6TQTPNn0ccUaO/6Unt8gVBLYnjEqJ2ggugnK7tH81HJnajugEpVjctt7IZ5kM8UnGMIZVCeT0OrGhz+Ks8meeEhUHZCfjJYoh3sA8p4gyEFpOecJR0dwUG6GZc72v8/EtWXtJ99JHhu5TkLIwzZnCwgrY5oV1ArAUC1FYOqZLqCe2LJfVoSZJhiYPLUJcLy3GobYRM6crSOUos7ffu9BibtCogynm2ZrqtQZJFBM5nfFKxgny2y5EfA+SWd1tSz0PjnO3j8PGvXvDyawIvw68+FXKHdoH3oijwddN6mIIjGe2K4QA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(921020)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3A3V1VIRHBxcEdCQnNsd3NBRVZSclQ2VGpLQkdnTWFySHhNNjNCTzlNc0lt?=
 =?utf-8?B?djlKSjlHS1ZXWStML2JOMnRFUmVHeDFwclEyUjliditxNlFTa2hudWFLM0ZX?=
 =?utf-8?B?RkN2Z2Y4dHNKaHN4QlpsZDEwU3ZPQWF0bGc4TU9GRXVqMSs3TFRYQVJlOWpJ?=
 =?utf-8?B?MGNWcUFObUMySWNUSVdQV1VUR21RNTl2TmVPQWU4U0RJNzhiM2VFUGpHaVAw?=
 =?utf-8?B?NFQrazZRTHRNRWczbllFemw4UlA4U01aaEFkQldjck5nSGJDeDNpV3Y4R0dQ?=
 =?utf-8?B?WktMT1VYY2IybU9ocmVjdC8zN003UytsdHUzZng3R21saTE4WGI5bW45cHdF?=
 =?utf-8?B?bUUzY0h0eHhKY053SVpzNERkOG9SUlBXNFk2U1A1enlzaEpneWsxc1F6a0xk?=
 =?utf-8?B?SGYwcFBKQjNjZ1JlUlZrN01aelRVdWhzeUFCNEsxZWFkc3J5cDB6bVZEeHg2?=
 =?utf-8?B?bm1kaCtZbEs4NXJJaC9ZTlJKWXZkQU1VZWE0SUthcVM1Nnk4Kyt2bTVWbnI1?=
 =?utf-8?B?NDFhYTRJR2Q1cjBkeXF5aVlZZWpja2o4TUprTkpReFF3cGhaazBjVnM4SHBq?=
 =?utf-8?B?clhEWVo2RTVCWUVVelRyaGphc0ZibDBlb0Z6emxPb1lsZGxGQjNYOU5rKy9n?=
 =?utf-8?B?d3hFOC81Ni9XK0VZZXJOcnVCWEl3L0pqU0d4UzVFei83VkU2U3BrdEZVYmNI?=
 =?utf-8?B?UU1oeHd2NVBrNEtuR3llRUN1OU50bnBWZThVZy9mc2xhSllpQmFKclo3RE9G?=
 =?utf-8?B?QTNsV1hxKzNIVHdyRDVGb0NGRjJ0cGxPc0tRUm5VaER0eDBxVkdtSG82VkND?=
 =?utf-8?B?NFRNb29YY3N3RlV1cFFxMzROZjNGS292ekR1blNpVWJxTnhEcG84S0NYeTN0?=
 =?utf-8?B?VTc2Y1FxL29ZUUkvY05aTHdUSGFVNXZES1NZQlM3NW5aazFHTnNCZjZ5VEFK?=
 =?utf-8?B?WHJuMWIxcFVlbTZLMUhnS0FubzNTcEtEN2Q3Uy9Ra1dDaUx3Vmw1WGxtRlFy?=
 =?utf-8?B?aWIzcEFqSGIvRkNmSVBTYVp5ckNINSt1N0JFWUNCWmQyUlNrUVVNMVAxZEZh?=
 =?utf-8?B?ZTJHTkNPZ1Q2SFM1Zk4zTC91V0hSNkdLVGxsTXdmMkxCSVA0Y0d4dGdlM2s3?=
 =?utf-8?B?YVYrZXFVZ0I2cEZscEZZLzZtNVdGVXJPSVpsaURTbVRpWHN1N0RjQ0FlcUtO?=
 =?utf-8?B?SHpxTHk3RWRFUVpZOTg0Q1NRdGtFZ3RjQXVhYm9TUUZXMVRVRkNsV1BKN3p3?=
 =?utf-8?B?TkFycVd5dWFPaXNGRnNicml2cGxkaUF5eUpwa0Y1Qmp3bzhJeC9WZlE1V3B2?=
 =?utf-8?B?NG9qVmQ1ODRrL3ZNS0tjNTVwaFVwUXM3M0Rhd2k1OFFVU0oyODNOSXduQ25u?=
 =?utf-8?B?blRhN1JYYllVSEx5V1VheXMyWjlTblQ3d2FhWnlKSkZwZHRnODlQRFl4OHF6?=
 =?utf-8?B?YTBnQjdjREdnMFR2R2lCQ25mQ1NoMWRoQUtsWXV2eG4veWFHMlJ6L1NlWkNU?=
 =?utf-8?B?Y2pOVFJuanRGVDQ0VFVMUVZHeTZhdEw0eHc4MVZvTVQwMndZR2Q5Q3VodHYx?=
 =?utf-8?B?S29PZWlyOWVZK0tyQm1YQnIrWUtmdFZCdjNjb090V1JDczl0YkhLNFkzTXRo?=
 =?utf-8?B?WXRlb2hoQUhEdEwwWnhpcnkvZEgzaGhuaGY0K3pWeXplRXJ4aEZCQzRPeUVK?=
 =?utf-8?B?Ym5tbUIvY2w0NTF3WStZQ1p4ME8yNndpNWljbnp0MEZKL0dQTzJ0ekFibmk4?=
 =?utf-8?B?Wm5OanRJTVZVY3Fmd1I1VUJ3QUlCV0hmVmg1SEFBNG1QZHdpdm84TVI0OHpq?=
 =?utf-8?B?VEJGQThBTnd5d0RHK3ppUkFFVnBsR2xRLzM4aExxalI5ZEk3OW52c2NaQ2FF?=
 =?utf-8?B?K1dFWVN3TGNaRllJZzhMR2NnTkVEMitFV3dYTWJqb1ArbVBTc2J1R2tGU1ps?=
 =?utf-8?B?RlpFcStod1ovampQWWE2TU44bUM0Kzg2S2duOWUwdGlSTkNHczhzNnZLVHVh?=
 =?utf-8?B?dVBJUmJWMVdJTisxTElXT3pLVVZtRnU4UVdRZjVLbmFlVnlvV3pzc3BwWDMy?=
 =?utf-8?B?UlNrMFNUM3d0UXY3Wmw1NjdxMlRPTjhYTkVMcHEzelQzNGxCWFQ3cmFXZ3ds?=
 =?utf-8?B?Y3I1eGNYeTJwODdwRGpLM3NkcmRYeEFEUDNmaHQvZ2tiYisrNUhFeW4zMDE4?=
 =?utf-8?B?d1dWVnJyK3pXU1o5dWJVZWFWZmZZUnBEMG9hQmlCSjQ5ejJjdnl3cEtBSUpY?=
 =?utf-8?B?bVl3VjlJdUk5a09raWN5YVVOZkh5ME41UHk3bnJNQU1wWXQvL3lhcU5QU2s3?=
 =?utf-8?B?U1BUN0xCbzlXZm9qVStYUVdsU1RHTldhY0ZZWEM3c1p5L2NRUDNLUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ef45cec2-81e4-450a-8c68-08df1a28721f
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 10:41:52.6982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrsFuddnCOcyX9bHWp2haStZL2lgKGgFRnupewkWZERGvG9tgy8aV6jYqDWMlfZSk0eSZL5p10gm1qcqSlXuaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2824

On Thu Sep 24, 2026 at 9:55 AM BST, Philipp Stanner wrote:
> The `Lock` baseclass currently does not allow for fallible user-data.
> This can cause conflicts when used with other primitives, for example
> when a lock shall be pin-initialized with payload data that is fallible.
>
> Add support for the lock base class so that it works with
> try_pin_init!(). Adjust spinlock and mutex accordingly.
>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Regarding removal of the CStrExt, I got "unused import" errors because
> of it. Don't fully understand why?

Because it's part of the prelude.

>
> P.
> ---
>  rust/kernel/sync/lock.rs          | 21 ++++++++++++++-------
>  rust/kernel/sync/lock/mutex.rs    |  7 ++++---
>  rust/kernel/sync/lock/spinlock.rs | 20 ++++++++++----------
>  3 files changed, 28 insertions(+), 20 deletions(-)
>
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 10b6b5e9b024..1b2df5d0dcf9 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -7,11 +7,13 @@
> =20
>  use super::LockClassKey;
>  use crate::{
> -    str::{CStr, CStrExt as _},
> +    str::CStr,
>      types::{NotThreadSafe, Opaque, ScopeGuard},
>  };
>  use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
> -use pin_init::{pin_data, pin_init, PinInit, Wrapper};
> +use pin_init::{pin_data, PinInit, Wrapper};
> +
> +use kernel::prelude::*;
> =20
>  pub mod mutex;
>  pub mod spinlock;
> @@ -126,14 +128,19 @@ unsafe impl<T: ?Sized + Send, B: Backend> Send for =
Lock<T, B> {}
>  // data it protects is `Send`.
>  unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
> =20
> +use core::convert::Infallible;
> +
>  impl<T, B: Backend> Lock<T, B> {
>      /// Constructs a new lock initialiser.
> -    pub fn new(
> -        t: impl PinInit<T>,
> +    pub fn new<E>(
> +        t: impl PinInit<T, E>,
>          name: &'static CStr,
>          key: Pin<&'static LockClassKey>,
> -    ) -> impl PinInit<Self> {
> -        pin_init!(Self {
> +    ) -> impl PinInit<Self, E>
> +    where
> +        E: From<Infallible>,
> +    {
> +        try_pin_init!(Self {

FWIW if `? E` is specified, both `pin_init!` and `try_pin_init!` behave the
same, so there no need to change it here.

The difference between these two macros are the default error type; the for=
mer is
`Infallible` and the latter is `kernel::error::Error`.

>              data <- UnsafeCell::pin_init(t),
>              _pin: PhantomPinned,
>              // SAFETY: `slot` is valid while the closure is called and b=
oth `name` and `key` have
> @@ -141,7 +148,7 @@ pub fn new(
>              state <- Opaque::ffi_init(|slot| unsafe {
>                  B::init(slot, name.as_char_ptr(), key.as_ptr())
>              }),
> -        })
> +        }? E)
>      }
>  }
> =20
> diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex=
.rs
> index cda0203efefb..35e6b02ff426 100644
> --- a/rust/kernel/sync/lock/mutex.rs
> +++ b/rust/kernel/sync/lock/mutex.rs
> @@ -35,6 +35,7 @@ macro_rules! new_mutex {
>  ///
>  /// ```
>  /// use kernel::sync::{new_mutex, Mutex};
> +/// use kernel::prelude::*;
>  ///
>  /// struct Inner {
>  ///     a: u32,
> @@ -49,8 +50,8 @@ macro_rules! new_mutex {
>  /// }
>  ///
>  /// impl Example {
> -///     fn new() -> impl PinInit<Self> {
> -///         pin_init!(Self {
> +///     fn new() -> impl PinInit<Self, Error> {
> +///         try_pin_init!(Self {
>  ///             c: 10,
>  ///             d <- new_mutex!(Inner { a: 20, b: 30 }),
>  ///         })
> @@ -58,7 +59,7 @@ macro_rules! new_mutex {
>  /// }
>  ///
>  /// // Allocate a boxed `Example`.
> -/// let e =3D KBox::pin_init(Example::new(), GFP_KERNEL)?;
> +/// let e =3D KBox::try_pin_init(Example::new(), GFP_KERNEL)?;
>  /// assert_eq!(e.c, 10);
>  /// assert_eq!(e.d.lock().a, 20);
>  /// assert_eq!(e.d.lock().b, 30);
> diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/sp=
inlock.rs
> index aafc80125f59..8ea2c5b202e6 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -4,10 +4,7 @@
>  //!
>  //! This module allows Rust code to use the kernel's `spinlock_t`.
>  use super::*;
> -use crate::{
> -    interrupt::LocalInterruptDisabled,
> -    prelude::*, //
> -};
> +use crate::interrupt::LocalInterruptDisabled;
> =20
>  /// Creates a [`SpinLock`] initialiser with the given name and a newly-c=
reated lock class.
>  ///
> @@ -38,6 +35,7 @@ macro_rules! new_spinlock {
>  ///
>  /// ```
>  /// use kernel::sync::{new_spinlock, SpinLock};
> +/// use kernel::prelude::*;

Doctests have prelude imported by default.

Best,
Gary


>  ///
>  /// struct Inner {
>  ///     a: u32,
> @@ -52,8 +50,8 @@ macro_rules! new_spinlock {
>  /// }
>  ///
>  /// impl Example {
> -///     fn new() -> impl PinInit<Self> {
> -///         pin_init!(Self {
> +///     fn new() -> impl PinInit<Self, Error> {
> +///         try_pin_init!(Self {
>  ///             c: 10,
>  ///             d <- new_spinlock!(Inner { a: 20, b: 30 }),
>  ///         })
> @@ -184,6 +182,7 @@ macro_rules! new_spinlock_irq {
>  ///
>  /// ```
>  /// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
> +/// use kernel::prelude::*;
>  ///
>  /// struct Inner {
>  ///     a: u32,
> @@ -199,8 +198,8 @@ macro_rules! new_spinlock_irq {
>  /// }
>  ///
>  /// impl Example {
> -///     fn new() -> impl PinInit<Self> {
> -///         pin_init!(Self {
> +///     fn new() -> impl PinInit<Self, Error> {
> +///         try_pin_init!(Self {
>  ///             c <- new_spinlock_irq!(Inner { a: 0, b: 10 }),
>  ///             d <- new_spinlock_irq!(Inner { a: 20, b: 30 }),
>  ///         })
> @@ -232,6 +231,7 @@ macro_rules! new_spinlock_irq {
>  /// ```
>  /// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
>  /// use kernel::interrupt::*;
> +/// use kernel::prelude::*;
>  ///
>  /// struct Inner {
>  ///     a: u32,
> @@ -244,8 +244,8 @@ macro_rules! new_spinlock_irq {
>  /// }
>  ///
>  /// impl Example {
> -///     fn new() -> impl PinInit<Self> {
> -///         pin_init!(Self {
> +///     fn new() -> impl PinInit<Self, Error> {
> +///         try_pin_init!(Self {
>  ///             inner <- new_spinlock_irq!(Inner { a: 20 }),
>  ///         })
>  ///     }


