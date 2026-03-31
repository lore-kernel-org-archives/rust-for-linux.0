Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC134611EB;
	Tue, 31 Mar 2026 22:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774997018; cv=fail; b=L1gNVi5HCDXz44tH4et8lMYG/lpdziiRGddWvXYXYAmQpBmUfUJj8RnhdD5uHdwIORMwhtonsrg5oNSvwCwUDXBFiJQzXP1fYPuYx2nHz/N7pxbV28AVqSnAYTh9d7mhSgBhc7p+KT4fOFgXlEX2Tc7wUNsOoVztK33FvDNwvYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774997018; c=relaxed/simple;
	bh=QHc6g4HbZJf/o6elJuBVt5rgZ0NGXosD5YoBLxha0fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u/55AoSOSEOplBhUrg2bxzStcLjRVtoegC7O3zbdycqNNHmM6HDrjK7dlE2h93oJJ+5TEUkX0oaN1KkpipEDaf6ia5x8FNkRTEXr//4v3bsWTHVCFNrFcTkSntg87dU5Y/8d7c+cjWua/1EMueB0iJVBsFtDbTk9mpTNF3rV9ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=amJt2QCp; arc=fail smtp.client-ip=40.107.209.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="amJt2QCp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKLHamZhZb1INQuOS7UdFzDKCfBhuGCvpbXNc4yvfHmLSQiEAguZa5DLMq3lh0X1ONOcpap0Bhdzm5EQgg5Rfb5p+WDuYItRG0GJh70fTmFGvb9j/mRrEYPdMghWqJqbG9vM3yAHF005+UNT0hxYYL0BTRR4+qHKrqRHNRC9x4xUGUAsrc6dUeHQmFinbea2ym//qVgWPov6UkwlX4KE7el7ZOBO1h0KBSbiX941TKPo5nmTAriS0HaKtnzQJVU6a5jNfwvvw0UgYYixUKW3El3gt7STJlx5oyBIlf2K6vGrFjGRsL1/pDdgukmpsfcde4ScXXV8NHazDOInMGlMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHwRJYL3gnfZ9csZ0Tq83ErBzJX8dIIvn738sn9q8Z4=;
 b=pI0n6NBeaFrCNO0y69wGrwMkeCsDnHJyNgfV3UAjeHHZiOKT1xreR7F7rHlOh73KP/BYL3biOCkC2YFcpBmK0PpP1N06IKFDOko6dUGC4YVndG833kkLtS1sW9gIuZ4LoZ8ivVEWbFXqTXENV5U2FdcuSNw7Owo1HtS6q3bqZ44dD3XudxuWkm8UBCH7S0Z/fE0wuPhwq9XR4kV+5S2od50fPcwTD3giIf20qfePsyP3sH1q/eHAr/DnC77zcjb4bNB01Qn/hKAHKcJNNyzbVd1+6w5SuCCmjPORo9cRPSJy+SDal+tX8jW52CJKGho5J+XA+W3ST1Fvb1vLJmZ0Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHwRJYL3gnfZ9csZ0Tq83ErBzJX8dIIvn738sn9q8Z4=;
 b=amJt2QCpLplKFlFFtSYSdLuSn/FnKsgoKUpyV+NURjDw6hRcKT8te/hsj+P1loA8rwkSyhgoIf93gAtgr/PDGe+DrYZkmFAWoIub5C6cZoryO8+Zy7o1DZoiIACOrclmsWX5shnuH6JPdnmBc88DtKrE72b1qmMe/N1LriND01N0Q38BBJG8cVtfCo/w0A9ghM1RyL10PAC3Ly1TCulAiJDUbsFj/Oucb8ebbwwJczQIiBJlHjUJ5LwdhxogxmcM31Iovin6di6VvMBiCf8RRaEKP7pZREsnCU6gHwg3BWB55rUAkz1mu8mfxBq1SFhhIKLURECEhufikcHIMK1T2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 22:43:23 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 22:43:23 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 1/2] rust: sizes: add DeviceSize trait for device address space constants
