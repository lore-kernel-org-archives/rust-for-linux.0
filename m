Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21239D6D5;
	Thu, 26 Mar 2026 01:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489190; cv=fail; b=e/LHbuEB4Wbv2+1Jn6xx7tiXoEmHoq+NOACn6VahDyBppgQtzcYg+HrcGIgSjAhIOibCKgmDXHQFC7uT18Ct44claamwajln/AX76zK3vPGtLuntjpD8PiRoFWIoq73FgESy5drJPVFGw5C+352rZ5ecnuwIwfdzTDaAOMiIajc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489190; c=relaxed/simple;
	bh=ZQrvPPrzyDcSK0tORFSpjbrH25qIobd/YJmLMR8iD/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MDGyTpJv84jKA8+Cx3yY16XL92cMK/T5L8D5g/04w43SOmktO26D1Jc0zt1d+oVT2YRQOrDo8r0f/1OKPedo/jvt+5AoZW3JGHSKMsZCh0Zpd6qU5DlILoPEWVueHUHsBUQa7swAyq8Pg9uYpv0Y8SKS9V8XSVJCVAAXH54n05I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eprIAcTb; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eprIAcTb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mkp7JxJoLPRDIXU25ErCAZMBqiNP1HaOZUWMrfuXiGNmIEhNDWMJUCX06sES7sXmRNTUm9s6Nftg4fRBKWKdEQxElwTX2pPGGUjWswog09lgWfEWg2Gyh9Wa4+sZ99ibfCNrCVm1DhHA7CFNDkKqH0fhd8QmLo57KPZDfDLgeqJFkn+ZOoLh5U2zyQhnjTk62HJ9CIn0Pkb/XRMvUFOdJSY5HbvwoMpKaA0SUEVfjM3q0iA8R8xH34qQ3EdFEVrwElLflkho1FvPL0uztBXIF3Y1nOeIgwDzM3LRwhYQX63FbvkagB2iAVBl/0adIR5mNBBGSF32CvW4eEC+I4KisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znzvkEovBhqX6YZqQ+JmWqTvx/jpp59Kz+7SYb+gxf8=;
 b=aeqK3YMpG+0Mpsw6RGLqWoRkf+FSmRTOoT5uZrmlZgMRpaPKmZE2ujCOGZMnqtaHrjpB7TSnoyJ26S22MLCW2IE4FqYWgXYdtyJAgAn0AnquDgKS0JyCORcfokkdxvUszfiQGXrpgAfd4d1O4fg1DswYQLzs5wZnJ8pseSAbJ5Bhop1ABFXisy6frTnVI7WhMG+IV25m/vAS2P6kNXGqbcGNyZq6v4UZU/Gi2B3xkltJeZJyiuDH1zag6QwU2c5lP2dqfgYQ8xApGYRL+RGI75Q92NoPQ9+kyh3z9SlFZOvKvRH2DrpCtB62TSPgei3KkUcNh2F67e9O0XwBkutKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znzvkEovBhqX6YZqQ+JmWqTvx/jpp59Kz+7SYb+gxf8=;
 b=eprIAcTbQKWyESyRc7Cyt0MgWP89xPs7R8XkYsyoyrVazfXyr1v41ZmWgX4ASu+F6Trj23nr8F1Ks4kXNt1LYokNVWj+hgdE+ViW5ZMWXCOqrvzajjnuEYe04mZ4BSPVjXksmteXDFM40V72xRIGFWP8bjgMzXJu1tN0+l/Uz8dP+5/N8yy9FEQmSKX2VJtf2hRwsBFZFQoA1GYVRDOIpZwy/5F66lVi1ERB0gMbWnCL3b6PpPBsmdUpQlSIJ/gRinJUPl2CSPq/zxCSWSfyBikKR4u6Nb9C2Vya109jZn4t2n7xthfHNeh++WaELKLLaFEhGEeWoS+yerlpL+Z1+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:38 +0000
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
Subject: [PATCH v9 23/31] gpu: nova-core: Hopper/Blackwell: larger non-WPR heap
Date: Wed, 25 Mar 2026 18:38:54 -0700
Message-ID: <20260326013902.588242-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0019.namprd08.prod.outlook.com
 (2603:10b6:a03:100::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 981d9790-8e9a-42be-c61e-08de8ad88afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	K7yhtJvh88AWq4ZBf814gljNPbu/tdahZn+ZS/T6qQkVTY5gq5mwS9/THrhjIdukBPCvc26WD4iXdsDmbeb13wlobTAd2PDUhB10gUrp9D5h3d8+Z4662Q4NNzU37DEI0UgPv8Gnlhmv65i885Ca5DzbdWrPsxjTruzc5ezTmRhPIhPoZdvGpe1TQVY82faj4QOz7PccA9Vy8hAXl9nbas6Sa4Ksve93r/ChKw4MG6Qbu3zXZl6tSmuqnNDsTOHC6NmP9CGKAt7tnFhYngO7QCi14fkyEISXxPpcnqIr79zbsz3pOrvEqBrQMKUIjqeBmYojksccQ4AxlAdMj8TI7qu0yfC7k7eJXxRNk39ZUZKcLs048SWAs9p0RVwep/iPGp/3wzWvVPxIkHmSx3k7GbzpaofzrifzkybnaysGuwiWMYr/nyI2GtnzM8sLSA58r6JTt5WxCXbZKfm7rkvVQufary9VmMoMUaRYisZGBXJJo18oxB6NxxCsX62ce4egAAZuK52wF4I3Xm9XAYocb4Sa6/Y/3AIvwvUQMMYbDcZ7Jni3/LIbH0xusE/uR+nFMRVoXgN86dA1YyXZoZsvyt4MWF8C8kGARbMCbGT9iGCb7C2MDEfMnf1ejmCGMSkXl27HUPVxaYuDr5UrDgCaDRrJwnwTq7e4qpFsgE1Vw5HDe3Wn5RbISDp3lyVE+MDeiOhGJiW4iMYEniO6ML8gBU8NrA381bdcpO+2zPilOIE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?femneD6yfCoQjQoRuPXVUI37Vqv5d2geYk621yIKleQeNbfOiPlH8ue344eE?=
 =?us-ascii?Q?WM7+8H/kNrtaMr/g2EEuihEVqrAi6twQe7pq9Ycv2x7DbdKwwgdLUQaTX9kh?=
 =?us-ascii?Q?7b+pMQULXScDSwG+biU/Ub7UFTSB9CnnAuGuciYACAMyBXzJ/+tzjf4hGsq4?=
 =?us-ascii?Q?K7MLuDGWk3lxUEdMW2HXsoDRKXVKWMw/qqnyPMdBh5DhRrPZBe5b884RnoBQ?=
 =?us-ascii?Q?G9AWH5lmmROv9+p8PEVuoAVxgQmcCsubOxhF0wXEUIENlqglbB+pVdPx9Cj2?=
 =?us-ascii?Q?KAKEfKuICryqPJmc6qiVoNiYTgoE37Fw80XNEjTH3ZWIDjVfBap74+dkg0ZK?=
 =?us-ascii?Q?BJfAhw4PJ9P/n0cFh+ZZngND0TMRwOKxdcKkbNGrZTYsLHThZIFyIJsDyZFJ?=
 =?us-ascii?Q?HqlEc8s6ngTqa90UB7HV5dlreTEfoztVZY9+rVRqzlfQDEuO6KB1w3tOKDPn?=
 =?us-ascii?Q?g56mecZ/pbD5Mgyj5ScqMr3YtI6Wo9e1eA8XhgTy4NxHA+lVNwCfgUMDmBh5?=
 =?us-ascii?Q?Lmt7YJ6XtOP5KuKiXUqdbIutt6OvetdH9kQla5ritwxV9AKGudKgXzVeoGFc?=
 =?us-ascii?Q?ydBiGH/UecsLWi0c2fdH/2ENzWN8eI9QL55X9W62fLrVcfvKy6FZTBquFjol?=
 =?us-ascii?Q?ltRmLVYW1CzYPvzgX/kOKlEj3oJyHumQj18rVcxCS/K6od1GjlN9x0NopR55?=
 =?us-ascii?Q?5dQKYd1ReXnjZjEzlHuLBQDb1J3f4lMggaLD0Htal+TcrE16CaBFqf7slawo?=
 =?us-ascii?Q?Z47jIXVHqcwvdjQSp8CaBc+xwqn7sirQx8Hm/AdM8Vj5gLiQJb/gkb3Qzqf7?=
 =?us-ascii?Q?3ktvPcekf5lIQUuHgAzs0fHUvNmdDjOYBVgFoUlMXpQVgV1kTtyI7HBeT78X?=
 =?us-ascii?Q?rprOORoe+2/D03mXi/x/c3TY+vO+iIRq3VCPdm1jFNINP4cPPLY4Len1bBRP?=
 =?us-ascii?Q?HerWqm+DLk1TxFlhc5iLRnPqfDUTD47R6nA/JybVGufA8ETcgc47wQsbDadL?=
 =?us-ascii?Q?Zqy2k9lpa9vvMlJMbWmVWYq3Aa7dC5mNPZ/rhZl5f0+FgWymd2n4c1xXhelL?=
 =?us-ascii?Q?3nDWe8FD2fGNFlhyojFiJLnVZCfS5J+ZDWBIOc8oESlj+NaZxlCOzfaqBiBs?=
 =?us-ascii?Q?IFme0EcaOFIwn4sUVP5TEhXeN1xIZXk+vElvTcE4JEe86caDjTd2aLFX/oyH?=
 =?us-ascii?Q?bGPs6hSzdxgGwP3c2c13kkoGu2DoY4tY7Ojx+I51aiR/s7/CsieUKfgiark1?=
 =?us-ascii?Q?RSOp7adzQSySUiwcP1kH7nLF7oEyB6BF6z1Z2kbLtYfFp7JJLpFssH3n+p/L?=
 =?us-ascii?Q?gIl6iZQ6yUTJIhlyHoI5Qvh9yuNccdMkvY4bVq3ljaoXjYHitCSc+w5nljMf?=
 =?us-ascii?Q?6gPAsbAozE/kO7w2qRvfjzN3SDxk5Wn555Nqj8A6RoVM7Ex5hhd/5/RMz3so?=
 =?us-ascii?Q?msGDSBx7vbBDGueLe3FKENmeZTtdXoGVTK5WxfVV5HwmpaAk1O+pLSpPd/f1?=
 =?us-ascii?Q?TQiz4yW913rW2Tls3kLDdxbSgZnp3RngV4hdrb46t7SFHhFbWXF4GKFPBF6k?=
 =?us-ascii?Q?OHWzv0a1pPNhCEy0+D00C4rFiOc74SVi66uvveasucTUyBiRBhYpS31rd3uO?=
 =?us-ascii?Q?hJgd7PRW8ZjQJLf7j5rY7XcXMZtTwZSgj5gn+2UU7R1SJcJVywLt1cUfRY2H?=
 =?us-ascii?Q?TOLIAytzv3wcc0tmzqz2pVhcMdsVUbvRT8DuRKgtqUGtiZ8fPc/1iYd9RyhW?=
 =?us-ascii?Q?ZxtQvHDgcg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981d9790-8e9a-42be-c61e-08de8ad88afd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:38.4530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UM1qkdSA7HSzhRLlbDL4OnA7zAhaHLzXEsIt2aexNcPhdF76/TgByK7vKVJUHZwE41JN3FkTdgu1GCSidzSIQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

Add dedicated FB HALs for Hopper (GH100) and Blackwell (GB100) with
architecture-specific non-WPR heap sizes. Hopper uses 2 MiB, Blackwell
uses 2 MiB + 128 KiB. These are needed for the larger reserved memory
regions that Hopper/Blackwell GPUs require.

Also adds the non_wpr_heap_size() method to the FbHal trait, and
the total_reserved_size field to FbLayout.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs           | 16 ++++++++---
 drivers/gpu/nova-core/fb/hal.rs       | 19 +++++++++-----
 drivers/gpu/nova-core/fb/hal/ga102.rs |  2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs | 38 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/fb/hal/gh100.rs | 38 +++++++++++++++++++++++++++
 5 files changed, 102 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
 create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index ffb996b918f8..c12705f5f742 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -31,7 +31,7 @@
     regs,
 };
 
