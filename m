Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022143.outbound.protection.outlook.com [52.101.96.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725BA1E884
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 21:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726263141; cv=fail; b=tyLT3rw1jAe/H+Wfx8nM4OpAGPHrtqUkQBzatx0kppYXdP3mjLEVeDEmX7ag6F9r4neETpzjqWz4uOMCUXf2phO4J1XiNhTNnE2gHH/BZQgqP40JQUBsFj7Pip+jFREGyLC7xDsxjSQcrH9ajxaYTdOU0vhi4OSy04Y9XjlWIis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726263141; c=relaxed/simple;
	bh=Emht75Wa/LrRC41laP+JFN6BU4UYkmABSfdmI/5ekIo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Nj5PDFdR5tA9qvZwG+xi7DDXn9mOE38t7tDPGlSwFNlBFbjGeXcnc9lbrf1Qz7qPxdnK8PbwuvTP2P4fcpeOya/ayon0zj2Dph+OhEGRgfkG5Oliha+cQItZ8ChtvtxQUfkQhICh7mi1idGVBOhUMwo26dkXC7H8uSlwq25QjN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jAKtyECp; arc=fail smtp.client-ip=52.101.96.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jAKtyECp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJIWW+zI7kfF2Uem6YDq1qdm04StBb+5i8zqeJENG62u7JrAfaKL5+1HZHx5U06SZJqjtOqiEVp+X0llxEnXURec+I2WW53SGBqVSKQAvSQs3e+RlHkr6jfrXjwN5mFgp75shJeh9Iu3ETh0H58Vy0ITWRhXgII5F39U9lFTIMrbnxL8UTmQk9lEP4na8BU9yWXSADPrNT30SN/Hd3xXs411TTiXQ7/tXcjw2yrhrhnKft5i3Z7WpT89b9PFlTksAreh7e24pRGARaCqdnap//COFlulo0IUEQX+Czzy0viFmGUdwV9PEV2YHid4Gf7zSqBTRdH7O9rF/B0I3LowYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbOBerPfqDF+uDDQHzzUO9b826jhEys5sMy5Up6Naro=;
 b=ZcWHhxyrODX5CmAHSHKgnBrQ2EEFCEJFmJoeJrW6rPz/PGT/FIyjqrRV011fcyuhfAlViEC45d9l21JATcm5mNmMgjdtBWJVR5j6tJDUTRm0S7LP0KEI++6q47svkxgceOyuM6x9a1EPLFrgCY8BuiK8LBpUvC8BviVuFXLeZNaXzstSA5lxlQ3HqJ0T/8iujd++BEPTDJdMgEyXdFM+JFTMWSAzC7sMitUBvfVaYCJgLk781J8TjOInVky63ylB8OxmagrgkZLYSZsoFA9GzeorqI0vfN08al2tnxgVyISks2E4WRX3/+XJ0n3Rf6g/TaIZRlw1neRIdpK5R6E3pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbOBerPfqDF+uDDQHzzUO9b826jhEys5sMy5Up6Naro=;
 b=jAKtyECpywkI5Hy/tvha8NfJHw6MUvYSRM8drvtpd99l9pb/KjT35aek++0haffAQ4V4DXNbhEGn2ryYeXoKdmkPIERu9F4OxgvGOTZZjc+07c/yM3zdbCQeSurCNctZ9XykXRjR3rvoPv0onx21KZ33iFb4h05q7K92FqonOW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO2P265MB3594.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.20; Fri, 13 Sep
 2024 21:32:16 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 21:32:16 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org
Subject: [PATCH 0/5] use custom FFI integer types
Date: Fri, 13 Sep 2024 22:29:20 +0100
Message-ID: <20240913213041.395655-1-gary@garyguo.net>
X-Mailer: git-send-email 2.44.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0136.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::28) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO2P265MB3594:EE_
X-MS-Office365-Filtering-Correlation-Id: 33489228-69a5-4b3e-6746-08dcd43b89b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VRTyzIFjJqKaSkvXSSzRUlJlKMCYjT4N6OKxonHYNnG0Es1oSPgehnELeaqV?=
 =?us-ascii?Q?OxCm41BId45CRZpAQxDrnn0tQouKyXKF1PBTRg9SkM2ylZG2SeNdsupf7YJA?=
 =?us-ascii?Q?5OyEY56l7cB9lU+Ol3SDHJMNThHF5GIiGF8eplVj8ay3GGvyjF4vOV3y9Wia?=
 =?us-ascii?Q?LUQ6nHafhf0bE/T4SAkH/dKMJDq15rWnPW/LcqhKu2EQR4uu+MbHotu3Z4XW?=
 =?us-ascii?Q?O3km/2s9pvIE5uIyjTHIdgbe2PcOAL3NWV9tJGzCcx/TGqewMqFOb9W2P87N?=
 =?us-ascii?Q?/JlEfRFjxSiTrg5GVyvZexl1/rqiBK54X8BBPvGNKgIsSrOSncnsxSoNdtgx?=
 =?us-ascii?Q?bT0MJABjiYt8olpE/uqWmGFpe5bgUag51aBtrtLZxHkpCiebsjLymKEzxKo2?=
 =?us-ascii?Q?Fgbrtkjui0B33DHe7T7T6oTy8i+W/QoqcFBtn1McNAJHtzGZlwt8Q7sKW/J5?=
 =?us-ascii?Q?+KDbzX1X3rPfwlq8lGuA9IrutLyuYoesV70QbK+69SNq088ld8TBKqImREvw?=
 =?us-ascii?Q?nyeAV6xjaSoPGqLqCEFNlRmMu3MVKB5ueO5dV3gSGJEelNboqXtwPKdjc8GR?=
 =?us-ascii?Q?uHcwzhjGLNywOfn69wEDYD3LNqIcVpN44zmANktwkz2cxm8Y6kvH6NBqETKj?=
 =?us-ascii?Q?xHmRFXsVlLhlykZFRNmAvKArWTxzEhYOMifiTUstw4b1cGn6pAsjI68KebzO?=
 =?us-ascii?Q?bw0SkECq0YunVndqDfRiMDZSqohKkBQwiIuX0sk+cVAALLoNXvSnJwu46CMp?=
 =?us-ascii?Q?DLMqrSOslnibCcG65u+cfY67xy2mBrZLNgAMcCMt9PF2XpQUEoE1Hs4jakGw?=
 =?us-ascii?Q?luQy8+EPi20Ms4PKY1OlzHKeGAaVKVKtG6DQqLFscSSSIbYQOmtDMGtZM/4g?=
 =?us-ascii?Q?LdnznApV0Y2HMpcDh8p3hmGSxGdafMG39LaYqb9x8cO9y0XxHS+G6G0CMsuy?=
 =?us-ascii?Q?IV/9ibDGvxZrPQgIKSwXn9yJrWj1ZhXxV418wj9U6QCtelbszmvXanu6m3Cn?=
 =?us-ascii?Q?x3oS8hIUGsTN+rJCokCEWWGicJ504n9pAG1EsTppQJDfPqHfOx9TnnWe4eVs?=
 =?us-ascii?Q?nqeDikLBre88CTkpfU7Rs0ec2wpLZqpB0huFtT0xMBlfAK3YatavivRNDqel?=
 =?us-ascii?Q?F64QsF/N4H5QfDVFrii+ey+6P1gh+vZqE/qysh3g0EpZd3AsS1YEPlUHFJSg?=
 =?us-ascii?Q?zchP5PDXk8HBo+1ScOzuqMgNw6o5hk2QpIF2x34ts0fDL4UhcaeIHTFezAdy?=
 =?us-ascii?Q?n6M48TpQUc6T6dNy9ZJLk22nURkO5uqMg04kXK5svqhgvvYDnV83CJZeJL6b?=
 =?us-ascii?Q?Xb2qtmJi6jS6+sad2ABjfoRsmkCvTIm1UO3FKY+ZSWCBUOnYwagQpZxJmfWe?=
 =?us-ascii?Q?83XHKwZqPfpiEKHMJC4iYNSoXvgO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vk5Cg2FJMxCt0uUzRaIfqjJqxbI6pcpjBk7mj5ZrCDMGJzrdqWBOgvu/An8Y?=
 =?us-ascii?Q?vaRbRJK9nfYw/2QTUvpqvAebcMRvweO0y6Jp5Bepdfdbde9gfKHQXOxHFjUZ?=
 =?us-ascii?Q?yAAx2Izrupb64FitTLV2+6R2U8fjTrV3vZ2K3uc8b7W3Yp+t5/SFe5Muz2v3?=
 =?us-ascii?Q?2D+rYBT2DH1Un8fEC5DJFLg/GZVuwlpf39TVG80fTvrpNyJE5Y5JB0/cG/Z2?=
 =?us-ascii?Q?zWz68PvZHXuZn2OvRcRZ5dMwyawn+B6xHbgEInFnG579kKiF4txy/2hbFCmp?=
 =?us-ascii?Q?5eWXQNxbrC6S3eAUlbUNkZfJVvyJsDkk3WtOFZQfe9u4GZQQedZyUjExhKhx?=
 =?us-ascii?Q?9u+akq2lXATg3smjpyhfe+sXQbM2xJ4GqA5HiCc1x5xBShw9OQs3o3cOO1mG?=
 =?us-ascii?Q?tCmH6LiWwD80TzMcVZMrTfGfmG9aCeWGX6IyZTfmI4OWjotQjIgYXBMnJZZS?=
 =?us-ascii?Q?0Na8UuonetvNmdb6HB3oRP/WuArntSGD+XcyDMc8moHxLXK1MIuX3aVidX0v?=
 =?us-ascii?Q?JGWCmOxKBDzN9a7T9ldxBpN0P9+B7Twg2JZsgWkHeIESfn+enzHc5jFcCAa1?=
 =?us-ascii?Q?BFJIrMsz4OxK3rZd02zrwQgrEWBKRzRhGTMwnxojREjUaLUbf9Ao8wrOHMYY?=
 =?us-ascii?Q?ycdn45CD2oHz1y0k3I8kFmyYzhs43Jh5KlESPVqojWOSgl5E6epR33PX2SUx?=
 =?us-ascii?Q?7SoYXlY8joYjh3vjQacmy3N1VT7g/HfwO/CbZxJXJO71W3tp+q8z0t2aPLlF?=
 =?us-ascii?Q?kpaf9TVuAoe2TgN90Di78Feunb3wXKx0xcMr4imaSfcxH65YGff+/QMda5hp?=
 =?us-ascii?Q?k92IPN2ZhBNXgYXAK2gYF6fGYlGyyZV6M89k/Sobc1e4iY78DTjFRiZuoSDt?=
 =?us-ascii?Q?HzCu+7ckdieGIbwxnahHaRB3qxhLKeOYdJ868Hw2STCmpnC86vpYslax4bX9?=
 =?us-ascii?Q?/kQwTurlg4WyLutfoXhX2CkoF613SRDPN7wEX4XN+fgdmBRyKnOzSAJgjoYA?=
 =?us-ascii?Q?iNvx8C2Dw7/0Uuw3ie0AF+235hbmBMsyOe12BrgX9vGwoNjEauzzReGvHOvy?=
 =?us-ascii?Q?zMRUF3vnzL4zv31qkXRNHUx51n0PD8n1Xntg+mlrLsyzF1zNX9r+G3Jj6z5u?=
 =?us-ascii?Q?JEiE9wNn5N7un5wZYHypvCZPDIlYKof+NUdYsxZJBSNETrW23hndiKtAAlhE?=
 =?us-ascii?Q?GHmv0spbrxhVgeuQH042qZ/uEA8G77xkg1qkNGSiKDolQHRGtviznkW30yFK?=
 =?us-ascii?Q?uiiPXAF0PAasAQiIyoTbArzsPbSLQ1dXA3Z61epbU6pf4ysWt/WKM72BihpX?=
 =?us-ascii?Q?hwFgHoc2EHAV0Tv41aqnvDEgVlnE5O0ehXan12nXNj+CiWEBuJRjSC4/HU6s?=
 =?us-ascii?Q?fZzVP6EdYA1tNNGkzLhxWjxEDcziTuwAC+qZQuesoKkII29d+dOE5E3jNmF3?=
 =?us-ascii?Q?AMCtlF1HRTwbkNZaWKlQUJPHBr3vVi1rd542rpLMKdyDDS21lDJsT8rmW2m0?=
 =?us-ascii?Q?XBJ3b2bphXoZINJvIUOz69UhVVVfvcnRn2qt8lN6kdFkUzq8hN5gGnCAV4EE?=
 =?us-ascii?Q?S2pu5qM0nvbhKdCrppkVbzTJLM1pK3dt8xIl9UJ6?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 33489228-69a5-4b3e-6746-08dcd43b89b8
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 21:32:15.9875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnD6zmENa1KiaOdaRK7Ae5L4JFN0IGLY5f1u9RPgSuC9Cp1Hp82AyetbUm3JiQ9LAoHkLEDJ/KpKz3+dMBt2AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3594

