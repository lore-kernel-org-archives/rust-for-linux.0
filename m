Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022103.outbound.protection.outlook.com [52.101.101.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2A0374E67;
	Wed,  1 Jul 2026 17:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782926092; cv=fail; b=JgE1T5YBsG2t/BKk+TEUfwUXyGgWZguQEy8KAeoQklbC72Wf6xR+fAeAa6ckIe6eW235kuhT2qQwV7fqNHstlqXjxTANexPLZ4OL1qsRTrrpcgt506Mobs4txzOWNMfrMNIYbQJKQi+GBPO4gX12ZK6TsBRVmAbZGlVWlY3WL7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782926092; c=relaxed/simple;
	bh=v7WDpMTgg5/uxyzk+4WCQPPDWxwGP+u9h3xGI4hVwDI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Q9yJ95WV2QIL0C89zwRhty+UkT/GcFNp5744lfmZYkJXYMUwVAd0F20S+rbdxwvuUyGEzsGjLbO70JLs2gGoZyBnJMM9hxYST4IG5sbkvQPEMeL/uGCt8ouI7fVBme5ane5SBwiGGq6CoTI+JmGNmQxb12uzH68SxNERYxGtfbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=T6hIcSYY; arc=fail smtp.client-ip=52.101.101.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="T6hIcSYY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyQyE+lBLr5xhv411dSfFDbDmQS9NH6JGsi2ZB9/+MdQ7srfuSyZWdAUo7nG+PdoYZfvMQD+TEVJI7fSSYBqk+Brs1FQniq178bZ3012bDGM1Kyr/TkHeNp+yw0LdadlQgTzhD1P/cu3yhqd++2M9Nj5Y6jzNg/M/ky05clADvMqMWJrmErdeoDSuDbPgD6O57RKM7A9ZN5VsQKROr0w8GMDih8zOht9k/mskr/KeajWOxEweVP+w2Mw+hSY3KWgQYPeb3JufHQbArZQaqMuJphr2c7GVvtSJZtJ2HxVioPdtkOihnmhsFIw43JuCxPdkYcHXUQP+zGga4w0IIZ1Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q484U7vyQKJQt0vUC0Jrs7Kynl6awYGUl8q49f03Xng=;
 b=lPo/qkcdpGLLUD0z1iO9OR+y0gRjEeLKNlriR62Jv9M6/44MNMp0iaD7nFhD4KmH+TZWc9t8hd0qEUNhRQly0rSbMqSviDTvsRB4WuMRheT1AeDQrYja4JteXV0lSIjC1+0oxYqSeDeLEl1FP0/Q3RBthFmeaQaXTTaTJVJKq6wl+oSgbFhFG9q1Na59qmjcMews9fAwsm26YMyOQ7TIq/NJUZwh//HWRym5jKKrb8BeSbZZRQrjJ3BSlFTxeBsV9lqnwhZ2BQK6tMDQSLkOuKQjBG9YOfKizqV94kNzvZd43kGe9ixPcqMWroA/WAosQqEs4g+g8KBX8qDgBHQ2Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q484U7vyQKJQt0vUC0Jrs7Kynl6awYGUl8q49f03Xng=;
 b=T6hIcSYYan8nR9ruK1KHdNwQg0JA9ETaPwBqTtV4JGJSTuOcqm0DOE/Ii6g3K4kDBo4SHY5x3gSdmk7WI0nYwJ6vsxigtDwaRxFem2Fj10VP5odeWCNmW4Zq3wgsuTZUaITVWFR1m5QmW9rvr7R2LCBeeU2GfCEGqDgwh4HGnpk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8561.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 17:14:46 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 17:14:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 18:14:45 +0100
Message-Id: <DJNEJSFRKDMZ.1J9DIN32Q9FXI@garyguo.net>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Carlos Llamas"
 <cmllamas@google.com>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Andreas Hindborg"
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
To: "Alice Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>
 <DJNDEDDBYJXW.1KX1X9QINHSQS@garyguo.net>
 <CAH5fLgjDAgwoCo3w2n0AF9NsY2mBkddG9=21Ame9qxiAY2W9iw@mail.gmail.com>
In-Reply-To: <CAH5fLgjDAgwoCo3w2n0AF9NsY2mBkddG9=21Ame9qxiAY2W9iw@mail.gmail.com>
X-ClientProxiedBy: LO0P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2b06b5-a90e-4916-61e6-08ded7943ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|7416014|376014|366016|1800799024|18002099003|22082099003|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	PofChSC4fyOBygw3sOlhctkJMbPnFkiwW3nFIPQPR/JxTHnM8/woqLYvlyI2YBjKfwzUIHaYIDGUm9zfqKTb10wy8EKSbg/zNiJYICVg9pwIYP3W6RGF9xJHl62ftOyahPjgI8osC1mlRFC+aX/+Q1Dpjo1Ml3KxApNgoX1O/9ccPqHtEG0JaO5fF+n9MmxNWKhhsAcGp0MdSRZIYQkAhsrK/r+znqsHE3EIwBG9uQQd5ewflIcEDoU7ynOPuUjCXBQTznI3vGVryKjVvG1VmW9S+z21bxd6jSjsfPdOnvbhHseAwWFmBiGB6MesbexUJHt55DTgKht0BEipWUxe7H0UqT4LUDttEoZMkLLwjNigWW6sKzipfKMoCMH3jRAsGUSbXET2f8rsKC80dWTnvQKy8+ZUrsNM5TbFKUIpURdJiacG2XugrmDErTLaWShzllA5uwEXvOhV9CnsA/9K0dtmhDPXE5KKKODzrya9Q3BXkoIqZpvG89PM4icMsnkdzpTFlBDrVe4B9bXNWRhBhz541NSs24J4koxJBnQhIwBzDCmwvTZL7/SV6aTzUzRpeND4J43XthPz+BYl5pgHRCDZ4EBTwZBbk3GlBAqO/6mIkFYDG1s61LWzcDWba4Mc8KRycuvB9AF9rUISVaic7k+5WECowqM6E/C027ULzgg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2NhQUZ6emdhbzRldDNZdk1jRFFheStxS2ptd2U4VkdnQlByN3hCYmJjNk5C?=
 =?utf-8?B?bytyQWxKVm81LzNFTm1EM2lhemZHR3pxamcyenhJT05nMkhqSjBHTEdEYkpJ?=
 =?utf-8?B?WkZJZmh0ZU1kc2ZKNzQ4K2VjYUdPQ1V6Z2ZrRHg4REw3M0FnUlZlRTAvdlc1?=
 =?utf-8?B?akFuSEY0cUJ2RWlRQVNxczVwTjZodGdJU0szbEUxOU1VcEVSTzZRSktBcGNP?=
 =?utf-8?B?cnA3OFhKMkNaeWpGZ280akR3dEJNc2ZkVW1xTkc3aG9zcjBMYVBUZjNQZHEz?=
 =?utf-8?B?REZyTVp5azhoT1R3Zm1SdW96djJSSjcrZkpGekpWSXUxS0d5T0tKZlhjdDls?=
 =?utf-8?B?ZTdvdTBjU0dFa2dlQmdKNFRpczhxYUtLdkNzeWJwaWFINmFHMWprR1plUXht?=
 =?utf-8?B?dTlqc1h4dlN0cGYzSTByRERjV0N6Zk5HT3poWjl5NmlMVzZJZHQ4emptYlpR?=
 =?utf-8?B?NzFZNDlybUJkYXVPcHA4MkFvOE13TVFkSlczSVpYN3JuNk5GRm5sTHgrOUFD?=
 =?utf-8?B?OWVmVFgxV3BaanpYbUhVYU1HZmgzNHNyRldVYjRZSHNZSkJKdjNpbmZ2bWxl?=
 =?utf-8?B?OUMrODI5aExKTXhsQUN4Slh1bmxUcTVsMXBqWVRKR3RDSU85M2ZGYnZoWGla?=
 =?utf-8?B?c3dYcWtjcVlMTUROdk1ob1Q5c0lVcTZFUGJCbVBNbXFKakg4UVoveHBLWjV2?=
 =?utf-8?B?c096WXBidC9heE1jWHVXREJFT0lqd3ptbmlUb3dhdGMrQWNnY1R4RzBuODI2?=
 =?utf-8?B?UkcwUDZiRXFJZFNRNFp0Qllmd0FoVUljUUpycm92K2VnTHVnQXNISE5yazA1?=
 =?utf-8?B?Y1l4TTUvTFZGcDcxSnlESUxianF1ek9JVTYrbENHZFVlU3Y2QzZ5NU9Ncm1q?=
 =?utf-8?B?dnFHQkdLQ2h3amd6MmdNd04vRWJVWXFEWFdpOWlHRk5wcFZDbGlNQmh1Z2lS?=
 =?utf-8?B?ZjJDN2lpS1Qwa2tPVGxWenNYdFBNQVlQV0d3VVpmQk1oQnFKNEtSVkM1eWVK?=
 =?utf-8?B?b09ydkhHMmF3NmN5RVM3TDNBd2NHK092QWJ2WmxiL1VhMTVxSXI5S3AwZ29T?=
 =?utf-8?B?R3VHNjlIVG9SY3pWYmVlbmI3dzJBc3o1VWFONmRVNUJlaXB4KzhEOUhJTlFU?=
 =?utf-8?B?ZnRrZERoajRneHg4ck42b0xtZGJHWk8yYUdZdHVacXhvWFhRTWg3akxIZDN0?=
 =?utf-8?B?TVN1NjJWcUpwVjJzUmx2dVA3bXlIeExkMFhQd01QLzc2aVFSKzRtUUx4czk4?=
 =?utf-8?B?dnhQTXJCTHYzV2RwTS85RGUyRlFTQmQyWk5haUwvbzNMYXFLMmR0MW42N3ND?=
 =?utf-8?B?RG1tZlJUVHA3K1hKS1NTMFhyQS85MmxNcjBtT0VtWTc2NnRtdm1mKzJVUHli?=
 =?utf-8?B?VVNLbUFZWG9YRGg3VkdVRTdzOVhqam1lMnJMRTBKVDZkN3NINmxQc2pxcUU4?=
 =?utf-8?B?YUVudVpqTTZrQlB5U1F0bzFFcWhhci9yc3J1S2hiU2JrdzVRNFR3Wmt6V1F5?=
 =?utf-8?B?SmFSbk1VTnBMRjdCUXRyN0VCaWRGWEplU3ROWm1EVjhMZEx5SXdHRW5NYjZ0?=
 =?utf-8?B?ejU0eHl5cWJsalFsZFRpZ1NlQWFIM3EvelJtSERnVU9TT0ZUZVZyZk9kckhm?=
 =?utf-8?B?STdNelRhaURxd0luZUIwa24yRGFoNjV1RHJheDQ4azRvNnVKeXZ5MjExazBN?=
 =?utf-8?B?NmprQUxUQng1OFFNN2wzZ2w5Y2hIMnpLUEFQR3YybDhWQXVwUTI5UGkwSlFO?=
 =?utf-8?B?TnV3UlhqK2NkbmdMaVQ2Zk9abmcvZDREOHZGTUU5MzF2a0lnV0tpcGVBek5U?=
 =?utf-8?B?MmxldSs3K0M0YkZIT2QvdWV1V01xUFBvcDFsTDE2c0pPRGdkVHRuY1VoZitr?=
 =?utf-8?B?eGhCcy92R25STmVRaDZTRjBWVGYyS2dJYkFzbnNZRzQzS3Y1WEEzWWxNayt4?=
 =?utf-8?B?L21EcVdoVldUQytTTVBqcElXaENmd09JS1NCS1hqZ0pidCtpdWplQXJLeml2?=
 =?utf-8?B?TW5rWjFySkFzWDV5VXE0VTlJczluOTlwbkhsUU13L0RCZWxadXZ1QUJXbnRM?=
 =?utf-8?B?U0hkU01XRTUwM1BsWWh4eU11aDk1SmlIQzVUOEUzakIybmwrd0RmYllFYnNi?=
 =?utf-8?B?Y090a0huSW1URTczYzhuYWZ1VkFPYUZ6RW9hWjJTL245SFV5TnE1YTlaVUNN?=
 =?utf-8?B?QmVaLzl1aUNmckpLREdSNVVoR2hFTCtRQ0YrRlhWNkhzbU42dWdKRXNyNndz?=
 =?utf-8?B?cllHMnZCb0xRU3FBZW9sY1c5c0ZIMExCeHBaVUtaUkhsVTZDbU9sUzlWNEdl?=
 =?utf-8?B?Sm5lYm9rWlY3VjVpUXFEN1kxNTEzVk1HejFqWHRsRG5LM2VPVVNEQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2b06b5-a90e-4916-61e6-08ded7943ff7
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 17:14:46.2352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8+aBdoPK8myMHYtHbIXrmFUpgL3EHERcahlCL7VUN0ZtgZfs5P+/rM+fjs6VHC3QmCDpGAo8bYq3gV+MR123A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8561

On Wed Jul 1, 2026 at 6:02 PM BST, Alice Ryhl wrote:
> On Wed, Jul 1, 2026 at 6:20=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>>
>> On Tue Jun 23, 2026 at 4:38 PM BST, Alice Ryhl wrote:
>> > Printing can be very expensive if it occurs often, so printing that ca=
n
>> > be triggered by userspace should be rate limited. For this purpose, ad=
d
>> > a Rust wrapper around `struct ratelimit_state` and use it in the new
>> > macros.
>> >
>> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> > ---
>> >  rust/helpers/helpers.c   |   1 +
>> >  rust/helpers/ratelimit.c |  14 ++++
>> >  rust/kernel/lib.rs       |   1 +
>> >  rust/kernel/prelude.rs   |   8 ++
>> >  rust/kernel/ratelimit.rs | 202 ++++++++++++++++++++++++++++++++++++++=
+++++++++
>> >  5 files changed, 226 insertions(+)
>> >
>> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
>> > index d17eaec76450..2184b11c927f 100644
>> > --- a/rust/helpers/helpers.c
>> > +++ b/rust/helpers/helpers.c
>> > @@ -80,6 +80,7 @@
>> >  #include "processor.c"
>> >  #include "property.c"
>> >  #include "pwm.c"
>> > +#include "ratelimit.c"
>> >  #include "rbtree.c"
>> >  #include "rcu.c"
>> >  #include "refcount.c"
>> > diff --git a/rust/helpers/ratelimit.c b/rust/helpers/ratelimit.c
>> > new file mode 100644
>> > index 000000000000..e5052f568b81
>> > --- /dev/null
>> > +++ b/rust/helpers/ratelimit.c
>> > @@ -0,0 +1,14 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +
>> > +#include <linux/ratelimit.h>
>> > +
>> > +__rust_helper void rust_helper_ratelimit_state_init(struct ratelimit_=
state *rs,
>> > +                                                 int interval, int bu=
rst)
>> > +{
>> > +     ratelimit_state_init(rs, interval, burst);
>> > +}
>> > +
>> > +__rust_helper void rust_helper_ratelimit_state_exit(struct ratelimit_=
state *rs)
>> > +{
>> > +     ratelimit_state_exit(rs);
>> > +}
>> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> > index b72b2fbe046d..ba65ab4f0b8c 100644
>> > --- a/rust/kernel/lib.rs
>> > +++ b/rust/kernel/lib.rs
>> > @@ -111,6 +111,7 @@
>> >  pub mod ptr;
>> >  #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
>> >  pub mod pwm;
>> > +pub mod ratelimit;
>> >  pub mod rbtree;
>> >  pub mod regulator;
>> >  pub mod revocable;
>> > diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
>> > index 44edf72a4a24..5a66028dd973 100644
>> > --- a/rust/kernel/prelude.rs
>> > +++ b/rust/kernel/prelude.rs
>> > @@ -89,13 +89,21 @@
>> >      },
>> >      init::InPlaceInit,
>> >      pr_alert,
>> > +    pr_alert_ratelimited,
>> >      pr_crit,
>> > +    pr_crit_ratelimited,
>> >      pr_debug,
>> > +    pr_debug_ratelimited,
>> >      pr_emerg,
>> > +    pr_emerg_ratelimited,
>> >      pr_err,
>> > +    pr_err_ratelimited,
>> >      pr_info,
>> > +    pr_info_ratelimited,
>> >      pr_notice,
>> > +    pr_notice_ratelimited,
>> >      pr_warn,
>> > +    pr_warn_ratelimited,
>> >      static_assert,
>> >      str::CStrExt as _,
>> >      try_init,
>> > diff --git a/rust/kernel/ratelimit.rs b/rust/kernel/ratelimit.rs
>> > new file mode 100644
>> > index 000000000000..da0a49412023
>> > --- /dev/null
>> > +++ b/rust/kernel/ratelimit.rs
>> > @@ -0,0 +1,202 @@
>> > +// SPDX-License-Identifier: GPL-2.0
>> > +
>> > +//! Rate limiting support.
>> > +//!
>> > +//! C header: [`include/linux/ratelimit.h`](srctree/include/linux/rat=
elimit.h)
>> > +
>> > +use crate::{
>> > +    bindings,
>> > +    prelude::*,
>> > +    types::Opaque, //
>> > +};
>> > +
>> > +/// Defines a `static` containing a [`Ratelimit`].
>> > +#[macro_export]
>> > +macro_rules! ratelimit_state_init {
>> > +    ($name:ident, $interval:expr, $burst:expr $(,)?) =3D> {
>> > +        static $name: $crate::ratelimit::Ratelimit =3D {
>> > +            let init: $crate::bindings::ratelimit_state =3D $crate::b=
indings::ratelimit_state {
>> > +                lock: $crate::sync::lock::spinlock::raw_spin_lock_unl=
ocked($crate::c_str!(
>> > +                    ::core::stringify!($name)
>> > +                )),
>> > +                interval: $interval,
>> > +                burst: $burst,
>> > +                // SAFETY: This type can be zeroed.
>> > +                ..unsafe { ::core::mem::zeroed() }
>> > +            };
>> > +            // SAFETY: This is a repr(transparent) wrapper, and the i=
nvariants are satisfied.
>> > +            unsafe { ::core::mem::transmute(init) }
>>
>> Hmm, I don't see anything that prohibit this from being a const fn? What=
 have  I
>> missed?
>>
>> It looks like this type is move-initializable.
>
> I believe that the lock class key this implicitly creates is only
> valid in static memory, and not for a Ratelimit stored anywhere else.

Perhaps create a

    /// # Safety
    ///
    /// The created `Ratelimit` must be stored in a static.
    pub const unsafe fn new_static() -> Self {
    }

?

Best,
Gary

