Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021095.outbound.protection.outlook.com [52.101.95.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC2E307AF0;
	Tue, 23 Jun 2026 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230137; cv=fail; b=PvKGCS4Eps0czATarUab1AGmQBOjLODz8XOMK04zZezbCGJVtM/1BqOZL8XCdZPm2ULkp0azmHw4S3xW/Q2Mm7Jh1ujZs/tel4XLX/dWQsssu0M7gcDEstDCCsV7UCw4SvDw2wL+X5gN96t0/ux7FBCD343x+FOvoZL3Y7tUm5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230137; c=relaxed/simple;
	bh=2SFIpOMM/2ZmRM6OT3K3L+ahDaUrWyydsM7XtftFVak=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=B2+9D+UjH8NI9wxUAfI4/3naHDPCEZQPNbyggAjd+YjZjbmUhobgsw6uevbHGHvTG0JKayOTiLhSa+uGav2N6Hu/6kir0cELeTKQpxm+N7Fmw+ku76exmJLAXBCJMg9w8H4ATXSlAcVW6Wo232O5le/0c6bbTBMoP4T0LINO6lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=VFl6dnwk; arc=fail smtp.client-ip=52.101.95.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="VFl6dnwk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxerrn8DA+4tzcY8hHlSR99+gItR6iW+AzArnuyykrH3G2YMiV5xgfZcz8YjBWbzXAgYf5wtaA9ndtdLWmtuaKy5MppjgnJBmVNtQdZ1LgXbPt30XWWd9RaraLA66zi6ohbn3Blap0g/gx432pqqL7sH1Z3RKk+L6vz8x8RQPdewaVcVjfl1/n37SsKEmxDm4LPAIcK0o3UQIpj+l6bJ4C1EFWupijn+vU3OTB9hzvtpIXNm8f9KY9CjD2iWFeu5lU9Zb27xK3d2rPqVGB4uwVJMiHSdjrtlWpdhBwKE+gRuLJZkfWvVUdnOJ3QZ+M8Uo/vKiS6Fj1X/yWkW0/eDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amnT9XN9YN6Dbq+T4GJypTsdVAPjgmJO5PeQV7YWdsU=;
 b=qhl3mp6/roCJYehRVAtu3cjt5+eiKPtKJF+vvYlnJP6nAhLov2GoMRg4k4MCrc7IK6lrqvwZV7wNrk7nhPbVJJcG1WeL3099ukU6dMZoAuCSuK6ON3t11hTvIKlcBb9DqZV0i0IEYzhm1D8g3MQwp/nwPIicA+DKfm1WHAvdQ/mJ1RxLm4cYrVf3g9aTPjfB8XVDcS8Ai9EaImmIcnPRDKCWUIH4VBuykIUdq1BPFbK9wJqu6QMaM4ioXPbcsaqc1C8zLY9+5U+yMQmdtgxpGVqHo84hcH6Ys6jTrqSlGYpFIuf4Eop7Rf0WJDHvLbzDAwRMBX/ZR2qDEsfOFeKVAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amnT9XN9YN6Dbq+T4GJypTsdVAPjgmJO5PeQV7YWdsU=;
 b=VFl6dnwkG1nnxNCneBJKEWSUhSdIHBq34OxrlH9Fado9kY2p8kP+GE69wV0LbdtLvjClzyIkMEarDd6TzUfzpTCEOlJxWrfq1hC0ssqKxykeylH5wPSmmr9j2Z2z/WbjWE53EnyDkxv4z0FRtUKel6qAR9VosSBqxA/UQnAf9RY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOCP265MB8626.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 15:55:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0139.020; Tue, 23 Jun 2026
 15:55:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 16:55:31 +0100
Message-Id: <DJGJURFV9NCB.25MLPQBQTL9WR@garyguo.net>
Cc: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, "Lyude Paul"
 <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Trevor Gross" <tmgross@umich.edu>, "Waiman Long"
 <longman@redhat.com>, "Will Deacon" <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/5] rust: add pr_*_ratelimit! macros for printing
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Carlos Llamas" <cmllamas@google.com>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>
In-Reply-To: <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>
X-ClientProxiedBy: LO4P123CA0663.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOCP265MB8626:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b689f19-2e1a-476d-86f5-08ded13fdad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|10070799003|23010399003|18002099003|22082099003|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	P4F6+62dh1wIexenRJujnpop8YS+FWJtitFRGzdewv6Hvb6hP0G/j8EEHZQx58H2m74D4skvAz8IWbPsqEUvbl8AMpz4bMPk991jytI+zZpqlHqQY9tfTYPdfBKRalmYGNAALYREJO5J3IjiZCyUXs/xnudVOO9oWlRuwfKFQ6OMJTkr+liBo7AQHkKLrB2RnXVN9789S0zFEL03SAYRZ/aLpBk0GjNU4qizxAmyVArOQ2GKgYiLU1XZEztar23xk+AG11YQUuLofFkGF5vHOF4IQcLigKoTveCcGnkGS1cKIByh7DcsFLWDZ4gLnXuhIyl2O6TcF07oxHYxmXuA1c8K6CP7RCR5aIfGyHieoXbk2+Wvk6t0raNk4M6ZxYHU4dCAfhmHUWZwsHT5mlGvX2o/QaeZXGXYgA+JrlVjAZDYInu5E9z8Dw3X91eGrASMj3dlgTigz+B9e5PlrLjQxc9oROXjcV8gzKxoc5ZVB7tYIMl/ZKRneXJTnmSrmo9uk8zVDFqAt0MD7tou3x3f028rfnSLj94xUat+gCvgecniVo34eZdDHgn0mwd7iFWId2gRBehDUMsfwf13NCi8T725UrGKixhf6m9tuXP8mrm6HHow3TCmLyW1wEFhOBFf2amzPtWcDXXh58GLPogC2tiil3573nH6aDcQlYNgn94=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXoxd0NzSGUxbjhJSkU1ZndGbmhKcU1tdERzbGx4VC81YVNzNHdyQUN4OVNU?=
 =?utf-8?B?UmdUNzhvOHhwbllDM1lLbFZqeEhBV29ybGZuTThHSHY3WDBPbTIvOC9xQTY2?=
 =?utf-8?B?ay9wRi9Ody9kWUt4VGNXSnJkQ3NGTnZoNWNFUjVFWjJzWWFQYU9LWjJXQnQy?=
 =?utf-8?B?eGR3akNsVjN1cUtjTWtGZ1I5RmgzbFdDeHBDakl1ZHlBRWc1b3ZoRThJU1Mx?=
 =?utf-8?B?bXFIcG5qbU9PeWRkM2hzZFk5M2VHd0wrdW1meDU3ZnpUN1Y1UnN1WjlHWXA5?=
 =?utf-8?B?ZlFMeGd4cXNKU05FZ09mdWFBOU8wcUp5ek9UN0p5ZXJoQlNpaUQ0UG1kYW5U?=
 =?utf-8?B?NmY0YkNWUXBBNkJIUDI1UFF0eW1JYkNMbGNYalBDZyt1ZU5EQUZyTitsS2xn?=
 =?utf-8?B?bGc1MExJQmJWekFKRmY1UkNFN0N2NHlRMnMrUHRTSm1VV2pOTnFXd1VPV1dR?=
 =?utf-8?B?eFViS3Z3SWh2MzNwQXJpd2wrenFVR2xhSXBTTjFGZXZrWitMd3lnZ3hGbXJ1?=
 =?utf-8?B?RUpld0V1Q3ZmREtTUk5ham1WQmIvYkZpZVdzTkhDSEJGaXRGT3FYRGFQMUtk?=
 =?utf-8?B?eUpNZmkxM1ljeUFqa2IvMEd6VkY5RGUxYmR5QS9PUGEycFEyM1RVbTBZZGRi?=
 =?utf-8?B?TVJmWlhsRnphVk56M3g1VWZrZktFV3VsYzFpQ3piKytGdnp6R281b3JqeGpk?=
 =?utf-8?B?MFhEdzloanpTS09HZFR5UlJGL3pUV1RJdE9SdFZWZjNHcFZnSGkyN2FCY0tQ?=
 =?utf-8?B?dEtPZVQ1TWN3NCtWRjUrTWxRSDczcGI5TUFQRjg0WWxVa0dIZUlXR0VhUVhE?=
 =?utf-8?B?YnpaQ3Jiek9IRm05MExxa3B4TXppQVJPVzJMSjZaNVBIaXR4RU10UU5hRThK?=
 =?utf-8?B?TjJDL1g4OXBWZ2ZqZkg2RGxON1BKRS9Hb0U0SDFveW5uZXRvc2piVG5zYjYx?=
 =?utf-8?B?cUhxdVkxMnBiREQrQVBKYkZ6MWtJTlFEUDQ3TTYyR1FlNEg2dnBENW1TYy9p?=
 =?utf-8?B?bHNWZXV1ejkrRmhOdkZPT2NsYjZTbjZBNVppSTBBSGlTMXYzejdvUDBjTHRO?=
 =?utf-8?B?QTRoZFFJbGxZYm1zY1dja3prSldueTM5eFl5MkdBcTN3NG1PblJwMCtPRW0y?=
 =?utf-8?B?VDAreEZNVk1lNXNaUTY0R0tBQ0VMMzFmNTFMdkFVVnUvMFdMMXFjYjNWZGdp?=
 =?utf-8?B?MUlMSzZ1VlRFMXNWTFBaUXdMVmVGOVNxQWhjUXJiSHlpeGNHS1hLOStpZU9y?=
 =?utf-8?B?Zmt5V0pxdCsxaDJYM0M1K0RKTVg3YnF1emF4Mlk3TDFMdGJEcTl4RExjNUxh?=
 =?utf-8?B?WGU3OGFnRXZxdWt0Vkl1eklnaEtqOTNNNjREUGt1aEQzTStNVmpWOFpCNmxP?=
 =?utf-8?B?K1BWc2l6dkdNNU1OTnRqSlVxNHBxM1d0WFNsWU9seG42ekNERXJ1ZWJOeExs?=
 =?utf-8?B?WEpPb3Z0Ym9KMkNwTVNsYzNickNNVlZyWHp4SVdFcUtzYnBaM3Y0b0d4WSti?=
 =?utf-8?B?dkFlTm92ZFowV0VscUJXZGtaempGbFNhOW9vYTBvWDBzb1d1NUY4U3BXbEd4?=
 =?utf-8?B?b3h4b2prNjlKcTBiemVkcm1wV01nVmovc3hxaDkvSVU4dTBuZ24xSUJPQUtY?=
 =?utf-8?B?RDZqbWFod1BhMk9sa3RGbGc3ajNKbmlwbENpYTF0SUNqSFdHTUhVZW4vR21F?=
 =?utf-8?B?a012ZWV1enp3MWxWai8vVmw1Uytsb0hJWHFGZGlVa3JrWk9TYkZiMXZpUDBj?=
 =?utf-8?B?ZXo5KzdrOUQxNmNHZjA1cHFaeElhYUxGc01MLzlHZC9FUXpkMFI5cCtMbnV1?=
 =?utf-8?B?ajV1VVJVdHJvUW5yVzE2MmUwUDIrb1FUUE9SUzVHZzd4NWtyQ3UxSitFWmp3?=
 =?utf-8?B?aDZwb290TnBmeXcySzZUK0VjUXdxekREUkk0MlVjb1ppTkd0UzJsM1lQNi9L?=
 =?utf-8?B?Nmdtd04yQXhMWkRORWM2Sk1ZdGljWE81QXB2ajFNckt1SmJTUksvZHVMUHoz?=
 =?utf-8?B?Y3pyREJKNXZaenl5VXBQcDBWOTB6Mi93VGNUZUZlckdyUWhEQXdjVHdJSDhw?=
 =?utf-8?B?RmMzZmd5RXQyaU5OYUVtYkFOckpzT2FybG1xYnlVaHVDaTJJN243SGxzSWQx?=
 =?utf-8?B?VmFSMVd6VVMramp2UW9ZK3lJeXZucnRQYzJvNkpsUCtEOVB5YVV6ZWRtWGwy?=
 =?utf-8?B?VSs3MFJZSXVzT2RFSTJnS0ZTZWx0cTJFWlNveVJac29uSExBdHVyT3k5V2RC?=
 =?utf-8?B?eWJvQjJzNlhHR0sydEFweG1pbENsQTIzZ29XdUlPT0JqWTcvZDNmOFEvZHIy?=
 =?utf-8?B?VjlOMGVJSzZxK0VBUzlteThJYWc2bkNBRWZBblo1bnQ3eG9xNjIrQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b689f19-2e1a-476d-86f5-08ded13fdad5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 15:55:31.8686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEKghnc8RMYZmvhsLdDHaAIabz1vmrkVQCgUKsMBuOI11aJxytSnconFaAeAp3lv5eSwCU2gggBcviyuA/M28A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOCP265MB8626

