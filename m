Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183363F880D;
	Tue, 17 Mar 2026 22:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788063; cv=fail; b=jjS090u0uh8kDHTHPtOVS9ag4MjnLMjTHvLCDTr8Cms6C9ruAITQT0uL3zHSKsvRkZsasziQh497jjTBk7SaQx6u520O26ev/SGFt0voa+2sNyosA78I2STP+44zwzOTN1JqexbPcT8Y92Deon/wIBRydxjL2YfzH/3WDhlltZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788063; c=relaxed/simple;
	bh=CoZMlWWGxUBFiBndeZB0uSMxCQtkcaoW9hF8YN/f0SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kz2CZHZXXCppMeUVxgbmdIys4eT99yIMJ9x8ScTIa+bqxhH251RxPgxyfGw7unloVZS3aglnpCILJBxNd+ajd68SBJbHaMiCFLyWwz6/GTY7BfTF25nFDnSNNQ7jrYlpI/V1QRuqhPkY2biiPLTK8kGmoiB/fcdpBM//J07ZlMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Fq0k17WI; arc=fail smtp.client-ip=52.101.43.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fq0k17WI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddOLtOT1sU3W4TB11GdOuT0CO7n6635DIQXajjArt2jF1Vg6q4SWe6zr/SNdbBMsIjZCmWOGqBh/4UVaMpUZ4U/8Ehgz/99VWP+2y+cr2exf0dSh+G3Xl6K7dW/J0SYX2SbRa2sDPPUByaaEZXXlvtM850RuOn0ia9fmM6J3xAGO7yURbWwPs0pJX4bQw8/UkxvL10GwQxopwdmSlSg4t9/jQX2dNiouyJnAn2+Wq0Wl1RlQHnSzHqzg3S2e+7J3+WS28dQkDbBQAxycEjEZ9vUHog2vIkGBqiOkT87zq9T1O0CgOboCmGgIYodPdc/AqXYZQMLebB4vZp7Sk3RkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgG/OtMe6MHK45OQfykbm5eYd/0iMW9zxrMDcNg2Hz0=;
 b=h5eaFCbmXSie/jkbaXsPg7hponVRcMmdK1s+nzcZgwO21VAx1bZvGbzBTkGnEYbR+mrGOm9aOb793LaPTxnImIMu8YOYOeljuiFTAOJuYjBWHEu96vH8ZJiDistWdJD85zRPKbqrg25Q8Z8LqCv+JVNIrE6i2NPWqqwA9GvBYD0/Ls3lD5ZpRGr5Lt5E4XamqTxcPJ3kDOTyIfOI+3vtR7VK+MzH77AOLNpnLWKET8JY+5nziQAMuD560B7Kr9XhTxrnxFsraDqbdFFH7x2Wn8rJeg6I+Jn4pYvg3vSN9fgGyWSP78pUO7O0RVFgckZKvm50+Vi1OvtFiZAJPlO6fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgG/OtMe6MHK45OQfykbm5eYd/0iMW9zxrMDcNg2Hz0=;
 b=Fq0k17WIB8okVSAewdowlTjU90IAeY3ws9v7E3HBavGWJj6g638V1yr/feBHuZb4GJjCp3Ml48BYMcpm7dhxoWvZdFLodv0p7qphh3bQ7O4EQDICuQVRSr5x1tfl5MOu3IlAvqyMMvU8/P78foyevItsKLpOi+9Poc1D/blwY5cMMrRSHliBjaEtGfvYSecInp8k9gRPeJbuwOv8GhYQuhf+45JdfLPEV1khQ2thF4vMbGtd+6xfyYAkwmRTItdhwBmMxuRFYxpT7fHS0Eo3XAe+JnPlkHK/oevkBS0sWaVelhYzqHE6aK9CyPSl64SNxhyYgBcwkjNEcdR+SRGS2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:06 +0000
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
Subject: [PATCH v7 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
Date: Tue, 17 Mar 2026 15:53:30 -0700
Message-ID: <20260317225355.549853-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0032.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: d79b7aaf-0ca3-4c29-d242-08de847817b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info:
	YPidnYRV7/toa3cFR+NwBo046Gv6hztxqAg9rTcD5r8CJMlKDozHPTkurkdU0bnTkL05WfXUuIl007myAmbj8Tycn9mTYl2lvZiU1NNulBuLhZTSF+xPS8kgUMNL/P1Gl6dOLDRbUKZBlRik12IwLv++ypjvflTFNOfrqF0V8uE48fLaz+rcZE1OmwrCKR7OdrVH0tfFBA10VbKISFvyWmsrhxZFIaMuNee5W7p33yAXb2n/4V/Ts8emLPW9D2TrwuR6Y7No1tfQe7CuOxV8FoC6Uy5cN3l8+X4pewC3DCX+iUt1wNeBi3jDvRkkalOpajLbAPUmNln2PSKaGDDqBK8mGqVAU6M3UQKO+iWuzj/OlzUUdwh9PtcqWeMUJYZf9r8ASdv40/KTazycxU32RUvjl+K/IYcUwaUCRF2Yd/gLCVhbf7lZK+cPiHrmEulzKsjMnNSyEazXHdSDsfQnFz5CTyaEOMeFUQnW8nzgZiBu+oMfX1kPhsUxrscsJCNkRaIVP3+Czlqg0rWE6BB3EN6d+uTvrgXmxGa1xDGTX2IRW9ueW+sONigAwHXB7PllMuHZDcqFlXhPGEGgUgoCMm0+qFNPwaiUsSBSfGRIb+dazBE4qlWme6KyUfXz68EH2L4hQiHqw0NdNCHoBs9CriXByc/lNrekVq9G23Beba4whBFnfNsKxccb+/A/tCdYhNFeIPSSzwaZ4hKZzfU9FfSyPVGoiPdMRNtNHq3h9YY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uNXHv2bco4Qo5Rk16Ge/KFSN72GFlzP7wRNahfCQiBgyPjU9g1GnU+ayRCrg?=
 =?us-ascii?Q?G3HJtPDpjUeflVSGZJ8R1jN7HIvqD9mPbZBZGYvzTcDzYeshGdq589IAYtJ+?=
 =?us-ascii?Q?fRWt4fsMTyiIzL+gOaSGHaEcwlO2+2veRJ/Uqfxny7g02siyXEZ0GxrXM9az?=
 =?us-ascii?Q?zNlMd5mG7KtZe7cYw5Tu1D6tJDJJXJMaeYEfHiYrpUUjXiPhf7EDKgSvuMrS?=
 =?us-ascii?Q?hHEMOcO86kS2Oyo1ayOLoj3iDyWvaShMGeQgwBJcL07sZx3rdGQAcjZyVx4F?=
 =?us-ascii?Q?rltxueEvzonlzB+W/xfbAZSwMBu2g2SNrDY023IQ30XfFnMSYrgSsInsZn6R?=
 =?us-ascii?Q?puoeMXoSbfDlXshiDNZqwa76sAvbtquEeeK8SM3Ad0r8cdMahAzimTcDvfbE?=
 =?us-ascii?Q?gGLQkyeWe8N2huJ9rdADcmWnCO4A9tqy7a9xg54aX+zC6xyOQpdn9Oc5j6de?=
 =?us-ascii?Q?m9kuZZ6/z+ok23SefmtS0sxm/+fRbdS5m4MCGKYKh2FW88tqzdefnXJBgfgx?=
 =?us-ascii?Q?17F0BGSlpba+OwRqbM9CCLen1SxZzNliAGEFTyLVtuorZMTx13jddHUXjXt+?=
 =?us-ascii?Q?Z0MNRx3gQ8wtHYIlw/nA8Tq3qGnG+5HBMsGa3gGfeblSpOVKdmqmSNJFs0bz?=
 =?us-ascii?Q?gjFY15wwMV6hJbRjT3aWZoTMMeuLjNAHAPK29eZGM6fEtZbOlHWPDo78ZWjE?=
 =?us-ascii?Q?Ip3RWpvY6jD1S8H/WW3NXfIzy8dZcCsEcTka6zdRYFFFaeje+zv4Kvc6bIX1?=
 =?us-ascii?Q?369V8J2a4A11lsySu2c9bf+684LPnaua7e4bII4Jpd3HTy3LUUGz1aSbHaKT?=
 =?us-ascii?Q?2j970NcxIjxX4qlzq1nXden4ZRWf7XzduXl25aj1AdyNxB2lFjlXVy/hg4XA?=
 =?us-ascii?Q?33v8NkQMYvY7IpviPBoD3/Mhqy8aT/PhyztbTDVhR+mfEPRf+4BOuuNKMhlJ?=
 =?us-ascii?Q?sH1REFPmV6a9hEsSIA1AfPQvGFthPWMDvS3iplmfUPQAkXvyGn7vltuQ1IfA?=
 =?us-ascii?Q?BFncT4uAayv1k4+EW7vq/GGoy4ztlKG6XVm335kJIChLwPjFMSU1jNciv2kz?=
 =?us-ascii?Q?d8bfh7PdERWmGffBLDd9Vk5sSS6HGlF6Bg+7GX/b6y02TSCkldcZAz9Ss3g1?=
 =?us-ascii?Q?58VhY3zXWP5c+4ZuwfOPIgrb1UP8Yr2DBcKxsUTBzILBh1yCyy8Zk5rT30uL?=
 =?us-ascii?Q?hRauRzpfUG9HzUtzihyodv0OOXe/GeeZMU4jP6VTRK9icOvjyqqQ469ByoxF?=
 =?us-ascii?Q?mL0y5aN5RTl8RQZzutZWOj52ZUIQCz6oUJL9uNJKOq6KaPa+km9tbfQlSmKj?=
 =?us-ascii?Q?HQmdnqQaGqyvyfRz+bGNyygNwc/VG5ZbirfKABtNXK8UbWBRMrJEOc5km6cI?=
 =?us-ascii?Q?MclXrc8RV7DPrh26RpPMShcUlhzaHvaZJguoxD9Fb/4ORbRQVjfuBmJUWqMV?=
 =?us-ascii?Q?UNFaykZ+z/mgvX6kBhY5HRs9/kFuW3O46AUSaKevlhzYZLO0E+iM3+vVVwbE?=
 =?us-ascii?Q?nJlbcvL78Ycq/csb+wdp/N/QcYpXGiu7OAAA0Ra83Nad3/pN0e+UBELh+Bxs?=
 =?us-ascii?Q?MPt2iNtRtMH6aOTyQO2hcfH3hHPKgl5Z8IV2EDRPmM/GFLSGm6ARqjlwk35B?=
 =?us-ascii?Q?wh0rv9L9DXaCBDSvf5eXzsZDh7v2egIqpbJgfQqCQYcxm2hTipZd/tR++gyZ?=
 =?us-ascii?Q?Hs4XLiBExZqxwA0mxkI78+WSiHS1o32plxECLJgmXZ49Z10tAhqcIinbw5Kb?=
 =?us-ascii?Q?Yl6/3dL3Mg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79b7aaf-0ca3-4c29-d242-08de847817b6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:06.3767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zukfquqp5HmTZO/lEDwkt6j2S5EOfisWCKDZd0C+bLXncq9wEO0QPeju+CibtLiV4jqUcnFrMJQt0rFuZzZvkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Hopper and Blackwell GPUs use FSP-based secure boot and do not require
waiting for GFW_BOOT completion. Skip this step for these architectures.

Move the GFW_BOOT policy into a dedicated GPU HAL in gpu/hal.rs. This
keeps the decision out of gpu.rs while avoiding unrelated subsystems
such as fb. Pre-Hopper families still wait for GFW_BOOT completion,
while Hopper and later use the FSP Chain of Trust boot path instead.

Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs     | 14 ++++++---
 drivers/gpu/nova-core/gpu/hal.rs | 54 ++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gpu/hal.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9e140463603b..93f861ba20f3 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -23,6 +23,8 @@
     regs,
 };
 
