Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C3B2D9EF4;
	Sat, 11 Apr 2026 02:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875820; cv=fail; b=ner/Uu1khlp5qI+YvHMpYsMcmp2KJO3L5IL+XOqWT4+y5VQGU3cBksqfU7joDeawgpzWjYVAvBlK6rxi+nyEPl6BEILhDyJRb1XQwl7CW9er6RgCmaYOCXDkZcC5nM1VI9Z8GvzF13/rP9/z/Ez3ghhg41UljqLGyJAamJjq4Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875820; c=relaxed/simple;
	bh=fElFbr230JDYgvVCjB5be1TgLtiVNvG1pjQKFVLekFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b2j2/hc1qlSwTnkrkc/9tCoWzSs2wgDNpL694EBmIXbOpmzk63R4/mcE40kF19edtlYmBai3iChZt5ItGbAUEaMYr5D610vGHoHqtRvWG9DEouTuHl/gFxszWi7jsLy2VpCrJpZJr4cfX5lP8kZwgNy+dkytz9p5skFivoGy7BU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qQ3jFbCo; arc=fail smtp.client-ip=52.101.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qQ3jFbCo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgCatYfoA4eGna/h/3XR9PDkjxDFfrAggILr7SfxO4X6ksiuKFuHhsDjCs/ATiAEt69yx+ZYOA28NSrFLJOjO484CkcvJaRI/YMv29j6mWasIa5K6/v82Nl0qJMyxCq47BQU5eTo1s+oB0AiqmupcxZw5VSSzXHGjsPLGdF4Fs+fIduMhqSms2n8TVFwKOuyf2xeOd8vHWolh+8jIWT/1mO1W8CrCqGid8CEfAqsqJawLwjwQEDgYlrqLjGYaDux7Wned2wK8gOft30R+vhkmBNAjj1X23o8Y8pBvuOeX1kiAmES7pyiGzPpc8oTUa85Lk0ColldJs7FqHlbzLbFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mb1yfwnoet5JqFyLvXdb24B/lQ+gcn6y9RIxUNVtTKY=;
 b=kWj88zDfg4+ZHGPOMlVyLP2PHtTsTmtf1Va8R9WYgh56bOxRLxHvol6HG3LhdOd6J74zljQZ9xBwHeVWyvlz/kkFd3tJa3SjFFHVdLQZwGVIZ0isFNNtJwyBpNY4nIll5Bkau63RQemJmDSmbwHTEKSognNgD+mK4tM3IJmepZx2qRjin0kfaOOaV934+YU3vNfX805Er9PeP2Ana+B/Szk85Jw2S/1QacVuZ6c/2/2Po+871NpNxDA6QBVxQbrwZ9V400mVzDrV+ImRHU94YJWEbhdyIbFL95Cqp1BwTW7QHmi1G394A/VT/ZpTdXSI2SduKq0MIwNrFDG1vjNkoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mb1yfwnoet5JqFyLvXdb24B/lQ+gcn6y9RIxUNVtTKY=;
 b=qQ3jFbCo8o2A0E5rsYuki8iYHnkefIfHxxwbAtFJNiNqsdgE/efJzr6LcY2EtPhfpmZ9HZP90H5PlHJNDB0i7iVItnN06xZviZYENCeMaVtSp3Pj10wOgBLRTlBx6N7rMEtZOyxJu03FC6aMCcM9fBEF+SdcsutRxW+BFd/XUqHBTGSR3AW4uSTFOli67nOawF8Ua5DbfgzIfst4gZqUjGdSG0lbft5KOlnU9v+7UzPUxJg7s0BW07i7ej36BfN7yBkMQnCopO5hSgb75NZkLjyWvpUVU/EOWj8f8d/+QEftw5rtdns49M9jiiNKVHAex6BI4jVngBpvZ6U5+pDlhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:50:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:04 +0000
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
Subject: [PATCH v10 06/28] gpu: nova-core: move GFW boot wait into a GPU HAL
Date: Fri, 10 Apr 2026 19:49:31 -0700
Message-ID: <20260411024953.473149-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e11aa16-41a9-4049-e0ad-08de97750896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OhtpxUuGI2OVPwiQl6rC/crC27a4fZTNX2AvTE8GyKXYNhl6rpE4UfxhvpE9+NVODf3yHrE6Y17DKrf5SJeQUQeYpQSh3coS+maFNf9qc4aNlSQy+RnZYsva3ZZdXF+j9NiI9tfKG3jiCramZ+vaikWuDRpLZLHyyKjB6WGR8hqXtl1sOjQgnDuvbtqGWIwpdsFnOCVtEkNfTr73ndDJjrnoEvtf7AheZv4kDAueEYSM05DM0451iOEBoYpUoQU/4n2QpTfXvya0L+WzE0yP4LKyuUC1eIbFx9ZaHG5xH2R9hu7SSVU7lo89X9vVcTw1tJpAZmbFHTtRhcXTBlsJJ+lqJHNhZrOKfSVFDbGAYpsItjVnyUp7wVVguCX9ZQOr/9J661Yed4aMeJQtXjYLtyebS4eMfLpDqr+K/lqCQusLQBGm42jim5pLtXphYCQs/Jfly6rCtKnZmtwi3l+U+eYIjpDpE+CEf0jk96Txpeo0NVJchnc1JERXgBjiVExVsoBRwPON/GibM99+ZkxZuZVMEZeWRsTgveUDLhK7wUE4eULxAuz0y9QZxeAUIX8JjSPyA2IvHRbX8jzubbnliB5m117dsq4xSQMzWJTjPrisyCoPt4t4L61rQ6CxflMOfwLzZiAu3ODESRItvornVzMOQlnMnNo/W8v1Z5VZIY2cZz3qFGUY6dZ2ssSlWroEgP3DZHEBlea7NWBwFCFG5yWponpN3HPxU7YaDjFDNWw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qVp3TyajjHdSPzdqankITwKnusWeCTY1c2NAkCJpiYP7uImQZM8TADNmsx6E?=
 =?us-ascii?Q?Wyg+K1jrggL00hN1sKN+c9yCsPx+oHp5/fhJqfzvS2vGX/qu8cBzWOyNgc8x?=
 =?us-ascii?Q?etcnLC6oXRODQDsTo2clO7QqCDQF3xVajtjL+K56TgRcTS9U+ptNoH/Mc23s?=
 =?us-ascii?Q?E7MCS7ZbH/JPNXfv+RxCXgQO77r+mb68ouokrrjqNg2nfrNX9I45Au25kQvs?=
 =?us-ascii?Q?aRDTcUUdWCkkD48JBpf5qVUjJs4kJLC08+MZWy4vgbXCEcsR1j7SaWAgMtAz?=
 =?us-ascii?Q?+xFt8r7N+nCVj8BSgawzRLjGm/pwccN+1vRrRPG7WkZOPpbZqRWnv56fXIum?=
 =?us-ascii?Q?8n/nbGJj71Kgo/XD0CRydWYb0/Y2jNoHoSIjV0ilp64gXkfyT3PhL8dqX8D1?=
 =?us-ascii?Q?qcKVKYQ9hT7E0f5zt/fs1zoSBG3afyxE5/X5FE77tXxuaqa58cG9yoxZpxkH?=
 =?us-ascii?Q?FkriHDYm1s02nWOiYJl7J7LdqkXLIN0mZrj4sE1wwJH5M7z15zLPs4OwmLbe?=
 =?us-ascii?Q?J+vJ9CmbqkVthV0sYkEloA52Md7NVVsps6r4rZPPW/UM4tACk5hdbdS5O990?=
 =?us-ascii?Q?W1oabkJI7B9XNVwCHBlIjUUXyeirfs7iMpuVuuWcTC3CcC+5QPiYe8THW+6Q?=
 =?us-ascii?Q?js6oemL3SgXQHxGybJlabsUMps2IkViUJw57KSw9KiVRVubTlorU3NgIE/tF?=
 =?us-ascii?Q?AIrW6mv84fgTvmMtx1wZolZSiNw56AySVpU9CM8HUsUcWiXJcPAD+ER+wYRF?=
 =?us-ascii?Q?eaPDNKSAx5HK5AyI4uoBRFVjjY/QgnwC9rR0ayZN2ro1zr7WDgJ72dItaku6?=
 =?us-ascii?Q?77UZqXxxmkLzqOuHlcrTohTfuaOx3JMyGrY9+928Lmm6D65tBF3sJ192QRJ2?=
 =?us-ascii?Q?Sz16xerbhMzFiCdQTug9wBsCyXSVmBZhR1URBHESske5RnJXiJNmGCoEQhZZ?=
 =?us-ascii?Q?BI0rpmNMk0buCbti1Oy2HAwzzUX199gtJ2sysTyeRhxw+RKAfzxGYKh5JRVm?=
 =?us-ascii?Q?3IhnTmwL0izX8eo4e/+S1YLrJPkqlWIHCLn6ySwTeAcmFd8qS4Tlr7xnExVu?=
 =?us-ascii?Q?c4cywJhU2ME5TicNZxuGTMQgnXCojrDwCb6KBhhCjDOubaMuE8hEBB2st0Mr?=
 =?us-ascii?Q?WycEFYwbxUq2Asu+zQ6yvpKP0Ye/09unQb0aoCZj/w2hUF0NJGdoDyMiikZ6?=
 =?us-ascii?Q?QsAB/SDArVIh2IYqZJPy/jrQR66xx9rPFrcYydGKcVIaI4bRqrGuSIqoJblf?=
 =?us-ascii?Q?H1IF8avvBYXThQR/aG6L/KZrjj5VhyKJxtiuvdCTVKdm0rYAw6Yv7MpXAACp?=
 =?us-ascii?Q?n1AwEDH/AK+FTSXIS4LWylVXEN4XUJ6SItkuZzbNf7uMviIUIB0wDWXy2hS5?=
 =?us-ascii?Q?UHR6Bp2WkNZ6hW5bnli3X9ZxM69uCvhqh7xKR3gqClXCnl/10XdIcSj/b9WL?=
 =?us-ascii?Q?8nGpV+YGVksTlu5aINyuF6+kUMdARp5LBiejvHFetW6C+OfL7C8zNXSuU0h1?=
 =?us-ascii?Q?ie6nFhcNlFNhqSBvE+hNRlm6R7WV5+ekUFtvZo4ye4iY9N+Em4Rq/hZW523a?=
 =?us-ascii?Q?axMFHTl8Bpr++C5+S0auk7bIhqrqTAhqU1NB6FP9tagg6+ZnSBTo1BtB17Kx?=
 =?us-ascii?Q?AQV3eV2IonKoU7lvA0xhQb25i0bIk8w9bAm4oTzf+omWYBl8++sBt56q9/W7?=
 =?us-ascii?Q?T1Q6tk+8Rn982WsagqFDzLYhrMi8O5TWYkad83sIq3MZclt+D4aA2IfOE1kf?=
 =?us-ascii?Q?n8XnN3PI9g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e11aa16-41a9-4049-e0ad-08de97750896
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:04.5646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeKbVl4fMc94DxypekCSU8g9bJf5SFdoXKkVzRcD0O/rRAaqbuVHG+ifhAEU+mbZroLTQFqOnP/shUzWMbpf9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

