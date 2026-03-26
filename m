Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603D5391839;
	Thu, 26 Mar 2026 01:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489183; cv=fail; b=f4hqslx7PVrNXZsYzmv5Ucfo8rBbruo6CGakOHLIqVBoZ9zS/OTCVt13jE2XnFcQF9ezFtzAjcJlUpwThCN6o0iIuzVfZRYW5lbaJX56Jdm2QCH3Cd5zcjI01sjCj/DneYjiRiNTQ4HXj06rZb0Zg4FzRZicce9ntG3Egf/OBvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489183; c=relaxed/simple;
	bh=h8ism1XkQLdNffu+9g4QoXrH5vGgzdLp+0NDfsvVyaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JHlEYLcpAga8YR19kn4ser5G+aNHzxcY8KlBuzjgbY+qC15cbP2fgn13KgSie80VwD/5DsAYLu3W0EYV/i0WnQ8zV6/t6c2EnsHXSbl6a+wPNFOkxvo+AhdQtttw8suTQQqmfoRa5Ql7bddM6Z3RLpdAdpR8iridQTvUPTlcZ5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PhsXkJOq; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PhsXkJOq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uz8kCxL/MonOOrsO1znILGJ49KfQuTsPxYb04kksrwpl9J38OMP/XGvy75uTpTiHTUl1xg/3DYPxqg8BbjfMXIwbmS+lMTOSJFDal3TsyHkQ/G/A1Da7y2s0yOL7TwRdjtHzd8rPqJlLe8z9XLhp7NBRGyjxRz0jiGhB1u07HWLwkXOz/oTHWcsVWIQ7NczvMHSJbiq44Qv7PsCDJmzlt3d5ALirXSi5AOuYS5zCYB+rSrtQIS8yAsazG0SqlpzrXbIVwhzFPGAXXA+xjXxOLTb99Z25iO4UYBX4lmwppCeCxx5n22LBwI1P/JP9eFmNSAh6Mvd9oTdpIMR2mmbo0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgOY3IeHBxv/241DMDzIf22LpBFUEV6bVqIW1NV0js0=;
 b=Q9OV2DKuYMHI0J/TvtO9/HUPeyO9iQ7PXZZmIqkAErzB0PnmDkA3amowdfeS0S6ypGpBXsu4nFTFnw33ObqUhLd0RynMDFdjdgtdheo+1Y4FakoRhMNwaIzJcP4VOZxMt/NqpdIgkZzaLMiGUIovB9mOKZZ7VGwogT1T5r9iTO0V/r6ZkgPZA6cEfBdBFgiOJzJ12C9+QCEjLUCmDD92TE2RxH/scmvunPSGU3Zsa9UNSCuyPRHUeNGjOyb9ODZ0kXxS0K7uphvKy27+wQ2gsCPrxRY8KqUMmBcgvY7c8B0nbsBaNXg0OPnvpe29WL/LXAVVs3hi6FRTsbHkZ3mqzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgOY3IeHBxv/241DMDzIf22LpBFUEV6bVqIW1NV0js0=;
 b=PhsXkJOqyY561lGxuvykxxrUl0HVOl9VQQlU2PmZJt1EjNH6wo3g5bNnCRE6F787QoFPFtQNo7YwCA3T4FtTJL6dOyBiOg7OVY/c+8UZw1gj9/0H1j/ydp58quJJasnE5+LvAK2FeGdYmtFvd7Op3CtezfhmIbybQ2UPp45v1/G6+1/BsuSGijsWSwmK89NSBI/ZMTICzXqJxn7ryDAIyj7NiKyixWg9u0JAIlUtO2mQisFi5Vebqdm4goDJIWtOz8qi/Qtf32+oSZlQKQug32k3MaSXsXARhY2ylhrK8SB81EPEXv9cr0zc6D+pxygetvdso0MgiLflakMjf9zllQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:23 +0000
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
Subject: [PATCH v9 12/31] gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support of FSP
Date: Wed, 25 Mar 2026 18:38:43 -0700
Message-ID: <20260326013902.588242-13-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0038.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4462f1-b41a-464f-a865-08de8ad88229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZifQKtKv/SAiaSqmWhTUNut84eTtBNsO05BKLGJhj837Y4jl5BYVvqGQx1JnPxerQL8uKLVzs0DhO8V0pRbXqgWc5zXKd5dEDgEiZYaTxw09rYCk0edqDJwMm8j8lZzF9Fwf+MWUP9KOEQuIJhGMrVB3wEJVf5Py9odHGKoU5VlTdAYqU8E2FLMDtqYtEWIG6TjHupT3NlpTz8UpyOPYuZ5HsSsFqO2/GJbm70I3yXAyo8dmdRojJv4mb0rueDrPjx5DO6I0AxqXIOIz3kRpKpIIIqRQfmI4e4m7T8JIHKNoNCF+T45aMxQutAhtI9uBTAl7Bex6Pq9adYfYacMNLTk11Ft5Maa8Xvhhe/evesND/dfRREJ44eTC3O/A7PlqpaiLhE92v7CfZ4vY0gAvIY4e6Lrfg2UCuTGVO1KK64b4AavipB5ivBaxnF8qMpyUVH9EzLajIOU1FMVjPym4MH+12AJNeGVdH/LX+u2Yv/43Jz1XN4E9d3idejRpnl8NQ6djeddu8yy0tCZP4p86+FwlDE5B3S5A+DlqfygG9iLgoJNMzvFPnrJSEOzLjurBMMrPc6hvCSVwrLV6N1UFbHlwKRlot2wZMMAu+puRmJZ4uNtJkL7SvX5TC72RNy8L5TW0Y4DjC/rJ8/TcdN4ALDMwZiDjwIl5LVKY8XZGczDJBqbwxEkProVPcLrtrMYgIu/ypqsJ2nnOpB4LFxrrrrMbPpqcYnLWgXqfdfyE5Qw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ssoOkafHhR0z6y0wbIiMvyA6dHwa4XlDdc5+B4AIfto2eUIU9V67E42PPDrN?=
 =?us-ascii?Q?7PPnAqskjzX78uEyD64sGNXD7E1yEdLnFiu2XRdWDwEpoXlfsqPws7dlfviG?=
 =?us-ascii?Q?CYVIrVGSSak+DZg/bgcj9wjzxXQuD6RpJEmgwjCJ0TCV7PGcwiHnBtMA8axj?=
 =?us-ascii?Q?W2e7hThi2zvQhoDNVAJRZHWZty5s4L1syGApBI0trntpkbXmPlY3xYQ1l0x4?=
 =?us-ascii?Q?FB9V5R6nlftcCX5Nb/q6E2U9L6sNuLdw4IlpbY2O5pSJRzJqB3JxnfUSTUfx?=
 =?us-ascii?Q?MTit3Atzilw9x2X5WCYbr0Ks2L51C6qyMMsS1//vND9GjOWMGQspYCPOkCKM?=
 =?us-ascii?Q?c1U3jQCuPuUH+2gmCyslbfekzpxWmoc7WmhBa1wX0pGkL+llJFOsYLpAcBra?=
 =?us-ascii?Q?6IKf3FZHrhHrKsfk5QU9a/FDXZc/eOdsrI87674T5h1bHZrBeXRVb1p3lP7N?=
 =?us-ascii?Q?P1GowSnVaqt4DYeFjEovtxUklucW4ZdB3JB4e9atQAt+Kzvj+8G183ptxsLM?=
 =?us-ascii?Q?sqR0SvpnkSWmxr/1dLL106HHT5sW4y5537anmhRHJpSZFQv+j98Buss8mEr3?=
 =?us-ascii?Q?cdNlNgNqjLnRgS75Chho+DF5m1aa4NM8Jb46jMevSxD2JKSUTcYv/p/LUfOq?=
 =?us-ascii?Q?rqJ+zTUyre3HVCPrK0JO/A/c6lnB55kZHfttodjGscf5fsN2/z0JTNJRRWbm?=
 =?us-ascii?Q?fIX71pgHSGCUgscoWQySLuNLJoOKjvB23kXeOBDLSw0yMzplndTthjmDKwq/?=
 =?us-ascii?Q?g/u8DQ9PEC//bCSWCLbfqX+mAQJvulzg6PTTuE9eK894d74ubBfYP+bmQhbl?=
 =?us-ascii?Q?Ft1bOLAu0X7f7iIQ9EervTRr9Jl9uMrtTgarn6J5YjOh/4DBI3RD41xEEhqc?=
 =?us-ascii?Q?1OrrnlY1IHA/q2ahyVjhf/gY0qlzBpmZhBCA/jkxTTl7Gx+oAkowsVB8QfC5?=
 =?us-ascii?Q?IqC8NNWEddA0hJESbsq9CG/i6m5Z3AODQJKxWjqGSajqWZQmcqibTbBSYav8?=
 =?us-ascii?Q?tyIvyP+vGnO/b17BnTIEX1sAtb7HhIFVOB56yPLhv+AvaxVhnF4++OuH8+9U?=
 =?us-ascii?Q?qccGDcEmvebEWSai71VA9tnYpWdo+TGPjs1yC2EvWeFx8wRlgDsWMfBl5ej7?=
 =?us-ascii?Q?ZVMZ/82AgtyrbhrPNKNaRpo8jySQvUY5Or2lTm/lSNQY4s6GgIuhA1X0lP56?=
 =?us-ascii?Q?G6ruS8dPjN1oX7jXDaouWrWQyKR7UZPzCRs9uLNUfnE4sYLFuh84sKYVLd8k?=
 =?us-ascii?Q?5AcRGZneK5c5AoxrokbVAkqRQyIKOLZdc8WanuJX8KFdHmb9NzGBBrQO+j+m?=
 =?us-ascii?Q?F3PZaXCofDZpvM/YZN1YrPC1o/BmQKRt+CRWqIfqshKa2uNqo6JFgJw9UrB0?=
 =?us-ascii?Q?yajzCiFLL7GjcVA44oxs6uNRczm8y/yQEEKSA95T7q9pKsyCP4QHTDgnY03Q?=
 =?us-ascii?Q?ATSWxWbzd2BObySatANAimTiC04b9dAOccReUEwoPM5pDELBN3XXxZx5MByx?=
 =?us-ascii?Q?q8/rnxNbFJ9WcTaAtPQw6Mk1gYVuL/UtRhva2124PHsAXDUgkiUazIPydrOl?=
 =?us-ascii?Q?NONV5GR7BcqGDL5s33rn7dVMLSaWZrhI6/lBCwrRFYHL0fZ2+Lh9fIeKM97/?=
 =?us-ascii?Q?vzErWcO3rJbOT5dgk9+jjDrCoytPWkcds3Oy9Xxzjow2w9Tx5+08q29DEZxy?=
 =?us-ascii?Q?Dx+7tfzqyYNHFKgzjChtb+JBKIBIDG3pDqU7j0EydLXSLMeOJj1Hk1xwyHfl?=
 =?us-ascii?Q?1qY8GgTV5w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4462f1-b41a-464f-a865-08de8ad88229
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:23.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QXPNBIpcAv9YCd12qeApuprqiImRBE4BCFOEdQMbaLPFyRxEDGNDUDoHcDbEEcuv96lyrCZQk5dl1Dm4LFRFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

