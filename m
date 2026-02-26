Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB4337AA90;
	Thu, 26 Feb 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107349; cv=fail; b=TG6UkoXAcNlDQL48S9F7/TGGjRoxSrL1U1TqgPmK4NeZDub8q41LILDhj88OJn2zn14XLpELaJtYo/YQGMyIvx8J1hVOvjpmRb6FBcYMFZ63ntX88tZ3y7snbDlpRK0FUb51bqKagE/YszaLjWxckOvwSQl0scGfPEmlmfCQTYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107349; c=relaxed/simple;
	bh=UNQia223hMJrpT9cgxNCBcGHlrF3nFQKJzTEglQwr5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hwGmCJml4LzZPgA99v+mHfttMBldSips0X/Op0o260X1tbQMZHWGgezRKTk5V4MLMaojZxVt4ju6nLJnY60KzWbi7RQxS/Ft9jrUdqzd7BwN7JgiTKyimNXfZsF3DqXhpd6HN2UOt8KrNBulzF+ktshBrNtFHj258EsvUS2GJhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=eWIvPscu; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="eWIvPscu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCzW2jdc5I4dLaipIRuiufe6e9U/TNzFssaV21TGpiM9pURd3Ocs5fmfGuVuYMJDQf0pTH5PGi15vZMwhsHtYKi8HccPO7srC0d533s70bVSeNu2cAgPid2Y2ZGhKnyHMVMQdNl8qzjeUn0DywfgnRvs5gdvdwW0Gw1bS7YPa+grGqMIbwsVrDgRc/9O6TGcgZMbaZeLlxwVeFbnZQkKetJYuqrZp2pv/vSCRJ2VnKOmcWyacr7Uc6mciPRqkBYIKI6XLLRKLvZZ5CMnvUJSskPMsFHXWeHIxyc2Z0vDctD4ECGX4XBJpXOzGXCjcKnYOWrRbXRY1ei30KYJx0/shA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kt+2wSyd1JyPybJ0S2nJrwzRkqElHttI7RkE2PxfDzU=;
 b=Gcz4j++EuFIZYBlyMmMahVNheHF7eEN0f64fZERmEK8Q4bowC/wFfcitjdjqOf1yeo/pJEhBJI4T+rxTvXYqR5vV2liclfPG1HCs0dBCXd1ioFMVYYy5zmXI6k7Lzj4elGxxzVfBFRApWtQQ/tHRgKeP3zBJeQQ0iU5gdFrkL6Ftqp9kwIKSwde7KXb3QJb+HiLBSoBDXyWPMYYWRUy+u4cYGupuFdXLPE6XpCEJ40sXcHkB/Slsw3Y55o0FEhDjJ4swyc8qO8c7Nw3C9MBv2EFK2991b9Z4C9s61z/QZlqmheT/g6aiDB62DUvE35+bipVbO7HxdRI+wbJGVwxctg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=nvidia.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kt+2wSyd1JyPybJ0S2nJrwzRkqElHttI7RkE2PxfDzU=;
 b=eWIvPscuT5JBrSD7w3bdkbdxu2g59dtycNIYx50Rs4GoXSJWuaYlxHOerQjoM7WgL0YN7zWKLMvmN2/K81SqRuwIJHwr9t8YSRY9YKfV5pt2CJEVLmdcVGn+A0Q6sV6zMCBdcDi0DeyD1rKalhlPr33YMYbK/1r0JJyVcUSV5RfDij4xACdNvCVLPdCzBfboXL9wRo+TUyV63JFQNfzp1AyK37DYDPKY9WPD0fD4Ir5VLnzRV7PEndrMefV7jH/EnzUzMmIoAWSm0nysQMDcTVBOBcULqna0TrZVliJIZ3qQZL/dETDyRtZt3KJZbV8d00XjRYogC9Khc8vH+udlvQ==
Received: from AS4PR10CA0026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::20)
 by DB8PR10MB3721.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 12:02:19 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::b8) by AS4PR10CA0026.outlook.office365.com
 (2603:10a6:20b:5d8::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 12:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 12:02:19 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 26 Feb
 2026 13:02:03 +0100
Received: from [10.34.218.123] (10.34.218.123) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 26 Feb
 2026 13:02:02 +0100
Message-ID: <749a803e-4167-4eb0-bf8b-da6c27dff5c2@de.bosch.com>
Date: Thu, 26 Feb 2026 13:01:56 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] rust: add `register!` macro
To: Alexandre Courbot <acourbot@nvidia.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda
	<ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
	<lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
	<tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, Yury Norov
	<yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple
	<apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi
	<ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, Steven Price <steven.price@arm.com>,
	<rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <a278ad60-5912-4b9e-8930-6fc9ecedbd16@de.bosch.com>
 <DGO3AXDQKCKO.19VWO463SM0WP@nvidia.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <DGO3AXDQKCKO.19VWO463SM0WP@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019B:EE_|DB8PR10MB3721:EE_
