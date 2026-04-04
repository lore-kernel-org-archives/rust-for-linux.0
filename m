Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BFE2C234A;
	Sat,  4 Apr 2026 02:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775268734; cv=fail; b=vA/5o9DkXkNiSVekKXz08OWEQCu268P1q1Zjx5/5MasSS3WV4baYtK9hGwb2TMF0H62xQuB6egiolkC/jH12zIDwg4pIPI5l82FKWshxgj3s3nRsAYCzU4h30MD5sQWdxgBZkdQqVZkTZND9qXXnShAhVmK5vIVasNewyYfdUKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775268734; c=relaxed/simple;
	bh=hYxggNP4XmP1LjI++C0JSF8Ky7yY1XmM7Sne/47oe18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y4ZAqyZVaSqWIdQ4/3neTGrjbOKGlpRiO1QEGIuH/96Q6tmcVryLD57uzfaGbZRTm+JjLqb0f8bn8zDCZE85s3bj/RhwD0Xmf/GmZMGVex8p2iNhngQLO8gBwnHjwX6+mKEBrBDj3X0tzV5QmkPCRCcmNgmrMo6w5bwVyF5L6no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EoS2BgdZ; arc=fail smtp.client-ip=40.93.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EoS2BgdZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8XdXaOV4r/l9BSqd/QeLhxID+OiFty5AQWa8utLrWX54jjvRVPE+GTRlGl45ekOWGwdaDmDAM+dTWIpfW9zjLyyQrtBbOsZoAw2GuXG1yoGvf+jQK9dAWDF58Swx4D9Y3dYm67R1114XPljw40aIoFsmdueFg1ZtzVzaRpcmf5SzU1SEZ9XPqpkGeiAntS1im0plN30d5jn50eDwXpKwCD7R6ZemlbfaighUo3Rn+6qbtHPTClXiWc+z8p/7uusIS8zt4tgEFHkRVmgEeAm9kQUMOI/XGjzh13xcRaaHAW/gypDd/xhKzWzmUrxP3UEVsoP4vSPJq7GkdrqDafKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qr4mi/8iLRKdmgRNxGhhtXWc3GjA3JBVP32XNmJ79AA=;
 b=SqAUlL2eyfj//h4QQfeS1F06mB9d46G1MYtM/58kSpfY2a8e26WPCYIE+NP9TtfT21IO4HDvnNMdgzP5StqEFPsSNe1Q7Jvuj5hak3g9yEY1BanvOGXMP5iXG2BF80sWx6l/JUGFyMxBdOZ+/2jneZsOzlQKsiTHT7bFSbpoe3OHZWq8PYeCiiBPvwqJhNWIJvUm1ojMFKALJV/TAEof+S+Iu+dDeIqJD0RY5hHrV0lr579nwXiEYmO62k+8viXtwtVmmNmBxRZnSHGfZtRDcRmbyCajpPGjgk7ri3e4lYI/4b55PlzVibWvFTRXAde/X04meLlajf5/iZj/j3UnUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qr4mi/8iLRKdmgRNxGhhtXWc3GjA3JBVP32XNmJ79AA=;
 b=EoS2BgdZd6hyXvGs57ysShG5opIgMvwqsW9OTNJ8tGBQRCwIg53z9/tKkoNlJ2BHXbVn/V7IUkvTdcAEFLNslM/wHKR1+YCHcwEWoz09X0Sp0TvlTToo4qDDTlbBC65Jb3Lhul2myBV35RZ2+ee56w9rfrqz9/QyXKre1Kf6kdhr/Ph8Yy+I7H4qDrRFFc7QOY1BNDM4GgdhlIhdzC+RvDKuqYk6cKIdDIRCEpytkG/DLA2hH8Nf/OfXSQajzSPAtJaIjQhJHYI7IcpQaKNLJAkdc7+g6VrbmeGQFyNVA9bhxLE8M1ZcwK9o/DNABIMEBk96pErAW2X90Nasa31J5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.16; Sat, 4 Apr 2026 02:12:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 02:12:08 +0000
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
Subject: [PATCH v5 1/3] rust: sizes: add SizeConstants trait for device address space constants
Date: Fri,  3 Apr 2026 19:12:02 -0700
Message-ID: <20260404021204.339779-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404021204.339779-1-jhubbard@nvidia.com>
References: <20260404021204.339779-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY5PR12MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f80c603-8ec2-41ff-97bc-08de91ef92e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	a9fzR3qlHLltP60pXykvqkGm4vGAmTaIz7zvYkCZ9SHkkB2As8fgaKN0uT/WMaXbYxg2yRybTF6ANPE3x07A7gjU4TXsug3c5pOKQmo2s+G+CnxiNr7epbgDrWF8DRwj1mEQ00X29QufEJsHYzOlmFVIspNT36dDuex0hc2rmsDnzvx2rxoeLvPJUvaP63s8kw5JTNkmWrLxIHssgjAV3B0JqwDGZtw7puDmywb31pca0empR27tmTYOqGhw8cYjse7z83OftkfbhVYgI71rCDBgDHYoXyv/7UIFsQVocciKPceCC5kNjSJFlNwv0BfQEN6k6ntVPQr6f8pva1xVtt8cn2txkY3PpOvPm8bH3zdsyhotj2gT40+Qx3bDEzTK7hW4XacY1Gs+PeWCP0NeDIIwNHQ34SOdpw2tC7alqBEU3pMbnS/b364u/7gbjIEx8jKI9MW8SzhpPH+01eFgn6DDrG9BcuernpZ/ERk02qRGoX5mx2wJW3VmpvpXaG6KnoOU6VTQ5WisHPiFfYGIultbvnjAymtUDAfn3XlnDhp8BDthiNL9VnV65FegUGK17ykB62azzKprV0xykTmThQ2lvxgC1qonuPzYEQVyoJyWFBL7ER+7c6NfSZKnYD1jZQw+fsTiva4AqELvn6Xlez5oCBHqKNXp0rlZNd8/pC2cqJ2Pr5362Ei9DHjkEFq5CjxW/gpe8pgzjkTr2ta+jv9yIdQgaY0xLsbGQkqknVQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LXd75b0boxK4vu2/wvoz2rMPWo2BsIFpe58sV7HwMLie9HImA9b+OetKm+tB?=
 =?us-ascii?Q?52eOawLZ8dhMRNlsfI6leaDWvWlm4jZzLu+ZHRT3DR6OBwFiLzz8nEQvFXPx?=
 =?us-ascii?Q?5gs22j9TWxUrOJdk9PsC73Ok2Izb70mqGDcfQShXLZzsCJKlJts0Vi5S5ZEE?=
 =?us-ascii?Q?vixvk7tzpLRdLob23sZci2Dnu7Pj73TVyv4fGT+XOMFHFsl0L4nbc6eGdCC+?=
 =?us-ascii?Q?5zO7sb56W2n+CTVy8uJdJXJ/wynBUDbpvkHzor7dZ3tPkgBDgZGalUxLCyKX?=
 =?us-ascii?Q?dAkfNxoBCBwV7A5bQI2cZYLR5hUFj53vt3DjpDUWWcpFUIKheSJpdhUg793r?=
 =?us-ascii?Q?0+N27i/u4Jfr564UaLvEogS9G6xsmIFFmIgMVGlMS02WTdohBghxjHc9Z5iZ?=
 =?us-ascii?Q?z9UIgfHfpf9+WsRFTnoahjbw39flclRucbFEOENty8K+F2R8nhVO6U7LajvP?=
 =?us-ascii?Q?IOM2oBfP3YYDJMYbPSMfmY6BOfYI6HQY8FPYaIhzar9HOO+r6/7iKrweQclP?=
 =?us-ascii?Q?GAdbUS5DLxqeNS+PtvhPPlVAv8H3zbd5EHVnV5MUl29bXYZ6g5gLOfNt/YuZ?=
 =?us-ascii?Q?qU0ajLMYvAguY+gkd3rL8o0fDnfOAtRHqedD+nBEdPyTz1NhLVo1Qgf9t3d6?=
 =?us-ascii?Q?w7gR8HSWeRU2eyVYnHxEojst3rfAGGh2MPTSNpQui0zlW0C6M1JZ1CJc+pUc?=
 =?us-ascii?Q?c49E2QWZaHHFHW3ZhPBOsELVhNs8WPA2EFVxsFrawV+4fgWS5brqyO7vf350?=
 =?us-ascii?Q?j9wOG14iZRpGrskMhMUwi5ID3tWAJ7mlMn955CZDK730msbBEXOYWdAXUDwm?=
 =?us-ascii?Q?EvnysNFenRNRrseYjtzG/SZiAZWhmR3x53xJ9fFCsvzbqM4Og4XnGkyiqFMe?=
 =?us-ascii?Q?Sovkyk/iKYKC/hjB0EHkC5P+VYuc8u3bethcC20dNlyloDZ44Ajw/FljVYtJ?=
 =?us-ascii?Q?53kaRCmPJzfri9hExv/nLn8V9PV8n0H8YXuOUMXZ5q/6VWBaSGbEJN95I+8A?=
 =?us-ascii?Q?XA0HcSGbWUj0YQxBYlIJ0Z6xoJA62KF6hOniPBuBISPMRYtJeRFE23jNxVZn?=
 =?us-ascii?Q?j2T2qdwduBg6TT7J/W8Wj1MYl2BC0f+Ue8gIoAMVq+Q2EibkcWSGJxgyXcnS?=
 =?us-ascii?Q?IC/8wKQakKjIbcuayAHj83t5/KjUm5up+54EDO+CKrRJDmZq6isrXItRSGyi?=
 =?us-ascii?Q?8+a78a2kGftdqV8fjebNlLNBe4FxHOgWDVZF9RvWmK5TlgaEZjZFaZN7A+Pa?=
 =?us-ascii?Q?6HNQ5TsyJFtRqBqJ3XqzDdxJi0BlU2oSGPLanscb5NMmJYzlrc/gJGmCefJy?=
 =?us-ascii?Q?h0pncUDtqEZlVujtUE72x3R9wsHT0EHVcHd1UQJDai36udk7etNX7vN7lFW1?=
 =?us-ascii?Q?pqSkjFojJOmMEK7fqZQPzxNvTDMOKALKGwAaOXXtOco9Dlxefw+sTkst3cug?=
 =?us-ascii?Q?sfdDpuouLI+eZLv9r5lz3Cit0/esemS6aCg+R6XDuAbT3GT81jt68OOiPQXb?=
 =?us-ascii?Q?TwVLABz+1Orzb/ptiYUkWREefhXt20O9Q/Ix9F97+MfnT+SNY5AdYgIMOswb?=
 =?us-ascii?Q?HJeoVM8R0pibwUqcL/CVZ30DGSLxZAtoyx1NPcwKGHsimdC0rILb/9owseCU?=
 =?us-ascii?Q?Zh3Gjc/gxQA+rwawcPVEcYFRARqf9p1Hr/1ububZxW2mU3tcIYxJSfKdsIpO?=
 =?us-ascii?Q?/sV33QDXLulMFet5KpHsz2aIdYmmE3sVq/tXrrb8+EIIc5XyP3NTcwXE0bKg?=
 =?us-ascii?Q?fAPTF/sQEA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f80c603-8ec2-41ff-97bc-08de91ef92e4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 02:12:08.2453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBn/GHky1NpI/cgBlfqSrGK2AzSJdfnN5UWEN7Bjlu0YLhhGVjV2A1vbYI99x6wpOkHDu5KBWHzPXAfMtTr9tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177

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
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Gary Guo <gary@garyguo.net>
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

