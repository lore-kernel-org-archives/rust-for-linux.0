Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020120.outbound.protection.outlook.com [52.101.195.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB47397B02;
	Wed, 23 Sep 2026 18:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187638; cv=fail; b=NMk7NqpAS0MSfJvO4RNYn0Ftp73Nt+7WpZXQos4IqfScexUDGKm0wVbQaTyUCBflFvuDfAE5KCioPDJx5VmZW+MpLOuMyx9ENIlTM2OMd92/H6OeMMIAqeTC1WJW/7gWOBwPtKmZsX/5dRBKVwZTzlAsn2+HlA1LKxBRQzQqaCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187638; c=relaxed/simple;
	bh=wtnxfLb+FibJcPGhRQWHbc/qP7sDKzHlgEz5450iu8A=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Dfxp4FpSg/MLggUQqEv1Sm8KDlZaUFkLUQan+W4drXbTnYuvcvNpMtYrIt9ppD6LrvvMa0m9ZHh5C3TUXiUoXzCFQQeYPsmSP/zrSJDwy6vcGPwW21U8J+HtBlDbSshspPeRogIvM6PAI0kEBqqzg8oRG8d/scPIMpJV9j4eGx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Am1iaGQG; arc=fail smtp.client-ip=52.101.195.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Am1iaGQG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbYSxA15J4r8cgmXWwISSNs6F6PGlNZXQchQf9g2f+XupR/Jsj0/OpyZMiMI9QofamOP2EcMuz3RZXi3QZICGjzIQ5rIf943Iet1AuNT2csnK0H8i7XHa6h91UT9KVJFaZf+4Zf8g5oVDLRgqFGckIFe9oplUx0KYXd9/zEGPmtpy6/uP4N5XvQqj/wLUzF4uEI9rNJRw0pBKqgm1V8l1wC192TD0EjG8VCvZlOBfV/byJDhbQaUo5IH6U7j19Ij2M0XbUVieOYW94VYzQeDdbny4AyhNntcJzDrynhAx551C/rhsutfoSTtI3lJQlC5uZnVtTdh7SUyFBFJbYCYyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtZjLluJpCIhEu+S0NvLZJJWfs/c8Y1jM83JpSW0Puk=;
 b=SYZkmKt45dMyXa4g96KIqccBH8njkXdpLLyoOJCN7ZJhz+uS82l+HwNeZ9+uyYkUACjr6AsKZOvZy6DQ6TCXuBvEf4tdocDgvCl4jpDC+o8SoLzCecCVrNZtoO/yDZcbnVBPRmgweL4q/TiU/111JC+li6Rqp1TDoXLlxNP7CsmHHToIJVTnMrp7+gDMbYdWMAUHKkF8PTzcWHPj96dwQnPClQwv0rJxgR9i8vZCd137u1/qJ4E1Pg0+cyEsNUHjZOqNCHoUd4zep2m8AHnbL/pSwH2/9u69JhCGamTboIXrpxC1+zVMe+uetZYyMrV0d8DSBP4mARtmFGS+SbOqlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtZjLluJpCIhEu+S0NvLZJJWfs/c8Y1jM83JpSW0Puk=;
 b=Am1iaGQGsCpqQ2mMKld8yM6uiAjYJ707u182SGUkKJU9Hb5oWtHbKkMBAprUZy1VMEy8Buiiv2NvzFQj67N6mJRrsrU9jJY/AD/t2k9GpticjT4SyQFQWfmj9S4lvVKpN1MhGNO7/kgv7qYMYGRlro/WvwtiZW+Aahm7EIvMCOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CWLP265MB6301.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:187::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 18:20:30 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 18:20:30 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/5] rust: pin-init: improve diagnostics of missing
 `#[pin_data]` and `#[pin]`
Date: Wed, 23 Sep 2026 19:20:13 +0100
Message-Id: <20260923-dev-pin-data-diag-v1-0-e4d7193569e5@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF0YtGoC/yWMQQ6CMBBFr0Jm7cRSAwavYlxM2wHGxUjaQkgId
 7fV5fv57x2QOAoneDQHRN4kyUcLtJcG/Ew6MUooDNbY3gz2hoE3XEQxUCYMQhP2nTUDuXvXjh6
 Kt0QeZf81n68/p9W92ecaqg9HidFFUj/XKUfma22KSkblPcN5fgGArmfYmgAAAA==