X-MS-Office365-Filtering-Correlation-Id: d25d5215-2a21-45ce-df47-08de752ee498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	qBLbd12hP5i2h6dLhxBkv6X5ipGwD4geQeFhUH8oGnWLjS3U8HYrC/nQ5+RW2kgOi2jA6AlRL0do4bDIq9AFFQGNXkTH7NuMylEQ9eXXvrwaMO++pNthRhO54mQX0Jv++0YeJe+KFAtHgAxUP1O+alyG9HjAOp11el7CEqGnpH9CIWskvG6/V/XI+d8X89MnEJoNjZylOesTv0uosY+wYOCs5dKdm9KR8cCB+3wot0ENHdnj3/9nwHmJBsepkJIwx1AMONYXzdc6zgq+L9Ul1r4dzdzwDCuO10XdNybPf/J/f69u1EbM8ySP9eLo3Rl58RRn694y99VFIud+5FUfB8gc/NR0AqP9XCk0jx2X83JoPisfgO0tEmDp6O4Pb9kONoVR/vXgyr+F3kfGEKJhy971nG6aLA+rZ8zpqsXUKY8iQdJ+EJenD8KVlouVCLcU+iKBRZoRG7xPEw0ukkkpCCrb+fUxtCeLeb0TCUP3VBGdIetH9RJHxWMeyNzY+BiLq2ReelNvSGDe+fv0HJZHP6wSV6ZdgyeGR2tt7BigoGKib4HEJryYvWKafApyJxdhywdsoEwwuamiOKC0e163Qqr0fyBIVbdfZzq0GKGZ0sfcb1coHjbfJjzUThfaJRTi4jk9zfWoRWUJFlq3deWg98xdcsleBkjHb9jv9s6qUqgRiMioeArjC//gASo4VFooR1NUp3eS1YzXTdyz0U2/RQi3kzKgESXZMrDzg66OXlvsHuTUhj3BbuW+L3gf4/3hYAg31fiaFaAdGWNPjV4u0g==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I+EzrzpqnrZhKuO9YxU9Ys1PkYZavqNtjkIa8fnyX85oUcak/FPfOXG9JDsOnTE2HT4CMyA7TPZuaoW9Qi2x+rjIS9PDwQKVeteIBeNEXBmHNNtICHDQSDZlJjvJnloqaOyY7hZwuZ/Nw2qU2BPNtEpLSYjkEfsEF/GUXynAQwtb1rFxHWyDWkFP3AfVWnMQ1awPeN5KNM+uCW2LNdZUpFA/CPgYWrxuu1Q5IIKi3+UsTe2dp1Bnc20I/EZeaNzAh8NqTIZnGhF042hIO4/7JuPbAKtVOTBwsSIDB9hogi+YbF2aKUQaMITH2V3+ltEhUj+kAhg5GHmZt/mVXGSCxHDofipgOScKt1p8qiDWUPPROOxFf05R/1M7Aov3kFNokO54l02oseZ3mIFSing1WHexhTvuBH1WcfmwszXMTHIkBuavQHRmmf0KVMt9tQES
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 12:02:19.6613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d25d5215-2a21-45ce-df47-08de752ee498
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3721

