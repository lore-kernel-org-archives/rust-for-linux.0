Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020132.outbound.protection.outlook.com [52.101.195.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A703F9F2D;
	Mon, 27 Jul 2026 10:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785149439; cv=fail; b=MlIfCu30PxfNftVlvnL2At6TxGpYIj8UhJiF5z/08XLNtzDyGMwB9SqVfwAbEWOzveCHb/Om6fkMuFOV6VTGqVrhyjNUI1159pUh4Ypp8u23wDskhpcHoRvXkjOVlYkthWVHITs6M4LXz1B0KIn+h/Yhfa6hSHW/jcp99dxmp/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785149439; c=relaxed/simple;
	bh=m8WENOvB1iJeHCpNtVWqzruNjms3q0xDYbzGbnM0O9Y=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=tGwVOnNkAEhf36rofqh3T41dzReNS1lCqhQFvZgHt1T3EuVXJ3AoqATUIE5GJRYZTBoqgPWilRQAtW6V//CJM7hKup/cfPQMaJYmneKp0pXjpLNTWJxGhiRY40qubUZ0XDbyW2mdkEkc6RFhzbr+pENbTLBVAxzT4ZwTtDmMHGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=s38lrreu; arc=fail smtp.client-ip=52.101.195.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="s38lrreu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hqvDveNPgJ+EOilxPYzs49FueGuxfHrTwm8/YnNHLUqUjoY75dfdPTgFX364wQzmLC6AmUgcf8ygqYMjNjPQjU3xl95DH+KgUWTaMPS0L/mhenH/Y+d13+jFnno6QjndT2BicOWeIauRVgEP0i/XXeCX6VptR1qBk7fyzhGF78gDoJ5dXllJCuy/4TvlDCNXRczl84tygcuAUwjJbDC9C5nEZxUvWv9cKiVJqXyQmWO71QKjgx8s3fJCL48vAKuQBcS4wC2WM7qlAM6EfPHFiHTab5FtnWDJ09zxi3yLyVr6KtRbnQ56eUKOMHcQG+qOdFB5MDJSW/AMHK0lYeKT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0f2oAoyhdl3TRIiijzwvQpLQplsVoktXQcIO4m9DzW8=;
 b=FZWoCpWCafJsDBL1LVih2NvLrRsZoVF7fNrs6abpKqRHFg94uG1LAcbYRUJLTfeZByqtgBeGA8MLKXkYyUk+1Wi4SGD9x4wfQpTdAhURap8Fv4ZRFiOfpcLeUtlCIspAejTVr7bC/TfuwJUjk9JqZ3CuhO7vw6zo9emvT7JV+nLU5wCc/Scam6hcpB64N4HeiJm36BmTgZTF6FQSPpOmojJKhTjPyC1AQVPangYIDI6D9tGLMrcbErdHWkHvcfTDeTGjoeCtRsCkHXyzucuFvCEhcDuJhxUq/2tFfkZuyP7BiY+v9qnYvJROhPyStR97WhJVVeLvaZJxvWpc6i2+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0f2oAoyhdl3TRIiijzwvQpLQplsVoktXQcIO4m9DzW8=;
 b=s38lrreuDkXvEQVi3HpWoDE+uXvqfWJh9IxEz4HWEP2CVts2DZOY6dkJdpJ05ZmOoVhwkknIP54V56BXjTangL5BeiLxJnCyCHCvGMC2PdMR0llGWS8exEPTES+MSfRHqzvM75/nJcg9OzcynHb76PkmYj+UliDmFAxqAZzWPvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2998.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:c4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 10:50:33 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%2]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 10:50:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 11:50:33 +0100
Message-Id: <DK9ANS6VVCNW.891MU75QMQ05@garyguo.net>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Alice
 Ryhl" <aliceryhl@google.com>, "Lyude Paul" <lyude@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] rust: print: document safety of _printk FFI
 calls