Introduce a GpuHal trait and per-family dispatch so GPU boot
behavior can vary by architecture. Move wait_gfw_boot_completion()
from the standalone gfw module into gpu/hal/tu102.rs as the first
GpuHal implementation. All architectures currently dispatch to this
implementation, preserving existing behavior.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gfw.rs           | 76 -----------------------
 drivers/gpu/nova-core/gpu.rs           |  5 +-
 drivers/gpu/nova-core/gpu/hal.rs       | 29 +++++++++
 drivers/gpu/nova-core/gpu/hal/tu102.rs | 86 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  1 -
 5 files changed, 118 insertions(+), 79 deletions(-)
 delete mode 100644 drivers/gpu/nova-core/gfw.rs
 create mode 100644 drivers/gpu/nova-core/gpu/hal.rs
 create mode 100644 drivers/gpu/nova-core/gpu/hal/tu102.rs

diff --git a/drivers/gpu/nova-core/gfw.rs b/drivers/gpu/nova-core/gfw.rs
deleted file mode 100644
index fb75dd10a172..000000000000
--- a/drivers/gpu/nova-core/gfw.rs
+++ /dev/null
@@ -1,76 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-//! GPU Firmware (`GFW`) support, a.k.a `devinit`.
-//!
-//! Upon reset, the GPU runs some firmware code from the BIOS to setup its core parameters. Most of
-//! the GPU is considered unusable until this step is completed, so we must wait on it before
-//! performing driver initialization.
-//!
-//! A clarification about devinit terminology: devinit is a sequence of register read/writes after
-//! reset that performs tasks such as:
-//! 1. Programming VRAM memory controller timings.
-//! 2. Power sequencing.
-//! 3. Clock and PLL configuration.
-//! 4. Thermal management.
-//!
-//! devinit itself is a 'script' which is interpreted by an interpreter program typically running
-//! on the PMU microcontroller.
-//!
-//! Note that the devinit sequence also needs to run during suspend/resume.
-
-use kernel::{
-    io::{
-        poll::read_poll_timeout,
-        Io, //
-    },
-    prelude::*,
-    time::Delta, //
-};
-
-use crate::{
-    driver::Bar0,
-    regs, //
-};
-
-/// Wait for the `GFW` (GPU firmware) boot completion signal (`GFW_BOOT`), or a 4 seconds timeout.
-///
-/// Upon GPU reset, several microcontrollers (such as PMU, SEC2, GSP etc) run some firmware code to
-/// setup its core parameters. Most of the GPU is considered unusable until this step is completed,
-/// so it must be waited on very early during driver initialization.
-///
-/// The `GFW` code includes several components that need to execute before the driver loads. These
-/// components are located in the VBIOS ROM and executed in a sequence on these different
-/// microcontrollers. The devinit sequence typically runs on the PMU, and the FWSEC runs on the
-/// GSP.
-///
-/// This function waits for a signal indicating that core initialization is complete. Before this
-/// signal is received, little can be done with the GPU. This signal is set by the FWSEC running on
-/// the GSP in Heavy-secured mode.
-pub(crate) fn wait_gfw_boot_completion(bar: &Bar0) -> Result {
-    // Before accessing the completion status in `NV_PGC6_AON_SECURE_SCRATCH_GROUP_05`, we must
-    // first check `NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK`. This is because
-    // `NV_PGC6_AON_SECURE_SCRATCH_GROUP_05` becomes accessible only after the secure firmware
-    // (FWSEC) lowers the privilege level to allow CPU (LS/Light-secured) access. We can only
-    // safely read the status register from CPU (LS/Light-secured) once the mask indicates
-    // that the privilege level has been lowered.
-    //
-    // TIMEOUT: arbitrarily large value. GFW starts running immediately after the GPU is put out of
-    // reset, and should complete in less time than that.
-    read_poll_timeout(
-        || {
-            Ok(
-                // Check that FWSEC has lowered its protection level before reading the GFW_BOOT
-                // status.
-                bar.read(regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK)
-                    .read_protection_level0()
-                    && bar
-                        .read(regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT)
-                        .completed(),
-            )
-        },
-        |&gfw_booted| gfw_booted,
-        Delta::from_millis(1),
-        Delta::from_secs(4),
-    )
-    .map(|_| ())
-}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 6db646a49519..0b3a62f6ad1b 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -24,11 +24,12 @@
         Falcon, //
     },
     fb::SysmemFlush,
