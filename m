Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013022.outbound.protection.outlook.com [40.93.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1491F346773;
	Sat, 30 May 2026 03:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110635; cv=fail; b=IzLJA/muYQjliinZrAjX5Fn/KQ4gU0S1nfAuoxzoQNWkFvKflGQY0387v9TeMQTFIeCh6aSzDchiM2506BqqNz4XL67BtHcXoY6GKSt6MFGnJZRtTMHoML76Bq8azN4s3Siuehycwe44UOxmSzp159EEQyxSf9qM4+5OuGxEB6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110635; c=relaxed/simple;
	bh=uvAuUBcUJepgeFg5k7GPCpz0Ad2TEJWhJPtGR6gHUHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HCX9QCnQX2w4mQanHz8ca95JQ/7H9fg9bM3/LCe8eM6HZ7Rn3p+zc2gNID7JxBapG3kWkGHKdqr0w6mtPZxOlHl+PpaPKJCWtIv++Ouit92IUnP7oRgcmFVddoYY1rEkqQZV28anLJjqTKZrUjw0LpVBMPt8cA4xtJUBpBooKFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kJ7V9uGY; arc=fail smtp.client-ip=40.93.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kJ7V9uGY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0DuArOMgCaqzkMzdZSRkzROaJlpx3+HoP5CRod78JVRkl9s30nhWNWMAN/Yn3bBNkzTfWv4b0BHGaXIzJhMtmk3ocWRjoSM5RlZjU2iXexDEwwpKZkWIadwMIGAZSWTRqEG5LVkFs+MzuUlWtUWocuhGU3GJ97hpjFkybL39XEJGQQd14oOoYHtJ3GWTHVVw6PPW/W1uERFpcV0ViAv3GvRUt67Th61HV8lojvlWsua0N/xEcuUCrsR8JQpfoQA7mUdz+ml1MtulTsXTxyD3VH02F8R5cJDbWu8jaEVc1HRXcA4HlkzDa3GwwwwrZxoAwG1lZvZupZLJA6dpejk9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VZzN3xwvR5TffLMSswnZdLk3NLG+zo9t/b3z+N7NZA=;
 b=TpGi1rO1/ySCMhSn56EHAWTHbAZs1sGqLrcazEEph4Asxo2okuKhWqdMv0dt2gqxYwHwmjlPvcXEqo26oQ77ejbzv4cfLFH/zEYyv/oPOEBZWpm98/aXBLiecQ8STtWD9VRfx84zHvBS06xfeE8A+56FOnY0Uq8CtOM51lWKmyuMtxnqKUuFmpDC32tLpu7JIawGeCptDxXinBb2fASIbNWZFXubqODscrXi74A6soXG+ET9oc2lY5HgrKEZ1dDj12+/NfIQu3URECv3rm6fNkb3khKv0fBubkYqT44fGTwIHien7TMi7PoXCT616etllQ1w1S1w9WGugG6FZ6udZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VZzN3xwvR5TffLMSswnZdLk3NLG+zo9t/b3z+N7NZA=;
 b=kJ7V9uGYfa8BJRHOZ7RSo92c43zeI34ttJFC5dVnH/s1xhvp1TkpSA+dwuZORJV2vt2mhLPGlEa5S4s2alkjDAYBBql7hw7QLBOA6V9lbjcOQCwXy47H82S5kD81RHgKPV2i8Y0QidXvQtxX1Y8T/vgL/3Nn1njDSJLDs7OSzeAMRk6eVaumj2hffOJLPNSZ9FeotaaAfg9g+ynVLb0250VGsUYvsEHdwpPTsjX6JT7nCGPt1pF+uDa8g77joig75RgM/rmiskqubo7p5P0a1P5x6zzwFiGhfcD7NAvme772fOpm4ZwMzlkbJxkhfJ2Xk09Ef3XLT/ypK/QqN1a3Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:10 +0000
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
Subject: [PATCH v11 12/22] gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion waiting
Date: Fri, 29 May 2026 20:09:43 -0700
Message-ID: <20260530030953.740561-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: c32f2e22-a1c3-4639-6059-08debdf8f56c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jq4ILQoubkgnjJKTyhR4fAEMn3YKprlnqNZNu9HQKMtFNT3/tMs1PnWycwqJR+34aNHWU8tyusK0YkhdgyHEk8ylqt3YuHODaAXD/8vf11kGD+Jw6Hnx0u+elySEoQpPt5D4c+xPOt7/yIyCHQqsN4gp1BkRJBrJcq4TazSvfofH4566QKGM5wHY4hQ+YcMGP4rKG1T1tnIH0is+O+IO3zH5+SLXx9l6zyPZ9QNtgEf28XPWSujCevEtUQ/jb7+NvravQaKm43RPCjgmsJY1E52EX5RmX4Cy1mRzRv0MRHwdfZs6KVlVKAT0OOBWPC9liXBr1xbW1hzqMarwHJ99BFDv2IwlA1BzoOzJrS8bHmzv7roTGwaizyvqAB8p8c9VpF+fDERgRqqrLGCiXs4iQGhImBWmhBk/D+0tBLRUWAJf2MzVP1US1tHvTK3cRZaN9bvBAZSsyLWf5B9igxZdeO/VoP3sahsZlZD7J++F2fCSGuJG/EI5C11ZGxLpX0zt/WLlI3hxcIzhS89IlnZRbdLyGI1fRHbJe4p6POHYGs1xmpkwd41WzEuSFb36nx5Pgj3PvtzrnBUPbSXOca0tl7uUCW7GRh1J0uI+24dVSX6wMIjBXakdL0K72P5W+XfOQ2Ab+Diuz4JYZGrt7ZKth1cy/WABRtbVP2QHbEmELRwaDbhIbRv2/8L/Ue4nwbfB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xc3QCEnEwiO541SMRavWMjj5/xqqn0WA1IEQQpwNQ34HrqYu71afv2O7EFJe?=
 =?us-ascii?Q?DsD6h4qJRzPlWb8yR3drPCj5je00BPs9gyHb816edU6/xLEpBLFn6yZP4WqC?=
 =?us-ascii?Q?5TQEF2d2PSwpM+0dbZlUEBnP0UfzRbIOEyjEpQvlUHTFM1XmhOG/Os/pyBGU?=
 =?us-ascii?Q?1S9Ss+fX1ErSpODfHIH2/BgYfRH4ccdyxqSs65+yEcGAfYMgDoiNLWMtosf/?=
 =?us-ascii?Q?8BiQzQQm8Qr2ijFBzDZ+S++JDkj50BTAje+nFR7IRigwOi3tIUMoHXQ+69E8?=
 =?us-ascii?Q?m1V/g3dFnusEpK2w0Wp/TVqYhTr5dhCB6pp2vfvkQGQhTjrjNZWLTS3UsVth?=
 =?us-ascii?Q?9jtcBHYl9wQ4cNngO/vAkmejnUdBeXxhOcIpV6n6wcJGm92TCofgGqKIeMK9?=
 =?us-ascii?Q?mQuohB7BOk5JxK2AGpGbNAlOzfJ9nLOvulZCywXpb8DSwLdQfOlbaz3hj/uE?=
 =?us-ascii?Q?lJBypB4ADrkQhZeU19AddW8Vbt+68cCZrgKctSKyrM+b9Qv8uVnadKIgloVF?=
 =?us-ascii?Q?0e9UECvhjM1hTK0KbSw+mWiwBYDtb35qIJ+QeEfIPddVwPiAE9lMA1mFFG/a?=
 =?us-ascii?Q?KwuYZe28I8X9jxiw3uH3J6zXn/Cyqt8Cqrr88b8jfZqeOVVE1Ado6GZklZgN?=
 =?us-ascii?Q?1cEWaF8OEtFrmClaLgN0FynqyzKX5aVwAy04HxA2EWnjDm86rbnaMBmIh9Mj?=
 =?us-ascii?Q?SNyevmjP41TPwrlm914ouyLq4gBcIYGTcsDyIXt3JSrs5TbuUhYnFlXC5Yd+?=
 =?us-ascii?Q?Vylw6fuBkYwqKMd2eF2Rbsfbms4BxbZ0ahB7gDlh4J1hadbCtcuROXskfMCE?=
 =?us-ascii?Q?QKIzZJ8Eai/Bm2Eev9YsqLHt/wCXxEbRQ1InFvxKf1xB6IhQdpePiWdHcpWb?=
 =?us-ascii?Q?30m4J6oEe251ya+59OF6OnQCZq2t+VWpLjC1y14ZsNX1qmKFjDFsDUYURis7?=
 =?us-ascii?Q?m3UPiIKbBYPC5RsAznmvGXZsWELVBlcM/odmbgczlrEn8l9+XkFrx3/juYq9?=
 =?us-ascii?Q?WqRghdXTMeFRjJ29qChM87j8gISnLh5DZYXOnWK2ecKdnbYro0DUynjKBQ7c?=
 =?us-ascii?Q?/Jn0HL81H2lYDxuqDDKFBZCCud7+/j6fR3pV00D0qGk7lKITU3lwnLyvPxam?=
 =?us-ascii?Q?CXpjVHwYrUl0XFF4cTUVCdhxWwE+8esXzSHDEW3n9JpVRJapNnwUW8Su6clq?=
 =?us-ascii?Q?BVylO46Y2PWiM1eSJauix2J+MLTTVGj62/YD/qIc0FkrAI1tUMws6wnvFJ/3?=
 =?us-ascii?Q?LpkcTTwr+EhXaCdeihikzQ0tP3vlMkwzSu3cO2yDNVDiXlbNybC0bUbFY8wr?=
 =?us-ascii?Q?YFlcgKNzQXymJbM3P0pH2+BMm/tmn45Z+4VbMbM0+Kr1tQz9B/OOpkEhlDrc?=
 =?us-ascii?Q?QsEuLg+9qK7OoTEzyd/IMRKkd7jJL4lBP1OiAF1+ILQgGK/3kwC4lmeqLVGc?=
 =?us-ascii?Q?3FwGe1yuLD+oIWpk3aQ68XWrysHbZBkyTPBuOPSsjXW3OZ5hkxLHkicCNBWz?=
 =?us-ascii?Q?tslOnpfUL2n7tXpaeTbHR47ONEjhBTpgXsdxfw8cljU3h/PbCRlxlDdJyKid?=
 =?us-ascii?Q?5UBOpoyIek7dRXIWsc+MMPjUmH5HeTS5ZT9xybpB8XAWNdN3PSVD56x7I9b4?=
 =?us-ascii?Q?6Ic7am2EevGZI5S0Q87nrOelY3MHP5B0Jgq+QKRBdOmnqJsbHnPH4NhH9H4p?=
 =?us-ascii?Q?oS1WybADFQEByLiRlCcjTKlksLOB1YP9nThZRz4pACaKTzqz8xgvouRateWh?=
 =?us-ascii?Q?bEBaDSY+Fg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32f2e22-a1c3-4639-6059-08debdf8f56c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:10.3227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jlrv+kzI3LSJZRhKJzl9PGN6uPXP7rUAdg/5gyO3G6Feyok0NheQkN1/sTU41qTk/1bM6gq818NvtI+g3oNxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

Hopper and Blackwell use FSP instead of SEC2 for secure boot. The
driver must wait for FSP secure boot to complete before continuing
with GSP bring-up. Poll for boot success with a 5-second timeout.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs           | 51 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/fsp/hal.rs       | 27 ++++++++++++++
 drivers/gpu/nova-core/fsp/hal/gb202.rs | 23 ++++++++++++
 drivers/gpu/nova-core/fsp/hal/gh100.rs | 23 ++++++++++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs |  5 ++-
 drivers/gpu/nova-core/nova_core.rs     |  1 +
 drivers/gpu/nova-core/regs.rs          | 36 ++++++++++++++++++
 7 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/fsp.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal/gb202.rs
 create mode 100644 drivers/gpu/nova-core/fsp/hal/gh100.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
new file mode 100644
index 000000000000..ee8fc384fe38
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
+//!
+//! Hopper/Blackwell use a simplified firmware boot sequence: FMC, then FSP, then GSP.
+//! Unlike Turing/Ampere/Ada, there is no SEC2 (Security Engine 2) usage.
+//! FSP handles secure boot directly using FMC firmware and Chain of Trust.
+
+use kernel::{
+    device,
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::Delta, //
+};
+
+use crate::{
+    driver::Bar0,
+    gpu::Chipset,
+    regs, //
+};
+
+mod hal;
+
+/// FSP interface for Hopper/Blackwell GPUs.
+pub(crate) struct Fsp;
+
+impl Fsp {
+    /// Wait for FSP secure boot completion.
+    ///
+    /// Polls the thermal scratch register until FSP signals boot completion
+    /// or timeout occurs.
+    pub(crate) fn wait_secure_boot(dev: &device::Device, bar: &Bar0, chipset: Chipset) -> Result {
+        /// FSP secure boot completion timeout in milliseconds.
+        const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 5000;
+
+        let hal = hal::fsp_hal(chipset).ok_or(ENOTSUPP)?;
+
+        read_poll_timeout(
+            || Ok(hal.fsp_boot_status(bar)),
+            |&status| status == regs::NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_SUCCESS,
+            Delta::from_millis(10),
+            Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS),
+        )
+        .map_err(|_| {
+            dev_err!(dev, "FSP secure boot completion timeout\n");
+            ETIMEDOUT
+        })
+        .map(|_| ())
+    }
+}
diff --git a/drivers/gpu/nova-core/fsp/hal.rs b/drivers/gpu/nova-core/fsp/hal.rs
new file mode 100644
index 000000000000..83d1e7daa998
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp/hal.rs
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use crate::{
+    driver::Bar0,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+};
+
+mod gb202;
+mod gh100;
+
+pub(super) trait FspHal {
+    /// Returns the secure boot status from the architecture-specific `NV_THERM_I2CS_SCRATCH` register.
+    fn fsp_boot_status(&self, bar: &Bar0) -> u32;
+}
+
+/// Returns the FSP HAL, or `None` if the architecture doesn't support FSP.
+pub(crate) fn fsp_hal(chipset: Chipset) -> Option<&'static dyn FspHal> {
+    match chipset.arch() {
+        Architecture::Turing | Architecture::Ampere | Architecture::Ada => None,
+        Architecture::Hopper | Architecture::BlackwellGB10x => Some(gh100::GH100_HAL),
+        Architecture::BlackwellGB20x => Some(gb202::GB202_HAL),
+    }
+}
diff --git a/drivers/gpu/nova-core/fsp/hal/gb202.rs b/drivers/gpu/nova-core/fsp/hal/gb202.rs
new file mode 100644
index 000000000000..2f08b6c9f308
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp/hal/gb202.rs
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::io::Io;
+
+use crate::{
+    driver::Bar0,
+    fsp::hal::FspHal,
+    regs, //
+};
+
+struct Gb202;
+
+impl FspHal for Gb202 {
+    fn fsp_boot_status(&self, bar: &Bar0) -> u32 {
+        bar.read(regs::gb202::NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE)
+            .fsp_boot_complete()
+            .into()
+    }
+}
+
+const GB202: Gb202 = Gb202;
+pub(super) const GB202_HAL: &dyn FspHal = &GB202;
diff --git a/drivers/gpu/nova-core/fsp/hal/gh100.rs b/drivers/gpu/nova-core/fsp/hal/gh100.rs
new file mode 100644
index 000000000000..290fb55a81da
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp/hal/gh100.rs
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::io::Io;
+
+use crate::{
+    driver::Bar0,
+    fsp::hal::FspHal,
+    regs, //
+};
+
+struct Gh100;
+
+impl FspHal for Gh100 {
+    fn fsp_boot_status(&self, bar: &Bar0) -> u32 {
+        bar.read(regs::gh100::NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE)
+            .fsp_boot_complete()
+            .into()
+    }
+}
+
+const GH100: Gh100 = Gh100;
+pub(super) const GH100_HAL: &dyn FspHal = &GH100;
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index c38d88bc42b0..151df05e303b 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -21,6 +21,7 @@
         fsp::FspFirmware,
         FIRMWARE_VERSION, //
     },