From: "Gary Guo" <gary@garyguo.net>
To: "Cian McGuire" <cianmcguire167@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260726115929.82150-1-cianmcguire167@gmail.com>
In-Reply-To: <20260726115929.82150-1-cianmcguire167@gmail.com>
X-ClientProxiedBy: LO2P265CA0484.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2998:EE_
X-MS-Office365-Filtering-Correlation-Id: e09cde0d-7863-4fae-d734-08deebcce260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|10070799003|1800799024|6133799003|18002099003|22082099003|56012099006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info:
	XGxtir0Pa2uBF/040y7fmx+YKf+aUCdCKELKsDHQe6BuN700J1mGF0BvxhxCpnyiUB9rrtbQ+629GDStOCHikdvAvHLraFJKSRLNrl3cGf984+Zaun8p1nyIe6EDRYfGkwPaD/RHBY1rPpm+xN2Nd5wqmZ3COMV3XRNzOmlInxx0yfv10aLwiEIwVQe8UOqheUyGEct6yIbMG9jAJrUFZ8QXBCh7/kxpMpWj5lJvu9nZdRyUzsNNKMhT/gXRqD2SVE8dNVKOBcVwRH0TR+j8LhZH04yIxpZqf7iNfH2cu7DsMx6uv5HNmblHCAzLcm7aOmWh+xds2xlII+aTDp5m85+Fnl2S3NcPRxYDEj2zGHf3wbsR0bbZGLkS80y3Ae1wPwrV9i36+bc8SURil6d0weipS4gE6qTZ9ObfeTKXtakFRHHIqpoe+PVBYx1+vLWc9eYzQaga65m1QCOclIJpfTzFuuA5EXN89Bq/RsVNUdlYfRg3f/XGNghE0+H3LQ8u366Vz9CXBRnf3mO7b1lh2YCkTTah14POUT1pXu30IIh5IyqZKFqjf82wjm6Z8L/T6DLupaMt/l9o/+ihLeJXE8mxag0//OuWbyTgDfvpwEk1TOV9bQd+JaGSxwgCCDrLHkP5c4lO5s4J4bVCQOAX5mJJZ30mtfNYNZLuy4e4o10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(10070799003)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(5023799004)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3hXUVR3ejRDYjlHUFMvd0g0aDVkSW9FeG01YVpNTitFS1kzV2F0Qm5DNnZV?=
 =?utf-8?B?bldQUnRpR3NTbmcwSlZ1SWY4UlBvRGRDZ0t4ajhvZjllMXBHaCtXM3psWk0y?=
 =?utf-8?B?YWFiUW95dGFHWEd4SFdWbXIvbG00U0dGdGRrRmFla3lHTDcyR2VGWktqS25B?=
 =?utf-8?B?Z3RnbytUZk9yWWFsNVk5MUlyM0dBQytzSzdzQTRNQ2tKQmUxSmQxa1Y5RXRQ?=
 =?utf-8?B?eklJd0RMa2VXa2dXTXR1d2tMVm1GbG5SMk1tTW5jVklEK013MTBnOWlMdXMr?=
 =?utf-8?B?MGdEMTV4VTB2aGxqdHl5bzF1NXM1b2IwQnhnU1Yva1B5VlVpelFMNW1vT3VK?=
 =?utf-8?B?OU1rSTh0S0JpZHVmSm9XUkhHMUpEMjlBc2lUaEU5b2JTV0xJTnJVMEQ4M2dV?=
 =?utf-8?B?UlR1cDZ3MmZxYTdnT21wQURsN2dTb2JlVVo2eXBBTFc0ZTE3MUloSFdxSndL?=
 =?utf-8?B?ZVF4SkVQc3FuTjkwNm90TFVZK1pHenkvOE01anJWb0V1OEJ5VHErb20vMmhK?=
 =?utf-8?B?bTBpeUYzR1NGR3h6dlhnOG1WRVpWdElkV3ZUYnZMNkxrd0JlVzRJL3loaDMy?=
 =?utf-8?B?aDk3VlNzbTRPcEdXbHJGRW9vOWxSVzNpcXljVzNvMFdzNko5M2kvQ3NhcjVu?=
 =?utf-8?B?b2l1R2ZIVUNoOEpZWFdpaU9ZdFlFZ2R1Q0JwRnVSekpYTDloUzlwbXRaUzk0?=
 =?utf-8?B?SzNOenhtbEhTT21BbGt5SVZTclg3NGlrcDlLUGs4bXQ0TXNKZlRna0lQOEJz?=
 =?utf-8?B?ZTVRbm1JcVhsU21heWZxeDhQdStSMXZQenYrV2lOcm1xOXhmQUhRa2lPazBF?=
 =?utf-8?B?NmVDbDFkelRxcXpIdHlmWWZ3cFo0Z0NFYlpCWG04dkc0Nko0cWlnVHhDOFUr?=
 =?utf-8?B?QmFYTE1xdEgrenRHOEhOTkVYTmdCbU9qbExpWDZKRzRSc1BLOXV0S1Q3d0lu?=
 =?utf-8?B?MXJEVWF4QlFhZjVRUGpvV3d1ZnF5bmJmanJpeXRDRkt0YWY5VCsvbmZKSmdH?=
 =?utf-8?B?WTBIMUltdnJkNDFMK1Vhc1BOTFFFRVZnL1YxSStUb3I2R1pjWTMraUFjcVl3?=
 =?utf-8?B?cnlicjFnWW9aeXNTR1JFUzR5WWVPS3Vuc0lhUGhMbzI5N04vVGFTeDlQaEZO?=
 =?utf-8?B?aWU0c3d0enZJc21YK3VDMWR5L2Z4bHc2MC9ZRkt1c2k0dUNuVTNaZ2s4U2JI?=
 =?utf-8?B?aUZjS2JMZ3VUSGl6MVcrS21yOTZscU5QaUV5N3ZpT3RkSTBWRXFEMVJUclZR?=
 =?utf-8?B?SHE4SzZodG4yeEVpakE0SXNDUitHUDhxRjJsSVF3OVRIUVcvUHZ3OEF6MDJm?=
 =?utf-8?B?Si9xb2ZHQzdCdmVUVytob0xRbytudGpSaUFCTnFaM3RsanFuWFl3SVJ5RGZX?=
 =?utf-8?B?b29adzZjcHROV2JqMitSc2ZLbU9KTE05ZCtqYW9IcTJQTmEvaG1sVlU1VmdH?=
 =?utf-8?B?L1NBSEptM1l1d2pVV0FRQ0ZZaSttek1oSC9GN2xRck5uQlJvQTd6OE5iMlg3?=
 =?utf-8?B?NlplMHJlVDlJQlphSkljN3NGY2RWN3hqSVFZVXJzS010WVNBZnZLZW9Xd2pX?=
 =?utf-8?B?VEx4YmMyeHB6dU1TOThML3F5dnZDOWVsM2lyc2FUNnJxT0h3Y0xtclFWZFpP?=
 =?utf-8?B?eFJQQ2pzbUNyUzA2aXMwVCtubVBIYW9nbkQ0dG1USERKV3ZMNjY0eklYN2Zy?=
 =?utf-8?B?UmhNeEZsU0R3SVIvNVl2aVptd0p2ejhvZGoxNjcvY2tnZWk5L1g0Zkx3M0F6?=
 =?utf-8?B?RXB0YnlJTW9zaU1sRS9Id3lFUEpDbzBBbjIzUndjb1V4NGtnQkhPRkdnV2JL?=
 =?utf-8?B?VmMzQm9nYTFHKzRwRFdyc3hBbG5yYnBhTkpjejhUMGJmajgrR04xY3doM2Jo?=
 =?utf-8?B?QlMvekk0RzZyY3JIbGt6N3h1UmVlNEpQWXB2OFp0UGNzNkdEQ3hONksrVis4?=
 =?utf-8?B?blZZOUd5MVh5S21WTTQ2d1VsS0ZsNlErZ3ZwcXJrd1Rpb01kMFlJc3V4eVdk?=
 =?utf-8?B?cnhBcncyVmp6SVZBMm9kTmZCcUN6eEJKTUY2RWpjaGhDOW1CaGg2L0YzODNh?=
 =?utf-8?B?OEdpWndPdkNyNTc1eEU0Z3hRRlRoU2VoaVJVRzNlZzZTdEpvbzdrZExSTHFV?=
 =?utf-8?B?VGZENHpSUWZ2M3IvT1hRY1ZNbnBtVjJ3dWxkdmMveUIrME9rRVBxQUduQkFo?=
 =?utf-8?B?aEM3Y2RsRVVxTHk1YnQ2Wkx1L2VWSHBwYjdRVlVuNExIQmdub3pONHlHai9p?=
 =?utf-8?B?Q3JJZEZOYVVlWEFFOVFIQ0RzWUVRb254UnB3WDVVNXZCMVU5VkVqd2diTlp4?=
 =?utf-8?B?b0tjY1drQ3NPckpWNENSWlZ4VTZNUVZFbmJnR09aODg0UGlYODhIUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e09cde0d-7863-4fae-d734-08deebcce260
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 10:50:33.7774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MGaheSw+VvwXtksSNAPAQtez8FzDuJeeNpZ/I/Jchwk1lZ4HayK2Hkab543hCb2S8BuUTdUtdEPVSE17Y+fSGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2998

