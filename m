Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010042.outbound.protection.outlook.com [52.101.85.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0933859D4;
	Thu, 12 Mar 2026 03:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285317; cv=fail; b=ARdQ0vYYWbR9PL0uytr10t/GqM81fRx/I3ITrei0bwy/7qlzWZwvPq/zESaJ2CyS73JsrgNlsdZIVvRIfflgrPy7F1sz/UlzXT5kNDqTuteaRZ7B7LLJViF0C+WZ/VvE5SxSCqRLVpfhDCMxLgWiisXuRx45kPiq2Mnh30fnook=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285317; c=relaxed/simple;
	bh=pDCerhniYM27zjB667cIwoMgJswvughoCKeoy/jggHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lTrKIsYoChs2p+y+Xvvw7Q/35rYXTpiv5KHs4jjpVS4NwbmvG8Mituw9zzVy36wMOiEsWD6VTwnyZGBW0tON2HkeTUP0NhZnWCu4bmcXMVwbEvZGeH456KNFUXKXXhriusMLPfdg/OLecONDoqUBFfkvcd2P6dIB4I/3RBOaMXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UsadyFtk; arc=fail smtp.client-ip=52.101.85.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UsadyFtk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdDB4wvk+ugOn0zFmijYjRAyCMxulBtWCZsu9Rua7C/3Vt48EuYr9wz1uwc5MyoBsxRJeHs4+lhfLkcyuQGcTL/hSIqsW9t8u/iDYks1x2pTEy2rIWhGcjFJcDyMrZ/4HinspbEcu4oyCdvSySH8MC52uvtpy7Lldj8IxbQaaicZUBWhAX8+xGh9lG/dBMxObZmnVYy/OdKZc702jwNhYsXAuCSohLj3qPV1qQxkoMSQ0OFt9uPVs4A1dKIMjPkCk2b1Kp4reG0Ao7ihyd9+OUHob7Nh7CR33jpgyk/cWmbHzAt2Qwa6DORLq01hfu/whfSxTo1yOhX0GjvfhhKYFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6IZ5YMMXYDG6IUt6xVk53VKoG0C+5B6FSgeiPw92/o=;
 b=kA3ygpP3VTu3VsKHbBT3eamvcEgjw430acsc93GWfu1vOM68cWI0y4xQ5nF4PkNGm9g6xOLYkdYvtBzKvNN2+rIOeD0ZxOwCqxXL0MZG4s+4vS/kJmf5E7zbeeYlC1LcEMbtsSaLZV9K4uLEF0B2DRdqvdLM1HSgqqLK5kUzereiWqdVcgAvDee1cbHoU6if0D0IUXDBkVhd3VUbJtJSNO/jEpdZrjM4PyklRduilLZyYdlspBW2itVMZbNZPwADkXivZ+9tQxi6zwgCi8mUjViTWWdgjJh7GBoNFPkQYaDnCJ1InIYW2rzmxin+k/+m8OZI/bb5PaVTdYHlE/Nj1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6IZ5YMMXYDG6IUt6xVk53VKoG0C+5B6FSgeiPw92/o=;
 b=UsadyFtkGJV+NR+nYZ0qZKwIk36coLOe4GFGFm5oHhtZtSD7hp6pG4GdTUzhvKn5GIJPf1doZGlhvukubsNMfAvJihsSEYkm1jnjSNxntABOEZhov962RBZZR7BwYQnQdZRHQRubLaYhJZqH0NYntyVPh+V1/ojDKnmVE1aJqdkwV66KLtkQ8lG8dZZL0AbamVO/OZlXT53YiXdmn+E0FP0xJ57sohSj0WRxSMCJuyqg8St98TCdHy0VT3+A0mDmYMlpbbesVYptlE0m/J7xOBxCyxtGMg4UxQDPeyXqqtWs6H+AbVWPmrvZgvuP/MMZyOsnvjB02nKtQ+97fVwvWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY8PR12MB7563.namprd12.prod.outlook.com (2603:10b6:930:96::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 03:15:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 03:15:11 +0000
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
Subject: [PATCH v2 1/3] rust: sizes: add DeviceSize trait for device address space constants
Date: Wed, 11 Mar 2026 20:15:05 -0700
Message-ID: <20260312031507.216709-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312031507.216709-1-jhubbard@nvidia.com>
References: <20260312031507.216709-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY8PR12MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: df099819-b239-4e4c-6e18-08de7fe59219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	b94ds3JgsAGvtAzmqHJmONgE2L+4Po4PvbVwjVENRO9wdDz21Iv7exlVLdQK+WibTYcMSc7WxO+n2KdqVdVLqsQKR8yjzF39EGJEZ/XK61lZIlRTYEsl1jHENW5KMhzdIARowSUWWqGoETpRVo3ZHDf2+szSAuq4AjpcP72koZnPMcPSnOqnSr/NiGHrf8DhH2s0hjuqXYZQPQktjV/Se1llE9H0Dm5K/+rsRskAGNlt+nLEVLt2d3cp5Pd2u06BcBghiCI7vCk7Ge2uZtXDYbOfUrvxfEk2j+AGq9Xn0u3VFy+mHC5mr05FaPxiatmgHF3PsMPpmoVcriCg7+1dA0LuPE+SQtA0YIURwcjs8H6Pkt3QtnYv9SpKy0+gni54YOUjKckNgj2j58qzjuCRNi9MGWHUNytNrVDa0sL7dX+Agg28cLag1nJ1timCfvmL58hcSLrDeWgXvqiy0SpdcKgy7fGQrrBbIUJTpwKmcnbvB6xaKseZozmMWrpsSuZssNn5DPMurcOR7sHR4vqWaAIwXg7gSjmsXBH+ez0civnTCGScl43fuua/pXTOo4BDfNSc0S5hXb4d5CJxzSJX2e4AkRf9iXygxWGU6f45nU2e1H9j5kGizT19xER8CQdVft4E+YatuEgWrdZrYr9lXkakzDj+ZXmIc4q3U0sdBr4wrMmCcptfBW4yjOMx9121WTFy9ozVkoKx+6Sr6mlueMBfVTWoMr8oNOGLpFglYyrmnjlTW6ehX+ygP28ySB+y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hdHLxjYQFmA23c5R6ME401wkTAXhaxb9+RZFOZ2NE4tixQIo9EVLCKyrjL0k?=
 =?us-ascii?Q?6vOT8zHTgRU83KODJZ01KSiWRGM6qxeOek8AtGH6a7FB0qYKY7k2xvJwWu/x?=
 =?us-ascii?Q?CSuo3/8r/Nvat+aulFbfUyQjS+kclmHBDmENRFnsehi4IgmSQfrE6ogvA8z2?=
 =?us-ascii?Q?/foMTNiYVI7u3YOq3aIHe9W0xZG70vVthO31qvFu6xgRZ51nM03V98FkVMRE?=
 =?us-ascii?Q?E+CM1OzHFbXnsIs7LndOE2jwr4ecaJ3XuIDf4BzUfyWstZD68jTZJemtFuxb?=
 =?us-ascii?Q?/X9w0lCoZraADdbmyZjeKFAKN4zg9TdrsmvSajzK9ToCzvg9egy2Fj8L/AIG?=
 =?us-ascii?Q?+eEuEMBErTq9m+qukTPfoK5j3uF+ZU4zDKnZzVGSLubxw9cffC41IWNFTOfv?=
 =?us-ascii?Q?WJBTFni3sw3HPO3QhhcLAsQOqUmpwHPtLLaNKwl29yhW0LTnIaLsL3SqBtmG?=
 =?us-ascii?Q?WuE/wyVXHfMW0HEc9P2DFs5Zh7RIewp+JJXjfQpnstelK7Sz7gCDCXD7cPGs?=
 =?us-ascii?Q?9vb3auCIm0nt33kokU32y8CO6K8VA/wZ2iVZQ1tlDsEi71+HXikGRuWUF7FL?=
 =?us-ascii?Q?GLcot/VNSbimbweBuMpJ92+BHo4GrKr+4zutVEinm+07FXgC6J5qfWaVhOar?=
 =?us-ascii?Q?8V2HrMQ5FarhfxCmnhnn5kiUs3+eLcN8Jm+Gjlauv8ZRc6t1u2grNbhJE9Rh?=
 =?us-ascii?Q?I1gCVoQahXWHxMBPNhY+LNMiEA4t/L07dHutSvRUP/k0Wh0ikkbeBEnneAVj?=
 =?us-ascii?Q?QGMa53Di8u5HYR3AgqdVA5Gc3nHJDoRINXfGcQe+X0hVtksEQz9iHj9U1P2W?=
 =?us-ascii?Q?fgFVNoOGSHydaKd5FN/Vi/zpVKXlnI1sLEEa9JCgVRmul67Zy2Unjb2oju+Y?=
 =?us-ascii?Q?3wDkVcMwx/ER9wi64q8DPR7aEBKovrk/h4odZqKvweatv4qfiYRadaFYurjZ?=
 =?us-ascii?Q?BS5v/SD6s5VyGqegl4sWDlleSPnwW9bogI883T38u7JdpRumjEJLhKkmMnWF?=
 =?us-ascii?Q?4w0rIXQf0Xz3tXyG+hiKgg9obGZu/qKcfMCq5KNw9oOL6UMglvhvkQwaFYSE?=
 =?us-ascii?Q?MJwFqjs0Z09yPyS0V205RoXuvUywlsLeTVeBARVx7RP/qJz8XzFVKarM6C0U?=
 =?us-ascii?Q?fTT103VhYj3v2KzU0HhmzMqqfgeMmhsuf1ZqDiX4cEVOxF36kjp9cvHde+AO?=
 =?us-ascii?Q?tTyVEOTa45T+D2Sr4BMJ9F2+mqzo6H1JL3KjiaHffLwkP65lsTE9/n7Oz4sS?=
 =?us-ascii?Q?oWrt4K/5/qmU9r4RuTs12cPFHdLz96SrSHgMozZD79ivu+xMB2IyE75p2q3A?=
 =?us-ascii?Q?468bDwWX3rbZ3wJG6STfV6+POQ/XlO24I8I5RqyB9sy58RqdAkS+3Z/Nismj?=
 =?us-ascii?Q?7imgse7tmX73dSfvD3YHd/BYHN+JHPFkPxD7G5pveYR4KVj3w3L/vnL6SlE6?=
 =?us-ascii?Q?iUyuztN6ilGGYZT0Y23a/qDacHYS7IslFqKCr3R8kVbw1vs6zRN1/JQMBmiI?=
 =?us-ascii?Q?DTdLU0wV4TsdFlonzgV8b7UpldXnnBgWWElXgYqtS958jQ4oK+kGvsOiRgEW?=
 =?us-ascii?Q?fi88CYfbazS9IqWJNYAoEXqHo6z6eLZAOFLCi7fqvPHviR6tvrrKk9a6JK6Q?=
 =?us-ascii?Q?2V8/xtBSsiW4sHa2VwYe4uCnRgKb1/wmQcVwh+Nj3aw8skhp2Np52QTYdzQa?=
 =?us-ascii?Q?4SnNGGalR3gdbLvFGH3PbnCQTdOqMSJqScjmmXZ7vgkuOS4UQnWw3isp31gE?=
 =?us-ascii?Q?umj+oigCzg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df099819-b239-4e4c-6e18-08de7fe59219
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:15:11.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaed4XTaRvXJVgP4bHB+ThVRILvhK062VcGmNvHCQrmHfTAYofPlK0AzVrf0F/mFMJqBSpXS6iv3XqUyjNPm4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7563

The SZ_* constants are usize, matching the CPU pointer width. But
device address spaces have their own widths (32-bit MMIO windows,
64-bit GPU framebuffers, etc.), so drivers end up with repeated
usize-to-u64 or usize-to-u32 conversion calls like
usize_as_u64(SZ_1M). This adds boilerplate with no safety benefit.

Add a DeviceSize trait with associated SZ_* constants, implemented for
u32 and u64. With the trait in scope, callers write u64::SZ_1M or
u32::SZ_4K to get the constant in their device's native width. All
SZ_* values fit in a u32, so both implementations are lossless. The
u32 impl has a const assert to catch any future constant that would
overflow; the u64 cast from usize is inherently lossless.

Replace the hand-written constant list with a define_sizes! macro that
generates the usize constants, the trait, and both trait impls from a
single list of names. Adding a new size or a new target type requires
changing only one place.

The trait also enables future generic APIs that accept T: DeviceSize,
so shared infrastructure can work with whatever address width the
driver declares.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/all/DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org/
Link: https://lore.kernel.org/all/DGHI8WRKBQS9.38910L6FIIZTE@kernel.org/
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/sizes.rs | 132 ++++++++++++++++++++++++++++---------------
 1 file changed, 88 insertions(+), 44 deletions(-)

diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
index 661e680d9330..6b11ec6d97b3 100644
--- a/rust/kernel/sizes.rs
+++ b/rust/kernel/sizes.rs
@@ -3,48 +3,92 @@
 //! Commonly used sizes.
 //!
 //! C headers: [`include/linux/sizes.h`](srctree/include/linux/sizes.h).
+//!
+//! The top-level `SZ_*` constants are [`usize`]-typed, for use in kernel page
+//! arithmetic and similar CPU-side work.
+//!
+//! The [`DeviceSize`] trait provides the same constants as associated constants
+//! on [`u32`] and [`u64`], for use in device address spaces where the address
+//! width depends on the hardware. Device drivers frequently need these constants
+//! as [`u64`] (or [`u32`]) rather than [`usize`], because device address spaces
+//! are sized independently of the CPU pointer width.
+//!
+//! ```
+//! use kernel::sizes::{DeviceSize, SZ_1M};
+//!
+//! // usize constant (CPU-side)
+//! let pages: usize = SZ_1M / kernel::page::PAGE_SIZE;
+//!
+//! // Device-side constant via the trait
+//! let heap_size: u64 = 14 * u64::SZ_1M;
+//! let small: u32 = u32::SZ_4K;
+//! ```
+
+macro_rules! define_sizes {
+    ($($name:ident),* $(,)?) => {
+        // `usize` constants, from the C `SZ_*` defines in `include/linux/sizes.h`.
+        $(
+            #[doc = concat!("`", stringify!($name), "` as a [`usize`].")]
+            pub const $name: usize = bindings::$name as usize;
+        )*
+
+        /// Size constants for device address spaces.
+        ///
+        /// Implemented for [`u32`] and [`u64`] so drivers can choose the width
+        /// that matches their hardware. All `SZ_*` values fit in a [`u32`], so
+        /// both implementations are lossless.
+        ///
+        /// ```
+        /// use kernel::sizes::DeviceSize;
+        ///
+        /// let gpu_heap: u64 = 14 * u64::SZ_1M;
+        /// let mmio_window: u32 = u32::SZ_16M;
+        /// ```
+        pub trait DeviceSize {
+            $(
+                #[doc = concat!("`", stringify!($name), "` for this type.")]
+                const $name: Self;
+            )*
+        }
+
+        impl DeviceSize for u32 {
+            $(
+                const $name: Self = {
+                    assert!(self::$name <= u32::MAX as usize);
+                    self::$name as u32
+                };
+            )*
+        }
+
+        impl DeviceSize for u64 {
+            $(
+                const $name: Self = self::$name as u64;
+            )*
+        }
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
+define_sizes! {
+    SZ_1K,   // 0x0000_0400
+    SZ_2K,   // 0x0000_0800
+    SZ_4K,   // 0x0000_1000
+    SZ_8K,   // 0x0000_2000
+    SZ_16K,  // 0x0000_4000
+    SZ_32K,  // 0x0000_8000
+    SZ_64K,  // 0x0001_0000
+    SZ_128K, // 0x0002_0000
+    SZ_256K, // 0x0004_0000
+    SZ_512K, // 0x0008_0000
+    SZ_1M,   // 0x0010_0000
+    SZ_2M,   // 0x0020_0000
+    SZ_4M,   // 0x0040_0000
+    SZ_8M,   // 0x0080_0000
+    SZ_16M,  // 0x0100_0000
+    SZ_32M,  // 0x0200_0000
+    SZ_64M,  // 0x0400_0000
+    SZ_128M, // 0x0800_0000
+    SZ_256M, // 0x1000_0000
+    SZ_512M, // 0x2000_0000
+    SZ_1G,   // 0x4000_0000
+    SZ_2G,   // 0x8000_0000
+}
-- 
2.53.0

