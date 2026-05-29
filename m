Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021140.outbound.protection.outlook.com [52.101.95.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBABD42EED1;
	Fri, 29 May 2026 21:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088665; cv=fail; b=KRM/BLNFuqu9blvdP4Lw5k6SvHwJmvtlyA7i7ZHcbAe6jUPbg3bHbI2HNxNYJ4frKdUQyatFysJfE0Ao7QTFKqdatFmNzBzkyWP49cZBULeqF5vIIGf3AEmbvWa1FmLISOuG04jh69Zf8lUkek/lrR1b1rlVqkbDTo7I6guoDEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088665; c=relaxed/simple;
	bh=tfuahibu7JaAYKHKfG87dWqG+pq+2030Z6KbTqppPR0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iIk5Kx1pENvrrlYiB/TEFlGLGYyw2Og7DsY9foc1FWxmNzeQZRmoM4FeQcSN6GXj1mYS7ZnEcRI14PnuuWTOWDILjJ8YUqUrX4uNC0ZQv249x0VTmv7GdJehNqqTDF0SFQrr0Gj7YmI/0Y1DtdEdwBFK0CBe8rQolAFkg1DSvcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=WynRvevg; arc=fail smtp.client-ip=52.101.95.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WynRvevg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRAZJmdoRPsvbcqbaCnRrZCheB94LwvzgXOcW4KzTZ3nxqaQLcj9glZXXS1K10Ixa2vXV3tOBx1S0DETHsNlYchyZjdpSZfx3HrLtXovaLN0pKDHpW2Y687JRaZ+mhK6kktDXlU+g21ezBhuRXvIW8aSMlWYgEI9HIjS4SWWE4opT5tr87mBEKg0O7e0NZwrEl7Q9q7SIr/2MZ659keXMjc6K9HxX3mtKVsRLYZVLldNbz4lCMG9aZ4hvh8uAf3tTPNt8EQL+suwWsQh29HLXK+2lhI5wlEhgORUrCpoIfNNyB9pVE0FZD1nOSfD8cvo3jK0b0dmdbb9fafU/X+isw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtYdCKo3TraQd5zh4nqDryJd6DV23LTw0O7JyL5yLQ8=;
 b=L5fVH/8wJ3g6jgvoPLsHuKXyB6eToz5ibQkzPzHPF16msDhKUAp30DhEXyj8XY8weOp81CgGorAHna/Q6i1DHNtiNS1Hn0vG0HXi+dQgfTCnL4eZbN/997G42MReZ8ASTG918I6CU1tnPG3hIzk4sPDwEHx4eyFFo/e0ZoB++XXF7skJqcctcajSF46fzk5Vn6N8244kAGuzX3etABGHEMzA+R0JdfnGFk7Beb1eKxDKsEs00Fi/k9eEAqFl9lWZR1SvRuhcR2u1rI+0y4Jd3WxrljIT1qv11cWcdcKPUaZAX4N9k+5VigD/CA9IIUUy8Bokv6pEFtAk1hbEMbe2XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtYdCKo3TraQd5zh4nqDryJd6DV23LTw0O7JyL5yLQ8=;
 b=WynRvevgOC+AlOIVuKH1cQzlukx9Yidd0vJb7scZfXMPdEnrH4MwlcD/ISwwNZEYCkm+SQQ9qT2LUWA+sLJkjz1YvK9La78FnCxIbV7qtxoHG7n4vqYem/KuGdwuvrO/Lu8wt0a/dEbIOGugtZSuosTPETnXQoBYUU2189pyXRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOBP265MB9404.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 21:04:17 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 21:04:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 22:04:16 +0100
Message-Id: <DIVGRJP17CSE.1Q6E445IXJ1J@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 "Martin Kletzander" <mkletzan@redhat.com>, "Mirko Adzic"
 <adzicmirko97@gmail.com>, "Xiaobo Liu" <cppcoffee@gmail.com>
Subject: Re: [PATCH 0/8] rust: pin-init upstream sync for v7.2 (round 2)
From: "Gary Guo" <gary@garyguo.net>
To: "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
In-Reply-To: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
X-ClientProxiedBy: LO4P123CA0357.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOBP265MB9404:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2fa197-8306-4618-dbb1-08debdc5d89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	u1C6s1izfqgZoQE7IC7nPQdUR4A+5OwfdXSNhcS5JOZiTH8oKVS3PxjfOSLHXfhXmPF5puhwyw5yzvHuE1lS4ajTiZ2EpahhmutmBxjDGMQ5YieNBmM7cAq/A26Cl8BxFXYc4S+yDmhiSkkV/pdpXfhPxroEY5Lsq3KC5NcdQD/+r/XGoA2MltygXxpHfsCabNwtPaS//DTpXu8osROIzs1wVeJIwluHFWBNcPiPanvHfp9XNoNsGhWZBTlCrp/s7f5pBcX8nFO+vUNhkJ7mm9/VvKIWM3FSCxYuCbyKBdmqgvDQ0dJpTflTmQ1etO6xJwtesougp+/WlqkZNbFq3goLgAlUXbu4jWBTTD+7ujUGcs8xEVIGdi3mRCfDnBN0Oa1P1CeVEx40vSeGaNdu7Pt9gG/sspjJhNNRQiqrmXd45tlWaXq76zndq6c1uoCkVgHWP1sKVYYqERB5d5VgbKmAdV/SUxaETDFxdOUesa6omPfIfCnpCeZ7ffPsjKq+RXVx3ussandK66VbvbApGwljJBxq6SB7vCZnzNRpaCTYFRCEJXTEeHEUpynGebzn50grtTeA7S/xN4Mocqok6XWTGNSLQxrmkPHk2xtctVqVn+CK9O3ExN7Yg+Ct//IKvzSxBFc1oaQd/gdqbfVMwX0UBK01YVK2SFfaqFmPzE//iPDdJECt5Skm/6W1Pms76y72BBfbVqx3m6LlDMQ3bg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjR4Z3ROQ0s4bjVDTTFNaDVuOVZUZ1RNS2Y1dWVLU2lkWXhrUzJrMjd1Y1Q5?=
 =?utf-8?B?K28vT1BudlNIQnZBWGFvaHJISlIwcjdGOU1CaDdnTmFRNldXVit6UW9EVUc2?=
 =?utf-8?B?N2xONGhOcHNQU2IvY3lPdVpZSlVyV3ZIV1pDZ0pURlZJVFlLc1NnQlFqWTRk?=
 =?utf-8?B?OUQ5U2wxajBLUm1RKzU3MFdoTHVVbGI2MGdKOVFHVGErRmk0Ump4RWl2SmpR?=
 =?utf-8?B?L3hTNHU1RjVjSC9SUU1nenQ1QWV5eTFsTVJ3d3BlT0t6S1FFTzR5NEVxeTJF?=
 =?utf-8?B?T0RlT2lHeE5XTXFxcDVCRlpIRmxxU0xIN1hpQ05QbjllV3phb1pqMW5NUHBl?=
 =?utf-8?B?WmMvQUxPYzRDZjFHL0FqQ2NOUVdVTm5Da2pCQm1PeVFKNkdDMVNzbFZhZkJk?=
 =?utf-8?B?VlJZckM1UVJWR3VDOHZjUE1XdE1CR291S0NHNWFqOXV0eEtjaHVQWm40ZzM0?=
 =?utf-8?B?QllKSktabm4yYjRQNENmQTU0bUxQYlhYM1B0KzUvMXBhMW9qeTJ1UHk1b0Vm?=
 =?utf-8?B?dVl1NXpCMWVwUXJydTV0U08yVHdFV3J2RTQra0ttME1tUGV0M0ttQkVwK1BZ?=
 =?utf-8?B?cHBUVUd5TU00LzlqTEh6OFJrZjFmbnFpMTBWQld5cnBQTmRDdTNCNW9JdHdn?=
 =?utf-8?B?OExDY3c5KytlK1g4K0FaQmxlbDRjN3lkbmZqUmUyZldHOUo2WFFCUmYyS1Vp?=
 =?utf-8?B?LzhBNFFCZ2FQMmRiYTVzS2lIdnN4WWFzUmRKSFIzUHZncmFxQlo1VmFzVm01?=
 =?utf-8?B?cituaCtzOFZDTzhhTjRoRlRObmRjdmtTbjg3YWwydTE3VXl3K2tUVGREcSsx?=
 =?utf-8?B?Y1VVUUJ1Qkt6Z0MwQmNmNXhLTHVHZTdVeTBrdXVNZ0dWck5FUU91akdtVVpt?=
 =?utf-8?B?b3c4Q1pmMWMyNnFBRmUvQytlV21yQXpYbGhpNUhwS0J3dmJ0WmMySEI5ZE1l?=
 =?utf-8?B?d1NnWm94eEdoQjFydEZFWDJZbEkvMW53dTRNVTBPN29aRWt3VStjVTVkdUpn?=
 =?utf-8?B?WDJUbkZVc0Z4V2xtUXR5d2dwWXdZMXpSSVBPUk5CeXJud1A1RjNQaTJLalNt?=
 =?utf-8?B?UDBNR0l3VUVLNENWTktKRnFMaXQyV21aZVBvRXFRdVdhR1lTSGNIWXFUMWRs?=
 =?utf-8?B?S1VIRDcvbXJrdXBJV2U3SVBONzFDNUZGOENvcXUrZ2p2dGd5SnA1WXVWS2Q3?=
 =?utf-8?B?cFFFK3hZNTNGZlZ1WWhmSTNKM2J6Q1VlbkZ5SlRldzgvMjExZWo4WlVnWDZX?=
 =?utf-8?B?ZUpKNkplZXpvY3Y5UW5welc4c0ZVOGZHRFZYcWxKQ2paSjNIQzc0dFJMamtS?=
 =?utf-8?B?bzFqRFNmNm1VZUIvUTJFMlpJblJFZTM2cGkvaWVRMTJuREhWMDNtenpNb0g4?=
 =?utf-8?B?a1BsUUUyb0l3dVVGZDJweXk0eHh3dEQ4TTFiUU92aEhGZmFLRUc0NE52NWtN?=
 =?utf-8?B?RFBXQWk4MTJjeTNrb2g5WjJ3YTRxMnpFQzhBZ3dHcEFYVzM2aHNjaSs3T0t5?=
 =?utf-8?B?ZUNZUU1NQWJLeThlWXdyL29xYXB6eU9JZjY1RVM3YXk2VGFvTHZKZU42WUFI?=
 =?utf-8?B?SnZaREZpZjQvdVRIMThjb3FyZUNXR282ZkRjRFZBMmh0Z0QyK2xFUTYrT296?=
 =?utf-8?B?Yjh2T2VEbFQ2SU92ZkxqNFNPZzdZZ1NWVGptZGRHTWVQWVA3cERwa21qTDBE?=
 =?utf-8?B?OGkwT3g2dDNmMmorRGpseS8ydmIxbmdReGxFZ0hQLzh2N2hJa0FQTlFNSm94?=
 =?utf-8?B?WEYxTGQzOTdTa3RRbjRsSk9EaTEzemtjQnlXbmY3VVltMTJyUXdUa0JBZDdz?=
 =?utf-8?B?SHEzY2JjMGlvUzhoNnBkTGhCNkFBbUE2c0JieU9icHpmVlkzMC95blZlMnEw?=
 =?utf-8?B?ZmlNZXFGd1h4QlBXbWNmajd6TXFwWmtuWHhpWnFuS0EyWGY2dDJhUkdIUENw?=
 =?utf-8?B?YSsrM0Jwa1N1U3F6VHhQbUhYeEc1NmRZYTRna3NZbXVKR05BZTFPbWxuTDZk?=
 =?utf-8?B?VE9WcDdsRHdXdStQNjVYUVc1UUhvcGlWZjVlYVkrMmxoSTNsdHBNZzJnZklY?=
 =?utf-8?B?RXJQdzFFaEtDSEdZeHFubkhoOXZNM1hQdXRKeUI2R0pJV1FOY1NxRTVIRXll?=
 =?utf-8?B?VjROcGowYk5HQkhFWGFCaFpHdmZGTm5LdWZhUlB3U3RCdHp0TFFFbnloWGVX?=
 =?utf-8?B?Mk96K1ZyTWhjZUdjMjJiUmlpRTdrVFNPUS9wdmdmTnZsSlAzOXZhNk5WT2Jl?=
 =?utf-8?B?d29WSWRDeTVVcWk3VHRybENnREpWWVRCSTVsMGlVNm03akwzV2RvSUpoU0hF?=
 =?utf-8?B?c2NvTjRIc3BuazFaWk9kbXJsbnVRNTR0MENwMnpXRndMSkRBMWpCdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2fa197-8306-4618-dbb1-08debdc5d89c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 21:04:17.4647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gXcksPjeu1/Y1BsitAFd1KG3cjI4Jx5Z4JhwztuMrA9cTo3vEOM+QhHDGKGp5l+4hsA72ghdzrjGVWR5UYkUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP265MB9404

On Wed May 27, 2026 at 6:19 PM BST, Gary Guo wrote:
> This is a second round of patch syncs from upstream pin-init repo.
> The following patches are included.
>
> - Allow other attributes in #[pin_data] structs
>   https://github.com/Rust-for-Linux/pin-init/pull/122
>
> - init: allow `nonstandard_style` for generated accessor/value
>   https://github.com/Rust-for-Linux/pin-init/pull/127
>
> - docs: fix typos in MaybeZeroable documentation
>   https://github.com/Rust-for-Linux/pin-init/pull/154
>
> - Optimize symbol name length of `InitClosure`
>   https://github.com/Rust-for-Linux/pin-init/pull/153
>
> - unwind safety fixes
>   https://github.com/Rust-for-Linux/pin-init/pull/140
>
> Notably the `nonstandard_style` fix will allow a bunch of `#[allow]`s to =
be
> removed from Nova's codebase.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> Gary Guo (2):
>       rust: pin-init: move `InitClosure` out from `__internal`
>       rust: pin-init: remove `E` from `InitClosure`
>
> Martin Kletzander (1):
>       rust: pin-init: internal: pin_data: filter non-`#[cfg]` attr in gen=
erated code
>
> Mirko Adzic (2):
>       rust: pin-init: internal: suppress `non_snake_case` lint in `#[pin_=
data]`
>       rust: pin-init: internal: suppress `non_snake_case` lint in `[pin_]=
init!`
>
> Xiaobo Liu (1):
>       rust: pin-init: docs: fix typos in MaybeZeroable documentation

I've applied the above patches to pin-init-next. The two patches below are =
not
applied and would need a respin.

> Mirko Adzic (2):
>       rust: pin-init: make `[pin_]init_array_from_fn` unwind safe

This one has an issue reported by a Sashiko.

>       rust: pin-init: make `[pin_]chain` unwind safe

And this one triggers a false positive lint in Clippy 1.85, which appears t=
o be
fixed in 1.96. I didn't bother bisecting.

Best,
Gary

>
>  rust/pin-init/internal/src/init.rs     |   4 +-
>  rust/pin-init/internal/src/pin_data.rs |  64 ++++++----
>  rust/pin-init/src/__internal.rs        |  30 -----
>  rust/pin-init/src/lib.rs               | 217 ++++++++++++++++++++++++---=
------
>  4 files changed, 200 insertions(+), 115 deletions(-)
