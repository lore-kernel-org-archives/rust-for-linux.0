Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE4F2FD69F;
	Wed, 25 Feb 2026 11:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772020766; cv=fail; b=ocDtAi/I3LWKfZumKFgEF6AWFpX/P8sJL9OlvUIreLvRhlLLM/YOuq07FRNWF8qJtGV+ciCFpO0dcLd4ncosr73CIuAj5U5ScLjaFaky48v0c+PZFpp8lVFv2fKSyi8TLyhnUgsETfN0o1hEFAZzVTnrZZRl/Kz9WqAGJCsPwu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772020766; c=relaxed/simple;
	bh=HaKrMQtx6Her7PpfMdZBvk0DLknrYSvyBmskFUqGbxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g1PZmtd+U1uH3GodsD5VR4/gbpM8+t6roShWP870+TDtp4rEeXSh3UnJoUzeq28bYbQakkaUHzwOY+1aRSenKTE+Pr8NcjfFUid8KXMC3VUJ8QFmz2kBJZgpO0vFlaTffzqJdxiakt94SfIeEHsdyPLXyLNEEtc5ZH9SvZSgNXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=HL7mc8LL; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="HL7mc8LL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyre/MaOhLt47aWHWO0Z0MVmpS9dpG/umq7lIG1UO2m2Nlw5Ta47YcboLhDGsSX+j5UbKAFVHxf2QwwMl1rx3P47ryhgGB3pIqFsErr6FTpLj0X1KJanLnwHXiHN9B3YGNehdFbVULAk0hI3OtSx2dsJYXJMcB2/rvs4QcMR6Eg024bvsyL0D6Z02ufEG5wcZo859KTt9kSJleYIiWqlPm5Oy+syY/1j0rUx0yBW5AoQqHceFcIZWTzB3wLKpDjccLzHOyy77A22SwiOVhIAzxZ0r2vPVQH0bWpv5RHeC0InkCeIw+DNJyFn8hEg0+uFidA2gU+ZsocMJjXxwlfbOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74vTnunvHI60jXL89qHHUmt2kbc75O7CDQYgopg5Clg=;
 b=OykB1tpOZah4hz81ljHKOcn3w2kDnyG7+5Zcrd0fXVv0NBZr4olOUFyjsJwozXjB/ylQa6NhM3pCPC7XUhmKAa/2Qay5huxBB+IBmP/bVju4JrmrAaSG4rIgpoRSfD+IO/GYJnwThaDF1vknJfA7NFBdhYiVkGw/6k8PqMxdXl5JA7NofSoI6rwyJi/Mga5tqyWvDeSPq/1Q9mUinmoWzVXGJXBkCzFF48QkPYPy+ssRJofoyrWmHzreugyZK8ovmo9m5WIf71b1oWXOOhq9zgRJvLVbpKC1O/3h6dtrVgWTAg9dHJ+h6E8fzJzQvqQX5hS8NZwsdF7N/8Xubz13aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=nvidia.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74vTnunvHI60jXL89qHHUmt2kbc75O7CDQYgopg5Clg=;
 b=HL7mc8LL1h7Vhyh3O0HIy5ITFryiy1h2ppiCrCRPfTmg6cHKzE1K5k3Hjgxvnk3Bg69dHoWwyDqXi3ExBFlDaw12PvDmS3ZLyu27e8rIUjNUBnlOwv+T4YRwnMGzBc8tL9G4BM+smFXAuUyS3ZWDTZdq3CfkH5A2ZlOmrYKYTM0HRcKC4AArseI2zffZlgKpHcfO8hS5eJ1lTJNgqQXYo13AoouwKnL75b8E3yUzZD8L/XJT62ZQW0gtse5CeKG2DqGWjHxKeF/QDnV4ZJ5EadUwda6uapkLuU9ZkoJ8aMM8TfArSdoFnWRzyweMipYe1BFVdz7GEgSc07VIJwgtIg==
Received: from AM8P251CA0007.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::12)
 by AS8PR10MB6152.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:54a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 11:59:16 +0000