X-Change-ID: 20260923-dev-pin-data-diag-65209ab751fc
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790187630; l=3445;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=wtnxfLb+FibJcPGhRQWHbc/qP7sDKzHlgEz5450iu8A=;
 b=clztXuX6XgqMlZktnrwvVu2MhZapLblnv3ceghEtmKtlGtUZj8DPG2f1nKkEMfEAWKABmJJsL
 vIl1ABoOCJfC84TpUUx4tghRJcRh5VfabU8RXZ+fnnfvXtJIMNNNZWl
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0182.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::7) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CWLP265MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de0045b-ec2b-4667-3b71-08df199f5994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10070799003|18002099003|921020|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	eVliFySUD9JRz3zMohrMuyNB1takVWNLqRFmU7U3Czti5Bp3nZiNsZJpWAkPMfWoy2/KUy8SnlnIiy40oRZII4xN8gqTTm6DaMlvho1J2DpuuZx9lFDg/vzJRhOJEAei/k/1pKvT3NCfichLzECMJKNiKzhKUxqqYAvS2VP/L1pdKQ7URjBcJV4k6xmi8/8wXHljQeq7oaMJdAlHJYQ0HC6JJ0NhWBMDL+A0woLo4Dx3NM6/+Wjz8x/h1w9V09+mXtoVkh8eXzkGm+4zhKJi6PFnQMR5EfD77qLFR5Rhpqm423srdiDumQog/Ezpzawhcv6uz0XQdX99xB/9xDNrZ1cI5GwVRvjsZXrsWu6a9eMwXoNWTG4+hhybHEHGfYYQ4lDAmQnxbSekvs47NWthanzh9+o8U/lZXWHr9uukCEkrtZJ0LMmTJjuUf0sUURfiNRTAgkD/w30KKvCiiVkjUEEHVMRvMjbtsvtWiedSnwrT++Q6/Xvl5Wl99/bxzud4m0SzpeMEdV4Ue+/z5y/4XO6Cg8bG+Q4b++uagMYXYO7sAKjxpxed2+Z5xZR/KQBIbP4s5zfrCdrjYbklNlAAN2P05gy09N64X/n022wgzQ19RUtQvjKYta/+6u/s4VicYmkTDYHy8i4ePRP4dj+7s3FT5crijM2eGt3V+T5PsQdbmiEGFt46QCGG2NYD7AUJwKp7cYMm2PpFeFwmYU12Bg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10070799003)(18002099003)(921020)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE9nM28yc3lBMWZrYTQyelJYSXovaW9zZGxzanFkOWFycWhkS096TVgvUnJY?=
 =?utf-8?B?TGZUbWlZbitKK2dRcmV4RVRuZUhGRDlNdmtFK3ZVME5hR2lBdERINU0yS0d4?=
 =?utf-8?B?U0pWYm9ES1A2bXN3eTd2NjU4VXpCOXVnbUlRRFUrK1RiZXZpQXNvaXh1N1BJ?=
 =?utf-8?B?cWRGcjB4NEVtVTU4QTdUNWVIa2lla1ZLeUdtMWF6bDlLSXZMV0kvbGhzV2Rw?=
 =?utf-8?B?aWYzcU9KT0VVWFFibVZZc09xaEcvWWdEa2I2NWw0dkNOUFptVzM0ZzRrZ0U1?=
 =?utf-8?B?Q210MEMyM0dHbjU3TjZkbTI3dk9IeGNHMjk3NW9vdFEwbTZlWC9WR0VRd1cz?=
 =?utf-8?B?d0VKaUxsNHVvTGtXbUpGazQ3Q3EzK3BKNm93N0loVlkwVDVxUGNUY01jeEQ4?=
 =?utf-8?B?Q014V0tjTVk3bkpUb2ZPWEtKRnRFVmhTa1lsaXpNaUViLys2cis4OTRmdjZh?=
 =?utf-8?B?eXVBaHJQNTJqMFpvUXJpK1dYTlRqMlpqMHY5STBLOWM5U294UXFqeEVKeTBw?=
 =?utf-8?B?eXI0N25lVUpXNWMzMFpqdWtzV0RHZkpIWVlWZ3IyUXFRTkRhQ1ZCUzVhd2tY?=
 =?utf-8?B?QmNjTVdkMXc4T0N5b1hOVWwvck84TzY0bHkxODBjOUZtUmhqYjdqcGlsU0Rl?=
 =?utf-8?B?VWpEa2VhdnQ4Z2E3MDNydmdoS3FPWit2NytOSjlLRnlvSlZaTktYL3lmYk9t?=
 =?utf-8?B?WGlJc1BBOHo2TmFOV0tuTExDQTBKRkVGVmMxL0o4V2ZRazVZT0hvYk5UeGtq?=
 =?utf-8?B?RG15SUVPM0M1cEhxWnBkWWFsVHEyMnFsTnVyOExNOTFXTW9UYmU4bGRBOU55?=
 =?utf-8?B?M3F6QWppL0krSjlra1k2WmN5SU1YR0ZEbnJiS1lEaDgrNzRKZEZnWHBVZS9v?=
 =?utf-8?B?Y2FKUFVsb1ZtekVhWjV6UkdTdXFaejFLRnVVbXp3OU44VnZGZ2lDZXFNZHNN?=
 =?utf-8?B?eU9weFVBKzAzYk1yMWVMRnhJSkw5NDBZYnRUd2dEeUJmdkxsNGxQYTZjSTZw?=
 =?utf-8?B?cDNibnNSbmlVSW82allZeDlGKzQ5b2RFY2dzM0RLMWpOcEpvTndLbnhGUkVs?=
 =?utf-8?B?TjJUVDVYZ0crb1NNUzhWaWJhUGI5UGtrQUVCSm80RGQ0dVBBNFNydnMrNXhJ?=
 =?utf-8?B?bWcxVXBZVld1RTBzOHJDMHRpVk1VY1Rxc1JMTkJFZi9SYy9LU0RlSVBrL2hy?=
 =?utf-8?B?cG1SRXdPY0JMbTFxbUpna0Z5NGpnUnFuL3F6Tm1xSVNLRDJ4K3lJNE9KZVFZ?=
 =?utf-8?B?ajJBUXVhRHl3TUQxUDBiUDhyNHdpN29EeUh0cWtMODIrL2oxcDFXOUVHWW5z?=
 =?utf-8?B?TlNzb251QndpQUNBcFhGeW9lc05BU2ZPWnNOdUJ5QjVOMWdUTGt5MGJ5QnYy?=
 =?utf-8?B?Yy93dkpmRlp4c1pCYWFWdjYwK0RyZEY5ajVnOTg0anV3cjNUSEtkZEowVjZp?=
 =?utf-8?B?cUxtdkVMRjhWSmMvLzRPUzMrZmxPVkR6TWp5Z29PTHRWQUZjM0VqMHJlQU4y?=
 =?utf-8?B?N2JjcFZ3cFl1MVVPWjh5YzUyUUZtRlhLL3BqamZULzk3QlpBMUk2YnA0eG01?=
 =?utf-8?B?Q0RVNWRwalRiV2xndytDUEk5YUR0SXJRVDNBa2FZNVFRRHpFVkRXZk50WHZS?=
 =?utf-8?B?dU02cThGNFdHTURpUzhuT2poT1hieE5HQnJkRTZ2eFp1bDU1NEVuci9MU2FI?=
 =?utf-8?B?THpKUmJuT1BGdFNsTFZQVEZHUDFIUzNEd1FSdmVpR2pQbHAyY0k2ZXZtbzlq?=
 =?utf-8?B?cyt3cjFiQXBTRDNXQ1Rkc2Fta3NBSUZuU3lVU3MwYlZCa2xtWm1TYnB6VlZM?=
 =?utf-8?B?L0VpeGFsWnBUTUJXMEplbE1kaW85WlV4RnVqYWt4aEN0T1V1eWtZQS95VHBa?=
 =?utf-8?B?bmhpbHBtdHgvNkZNSnphVG9RQXVIckI5bUFrdDVGMk81UVM0RUZadU5GSGZ0?=
 =?utf-8?B?QnRqR0hKZktoekdiVU5NNmFuM2V5THlMdzMzZU1HNWN1QTU4c1ZoTjN5eDVR?=
 =?utf-8?B?UTNMM1ZJOG12UUJUTTdsWHNvVjlidkhxMDhHNE14TlhrYmhzSmdPcU94a0k0?=
 =?utf-8?B?R29HNThqUVZiQTZ2UEpxbjhLbFhkUFY4OC9NTDVGcnBEa0lFNVFweVB5Q1JG?=
 =?utf-8?B?VEhncW1uT0UyU0tLMzcwWmNHMlZHTkFQTWo2MGFLZUNZbWw3a3VVc092OU9J?=
 =?utf-8?B?WXFsN0FURzZqN04rMCtOQ0FIbW40ZUI3YVZ5blROZ1hKdkk1ZlpuZWVBNU5M?=
 =?utf-8?B?ZEtCcmRJdHU3UXpMWDd4ZSthd05lT2svdXFCSkQ1TmZvaWFiemZvbkx6NzUx?=
 =?utf-8?B?RGJRcDBQcHhYZTZLVHRCSVNyaXpLQUdYcEhUUmp0NVp4NkozSWRPdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de0045b-ec2b-4667-3b71-08df199f5994
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 18:20:30.4125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2ZpeiE43F5nSQ9zIXaa1ELjQUp8szw6g+jB4I6nSs2xqCfAF4NQoT9HyUgHZL5Fl0BLgnR2U5liGbPhPoPhFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6301

