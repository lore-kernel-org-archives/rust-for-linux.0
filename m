Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B9E3CAE7F;
	Wed,  1 Apr 2026 22:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775082487; cv=fail; b=WTqcVAp32FfrhMDi+EeE+prXP9CuH/Bz1rTcl7sCVSy6Atuxp7cAhwWFdE+a55HIF4OtKsoWT5S9eHS7o1PY2SqKaP3Ag6zkWlc/+fW1wgdbBArzY5ZG6LIJ+qkdL8W0yj186LqCR8x3US9EC8AlmtmKHFNEao+VLhoXqtR9jDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775082487; c=relaxed/simple;
	bh=FiH8HvkVkzulMpErXrfOBaIcvgfDHhZjMeRGCP/zwLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q2zj0ieFS4IS0MRuUt0JY0tC/3HzpmHSy4sKcpWw4xC7Q1YyvEjl2im6uu621G0XlDvhahbw2F61Kl5OnS2bzQSklGTVim6P90IIFo3YJZTuaVwkDj/IEe9nV5+2F/XxgpEsRMyXBOCfIX5LWbd3K8CZ5J8APKgvMcZWsw4lHrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JW+iucRT; arc=fail smtp.client-ip=52.101.56.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JW+iucRT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXlepAvLqMqBmzoY/y5cc44KfKpB4IJ562hFVL4wUPbmOYmuLfQ1o9/SeVfwYae3nFam5bJxfoXN3N71OMI7+X7CTDIE8qEUKuiQQ3ymtZxGgfdPCHKPmjdFPJtXTVynKdS6msvnQ5n63COk5mX7Gc1EoHcf5/+VQi3rjeTdooUz8mSUIUQ49KFzD2KmcNj3IwQzi2k9ub2gWxdsJ7cT9KN3CTrQ5ggqfElp0Yn5eMuvsPBe4K4zCPACMRHduzAolIbm7tPn9GyASiOHz9REY8FF3p6m9SWKw8NPtflfy93imhiUfDu27bBJ3zJfS79WZzgN1pTEJzdnHHKzd9FIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpadJ8SHBvIjb1Fe+HF3HmjMDPvofb6rWyDniYQewh0=;
 b=x7EkhZOqM9jXSoN6PDpiOM4yAWtOV/ug0CA/mYmgDnWTPb7uJ6sVBVVgS95vAtz10d+68ndpsiBHtc5NqxglOsImKtfwfHsdQ9uNs4Uhn5hT0cW38u7Q1XzhC7HFQ/hytqDYIyETdRG05Pj7dJw1t58NxPTkKFYl0wvZNQKPCGhonkZeU4V7ewBIdaV6tfwnQkn0jQ6O0mS20VH3VXrb+aGO971CwrN2GWJl1WTRCPTcgjfLhzOnssJ5k8icWaiRnq9wZ1bP/cZF11qyGeIVFWz6grlqpYpUU9JnVq9FQ3bCzNgv/c+fptEDuokdSRcFxHt/QG0GyQbUd/+9CGUJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpadJ8SHBvIjb1Fe+HF3HmjMDPvofb6rWyDniYQewh0=;
 b=JW+iucRTPBwidssgrUnXs9aYjI+z1hHC4kog7IfUM7JX8D9AEYXWNJHpbtLmw1iiGL3kgWqRq2M6qKSyT3e20HtcPgeqcaoB5JuVjGXKDbVKlJ7HHp0NZxqGTRd+11uI443IDr1bXBCoAx2AXTxPI+3ewm582H4hnb/vOt9m07TtG/ymycMtGLN27A88yZMxhKBBrvYVUWWSG7vFWIL6ciE26Ia/ceVPs7/T78SXFA3m+uEWYgX29MGao81p+wyEAHhj+c21Qh/mbs0CZfohRCYWcpNND6bZNTMR+9Yofju30DEhrIgwQ5ip0LzIcdC+IKNF4cSLEpR0IThL7VaaaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Wed, 1 Apr
 2026 22:27:47 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 22:27:47 +0000
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
Subject: [PATCH v4 1/2] rust: sizes: add SizeConstants trait for device address space constants
Date: Wed,  1 Apr 2026 15:27:42 -0700
Message-ID: <20260401222743.148710-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401222743.148710-1-jhubbard@nvidia.com>
References: <20260401222743.148710-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: fa93aeff-ea30-47cf-18e1-08de903de6da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6YpNQK3XLJub3wsd2G6r3enprkrctQToQQ0GYH+KVWcTJoZcqj8dtZGUawhFNd0vMFaoPp8gAMtqYYcs6ZluUMMRI9wmmQ5/QobwYPdArkrRkMHM4njZHbGYBtjXvBELSaK7L8ABRt7XnjxEIVuNvg1CelxviwTC6nh+NVPsqI7Xbal7bZqvJgKVkmtBujUwMpvbZVySczgiZ4FNlZOlqjG+NP0Ux0BTZt3gPaKgA/Eb8jeiIDj2j6wfOEiFzTBoyfjf2MFxsKcjzKdE4EYoAI1PoM2QQjiMdfs6aQXZo14ImNrFF4gZq1/0F/fqO1tiufVRmIgEAmFytMKBKC4RMDxTP1X7EXwDUoPO3gzbnZxXyoyAFNR8invoyx5hSAoEenEa2UneImPewmM+fjJZ8YSy643saoazFM6RYlrgB2tQFfX2P0Bl7ZKpwguKFprzDO/Wq0nKIHOHvfMa7G3BLa6zSEjxqrCn63qNQUPdIN8BbQd1hRHDIi0ebRtSKiw+zzCR4SG8qc8CR1eoZm2qn+qUxxEqSi6rSvr9dB25XZjWjSZZHrn1Zf2Ujfda0E4jvqOQn3Y0C6ojF5rHMO0/uMqxVM5uxTXX1smoni02585PcmrMy6OOZJop3FuAGjj77HREIxq9uXPq69cKO16++ALh4OG3paYC2SIxC9AUH7XXpm7tgEvShScWU8zt8KoO6WNKeRXia3qqxkJ0orBIDg+C0+dA4026oqOK8aw66ms=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H1RD9JgCGjLPq6i5TyRposK8DIrfc3HMQ5zaDcGLhXB0zLndRFfvmiMnQ1go?=
 =?us-ascii?Q?bhaUKecJWUxmTdl2doyExnf5tUMRi+Dw/9IevWA9Zz+tlhct6TOvi8qc7yeV?=
 =?us-ascii?Q?+AtbuehfktycaYBlzju3jd30RNiyk2indYMlxWhUMTt9iVYKAqDU5jDHsaqy?=
 =?us-ascii?Q?gcC0FJGqhHn42dKqE52XPeWbs+sjFBXfVOVLkr3nU7itceL1GkFVR19cMEJ+?=
 =?us-ascii?Q?lgu/ZqFhoo4Aqo7rmOeAeS/ReGO9EkUNTdDnwj96M5JU8MOCXVxuuXMJBujl?=
 =?us-ascii?Q?kkrk+I4e4r4LNdeAqcE+d8ugDAhubhM9w4xfs1/Ds6dba5KLyjldJ5DTVgJ1?=
 =?us-ascii?Q?lzqOZMX920CBCBk2ekLygJlodTwn3wy8fZVifEOtZ2dYJBQuyXcmmls5TGGQ?=
 =?us-ascii?Q?WhjEzZ+shwlCDFsF8DZKNLeiVCuwRgUiJNXC81KVT8PAGVmWBkgRvUCIPCme?=
 =?us-ascii?Q?BBCz3d3nNJusjGPMY6TkSbK3l82ApwTXwpLO0GDQzhQOYzzCeRcT9Zqp+k2n?=
 =?us-ascii?Q?1RezyRCuX7bvQzXeYsGfaSnvQ/ohjR3pBbTMREeD7tbfdwXeB/SKD6zCf/g0?=
 =?us-ascii?Q?Yq3mW5bUKibTym+Jw4EUCDk8rJw7HTkawif3lDMfL8R0xy9W8bzIshaRT9D1?=
 =?us-ascii?Q?RpovYqYY/pejdUcn0MPXM3igDfpZLp+t82ku/in1EBR8EbeDWHVk4BXPjkGg?=
 =?us-ascii?Q?kJBJQGgI5GyXt9EzPMUMWJ4rTkpH4T+BeQSQPqSGIGChCji6Zr0Khv36QIfZ?=
 =?us-ascii?Q?DJTxWn9/nKcjYlkZ83ffdMNII532s3SmiDIWNbcKe4IomABjPO6kGg9fkssg?=
 =?us-ascii?Q?Ufz3x0CSJDIQHGigd790i1JBY6zuNyoAOwTEJ7tJLg7HnpLsvhLpI+pbozsO?=
 =?us-ascii?Q?GB1e7w0QEtI7MyvAGkH/pE0Rn+JbT185lKe+Qx+pjVve0olj5wiEYZVSvxZH?=
 =?us-ascii?Q?KI28LUspGgQsGvJFbkS0APf9flbOgD4olgYZ/a1L3ua7zD5AYDY4D2AtIaRj?=
 =?us-ascii?Q?YemAGySBWiqEGwX1i4n3UgWgDAfJslyUIU7UGfVnm0iOmD7tfKW7Z+C5zCMi?=
 =?us-ascii?Q?6godLfxBdQce78wHH2r8zkPdagE6028nFxTcDisTsN3W5Q6QLo02lOU6vG8l?=
 =?us-ascii?Q?loe9nztpGF4Ba7GOT8oUiMIavtWfQfrscevTFCSUYFbNHVkUnSfHjckXAL2M?=
 =?us-ascii?Q?k8zCR6aI1MIqnpEUcaG7z1aHsMyMXtwkTZH6rn59y/ml7FgAJ/hW3HnXcSrW?=
 =?us-ascii?Q?1QYGRogCIhen2Xq9/AtTq7+jEg+4zcLvik1GIkTZEnHQ93wvVO0eUiZSsw99?=
 =?us-ascii?Q?NfFSd6f7giubzWqYHACDW+bjFr/+cocN/cI4hpiIuSbBA1V8GZfWMyLlWS8H?=
 =?us-ascii?Q?ArOiQZ7UptuenuoAAVpkDM7ouNQQ6c2OV9kJInQ23qjgqRV1W7VDv4Jv6jiT?=
 =?us-ascii?Q?FtWgOZsodC2ehR+VmVdBXWlWWrLiU+DPXHblVkgEpSS3bcsUC7KFXkq/fSy8?=
 =?us-ascii?Q?OZctvEc2THyk/4krJOWuQZ0YgreqXRpJ4p4KgTW8XY5+q9vDJ4/zjW6wmcqM?=
 =?us-ascii?Q?OCVN2vJX0zfAB4R+yGaQOueaM/XeS6XRpbis6n9puvJh3+0wIJ/K2Wu+Edyd?=
 =?us-ascii?Q?x9zbODl1RB4FTZODwG9CfEibfRI1IBYYhkPu29cXQAw538OgYxnKkLvo3dmg?=
 =?us-ascii?Q?2zVSYPIPkMCFEpFJvcO/hHVJpwuVCjFyx8b02sd8VxeILBXZ6A8JG3QBJ0kn?=
 =?us-ascii?Q?xi7l6koO9Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa93aeff-ea30-47cf-18e1-08de903de6da
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 22:27:47.5435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nP5ep3FBDOrPU64Pq9HFk5lVXWTtscWm0iG1cVjj+sbkufNJ3vm9YhRqlgJRzIEB064l7+wqgf97bbVFYngLCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456

