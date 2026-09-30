Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021099.outbound.protection.outlook.com [52.101.100.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE014FD26A;
	Wed, 30 Sep 2026 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780079; cv=fail; b=rKJoNAmqFiFluk/SltrUAQ4in/VSexCNCV26rfllEer36Jlox5i+JtBna9ZodNR51MzUe15CfxLN3uKR/JPAPJCcUCq1CAnb976+VHlt9/UenVDqiEjxJbMmeORcVAFciUvMcJMo110UmbA6D0XdTnZ7obH+QDW7EBWQVmAqIlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780079; c=relaxed/simple;
	bh=KvOKL/8u6QqDNb1og7KZKKrGnqCLWe8XahGHADM7KrY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GQNHv7DiobRzBUzwlZe2VbBQEmKgFXr4FkCB7ZK03UMVyFPb7BvtAVpI81Ef0DiIE4QhzourXPUeJyJPjJPppwThMmUlyUp2DPGVMZrpICfdhQBS8WM6hPSOdsCKNKvJWSoGffD9ewsZ1f9+SZJR5+7gFybET7LM7/0nE9kMy8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=XznR6Bta; arc=fail smtp.client-ip=52.101.100.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XznR6Bta"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KY1A/ZE17YjSanjqVATDQRB2akYvT/rMsOFfzLrZZU2CaYiK4FUZuZpmWjota7XLcrrm7chI3lCvgzGT20yccPsV/EcA6E4G5djzsdHfB5JVI5f4m9TffwF2ZF8Ai7vRSIHFf4fWastMcVGZfuplS9N2hcl3F3ORWtsHFkHbaf8ufTmIRzEdKry67PoVEiz+B4sFuCDPrxtW3LCbFCPnQz97x1k6dxZEOIcHDdDSzszOCI1oTxGTHvsMRLEuSH3qdsvn6S929rPmbNPIlGSy6a6RArZXmtnkJwjtaG12Ophj+q3qT/ZaDh3ThuOpTh8PcMmjf/KJgtXNN9LmDc/mEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sD9zeRtV+24A6cDNSFRzwmxg+d+mx+tcHrulyVZyF/w=;
 b=p4lwHhaaR4hUmxOzec/cwXw0Uaou3bs1eDzYb2GaB0N+WUaHdJM5CaOcqQjSclKycjmkEIe4Sty+H8+gC58TDFBySc4xpNwFa0lPSwsgTNSq3GB11mQHSfcvInulDH5zYNGQeuW4oLKtxlZhUo1O+zqoL7rA31daJmNwdSFJrqKoma8iWEsdyCQou3lK0ceencSX6Z5TtjbdKNRZQZSwa3ng3w+tFWoQe0gxmg6LZSmwE4638ZSebqcbIW0xpqeRnMpelpNo3aGBNxixScT4sVeFwSNcTqSh+rlBhiLkWCVSfwtkcUV6Z/8B1hWHbVOpsRjBNjRlTvEXkA8TanYi2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sD9zeRtV+24A6cDNSFRzwmxg+d+mx+tcHrulyVZyF/w=;
 b=XznR6BtaR+QYqPnkLwTvcswi0J72ljh3D4VXmZIN3qRIGNmEpSgIvPO5huN32OmdlhsMuL2z6mRyHf4IidBGasBIAWJ+fKpaCtjO8+1LFIE3kiSPdFZ5iD3RkJjJZiEe7tUWN3a8d+L7qDiyFK+tPOP0wyT4yXh3yWAVTS6NrUA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO7P265MB7764.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:40e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 14:54:16 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.024; Wed, 30 Sep 2026
 14:54:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 15:54:14 +0100
Message-Id: <DLSQJS2QT4JW.3BPUMU5M6N171@garyguo.net>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn1_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Rae Moar" <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Yury Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
From: "Gary Guo" <gary@garyguo.net>
To: <nico.antinori.7@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Burak
 Emir" <burak.emir@gmail.com>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>, "Miguel
 Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.22.0
References: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
In-Reply-To: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
X-ClientProxiedBy: LO6P123CA0046.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::8) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO7P265MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 32faf5a3-99d6-4a13-f802-08df1f02b28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|23010399003|10067099003|260925022911599003|260925021311599003|260925021911599003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	os5hX5cF7t1SvlMT9ZdxNmR76wUo4MqvrPkDLbUFWH9Cz49HVOApQOntVPZjZBbw3T9RQLUmM4kFPbvyjfxaekr5p98ugrBwgPxIgHeGxtq8uEZDDMn9rMpix62OBQQavLMKfPbOpXrpcd6vw+M8EJB2afIVTx/epmH8tXng48OQWPc+65FYEvSSBzCRTaO/te+gzttr+cBEt0s847gW1Zrk0w7FgZGh3Bfuq7ORJ10AX9l0qkkU7B87ECmt45sJUWs1QCE+KpIasCKzvDu+0kqHCHyorB9rPDF+8qQ2NFjhhOU2m5s25Gu5/Zyes7Ju2ugzYwbazf9odY/IKcP11L32mdQY3D52GSieZzLO9KPGT7i1oIjQvxcoAuIF0a+45avoTQpopq0IvYoY5L/wY1CgshZFQ+PVPXK/h6cqceRIJ+kUpLe7+4qShOW+vAK7El0f5tOi0FJke1vmrxgOQ7odSSZ0RHScueKj5ZxdHSXY3/iIm0H0+0cz3I1sTE1t7ioDK0LIOmdug0OISNGYONbNsCYcgU48fdaV7NWjPoLX97P4701CTLOrvMYV+UtK9QPchGeIj4FKnHBRwbBZCNDKNgEL1LaYggd0veorXGk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(23010399003)(10067099003)(260925022911599003)(260925021311599003)(260925021911599003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXdLdGhsVVRQQWwxamhKV1B5RWkrOE5ObkVwTHBjbTkzNmI1bHF1VW0rOWJy?=
 =?utf-8?B?SGpwL28vUmNWdittcFlHNkNDRzZNRzBONWxwcUJQSy9mM2E1MWg0T0J0RGh4?=
 =?utf-8?B?dWY3UkNkZmt1eWNrV1BXeHp3a0NjNnVtZU9JUkpmMVkwWDVESDlaQkxIcGRa?=
 =?utf-8?B?MXB0MEhRd1Y5QUlFZ20zdDJ5Y3l3Y2Vsc3V1N2xpZlAvK2NmRkVXelV0ZVdj?=
 =?utf-8?B?S3ZwM2FaekRoRmc5YkJHYnRRQUt0bjdkMWc0NGVGb0ZQVVk5di9wdFp2SHJ6?=
 =?utf-8?B?TVp1ZFRlREc5cCsyUXJMV2thV2hzRjB0amMrQXNVN1ZlN3RxbW16MjFRa1B5?=
 =?utf-8?B?S2Q3TWJya0k0K1FHRnJZT21PdWg5ZTNtYzFoYkZzWlpuVVVwR0pRMENtTVRJ?=
 =?utf-8?B?TU5ObEFUSDg1bnJaWGNDQzdYbDdJUlNPS3hHNkNHa2syZVBYYTRjZGtnUDAr?=
 =?utf-8?B?MzVCdUJFZUZqQWpMQklPd29tZE1tbjVvOG9PYVhCNERBTnc3Tk1QcVhHVkVq?=
 =?utf-8?B?WkIvVWpxVi9iWGdmMjdzQUJRU1h0Q1ZMTGl1bGY0ZWh1TkNYc3ErR2VGWk5z?=
 =?utf-8?B?TWNQR1R0dHA5d2ZTcHRSWkc3YkpKRWZHaXJsbEdEUkZ0QmxFZU9WamU2bjRT?=
 =?utf-8?B?aDBYZEt1em45YjFRTDJkNkNyK3VrbHVLcTBMNk9QNDA2QU1XQU5JamNFYS96?=
 =?utf-8?B?V2pHaDdNVndIN09wN1JOaWdpbWZvNnJobHR5bE9kUHQ1ZCtwUWM5VFlSelJB?=
 =?utf-8?B?WDJUay9QbmlOL3JBSEd0TmdYc1Yvd3JXeE0wZDVnYjJKVEE1cFg1Z2ZnaU9C?=
 =?utf-8?B?aUN6c2ZSbGN6TXFSTkZEK2J6SVprQ21mZzhkTjYyRUVPL0ZjaXVMaHZRUnZn?=
 =?utf-8?B?eGR5R1FHYU85b3BqcStBUng4Z3lIL0tSY0hkbzJUSGloTHpremZmVWFZbjNR?=
 =?utf-8?B?a1BPSU54NjdqZTRTR1hPQWhIYXpJTVJVRi9JMC81aE16a3dBV3A2Z0lZYm1I?=
 =?utf-8?B?SkF1clNPaitPbXEwS09TbkZ3N2c1TEZMNjhpYytaNkNwUkQ3RXlRU3RXRWtz?=
 =?utf-8?B?UW14dVV0c1ZtS2ZYOXgrdXZIdUs4YzFyMmdxTWRWejNoVUx3SVRSYjBvQjB5?=
 =?utf-8?B?REwxMnJXY2pWUzFxYnNML29jMXUxTFNZVW1qa2c2T1E1b3J5VzhjTktoY1ZG?=
 =?utf-8?B?dk1yNHNqMWdyR0lpZ0laTGdtMzdBMnFKeDVwQklmdy9SZXR6ekIwdGFkYWFR?=
 =?utf-8?B?bVo1dVozaEpFUy9rcnhQVUR6UXJZdXBhZTBMVzdMdC9lZnZnMXdEcUM3dk1n?=
 =?utf-8?B?TWExaFcvaDNtRFB3VWpzaEpjNXZhZVpJdGFjKzhxZGRURUFYSmdFU3gvdElE?=
 =?utf-8?B?bE5yWkZIWmNpeURQQkVZZlkwZDZ0NEE2NVd6UUJ3QU5oZS9tSXpLdlBoazND?=
 =?utf-8?B?dkRMMGg1Q1BieU1adHRWRklkcjB2emh5ZXVqOEExVklqaUNUdEZRVGZuQURO?=
 =?utf-8?B?ODFENE12MXlubU9HTUFuQlhZMlo4NGVoTUwvTSsxYmdwU3o4ZlRsUlpNcnND?=
 =?utf-8?B?d2ZMV0pEekF1TE1QUTIvS2xYZnM5eTE0ZTNZOFVSUzRLZnZ0cVdlQ2UwczF0?=
 =?utf-8?B?R1BnSjc1WU9RU0Z5cWNldWxaS09SdnlYWnVNaW1YZGpCNXVVQ0djazdscE9q?=
 =?utf-8?B?VEVDWHkwTXhLNHVkUmRuK0J0d1dKZmNoU2xiV241SzZyNE8yV0N4MjNleWFz?=
 =?utf-8?B?RnozelVSbGQyVHlZVFJrVm96L3RyK2RYODBYeDh2OW9aR3dLVFNtaWJMNFVB?=
 =?utf-8?B?V0FRNFlxZjJYVHJUelV2MWtEdlhIU3VSYU5vUFJwcXg1WGZkcHFYRG0yRlVa?=
 =?utf-8?B?L0gyN09xYjFZV2ppQU05L2NlcjFoUHFWT3lsMXJmQTg1VUxFZFVMdG9jS0Ju?=
 =?utf-8?B?SGhSYldQYzEvTjQxZmxrbE1oZ0NUK1lEME44bmRpN3k1SlpHY3ZWT0R3d3dZ?=
 =?utf-8?B?a2ZWaGdyL091dlQxSXZEKzZmaXdMMHdOenV2YmxmWGE5dUs0Z3Q2bnZTQ0xa?=
 =?utf-8?B?dzFxdGNGVHVDQ3owVmwrcFFTS3ovUE9MZ2pSSUMrenJpMEVDZTNHN1FpZGFG?=
 =?utf-8?B?MjdtemRCT05ZdWlKb2xoNU91c1Z1MWdwODB6MFo5K1I0M2o2SXpQNnRvT2pw?=
 =?utf-8?B?RmJGUjl4U0VOUURyTThlQ0lVL2pCSHl6Z3pVVTV5RCthaWdpZCtQZjhvY25M?=
 =?utf-8?B?bk1PanpkTERlVkdiTEh0T1VZeWpqYktNWjFpUmwvZG9LL0JRMGFiaFZYZndD?=
 =?utf-8?B?VWJhTFZvSmEzMnFZYytJdDN6RzdFMW15ZzVKb3cxd2VySVJodS9QQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 32faf5a3-99d6-4a13-f802-08df1f02b28c
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:54:15.7630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMHy77Jz2d/3ZQyaMWvV4W3Ye4edQVqllxFEXiDOeneJfAAh309baZt6vkqgPaG1TugAvnogKrYLwck4Gzkgdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7764

On Wed Sep 30, 2026 at 2:23 PM BST, Nicol=C3=A1s Antinori via B4 Relay wrot=
e:
> This patch series intends to implement two features for KUnit tests
> written in Rust. The work is based on a TODO comment made in the
> `bitmap.rs` module [1].
>
> Changelog:
> - RFC patch: [3]
>
> 1. Supporting `#[should_panic]` [2]:
>
> KUnit tests in Rust follow the user-space syntax, but at the moment
> `#[should_panic]` is not supported. The first patch of this series adds
> support for the attribute (only in its basic form, `#[should_panic =3D
> "message"]` is not supported yet).
>
> The way it is supported is by adding a new boolean property called
> `rust_should_panic` to `kunit_attributes` struct in kunit/test.h and

This is now more general than Rust panics? Perhaps this should just be
"should_bug"?

Best,
Gary


> check for the `try_catch->try_result` code and the named flag to detect
> if there was a panic in `lib/kunit/test.c::kunit_run_case_catch_errors`
> function.
>
> The difference with the previous version [3] is that now, almost
> everything is handled in the C side, meaning that we don't have a
> separate `#[panic_handler]` when KUnit tests are active. In other words
> there's no need of a Rust side panic handler because the C side catches
> Rust's panics too, since the `#[panic_hanlder]` executes a
> bindings::BUG().
>
> 2. Allow same test name with different #[cfg(...)]:
>
> When testing `#[should_panic]` in `bitmap.rs` (check the last patch of
> the series) I found that the test that was supposed to panic had the
> same name as another one, but they were run on different configurations.
> This caused the following compilation error:
>
> ERROR:root:error[E0428]: the name `kunit_rust_wrapper_owned_bitmap_out_of=
_bounds` is defined multiple times
>    --> ../rust/kernel/bitmap.rs:503:1
>     |
> 503 | #[macros::kunit_tests(rust_kernel_bitmap)]
>     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `kunit_rust_wrapper_owne=
d_bitmap_out_of_bounds` redefined here
>     |
>     =3D note: `kunit_rust_wrapper_owned_bitmap_out_of_bounds` must be def=
ined only once in the value namespace of this module
>     =3D note: this error originates in the attribute macro `macros::kunit=
_tests` (in Nightly builds, run with -Z macro-backtrace for more info)
>
> Now, only the tests with an active `#[cfg(...)]` will be executed by the
> runner. Tests with an inactive `#[cfg(...)]` will not appear in the
> report since they are not added to the TEST_CASES array.
>
> [1] https://github.com/Rust-for-Linux/linux/blob/fd73f4a6659897191fa0d406=
95fe370925dd3780/rust/kernel/bitmap.rs#L592-L600
> [2] https://doc.rust-lang.org/rust-by-example/testing/unit_testing.html#t=
esting-panics
> [3] https://lore.kernel.org/rust-for-linux/cover.1789500084.git.nico.anti=
nori.7@gmail.com/
>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
> ---
> Nicol=C3=A1s Antinori (3):
>       rust: kunit: add #[should_panic] support
>       rust: kunit: allow same test name with different #[cfg(...)]
>       rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds panic cas=
e
>
>  include/kunit/test.h   |  1 +
>  lib/kunit/attributes.c | 18 ++++++++++++++++++
>  lib/kunit/test.c       |  5 +++++
>  rust/kernel/bitmap.rs  | 40 ++++++++++++++++++----------------------
>  rust/kernel/kunit.rs   | 37 +++++++++++++++++++++++++++++++++++++
>  rust/macros/kunit.rs   | 48 ++++++++++++++++++++++++++++++++++++++------=
----
>  6 files changed, 117 insertions(+), 32 deletions(-)
> ---
> base-commit: d266640c6c760c9bc215bf5a3ece122ca488b6f5
> change-id: 20260930-rust_kunit_v4-7abaee11e6ac
>
> Best regards,


