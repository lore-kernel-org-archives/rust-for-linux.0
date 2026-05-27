Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022088.outbound.protection.outlook.com [52.101.96.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB1644DB69;
	Wed, 27 May 2026 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779902412; cv=fail; b=hrHycme7/XsOFqKWob9jkHH2HBpihgOtw7yUd4zbwAsXaaJyUh3CW7Roj7vsRP1ewhrhuE6rryQMn3FmLcIOVj5SFT6guR2pHZFxPWR4Fp980AKVf7Efo8PUIMWSvsM8FF08gVXomdEJXgQkr7Ipo9Bpl9j3AFHAMc4m1fJxrnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779902412; c=relaxed/simple;
	bh=gmmTE9QK2NJ5eBEFH0qoNWwZWU1XDBXczieO6waA7N8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=X1hVFoFbvkALyxvPUE776HaPt+83+DKcEoi1KCS8yYgJj5h2DZzR9f2lHDElcEk4lPtZuhceO7jIB53GifGV6zIi0oZK/TNAKF53UV84XGraOaQ71lNfvYzzZGU/v/AkusAaNAogvaeDKL3m1g9AuMNBK8E1iqmmRcIoV22n4Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=f1/X0Oqe; arc=fail smtp.client-ip=52.101.96.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="f1/X0Oqe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZ2sKxWnAn66NLESIaweW3LlrK92NgK+LtaSYap0ykVeJVESoLF+ySgH/DqVe87uytdP4nmDMYvCFiz25iCY2mwQLiENgn+FoiDlGI6dytZ2tyD5O/WEIReE1+BcPSy1QOpF+7H4j7rj36+WexN0ZREMXgwtMPeQYZ/WIp4w08j8dumD30ThEury1HFmf3TggcO+c3vPpGqantVIiISosuRUOvWJnhi88XI+oOwh3XY2aqzom8HvACwlhlBDD2gmIfL99e6Dv6FODEwsOuWFIp+7AEIQ19t8/adeel5PG2kE0NFeTu5kjG2Y3nIEKW8fHZlMPHBf7cqx1R9lciG1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfB4Rz6m0xNnByj3bU5tFWN7aPaR0hFvzNyHOWcxHMs=;
 b=R/IJ1HoLU3WdGIi9RXQSoIUOSlThaS7gjpb1THZXzq2+PImDiDw6yYMpsu5GVQB+etEIGZSkcPX+OTlfYvILmLiJdqS5T7GyBaObz1RcHNNA73qtTVrCTgntHHYdeBFPHVpHmBWRBvZDxbfeDkrVkoKEGHBxn3qWVDF4kbOkHPzga1V5RjzQRnJVkHcKByNm07fzIPR7iDIVDg1ZLQJ+UMLifY4iaz/Zyq3+TjQ6n0XHiMWJGdHkfY/3gvoeC3YuQvZ6PaJc35UiV+WB5NjmT+8oCBV0NXtcA8l6D3bonQB0Rw21kVwvf9TTMN/Evv74CWTD/4pul3TJFNNUKS4t+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfB4Rz6m0xNnByj3bU5tFWN7aPaR0hFvzNyHOWcxHMs=;
 b=f1/X0OqePH348jEA1Fi783O427A59HzElRn7QEzyXycctrBXdv+fec5AfdKwGdv+OrXR6B08W9HUwBjxrZ+/n+EUK4pupYYGRfzLzrBkGYjXrnKMHJ3rx9fSVSoArm2GGB7AMVV8cfm3T4q2aoRc7NaBlRWOBys03S17KgFRvzg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO8P265MB7781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:20:05 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 17:20:05 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/8] rust: pin-init upstream sync for v7.2 (round 2)
Date: Wed, 27 May 2026 18:19:51 +0100
Message-Id: <20260527-pin-init-sync-v1-0-e20335ed2501@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALcnF2oC/yXMQQ6CQAxA0auQrm0yDAjqVQgLKEXropApEAjh7
 gy6fIv/dzAOwgavZIfAi5gMGpHeEqBPo29G6aLBO1+4uy9xFEVRmdA2JczTxpGn56PMCGIzBu5
 l/f2q+m+b2y/TdE3gOE7eFesycQAAAA==