Date: Tue, 31 Mar 2026 15:43:18 -0700
Message-ID: <20260331224319.107082-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331224319.107082-1-jhubbard@nvidia.com>
References: <20260331224319.107082-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 416a00da-fda4-42e6-a8a3-08de8f76ea20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	r8nt0ubpJ03B1jbQzkm46JK6wTsThelb/gqFMWCo0fEF6HecVhWOE6eSwZuDWxi0Fbi3czduS/ikw2LVP2Qb0bYIMdtlmfoWnvhOCt9PeNGEc3LyNGx7ivjYNzNppkbrD4DJYqQn90lz9H8sqBC8itB+06vkVf3ZOoFZA1k+/JcJTyxNKWRJNErSeu8BeaNJXqxW3JtoUmI07Js4VQ6I3N1wFHJGvY+4WjOl+em3GpGz2XsSC/XBENcds0XGOsgAihN7UorFRbGoUd12SrSnJUFlue59g+nEeyxuakNTBlXmD3O2+uz1DKx59TKVNnsCzohi5cP7QgCJJUXnisS6rG4JqjfXsZTQWJuunygvFLIcx8jzZgwonexBU71TPHg3XxOGFPQlq3XzdhD7fvOnelKL1g7smF4mmzMJk6F1apCSWwMGBJxVNNCGliPkMS0aPA9uyE9a2n/hk7r4SHD6Z8FLNAQYMWAyp1R1QpW5DD2iF4v77CSoGJN5qaYFyquV5INxb9DFMerDwSFSff//4+9JPDiuVFYppmL0FljWv9/BZrsWxzgXWoEAR5zljUnkS3ZiIt6IvKAQ5yVl9XliuC4RAlgmxH0yp5901maGP6dEhYpTlwI1Dg+zsC8N6Z7xCw75mmwk45aPldezdmOmXLq7C7BgjBsnlgwAzPV91lBDHnJqc5Dlf8NQOAwTI0yopA8WyH6NoR2Xe3ZXMMdTCaq6siRouQwD7Kk/HOAAriz7UmxrPRyDSbiAIQ+EvdRd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kPvLbgjvkSNiq5Gxj2UkJqNAd0VLOGUx4SRN+oi6Dycl0Ruaqc+fYbmZ+DHH?=
 =?us-ascii?Q?H6XqHbhUSNlrJBOgDyDudOWudNs9aS1wQ/OQpiwxS1d+A0cEOXc0JhlR4SHT?=
 =?us-ascii?Q?h8KQ8r9PZUksjBYjhMPKHIXSnGKDCbxzr0J+twqPFSVIbsHKI2ogwI4opQUR?=
 =?us-ascii?Q?yZN6gE/6YwGBBcvYNad0cjp2/pXz20LPTQFlRRV7d0QJtqp7zDxV6WUA0tv6?=
 =?us-ascii?Q?cmux/4VS6oiP21mtFLUPJXIE826n2Xf4tc+iql21fJYM2l48XqCnBPV1hSFT?=
 =?us-ascii?Q?nAkrz6ex0ul3JQX8r8UibnPYI/MzRDaLg59uOC1OpvEjPYab7Xmbdv5m8LW2?=
 =?us-ascii?Q?/tsnAXvYEBegCAM5oMlmCDHuz9x4rnHXAB8GHFv8ZmaO0DIp7Z+k0tZYFHGp?=
 =?us-ascii?Q?e6sSW74gerbyh/huiutskm745jA6DB/X1bU0HatNqWLvHSRr+lirjmb/TOMm?=
 =?us-ascii?Q?1Qkvs2p2mBdDKLBBN/Alwzg4ibAmrP7LtjVALtf2zIuMij3LSat1nejRKNN7?=
 =?us-ascii?Q?3hDk9kMAlTZpRiC3696OtDBbkYZzWZVvC+MAKPUZOFOazpEA8gyvnCQlYJQe?=
 =?us-ascii?Q?VbAgbj2BODyfBbdzj6ed5Z7VbDCJ1hLfwkfCpff1Cs9l3+I5K43qk8DBKPRW?=
 =?us-ascii?Q?JsYTv8uoSz53Uw0anMs3+1/P/Jq4a8CgESehkZrPmRb3L+xFLsG6QFJ3DEVT?=
 =?us-ascii?Q?cGF2OppLdyJXy4nH2lyRTuhPqge+T7gnU7w6/x5EW+kl/n0JkIlb5VCDZW0k?=
 =?us-ascii?Q?GgBIogDdA1Dajrk5/UhcOgGtENVjrXtPLv697WCp1LCqeTfMyPqliDwEkNEK?=
 =?us-ascii?Q?2zQuquXAJjoFpUfoH4gs3uc29As0cSPFkIg+kYQ0LN9gkKZP1BviPQrmo9GK?=
 =?us-ascii?Q?oJRC16whFCM2N8FQUXb/r0ytqkPmj/QMJ/zQgM8Q18/Q8sEtDSpeAmt2k9ne?=
 =?us-ascii?Q?95iLFOvfCpnJRvzeLwA9utRd/BC7kpLvtbTDGzcsUpkiLJ5nd2nIymDn9koJ?=
 =?us-ascii?Q?Le8G0g71pl47LGIeoUuLpx8P6En9fCG4G4l+/L+6YBaixQkn/0uq6983RIpE?=
 =?us-ascii?Q?7eSU55QTVJpxgsxVnhU8lQoLkXXeY2aXTVKHQrYbx6/LbyNGBiqSsSFYTgbZ?=
 =?us-ascii?Q?tblvELdl6zOjL6rv29kRjwxmlVg3jWrVMZAFm7MkGUkWD65276YdJ3tBCSW1?=
 =?us-ascii?Q?MGIIynnpkaHhDi04EYT4dyctXhSxZUOzLye0AfHK5algb+OA5q7Y5T3JItm5?=
 =?us-ascii?Q?DCFAKwYFZWRU/GkgSWCGx3u8Hcv9M9YYv3rBPhaUMWLZdTrmk3u3pRY+2W77?=
 =?us-ascii?Q?XaULz6LGl6XDeIFO/59dFhciARtWQafkTnhwEm9XgR+SRXrCTvQc42UZONFG?=
 =?us-ascii?Q?uX05lwxj90LZRBsiPJFuP3qCDuQ00j8PCCFTExqP2QpfH7qP3eKJOKA9bvZR?=
 =?us-ascii?Q?WMeEY0hEBjFMbkR2C1mp861uT0wpqSPqx/SaDyFAiXdcPKmqYPgKuU6cQZqA?=
 =?us-ascii?Q?/LGiLDbq2KXEL7XTa6fwE8I4pvmqh3uUGoqlU1sWe3i7cW2O0zdFpURX+G63?=
 =?us-ascii?Q?fXxzVy8CRWsv3h6VTYe9cVlIBjCmTm/yYMM05P3brWongKjg73t91o5UUWzl?=
 =?us-ascii?Q?NDoC2f7Dcp87KPB10W0SskYio774QZZeIxAcwoauMRdqQde/oIN6uHHpqJz0?=
 =?us-ascii?Q?gz9n1Cz1/9vGNDomre6M+H1xiCqXxh6LFCypAsaefxAhLTJHwSnEGLj/zxr4?=
 =?us-ascii?Q?ahPCemjuZw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416a00da-fda4-42e6-a8a3-08de8f76ea20
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 22:43:23.1408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m38ispHqkDxK5w18ai856GNJ1WrjAa1mYXkz/KAVSqXc6uJBI/mFhlLQ3LV1bJw5U75P0gtP4PUDxvXqduIK5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583