On Sun Jul 26, 2026 at 12:59 PM BST, Cian McGuire wrote:
> Two calls in this file had their SAFETY comments left as "TODO.": the
> cast back to `fmt::Arguments` in `rust_fmt_argument`, and the call to
> `bindings::_printk` in `call_printk`.
>
> `rust_fmt_argument` is only reachable through the `%pA` format
> specifier. Every in-tree Rust caller that uses `%pA` -- `call_printk`,
> `device::printk`, `kunit::printk`, and `seq_file::call_printf` -- invokes
> it synchronously with a pointer derived from its own live
> `fmt::Arguments`, as one call in a `switch` dispatch in
> `lib/vsprintf.c`'s pointer formatter that returns its result immediately;
> there is no deferred use or storage of the pointer on the C side. So the
> `fmt::Arguments` value stays alive on the caller's stack for the whole
> time `rust_fmt_argument` is running with `ptr` pointing at it.
>
> The `_printk` call itself is justified by this function's `# Safety`
> section, which this patch also tightens: `format_string` must be one of
> the non-continuation `format_strings` statics, not
> `format_strings::CONT`. `call_printk` always supplies two extra
> arguments -- `module_name` for `%s` and `args` for `%pA` -- which only
> matches the `"%s: %pA"` shape shared by every non-continuation string;
> `CONT`'s format string is `"%pA"` only, so passing it here would make
> `_printk` consume `module_name`'s pointer for `%pA` instead, and
> `rust_fmt_argument` would then reinterpret that `*const c_char` as a
> `*const fmt::Arguments` and dereference it. No caller does this today --
> `call_printk` is only reached from `print_macro!`'s non-continuation arm;
> the continuation arm calls the separate, safe `call_printk_cont`, which
> hardcodes `CONT` together with the single argument it expects -- but the
> previous, broader contract permitted it. With `format_string` guaranteed
> non-`CONT`, and `module_name` guaranteed null-terminated by both of its
> possible origins (`kernel::__LOG_PREFIX` and the one generated by the
> `module!` proc macro), the specifiers always match the supplied
> arguments.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/351
> Signed-off-by: Cian McGuire <cianmcguire167@gmail.com>
> ---
> v3:
> - Tightened `call_printk`'s `# Safety` contract to require a
>   non-continuation format string (i.e. not `format_strings::CONT`),
>   since the function always supplies both a `%s` and a `%pA` argument,
>   which only matches the non-continuation strings' `"%s: %pA"` shape.
>   Passing `CONT` under the old, broader contract would make `_printk`
>   consume `module_name`'s pointer for `%pA` instead of `args`, which
>   `rust_fmt_argument` would then wrongly reinterpret as a
>   `*const fmt::Arguments` and dereference. Updated the inline SAFETY
>   comment to match.
> v2:
> - Reworded the SAFETY comment on `rust_fmt_argument`'s cast to argue
>   from the property that makes every `%pA` call site safe (synchronous
>   invocation with a live `&fmt::Arguments`), instead of enumerating
>   callers by name, so it doesn't go stale if a new caller is added.
>
>  rust/kernel/print.rs | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index 6fd84389a858..5a0ee103b54e 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -29,7 +29,10 @@
>      use fmt::Write;
>      // SAFETY: The C contract guarantees that `buf` is valid if it's les=
s than `end`.
>      let mut w =3D unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast(=
)) };
> -    // SAFETY: TODO.
> +    // SAFETY: This function is only reachable via the `%pA` format spec=
ifier; using `%pA` from
> +    // Rust requires the caller to invoke it synchronously with a `ptr` =
derived from a live
> +    // `&fmt::Arguments`, before that reference's scope can end. `ptr` i=
s therefore valid and
> +    // properly aligned for a `fmt::Arguments<'_>` for the duration of t=
his call.

