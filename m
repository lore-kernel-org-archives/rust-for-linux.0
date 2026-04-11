Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7359527A107;
	Sat, 11 Apr 2026 02:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875289; cv=fail; b=cpLPf0lln4nY4lozrlKGLZHHc11jw8Ac+B1eLxRgzn/b/MeK+6A+u+0X+IaLnZ75TnQB5q8PoM5LDgL/8n2PtOezXF6dTOE20vfWIJisPCiJ28idmJCn4bnN7slOSA713XA8V+N9FDkIupOExcgkyO9/ADn1wHywz9vesvLuzgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875289; c=relaxed/simple;
	bh=vgxBjhUyKyVb7pa6m30Q6BtfMcfH1nV7CqZdAKCJ8mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VVPV8bEzXMjLINntqs6e1cAMc3XzDVF+sjoXGwGbCTmFCbgRarvV9JijED74dW9QsUmB7oJXZM3k5tOZNEIPfidRTNLEX9E1VMLYIOoF8NaAPXLD7WCE5gPh++U+6G8et5ljeQj0/uI5NC5sUhMM2HEVeRz+ROjN49eBKbWpgA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XA74Bdsx; arc=fail smtp.client-ip=40.107.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XA74Bdsx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGNGRWt1W/7W7Gp+4klk/B2xX5Gz+Sx+dkhxIXX2ADdIhFiFCt+vuajmzBQ75sFBJczdao6a5EwHYdiATwAJrTV5i0K0OG3s9MFm/nJuftYC7H9drfuAzY6Qs7y9Lbhb33yGC+aKnBNYuW2dC1E+2Sr/J3WV9/LwWybFUMwP3S4E7H/0Ao81koxIFE+1nvYpEgV6kGBu+dXKNrNaJ338nZAX+OztgAzOWTBIXxfGhsVsdgFD/f78/zr39srOiGWlPm9O1k2OovGS+VTnuN3KgViDnQjRLKU3fjAkAw4or002zsRCki6QSAXgHr+3mX/+yVs84az04CtNjhNi5iGjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6qFQ9VH9VvDNQu8T3dMZ1+3vdENM2PB2G0pnKVcW9Y=;
 b=f/15u8ipF0zfXAVHdvYBcnvK7whA6616oU0AeTh1WOwfyWwk5hwrN+VNBobH6UhuKjRusXVym4IF9sfrqiSMxLZvxt3P3QgA/qD9T6N1s7o9i1VJh+DkToxx16nCnwTbVEAm8FQc12xS42gF+81lyCPYDaQ9c6WaeBazHTo51Es2AO8S2s8umklhKLL8X0lRrLXgWhEaVsM4dUpjsScMPPVR8jKnyE4O3QMLbizsAFz9m6PNie4M8qFAhg2NxuB7Rq2w3wi4hChZdOyp1JJEUTFWQDmSvEgyDntHXR4s1PS4dew+DOvPoOZFyTvxmMiYyb/bpA2iA8sn5+SWRC57aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6qFQ9VH9VvDNQu8T3dMZ1+3vdENM2PB2G0pnKVcW9Y=;
 b=XA74BdsxNnjLv3vdtDJz1qAKbZatOh5DtMC0GodTcbu2hT2f1t8w62aiBAt47HqknXdo3qRbAXaLmQl51r6VDc6SDP0UvpSNWtr+vkeaRzHWKSNbscL3mdJ+HNGENj55Y24YnOMMBNDOr2ALkKDySpkhwyI9jSg4RpHsXIqSqp/YKrSXHecNNDtuTTQSNz6ThkW7mC3+IDRI15s0QyUkJHwvd4Z/Avi9Sp+LeSgDehBdA7OCFKEp/FXMtap0b/5RE4YwiL/ZsTWY+/weTfZ461fmBkgMo6gVmjYPYegME3gprKev2P6pK+YJTmKVAtTMWrwezEiAxh9U7/nVrHFNFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8775.namprd12.prod.outlook.com (2603:10b6:510:28e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sat, 11 Apr
 2026 02:41:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:41:22 +0000
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
Subject: [PATCH v6 1/2] gpu: nova-core: use SizeConstants trait for u64 size constants
Date: Fri, 10 Apr 2026 19:41:17 -0700
Message-ID: <20260411024118.471294-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024118.471294-1-jhubbard@nvidia.com>
References: <20260411024118.471294-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: 7423bc7d-fd5b-4e8f-2438-08de9773d165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hOwpn34ak5iQiM8X+m09VWvnBHx1FMKiuKBoVL6x8v5aRq7nxOnaycwoChTXHON5g/v1WaDWXnAVV8yhBpA3ZOLlZueu1VU4gCbqiH8eUa9E6B/ySr8rPvmcPD1fai8uJE0xqs2MoUysJnCbnqWSFmx5Q22jiYRXtwWG+rYIyvA98VW4VlcK13lq7w6uPgRVjefZPX60xUkEdOAISKVAtnnMMmJYcqs3zRePN11F5mCSPPNQ14YZxJWIgZrUDdMVlvccLxYh8qXH/hTwkdzn/qHWrA8xB3iexzHC5KD2ie2jyMA1do3EN57CkvfkRh5aLkjl4hI+UtQ2rn1tm87xZMYKLTARDFzHOjDG9dhcI0PGzQN5/KK10jfPif6M0CaPldnOhfF8XiS6ardeTihk4stuIalrWejaiYvRsaxjkAYGL5gr9cfObI/Y7uBeio+bcbO3+EKEEBtR0L6YqI+AUesPB3oMInr7z9pDCIQzBJMS8DOLislN4XMFVuW9oydXGHut3zdIIlQVJRskTkrV1blPH65wD+Y9tGJva1LXPOYYNCv6pEt9WPMFP196d6tKqb1PRWZ5XMN4lHzzQjAMVBqK6pbwcsLsdsDebf/UjBqNLduMZJoMWUXDWMW17Q7Z+3I0XcGgo8Za5VuZcR+0TEmqhgplHu4lUm3WyZQU9ih+FA8o/Lxu68NcQCOuzzKKwcH9K3jrFGCtXDqKJBH2NXxYndQcIM89si3lnuo1ZM4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kmz17/xcQuP19Uiru5lS/QhJZFGGFZgKW+CBNnkf5ME87guoPl0M77x1ubWH?=
 =?us-ascii?Q?XK5qEJHoAEtrBNSOTA7a9rFQ0i9sUFVqGQpBMezvWn5DfEMDfIU5EUzoQ5nq?=
 =?us-ascii?Q?7UQexTb30oGnKw2zWkE8BtJCpfzmBaKrqi1FmsLJuu96nouzbXKR80tLlju9?=
 =?us-ascii?Q?wBTqJ8DcEE8QcsjvOM+iIkFwOyRCheGywSAPt6jgJAUAVmCWbbv74BGdHnc9?=
 =?us-ascii?Q?Zm7sAt72GHKaQ3uLvvQ+++tXHAJzkUqay+1xOmwZX8rOqNj9+YePPjCEvOPA?=
 =?us-ascii?Q?AI4Exg4N0ZTdk80WyTfwBCE1KcpVplJBF8VacxhkEpqOj6xJHCurtRc5mSh+?=
 =?us-ascii?Q?tMe59y359c2l6VlNMMDamb5Ud5yAzVp8Ky8f3+WdqEojijzCNHR2/usTKWXs?=
 =?us-ascii?Q?zXQY9JZja+SRlvzTVYFojtIe+9ZiDxLxM2/X+sb2b6hn6qnZL7cz8DmaNXmw?=
 =?us-ascii?Q?76C6v+7hAoa45mwJj7NcmYtGaDrRGhJf9SmM65QsW3Oa6TMdreL68DrEBpxJ?=
 =?us-ascii?Q?vgmpbH0ZB3gtkPmV+1bnDTPfko3fkouyoR/gs3n1k7Pe3PHTSdfP8NJfGrFJ?=
 =?us-ascii?Q?79YUPnj+Y/fUrfuVrEab/BizgRL62aLsBupytcZ4C72kdNYzgFWzrdIZEV2d?=
 =?us-ascii?Q?/AveELYhnZEwzXn3JAKAkFmjxH2a0DgtdYhzzp7QkCurwLeGpktgi3AauafJ?=
 =?us-ascii?Q?Y3YUQjNy63yAduPTRzEbDv0tB63m6Mpji/Kk72OoOtN2N+BGpuJRpinjdB7c?=
 =?us-ascii?Q?+KlKW6FVA8wLiD3mQ7WIG6PPFfEF7/O6ZwfNCd8s7/NdNDb+NNUmCCiafjBj?=
 =?us-ascii?Q?ucg8GCXZTED3p0ldxbMgDW8c6KNsodecDgKnv2IQksw08oZrhDxj8Dntow9M?=
 =?us-ascii?Q?7Dx5cGvPBh1Edq1fl+aAwQfiPt0M6VWW/pSwe3ajtSYk/RN1Iq5dUxzABppW?=
 =?us-ascii?Q?Y1GgrHtAU4KQt/uqy7lsIRcqpQ4qh6l0Tjbwve09an11pEOj38OAt4m1XLDi?=
 =?us-ascii?Q?9qWPU6ukAdPUXM/8zur71AfWKKkUEEa/Nu9eK1iSyofciREVvl5PDg86Q7Tz?=
 =?us-ascii?Q?54OMs/CIxiyjPZaQUPRmO5FZfxbnVv5x1OvDGI9nPDSU84OVAbyvOUEGewQC?=
 =?us-ascii?Q?Vmqyr1klGaCFYUA1bedVN9klw5u2fqDjr3x5nSbaxLgKlaN8EcvM5YtZnpo1?=
 =?us-ascii?Q?D4EilxsWokWWoqcZiy9hVRFgGoSwAfuGDKpBIv84y3P1k8m65Xyc9u0F/QYR?=
 =?us-ascii?Q?wvdim0kWQTXT4CtXnMMaye90P7Qg/Y2QPWw2/UBLLTenBf3QBbmV3cSTGE/x?=
 =?us-ascii?Q?5ALHSFUW6s11vQn0/Wu69Z/tPFLRxeF0rHNXvbJIyWL9X/16x+yY4LSYTCoY?=
 =?us-ascii?Q?RVtdwFR2UVwAKHhrZ79UWaJfBIMmr57WBtaplLUzJgoXzwCtplarSJTSwjNi?=
 =?us-ascii?Q?AOdUytBmMO5KwAixz3w2LyXzzJBXqWbIYyLt09VrR8mkn/E1hTqTtMyWWhyM?=
 =?us-ascii?Q?GBbPZzFtb/Yr7/oX7hcxovq6SYFFp+0OgDbnunNze2zz8AGxAMicS+l14bSu?=
 =?us-ascii?Q?48vxXP19nhgUuVPbXuLx9Khhsrj77VuDC0OmsepelfnGPUuRPHvKWURomWDO?=
 =?us-ascii?Q?+dSMaHWP9bl6QiCjueEl9SwOi3L7R5lgDLhJDT2WrTjS8KOYu3EwAX7dxcUx?=
 =?us-ascii?Q?wbVpczLrCw2bTPjBgmmt9w8dz2B8snXON6cWmMivniz7cFSqAt+UCnvYtcmg?=
 =?us-ascii?Q?vrk7XvKmRQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7423bc7d-fd5b-4e8f-2438-08de9773d165
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:41:22.4987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdO1A4y/ed+UtIn5/+GStTFQMkS7A/dF05WiN1ojsOl1zjjv2sl3w1MD002soAJmnMj4nQaR+9YQPdDqMBNmkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8775

Replace manual usize-to-u64 conversions of SZ_* constants with the
SizeConstants trait's associated constants on u64. With the
SizeConstants trait in scope, u64::SZ_1M replaces usize_as_u64(SZ_1M)
and similar.

This removes several now-unused imports: usize_as_u64, FromSafeCast,
and individual SZ_* type-level constants.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Acked-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 21 +++++++++------------
 drivers/gpu/nova-core/gsp/fw.rs | 15 +++++++--------
 drivers/gpu/nova-core/regs.rs   |  7 +++----
 3 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index f357fb28b22c..35899e9b2560 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -24,11 +24,8 @@
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp,
-    num::{
-        usize_as_u64,
-        FromSafeCast, //
-    },
-    regs,
+    num::FromSafeCast,
+    regs, //
 };
 
 mod hal;