The SZ_* constants are usize, matching the CPU pointer width. But
device address spaces have their own widths (32-bit MMIO windows,
64-bit GPU framebuffers, etc.), so drivers end up casting these
constants with SZ_1M as u64 or helper functions. This adds
boilerplate with no safety benefit.

Add a DeviceSize trait with associated SZ_* constants, implemented
for u32, u64, and usize. With the trait in scope, callers write
u64::SZ_1M or u32::SZ_4K to get the constant in their device's
native width. All SZ_* values fit in a u32, so every implementation
is lossless. Each impl has a const assert to catch any future
constant that would overflow.

A define_sizes! macro generates everything from a single internal
list of names. The macro takes the target types as arguments, so
adding a new target type requires changing only the call site.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/all/DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org/
Link: https://lore.kernel.org/all/DGHI8WRKBQS9.38910L6FIIZTE@kernel.org/
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/sizes.rs | 166 +++++++++++++++++++++++++++++++------------
 1 file changed, 122 insertions(+), 44 deletions(-)

diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
index 661e680d9330..cbf0a6c0a757 100644
--- a/rust/kernel/sizes.rs
+++ b/rust/kernel/sizes.rs
@@ -3,48 +3,126 @@
 //! Commonly used sizes.
 //!
 //! C headers: [`include/linux/sizes.h`](srctree/include/linux/sizes.h).