This patch series aim to reduce the unnecessary type casts needed in
Rust code doing FFI calls.

With this series, we can ensure:

* `size_t` is mapped to usize. Currently this is mostly true except for
  C builtin functions, which gets translated by bindgen to c_ulong/c_uint.

* `__kernel_size_t` is mapped to usize. Currently this is mapped to
  c_ulong/c_uint.

* `unsigned long` is mapped to usize. Currently this is mapped by Rust
  libcore to either u32 or u64.

* `char` is mapped to `u8`. Currently this is mapped by Rust libcore to
  either i8 or u8.

After this series, FFI code needs to use `kernel::ffi` types instead of
`core::ffi`.

Gary Guo (5):
  rust: fix size_t in bindgen prototypes of C builtins
  rust: map `__kernel_size_t` and friends also to usize/isize
  rust: use custom FFI integer types
  rust: map `long` to `isize` and `char` to `u8`
  rust: cleanup unnecessary casts

 rust/Makefile                      | 24 ++++++++++-----
 rust/bindgen_parameters            |  5 ++++
 rust/bindings/lib.rs               |  5 ++++
 rust/ffi.rs                        | 48 ++++++++++++++++++++++++++++++
 rust/kernel/alloc/allocator.rs     |  4 +--
 rust/kernel/block/mq/operations.rs | 18 +++++------
 rust/kernel/block/mq/raw_writer.rs |  2 +-
 rust/kernel/block/mq/tag_set.rs    |  2 +-
 rust/kernel/error.rs               | 25 +++++++---------
 rust/kernel/firmware.rs            |  2 +-
 rust/kernel/init.rs                |  2 +-
 rust/kernel/kunit.rs               | 10 ++-----
 rust/kernel/lib.rs                 |  2 ++
 rust/kernel/net/phy.rs             | 14 ++++-----
 rust/kernel/print.rs               |  4 +--
 rust/kernel/str.rs                 | 10 +++----
 rust/kernel/sync/arc.rs            |  6 ++--
 rust/kernel/sync/condvar.rs        |  2 +-
 rust/kernel/sync/lock.rs           |  2 +-
 rust/kernel/sync/lock/mutex.rs     |  2 +-
 rust/kernel/sync/lock/spinlock.rs  |  2 +-
 rust/kernel/task.rs                |  8 ++---
 rust/kernel/time.rs                |  4 +--
 rust/kernel/types.rs               | 26 ++++++++--------
 rust/kernel/uaccess.rs             | 31 ++++++-------------
 rust/macros/module.rs              |  8 ++---
 rust/uapi/lib.rs                   |  5 ++++
 27 files changed, 161 insertions(+), 112 deletions(-)
 create mode 100644 rust/ffi.rs


base-commit: 93dc3be19450447a3a7090bd1dfb9f3daac3e8d2
-- 
2.44.1