Bulk of this should be safety precondition of the function, not safety comm=
ent.

Best,
Gary

>      let _ =3D w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });
>      w.pos().cast()
>  }
> @@ -96,8 +99,11 @@ pub mod format_strings {
>  ///
>  /// # Safety
>  ///
> -/// The format string must be one of the ones in [`format_strings`], and
> -/// the module name must be null-terminated.
> +/// The format string must be one of the non-continuation strings in
> +/// [`format_strings`] (i.e. not [`format_strings::CONT`]): this functio=
n
> +/// always supplies both `module_name` and `args` as arguments, which on=
ly
> +/// matches the `"%s: %pA"` shape used by the non-continuation strings, =
not
> +/// `CONT`'s `"%pA"`-only shape. The module name must be null-terminated=
.
>  ///
>  /// [`_printk`]: srctree/include/linux/_printk.h
>  #[doc(hidden)]
> @@ -109,7 +115,11 @@ pub unsafe fn call_printk(
>  ) {
>      // `_printk` does not seem to fail in any path.
>      #[cfg(CONFIG_PRINTK)]
> -    // SAFETY: TODO.
> +    // SAFETY: By this function's safety requirements, `format_string` i=
s one of the
> +    // non-continuation `format_strings` statics (never `CONT`), so its =
fixed `"%s: %pA"` shape
> +    // matches the two arguments supplied below: `module_name` is null-t=
erminated as `%s`
> +    // requires, and the third argument points at `args`, which remains =
valid for the duration
> +    // of this call and is only read back synchronously, through `%pA`, =
by `rust_fmt_argument`.
>      unsafe {
>          bindings::_printk(
>              format_string.as_ptr(),