Improve the diagnostics of missing `#[pin_data]` and `#[pin]`, by adding
diagnostics attributes. For `#[pin_data]`, we have to change the expansion
to retrieve `PinData` in a two-step process, so we change the error message
from "method exists but trait bound not satisfied" to "trait not
implemented".

This is the new error message for missing `#[pin_data]`:

    error[E0277]: `Foo` cannot be used with `pin_init!` macro
     --> tests/ui/compile-fail/init/missing_pin_data.rs:9:19
      |
    9 |         pin_init!(Self { a: 42 })
      |                   ^^^^ unsatisfied trait bound
      |
    help: the trait `pin_init::__internal::HasPinData` is not implemented for `Foo`

where it was previously

    error[E0599]: no associated function or constant named `__pin_data` found for struct `Foo` in the current scope
     --> tests/ui/compile-fail/init/missing_pin_data.rs:9:9
      |
    3 | struct Foo {
      | ---------- associated function or constant `__pin_data` not found for this struct
    ...
    9 |         pin_init!(Self { a: 42 })
      |         ^^^^^^^^^^^^^^^^^^^^^^^^^ associated function or constant not found in `Foo`
      |
      = help: items from traits can only be used if the trait is implemented and in scope
      = note: the following trait defines an item `__pin_data`, perhaps you need to implement it:
              candidate #1: `pin_init::__internal::HasPinData`

and this is the new error message for missing `#[pin]`:

    error[E0277]: `impl PinInit<usize>` cannot be used to movably initialize `usize` with error `_`
      --> tests/ui/compile-fail/pin_data/missing_pin.rs:12:18
       |
    12 |             a <- a,
       |             -----^
       |             |    |
       |             |    the trait `Init<usize, _>` is not implemented for `impl PinInit<usize>`
       |             required by a bound introduced by this call
       |
       = note: if your type implements `PinInit` but not `Init`, you might be forgetting a `#[pin]` annotation on fields

where it was previously

    error[E0277]: the trait bound `impl pin_init::PinInit<Bar>: Init<Bar, _>` is not satisfied
      --> tests/ui/compile-fail/init/invalid_init.rs:19:16
       |
    19 |         bar <- Bar::new(),
       |         -------^^^^^^^^^^
       |         |      |
       |         |      the trait `Init<Bar, _>` is not implemented for `impl pin_init::PinInit<Bar>`
       |         required by a bound introduced by this call

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (5):
      rust: pin-init: internal: make `__init_data` and `__pin_data` safe
      rust: pin-init: internal: remove associated type of `HasInitData`
      rust: pin-init: internal: use `HasInitData` to provide inference help only
      rust: pin-init: internal: add custom diagnostic when `#[pin_data]` is not implemented
      rust: pin-init: add diagnostic attribute for `PinInit` and `Init`

 rust/pin-init/internal/src/init.rs     | 25 +++++++++---------
 rust/pin-init/internal/src/pin_data.rs |  2 +-
 rust/pin-init/src/__internal.rs        | 48 +++++++++++++++-------------------
 rust/pin-init/src/lib.rs               | 11 +++++++-
 4 files changed, 45 insertions(+), 41 deletions(-)
---
base-commit: dfb6a037fd586f1ffcba3b143dab58f5c88294d1
change-id: 20260923-dev-pin-data-diag-65209ab751fc

Best regards,
--  
Gary Guo <gary@garyguo.net>