X-Change-ID: 20260527-pin-init-sync-41a0c2c9873c
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>, Martin Kletzander <mkletzan@redhat.com>, 
 Mirko Adzic <adzicmirko97@gmail.com>, Xiaobo Liu <cppcoffee@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779902405; l=1880;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=gmmTE9QK2NJ5eBEFH0qoNWwZWU1XDBXczieO6waA7N8=;
 b=K5pBqSFVe5ayY3/7v35DhNpSNtXGDhZWtcJLLxcWDrVXWUomQ5P4m5RG8jAOW7zrdZdRVOEgp
 RkAGuQhYavbAGKgmsT4d0YU5AdFVspdn1SntSiXGcXa22qw35F2zhhD
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO8P265MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dee234e-c0f9-4e3b-1823-08debc1431c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8QI6Cx2XsXiKuhTZyKKmxz71TfezPcaW/wIP8Vb8K5QZtnKHzqoYR/j1O/Iqq86UpjZGzB/eqQGaCfbYIJwaPYcvQoQJyEnKqS6nCH4pg6iW1WnH6fVQ0E0OMcWOzsHKa01CzIoL54u7nsibdmU1l54Nxv4QlmD2ue5nIGzut4w9iK7o7uArQDXwUwSSniXnux+Owx00iOrU+abGiGx9kIit5wyqi9QFZelR5UM4Dri6q/dLpjsvWXWIciDC/BvaQyB6Qqy2p4z8NOXzm+PlvtrV7qXPR9MUM8kYdO7J7z1EP+0dIFaYiCJO6jNmdVyo/4P70xhmUEmX75kxa1KXSjBn3YaU28m6y+uhFH5g15iXuHQjfbWnIuLBzw6/drlLTSK/KKdEmQP3TtIbTRAqqKDBMt36J07Vvm8Y30m3vZe5htVzYKwNa8zHLcSI3SOhrrCJPL7hLnT9hUKZ/nXkE3mT7S+l/mEQJqHsI7+fBhU3vJ/zU/qGYb07y7AU1y7wEyKxaj+BALNPuv0VpueoX6OUYdwL0wLePav/kt1PaCZGYbAHr/Rk2VIRAEE8lOAymLIKtncNig6J1hC4sNJbO3y+QzJZ1gbSY3vtP+8s8MY/EOEIddZdXB5vkn9uM7C6+XghmWmKTjssSLRKNgQ3U7RMW2vuwOoHprW3lBUwx9FPR4ylOU4UNlAv/+nNWR9Y/T0REwvLOBwrxpDMcuBGlw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0ZnTDI1UGJQbi94Kys3QmdVOEdqbU85Y2pUZy9YUVhJemF4WXZOckV5cHRq?=
 =?utf-8?B?ZHcxWlZTeXg3Q0FlQnI2dmJzRDJ4TFl2R3VxcFRQUWRjak5aVFk0SEQvN3dz?=
 =?utf-8?B?b3dubDA3UnNJMVIxcDkxeVMzZEJab0UybU02YVJ1MmRBWWhYcnRHdTdRZ3RO?=
 =?utf-8?B?RWxqWVdRQy9DeGNtOWNDWG5BMC9peTZFNTIvRkJodjFndVgxdUhFSVBteGJT?=
 =?utf-8?B?dGlFd3VkOU0vWllFNUo1SzZGblRrYnlHaUM4Zys2b0pjdFdDMVVyemVRbnhr?=
 =?utf-8?B?ZVdzTXlhVXd2cDloREphOFhhWVJyOGlBeDNZWHNhRjAxbVFYNVMyWkJFOG9N?=
 =?utf-8?B?dktscGRWak5YK3JPaXkxMWdUdndQNXREOHc3K2QvSk5RdUJQUnhmd1lzQXA3?=
 =?utf-8?B?QWJQZzRTUVE0YkN1TW9NTkZsb2Y1aHh1SURXTmcrZlAzek1IU29MYy9qYkRy?=
 =?utf-8?B?cDJLVDVTdmVqY3Z6Sm12dHpncDFoNFFXTWlGUHZHazB1QnBLbmxJMDVoOWZz?=
 =?utf-8?B?ZDJGdFhMczJJSThCYW9ZeWlWSEtyaTNTWXBVTDAxTXBvNnY2VG5NazZCYUtX?=
 =?utf-8?B?bXpCQjc1L1FQUWFHcjgyUWZDdmIwWDN0KzhvUUVseThXeDR5WWtQYnd5YXRS?=
 =?utf-8?B?NGdxdFhYbEhWUkNzc1g3cmNJcE9PaVROcWJxVW93cC9kc1poQjh6eEM2b2li?=
 =?utf-8?B?WlpVYmVna2RrZWlzZ1AxbTM2QnZvcURqU2Q4UHYxVnh0amZuZnNXeFB4NGtu?=
 =?utf-8?B?OFVwTkV5NVFWNGtKeUZFeTJqVTF4M3EwR1R4WDE2M3d6aUJSb3FIcGtBNE5J?=
 =?utf-8?B?S0VQdVhaQmIwZWtJbWoyT0NnNUxnTGhlQlpQRS9LS3MvWDY5bUVaVDZ1d0ov?=
 =?utf-8?B?NHloWTZkaWVkVTFGaGcyZ2w0clIwZkhxd243NjVQdEI3N1AyOWwvY3YxRk1X?=
 =?utf-8?B?bkpaYXZYY0h4WnlNdlM5S3dSTkxBR01FTXczSzZvdVBva2VXZXh4TWF6aUNj?=
 =?utf-8?B?U0RCaUh3ay85QWlDNGZtYTV0SUVsTTQyN3BDcGE5RXVtVElzcVQ3QkZ0ZTla?=
 =?utf-8?B?K2FFWUtBU2dOY3RJNlc4eGN0RGQyUkNkWUZwTGJoVml5Wm95eHorYnN6ZW5H?=
 =?utf-8?B?UmJhZkxoT3RBVVpmdUlTR0RhQmJTdUZ3STNXQmR6ME1lZGRsdmRwNGIwZnBv?=
 =?utf-8?B?MktKa0pOSHMrV3B5dks2UUFoWkxCN2RBYU45aE1GU0Rld29kY3RtSnhKUFd3?=
 =?utf-8?B?TGdCTDRqTWpIMGNyUm5vZkZSUkNpVW42cDFaREQvUHJZckZOVExJV0dEUm9J?=
 =?utf-8?B?S3I3Qmg1Tm9lTWlBU2VhK3M1VzFGL21BWXp0ZzRRdnJhdFJBd3hIcWw1L2Mw?=
 =?utf-8?B?YXBZL3FCS0tBRHZsYm56UUxZZjNCTUxQelZUWlNJTm5HUzg1ZXJoQk55NVVu?=
 =?utf-8?B?dXc2Ym83czlGNXhidlRMdjV0bitDVnBFU1FYUnRtK0JGZmdZNkVTNW1vM01D?=
 =?utf-8?B?VWlqS2ZhT1ZTYWNSNDZZSFV4RU9rdFdIMWQyWFkxek1la1FwUkkzWW9UaVJC?=
 =?utf-8?B?OU1UdnJnZ2x2S1RXS3hyUlpKZVNvbDRGQ2pRWWo1NFhOTllROXRpRW1HQVlR?=
 =?utf-8?B?V0crMlBKTW9UR0IyNU9id1hacG1FRmNGT2xvTUN6Nlp5K1RDbW1EWXl5c29a?=
 =?utf-8?B?SEYvVURTQ3dNaW5tZlBsSjlxYk5LS0s3TVk3UGJidkpXTi90VmFCVlBZNHpk?=
 =?utf-8?B?cUpzWGUyZUxqdmgrYnVWeWhLaEdDbmNiY1Rtb2pNODNhTjFRTHBNcHdJTjBz?=
 =?utf-8?B?eUZKelg1YWFJanNXdnl2NU5qOVFjazBwUzFHZlk2ak9xb001NDNoS20raytt?=
 =?utf-8?B?NG9oZmVMNUo0THhIZW9RdWlUaDJmSGY0M2p4VXNFZjk2RDRpeFE1RnFhb0p5?=
 =?utf-8?B?TjZUb0FHTWt5dUliQTZwV3BLQVk5eGpFV25oMEwwNHZpTnA5eDI5WUhwWXMy?=
 =?utf-8?B?SjlRZURmZk9OOTZtbTVURm1xN0VidU5rMC96TlhrV1E5QXgzeUY1UjFpUGhE?=
 =?utf-8?B?UUQ4c3V3MHp6UkhrZnNRWWkwY3hMaGV6ek05YnovWEd4bERaSjBrbmIvWHho?=
 =?utf-8?B?Vk9DWFVZN3ZZTXdkYTN5WUlOTkZ0VHRyVVg2bkxBNnYreUxBSXdJU0ZJdXJQ?=
 =?utf-8?B?dnAwZ1d5Z29aaUFOcGxyOWxqbFZZbWx4ekZSeitVbm5neGlMVS9nV0Rta2E3?=
 =?utf-8?B?VEEyc0tzVUhHaXJJU3lBTTJNS3BOUnpnWW5NdFIrVjU4c09MajhsSm5DOXdB?=
 =?utf-8?B?bkY3YXBkcDVyTHZhSEkyNW1UdFFkV25MbUNIaUNnK2VxdlBmVVpmUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dee234e-c0f9-4e3b-1823-08debc1431c8
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:20:05.4909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhIQeUoidkAoeo1/lW+MEMZBC8F7kXkAvBQyB60cpOO1CW7Q/6FgW1MIg5IrOhP0t+AAwzaai7FpYbaW6ll8mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7781