+    fsp::Fsp,
     gpu::Chipset,
     gsp::{
         boot::BootUnloadGuard,
@@ -41,7 +42,7 @@ fn boot<'a>(
         &self,
         _gsp: &'a Gsp,
         dev: &'a device::Device<device::Bound>,
-        _bar: &'a Bar0,
+        bar: &'a Bar0,
         chipset: Chipset,
         _fb_layout: &FbLayout,
         _wpr_meta: &Coherent<GspFwWprMeta>,
@@ -51,6 +52,8 @@ fn boot<'a>(
         let _fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
         let _fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
 
+        Fsp::wait_secure_boot(dev, bar, chipset)?;
+
         Err(ENOTSUPP)
     }
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 5a260062295f..7b6c331da10e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -17,6 +17,7 @@
 mod falcon;
 mod fb;
 mod firmware;
+mod fsp;
 mod gpu;
 mod gsp;
 #[macro_use]
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 65be6ec71ed4..270779d31ab3 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -579,3 +579,39 @@ pub(crate) mod ga100 {
         }
     }
 }
+
+pub(crate) const NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_SUCCESS: u32 = 0xff;
+
+pub(crate) mod gh100 {
+    use kernel::io::register;
+
+    // PTHERM
+
+    register! {
+        pub(crate) NV_THERM_I2CS_SCRATCH(u32) @ 0x000200bc {
+            31:0    data;
+        }
+
+        // Alias to `NV_THERM_I2CS_SCRATCH` when used to check for FSP boot completion.
+        pub(crate) NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE(u32) => NV_THERM_I2CS_SCRATCH {
+            31:0    fsp_boot_complete;
+        }
+    }
+}
+
+pub(crate) mod gb202 {
+    use kernel::io::register;
+
+    // PTHERM
+
+    register! {
+        pub(crate) NV_THERM_I2CS_SCRATCH(u32) @ 0x00ad00bc {
+            31:0    data;
+        }
+
+        // Alias to `NV_THERM_I2CS_SCRATCH` when used to check for FSP boot completion.
+        pub(crate) NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE(u32) => NV_THERM_I2CS_SCRATCH {
+            31:0    fsp_boot_complete;
+        }
+    }
+}
-- 
2.54.0