On 25.02.2026 14:50, Alexandre Courbot wrote:
> On Wed Feb 25, 2026 at 8:58 PM JST, Dirk Behme wrote:
>> On 24.02.2026 15:21, Alexandre Courbot wrote:
>>> New revision addressing the v6 feedback - the use of "location" instead
>>> of "reference" in particular reads well both in the code and the
>>> comments.
>>>
>>> As a reminder, since the previous revision we use the I/O type to
>>> perform the actual I/O instead of the register type, which moves us from
>>> this access pattern:
>>>
>>>       let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>>>
>>> to this arguably more natural one:
>>>
>>>       let boot0 = bar.read(regs::NV_PMC_BOOT_0);
>>>
>>> This revision is based on `driver-core-testing` as of 2026-02-24 with
>>> [1] applied. A tree with this series and its dependencies is available
>>> at [2].
>>>
>>> [1] https://lore.kernel.org/all/20260206-io-v2-0-71dea20a06e6@nvidia.com/
>>> [2] https://github.com/Gnurou/linux/tree/b4/register
>>>
>>> The first patch enables the `generic_arg_infer` feature, which is
>>> required for generic type inference and used in subsequent patches. This
>>> feature is stable since rustc 1.89.
>>>
>>> The second patch adds `shr` and `shl` methods to `Bounded`. These were
>>> suggested by Alice during LPC as a way to avoid the use of the
>>> controversial `Bounded::from_expr` in both the bitfield macro and the
>>> Nova code. The third patch adds another convenience method to obtain a
>>> `bool` from single-bit `Bounded`s, while the fourth patch turns
>>> `Bounded::get` into a const method in order to make register setter
>>> methods const.
>>>
>>> Patches 5 and 6 introduce the `IoLoc` and `IoWrite` types around which
>>> I/O accesses are centered. This allows registers to be accessed using
>>> the same `read` and `write` methods as primitive types.
>>>
>>> Patch 7 adds the `register!` macro and the types it requires.
>>>
>>> Patch 8 updates the Rust PCI sample driver to use `register!`, as per
>>> its TODO item.
>>>
>>> Patch 9 illustrates more extensively how this macro is used by
>>> converting nova-core to use it, and removing the local implementation.
>>> This patch is to be merged one cycle after the other patches.
>>>
>>> Patch 10 is an RFC allowing a shorter write syntax to be used in the
>>> case of fixed or relative registers. It doesn't need to be merged
>>> immediately, but I think it is a good time to discuss it.
>>>
>>> I have also removed Gary's signoff on patches 5 and 7 to make sure it
>>> doesn't get merged before he gives it explicitly.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>
>>> ---
>>> Changes in v7:
>>> - Use `RES + SHIFT >= N` instead of `RES >= N - SHIFT` in
>>>     `Bounded::shr`.
>>> - Rename `IoRef` to `IoLoc` and all related types
>>>     accordingly.
>>> - Use `Into` trait bounds in both directions on `IoLoc`.
>>> - Add RFC patch allowing fixed register values to be used directly with
>>>     `write`.
>>> - Link to v6: https://patch.msgid.link/20260216-register-v6-0-eec9a4de9e9e@nvidia.com
>>>
>>> Changes in v6:
>>> - Remove Tested-by tags as the code has considerably changed.
>>> - Make `Bounded::get` const so it can be used with registers.
>>> - Use the `pin_init::zeroed()` const function instead of defining our
>>>     own method.
>>> - Generalize all `Io` around the new `IoRef` and `IoWrite` types, and
>>>     make registers use these as well.
>>> - Use the more natural pattern of having the `Io` type perform the I/O
>>>     access instead of the register type.
>>> - Convert the whole PCI driver example, and not only the PCI
>>>     configuration space.
>>> - Rename `Bounded::as_bool` to `Bounded::into_bool`.
>>> - Drop `Bounded::into_inner` in favor of making `Bounded::get` const.
>>> - Link to v5: https://patch.msgid.link/20260129-register-v5-0-c4587c902514@nvidia.com
>>>
>>> Changes in v5:
>>> - Rename all setters to `with_*` and `with_const_*`.
>>> - Use `, stride = ` to specify the stride of register arrays.
>>> - Remove `Deref` requirement on the `RegisterIo` trait and make it
>>>     `#[doc(hidden)`.
>>> - Simplify the top dispatch rule a bit.
>>> - Link to v4: https://patch.msgid.link/20260128-register-v4-0-aee3a33d9649@nvidia.com
>>>
>>> Changes in v4:
>>> - Add `with_` const field setter methods (removing the need to call
>>>     `Bounded::new` for constant field values).
>>> - Add `into_inner` const method for `Bounded`.
>>> - Add `from_raw` and const `zeroed` method to create initial register
>>>     values.
>>> - More documentation improvements.
>>> - Link to v3: https://patch.msgid.link/20260126-register-v3-0-2328a59d7312@nvidia.com
>>>
>>> Changes in v3:
>>> - Sort the Rust features list alphabetically.
>>> - Rebase on top of latest `driver-core-next` including the new Io trait.
>>> - Allow several registers to be defined from the same macro invocation.
>>> - Remove references to `bitfield!` macro.
>>> - Fix doccomment of `shr` and `shl`.
>>> - Use `+` syntax for relative register offsets.
>>> - Move register arrays size and stride to after the backing type declaration.
>>> - Use regular doccomments to document registers and fields (thanks Gary!).
>>> - Remove `Default` implementation and implement the more predictable
>>>     `Zeroable` instead.
>>> - Improve doccomments a bit.
>>> - Link to v2: https://patch.msgid.link/20260121-register-v2-0-79d9b8d5e36a@nvidia.com
>>>
>>> Changes in v2:
>>> - Remove `bitfield!` and put its rules into `register!` to give it more
>>>     time to get reviewed.
>>> - Allow output type larger than strictly required for `shr` and `shl` on
>>>     `Bounded`.
>>> - Enable the `generic_arg_infer` feature, required for rustc < 1.89.
>>> - Link to v1: https://patch.msgid.link/20260120-register-v1-0-723a1743b557@nvidia.com
>>>
>>> ---
>>> Alexandre Courbot (10):
>>>         rust: enable the `generic_arg_infer` feature
>>>         rust: num: add `shr` and `shl` methods to `Bounded`
>>>         rust: num: add `into_bool` method to `Bounded`
>>>         rust: num: make Bounded::get const
>>>         rust: io: add IoLoc and IoWrite types
>>>         rust: io: use generic read/write accessors for primitive accesses
>>>         rust: io: add `register!` macro
>>>         sample: rust: pci: use `register!` macro
>>>         [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro
>>>         RFC: rust: io: allow fixed register values directly in `write`
>>>
>>>    drivers/gpu/nova-core/falcon.rs           |  249 +++----
>>>    drivers/gpu/nova-core/falcon/gsp.rs       |   23 +-
>>>    drivers/gpu/nova-core/falcon/hal/ga102.rs |   65 +-
>>>    drivers/gpu/nova-core/falcon/hal/tu102.rs |   11 +-
>>>    drivers/gpu/nova-core/falcon/sec2.rs      |   17 +-
>>>    drivers/gpu/nova-core/fb.rs               |    6 +-
>>>    drivers/gpu/nova-core/fb/hal/ga100.rs     |   40 +-
>>>    drivers/gpu/nova-core/fb/hal/ga102.rs     |    7 +-
>>>    drivers/gpu/nova-core/fb/hal/tu102.rs     |   22 +-
>>>    drivers/gpu/nova-core/gfw.rs              |   11 +-
>>>    drivers/gpu/nova-core/gpu.rs              |   36 +-
>>>    drivers/gpu/nova-core/gsp/boot.rs         |   11 +-
>>>    drivers/gpu/nova-core/gsp/cmdq.rs         |   10 +-
>>>    drivers/gpu/nova-core/regs.rs             |  544 ++++++++------
>>>    drivers/gpu/nova-core/regs/macros.rs      |  739 -------------------
>>>    rust/kernel/io.rs                         |  347 +++++++--
>>>    rust/kernel/io/register.rs                | 1135 +++++++++++++++++++++++++++++
>>>    rust/kernel/lib.rs                        |    3 +
>>>    rust/kernel/num/bounded.rs                |   70 +-
>>>    samples/rust/rust_driver_pci.rs           |   84 ++-
>>>    scripts/Makefile.build                    |    3 +-
>>>    21 files changed, 2118 insertions(+), 1315 deletions(-)
>>> ---
>>> base-commit: 545225ee0b0b6998c7b6ff888f8497681b8b35c4
>>> change-id: 20260117-register-ccaba1d21713
>>
>>
>> I converted my simple aarch64 TMU timer example [1] over to v7 (many
>> thanks helping with that!) and gave it a try: It works like with v2.
>> With that:
>>
>> Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
> 
> Really appreciated! And I think we are finally converging, so hopefully
> no more big refactoring ahead. :) Still, please let me know if you saw
> anything that looked off during the conversion.


I was slightly surprised about the `set_` to `with_` change. But 
thinking about it I think it heavily depends on the point of view:

If you look at it from a physical register point of view I'm used to 
"set" a register / bit. So looking from physical register point of view 
I find using `set_` natural.

On the other hand, if we look at the Rust "syntax" you create here like

foo.with_a(4).with_b(9).write(io);

we write to register foo with bits a being 4 and bits b being 9. So we 
are doing a write *with* some bits set. From this point of view `with_` 
fits as well.

I think you mentioned that this is discussable. And I think it heavily 
depends on the point of view you take. So I'm fine either.

Thanks

Dirk

