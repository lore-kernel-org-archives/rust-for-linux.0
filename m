Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021108.outbound.protection.outlook.com [52.101.100.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A40027B4FB;
	Fri, 27 Feb 2026 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772202226; cv=fail; b=L5ThDDItC6slc+qKqb6PWLuziZdfdYWb3qZkLILWlcGIuhDpfksHgIzUMm8rH4PQ9yRZzWQK/eBXkctJTuhXK1ABbSDRdVej14bmQccH9j1IM5gm/BTe/5ub7eXXqPFOQPqSgIhakzlIly4pKjzJMWBdJcnXoMUktpnVYhBom8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772202226; c=relaxed/simple;
	bh=/gUQ34pFTjnku+GkWTDv2axPoOS/B9avq3CZV0yKdSU=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=qaa1VNNDF/i45qHYQPnZBg92e9u+ORNXPF4d/an62zH23P8bmiZIoOJKRCpy6MW0J83y1S8+bKAudEoHZ1rrF0FTqd43keqZG20LVjWfaPt1InHh0nd3yCIQL0EJIzdMX/2TOXtgzRYkkEoXpxXHML5/X9zFP1Xe65WO1aMh5j0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=r6TnP5Hf; arc=fail smtp.client-ip=52.101.100.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="r6TnP5Hf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Exz6bOGSk+fv8HytwnHTMzG3d7oRpeXCrLOTWRvpOhHXNu+fpkdaDZRBp2w6fy4+yP9Cpz2Qd5RZ2+EQ7lA/n095DaXRkdqauwJyG4MgfcRUi2tB/Vv1JEs8h+4769GZzarG2IOXZClbaQVvA8BErTp42rBczLrvoMAwpzMis6UT/XalknBnqMwkJCNbHyVr90o1mh+7RjNkza3gIHXtwkWQttDJ/79UXuJtMKpW45San8Jdt1cmKUFYUicCglcMjk6hlnyo6/Wc4FTtb0EylnXoFx7f1eZSgtVI06EFqu7u3PWO4SRsuIj3L4p0OI/X6DV3EFMGeY+rWls+T8+n/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czeZSNi2WBTeUU8DNplq0OCbt16Cd9d4+JRuulT18no=;
 b=nYA9aZf84SzlOGD3hOfkfIfwc4p/DtMRrLvOgSoXCASzfUdRZtvRNEpHnCcTFga7MzBhlxjx+wC1cRJl6GQXl4B+VzxNRPK4AWq6ofeRNOQ6Jf0q9hqmSb+7/n6Q5ZZpMo/3As2ENUYyOM8wYEn2uVIeKbmb31MdsHvPxTxvZF2UbT5VMe5nWZ/mQd86C9DiKOU5DLNG8aXT83xJCfsgFkww00Nhf5YWn1VgzSmLH1gPRUahmcLrZmVa6gCqWHflvYpHUpyCde3FzyebTTE3iaKxdr0hg1BzwtHvb0wGRwBipYMyDaOC75OLYaTcLV1o2OAbSS5KqZAIJASvbW+ivA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czeZSNi2WBTeUU8DNplq0OCbt16Cd9d4+JRuulT18no=;
 b=r6TnP5Hfl1Eb0jEALNYwkQGm1kzo7QPn0Wemwf3POofwQyKh2tIfiGu9PxahyPCoJbhA5YJD699wK3U6OgXyb8MlRiaUjMiGhrE378iUEqCNiGEanOsjoQOCnlwxVJEz8rwZheA/RphXTysWY+5jy8qRgji5CVrT/qDOPcQyYOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB9106.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:47e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 14:23:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 14:23:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 14:23:40 +0000
Message-Id: <DGPT98PHCRJK.24W50V2JKRE8K@garyguo.net>
Subject: Re: [PATCH] rust: hrtimer: add active() method to query timer state
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Frederic Weisbecker" <frederic@kernel.org>, "Lyude Paul"
 <lyude@redhat.com>, "Thomas Gleixner" <tglx@kernel.org>, "Anna-Maria
 Behnsen" <anna-maria@linutronix.de>, "John Stultz" <jstultz@google.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260215-hrtimer-active-v1-1-a754d10492c2@kernel.org>
In-Reply-To: <20260215-hrtimer-active-v1-1-a754d10492c2@kernel.org>
X-ClientProxiedBy: LO4P265CA0274.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: cf95d702-fc1b-46b5-db40-08de760bce1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	4nIAhyEDuU2lvUIEBTklPhukXN5OFy9v+QZiXbfaUN1nHanAz8Gd8GvD/qwGlORE+PBbzg5W1FI/7kka9OP4uWYJvE4t2dGfG+Hk+NCSl5Ld0jQwek1Os0e+iV9ppjBgKu7yZrgiy7XAQKoVojDrzWlSZU1bwdak1MxyGEOh/FNjwh9kH3Hm+6h3oURUg9c51Kd7ZLKNz8RD8YC98vv0ew60U8Ix/fK2xxkxDhISurWgWqmsFcDJARVIl+BiXx9yoQWBfSSN/SSnS8zV6O1d7NN6j9T10Yrf889tof8R6B8P5oyI/HF1uyVmZRovCLjEAHaUQ5D9wL+lYKG9qfElmRrZv7Vp5GDkkdivoYgqcCCQ507oMzwyzBOf/309RxHeHOpK+YFQ6MJ29BwceqGHAnLyyBcTX9aga6RTMCzr/T99ZsHhY6HHRb9GHCa3EJWwexc+DDB1pg4HkXarsEUvFkiHQadkqIYbkRSLcYlr+hHJEc4qagt680+6JtnerRj6hWBE2fHPmkzG6vmZXN9zhzYWKBN01rwx5oVbxLwg41kHa9vOnrnP63XQAlrt6Nnf9z/LY6lVT2t/h8A+yGbUPsJleJUwY/XwKjxlzFo1v5+X4dyWKATw1/rENQ3/4HSonFylv+5KuYs/JUzllX1qrZmPk8x5SX0yjWibCzxIK1pwEMop1jqrTOxxNxq1iY0Z5uK5rU5uBd/P8EFymESvVw28HRm2Faj7NCNpj18O6ZtwpvE32cxdclauYPscx3CwZT6ixs7tUcXfY8vaTm3rIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzNqVU9Hd3dMYnB0ZmhqanJibm4wQ1R5QndOTW9yMHlxQ3ZBN3F4aHBrTzJ3?=
 =?utf-8?B?cFBpcktreGxmSjMxd1ladWlkM3JoSnJZbXJMVkpzUW5JQ3J3NFBVb0prK2Fy?=
 =?utf-8?B?M3I4elJmZG9za1RTV0xuRm5pU2VuRXlVYkZSYXJsNlpKVFVVTk1KblRMZVhz?=
 =?utf-8?B?NjhKSWIzNkZJQUR6bTVsaExGREZic0FBTnhKeWM5NlJtRUUrbnBWOGxpNE1i?=
 =?utf-8?B?bU1vTW9hNi9oMUZaQ1oyTlBvS2xtNXV2Wmg0aU5sRGFITS9tQ0FsOGlIVHpX?=
 =?utf-8?B?ZUM0ZUh5ZExqc21NTEdGSGhFcytiTlNCWi84L2NaQkovUnBXeUV0K3c2bVJU?=
 =?utf-8?B?bjN4NTQzaVpiRk53WTE1QXRpdlVoMzV0YjdrKzFmNndqT2VsQktFU0lLcnlP?=
 =?utf-8?B?Y1ErbEtMMCtqU20yYndCNFd4NGwzV2ZGaUwyQ2tHK2tPak9PYkdGWFllVWR3?=
 =?utf-8?B?Ykhoa1pOVWlUWEhvWkZtS1V5ZEJkSVRYZ2VZd2xKVWo0T2dCTThLQ25HYkFK?=
 =?utf-8?B?N0psMEtTdEtnak01VmhFZkRCZmNaSXhBTVg4SlN6ZUo4b0xSUi82SEtXQXVC?=
 =?utf-8?B?dVp0U2tUdTZXMHNwOUZFejY2Q1h0dlcrcnNqNnNrQWJCS3U3eFVjQXUvTGpk?=
 =?utf-8?B?VjBjSWppVVprU3c5NktqdGVtcWFKVW1PbWYrbW9GYzFLUk80eTJya2d5M2h4?=
 =?utf-8?B?UStNZjk0VWs3M1pwWlVuUEZwbi9xMFJUUzdxL3NyQ0kzYkRDL2pFS0hGTVMy?=
 =?utf-8?B?S3IwMmNCSUt5di94cEROb1NnSnVub2h6dURCbzNVRVRISlVVQy9maytJeS9D?=
 =?utf-8?B?V3VGVXhlb0t5bWVUTGxmUnJQOEtrS3RNcXNiQjdvOUcyNDYzVlJRcUlsYzJ1?=
 =?utf-8?B?RTZLSytib25neEJ3N1JDWk9Ha3NvQldSSmZFeGtDVDF6djV0RGtjNkhKL1Jz?=
 =?utf-8?B?VGYvd1RYeEFVZ0tUZ3BObXBlNkZQTUU2blBtVVdhRlRYb0dhMWlGRDNnSnIr?=
 =?utf-8?B?elJvMmNlM3IvdmxzOE0zL3Y2RWZjdFlRTm0rbDhqcVF3dThkUlM0alMrNGNi?=
 =?utf-8?B?T2g5SXhmVTd1bzBTcUpiZGdZMXZBK212UWFjU0dSdzRSMGJyZW8vdEZQU1lD?=
 =?utf-8?B?RVNoMXpWS2lVMWNPY2d2SHZTbFhPemNmZFNHTndDc2NpV1NkWWhjaWMzbjhr?=
 =?utf-8?B?V2cxSDQ3dzRSY2RaSG91SytOaGxFRHRVRndTM1VhU01DU2JBY1ozdHVGeE5q?=
 =?utf-8?B?MTJxQld2WE40QWlkN0pmTmRNNFNSMTFQR0VuUm4yWHFqdUZLSk5pelltay9k?=
 =?utf-8?B?ZWI4REdEbzgrOG9DaC82VUdDT2V6T0JPOFQwSEhsR0h3ZVYrcDlyaFNhZm5l?=
 =?utf-8?B?NzFWclhIOFZNTUxyZElLSmZHQmZObUlXb3huQndEMU5WdXFnVThnQmpRd3dy?=
 =?utf-8?B?WlRsajBqcTNGUCt4RkNLQk10aDFWVjQrTEJCT3ZCcFp2a2pZNHgxZGN3MlFW?=
 =?utf-8?B?NHdJWDNKTGR5RHBsbmlsTUpmeGFyZGwwZXdpOStEdHJiMDJ4TDJyOTM0WFh4?=
 =?utf-8?B?QTJVRjJuMjllY3l4eGVOTWxPMStDRnZOckh0VFROUmZQRUFVcGMvYkNsYk11?=
 =?utf-8?B?d1NJQkJuU0h5SEIwZDJCNldZdkYwUmM0emt6TVJMVkZ3OENpaHJKT3ZmN0sv?=
 =?utf-8?B?a3R3MnMwbUVZbDNtNlhSL0d4NUE0WWFkaTFtU20zOTFnL2ZGOXBBc2hQRnMz?=
 =?utf-8?B?VEdLNElsUFFlU3NVbGhvUnhmdzdxb2J6VzJod1pONlVaNWVGTUlBUGhiVkhJ?=
 =?utf-8?B?THBLUDF0NVEyTTV1NTdSMzdCMy8vMHplaUlvMUhOb0R4ZkQ5djdJOCtVVUZv?=
 =?utf-8?B?VWRrSS95ajJEMHdIVDF4TUs5b3R2dUUwMXEyM1AvYVhCa0MvRXhUempMWkR3?=
 =?utf-8?B?cXRaRXVtem9aTkNydzI0bnRxK0V4T3I2OUFvNXNGQ05RdlZHcHd3c0VDUCtB?=
 =?utf-8?B?Z0RJS3JhWWFXUHJVK2I3dlMvaXZvUUo1UDZrbDF3S2EzOEZCLzFxOGdLZTF3?=
 =?utf-8?B?a0NCYUZhdVB0QU9iMWk1cVFOVFg5bDFyVjhXb0NockJOa2Q5MFZFTElid3Vy?=
 =?utf-8?B?KzFuWUxoWEcrWXRka1R4VmduN3hGN05Tc0VYRStvQU4zV09jeVBTVDY3dGpo?=
 =?utf-8?B?cElSODlxcUU5N01VOHJ6QTYxVTNSenR2Q0FGSXIvNmxaNTJCVXRUa056bEE5?=
 =?utf-8?B?MVA3eDdvNTZqR2lNcG5yYnBiSE5JdFQ3ZnZ1S0wvSytyRk5RTUJvNk5pWDBx?=
 =?utf-8?B?QzYwSGgyMlM5bm5hS05Fck4vbjY3SXRFUDFqdWgwUm5QUnBMYkgyQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cf95d702-fc1b-46b5-db40-08de760bce1f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 14:23:40.8890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzLe12YD+bi/92eiBw0/nYLjxfeMbveBMTs1w9xd7fHALBaXMpT92ReLB86Ysg6TmrpSESZgq6I5FXFbTkcmdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB9106

On Sun Feb 15, 2026 at 8:29 PM GMT, Andreas Hindborg wrote:
> Add an `active()` method to HrTimer that returns true if the timer is in
> the started or running states. This wraps the kernel's hrtimer_active()
> function.
>
> Also add documentation clarifying the definition of an active timer.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/time/hrtimer.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a008..b2272b059e504 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -66,6 +66,8 @@
>  //!
>  //! A `restart` operation on a timer in the **stopped** state is equival=
ent to a
>  //! `start` operation.
> +//!
> +//! A timer is **active** if it is either in the **started** or **runnin=
g** states.
> =20
>  use super::{ClockSource, Delta, Instant};
>  use crate::{prelude::*, types::Opaque};
> @@ -246,6 +248,14 @@ pub fn expires(&self) -> HrTimerInstant<T>
>              )
>          }
>      }
> +
> +    /// Query the state of the timer.
> +    ///
> +    /// Returns `true` if the timer is in the started or running states.

This could be `#[inline]`.

> +    pub fn active(&self) -> bool {
> +        // SAFETY: By type invariant, `self.timer` is valid.

Perhaps also mention that this function is safe to call without exclusive
requirement, as this is a common requiremnt for many other hrtimer function=
s.

Best,
Gary

> +        unsafe { bindings::hrtimer_active(self.timer.get()) }
> +    }
>  }
> =20
>  /// Implemented by pointer types that point to structs that contain a [`=
HrTimer`].
>
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260215-hrtimer-active-f183411fe56b
>
> Best regards,