+//!
+//! The top-level `SZ_*` constants are [`usize`]-typed, for use in kernel page
+//! arithmetic and similar CPU-side work.
+//!
+//! The [`DeviceSize`] trait provides the same constants as associated constants
+//! on [`u32`], [`u64`], and [`usize`], for use in device address spaces where
+//! the address width depends on the hardware. Device drivers frequently need
+//! these constants as [`u64`] (or [`u32`]) rather than [`usize`], because
+//! device address spaces are sized independently of the CPU pointer width.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::sizes::{DeviceSize, SZ_1M};
+//!
+//! // usize constant (CPU-side)
+//! let num_pages_in_1m: usize = SZ_1M / kernel::page::PAGE_SIZE;
+//!
+//! // Device-side constant via the trait
+//! let heap_size: u64 = 14 * u64::SZ_1M;
+//! let small: u32 = u32::SZ_4K;
+//! ```
+
+macro_rules! define_sizes {
+    ($($type:ty),* $(,)?) => {
+        define_sizes!(@internal [$($type),*]
+            /// 0x0000_0400
+            SZ_1K,
+            /// 0x0000_0800
+            SZ_2K,
+            /// 0x0000_1000
+            SZ_4K,
+            /// 0x0000_2000
+            SZ_8K,
+            /// 0x0000_4000
+            SZ_16K,
+            /// 0x0000_8000
+            SZ_32K,
+            /// 0x0001_0000
+            SZ_64K,
+            /// 0x0002_0000
+            SZ_128K,
+            /// 0x0004_0000
+            SZ_256K,
+            /// 0x0008_0000
+            SZ_512K,
+            /// 0x0010_0000
+            SZ_1M,
+            /// 0x0020_0000
+            SZ_2M,
+            /// 0x0040_0000
+            SZ_4M,
+            /// 0x0080_0000
+            SZ_8M,
+            /// 0x0100_0000
+            SZ_16M,
+            /// 0x0200_0000
+            SZ_32M,
+            /// 0x0400_0000
+            SZ_64M,
+            /// 0x0800_0000
+            SZ_128M,
+            /// 0x1000_0000
+            SZ_256M,
+            /// 0x2000_0000
+            SZ_512M,
+            /// 0x4000_0000
+            SZ_1G,
+            /// 0x8000_0000
+            SZ_2G,
+        );
+    };
+
+    (@internal [$($type:ty),*] $($names_and_metas:tt)*) => {
+        define_sizes!(@consts_and_trait $($names_and_metas)*);
+        define_sizes!(@impls [$($type),*] $($names_and_metas)*);
+    };
+
+    (@consts_and_trait $($(#[$meta:meta])* $name:ident,)*) => {
+        $(
+            $(#[$meta])*
+            pub const $name: usize = bindings::$name as usize;
+        )*
+
+        /// Size constants for device address spaces.
+        ///
+        /// Implemented for [`u32`], [`u64`], and [`usize`] so drivers can
+        /// choose the width that matches their hardware. All `SZ_*` values fit
+        /// in a [`u32`], so all implementations are lossless.
+        ///
+        /// # Examples
+        ///
+        /// ```
+        /// use kernel::sizes::DeviceSize;
+        ///
+        /// let gpu_heap: u64 = 14 * u64::SZ_1M;
+        /// let mmio_window: u32 = u32::SZ_16M;
+        /// ```
+        pub trait DeviceSize {
+            $(
+                $(#[$meta])*
+                const $name: Self;
+            )*
+        }
+    };
+
+    (@impls [] $($(#[$meta:meta])* $name:ident,)*) => {};
+
+    (@impls [$first:ty $(, $rest:ty)*] $($(#[$meta:meta])* $name:ident,)*) => {
+        impl DeviceSize for $first {
+            $(
+                const $name: Self = {
+                    assert!((self::$name as u128) <= (<$first>::MAX as u128));
+                    self::$name as $first
+                };
+            )*
+        }
+
+        define_sizes!(@impls [$($rest),*] $($(#[$meta])* $name,)*);
+    };
+}
 
-/// 0x00000400
-pub const SZ_1K: usize = bindings::SZ_1K as usize;
-/// 0x00000800
-pub const SZ_2K: usize = bindings::SZ_2K as usize;
-/// 0x00001000
-pub const SZ_4K: usize = bindings::SZ_4K as usize;
-/// 0x00002000
-pub const SZ_8K: usize = bindings::SZ_8K as usize;
-/// 0x00004000
-pub const SZ_16K: usize = bindings::SZ_16K as usize;
-/// 0x00008000
-pub const SZ_32K: usize = bindings::SZ_32K as usize;
-/// 0x00010000
-pub const SZ_64K: usize = bindings::SZ_64K as usize;
-/// 0x00020000
-pub const SZ_128K: usize = bindings::SZ_128K as usize;
-/// 0x00040000
-pub const SZ_256K: usize = bindings::SZ_256K as usize;
-/// 0x00080000
-pub const SZ_512K: usize = bindings::SZ_512K as usize;
-/// 0x00100000
-pub const SZ_1M: usize = bindings::SZ_1M as usize;
-/// 0x00200000
-pub const SZ_2M: usize = bindings::SZ_2M as usize;
-/// 0x00400000
-pub const SZ_4M: usize = bindings::SZ_4M as usize;
-/// 0x00800000
-pub const SZ_8M: usize = bindings::SZ_8M as usize;
-/// 0x01000000
-pub const SZ_16M: usize = bindings::SZ_16M as usize;
-/// 0x02000000
-pub const SZ_32M: usize = bindings::SZ_32M as usize;
-/// 0x04000000
-pub const SZ_64M: usize = bindings::SZ_64M as usize;
-/// 0x08000000
-pub const SZ_128M: usize = bindings::SZ_128M as usize;
-/// 0x10000000
-pub const SZ_256M: usize = bindings::SZ_256M as usize;
-/// 0x20000000
-pub const SZ_512M: usize = bindings::SZ_512M as usize;
-/// 0x40000000
-pub const SZ_1G: usize = bindings::SZ_1G as usize;
-/// 0x80000000
-pub const SZ_2G: usize = bindings::SZ_2G as usize;
+define_sizes!(u32, u64, usize);
-- 
2.53.0