Received: from AMS0EPF0000019D.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::d1) by AM8P251CA0007.outlook.office365.com
 (2603:10a6:20b:21b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 11:58:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF0000019D.mail.protection.outlook.com (10.167.16.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 11:59:16 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 25 Feb
 2026 12:59:01 +0100
Received: from [10.34.218.123] (10.34.218.123) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 25 Feb
 2026 12:59:01 +0100
Message-ID: <a278ad60-5912-4b9e-8930-6fc9ecedbd16@de.bosch.com>
Date: Wed, 25 Feb 2026 12:58:55 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] rust: add `register!` macro
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
	<dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Daniel Almeida
	<daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo
	<gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, "Boqun
 Feng" <boqun@kernel.org>
CC: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, Steven Price <steven.price@arm.com>,
	<rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20260224-register-v7-0-aad44f760f33@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019D:EE_|AS8PR10MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8b6f7a-8cdf-406c-5781-08de74654d17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
	CpYK4w/BVrlj4UDG5i0jdioWTScn2c1zSmJqk2iH6Gh+Tvb40vo2VGY4/9DFrsrSr2gTKs3uNqgyS+0XKvi7lmrdoabnqqTq9wqAGEOsHKHZbotMmNA1q/QPw1MzVGIkyVdxFlsFd0wRNnW0UVDEDPEpgdAGWzDAPSEToumCZOpu/YgAQ+gHWlPj1R3VkKRUFvapiDu1WUYZzJRYqYXJmFsChQ5LpwBdqTO23CuFrvBRpkVfYmHgB0/0SIP/9DPKaD25TjMpymXhKdrzZ6g+g5j3u5/oisKyW+2BY5fQBHdwYIi8sDpL2FTZ2EgAumwkGHkL0gGfJzmSuKV/7UaQmCGYP932v5pwTPdJhNkxHhaKts/aGA2m3pufE1IHNBEh4j2So3ugk/Ix2xLLB2e1cMu2hCemqfGkec6rGneK0TCme2+pWKhIvmb2Ni6/nGW1fMeoI9XsQ8t93UxFdZ6zuUYqcO0YIy3zWNyFsbk8oC5Ucyl3iEsUgMhuJWP0m2E2JNPebjR8lbrOVl6ylikd3PetWXc6yKkC7OvaXVPZ4diV9x5xWZCWH7Q79lX2oN5Nt82ZwFAUmpEFOQ8MMF+oSLMyuXf/Z6vYYakFtKrfgBmHQoE254d7qzF4YfNPZBYCBXi6LVhzaMyQ4XKp2eJoIkfqEMfpndxk0mQJP00qILb4TZeYHkj7sxXfoussDN47HQvA9JDGUC7RAoa4qAxrrbgjG4ek11Us8VHEUpq3+cxtWDEHuRCW8ZXvxeXRPZUD34t2SMNThJF6vbegVeJoiwfUuSja5n3m84fR7Tx5kn4=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0ZGM+jVKSemGszS/6U9H/1b9nGnUOxJww6fVdEnkHQB3gxTaD5qsCzIoljxa7PExdG6YeXTS6bRK2kcQ6ffau4NvviIYXQyL61UU0+gM8DrKhkGGaQD6b1HZWrUP2qVo8Sht9ywu+xw2c2Wfm0d+OjYNMuP1ng0cVsfuHeS5/z3kZclyqvOxle34km7GzQX4d2Xe8F1pCTUCDYE1IegE+fQFkB04vguMYigObPtK/JWgQv74SAWilNFXO5/8NAA35d+uNniahIsvz4k1eT+LD/kpC3IYp5YxISMfvNw9uF3mMjnFZQZSUxTClVMVzNkaF04MNI4sliySbJgEThDWcJaXdTRw3gtAiFs8zgTVQf29JYRC6sTuOcIkpQtPwU0tTtobfbLdBomxvlJVHzKjNAE0L+rGcze6E+I7CcIltiLibBVsvvhhYIm/G0IaiQ8g
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 11:59:16.6314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8b6f7a-8cdf-406c-5781-08de74654d17
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6152

On 24.02.2026 15:21, Alexandre Courbot wrote:
> New revision addressing the v6 feedback - the use of "location" instead
> of "reference" in particular reads well both in the code and the
> comments.
> 
> As a reminder, since the previous revision we use the I/O type to
> perform the actual I/O instead of the register type, which moves us from
> this access pattern:
> 
>      let boot0 = regs::NV_PMC_BOOT_0::read(bar);
> 
> to this arguably more natural one:
> 
>      let boot0 = bar.read(regs::NV_PMC_BOOT_0);
> 
> This revision is based on `driver-core-testing` as of 2026-02-24 with
> [1] applied. A tree with this series and its dependencies is available
> at [2].
> 
> [1] https://lore.kernel.org/all/20260206-io-v2-0-71dea20a06e6@nvidia.com/
> [2] https://github.com/Gnurou/linux/tree/b4/register
> 
> The first patch enables the `generic_arg_infer` feature, which is
> required for generic type inference and used in subsequent patches. This
> feature is stable since rustc 1.89.
> 
> The second patch adds `shr` and `shl` methods to `Bounded`. These were
> suggested by Alice during LPC as a way to avoid the use of the
> controversial `Bounded::from_expr` in both the bitfield macro and the
> Nova code. The third patch adds another convenience method to obtain a
> `bool` from single-bit `Bounded`s, while the fourth patch turns
> `Bounded::get` into a const method in order to make register setter
> methods const.
> 
> Patches 5 and 6 introduce the `IoLoc` and `IoWrite` types around which
> I/O accesses are centered. This allows registers to be accessed using
> the same `read` and `write` methods as primitive types.
> 
> Patch 7 adds the `register!` macro and the types it requires.
> 
> Patch 8 updates the Rust PCI sample driver to use `register!`, as per
> its TODO item.
> 
> Patch 9 illustrates more extensively how this macro is used by
> converting nova-core to use it, and removing the local implementation.
> This patch is to be merged one cycle after the other patches.
> 
> Patch 10 is an RFC allowing a shorter write syntax to be used in the
> case of fixed or relative registers. It doesn't need to be merged
> immediately, but I think it is a good time to discuss it.
> 
> I have also removed Gary's signoff on patches 5 and 7 to make sure it
> doesn't get merged before he gives it explicitly.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> ---
> Changes in v7:
> - Use `RES + SHIFT >= N` instead of `RES >= N - SHIFT` in
>    `Bounded::shr`.
> - Rename `IoRef` to `IoLoc` and all related types
>    accordingly.
> - Use `Into` trait bounds in both directions on `IoLoc`.
> - Add RFC patch allowing fixed register values to be used directly with
>    `write`.
> - Link to v6: https://patch.msgid.link/20260216-register-v6-0-eec9a4de9e9e@nvidia.com
> 
> Changes in v6:
> - Remove Tested-by tags as the code has considerably changed.
> - Make `Bounded::get` const so it can be used with registers.
> - Use the `pin_init::zeroed()` const function instead of defining our
>    own method.
> - Generalize all `Io` around the new `IoRef` and `IoWrite` types, and
>    make registers use these as well.
> - Use the more natural pattern of having the `Io` type perform the I/O
>    access instead of the register type.
> - Convert the whole PCI driver example, and not only the PCI
>    configuration space.
> - Rename `Bounded::as_bool` to `Bounded::into_bool`.
> - Drop `Bounded::into_inner` in favor of making `Bounded::get` const.
> - Link to v5: https://patch.msgid.link/20260129-register-v5-0-c4587c902514@nvidia.com
> 
> Changes in v5:
> - Rename all setters to `with_*` and `with_const_*`.
> - Use `, stride = ` to specify the stride of register arrays.
> - Remove `Deref` requirement on the `RegisterIo` trait and make it
>    `#[doc(hidden)`.
> - Simplify the top dispatch rule a bit.
> - Link to v4: https://patch.msgid.link/20260128-register-v4-0-aee3a33d9649@nvidia.com
> 
> Changes in v4:
> - Add `with_` const field setter methods (removing the need to call
>    `Bounded::new` for constant field values).
> - Add `into_inner` const method for `Bounded`.
> - Add `from_raw` and const `zeroed` method to create initial register
>    values.
> - More documentation improvements.
> - Link to v3: https://patch.msgid.link/20260126-register-v3-0-2328a59d7312@nvidia.com
> 
> Changes in v3:
> - Sort the Rust features list alphabetically.
> - Rebase on top of latest `driver-core-next` including the new Io trait.
> - Allow several registers to be defined from the same macro invocation.
> - Remove references to `bitfield!` macro.
> - Fix doccomment of `shr` and `shl`.
> - Use `+` syntax for relative register offsets.
> - Move register arrays size and stride to after the backing type declaration.
> - Use regular doccomments to document registers and fields (thanks Gary!).
> - Remove `Default` implementation and implement the more predictable
>    `Zeroable` instead.
> - Improve doccomments a bit.
> - Link to v2: https://patch.msgid.link/20260121-register-v2-0-79d9b8d5e36a@nvidia.com
> 
> Changes in v2:
> - Remove `bitfield!` and put its rules into `register!` to give it more
>    time to get reviewed.
> - Allow output type larger than strictly required for `shr` and `shl` on
>    `Bounded`.
> - Enable the `generic_arg_infer` feature, required for rustc < 1.89.
> - Link to v1: https://patch.msgid.link/20260120-register-v1-0-723a1743b557@nvidia.com
> 
> ---
> Alexandre Courbot (10):
>        rust: enable the `generic_arg_infer` feature
>        rust: num: add `shr` and `shl` methods to `Bounded`
>        rust: num: add `into_bool` method to `Bounded`
>        rust: num: make Bounded::get const
>        rust: io: add IoLoc and IoWrite types
>        rust: io: use generic read/write accessors for primitive accesses
>        rust: io: add `register!` macro
>        sample: rust: pci: use `register!` macro
>        [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro
>        RFC: rust: io: allow fixed register values directly in `write`
> 
>   drivers/gpu/nova-core/falcon.rs           |  249 +++----
>   drivers/gpu/nova-core/falcon/gsp.rs       |   23 +-
>   drivers/gpu/nova-core/falcon/hal/ga102.rs |   65 +-
>   drivers/gpu/nova-core/falcon/hal/tu102.rs |   11 +-
>   drivers/gpu/nova-core/falcon/sec2.rs      |   17 +-
>   drivers/gpu/nova-core/fb.rs               |    6 +-
>   drivers/gpu/nova-core/fb/hal/ga100.rs     |   40 +-
>   drivers/gpu/nova-core/fb/hal/ga102.rs     |    7 +-
>   drivers/gpu/nova-core/fb/hal/tu102.rs     |   22 +-
>   drivers/gpu/nova-core/gfw.rs              |   11 +-
>   drivers/gpu/nova-core/gpu.rs              |   36 +-
>   drivers/gpu/nova-core/gsp/boot.rs         |   11 +-
>   drivers/gpu/nova-core/gsp/cmdq.rs         |   10 +-
>   drivers/gpu/nova-core/regs.rs             |  544 ++++++++------
>   drivers/gpu/nova-core/regs/macros.rs      |  739 -------------------
>   rust/kernel/io.rs                         |  347 +++++++--
>   rust/kernel/io/register.rs                | 1135 +++++++++++++++++++++++++++++
>   rust/kernel/lib.rs                        |    3 +
>   rust/kernel/num/bounded.rs                |   70 +-
>   samples/rust/rust_driver_pci.rs           |   84 ++-
>   scripts/Makefile.build                    |    3 +-
>   21 files changed, 2118 insertions(+), 1315 deletions(-)
> ---
> base-commit: 545225ee0b0b6998c7b6ff888f8497681b8b35c4
> change-id: 20260117-register-ccaba1d21713


I converted my simple aarch64 TMU timer example [1] over to v7 (many 
thanks helping with that!) and gave it a try: It works like with v2. 
With that:

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>

Thanks

Dirk

[1]

// SPDX-License-Identifier: GPL-2.0

//! Rust Renesas TMU driver.

use kernel::{
     c_str,
     device::{Core, Device, Bound},
     devres::Devres,
     io::{Io, IoCapable, IoKnownSize, mem::IoMem},
     irq::{self, Flags, IrqReturn, Registration},
     of, platform,
     prelude::*,
     register,
     sync::Arc,
     types::ARef,
};

use core::ops::Deref;
use core::sync::atomic::{AtomicU32, Ordering};

struct RenesasTMUDriver {
     pdev: ARef<platform::Device>,
     _registration: Arc<Registration<Data>>,
     _iomem: Arc<Devres<IoMem<TMU_MMIO_SIZE>>>,
}

struct Info;

kernel::of_device_table!(
     OF_TABLE,
     MODULE_OF_TABLE,
     <RenesasTMUDriver as platform::Driver>::IdInfo,
     [(of::DeviceId::new(c_str!("renesas,tmu")), Info)]
);

register! {

TSTR(u8) @ 0x04 {
     2:2    str2;
     1:1    str1;
     0:0    str0;
}

TSTRRAW(u8) => TSTR {
     7:0   value;
}

TCOR(u32) @ 0x08 {
     31:0    tcor;
}

TCNT(u32) @ 0x0C {
     31:0    tcnt;
}

TCR(u16) @ 0x10 {
     9:9    icpf;
     8:8    unf;
     7:6    icpe;
     5:5    unie;
     4:3    ckeg;
     2:0    tpsc;
}

TCRRAW(u16) => TCR {
	    15:0   value;
}
}

impl TCR {
     fn handle_underflow<T>(io: &T)
     where
         T: Io + IoKnownSize + IoCapable<u16>,
	{
	    let tcr: TCR = io.read(TCR);
	    if tcr.unf().into_bool() {
	        io.write(tcr.with_unf(false));
	    }
	}
}

const TMU_MMIO_SIZE: usize = 0x14;

// Data shared between process and IRQ context.
#[pin_data]
struct Data {
     #[pin]
     iomem: Arc<Devres<IoMem<TMU_MMIO_SIZE>>>,
     #[pin]
     irq_count: AtomicU32,
}

impl irq::Handler for Data {
     // Executed in IRQ context.
     fn handle(&self, dev: &Device<Bound>) -> IrqReturn {
         let count = self.irq_count.fetch_add(1, Ordering::Relaxed);
         dev_info!(dev, "Renesas TMU IRQ handler called {} time(s).\n", 
count);

         // Reset the underflow flag
         let io = self.iomem.access(dev).unwrap();
         TCR::handle_underflow(io.deref());

         IrqReturn::Handled
     }
}

impl platform::Driver for RenesasTMUDriver {
     type IdInfo = Info;
     const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);

     fn probe(
         pdev: &platform::Device<Core>,
         _info: Option<&Self::IdInfo>,
     ) -> impl PinInit<Self, Error> {
         let dev = pdev.as_ref();

         dev_dbg!(dev, "Probe Rust Renesas TMU driver.\n");

         let request = pdev.io_request_by_index(0).ok_or(EINVAL)?;
         let iomem = 
Arc::pin_init(request.iomap_sized::<TMU_MMIO_SIZE>(), GFP_KERNEL)?;
         let io = iomem.access(dev)?;

         // Set count to 1 minute. Clock is 16.66MHz / 4 = 4.165MHz
         let timeout: u32 = 4165000 * 60; // 1 minute in clock ticks
         io.update(TCOR, |r| r.with_tcor(timeout));
         io.update(TCNT, |r| r.with_tcnt(timeout));

         // Enable underflow interrupt (UNIE, Underflow Interrupt Control)
         io.update(TCR, |r| r.with_unie(true));

         let request = pdev.irq_by_index(0)?;
         dev_info!(dev, "IRQ:  {}\n", request.irq());
         let clone = iomem.clone();
         let handler = try_pin_init!(Data{iomem: clone, irq_count: 
AtomicU32::new(1)});
         let registration = irq::Registration::new(request, 
Flags::SHARED, c_str!("tmu"), handler);
         let registration = Arc::pin_init(registration, GFP_KERNEL)?;

         // Enable TMU
         io.update(TSTR, |r| r.with_str0(true));
         // Read back registers to verify
         dev_info!(dev, "TSTR: 0x{:x}\n", io.read(TSTRRAW).value());
         dev_info!(dev, "TCOR: 0x{:x}\n", io.read(TCOR).tcor());
         dev_info!(dev, "TCNT: 0x{:x}\n", io.read(TCNT).tcnt());
         dev_info!(dev, "TCR:  0x{:x}\n", io.read(TCRRAW).value());

         dev_info!(dev, "probe done\n");

         Ok(Self {
             pdev: pdev.into(),
             _registration: registration,
             _iomem: iomem.clone(),
         })
     }
}

impl Drop for RenesasTMUDriver {
     fn drop(&mut self) {
         dev_dbg!(self.pdev.as_ref(), "Remove Rust Renesas TMU driver.\n");
     }
}

kernel::module_platform_driver! {
     type: RenesasTMUDriver,
     name: "rust_tmu",
     authors: ["Dirk Behme"],
     description: "Rust Renesas TMU driver",
     license: "GPL v2",
}