This is a second round of patch syncs from upstream pin-init repo.
The following patches are included.

- Allow other attributes in #[pin_data] structs
  https://github.com/Rust-for-Linux/pin-init/pull/122

- init: allow `nonstandard_style` for generated accessor/value
  https://github.com/Rust-for-Linux/pin-init/pull/127

- docs: fix typos in MaybeZeroable documentation
  https://github.com/Rust-for-Linux/pin-init/pull/154

- Optimize symbol name length of `InitClosure`
  https://github.com/Rust-for-Linux/pin-init/pull/153

- unwind safety fixes
  https://github.com/Rust-for-Linux/pin-init/pull/140

Notably the `nonstandard_style` fix will allow a bunch of `#[allow]`s to be
removed from Nova's codebase.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (2):
      rust: pin-init: move `InitClosure` out from `__internal`
      rust: pin-init: remove `E` from `InitClosure`

Martin Kletzander (1):
      rust: pin-init: internal: pin_data: filter non-`#[cfg]` attr in generated code

Mirko Adzic (4):
      rust: pin-init: internal: suppress `non_snake_case` lint in `#[pin_data]`
      rust: pin-init: internal: suppress `non_snake_case` lint in `[pin_]init!`
      rust: pin-init: make `[pin_]init_array_from_fn` unwind safe
      rust: pin-init: make `[pin_]chain` unwind safe

Xiaobo Liu (1):
      rust: pin-init: docs: fix typos in MaybeZeroable documentation

 rust/pin-init/internal/src/init.rs     |   4 +-
 rust/pin-init/internal/src/pin_data.rs |  64 ++++++----
 rust/pin-init/src/__internal.rs        |  30 -----
 rust/pin-init/src/lib.rs               | 217 ++++++++++++++++++++++++---------
 4 files changed, 200 insertions(+), 115 deletions(-)
---
base-commit: 6fb5912c92926025a7e205d53feb73c3478c79a1
change-id: 20260527-pin-init-sync-41a0c2c9873c

Best regards,
--  
Gary Guo <gary@garyguo.net>