FSP is the Falcon that runs FMC firmware on Hopper and Blackwell.
Load the FMC ELF in two forms: the image section that FSP boots from,
and the full Firmware object for later signature extraction during
Chain of Trust verification.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  1 +
 drivers/gpu/nova-core/firmware/fsp.rs | 46 +++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index bc217bfc225f..bc26807116e4 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -27,6 +27,7 @@
 };
 
 pub(crate) mod booter;
+pub(crate) mod fsp;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
 pub(crate) mod riscv;
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
new file mode 100644
index 000000000000..028f651553e0
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP is a hardware unit that runs FMC firmware.
+
+use kernel::{
+    device,
+    firmware::Firmware,
+    prelude::*, //
+};
+
+use crate::{
+    dma::DmaObject,
+    firmware::elf,
+    gpu::Chipset, //
+};
+
+#[expect(unused)]
+pub(crate) struct FspFirmware {
+    /// FMC firmware image data (only the "image" ELF section).
+    fmc_image: DmaObject,
+    /// Full FMC ELF (for signature extraction.
+    pub(crate) fmc_elf: Firmware,
+}
+
+impl FspFirmware {
+    #[expect(unused)]
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Self> {
+        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
+
+        // FSP expects only the "image" section, not the entire ELF file.
+        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
+            dev_err!(dev, "FMC ELF file missing 'image' section\n");
+            EINVAL
+        })?;
+        let fmc_image = DmaObject::from_data(dev, fmc_image_data)?;
+
+        Ok(Self {
+            fmc_image,
+            fmc_elf: fw,
+        })
+    }
+}
-- 
2.53.0