The SZ_* constants are usize, matching the CPU pointer width. But
device address spaces have their own widths (32-bit MMIO windows,
64-bit GPU framebuffers, etc.), so drivers end up casting these
constants with SZ_1M as u64 or helper functions. This adds
boilerplate with no safety benefit.

Add a SizeConstants trait with associated SZ_* constants, implemented
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
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/sizes.rs | 167 +++++++++++++++++++++++++++++++------------
 1 file changed, 123 insertions(+), 44 deletions(-)

diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
index 661e680d9330..837404a2042b 100644
--- a/rust/kernel/sizes.rs
+++ b/rust/kernel/sizes.rs
@@ -3,48 +3,127 @@
 //! Commonly used sizes.
 //!
 //! C headers: [`include/linux/sizes.h`](srctree/include/linux/sizes.h).
+//!
+//! The top-level `SZ_*` constants are [`usize`]-typed, for use in kernel page
+//! arithmetic and similar CPU-side work.
+//!
+//! The [`SizeConstants`] trait provides the same constants as associated constants
+//! on [`u32`], [`u64`], and [`usize`], for use in device address spaces where
+//! the address width depends on the hardware. Device drivers frequently need
+//! these constants as [`u64`] (or [`u32`]) rather than [`usize`], because
+//! device address spaces are sized independently of the CPU pointer width.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::page::PAGE_SIZE;
+//! use kernel::sizes::{SizeConstants, SZ_1M};
+//!
+//! // Module-level constants continue to work without a type qualifier.
+//! let num_pages_in_1m = SZ_1M / PAGE_SIZE;
+//!
+//! // Trait associated constants require a type qualifier.
+//! let heap_size = 14 * u64::SZ_1M;
+//! let small = u32::SZ_4K;
+//! ```
+
+macro_rules! define_sizes {
+    ($($type:ty),* $(,)?) => {
+        define_sizes!(@internal [$($type),*]
+            /// `0x0000_0400`.
+            SZ_1K,
+            /// `0x0000_0800`.
+            SZ_2K,
+            /// `0x0000_1000`.
+            SZ_4K,
+            /// `0x0000_2000`.
+            SZ_8K,
+            /// `0x0000_4000`.
+            SZ_16K,
+            /// `0x0000_8000`.
+            SZ_32K,
+            /// `0x0001_0000`.
+            SZ_64K,
+            /// `0x0002_0000`.
+            SZ_128K,
+            /// `0x0004_0000`.
+            SZ_256K,
+            /// `0x0008_0000`.
+            SZ_512K,
+            /// `0x0010_0000`.
+            SZ_1M,
+            /// `0x0020_0000`.
+            SZ_2M,
+            /// `0x0040_0000`.
+            SZ_4M,
+            /// `0x0080_0000`.
+            SZ_8M,
+            /// `0x0100_0000`.
+            SZ_16M,
+            /// `0x0200_0000`.
+            SZ_32M,
+            /// `0x0400_0000`.
+            SZ_64M,
+            /// `0x0800_0000`.
+            SZ_128M,
+            /// `0x1000_0000`.
+            SZ_256M,
+            /// `0x2000_0000`.
+            SZ_512M,
+            /// `0x4000_0000`.
+            SZ_1G,
+            /// `0x8000_0000`.
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
+        /// use kernel::sizes::SizeConstants;
+        ///
+        /// let gpu_heap = 14 * u64::SZ_1M;
+        /// let mmio_window = u32::SZ_16M;
+        /// ```
+        pub trait SizeConstants {
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
+        impl SizeConstants for $first {
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

