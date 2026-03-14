Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010006.outbound.protection.outlook.com [52.101.61.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EF723183F;
	Sat, 14 Mar 2026 01:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450426; cv=fail; b=j3jleQah5eO44DztQkXTQxCeD/nFkXgSPuqNy2/DQ7lRXn5/qR32fdCM6Edr/PnximhxivxzykyIsjBcfy9ueqh8idYh678yASYUh5DCL+exIzrEHg2ledWM1aFgbY8ertJn4KxGlrcZ5AyxH21YDobrnBg7P5F2YxA9ZrpVBa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450426; c=relaxed/simple;
	bh=7nwpqxDuy/0GCDVhx5XjZqmmTMSZ8Tn5EQ0NLp68obI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=W8U3ydxNvvwc2l4s4c1V1+GpkIFctFpYFyTgU36k+FA34OtdYHX8A9EIdDheSbFrNc73plEQljSHkbGYtOY4evdiTGXuavEGdi58B9PXyvnFl6kBLOXAsxtRtDaucf3OGpv37mxAVMnawmFD0GY2dRLApO5jMID9m/KSoEtOTKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JxKXXAoF; arc=fail smtp.client-ip=52.101.61.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JxKXXAoF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLV93x/iThIHkzvdhNflyxy8EXwd+zwF+fgejSke634wpBgcyLHKr3zfYt1nFfAFmEzaX+a7/NZEbzyTIHaT5lMFNnRo920RoAiioIZkZaLmvBicGGLgMSYsVawmrRvJisT7kReOqh66VzM53kxdX/BcWSv4bSGsmY8Hrbp2f6UEBHK54utY19mJWoit5frdMC15WHRvDB8EVOPuqevkcrs0+E5xgaX6dROnMdPg+gdSid4j8YhveDBu+EMNKcf7TeAKrI+IrOD7MgmBLpwZMRXq6mdQoRPo7YJXgAdO7BPNfwKjbqLqD2EuFeJ8tuD+SH8WsKZrz81ftHHt2SEDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRwuX5g9k/PYDv+6hs3Iy3jGlN9yzSelg48Vgq1DJgg=;
 b=Vuqe+SY6D+iaXLI22TY6gNgsKjvsuPC+WjBYvB3S8cG+nLEYmXZ9KISg3vib41sFRPUXGyTw0hnsBYZvKFUTCWE9UFCOaS32nMBeKAIBKiv0gwD8c1nDnuMciw3DvuG9yH3y/eyzNoyNrOQ9kaPMnOIbZSFnQ7fELHEJ3rY7cuZFq9Yhm+RNLl5Dd30mF9S/MCqX68ZnzBg9PNdL3CgkbFbCju7N2q9gpVPSOWPxoGMukSYcqBNPYUbv/0zbPPL4lZ3F97KWpn91b1anNS1++ZbfMUAdwZ8SLU50eXWtMliOphYYXArFPeZzJF7pi0I0hBI9Tisvk8YrWuSAnn9Wzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRwuX5g9k/PYDv+6hs3Iy3jGlN9yzSelg48Vgq1DJgg=;
 b=JxKXXAoFmlBAZnpKTFf+x+1JKj99KN+N7pTPXH3z43DgSQ54mt7Uu/oSA4dOzxM0ip6MEkDY24IHLrBVyhxz4EvzD2JJdqJSzqGP6RNFDshnys6fcCnvJZjMwpnz2rqeaVOiWHpWv8UVZFR1+HjIF0XZaiuDVlGI0UwEZi2RwxUDYbHIQcAsrrqLeHOsabCVlrHt80W9qf8wglTizrfSEt5SGt1L2EApvFSgFOpYHItcdH1iTPjXuNf9smmmsHzsQA+O1rLzXpqiLgB9SsUpFJf+q6YJOSm8MTUG7rmqDZSG16TVQpIRgA/i2W7wXpp3h7TqcEwZOX2PRg/Jbk8JRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sat, 14 Mar
 2026 01:06:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sat, 14 Mar 2026
 01:06:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 14 Mar 2026 10:06:17 +0900
Subject: [PATCH v9 07/10] rust: io: add `register!` macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-register-v9-7-86805b2f7e9d@nvidia.com>
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
In-Reply-To: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:405:372::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: c0088197-502c-472f-8d0a-08de8165fbae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	B0t6FyrXoZlZ6hrK8X/xWfNtKDxBTA0itB+eY22eF75+C9UrFt47DcPnVPb//rKptJwFUKL9S/Oxk11K0Wsr3MLl2QosO576GLC46S+/jkscaP9ybow7La12XlNHCyKO/71XTi6Zud6sKonTbGDfZ7imEp3RgwVIAM13ROlC1KUPc+uA+qJzQuC55r+VRRW0QmA0a69vdJftED7MzkxrkatkywTa5+en2jj8n96idw6TYTMePgzZ1E4LAA4yKpaJ5P31iwHobkPsehAeAZx3ztztcfoHQRrh1GdU+WhJ01tqNsZG03aKwr5kHDQw+DLTvzffQ+W21fsENZ0/4rlHuE8B+CWwi4JpXLEYMbWP3AL3HR+YGb//PPub6fRq0/vWZCrXy3r1r4xrTTkYT8HkjqT5B9UnP13lS4dI7scf8u+uc2iveC8AM6KZTSsP8I9FB8ZnmYeUDGP3x4EpnFdNOMGEKzW6q8iw8IP5f7knBBx0i8jYJdUgjveXoY5vqKW25nFjBla4SAE8yooNeeherk5KcNIlSClLRmPD1Xo2I+PhdPWxQm8NhZgJKKnzUSoLyNskqc/wLOzk6i7h2HY8nt0IXc0ETjHSixoxCxT0ejdtZzoAKG178DImKmYgs4t2cjnp6MIuH4/2K5ALMbgaiFALJ6N9ISMLAObsO130pxWIi5Ld0UfG85Z2Xi4xPbVGRtQadMqagMje8RRSZpND+L1qcP1rbgTvNIAdSfpvqils/JVuyj16X5iPMC8bmXzUEHDUaumR88rOfVu/S3gp7ZbQatJ2mpxU56a6/f9006A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U25JMHJyVVEzV2tJMk9GMnBOMzNUOG5jWEdZd3BiNTBqWnozZitSOW0wcC9G?=
 =?utf-8?B?RDVOYUNqL2lRSkRLRTBzcXU2QkM1NGdkRzZUN0FocnZuUVZWRFVNc1B3WDhL?=
 =?utf-8?B?ZHVEUnltTi9CeTVwVS9CclM1Y25yeE8wd3R6b2hVOEM1WmxodC93QXRZczdS?=
 =?utf-8?B?RmROOGdYMEtJRlV0Z0R1Y0d5U2oxU3RwSkRKM3VMWEZMN0NjeEt6UW8rQmg3?=
 =?utf-8?B?VDlCOEw1TkQreTViaEFMZ3pKbnd1eGI5U3ZTL0cvS3VYWldDOVFmbHhjS3N4?=
 =?utf-8?B?Q1prRzZCUHNYRDliYTc4UCt1dk5JY2VtOVlqT1JaTnI0NHE1VE5HRlV2RzF0?=
 =?utf-8?B?K2xGM3VuSnpTWHRFbVdvZFB6ZkxpeGV2TmJ6SG1Xdlo3SkxodjBUNXUyUDR1?=
 =?utf-8?B?dWRiVllucFQ5ek5NMWtob09Wd0FBLzdCYllaT09HNW9MdGcrMjU2NjhoRTRE?=
 =?utf-8?B?cmJNeEI2SFlsRHZabS9mV0lmbW5PRy9WNk4reDRuSmhqTnJ6UmV1L2Z5MHFX?=
 =?utf-8?B?ZWFxL0NhUFJMNU91ZHNxRXFhMi9OTnBsOFFvQ0t1T0hBSytwU04vTUR2RVZ5?=
 =?utf-8?B?bEM3OGZWUFZzb2E2dzM3djNRSzc4cGxlZldPK2ZIUW52TjVQczQ3cWpnTkg0?=
 =?utf-8?B?SmNZenlZRm1xVG90Ui81bnVEZXhwY3V5SEdPSXZIdGY3USt3cnJOckNNNTd3?=
 =?utf-8?B?MVFKbUllZEgyTjFiY3lQdHN5L1Z4MFU0bndHaWxDUW9sYWx1L0pmK1hkWTI4?=
 =?utf-8?B?cFRuVUZmU2lEU0QvbnFRNDdmbkpjeUpOKzlQaG9Ub2QrUTJjZU82b1NqOXhG?=
 =?utf-8?B?UmplamJHcVMwMS9DRVIvQlVqNldiU2MrTGFTSkxBYUw2cmkycm9icnJzUDFL?=
 =?utf-8?B?Qlh1ZVNuRVhlWUVkOW12TUNVUzREb1NiUGQ0RU9DckJlYUN3clhIT1V1MmpY?=
 =?utf-8?B?S0hicjBLTUxGa24xaUh6L1ZPUVRSUytLdGxpVUJheTdPbDkwUVM1RG1PYTRR?=
 =?utf-8?B?a05vTmxBWmNGL2V6d3VnOGpzZ2tJQnVNbm9MRWxUTGNIVks3bnNnaUJ4NGRp?=
 =?utf-8?B?NWVjRTY2RGpETFFqOHRkMkt2cDJEd1grV3k4cWtCRjQ1ZlorcGNPelFXMThX?=
 =?utf-8?B?OVd5R29Ta2ZvMzlVV1N0Z1dsemlERmUwdGMxMXhucUZHSU1RbSs2VEpyRTR6?=
 =?utf-8?B?SyszL1BaZDVmcmViSDFibmtTd3o4My9ZbTlqemM3U216TjdNMGRJb1lOMnJH?=
 =?utf-8?B?QU4yTi9PcHJJVDhxOTRrTGRkaGFaMCtBcXZZMjZMdVAzWVMzTGgzOU5MY0ln?=
 =?utf-8?B?UUpla3lKY1Z6bjJ3YnFDdG4xUVZiRDdadGQ1bVptMFFlWVRnSVljTlRCOGJw?=
 =?utf-8?B?NE56cmJtSWtkMjcxTW1IeWJ3QkZtWXR0VTkyMXBvU1dVQ0ZidE9MUWdrY3U0?=
 =?utf-8?B?d2xyNmtJU1Z6WUFGTjRvT2FCZEZJSS9BdW5CdWtyaEFDU1BYSnB0NXlFK0NN?=
 =?utf-8?B?bEVLTkY0Q3Fld01OVWYvTVozV0k5aVZNcWc3dUF0NzRrcWNEejFMdTgvTU9p?=
 =?utf-8?B?TkwzU1JVakVXVzVXY0dBT3h1VERoSGdqdGhxQVd0d0pLRUlWVitiMGhzTGxN?=
 =?utf-8?B?SWswczlJbXFaaklDYUFLWG5YSytHNzhJZDBRZndvODZRdGZlaDdINTh2K0tY?=
 =?utf-8?B?aEtpVXN0YVZNbGRJaHREM1dZNXI2NW9iazM4dm0yaFBjQUtuNkhpR3p1aytt?=
 =?utf-8?B?M2xkZ21velZkWU5RQkpCeEU1czAvcFpITHk0eko0WTBsWjVld0JKUGJmUnAr?=
 =?utf-8?B?M2RUd0hGUzBCdXF0OTFwUmNhMWN1czNFNk9UbzNEeUxlalVCY3RMbVRTNzFV?=
 =?utf-8?B?UlkwKzVuYk0vNmNLbHB3TW1CY09mYURYUDVmSlFSZEV5T2g3VHdPTDE1Ylkx?=
 =?utf-8?B?aTFYSHB1NmNuWDlZUkU3bHBCNHZLT243ekdSL3dGSGlWalBCbWNBczVOblJm?=
 =?utf-8?B?cWk1dDVPUEpTMURvVU9zVXNRM0RRbVFwT1MvVCtLeEVnS2dEdFduYVUwczBH?=
 =?utf-8?B?UEgxSGYvOW51VERXdHpyMWROM09oTVM5bWpPa2xrWGNQQkhOZnBBbUMvSW8y?=
 =?utf-8?B?Wkd5T05SZnoreWREZlRIWGZIci9NUjQyUnFKY2lmbUdQbEcwQUJualdSd0c5?=
 =?utf-8?B?Q3c4VTBPSkh2Rk5lb3hnZHF6Ty9pbzZrOVFjOVlHK0lVU3JEUnVWT2FHLzh4?=
 =?utf-8?B?eDk2ekEzWTFxb21NTlZrbWR6OEZ3VHBKekxTMHE0S3FvRFhyUTA0eFhvQ01t?=
 =?utf-8?B?MWZ2cVJpdnVWOU1YUUp1czB0cFA5cVd5MThReW9aOVMxMERaMVlzS3dnTWFs?=
 =?utf-8?Q?wgM266O99Qls93wOxtHcqV3K4ELx0BQfDc8ZhLROXbObN?=
X-MS-Exchange-AntiSpam-MessageData-1: YvOefn8DWW56lQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0088197-502c-472f-8d0a-08de8165fbae
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:06:55.0972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjCwPFOCuaDm7qUy4b3DAKn9QbKtg17BMVFMn5MD+VNB+EARFEs+UDSWb0w+jslh0rVDgX0bejjeaXyRK4PeJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

Add a macro for defining hardware register types with I/O accessors.

Each register field is represented as a `Bounded` of the appropriate bit
width, ensuring field values are never silently truncated.

Fields can optionally be converted to/from custom types, either fallibly
or infallibly.

The address of registers can be direct, relative, or indexed, supporting
most of the patterns in which registers are arranged.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/all/20250306222336.23482-6-dakr@kernel.org/
Co-developed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs          |    5 +-
 rust/kernel/io/register.rs | 1227 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1231 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index c9d43b1372ab..bfea30a9acdf 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -11,8 +11,10 @@
 
 pub mod mem;
 pub mod poll;
+pub mod register;
 pub mod resource;
 
+pub use crate::register;
 pub use resource::Resource;
 
 /// Physical address type.
@@ -179,7 +181,8 @@ pub trait IoCapable<T> {
 /// This trait is the key abstraction allowing [`Io::read`], [`Io::write`], and [`Io::update`] (and
 /// their fallible [`try_read`](Io::try_read), [`try_write`](Io::try_write) and
 /// [`try_update`](Io::try_update) counterparts) to work uniformly with both raw [`usize`] offsets
-/// (for primitive types like [`u32`]) and typed ones.
+/// (for primitive types like [`u32`]) and typed ones (like those generated by the [`register!`]
+/// macro).
 ///
 /// An `IoLoc<T>` carries three pieces of information:
 ///
diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
new file mode 100644
index 000000000000..40085953c831
--- /dev/null
+++ b/rust/kernel/io/register.rs
@@ -0,0 +1,1227 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Macro to define register layout and accessors.
+//!
+//! The [`register!`](kernel::io::register!) macro provides an intuitive and readable syntax for
+//! defining a dedicated type for each register and accessing it using [`Io`](super::Io). Each such
+//! type comes with its own field accessors that can return an error if a field's value is invalid.
+//!
+//! Note: most of the items in this module are public so they can be referenced by the macro, but
+//! most are not to be used directly by users. Outside of the `register!` macro itself, the only
+//! items you might want to import from this module are [`WithBase`] and [`Array`].
+//!
+//! # Simple example
+//!
+//! ```no_run
+//! use kernel::io::register;
+//!
+//! register! {
+//!     /// Basic information about the chip.
+//!     pub BOOT_0(u32) @ 0x00000100 {
+//!         /// Vendor ID.
+//!         15:8 vendor_id;
+//!         /// Major revision of the chip.
+//!         7:4 major_revision;
+//!         /// Minor revision of the chip.
+//!         3:0 minor_revision;
+//!     }
+//! }
+//! ```
+//!
+//! This defines a 32-bit `BOOT_0` type which can be read from or written to offset `0x100` of an
+//! `Io` region, with the described bitfields. For instance, `minor_revision` consists of the 4
+//! least significant bits of the type.
+//!
+//! Fields are instances of [`Bounded`](kernel::num::Bounded) and can be read by calling their
+//! getter method, which is named after them. They also have setter methods prefixed with `with_`
+//! for runtime values and `with_const_` for constant values. All setters return the updated
+//! register value.
+//!
+//! Fields can also be transparently converted from/to an arbitrary type by using the `=>` and
+//! `?=>` syntaxes.
+//!
+//! If present, doc comments above register or fields definitions are added to the relevant item
+//! they document (the register type itself, or the field's setter and getter methods).
+//!
+//! Note that multiple registers can be defined in a single `register!` invocation. This can be
+//! useful to group related registers together.
+//!
+//! Here is how the register defined above can be used in code:
+//!
+//!
+//! ```no_run
+//! use kernel::{
+//!     io::{
+//!         register,
+//!         Io,
+//!         IoLoc,
+//!     },
+//!     num::Bounded,
+//! };
+//! # use kernel::io::Mmio;
+//! # register! {
+//! #     pub BOOT_0(u32) @ 0x00000100 {
+//! #         15:8 vendor_id;
+//! #         7:4 major_revision;
+//! #         3:0 minor_revision;
+//! #     }
+//! # }
+//! # fn test(io: &Mmio<0x1000>) {
+//! # fn obtain_vendor_id() -> u8 { 0xff }
+//!
+//! // Read from the register's defined offset (0x100).
+//! let boot0 = io.read(BOOT_0);
+//! pr_info!("chip revision: {}.{}", boot0.major_revision().get(), boot0.minor_revision().get());
+//!
+//! // Update some fields and write the new value back.
+//! let new_boot0 = boot0
+//!     // Constant values.
+//!     .with_const_major_revision::<3>()
+//!     .with_const_minor_revision::<10>()
+//!     // Run-time value.
+//!     .with_vendor_id(obtain_vendor_id());
+//! io.write((), new_boot0);
+//!
+//! // Or, build a new value from zero and write it:
+//! io.write((), BOOT_0::zeroed()
+//!     .with_const_major_revision::<3>()
+//!     .with_const_minor_revision::<10>()
+//!     .with_vendor_id(obtain_vendor_id())
+//! );
+//!
+//! // Or, read and update the register in a single step.
+//! io.update(BOOT_0, |r| r
+//!     .with_const_major_revision::<3>()
+//!     .with_const_minor_revision::<10>()
+//!     .with_vendor_id(obtain_vendor_id())
+//! );
+//!
+//! // Constant values can also be built using the const setters.
+//! const V: BOOT_0 = pin_init::zeroed::<BOOT_0>()
+//!     .with_const_major_revision::<3>()
+//!     .with_const_minor_revision::<10>();
+//! # }
+//! ```
+//!
+//! For more extensive documentation about how to define registers, see the
+//! [`register!`](kernel::io::register!) macro.
+
+use core::marker::PhantomData;
+
+use crate::io::IoLoc;
+
+/// Trait implemented by all registers.
+pub trait Register: Sized {
+    /// Backing primitive type of the register.
+    type Storage: Into<Self> + From<Self>;
+
+    /// Start offset of the register.
+    ///
+    /// The interpretation of this offset depends on the type of the register.
+    const OFFSET: usize;
+}
+
+/// Trait implemented by registers with a fixed offset.
+pub trait FixedRegister: Register {}
+
+/// Allows `()` to be used as the `location` parameter of [`Io::write`](super::Io::write) when
+/// passing a [`FixedRegister`] value.
+impl<T> IoLoc<T> for ()
+where
+    T: FixedRegister,
+{
+    type IoType = T::Storage;
+
+    #[inline(always)]
+    fn offset(self) -> usize {
+        T::OFFSET
+    }
+}
+
+/// A [`FixedRegister`] carries its location in its type. Thus `FixedRegister` values can be used
+/// as an [`IoLoc`].
+impl<T> IoLoc<T> for T
+where
+    T: FixedRegister,
+{
+    type IoType = T::Storage;
+
+    #[inline(always)]
+    fn offset(self) -> usize {
+        T::OFFSET
+    }
+}
+
+/// Location of a fixed register.
+pub struct FixedRegisterLoc<T: FixedRegister>(PhantomData<T>);
+
+impl<T: FixedRegister> FixedRegisterLoc<T> {
+    /// Returns the location of `T`.
+    #[inline(always)]
+    // We do not implement `Default` so we can be const.
+    #[allow(clippy::new_without_default)]
+    pub const fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+impl<T> IoLoc<T> for FixedRegisterLoc<T>
+where
+    T: FixedRegister,
+{
+    type IoType = T::Storage;
+
+    #[inline(always)]
+    fn offset(self) -> usize {
+        T::OFFSET
+    }
+}
+
+/// Trait providing a base address to be added to the offset of a relative register to obtain
+/// its actual offset.
+///
+/// The `T` generic argument is used to distinguish which base to use, in case a type provides
+/// several bases. It is given to the `register!` macro to restrict the use of the register to
+/// implementors of this particular variant.
+pub trait RegisterBase<T> {
+    /// Base address to which register offsets are added.
+    const BASE: usize;
+}
+
+/// Trait implemented by all registers that are relative to a base.
+pub trait WithBase {
+    /// Family of bases applicable to this register.
+    type BaseFamily;
+
+    /// Returns the absolute location of this type when using `B` as its base.
+    #[inline(always)]
+    fn of<B: RegisterBase<Self::BaseFamily>>() -> RelativeRegisterLoc<Self, B>
+    where
+        Self: Register,
+    {
+        RelativeRegisterLoc::new()
+    }
+}
+
+/// Trait implemented by relative registers.
+pub trait RelativeRegister: Register + WithBase {}
+
+/// Location of a relative register.
+///
+/// This can either be an immediately accessible regular [`RelativeRegister`], or a
+/// [`RelativeRegisterArray`] that needs one additional resolution through
+/// [`RelativeRegisterLoc::at`].
+pub struct RelativeRegisterLoc<T: WithBase, B: ?Sized>(PhantomData<T>, PhantomData<B>);
+
+impl<T, B> RelativeRegisterLoc<T, B>
+where
+    T: Register + WithBase,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    /// Returns the location of a relative register or register array.
+    #[inline(always)]
+    // We do not implement `Default` so we can be const.
+    #[allow(clippy::new_without_default)]
+    pub const fn new() -> Self {
+        Self(PhantomData, PhantomData)
+    }
+
+    // Returns the absolute offset of the relative register using base `B`.
+    //
+    // This is implemented as a private const method so it can be reused by the [`IoLoc`]
+    // implementations of both [`RelativeRegisterLoc`] and [`RelativeRegisterArrayLoc`].
+    const fn offset(self) -> usize {
+        B::BASE + T::OFFSET
+    }
+}
+
+impl<T, B> IoLoc<T> for RelativeRegisterLoc<T, B>
+where
+    T: RelativeRegister,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    type IoType = T::Storage;
+
+    #[inline(always)]
+    fn offset(self) -> usize {
+        RelativeRegisterLoc::offset(self)
+    }
+}
+
+/// Trait implemented by arrays of registers.
+pub trait RegisterArray: Register {
+    /// Number of elements in the registers array.
+    const SIZE: usize;
+    /// Number of bytes between the start of elements in the registers array.
+    const STRIDE: usize;
+}
+
+/// Location of an array register.
+pub struct RegisterArrayLoc<T: RegisterArray>(usize, PhantomData<T>);
+
+impl<T: RegisterArray> RegisterArrayLoc<T> {
+    /// Returns the location of register `T` at position `idx`, with build-time validation.
+    #[inline(always)]
+    pub fn new(idx: usize) -> Self {
+        ::kernel::build_assert!(idx < T::SIZE);
+
+        Self(idx, PhantomData)
+    }
+
+    /// Attempts to return the location of register `T` at position `idx`, with runtime validation.
+    #[inline(always)]
+    pub fn try_new(idx: usize) -> Option<Self> {
+        if idx < T::SIZE {
+            Some(Self(idx, PhantomData))
+        } else {
+            None
+        }
+    }
+}
+
+impl<T> IoLoc<T> for RegisterArrayLoc<T>
+where
+    T: RegisterArray,
+{
+    type IoType = T::Storage;
+
+    #[inline(always)]
+    fn offset(self) -> usize {
+        T::OFFSET + self.0 * T::STRIDE
+    }
+}
+
+/// Trait providing location builders for [`RegisterArray`]s.
+pub trait Array {
+    /// Returns the location of the register at position `idx`, with build-time validation.
+    #[inline(always)]
+    fn at(idx: usize) -> RegisterArrayLoc<Self>
+    where
+        Self: RegisterArray,
+    {
+        RegisterArrayLoc::new(idx)
+    }
+
+    /// Returns the location of the register at position `idx`, with runtime validation.
+    #[inline(always)]
+    fn try_at(idx: usize) -> Option<RegisterArrayLoc<Self>>
+    where
+        Self: RegisterArray,
+    {
+        RegisterArrayLoc::try_new(idx)
+    }
+}
+
+/// Trait implemented by arrays of relative registers.
+pub trait RelativeRegisterArray: RegisterArray + WithBase {}
+
+/// Location to a relative array register.
+pub struct RelativeRegisterArrayLoc<
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+>(RelativeRegisterLoc<T, B>, usize);
+
+impl<T, B> RelativeRegisterArrayLoc<T, B>
+where
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    /// Returns the location of register `T` from the base `B` at index `idx`, with build-time
+    /// validation.
+    #[inline(always)]
+    pub fn new(idx: usize) -> Self {
+        ::kernel::build_assert!(idx < T::SIZE);
+
+        Self(RelativeRegisterLoc::new(), idx)
+    }
+
+    /// Attempts to return the location of register `T` from the base `B` at index `idx`, with
+    /// runtime validation.
+    #[inline(always)]
+    pub fn try_new(idx: usize) -> Option<Self> {
+        if idx < T::SIZE {
+            Some(Self(RelativeRegisterLoc::new(), idx))
+        } else {
+            None
+        }
+    }
+}
+
+/// Methods exclusive to [`RelativeRegisterLoc`]s created with a [`RelativeRegisterArray`].
+impl<T, B> RelativeRegisterLoc<T, B>
+where
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    /// Returns the location of the register at position `idx`, with build-time validation.
+    #[inline(always)]
+    pub fn at(self, idx: usize) -> RelativeRegisterArrayLoc<T, B> {
+        RelativeRegisterArrayLoc::new(idx)
+    }
+
+    /// Returns the location of the register at position `idx`, with runtime validation.
+    #[inline(always)]
+    pub fn try_at(self, idx: usize) -> Option<RelativeRegisterArrayLoc<T, B>> {
+        RelativeRegisterArrayLoc::try_new(idx)
+    }
+}
+
+impl<T, B> IoLoc<T> for RelativeRegisterArrayLoc<T, B>
+where
+    T: RelativeRegisterArray,
+    B: RegisterBase<T::BaseFamily> + ?Sized,
+{
+    type IoType = T::Storage;
+
+    #[inline(always)]
+    fn offset(self) -> usize {
+        self.0.offset() + self.1 * T::STRIDE
+    }
+}
+
+/// Defines a dedicated type for a register, including getter and setter methods for its fields and
+/// methods to read and write it from an [`Io`](kernel::io::Io) region.
+///
+/// This documentation focuses on how to declare registers. See the [module-level
+/// documentation](mod@kernel::io::register) for examples of how to access them.
+///
+/// There are 4 possible kinds of registers: fixed offset registers, relative registers, arrays of
+/// registers, and relative arrays of registers.
+///
+/// ## Fixed offset registers
+///
+/// These are the simplest kind of registers. Their location is simply an offset inside the I/O
+/// region. For instance:
+///
+/// ```ignore
+/// register! {
+///     pub FIXED_REG(u16) @ 0x80 {
+///         ...
+///     }
+/// }
+/// ```
+///
+/// This creates a 16-bit register named `FIXED_REG` located at offset `0x80` of an I/O region.
+///
+/// These registers' location can be built simply by referencing their name:
+///
+/// ```no_run
+/// use kernel::{
+///     io::{
+///         register,
+///         Io,
+///     },
+/// };
+/// # use kernel::io::Mmio;
+///
+/// register! {
+///     FIXED_REG(u32) @ 0x100 {
+///         16:8 high_byte;
+///         7:0  low_byte;
+///     }
+/// }
+///
+/// # fn test(io: &Mmio<0x1000>) {
+/// let val = io.read(FIXED_REG);
+///
+/// // Write from an already-existing value.
+/// io.write(FIXED_REG, val.with_low_byte(0xff));
+///
+/// // Create a register value from scratch.
+/// let val2 = FIXED_REG::zeroed().with_high_byte(0x80);
+///
+/// // The location of fixed offset registers is already contained in their type. Thus, the
+/// // `location` argument of `Io::write` is technically redundant and can be replaced by `()`.
+/// io.write((), val2);
+/// # }
+///
+/// ```
+///
+/// It is possible to create an alias of an existing register with new field definitions by using
+/// the `=> ALIAS` syntax. This is useful for cases where a register's interpretation depends on
+/// the context:
+///
+/// ```no_run
+/// use kernel::io::register;
+///
+/// register! {
+///     /// Scratch register.
+///     pub SCRATCH(u32) @ 0x00000200 {
+///         31:0 value;
+///     }
+///
+///     /// Boot status of the firmware.
+///     pub SCRATCH_BOOT_STATUS(u32) => SCRATCH {
+///         0:0 completed;
+///     }
+/// }
+/// ```
+///
+/// In this example, `SCRATCH_BOOT_STATUS` uses the same I/O address as `SCRATCH`, while providing
+/// its own `completed` field.
+///
+/// ## Relative registers
+///
+/// Relative registers can be instantiated several times at a relative offset of a group of bases.
+/// For instance, imagine the following I/O space:
+///
+/// ```text
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///  0x100--->+------------CPU0-------------+
+///           |                             |
+///  0x110--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///           |                             |
+///  0x200--->+------------CPU1-------------+
+///           |                             |
+///  0x210--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           +-----------------------------+
+/// ```
+///
+/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offset `0x10` of their I/O
+/// space segment. Since both instances of `CPU_CTL` share the same layout, we don't want to define
+/// them twice and would prefer a way to select which one to use from a single definition.
+///
+/// This can be done using the `Base + Offset` syntax when specifying the register's address:
+///
+/// ```ignore
+/// register! {
+///     pub RELATIVE_REG(u32) @ Base + 0x80 {
+///         ...
+///     }
+/// }
+/// ```
+///
+/// This creates a register with an offset of `0x80` from a given base.
+///
+/// `Base` is an arbitrary type (typically a ZST) to be used as a generic parameter of the
+/// [`RegisterBase`] trait to provide the base as a constant, i.e. each type providing a base for
+/// this register needs to implement `RegisterBase<Base>`.
+///
+/// The location of relative registers can be built using the [`WithBase::of`] method to specify
+/// its base. All relative registers implement [`WithBase`].
+///
+/// Here is the above layout translated into code:
+///
+/// ```no_run
+/// use kernel::{
+///     io::{
+///         register,
+///         register::{
+///             RegisterBase,
+///             WithBase,
+///         },
+///         Io,
+///     },
+/// };
+/// # use kernel::io::Mmio;
+///
+/// // Type used to identify the base.
+/// pub struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+///
+/// // This makes `CPU_CTL` accessible from all implementors of `RegisterBase<CpuCtlBase>`.
+/// register! {
+///     /// CPU core control.
+///     pub CPU_CTL(u32) @ CpuCtlBase + 0x10 {
+///         0:0 start;
+///     }
+/// }
+///
+/// # fn test(io: Mmio<0x1000>) {
+/// // Read the status of `Cpu0`.
+/// let cpu0_started = io.read(CPU_CTL::of::<Cpu0>());
+///
+/// // Stop `Cpu0`.
+/// io.write(WithBase::of::<Cpu0>(), CPU_CTL::zeroed());
+/// # }
+///
+/// // Aliases can also be defined for relative register.
+/// register! {
+///     /// Alias to CPU core control.
+///     pub CPU_CTL_ALIAS(u32) => CpuCtlBase + CPU_CTL {
+///         /// Start the aliased CPU core.
+///         1:1 alias_start;
+///     }
+/// }
+///
+/// # fn test2(io: Mmio<0x1000>) {
+/// // Start the aliased `CPU0`, leaving its other fields untouched.
+/// io.update(CPU_CTL_ALIAS::of::<Cpu0>(), |r| r.with_alias_start(true));
+/// # }
+/// ```
+///
+/// ## Arrays of registers
+///
+/// Some I/O areas contain consecutive registers that share the same field layout. These areas can
+/// be defined as an array of identical registers, allowing them to be accessed by index with
+/// compile-time or runtime bound checking:
+///
+///
+/// ```ignore
+/// register! {
+///     pub REGISTER_ARRAY(u8)[10, stride = 4] @ 0x100 {
+///         ...
+///     }
+/// }
+/// ```
+///
+/// This defines `REGISTER_ARRAY`, an array of 10 byte registers starting at offset `0x100`. Each
+/// register is separated from its neighbor by 4 bytes.
+///
+/// The `stride` parameter is optional; if unspecified, the registers are placed consecutively from
+/// each other.
+///
+/// A location for a register in a register array is built using the [`Array::at`] trait method.
+/// All arrays of registers implement [`Array`].
+///
+/// ```no_run
+/// use kernel::{
+///     io::{
+///         register,
+///         register::Array,
+///         Io,
+///     },
+/// };
+/// # use kernel::io::Mmio;
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+///
+/// // Array of 64 consecutive registers with the same layout starting at offset `0x80`.
+/// register! {
+///     /// Scratch registers.
+///     pub SCRATCH(u32)[64] @ 0x00000080 {
+///         31:0 value;
+///     }
+/// }
+///
+/// # fn test(io: &Mmio<0x1000>)
+/// #     -> Result<(), Error>{
+/// // Read scratch register 0, i.e. I/O address `0x80`.
+/// let scratch_0 = io.read(SCRATCH::at(0)).value();
+///
+/// // Write scratch register 15, i.e. I/O address `0x80 + (15 * 4)`.
+/// io.write(Array::at(15), SCRATCH::from(0xffeeaabb));
+///
+/// // This is out of bounds and won't build.
+/// // let scratch_128 = io.read(SCRATCH::at(128)).value();
+///
+/// // Runtime-obtained array index.
+/// let idx = get_scratch_idx();
+/// // Access on a runtime index returns an error if it is out-of-bounds.
+/// let some_scratch = io.read(SCRATCH::try_at(idx).ok_or(EINVAL)?).value();
+///
+/// // Alias to a specific register in an array.
+/// // Here `SCRATCH[8]` is used to convey the firmware exit code.
+/// register! {
+///     /// Firmware exit status code.
+///     pub FIRMWARE_STATUS(u32) => SCRATCH[8] {
+///         7:0 status;
+///     }
+/// }
+///
+/// let status = io.read(FIRMWARE_STATUS).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register! {
+///     /// Scratch registers bank 0.
+///     pub SCRATCH_INTERLEAVED_0(u32)[16, stride = 8] @ 0x000000c0 {
+///         31:0 value;
+///     }
+///
+///     /// Scratch registers bank 1.
+///     pub SCRATCH_INTERLEAVED_1(u32)[16, stride = 8] @ 0x000000c4 {
+///         31:0 value;
+///     }
+/// }
+/// # Ok(())
+/// # }
+/// ```
+///
+/// ## Relative arrays of registers
+///
+/// Combining the two features described in the sections above, arrays of registers accessible from
+/// a base can also be defined:
+///
+/// ```ignore
+/// register! {
+///     pub RELATIVE_REGISTER_ARRAY(u8)[10, stride = 4] @ Base + 0x100 {
+///         ...
+///     }
+/// }
+/// ```
+///
+/// Like relative registers, they implement the [`WithBase`] trait. However the return value of
+/// [`WithBase::of`] cannot be used directly as a location and must be further specified using the
+/// [`at`](RelativeRegisterLoc::at) method.
+///
+/// ```no_run
+/// use kernel::{
+///     io::{
+///         register,
+///         register::{
+///             RegisterBase,
+///             WithBase,
+///         },
+///         Io,
+///     },
+/// };
+/// # use kernel::io::Mmio;
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+///
+/// // Type used as parameter of `RegisterBase` to specify the base.
+/// pub struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+///
+/// // 64 per-cpu scratch registers, arranged as a contiguous array.
+/// register! {
+///     /// Per-CPU scratch registers.
+///     pub CPU_SCRATCH(u32)[64] @ CpuCtlBase + 0x00000080 {
+///         31:0 value;
+///     }
+/// }
+///
+/// # fn test(io: &Mmio<0x1000>) -> Result<(), Error> {
+/// // Read scratch register 0 of CPU0.
+/// let scratch = io.read(CPU_SCRATCH::of::<Cpu0>().at(0));
+///
+/// // Write the retrieved value into scratch register 15 of CPU1.
+/// io.write(WithBase::of::<Cpu1>().at(15), scratch);
+///
+/// // This won't build.
+/// // let cpu0_scratch_128 = io.read(CPU_SCRATCH::of::<Cpu0>().at(128)).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime index returns an error if it is out-of-bounds.
+/// let cpu0_scratch = io.read(
+///     CPU_SCRATCH::of::<Cpu0>().try_at(scratch_idx).ok_or(EINVAL)?
+/// ).value();
+/// # Ok(())
+/// # }
+///
+/// // Alias to `SCRATCH[8]` used to convey the firmware exit code.
+/// register! {
+///     /// Per-CPU firmware exit status code.
+///     pub CPU_FIRMWARE_STATUS(u32) => CpuCtlBase + CPU_SCRATCH[8] {
+///         7:0 status;
+///     }
+/// }
+///
+/// // Non-contiguous relative register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register! {
+///     /// Scratch registers bank 0.
+///     pub CPU_SCRATCH_INTERLEAVED_0(u32)[16, stride = 8] @ CpuCtlBase + 0x00000d00 {
+///         31:0 value;
+///     }
+///
+///     /// Scratch registers bank 1.
+///     pub CPU_SCRATCH_INTERLEAVED_1(u32)[16, stride = 8] @ CpuCtlBase + 0x00000d04 {
+///         31:0 value;
+///     }
+/// }
+///
+/// # fn test2(io: &Mmio<0x1000>) -> Result<(), Error> {
+/// let cpu0_status = io.read(CPU_FIRMWARE_STATUS::of::<Cpu0>()).status();
+/// # Ok(())
+/// # }
+/// ```
+#[macro_export]
+macro_rules! register {
+    // Entry point for the macro, allowing multiple registers to be defined in one call.
+    // It matches all possible register declaration patterns to dispatch them to corresponding
+    // `@reg` rule that defines a single register.
+    (
+        $(
+            $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+                $([ $size:expr $(, stride = $stride:expr)? ])?
+                $(@ $($base:ident +)? $offset:literal)?
+                $(=> $alias:ident $(+ $alias_offset:ident)? $([$alias_idx:expr])? )?
+            { $($fields:tt)* }
+        )*
+    ) => {
+        $(
+        $crate::register!(
+            @reg $(#[$attr])* $vis $name ($storage) $([$size $(, stride = $stride)?])?
+                $(@ $($base +)? $offset)?
+                $(=> $alias $(+ $alias_offset)? $([$alias_idx])? )?
+            { $($fields)* }
+        );
+        )*
+    };
+
+    // All the rules below are private helpers.
+
+    // Creates a register at a fixed offset of the MMIO space.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* });
+        $crate::register!(@io_base $name($storage) @ $offset);
+        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage));
+    };
+
+    // Creates an alias register of fixed offset register `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* });
+        $crate::register!(
+            @io_base $name($storage) @
+            <$alias as $crate::io::register::Register>::OFFSET
+        );
+        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage));
+    };
+
+    // Creates a register at a relative offset from a base address provider.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) @ $base:ident + $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* });
+        $crate::register!(@io_base $name($storage) @ $offset);
+        $crate::register!(@io_relative $vis $name($storage) @ $base);
+    };
+
+    // Creates an alias register of relative offset register `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $base:ident + $alias:ident
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* });
+        $crate::register!(
+            @io_base $name($storage) @ <$alias as $crate::io::register::Register>::OFFSET
+        );
+        $crate::register!(@io_relative $vis $name($storage) @ $base);
+    };
+
+    // Creates an array of registers at a fixed offset of the MMIO space.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            [ $size:expr, stride = $stride:expr ] @ $offset:literal { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* });
+        $crate::register!(@io_base $name($storage) @ $offset);
+        $crate::register!(@io_array $vis $name($storage) [ $size, stride = $stride ]);
+    };
+
+    // Shortcut for contiguous array of registers (stride == size of element).
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $size:expr ] @ $offset:literal
+            { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            $(#[$attr])* $vis $name($storage) [ $size, stride = ::core::mem::size_of::<$storage>() ]
+                @ $offset { $($fields)* }
+        );
+    };
+
+    // Creates an alias of register `idx` of array of registers `alias` with its own fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) => $alias:ident [ $idx:expr ]
+            { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < <$alias as $crate::io::register::RegisterArray>::SIZE);
+
+        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* });
+        $crate::register!(
+            @io_base $name($storage) @
+            <$alias as $crate::io::register::Register>::OFFSET
+                + $idx * <$alias as $crate::io::register::RegisterArray>::STRIDE
+        );
+        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage));
+    };
+
+    // Creates an array of registers at a relative offset from a base address provider.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            [ $size:expr, stride = $stride:expr ]
+            @ $base:ident + $offset:literal { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<$storage>() <= $stride);
+
+        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* });
+        $crate::register!(@io_base $name($storage) @ $offset);
+        $crate::register!(
+            @io_relative_array $vis $name($storage) [ $size, stride = $stride ] @ $base + $offset
+        );
+    };
+
+    // Shortcut for contiguous array of relative registers (stride == size of element).
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty) [ $size:expr ]
+            @ $base:ident + $offset:literal { $($fields:tt)* }
+    ) => {
+        $crate::register!(
+            $(#[$attr])* $vis $name($storage) [ $size, stride = ::core::mem::size_of::<$storage>() ]
+                @ $base + $offset { $($fields)* }
+        );
+    };
+
+    // Creates an alias of register `idx` of relative array of registers `alias` with its own
+    // fields.
+    (
+        @reg $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)
+            => $base:ident + $alias:ident [ $idx:expr ] { $($fields:tt)* }
+    ) => {
+        static_assert!($idx < <$alias as $crate::io::register::RegisterArray>::SIZE);
+
+        $crate::register!(@bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* });
+        $crate::register!(
+            @io_base $name($storage) @
+                <$alias as $crate::io::register::Register>::OFFSET +
+                $idx * <$alias as $crate::io::register::RegisterArray>::STRIDE
+        );
+        $crate::register!(@io_relative $vis $name($storage) @ $base);
+    };
+
+    // Generates the bitfield for the register.
+    //
+    // `#[allow(non_camel_case_types)]` is added since register names typically use
+    // `SCREAMING_CASE`.
+    (
+        @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty) { $($fields:tt)* }
+    ) => {
+        $crate::register!(@bitfield_core
+            #[allow(non_camel_case_types)]
+            $(#[$attr])* $vis $name $storage
+        );
+        $crate::register!(@bitfield_fields $vis $name $storage { $($fields)* });
+    };
+
+    // Implementations shared by all registers types.
+    (@io_base $name:ident($storage:ty) @ $offset:expr) => {
+        impl $crate::io::register::Register for $name {
+            type Storage = $storage;
+
+            const OFFSET: usize = $offset;
+        }
+    };
+
+    // Implementations of fixed registers.
+    (@io_fixed $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)) => {
+        impl $crate::io::register::FixedRegister for $name {}
+
+        $(#[$attr])*
+        $vis const $name: $crate::io::register::FixedRegisterLoc<$name> =
+            $crate::io::register::FixedRegisterLoc::<$name>::new();
+    };
+
+    // Implementations of relative registers.
+    (@io_relative $vis:vis $name:ident ($storage:ty) @ $base:ident) => {
+        impl $crate::io::register::WithBase for $name {
+            type BaseFamily = $base;
+        }
+
+        impl $crate::io::register::RelativeRegister for $name {}
+    };
+
+    // Implementations of register arrays.
+    (@io_array $vis:vis $name:ident ($storage:ty) [ $size:expr, stride = $stride:expr ]) => {
+        impl $crate::io::register::Array for $name {}
+
+        impl $crate::io::register::RegisterArray for $name {
+            const SIZE: usize = $size;
+            const STRIDE: usize = $stride;
+        }
+    };
+
+    // Implementations of relative array registers.
+    (
+        @io_relative_array $vis:vis $name:ident ($storage:ty) [ $size:expr, stride = $stride:expr ]
+            @ $base:ident + $offset:literal
+    ) => {
+        impl $crate::io::register::WithBase for $name {
+            type BaseFamily = $base;
+        }
+
+        impl $crate::io::register::RegisterArray for $name {
+            const SIZE: usize = $size;
+            const STRIDE: usize = $stride;
+        }
+
+        impl $crate::io::register::RelativeRegisterArray for $name {}
+    };
+
+    // Defines the wrapper `$name` type and its conversions from/to the storage type.
+    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty) => {
+        $(#[$attr])*
+        #[repr(transparent)]
+        #[derive(Clone, Copy, PartialEq, Eq)]
+        $vis struct $name {
+            inner: $storage,
+        }
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Creates a bitfield from a raw value.
+            #[inline(always)]
+            $vis const fn from_raw(value: $storage) -> Self {
+                Self{ inner: value }
+            }
+
+            /// Turns this bitfield into its raw value.
+            ///
+            /// This is similar to the [`From`] implementation, but is shorter to invoke in
+            /// most cases.
+            #[inline(always)]
+            $vis const fn into_raw(self) -> $storage {
+                self.inner
+            }
+        }
+
+        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
+        unsafe impl ::pin_init::Zeroable for $name {}
+
+        impl ::core::convert::From<$name> for $storage {
+            #[inline(always)]
+            fn from(val: $name) -> $storage {
+                val.into_raw()
+            }
+        }
+
+        impl ::core::convert::From<$storage> for $name {
+            #[inline(always)]
+            fn from(val: $storage) -> $name {
+                Self::from_raw(val)
+            }
+        }
+    };
+
+    // Definitions requiring knowledge of individual fields: private and public field accessors,
+    // and `Debug` implementation.
+    (@bitfield_fields $vis:vis $name:ident $storage:ty {
+        $($(#[doc = $doc:expr])* $hi:literal:$lo:literal $field:ident
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+        ;
+        )*
+    }
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+        $(
+        $crate::register!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
+        $crate::register!(
+            @public_field_accessors $(#[doc = $doc])* $vis $name $storage : $hi:$lo $field
+            $(?=> $try_into_type)?
+            $(=> $into_type)?
+        );
+        )*
+        }
+
+        $crate::register!(@debug $name { $($field;)* });
+    };
+
+    // Private field accessors working with the exact `Bounded` type for the field.
+    (
+        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        $vis const [<$field:upper _MASK>]: $storage =
+            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        $vis const [<$field:upper _SHIFT>]: u32 = $lo;
+        );
+
+        ::kernel::macros::paste!(
+        fn [<__ $field>](self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
+            // Left shift to align the field's MSB with the storage MSB.
+            const ALIGN_TOP: u32 = $storage::BITS - ($hi + 1);
+            // Right shift to move the top-aligned field to bit 0 of the storage.
+            const ALIGN_BOTTOM: u32 = ALIGN_TOP + $lo;
+
+            // Extract the field using two shifts. `Bounded::shr` produces the correctly-sized
+            // output type.
+            let val = ::kernel::num::Bounded::<$storage, { $storage::BITS }>::from(
+                self.inner << ALIGN_TOP
+            );
+            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
+        }
+
+        const fn [<__with_ $field>](
+            mut self,
+            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
+        ) -> Self
+        {
+            const MASK: $storage = <$name>::[<$field:upper _MASK>];
+            const SHIFT: u32 = <$name>::[<$field:upper _SHIFT>];
+
+            let value = value.get() << SHIFT;
+            self.inner = (self.inner & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Public accessors for fields infallibly (`=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:literal:$lo:literal $field:ident => $into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) -> $into_type
+        {
+            self.[<__ $field>]().into()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>](self, value: $into_type) -> Self
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields fallibly (`?=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident ?=> $try_into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) ->
+            Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<
+                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+                >>::Error
+            >
+        {
+            self.[<__ $field>]().try_into()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>](self, value: $try_into_type) -> Self
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields not converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+        {
+            self.[<__ $field>]()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the compile-time constant `VALUE`."]
+        #[inline(always)]
+        $vis const fn [<with_const_ $field>]<const VALUE: $storage>(self) -> Self {
+            self.[<__with_ $field>](
+                ::kernel::num::Bounded::<$storage, { $hi + 1 - $lo }>::new::<VALUE>()
+            )
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>]<T>(
+            self,
+            value: T,
+        ) -> Self
+            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Tries to set this field to `value`, returning an error if it is out of range."]
+        #[inline(always)]
+        $vis fn [<try_with_ $field>]<T>(
+            self,
+            value: T,
+        ) -> ::kernel::error::Result<Self>
+            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + 1 - $lo }>,
+        {
+            Ok(
+                self.[<__with_ $field>](
+                    value.try_into_bounded().ok_or(::kernel::error::code::EOVERFLOW)?
+                )
+            )
+        }
+
+        );
+    };
+
+    // `Debug` implementation.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::kernel::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", self.inner))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+}

-- 
2.53.0