+mod hal;
+
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
@@ -309,13 +311,17 @@ pub(crate) fn new<'a>(
         spec: Spec,
     ) -> impl PinInit<Self, Error> + 'a {
         let chipset = spec.chipset();
+        let hal = hal::gpu_hal(chipset);
 
         try_pin_init!(Self {
-            // We must wait for GFW_BOOT completion before doing any significant setup
-            // on the GPU.
             _: {
-                gfw::wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+                // GFW_BOOT is the "GPU firmware boot complete" signal for the
+                // legacy devinit/FWSEC path. Pre-Hopper GPUs must wait for it
+                // before most GPU initialization. Hopper and later boot via FSP.
+                if hal.needs_gfw_boot() {
+                    gfw::wait_gfw_boot_completion(bar)
+                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+                }
             },
 
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
new file mode 100644
index 000000000000..859c5e5fa21f
--- /dev/null
+++ b/drivers/gpu/nova-core/gpu/hal.rs
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::gpu::{
+    Architecture,
+    Chipset, //
+};
+
+pub(crate) trait GpuHal {
+    /// Returns whether this hardware family still requires waiting for GFW_BOOT.
+    fn needs_gfw_boot(&self) -> bool;
+}
+
+struct Tu102;
+struct Ga100;
+struct Ga102;
+struct Fsp;
+
+impl GpuHal for Tu102 {
+    fn needs_gfw_boot(&self) -> bool {
+        true
+    }
+}
+
+impl GpuHal for Ga100 {
+    fn needs_gfw_boot(&self) -> bool {
+        true
+    }
+}
+
+impl GpuHal for Ga102 {
+    fn needs_gfw_boot(&self) -> bool {
+        true
+    }
+}
+
+impl GpuHal for Fsp {
+    fn needs_gfw_boot(&self) -> bool {
+        false
+    }
+}
+
+const TU102: Tu102 = Tu102;
+const GA100: Ga100 = Ga100;
+const GA102: Ga102 = Ga102;
+const FSP: Fsp = Fsp;
+
+pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
+    match chipset.arch() {
+        Architecture::Turing => &TU102,
+        Architecture::Ampere if chipset == Chipset::GA100 => &GA100,
+        Architecture::Ampere | Architecture::Ada => &GA102,
+        Architecture::Hopper | Architecture::Blackwell => &FSP,
+    }
+}
-- 
2.53.0

