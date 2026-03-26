Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EF42E11BC;
	Thu, 26 Mar 2026 01:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489177; cv=fail; b=hSsuMEu054rnRZ96z71u3rvl+y/6j8+Ague52hMwoB/BvINOhIrpeL4ynKCeb5tD3KpwpDvWPk6swZSGjN+h0yF0QzVgvVWvQCJZt6VzvFCKkjLrJ/aLTqs7uY/BuX8FDXyj6zsCu3h7wKZASHyD9Qln5STLphfAkp6djup5ONU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489177; c=relaxed/simple;
	bh=lvmKX5v5QxghL8+yMLrpUrjS8+PqGLcsK52q2d2dnAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CnC88sYHwJa/DNeG83ptWGG6dg6puk2iaMBvFbFyoinzGixmZc5+Z2Dxq4/CP9u0ZZfimxgwbytGJO43mkoyNGtUR0PIM503IrNuHniszNyYOfkLRvZ/xAvD/9BgcMIZ5W4PAIlbjm5XtIgI1aVDQz1MjtlKx3GeM9h8twkealY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GGUOWxGG; arc=fail smtp.client-ip=52.101.61.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GGUOWxGG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gV3764PtKWAeblAMpr5GQL/Moek2hBkfxtMqctnZwKhV31WWfgjtAPHWQDmY9AMfKbKFOnXnRvLZsI1FIhaq3tONkO/sCRtg5hUZB9vGgvaub0I11tZz8e3G2eZuelPsaQ6UOEzBiTApqHTPNiSrfamVdmWhJ8nds9oUdG0dH1nKFBi8FdVdhX1rBYRLAD3sBaDeV478qdcaLNOBmfclKwZxRCcy5eG/8HapNQCs8PRoX2HVWjFH/GdT+e/XXY1Q3wlucMN/WPHuaZmenfw5JJ3i44JOBlql2XTW8XGuFu5orbksM73G/UmmBmIKQS2RjvjTUjltuRf6PaiEMNcFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HK87bZmmWsTPyH95y/kcyNLju7kGe2NE6UAZNo2m7Kc=;
 b=stvWvIaF/jFuKYKowfNNaQQdFc47zeaSjL3Adzs226OPJPGHldn58wayH4jqa8rDWi3rPYTQrDlUoOMLADYo8OD4BW08BZUiazzvfJsJgpWDWoBNfzmYNw65wEUIHQfKjADEyATYxv56CbrWEftZNHDYTRrKU8RKrbUh0FD8a//U/XsEweVubr8U9W8CmXkPITv0h8XVEMl7aNItOEK5GfSAsgy1QeHabW5EG9n9bBlnHyfKPXcRnAvHW3ci6OEiP9V8alKBiopSRH46GAsBCLzrbF6u9y+DgaXp8ilTnDJ+Qma0dMBywN6ePhsBblY+n5BLsANtRCzQc8bJZCv9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HK87bZmmWsTPyH95y/kcyNLju7kGe2NE6UAZNo2m7Kc=;
 b=GGUOWxGGFIN4PTaKY5egsVB+3PYEy5TfYHhvVBXXQP0Y8J4yCvBlOFU9TzNjhIV9Tj7Jm9b6iTOldQK2MyxzsnskWTUD1G7z4NwoEzFxOYiWzWqrEY0jifMtN9hb8UrIA37bJAC7QxeqgagkMlN+Ab+B+fW7wwou9wMJXBZJNQCfSnUXdpYsYTDhWAlFWRhWq6bbR8nM6NwBYeEzxlMA2iQ1S09M5qBG4gC3RRS10lIbqxc+AvY/vLj8MYPO8vESfbalXII/m7NaUGGAA+dLersDBsG4JwzrdQREsfg6gDfxaMtrgxgw4N/g0jxyBmUqb8FAimrZolk3Su4rIVqJMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:16 +0000
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
Subject: [PATCH v9 06/31] gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
Date: Wed, 25 Mar 2026 18:38:37 -0700
Message-ID: <20260326013902.588242-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 72048503-3067-492a-13c7-08de8ad87d9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kHzxA89ud7LvE13QSBwsv6beQPzrpw9nDeO+VsFdHo4VnCJrusI7PYorIHUM/cTlP+bOjKfTPtQ61XE5rdfl1OyG/gcG6ye1RJo8jbUxgB4Cb3Alsai7kJJ10XZLfpl9LZCNE/xIgH5tr2XN85NyImfQwk9eykl9aRzVv3QZ7w3GBPp6uT4ysotClD4xDxDhE8sxaknnrO3W2M2/POgFnC7FWOIAEYYUO9nEac2yo5IzgzH704Bdt8gsF6xa+6AMZXThvsEswkfC1df/l7xc5yEheiFwcORpuJn8i5aBCr4MOV/uMbhSwpBMaPPZ3EzZsMqNk3oln4EhJ264GcEQR91x8qEfP0CbbFc5Umq1aZ2MdFkHGqzYgPtAhQ1sC7NrPwPPrcvdNHgdMX6lhql2ARqJvfYu0KzRLVJT8CAk5Ripw0t4WBpUIHGBjlX0AobuvppG+eHbL5JbX2wtmYZxG+890RrG4J9BZIYifFeuCuBU4QXni84QnP/ZWNki3fZJifC8RMSx4zVISO5eXvdal7oMhA8kPALWDSdjKwlVUuIDYcuT+aKpxUofpYom4XjLw/PB93p+shAzlPaqxWIv3uJSzfi/gOMiMCV2FdyXzc403Dh+hspbE8MjEQZJ1n6RDh4P9GQ2j93LODk7+NpU5clNkZAKB3I6E/sBda0G1RPZwbwPFRrKJOXKaag7hmvET+jNkwvglRiMVhZyf35iXR/GUgjvIEYvnJev67C11Wc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L7klpQ/tQbFLnaqFNolYmFfNxr1N2cTsH2l/OFlnT5ZpgguwIGQ4ZqrpBVyo?=
 =?us-ascii?Q?vMbqD4lgLtskDuOotON2ENPOTkeLyQcNi1jsnJ7NpxfWdr9/K0EMZLF2cXWi?=
 =?us-ascii?Q?+hbWzvadiasEc75t0aGlhUxCMIqKjtywRyRO/tuFjR37KAmUCS22TwI+ls4P?=
 =?us-ascii?Q?y34T10/vPwR0np/gV1VyElBdlhibyt77C5ikxkNAQPiklcQJOYMt7lSFOBIG?=
 =?us-ascii?Q?qPqTaeGFuKmv6EntsCkrppjhJPEM2syAfE0iBiyfiRH6kklLClqTe7OPbpaI?=
 =?us-ascii?Q?zqgdhCB0j+fPd5F8HwMs3Eo7TLZ2Bj1FgcIlKi9P+/m6KkO3kElTeirYN9Bf?=
 =?us-ascii?Q?7QhVhotGBpAsTe1oxgMS+eHOca5ldJ5r9l5An8yXfi7VD6LZ0lovC3i2i5io?=
 =?us-ascii?Q?d0+VIFImBjykNl8J12fyaL7W8Mmw4JA1pQZ+9oy7xS2z5qzFKrHeAJ/ZM/9t?=
 =?us-ascii?Q?yNxpYat+yXgYtHy4a9YuxwaZN7hATw5J74/la0NnPJejjqBVWHVQE/97bVnt?=
 =?us-ascii?Q?dujnWwrots77x3qqku/qmjCN6LEv2tKBBX/25I3+y59DYTJNxNpN0RvU1elE?=
 =?us-ascii?Q?rIPy4OPbZq7KqBuTCkMVKYip3VUw+xz4RuvlGFJj65oaW5yLlKV9oTW0P7nU?=
 =?us-ascii?Q?phW2gibbOjYbgGFSB4Uxf/XYkoje/wIx/vtcmtxKadSpVx1eJZ1/VtpVEzXV?=
 =?us-ascii?Q?pFI3V6H5H8kgQ0zuDL2KHJDxz8OlH/OJU7Gd247flZ85rC/peUBR0EySYLCw?=
 =?us-ascii?Q?R4GMCnYTTIp5xTKTH6DFuErU6/atwUMY42n5zyJX/M2KOiXATpUQ+PhAzqV2?=
 =?us-ascii?Q?kOjogO+tvMOQtDJXbYQjahVLfCLHo50MaiS21F2ql5TYtNgEWYDeYW7STEuu?=
 =?us-ascii?Q?FzEGZVJHZ+TIXtHwfDeBpqnEPHcUfjcQCEHWI4iza9bZ1EfGKv+D4TZN05eZ?=
 =?us-ascii?Q?vzTRgDASel0uCIt7F1jOQ7lTlXpS9MywDYdjYFky5sv9ZNwO4kbnlu15QM7X?=
 =?us-ascii?Q?5oskrxUck2Y4dahcbBGI59C+vR9XoUgGA879/TXgsYah2HezR3MX6g/8IlAt?=
 =?us-ascii?Q?Z53rznuRHIsayq0gENxMD1eeDvGDmMQEGnCPS5ZxEHNqSUNjdc0Cjol5d6Gq?=
 =?us-ascii?Q?Ior7uE9g1GHCkT/OTv0zpKKqOrVRhVOy2uGy4MncXVcd76KVcsKcPLWYWAvO?=
 =?us-ascii?Q?/Gtldise04dd9KJATVpuNN/netDf2etZmypaogXqlEyCOKJel5wbpud6cL88?=
 =?us-ascii?Q?+2FG6gMPyy29yKgszUpdUfUDicOywCxVAB7IbITw9O2DEqtP2l1wviJnL9hV?=
 =?us-ascii?Q?v+9WSHEcIH+qTn+cNpsCAAEo+NA0wNaAWXAquh9W2kQ1CqBepT2CY3Ah4C1V?=
 =?us-ascii?Q?MsOBFtYWoxXI0qBOMFjcyBtbTAZpmIQVhyvuT90x95jJrjgoWiCFMsWeUUI6?=
 =?us-ascii?Q?1/dZyOLtBI9f6D7lhTyR+wqyPF0mB4657nUWN/yFAFK6q1A1oiBIR2BdUkst?=
 =?us-ascii?Q?zQNi1KJT3LZBpOtJfA2b+i6ZFbYTxUD5nnOvcz+VYGxH739RuKQmQm1gXX80?=
 =?us-ascii?Q?YRlz23BVlGjq2xyIu5uOPAKM0PqsWlrkmKp0GmHKowUgk7hpqMfQE2gtmDta?=
 =?us-ascii?Q?VQic+ES68WVvCW4eqMBtqtrzPQJ/H51W2E03x76cjTqyLIRqojLiUM8p/70R?=
 =?us-ascii?Q?m8hXjrqrIKRqvBQ9aa3QoKHxm0VNZAx4r5zhE/gVrj7GVGgih4v5/lz41OCy?=
 =?us-ascii?Q?bWfs2YKbhA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72048503-3067-492a-13c7-08de8ad87d9a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:15.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaKKzqKYzb0TVqyBGtR65CFrux7Xi+D7biYBVYnxnyusHEsJMyJqxtYrmM2mvI+Jkt1VEeJpCVmXfftcg17uKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