@@ -127,8 +124,8 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         if f.alternate() {
             let size = self.len();
 
-            if size < usize_as_u64(SZ_1M) {
-                let size_kib = size / usize_as_u64(SZ_1K);
+            if size < u64::SZ_1M {
+                let size_kib = size / u64::SZ_1K;
                 f.write_fmt(fmt!(
                     "{:#x}..{:#x} ({} KiB)",
                     self.0.start,
@@ -136,7 +133,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                     size_kib
                 ))
             } else {
-                let size_mib = size / usize_as_u64(SZ_1M);
+                let size_mib = size / u64::SZ_1M;
                 f.write_fmt(fmt!(
                     "{:#x}..{:#x} ({} MiB)",
                     self.0.start,
@@ -186,7 +183,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 
         let vga_workspace = {
             let vga_base = {
-                const NV_PRAMIN_SIZE: u64 = usize_as_u64(SZ_1M);
+                const NV_PRAMIN_SIZE: u64 = u64::SZ_1M;
                 let base = fb.end - NV_PRAMIN_SIZE;
 
                 if hal.supports_display(bar) {
@@ -196,7 +193,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                     {
                         Some(addr) => {
                             if addr < base {
-                                const VBIOS_WORKSPACE_SIZE: u64 = usize_as_u64(SZ_128K);
+                                const VBIOS_WORKSPACE_SIZE: u64 = u64::SZ_128K;
 
                                 // Point workspace address to end of framebuffer.
                                 fb.end - VBIOS_WORKSPACE_SIZE
@@ -216,7 +213,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 
         let frts = {
             const FRTS_DOWN_ALIGN: Alignment = Alignment::new::<SZ_128K>();
-            const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
+            const FRTS_SIZE: u64 = u64::SZ_1M;
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
             FbRange(frts_base..frts_base + FRTS_SIZE)
@@ -256,7 +253,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
+            const HEAP_SIZE: u64 = u64::SZ_1M;
 
             FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 5e109eb90164..3245793bbe42 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -17,8 +17,8 @@
         KnownSize, //
     },
     sizes::{
-        SZ_128K,
-        SZ_1M, //
+        SizeConstants,
+        SZ_128K, //
     },
     transmute::{
         AsBytes,
@@ -123,7 +123,7 @@ fn client_alloc_size() -> u64 {
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
     /// `fb_size`.
     fn management_overhead(fb_size: u64) -> Result<u64> {
-        let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
+        let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .checked_mul(fb_size_gb)
@@ -146,9 +146,8 @@ impl LibosParams {
     const LIBOS2: LibosParams = LibosParams {
         carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
         allowed_heap_size: num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB)
-            * num::usize_as_u64(SZ_1M)
-            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB)
-                * num::usize_as_u64(SZ_1M),
+            * u64::SZ_1M
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB) * u64::SZ_1M,
     };
 
     /// Version 3 of the GSP LIBOS (GA102+)
@@ -156,9 +155,9 @@ impl LibosParams {
         carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
         allowed_heap_size: num::u32_as_u64(
             bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
-        ) * num::usize_as_u64(SZ_1M)
+        ) * u64::SZ_1M
             ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
-                * num::usize_as_u64(SZ_1M),
+                * u64::SZ_1M,
     };
 
     /// Returns the libos parameters corresponding to `chipset`.
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 2f171a4ff9ba..6faeed73901d 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -7,6 +7,7 @@
         Io, //
     },
     prelude::*,
+    sizes::SizeConstants,
     time, //
 };
 
@@ -30,7 +31,6 @@
         Architecture,
         Chipset, //
     },
-    num::FromSafeCast,
 };
 
 // PMC
@@ -150,8 +150,7 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale()))
-            * u64::from_safe_cast(kernel::sizes::SZ_1M);
+        let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale())) * u64::SZ_1M;
 
         if self.ecc_mode_enabled() {
             // Remove the amount of memory reserved for ECC (one per 16 units).
@@ -241,7 +240,7 @@ pub(crate) fn completed(self) -> bool {
 impl NV_USABLE_FB_SIZE_IN_MB {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        u64::from(self.value()) * u64::from_safe_cast(kernel::sizes::SZ_1M)
+        u64::from(self.value()) * u64::SZ_1M
     }
 }
 
-- 
2.53.0