On Tue Jun 23, 2026 at 4:38 PM BST, Alice Ryhl wrote:
> Printing can be very expensive if it occurs often, so printing that can
> be triggered by userspace should be rate limited. For this purpose, add
> a Rust wrapper around `struct ratelimit_state` and use it in the new
> macros.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/helpers.c   |   1 +
>  rust/helpers/ratelimit.c |  14 ++++
>  rust/kernel/lib.rs       |   1 +
>  rust/kernel/prelude.rs   |   8 ++
>  rust/kernel/ratelimit.rs | 202 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  5 files changed, 226 insertions(+)
>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index d17eaec76450..2184b11c927f 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -80,6 +80,7 @@
>  #include "processor.c"
>  #include "property.c"
>  #include "pwm.c"
> +#include "ratelimit.c"
>  #include "rbtree.c"
>  #include "rcu.c"
>  #include "refcount.c"
> diff --git a/rust/helpers/ratelimit.c b/rust/helpers/ratelimit.c
> new file mode 100644
> index 000000000000..e5052f568b81
> --- /dev/null
> +++ b/rust/helpers/ratelimit.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/ratelimit.h>
> +
> +__rust_helper void rust_helper_ratelimit_state_init(struct ratelimit_sta=
te *rs,
> +						    int interval, int burst)
> +{
> +	ratelimit_state_init(rs, interval, burst);
> +}
> +
> +__rust_helper void rust_helper_ratelimit_state_exit(struct ratelimit_sta=
te *rs)
> +{
> +	ratelimit_state_exit(rs);
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index b72b2fbe046d..ba65ab4f0b8c 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -111,6 +111,7 @@
>  pub mod ptr;
>  #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
>  pub mod pwm;
> +pub mod ratelimit;
>  pub mod rbtree;
>  pub mod regulator;
>  pub mod revocable;
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index 44edf72a4a24..5a66028dd973 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -89,13 +89,21 @@
>      },
>      init::InPlaceInit,
>      pr_alert,
> +    pr_alert_ratelimited,
>      pr_crit,
> +    pr_crit_ratelimited,
>      pr_debug,
> +    pr_debug_ratelimited,
>      pr_emerg,
> +    pr_emerg_ratelimited,
>      pr_err,
> +    pr_err_ratelimited,
>      pr_info,
> +    pr_info_ratelimited,
>      pr_notice,
> +    pr_notice_ratelimited,
>      pr_warn,
> +    pr_warn_ratelimited,
>      static_assert,
>      str::CStrExt as _,

I really want this to be just a variant of pr_, not a entire new family of
macros.

Last time I raise this in
https://lore.kernel.org/rust-for-linux/20260108125523.5c7810ae.gary@garyguo=
.net/
, I was suggesting unifying pr_ and dev_ too, which might be a step too muc=
h.=20

But I think just making ratelimited a keyword in `pr_` macro should be alri=
ght?

pr_info!("foo"); // pr_info("foo\n");
pr_info!(once, "foo"); // pr_info_once("foo\n");
pr_info!(ratelimited, "foo"); // pr_info_ratelimited("foo\n");
dev_info!(dev, "foo"); // dev_info(dev, "foo\n");
dev_info!(dev, once, "foo"); // dev_info_once(dev, "foo\n");
dev_info!(dev, ratelimited, "foo"); // dev_info_ratelimited(dev, "foo\n");

Best,
Gary
