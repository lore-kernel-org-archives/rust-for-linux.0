Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79A7386C10;
	Thu, 12 Mar 2026 03:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285321; cv=fail; b=ic3ea0H5trEAC2bB+0S5d6cIXQrIhMai9mXqvj41I1Wi4CTbRYYnHvPIHeVNGMlV3FbSMgnFYNiLaRjBGTE1ddsNHAhZNMn/LhbWQPtT00744k1bk/1Pl9ubz8thLQT17dq0PoevelaXCGfQz70+jXi1zGMv6j5tIwNOhXUt36o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285321; c=relaxed/simple;
	bh=lI7qZOoj92d8xQOIDd97/YN27YEB5Hrxpkcg/YyL7Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p6qpFdG9MZ47+i3VybpFF9KnKLQ6iOCmKP9hSxOlUzqiWhrV2yhKcsAv/8Ux+39P/yNmTPVWGxy24Cw3fk9IpX32O3GlYAeEFbQpmKt8XmUMrXpK6LwYAhxbT5WnhNEPEQ6elS86Zjkp0NpcVHOwscnmjf6FZLtZM3EK05O64K4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kD7AVtlK; arc=fail smtp.client-ip=52.101.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kD7AVtlK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VifA8sLFID0M/m+GRM7xQ+TC2Jj1ZaBIENrmCZd6GqAmlx9YHDXgTkMTuwZtFVfI+BCaL3inx0431Nd1o634R/VGAqPr2aWTlXm5QtU1pCLJDGAvq1GiRZfUWCkdL1JA7QGjx5GmqoyZptzQkBqUr0U9hqvKPXxLt1bqkxefk22obXxDjHHT5gtznj0MYXReWYIbybVThaXKWFGJNiKwAFQ84kdTVW6BhVy73bjrSR0phnxnKTKeaBRA17xQ1uGOg5u3ZHKhr98RJjc2Cron5+ewYczTb+sl8QIJxYLh1aKq4fpZFZXavJ8d7EsBN3p3G/wMg1sbE4bbbNaoTAzjog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQCCLGqSytDAho7+XlCRn6hGSFl5nBSvQLpPIIyD7hE=;
 b=XGW9NwrMZl2IuB2jzuMJ/P0e8zrOe01YLm8xdU6Pb/89PQMZKR/NOOzQJcsTbjJ60wBZzcrF4TA06fY0Bp+TXjypIfivVB6mTeXKJQ36gN7pDNfuzO2jMXRIm0XlpnRBkGe801YDVKjF5qgwsKaKysbUiDQrB2Or4Q+eRe4ywB9UPPgr816t6iYentm04EG6LMAmaFdycWElF1XqZGN84AgzZ8cMf5+F6HsinUZCHMwWET/pjcmNbKtyTYtBpaG28aCwU72abYyITNwykyfoJH+1p4bx3fvzsY/X007sKrQjykFzi+Acg1qA2EicwywUwgLkYbF9L6XI35mpWtHw2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQCCLGqSytDAho7+XlCRn6hGSFl5nBSvQLpPIIyD7hE=;
 b=kD7AVtlK38RCYgrKwl9PNcC3brrN5n44PMDHtY44UDULjKJroKaKAoD3LmeNVblMpV03t/Kmk26pyJruNm7yNYD4wT0cE9P4kUmQhGU+WO5ca5E9C7GDlaPyBcv473i0VqMQdzrS8bIofBuLB2yyspcmKnfQ9UPpa6cryVXGL0TvN+acwjTk47trB5EPuvFiFn1AsvEuoUJBkNuHYJLqLIIlKa5BCT1wbEVLTTdKKNjJANFFNL9rdRL4WUZre3pkV++SOPLJAfvxUwVq2/o8+umlb8uuN+TGNV5mRKPrsrwDwv5xekwJ//xvKFpvCPv4yTxy/8SrwFvGithTFGLuKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY8PR12MB7563.namprd12.prod.outlook.com (2603:10b6:930:96::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 03:15:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 03:15:13 +0000
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
Subject: [PATCH v2 3/3] gpu: nova-core: use DeviceSize trait for u64 size constants
Date: Wed, 11 Mar 2026 20:15:07 -0700
Message-ID: <20260312031507.216709-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312031507.216709-1-jhubbard@nvidia.com>
References: <20260312031507.216709-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY8PR12MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af65c28-a40b-421e-8ab8-08de7fe593cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	tBzPr97+u4TCsx7AxuiTuqcpHpi3Ktxi4S8vaaErMvD1v0fc8HMSBqNxcM/xp5B1TV+tHDXR0M84bW40N26r5i04FznriAvbZkxShOOT8xEv/PC+e9aX41Ud/ZepGwwQWzcNRs5/3/qTdnJF65zeItujxFyCMISB4vWL+iV4JrxZvED/HthxzXHB1H/ZFEnBghvKGU0pGFsfdqmLTmAb380M6UtRMRPKDcXmWiyalFpWC4KVZpnOLsnm5o/TMRjQzxZVkKjvdNEl2IRiKnLNAwyinNYI9J95kgFau4HG01uFZK1h9NzbKBVf7OVJU2isuh5Kk/1Pv52ywVh22IYvaVTK3/IoE9hq49gtwGcLwioHUmvd2T+SekqWErlnQNhxNs0L/Y3OGb+KXf1vbWKW7/16Qqcjo9SkOXrlbY+h8c6rXE7QgsJrYUvI5eIrCEaXkY2GBQMyeIQi1uRNMtzfLb818nuyYRCNYGUgH30OctGJaYvNOdar/Gqr4F9CiuW4ZIgpE/2BZf85sTTe6nvbcXPOqrSeWSi+Ky9Pr+vF+tNlGe+RCqvorPOGiSb04RI8GhZaaSC1sdI3YPTzuSV6+T7MhrJH/hm5qJVow0GJUFgm9oQzz80SkfHz5z2GeS8yY7tTIl/+fi+WHPhZ7RtP6N7BTSY1zHV0sX9/onTsyg3kv13k71cJqIyUAe7h92n9iUAlUNSvXiW/342rWFIlSmxkK4sYfV6N1lzTrBI7bs4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7xrt2UILG2jOy9qc8g/rcLMEJMMX7NnBEyTL7uwLEuheRXS5eMaPHSizt7fn?=
 =?us-ascii?Q?gD2kjF4/6YOHXoHNYcOjhoSLJg4hGKe0MJZsAi3ZP23SM350LtI+chKiMy4U?=
 =?us-ascii?Q?5djKqn063Hhco4W4VlpwWKyQmrke59Go/0ANUnDgae/i36aDv9fsjSKRLVQv?=
 =?us-ascii?Q?SICk+cBLQI5Nkh9KauU83V+fDfVoHAxCDsisCjqAXbg8onlOmaQTlQSWkG+S?=
 =?us-ascii?Q?0v89Xz8zC8JDqByk6OPSoMBHIRQZbweeR0u5k2gQB/G6UXR5SHALiS1uTK10?=
 =?us-ascii?Q?OwJnE+LNKYqEZUlQiOEaKtV5B/dRt9LkBvZ06RWG3PV+N/Abuy0aMhl9PzW8?=
 =?us-ascii?Q?3vh5ThTIdVuaSQPj485CqsRnWoSQQASKYbx87w7wS9+1MnqVRDmxf90VWWWY?=
 =?us-ascii?Q?St7u+FYXw7GSQBoQbWzqRB9FJi+8qhFgm729f0XaRduXgMx/F+KFyQiLJ2Oa?=
 =?us-ascii?Q?dONfZRJ3YLVjZcP7t9a/7Wl2RZjHj8QLL7ED7rLBHyNZBftCzcbYCBMqzhVE?=
 =?us-ascii?Q?fjuYpaUhN8Z1TXbosURmQjP6/ZQQezjg2XHxXYhA0WNDAAIh9wxn5IIgHsTA?=
 =?us-ascii?Q?L8sRjFJ8uT/VGdeAoIybQrlkIREQs0G55oy9SJO5i2D4XPhgCRXg75LVuXq7?=
 =?us-ascii?Q?Oa+QqWyOvSEZ7c/z8+jgdl7UCvCf9AJ+Cihj9ZOQbb1rdUIvQl1dGhnhGnEr?=
 =?us-ascii?Q?Xy49UwmTfC1ypM9LM7lNbdIOyFxcfpefetqUL2S/QyMO3miAtk0xxN6YvltT?=
 =?us-ascii?Q?vVsHu9ELIm2+NVXBPwpmikJrxrJDKXSpd8+D8NjPJ6luv3mAj3r5JlMlt3Wl?=
 =?us-ascii?Q?dm+JrC89jla27Z3uReySAuAjmFYlsmLTjCYp7YF+4UyAjh/GtrSusmjS6QMQ?=
 =?us-ascii?Q?EwUo4fsKBm2LiEcm4DzCnDFoHkPP/1fM6ntr/XPKF5COskxz9E152aG6aho9?=
 =?us-ascii?Q?FWiLvTKOujKMOuGb9mEFi970GicnJg8LMAPQZN68NdgLHMFRrng3kWf8RpsU?=
 =?us-ascii?Q?1KrVrgiPZtJ3E/ILwi8E25qipRqRaftzTwLXPNXpFm+pmG23uMiXDB5tC1HQ?=
 =?us-ascii?Q?rZSFt/o+3L/R7hh3/V758c+D690RDIQfBy5Hgce+24D2qCXOFXkbOsfIOfKB?=
 =?us-ascii?Q?npTrbw7VLH9CgwNH4BoixwxEJxD204xhY9OGI3MSJJmx/lYTZuEpwynBdwBr?=
 =?us-ascii?Q?g6J2CkK0eQeNoX9nMHHE0QT+WfzcPk2NepKpUMgN2quBX0go36x84BbHzJaw?=
 =?us-ascii?Q?6dbibkQmNF7kiTz7MqtmqmP9MpT9IeWa5ZePj6gPxjqKL7cznj9p9b9NeCv7?=
 =?us-ascii?Q?FOVZuarOGoaPF15lBd7hYWv9F3BIwmWjweRi1nANT6/ohxu0+0VYhndA7tEk?=
 =?us-ascii?Q?02e5XMBn3Ix2endi1efYWhJ84W5hGol6o8vLtJ+8z46oeiqGQ9GWQ7bBiXYJ?=
 =?us-ascii?Q?LtKbsZY6xn0AE+6XcpBTXc9pjUlJIcPFaNpE5bSitSXB2L0/6NwHeHgEoEP1?=
 =?us-ascii?Q?zzna8VzhlzPmsdqgO/5Es/tNrt2/3ABjr72rViXhSFjc+JgiSlLGC66oCU7C?=
 =?us-ascii?Q?CME8qDEDs/iBdZbGxqqzaRYtnaB3AMVBDWIsRxsr9AiYG/5Rxrh/JDPdfbGv?=
 =?us-ascii?Q?vRNw76aoqVNihQfG40EAMND+UfDxbo+ctArFgipyG31K/E61F8waOz6iD/6b?=
 =?us-ascii?Q?YYEkkvhFLTUud9lB0/SZt2+LwwuQz/HW5dJWBQHteReJ9oBoVNPnV48l75qU?=
 =?us-ascii?Q?39VIM0XAvA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af65c28-a40b-421e-8ab8-08de7fe593cd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:15:13.8487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LiFotZh0AOrrmfruTWLd/IMAVvLvfdbYQKvHWMUX4WZdE/oYfHOGmg6Ql2zQDBkQP+RFtJscWE2rk4i0A6esSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7563