-mod hal;
+pub(crate) mod hal;
 
 /// Type holding the sysmem flush memory page, a page of memory to be written into the
 /// `NV_PFB_NISO_FLUSH_SYSMEM_ADDR*` registers and used to maintain memory coherency.
@@ -99,6 +99,15 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+/// Calculate non-WPR heap size based on chipset architecture.
+/// This matches the logic used in FSP for consistency.
+pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
+    hal::fb_hal(chipset)
+        .non_wpr_heap_size()
+        .map(u64::from)
+        .unwrap_or(usize_as_u64(SZ_1M))
+}
+
 pub(crate) struct FbRange(Range<u64>);
 
 impl FbRange {
@@ -253,9 +262,8 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
-
-            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
+            let heap_size = calc_non_wpr_heap_size(chipset);
+            FbRange(wpr2.start - heap_size..wpr2.start)
         };
 
         Ok(Self {
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 3b3bad0feed0..478f80d640c1 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -12,6 +12,8 @@
 
 mod ga100;
 mod ga102;
+mod gb100;
+mod gh100;
 mod tu102;
 
 pub(crate) trait FbHal {
@@ -28,17 +30,22 @@ pub(crate) trait FbHal {
 
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: &Bar0) -> u64;
+
+    /// Returns the non-WPR heap size for GPUs that need large reserved memory.
+    ///
+    /// Returns `None` for GPUs that don't need extra reserved memory.
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        None
+    }
 }
 
 /// Returns the HAL corresponding to `chipset`.
-pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
+pub(crate) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset.arch() {
         Architecture::Turing => tu102::TU102_HAL,
         Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
-        Architecture::Ampere => ga102::GA102_HAL,
-        Architecture::Ada
-        | Architecture::Hopper
-        | Architecture::BlackwellGB10x
-        | Architecture::BlackwellGB20x => ga102::GA102_HAL,
+        Architecture::Ampere | Architecture::Ada => ga102::GA102_HAL,
+        Architecture::Hopper => gh100::GH100_HAL,
+        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => gb100::GB100_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index 734605905031..f8d8f01e3c5d 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -8,7 +8,7 @@
     regs, //
 };
 
-fn vidmem_size_ga102(bar: &Bar0) -> u64 {
+pub(super) fn vidmem_size_ga102(bar: &Bar0) -> u64 {
     regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
 }
 
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
new file mode 100644
index 000000000000..bead99a6ca76
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gb100;
+
+impl FbHal for Gb100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        // 2 MiB + 128 KiB non-WPR heap for Blackwell (see Open RM: kgspCalculateFbLayout_GB100).
+        Some(0x220000)
+    }
+}
+
+const GB100: Gb100 = Gb100;
+pub(super) const GB100_HAL: &dyn FbHal = &GB100;
diff --git a/drivers/gpu/nova-core/fb/hal/gh100.rs b/drivers/gpu/nova-core/fb/hal/gh100.rs
new file mode 100644
index 000000000000..32d7414e6243
--- /dev/null
+++ b/drivers/gpu/nova-core/fb/hal/gh100.rs
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    fb::hal::FbHal, //
+};
+
+struct Gh100;
+
+impl FbHal for Gh100 {
+    fn read_sysmem_flush_page(&self, bar: &Bar0) -> u64 {
+        super::ga100::read_sysmem_flush_page_ga100(bar)
+    }
+
+    fn write_sysmem_flush_page(&self, bar: &Bar0, addr: u64) -> Result {
+        super::ga100::write_sysmem_flush_page_ga100(bar, addr);
+
+        Ok(())
+    }
+
+    fn supports_display(&self, bar: &Bar0) -> bool {
+        super::ga100::display_enabled_ga100(bar)
+    }
+
+    fn vidmem_size(&self, bar: &Bar0) -> u64 {
+        super::ga102::vidmem_size_ga102(bar)
+    }
+
+    fn non_wpr_heap_size(&self) -> Option<u32> {
+        // 2 MiB non-WPR heap for Hopper (see Open RM: kgspCalculateFbLayout_GH100).
+        Some(0x200000)
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn FbHal = &GH100;
-- 
2.53.0