Hopper and Blackwell GPUs use FSP-based secure boot and do not
require waiting for GFW_BOOT completion. Move the GFW_BOOT wait
into a GPU HAL so the decision and the wait both live in the HAL.

Pre-Hopper families (Tu102 HAL) wait for GFW_BOOT completion.
Hopper and later (Gh100 HAL) skip it and boot via FSP instead.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs     |  6 +++--
 drivers/gpu/nova-core/gpu/hal.rs | 41 ++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gpu/hal.rs

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index f70bfbda1614..8332ad67c0af 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -21,11 +21,12 @@
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
@@ -311,6 +312,7 @@ pub(crate) fn new<'a>(
         spec: Spec,
     ) -> impl PinInit<Self, Error> + 'a {
         let dma_mask = spec.chipset().arch().dma_mask();
+        let hal = hal::gpu_hal(spec.chipset());
 
         try_pin_init!(Self {
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
@@ -319,7 +321,7 @@ pub(crate) fn new<'a>(
                 // still constructing it, so no concurrent DMA allocations can exist.
                 unsafe { pdev.dma_set_mask_and_coherent(dma_mask)? };
 
-                gfw::wait_gfw_boot_completion(bar)
+                hal.wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
 
diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu/hal.rs
new file mode 100644
index 000000000000..164410992659
--- /dev/null
+++ b/drivers/gpu/nova-core/gpu/hal.rs
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    gfw,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+};
+
+pub(crate) trait GpuHal {
+    /// Waits for GFW_BOOT completion if required by this hardware family.
+    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result;
+}
+
+struct Tu102;
+struct Gh100;
+
+impl GpuHal for Tu102 {
+    fn wait_gfw_boot_completion(&self, bar: &Bar0) -> Result {
+        gfw::wait_gfw_boot_completion(bar)
+    }
+}
+
+impl GpuHal for Gh100 {
+    fn wait_gfw_boot_completion(&self, _bar: &Bar0) -> Result {
+        Ok(())
+    }
+}
+
+pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
+    match chipset.arch() {
+        Architecture::Turing | Architecture::Ampere | Architecture::Ada => &Tu102,
+        Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+            &Gh100
+        }
+    }
+}
-- 
2.53.0

