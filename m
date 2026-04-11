Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010062.outbound.protection.outlook.com [40.93.198.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC4C2F3C3D;
	Sat, 11 Apr 2026 02:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875822; cv=fail; b=W+CTEYmXYyYAPzHc4fcrbgSteIdsUiNjHHbwKtzPSqiulleJCkmVgyCUYZTU+A2AjAwifjh5gHoSXnyVIJLXQxCcJGfePN1YfOS0DJwS4GW7i7kEXH4C9QDDd+LLDoyT6o60ycnpsv/OaMx4+MsIZv+PkKxj8TBlOb7I86ZZqcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875822; c=relaxed/simple;
	bh=U61xdOw10/qe9+aNxXklLbYVkjE+cXOpgUGyj05l8S8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mkjx8j/LVBFW23kKgN3VC1imt2FrAMX78bjOOqE/7OyRLmbVWCszrFXv/X1KmqEBE6V8fWv41CUtbFF9Sf41Yjmj2UMNZDhLiaQ0YtkFBKzHOxAbQSIeGJRH923vVlTNxJbynralIN2WsoYQoNTi5tbwSRXdUzsfDiihVuIuh0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DqhO35/U; arc=fail smtp.client-ip=40.93.198.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DqhO35/U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnbV92gQoVvL6LVL2gMDz1Tw7EFe0DQdyEb9NB7idbYMk5emEFi6DovKKwssCYouy9wx3vkNRwdQpyEpqiHkEZ8M1QExWBaSsTPOKqGNYDTAyoU0IFzk5zXwxC1hcdL/3DbTEcqN94cJlJQVTBZDlkTmQjK7zBRU634fRw3AHHPBnmmKmiEg93efM9PLJBkwmsGy/BV2EG2PU+jPDdhezZ08diSiq6Lwt6S5JCZRTC9EDUeYSSuwpgoq41iTymUVagbFqdQoxr19NTa06SD/1m4hrn4MM8mTcg/EFp+P/3Ti9I/15fyAmTt2UcdnG3JClrUzPo9DeUAWmgNu9VoMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDJ3tp39Ey3uelXL3xDkwzI6A06R3MSoYAPSgz0BcSM=;
 b=p6+g0tDou0IqMcBOqRG3t2r2trQw68SsMH1zq393D36Vs77byvtpcw8eQFVFNcqe8yIa7tWioyXnJXlqn/NqhVn/nrry4bvikWe9dItHqBj5cLhBTjnjhNHPShC9gS+3fUzETCQ8WhzecKVEz3addh56AY8fXNTm2+jpc7Rfg7nOpvBNlNHW3Uzde2LqSm4ktTHT2bHq0F+DB7u67r74st1m05AzJy73+aHEEghWtgPI6ys5pfA9QW+2t3ixiejoTSGx2PdvQYtd2+B0sT58nmlSMZZGfK5gKovykRFtaA/STLYdv8WLGY1EXpeUfUgFaPRmnW4s7wnudW/JBcsKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDJ3tp39Ey3uelXL3xDkwzI6A06R3MSoYAPSgz0BcSM=;
 b=DqhO35/UYPl1erDuEm47MbK7TY+XmMif8F6vXMZkwIcSFJZjqlFcuekzn6EzvBOuTxodmcJq030/S7W/hhABUFalmK4iVpVXRNY5AKS4hS/RFt8xxmK/yzcKPctQVov+puYGJ14WuuWf/+qzFkkgirfL24FCbhjpvOnfR9zZ7BJc1Xje1LQOfDRVQdgEWApF0Bt5um6NMXGpRX7owMVdIco8F8GFzBzPf3j/JghgjdFQZeCAmv+nO4SRsBY805MHAhNkQNkOzDfwhj100f9tXnhWE1nXE3+8InKR/rYvtn7rCBHsk+MQxcKKbLQCdN0Jiq8Y5luMMyQdoGCm5DySnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB999107.namprd12.prod.outlook.com (2603:10b6:806:4a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:50:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:18 +0000
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
Subject: [PATCH v10 17/28] gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion waiting
Date: Fri, 10 Apr 2026 19:49:42 -0700
Message-ID: <20260411024953.473149-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB999107:EE_
X-MS-Office365-Filtering-Correlation-Id: 35825ccb-ded4-4482-6632-08de977510e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4uqR2Lln71t1c0jxaCDqZ4B92OUOVAP5iGY7W3HmwMW1iJ/MbDcKjBPWDmorm/HSWc/APKNzcLJ7dhYA1wNgoMDBIKobU/nWxpzjDoiyfdoNNJhqD5PiSppvZxgcm0Hw2hQfZiq+QPparHeUb1LPDqZusLZUXzVKNulMOEPknaFI16C2mI+xwo8LorXtX5ox1BSPGMnZoCSgBXN4oZJfYZLCx8GfOmqRjQRKmHTxsvsglULTktZUG39q9EP9U7tj0mH79M8+DvCLLGX1YBBhj6+e9nDg4lH1VtMqEon0VAGGlAXwrpYsqi8Cfdq0K3CslTB2sAFGdyrXGBZ3SqFboIqnv8pvjJz0URgF4nABSFr5np+WdMq9Hn9teUxNwxhSxNJApLYCpHD2BfdRU/BuBGraLo3gnlZ5GWAupeb2ZzK51+ym0R+WXwOw2Tg5qoXzeRMc0pJ48DDJF/K+psh8ekl8kC5ytUUGb39CHm5dH9j/eLg1ckG4Pcl6nsXLn4mQBXzJt6AE2ELau0nAT8UjbeB7Rv++V3rwm9vYZHd9vBkAMNSCenEiPZKmteTlMGpxFTkzy32V8p7rOnl3fP3sqWdhTCrZ4s8/z19RSLRoysgNlzlykeP+VkPD+g0m62rigsds8t3EFy5+RutFb7tEpn3xhDP161jdAJ2FYVfwwSflGegYDsMiuDc24VWENLGIfkCt1cXlhlqiPhl2adWNTG4fJ7tKzycZknzh/4nwRII=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i/KLm/1g8RzALCuNf+z3odPD7OTkbqxOygiJObywL5s9aRYEuFR5Yg12i/oU?=
 =?us-ascii?Q?xK5aojGgbyHGdSdK+vAm0I65lehwa0U4lpRU8+PiEEJk4njA+aURIGqarGMN?=
 =?us-ascii?Q?sDgZxg3GGA3edTV/rTexipbJxcpY32EXhEW5dLTiHJa8WCPHEfwekSub7LL2?=
 =?us-ascii?Q?P8S8vmQXfv4joFx1g9O/QWdSc66P7OJd+0L6OeNk/h2L5p06JDwDhygLPtgb?=
 =?us-ascii?Q?IR0jXDtp5IOov6iyTw/KnWPDplUVb+QJtZo0S5Q2+D0OCVs9UDoC38agwiIl?=
 =?us-ascii?Q?p/DIjUO316jBJxzCeq6Amtyc+2l9n9RG2ayXnxFIv5C38vBiACmhaZtDYGPI?=
 =?us-ascii?Q?Jv+vfUzY1K3B/iEzaX96C6BWjk5ADUWj7+NtvaA8BIC2bA2yo3Yo9pXw/cKp?=
 =?us-ascii?Q?DnC0bxwDxyg5sbXyQFsPTHbwFijY9/XMBbULsFLpHxvzkAoc9snA1x1rcPkl?=
 =?us-ascii?Q?31nlKGVmyc8TPzANXchGxQBSIl98jh/d0sZZvtAmMFqHS0LEn6eDCg9dJPzM?=
 =?us-ascii?Q?XjDnD4k7WLiVMmDY3WbRFm9ZbWhOdO3E3oxua+j0CDGNRcVhgxrKG5E5o3pr?=
 =?us-ascii?Q?rJBulZlEGA7XE1OacBubKynYRUR4WwQrkmvK5rdcFsg7xskJ7rSjzrGchUQT?=
 =?us-ascii?Q?IXtbpgiEmtpaFtbMMxOoCCS9xDu9g1LSykr1yC9c0DjvYtqUUkNz3KYTEzsk?=
 =?us-ascii?Q?ThIY+XIgfyHN7x62wuAPZ8ER7laYOq5QfLjoSmVnSyz/03t3dsdc5dozjLJX?=
 =?us-ascii?Q?su5DpW/3I9H9p5WnktpTskN8R0J5qLhJcV0TY8VwU6taHDHx/CyfoC+KYHOG?=
 =?us-ascii?Q?2cycvYQnNh/FIGaOWrclmPeprPhoAi0TzMTkO5QKYnlTOXfTOgxuAZlm+Mhh?=
 =?us-ascii?Q?N6jwerqMyUs19KDQ30iTzV1aM7pTZJVkk3icStO9jMqJk9e6LIA8eur3vq+c?=
 =?us-ascii?Q?V49HuVdllitBevHjTnN4+jamhv+TxS7Z6k+GPzLm1JJBcFSPvAwvoX6kqK3g?=
 =?us-ascii?Q?Jxduz1LobrtuT5DkBUsccjBiJ9dQlvvUNIzkmY4QaA1rjbYtGK7SMd/I4XHE?=
 =?us-ascii?Q?nH81hmBkLxEcSvOj4NKbghRtwxygw895nl1uRwF6TlcTj/n0d4RO1vxz15qc?=
 =?us-ascii?Q?n+VFmMmffhBFXcAFetbOcwxuzoi6QTOL3NrbX5XVAv6Wda9b3CZtiwDNp1vM?=
 =?us-ascii?Q?ENTneVOjhRgE1651qjbTiiQOd97QTilfPXnshSz/wAsPP5BxJpbi2i/si8wI?=
 =?us-ascii?Q?ugYnJABejX5oPtVS23MarzvAUe96pAX1QDVv8CJomIyiPuZcrPRgKsZ83cSH?=
 =?us-ascii?Q?g9cyBA3rpkn1kFvR/wjGqPzJ4LFTJXmV+6OrTh8Qy/+dNnsHpwUst1g9nHzt?=
 =?us-ascii?Q?seBv5G1HBFDlV+Ct3GskScSpI42Is3dNX9p9OUsiwmbM+ZYmJYJ468Nn49mx?=
 =?us-ascii?Q?CwezDKCeC5z1DI5ZM/N/SGvzeGmOitJr2HDdevAEfvuYxdOdgglktJSlg7V1?=
 =?us-ascii?Q?R8FC11nAwBUg/351rMTxG2zlDuANDr3INkD5O1kwDRJc/4iivlrK1AHw2ASC?=
 =?us-ascii?Q?U30IUjRsjRZWzQEBmO+YYMpHHSg9kN6zkefpNp+thz1Xyzmim7jR8ZdhHWVo?=
 =?us-ascii?Q?1Bgu2H/NpJKzs5zgE4G9y5kmnU4uCGVScDOwCKWNicS1yF1cp8zNTUr3tC7Y?=
 =?us-ascii?Q?XwnPFNacmmjA150/8wgM1s9oP10+I8vXCqulaWOWdT2jylqD+bMAjLuGgxx6?=
 =?us-ascii?Q?Sqd+hFAssw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35825ccb-ded4-4482-6632-08de977510e2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:18.4833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMI3U5WK4kDcvBnEf6RB3VoYoNfu315vEqOUDAygfr9l0UDdiigEgqIr4BMK4X4wWhrddq0OOWB/g2bHoKYGdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999107

Add the FSP module with Fsp::wait_secure_boot(), which polls the I2CS
thermal scratch register until FSP signals boot success or the 5-second
timeout expires. Hopper and Blackwell use FSP instead of SEC2 for
secure boot.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs       | 53 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/boot.rs  |  5 ++-
 drivers/gpu/nova-core/nova_core.rs |  1 +
 drivers/gpu/nova-core/regs.rs      | 29 ++++++++++++++++
 4 files changed, 87 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/fsp.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
new file mode 100644
index 000000000000..55e543e80de8
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
+//!
+//! Hopper/Blackwell use a simplified firmware boot sequence: FMC --> FSP --> GSP.
+//! Unlike Turing/Ampere/Ada, there is NO SEC2 (Security Engine 2) usage.
+//! FSP handles secure boot directly using FMC firmware + Chain of Trust.
+
+use kernel::{
+    device,
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::Delta, //
+};
+
+use crate::regs;
+
+/// FSP secure boot completion timeout in milliseconds.
+const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 5000;
+
+/// FSP interface for Hopper/Blackwell GPUs.
+pub(crate) struct Fsp;
+
+impl Fsp {
+    /// Wait for FSP secure boot completion.
+    ///
+    /// Polls the thermal scratch register until FSP signals boot completion
+    /// or timeout occurs.
+    pub(crate) fn wait_secure_boot(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        arch: crate::gpu::Architecture,
+    ) -> Result {
+        debug_assert!(
+            regs::read_fsp_boot_complete_status(bar, arch).is_some(),
+            "wait_secure_boot called on non-FSP architecture"
+        );
+
+        let timeout = Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS);
+
+        read_poll_timeout(
+            || regs::read_fsp_boot_complete_status(bar, arch).ok_or(ENOTSUPP),
+            |&status| status == regs::FSP_BOOT_COMPLETE_SUCCESS,
+            Delta::from_millis(10),
+            timeout,
+        )
+        .map_err(|_| {
+            dev_err!(dev, "FSP secure boot completion timeout\n");
+            ETIMEDOUT
+        })
+        .map(|_| ())
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 1998bd230185..9609cef3ff51 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -33,6 +33,7 @@
         gsp::GspFirmware,
         FIRMWARE_VERSION, //
     },
+    fsp::Fsp,
     gpu::{
         Architecture,
         Chipset, //
@@ -199,7 +200,7 @@ fn boot_via_sec2(
     /// the GSP boot internally - no manual GSP reset/boot is needed.
     fn boot_via_fsp(
         dev: &device::Device<device::Bound>,
-        _bar: &Bar0,
+        bar: &Bar0,
         chipset: Chipset,
         _gsp_falcon: &Falcon<Gsp>,
         _wpr_meta: &Coherent<GspFwWprMeta>,
@@ -209,6 +210,8 @@ fn boot_via_fsp(
 
         let _fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
 
+        Fsp::wait_secure_boot(dev, bar, chipset.arch())?;
+
         Err(ENOTSUPP)
     }
 
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 3a609f6937e4..53558ac0f619 100644
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
index 6faeed73901d..e4de7bfffde1 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -511,6 +511,35 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
+// PTHERM registers
+
+// FSP secure boot completion status register used by FSP to signal boot completion.
+// This is the NV_THERM_I2CS_SCRATCH register.
+// Different architectures use different addresses:
+// - Hopper (GH100) and Blackwell GB10x: 0x000200bc
+// - Blackwell GB20x: 0x00ad00bc
+pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result<usize> {
+    match arch {
+        Architecture::Hopper | Architecture::BlackwellGB10x => Ok(0x000200bc),
+        Architecture::BlackwellGB20x => Ok(0x00ad00bc),
+        _ => Err(kernel::error::code::ENOTSUPP),
+    }
+}
+
+/// FSP writes this value to indicate successful boot completion.
+pub(crate) const FSP_BOOT_COMPLETE_SUCCESS: u32 = 0xff;
+
+/// Read FSP boot completion status from the architecture-specific thermal scratch register.
+///
+/// Returns `None` if the architecture does not have an FSP.
+pub(crate) fn read_fsp_boot_complete_status(
+    bar: &crate::driver::Bar0,
+    arch: Architecture,
+) -> Option<u32> {
+    let addr = fsp_thermal_scratch_reg_addr(arch).ok()?;
+    Some(bar.read32(addr))
+}
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.53.0