Replace manual usize-to-u64 conversions of SZ_* constants with the
DeviceSize trait's associated constants on u64. With the DeviceSize
trait in scope, u64::SZ_1M replaces usize_as_u64(SZ_1M) and similar.

Also switch Alignment::new::<SZ_*>() calls to Alignment::from_u64(),
which accepts u64 DeviceSize constants directly.

This removes several now-unused imports: usize_as_u64 and the SZ_*
type-level constants.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 31 ++++++++++++++-----------------
 drivers/gpu/nova-core/gsp/fw.rs | 18 +++++++-----------
 drivers/gpu/nova-core/regs.rs   |  6 +++---
 3 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6536d0035cb1..aa80fffc4a30 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -13,7 +13,7 @@
         Alignable,
         Alignment, //
     },
-    sizes::*,
+    sizes::DeviceSize,
     sync::aref::ARef, //
 };
 
@@ -23,10 +23,7 @@
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp,
-    num::{
-        usize_as_u64,
-        FromSafeCast, //
-    },
+    num::FromSafeCast,
     regs,
 };
 
@@ -126,8 +123,8 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         if f.alternate() {
             let size = self.len();
 
-            if size < usize_as_u64(SZ_1M) {
-                let size_kib = size / usize_as_u64(SZ_1K);
+            if size < u64::SZ_1M {
+                let size_kib = size / u64::SZ_1K;
                 f.write_fmt(fmt!(
                     "{:#x}..{:#x} ({} KiB)",
                     self.0.start,
@@ -135,7 +132,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                     size_kib
                 ))
             } else {
-                let size_mib = size / usize_as_u64(SZ_1M);
+                let size_mib = size / u64::SZ_1M;
                 f.write_fmt(fmt!(
                     "{:#x}..{:#x} ({} MiB)",
                     self.0.start,
@@ -185,14 +182,14 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 
         let vga_workspace = {
             let vga_base = {
-                const NV_PRAMIN_SIZE: u64 = usize_as_u64(SZ_1M);
+                const NV_PRAMIN_SIZE: u64 = u64::SZ_1M;
                 let base = fb.end - NV_PRAMIN_SIZE;
 
                 if hal.supports_display(bar) {
                     match regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar).vga_workspace_addr() {
                         Some(addr) => {
                             if addr < base {
-                                const VBIOS_WORKSPACE_SIZE: u64 = usize_as_u64(SZ_128K);
+                                const VBIOS_WORKSPACE_SIZE: u64 = u64::SZ_128K;
 
                                 // Point workspace address to end of framebuffer.
                                 fb.end - VBIOS_WORKSPACE_SIZE
@@ -211,15 +208,15 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let frts = {
-            const FRTS_DOWN_ALIGN: Alignment = Alignment::new::<SZ_128K>();
-            const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
+            const FRTS_DOWN_ALIGN: Alignment = Alignment::from_u64(u64::SZ_128K);
+            const FRTS_SIZE: u64 = u64::SZ_1M;
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
             FbRange(frts_base..frts_base + FRTS_SIZE)
         };
 
         let boot = {
-            const BOOTLOADER_DOWN_ALIGN: Alignment = Alignment::new::<SZ_4K>();
+            const BOOTLOADER_DOWN_ALIGN: Alignment = Alignment::from_u64(u64::SZ_4K);
             let bootloader_size = u64::from_safe_cast(gsp_fw.bootloader.ucode.size());
             let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
 
@@ -227,7 +224,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let elf = {
-            const ELF_DOWN_ALIGN: Alignment = Alignment::new::<SZ_64K>();
+            const ELF_DOWN_ALIGN: Alignment = Alignment::from_u64(u64::SZ_64K);
             let elf_size = u64::from_safe_cast(gsp_fw.size);
             let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
 
@@ -235,7 +232,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let wpr2_heap = {
-            const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::from_u64(u64::SZ_1M);
             let wpr2_heap_size =
                 gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
@@ -244,7 +241,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let wpr2 = {
-            const WPR2_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
+            const WPR2_DOWN_ALIGN: Alignment = Alignment::from_u64(u64::SZ_1M);
             let wpr2_addr = (wpr2_heap.start - u64::from_safe_cast(size_of::<gsp::GspFwWprMeta>()))
                 .align_down(WPR2_DOWN_ALIGN);
 
@@ -252,7 +249,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         };
 
         let heap = {
-            const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
+            const HEAP_SIZE: u64 = u64::SZ_1M;
 
             FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 25fca1f6db2c..454a4a92105a 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -15,10 +15,7 @@
         Alignable,
         Alignment, //
     },
-    sizes::{
-        SZ_128K,
-        SZ_1M, //
-    },
+    sizes::DeviceSize,
     transmute::{
         AsBytes,
         FromBytes, //
@@ -69,7 +66,7 @@ fn client_alloc_size() -> u64 {
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
     /// `fb_size`.
     fn management_overhead(fb_size: u64) -> u64 {
-        let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
+        let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .saturating_mul(fb_size_gb)
@@ -91,9 +88,8 @@ impl LibosParams {
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
@@ -101,9 +97,9 @@ impl LibosParams {
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
@@ -181,7 +177,7 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
             gspFwWprEnd: fb_layout
                 .vga_workspace
                 .start
-                .align_down(Alignment::new::<SZ_128K>()),
+                .align_down(Alignment::from_u64(u64::SZ_128K)),
             gspFwHeapVfPartitionCount: fb_layout.vf_partition_count,
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 53f412f0ca32..8514b4bd7279 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -9,6 +9,7 @@
 
 use kernel::{
     prelude::*,
+    sizes::DeviceSize,
     time, //
 };
 
@@ -32,7 +33,6 @@
         Architecture,
         Chipset, //
     },
-    num::FromSafeCast,
 };
 
 // PMC
@@ -129,7 +129,7 @@ impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
         let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale()))
-            * u64::from_safe_cast(kernel::sizes::SZ_1M);
+            * u64::SZ_1M;
 
         if self.ecc_mode_enabled() {
             // Remove the amount of memory reserved for ECC (one per 16 units).
@@ -218,7 +218,7 @@ pub(crate) fn completed(self) -> bool {
 impl NV_USABLE_FB_SIZE_IN_MB {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        u64::from(self.value()) * u64::from_safe_cast(kernel::sizes::SZ_1M)
+        u64::from(self.value()) * u64::SZ_1M
     }
 }
 
-- 
2.53.0