-    gfw,
     gsp::Gsp,
     regs,
 };
 
+mod hal;
+
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
@@ -291,7 +292,7 @@ pub(crate) fn new<'a>(
                 // still constructing it, so no concurrent DMA allocations can exist.
                 unsafe { pdev.dma_set_mask_and_coherent(spec.chipset.arch().dma_mask())? };
 
-                gfw::wait_gfw_boot_completion(bar)
+                hal::gpu_hal(spec.chipset).wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
 
diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
new file mode 100644
index 000000000000..a261c6af92be
--- /dev/null
+++ b/drivers/gpu/nova-core/gpu/hal.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+};
+
+mod tu102;
+
+pub(crate) trait GpuHal {
+    /// Waits for GFW_BOOT completion if required by this hardware family.
+    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result;
+}
+
+pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
+    match chipset.arch() {
+        Architecture::Turing
+        | Architecture::Ampere
+        | Architecture::Ada
+        | Architecture::Hopper
+        | Architecture::BlackwellGB10x
+        | Architecture::BlackwellGB20x => tu102::TU102_HAL,
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu/hal/tu102.rs b/drivers/gpu/nova-core/gpu/hal/tu102.rs
new file mode 100644
index 000000000000..08dd4434bd72
--- /dev/null
+++ b/drivers/gpu/nova-core/gpu/hal/tu102.rs
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPU Firmware (`GFW`) support, a.k.a `devinit`.
+//!
+//! Upon reset, the GPU runs some firmware code from the BIOS to setup its core parameters. Most of
+//! the GPU is considered unusable until this step is completed, so we must wait on it before
+//! performing driver initialization.
+//!
+//! A clarification about devinit terminology: devinit is a sequence of register read/writes after
+//! reset that performs tasks such as:
+//! 1. Programming VRAM memory controller timings.
+//! 2. Power sequencing.
+//! 3. Clock and PLL configuration.
+//! 4. Thermal management.
+//!
+//! devinit itself is a 'script' which is interpreted by an interpreter program typically running
+//! on the PMU microcontroller.
+//!
+//! Note that the devinit sequence also needs to run during suspend/resume.
+
+use kernel::{
+    io::{
+        poll::read_poll_timeout,
+        Io, //
+    },
+    prelude::*,
+    time::Delta, //
+};
+
+use crate::{
+    driver::Bar0,
+    regs, //
+};
+
+use super::GpuHal;
+
+struct Tu102;
+
+impl GpuHal for Tu102 {
+    /// Wait for the `GFW` (GPU firmware) boot completion signal (`GFW_BOOT`), or a 4 seconds
+    /// timeout.
+    ///
+    /// Upon GPU reset, several microcontrollers (such as PMU, SEC2, GSP etc) run some firmware
+    /// code to setup its core parameters. Most of the GPU is considered unusable until this step
+    /// is completed, so it must be waited on very early during driver initialization.
+    ///
+    /// The `GFW` code includes several components that need to execute before the driver loads.
+    /// These components are located in the VBIOS ROM and executed in a sequence on these different
+    /// microcontrollers. The devinit sequence typically runs on the PMU, and the FWSEC runs on the
+    /// GSP.
+    ///
+    /// This function waits for a signal indicating that core initialization is complete. Before
+    /// this signal is received, little can be done with the GPU. This signal is set by the FWSEC
+    /// running on the GSP in Heavy-secured mode.
+    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
+        // Before accessing the completion status in `NV_PGC6_AON_SECURE_SCRATCH_GROUP_05`, we must
+        // first check `NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK`. This is because
+        // `NV_PGC6_AON_SECURE_SCRATCH_GROUP_05` becomes accessible only after the secure firmware
+        // (FWSEC) lowers the privilege level to allow CPU (LS/Light-secured) access. We can only
+        // safely read the status register from CPU (LS/Light-secured) once the mask indicates
+        // that the privilege level has been lowered.
+        //
+        // TIMEOUT: arbitrarily large value. GFW starts running immediately after the GPU is put
+        // out of reset, and should complete in less time than that.
+        read_poll_timeout(
+            || {
+                Ok(
+                    // Check that FWSEC has lowered its protection level before reading the
+                    // GFW_BOOT status.
+                    bar.read(regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK)
+                        .read_protection_level0()
+                        && bar
+                            .read(regs::NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT)
+                            .completed(),
+                )
+            },
+            |&gfw_booted| gfw_booted,
+            Delta::from_millis(1),
+            Delta::from_secs(4),
+        )
+        .map(|_| ())
+    }
+}
+
+const TU102: Tu102 = Tu102;
+pub(super) const TU102_HAL: &dyn GpuHal = &TU102;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 04a1fa6b25f8..3a609f6937e4 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,7 +17,6 @@
 mod falcon;
 mod fb;
 mod firmware;
-mod gfw;
 mod gpu;
 mod gsp;
 #[macro_use]
-- 
2.53.0

