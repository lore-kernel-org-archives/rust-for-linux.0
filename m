Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013002.outbound.protection.outlook.com [40.93.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE0C2DC78C;
	Sat,  4 Apr 2026 02:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775268735; cv=fail; b=QV7Zdj+U/NCwwNthdgL9aus6vuV9tAph/MFW2OadcfeeVeSGFmis4A3WWjx03YSP/TzHvaqD7AiWC47CJKi0HDDDIeV0C4X3PTUH8YO3QoJxpUQryJGLi297Bp1nz/9w5SqvBQmidoYDXKp2fSsx8CtmBl6L4OZoU4gugnc/+G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775268735; c=relaxed/simple;
	bh=s5r3KmfhODy91OTbRo89pLFi4p+zkiEVJojduxVlm/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TGcPOpn8Mm6qkkyP/vLajLmuZ34LCH1FG9yJQUhl+jbQjXhwrQ5uQmAdpVQKNz2R053dOmaohXB5VlRvpJx3Ngluk1c8BLb2D89Ug0wBsMyc6Rxc37q7R7Kkf01L/1XnK8X5NMhP8aTpBuHtZduDoMGn3ad6/jiUPSEhHgHcO3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A5RHykGw; arc=fail smtp.client-ip=40.93.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A5RHykGw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8erQTpOHEqe/AWtsV09yiTXZ89FkKSmg8EPXsTiZeWlrVdFoT6uQ/5Ud+w38hbEBNK/AL42ETnBeraJRlmk43YHwZCTivHr5gtgwlc3N5ewgRkcT4PYsF6hkCprMEFwik9EJ/K1DaLE8RNRQNM3NkJOcGxy60utYsmTFPsKtS7dVWMuWgzTinG0VC3FxEuap8OauYThRT/XLWdI03TQFl+2j6WQR7xfHTC8Dc6TBedr2y0jfNMlk11YNSJUFXQjA68+fkWG1x6rLIkT1x4RY7kkd43rlIPfYKqfjhpvr5kdUxkNHZwCkXsLCBxOlV10IKKuRtrWnTYMgoZn1bDoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jqn5wxhm7ZR0hFXfTWUY/PHzJk8+7mhMatZV8idHUc=;
 b=uu07Cqme+hYa0w9LmqneADmzwtFJwDeIUn4mpro+ZzDwCdy6kP7JcL3CldqonWaEHAH0uxM0U7CWAbk6NHAZZFoKcWEX0tQ4egvULCm3+BEC3tR1MMvlAYEaBi+jKeCWODurxqv2/4DMeHiUOnQY9sUWXw7C4J/+CWJtjVmwwyuTGQkQaUSdy00Zq78GvKYpHlzonmOSkVzIEec0qqU7NOZjqv1HDriA6bT/wpf8NQuJgdtxRfi3uiBMry99zsXgbdlt3hsS8D7SU2MvwcyvM+jRiEUBBMULYciv5BKq/x0g49SqeXtWdzRHmQWmNj7/iu5Be5TTJy2IwoAvNa46mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jqn5wxhm7ZR0hFXfTWUY/PHzJk8+7mhMatZV8idHUc=;
 b=A5RHykGw5yBhLKpS5VOVEUVxnfzu+Wv/rVRVvDjb6emi3NJs2LTdLHmLFeU764c4PIRCXHWH8GXgXKqD1nfDmxcW42szPRMb8PCaw7t4puc2C94KKuEZ/nQEAKkoe3qSL0sYVIMFWO7Kb93aU+IMpyPBZT5nUyt68OjDztwtc1BvW1i/g8XhfGp3GRMSgXGjI6PwODyQDomsPYhfn3LVa793YXbkeSUWoHPJ3Qu5jeBucUStKSYDNr3h2yR8OEq9x9LRpM35psothTA6Unf8na45B45N0EuQYpPZdyG3prtni5Y9A2TAWY6IOif0LKGqL37nZONii25NgH8yoZd1Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.16; Sat, 4 Apr 2026 02:12:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 02:12:09 +0000
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
Subject: [PATCH v5 2/3] gpu: nova-core: use SizeConstants trait for u64 size constants
Date: Fri,  3 Apr 2026 19:12:03 -0700
Message-ID: <20260404021204.339779-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404021204.339779-1-jhubbard@nvidia.com>
References: <20260404021204.339779-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY5PR12MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: c867822c-e707-42fd-e7c1-08de91ef93bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NMEEAAUUtkRhhI5Rk8tP+RkP5xWoORHb5svvXQcVzZN4SJw1eARs4hQ+VVKFLwZPu7mbgSFVyFFWHG2Pgu/WYUU6lBLqQruUsLiSAeKdhnRfvTI6DrrQj6kjsmDyi/UpkGle/YP1TlgNUzIxSaFoGVku3YtmlLcygWRs1BL0dyPo5MwCY3/0whtAAR9uW2tm13b55r+O9tXgxUm3wpjxemPXPt4Artgml52RcvYiAsXU6Wh+lc9LCMTr4Z8/bTG5jtnPoScjV6rSB4eqN9aOju/Ho25sTmyZXS6m05sY3diMr4mffyKWQ6+IVIqVKru+Bd85oQQ7yzF8WEtOWulc4ONx6H13YivLWpZC6VNwM42GxsNLcB0IZm7Pvx49qdzDIrTMCz2uHq2jSu41fcX6GwlJK7PE18Nv198LDF+8QeYLWaDBXZJm/n4OP0Q7D54eQlwbyFvWYVtAy4WAmBjwEyW1XEEV2/MEgQUVZpH3XkYKJocYt0Mwgkh04ngfHNlWDE3ehF8nwi2Sbd47kfT0SCivaHntfy40GiE3nOrxOWVf8Yf7BwQDM77nzgQ2okf02Q3lbbfbcUhZsmzfd6EjCJQF9cJ/7RmUSZLb+zoAYtLThws8g28NVnIxtBqYPs3IIGTCbWhov+n/ZpOEa6sw2X45CkEYhhJa0mZIlpN4n730CV1ivPB2GKWCOqOWjvP9QEDW2gQqMSpo7d31dcsOMzIo3qo/+CmZdgtlW857nwg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ec7SXkfl8+5L0xUbtJWClef2DtG6CZ+mCWxQpkNxAwEUr1d9cRZRRSakYdtT?=
 =?us-ascii?Q?Ys653v1+MivVBl/fRxud2OGypnumnUUlit9aZrTp+WuUjS5IwXyHDOUAgMwm?=
 =?us-ascii?Q?pVkkE26gD+jCxpO1M9RXABqPw2/1PhVLvORckls7YeyhZNnlZgrk63iERZCh?=
 =?us-ascii?Q?Brpp9tX/iuXOHhfV/Svh+KTj7tZH5lr1lbehbi8vjA/+tOwgZ2tfy5FFdsTF?=
 =?us-ascii?Q?YlRHSXy5m/cM21LzCZkDP7yMnn8Hq9Yl4ucAf1gIT8E0//GZd2AQOICDVquz?=
 =?us-ascii?Q?1hRBJgM2BoVNHbCSwW7V0dsebQnoV92nU7n+OlWjscZX2STkWRaOmb0myM/l?=
 =?us-ascii?Q?3D+VeeCGbh/0WWX1aFZaRWXDZgWPnqtmfDTJDwgU6IDO0kE+wrrBVGb3xpwp?=
 =?us-ascii?Q?tyRir3rUnQrYYMYI8Bvu02jMd7AsBfLkNZjAQH3cohl+JSxaQTWE+DHMjo3Y?=
 =?us-ascii?Q?xT80oo0We4dJ8kEgOAov5VGeaj04k6gV0GlhFQZHKgViO0X3BjU17faUMCLq?=
 =?us-ascii?Q?1XDEIcZzTPihMwX5SRqXV2lcGgjB9BkW5x1shX8TLT1meZp0tHHRtU9QQy70?=
 =?us-ascii?Q?6AX313UgqPgE4eg/hOhBdX/BJ8GDOP3zZ1EEUqsHmTAsP5MT44Qh97F3Gt7A?=
 =?us-ascii?Q?Sjwds0UsZl1lEiZ9xn8TdjKMBOadJ1AvTyYY9+Xx0pTi6nZgpPBRMkmO27Rn?=
 =?us-ascii?Q?+7WTaCP1VETsLvQenzqJNzvW/2nSwYDhDrq0NrJ6/m+q1A++fWyeMI1T7heu?=
 =?us-ascii?Q?qTOJeVIEYqVl/ddIAMm8rh5R1Pxm9cgX/9Gurs91GI9THk7knsaXGargv/Jt?=
 =?us-ascii?Q?y2CXeILRWpQXnn+6aNpI6XHyrxf/11zQw/jz2iE4cezUvnVBoZqrzNS1qWPt?=
 =?us-ascii?Q?pyz0OhZmMFOT88ONWUwW8pCjud1O2t2MYKnTFpdVMOBZ3P7SF6kgzD3dO+vR?=
 =?us-ascii?Q?fapIeE8jS8dyz14vuQO2p3qb9vhodvqhxk73RhwYiQQugY4g3j4uJSEwBL22?=
 =?us-ascii?Q?5u8Bw169dPC1sFsxHecuj9bULCw//kI6FmJz1IjOUe7+QezPh4P74JYrsvwZ?=
 =?us-ascii?Q?T6ddYLrfSNg6NsWaNXrkk7W+TJCUZ3buXsM5MX010mS1Su5ROYSR/nw51XvP?=
 =?us-ascii?Q?eMp9v0I4N2eFitl8N5nR/yldjzAAEsX+1DGPpxhb/vcWKLZfniwJbV/r8IzA?=
 =?us-ascii?Q?fj0g2+tD04thrXbitgynEQ+d3A5/ptmuOS2NKC2k9F8/uKUcMqLHL0HrbulS?=
 =?us-ascii?Q?2BVzINZMdyjeVUVtVySqANdxgJ9ZuTa1+jS5wj4frG4lzdNjmdiYMsz2Slaf?=
 =?us-ascii?Q?vuKUYBQRbi72OcvR/iAT0FNIQ+EU5zoeDyU+46zHF1GOmxPH52fmRlzagEbu?=
 =?us-ascii?Q?P6muCDM9VFaRz/5OEb+Viadap2EnGfXOEIrvl+uDbOuG1U9MIbG7uMK8OEyd?=
 =?us-ascii?Q?gsZTtpOY3RsN6HrS0ings9hhetpixAJ1CdS41s3LEn6V9ITh0zf80gTQ544r?=
 =?us-ascii?Q?dhED1l7NluI6UGrZyB4xLWUwgJHO3bQvzbnXYcUXToKShFHFP114A5JS8UQh?=
 =?us-ascii?Q?iaR59EfVKVcJS8N8fDzXEtK8wdE2TXV05WiBex2YhUOGjjyaFv1PZ9JNC5BR?=
 =?us-ascii?Q?bZVbHK0h7LQoLa2hFHtMhCVeIUU9octLbbSXQKlwyLGeGFcyH+ck0AD7KP0O?=
 =?us-ascii?Q?jh3F3xk+ohbNVX5XSe3AH1eXgpvmjRtTUJS+XP5fW0jS02OqB1Kd7bfl8KFY?=
 =?us-ascii?Q?M/Br9g4qvA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c867822c-e707-42fd-e7c1-08de91ef93bf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 02:12:09.6650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbbbH6qfe64buxLUvfLnwxin3dKfa2JUnG5CIsb5VBG1zHxERL/d0M3C5D0Z4uaJbUPbGzowD3TAvMrpPZlB5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177

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
index bdd5eed760e1..5c304fc03467 100644
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
index 0c8a74f0e8ac..9dac3288f3a3 100644
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
     fn management_overhead(fb_size: u64) -> u64 {
-        let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
+        let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .saturating_mul(fb_size_gb)
@@ -145,9 +145,8 @@ impl LibosParams {
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
@@ -155,9 +154,9 @@ impl LibosParams {
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

