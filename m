Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25B53358B2;
	Tue, 10 Mar 2026 02:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108718; cv=fail; b=fml2PqN7s/rwSPK+V3gNjGrcyeUkIQ79HQS72OiKDvrI8B7QVZ9fsxEqEXtaSnXJjNkOD0Oxrz7qvIRcPSQKp3g0zd37ZCUASO567y8iZwVg/dbgfNc9exKZdyORdqk2eeoUURcwDLjTJLMAZjhEH0l68K02OdJC2ixklSTeJSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108718; c=relaxed/simple;
	bh=upLiYjedf/AGKS+Vh9Yfb/xN2Xlq2B6VDqYAw8KWZbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tgea+tbBZp8i5Pu0yYF1Ag5IVWJnPAT6oLzG/arq2ZHnsM8jX0NspjKY8u/yKBdftGwYNbzMLMr0v6ygBVw5y1MCzsEXCe/JPuHQeL6Kg4NFvbfPTOJmQo2TWvUY7KZQZgJPd1AoS04J0xit5zebONaaMLWXqlSGRzTGhB+yrys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uVwm+xQV; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uVwm+xQV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXw03oBWQja9xIDVchD7iuFkjYYycVJX/ZorMNclKvJjmS0FFLdAc50iWPdObsKNdTHvGt7Dek0fxk2DG/dUa22GwSmujhQzLJB/JksQyT+67/gWYfrws+IxdMMWpt/4WidAA5PC/xgPcLQEkrAbcJafKrGgmte9cTiY8bDugt0fo/l+L7iry9bo2HJCfDPXEcZsRhsew7GS1i6NzOWH7W4QHZm18sEpShBeprWH28j30zTNqM2ZVwbEZkEn7z1M+9lki0jbjS+/MXdA3oDEXikPBxWeCm63uMmpyuI3QsvU5Qtq6RFvc4gfFZkLlYkNKo8yM5B0yGVqMKHGg8CACw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYkr1Eozyw1jTX+JgyYc8F8kvfyRRX5QeO6j4r2xrzc=;
 b=PTfTPGyJfLVShnQ3xbRD2dssAg4kw9FQmhD3PKXDp3oaUwnrzae35QbgKJH6Hfw3fsHuhc6Sx3ZavhwnizJJaYMfj90Bl9D+xaxCeC4g76ikoaHXUM6otpF+UWp1giyGL/OqI71fIYwiSnvv7NZZrxWFkC9DpyG0qO19dFAbxX0k9CFA/yZEAlegRPRcyafxOtfSQv2khtqpsuR/NOSMXSqoBW+lmHE5ChjV4pnontrEQALjHIo9MjHNtbVz9QpyAwUmPtQmfO94uUmJlpoTHXiMB809ZIPGDmhh/D9wLPSdU+F3Jh7YLsZZ2uv2jC0+Yu5mb6t2o9g4/r3uRcEchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYkr1Eozyw1jTX+JgyYc8F8kvfyRRX5QeO6j4r2xrzc=;
 b=uVwm+xQVHk4sF3VMRG2zZE+1Afaea4DidLUrZq42klbN9F384zoUJkSt8o5yBWJ6fuU3Hnc+Yv06H3mHcPivM3HCi5zJ3iTVEmbzJ2N4tSzA6NLiFy4PviUI8bcok9uKmKZO52ROUszVfU3id8xAxnkyrO/SuGmQvVUltT6wJULCjSnf7lJnxBtwHPWm+rcIt0R8YgfxfRqmH80LIAeBz3syiLE/h81qw5kDH98XFt1xyBb3J9rUOm8iuNGu+efB9sXAFJsqodXPecXvG6DPDjf+r+c8BYBhSDX9gLp3iZS7WwM6jeORvIHu/KUb648cqTOBZmVdFTx3QRGyN7CD6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:48 +0000
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
Subject: [PATCH v6 15/34] gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support of FSP
Date: Mon,  9 Mar 2026 19:11:05 -0700
Message-ID: <20260310021125.117855-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ebb73a-1bb9-46fa-6f2a-08de7e4a62b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	L2MTeH37z59qBbTfaG3HQHqzmRn+SNPNcsrcsreOkAIFN/y2L/otyjZ4ipvs0qYMbwWgcQDC0pMcDbecIsqBTwtfNz25wg+9kDyGH4OXbsmmXV3rl+ekOLEjnFy7va93ELBB9W37uzvqfNLrm8gK6OQHPjDvqqjdcCJsEebIwLWmwMitVwkpvbzsl+9cn3ZB5xbWifclAg9FEjFHdjJS+hi5QTcZ+D/Stmo28/M7QeEjlU7SvM9HCC/zi+axhUsE4jFFegDgrNu7haRlAmpQBGweE/FJbEJ5+k7otCPB1mJtQ4VMxptHME13cScBnCHNdPb+TzQgSe1uRaKuDxigW0I6otTLljPmp481tgOBbr2hdM5b6O6zXqxR6b4h/OTWfm/VR2vrN+m4EICKLA5xkemR6muGT7fCtV9fnlh9UnNBIoyRBJn4vXnIDs8UHjse5qNSvgpQ5a9fec+6OQuPgUJ9BxBVIRdgpAkZwAbZDSD7j1Kb1lkeE9EoOk3osWWKgAxlaVq11LdMpvwFh1gOtnqVAxc5ZZX1H4jfM655zbPqpDMJHemkoVXqS7H2I16nQKLu9XYgVU0un2pWZdZScNt8/qrgpCHv6NTMjbZhu7tQJ5aXhVvhR43nyGJk6pgpzDdOkCF9w0aXhQzZzGzFDZaMxdIHlfduKtnxL6lDjwIHrmvAYTWRBdUle6py+Bub0Y/wT0QQOPPvxjd5fBnDlqr8KTPtiL9ReT6vxsNGtRg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KyewUn/Cu09DjZqN0Rd/nGcUiHDFYj9q5OhrkeHyYwGl9/e80ce2p5X5TaYa?=
 =?us-ascii?Q?bbvPWB/6o9nHsc2whxerHlUamYZ+jnnMcuZQ8jEYZFl8ExhskdCnPVJLrGVY?=
 =?us-ascii?Q?Aq08yduA7yUJ9+uJLI6Xwp4qZ/do2MtmGeYHRXBZC1SQ1KsPg1Cd+hommHjn?=
 =?us-ascii?Q?VxwFfSfcpQ3KRDRZ0N3adG3sZ6EfVCEff2tIi1cdW5JQNPXJw40ZU1gTAi7x?=
 =?us-ascii?Q?0X0CsFRH7Yg5WeIhPE9jFQXqrLJD27DUh+4BITyKvff1CAD4shyNBCNNqYVg?=
 =?us-ascii?Q?kYqryq745or+8Gs9RQvF4cC2Q2qGiSDJhgvD+T0kubY/0PhaS8ttHOhd89hf?=
 =?us-ascii?Q?DnvltYyEg+u/bNWsJsZk4I8WRFVt6WonF8dwkvEh1q1nbKHPKG4mhB65ZtZn?=
 =?us-ascii?Q?uGpjTaXoxozmt5ZBR0i/x5QdSEZSAgI2omGfcihBCt9EXydC2uCUjFS+iV+o?=
 =?us-ascii?Q?xO3ls6sJuiSwzQ/SaWKtxbHu3oTj5VfwDX9tPGd+XEo4cAZLGh0LfQjak8Bj?=
 =?us-ascii?Q?8mWIjyLppzqjPivta2nYK8Vt1O79UGD0pFQMCXGw/DleKLt3rUkJlTUprQq6?=
 =?us-ascii?Q?4mKeKiC8Is/mVQGJp/EEncbPrAfORUs5Z5mR1z/e5Rk4NUBzjoo2675Z3/JM?=
 =?us-ascii?Q?bsan9l3iI7nn0/6Om25Lkgl5XKqTqw2m6KaA6X7BJOHdWJcDvpEYDzGMeWCH?=
 =?us-ascii?Q?g8c/lVvASMmljc5pjb2IuXyOeHpTYP8q7/VqfoTOFT+TBBWFzGgBqBgKeAvX?=
 =?us-ascii?Q?mjkcqd5oz3JcYEJ1AZv40FbAa9Ht5HW9JzAuomBjF6RqlZuqp3x+ln9h5hVl?=
 =?us-ascii?Q?BhIUOfRKXgAystQfQKvHNPbCtbWbMylHz7JGpLpiMSQV9xlYf8e+FCJ+NKns?=
 =?us-ascii?Q?x8Rt8w+V+9mMuqWDrCXtpv4pC24wnO/5NPDF4l/nRbYYKyu41zYPwQjQu05n?=
 =?us-ascii?Q?XZmeSgg0a7dw79yBESD69z3Ywz9+6LaTaBY3nKTC0UrtLng52eO394/vBYgv?=
 =?us-ascii?Q?dVfwOCP6wLpgIqVSLkb93v7nQG2jT1XZanJXtj/uWJox34e/dn6f4w+vJkgc?=
 =?us-ascii?Q?4Rusv8W/rAe0q2km8tTkCkdXXntOG50LZKvVL9bacaub3blFQMZMoiT2V3mZ?=
 =?us-ascii?Q?cxgTywHKB2iGu11I5wKlr63V2JKa1lCNjyUN5PeAIHNG9m9hfl7zOB2ntAPL?=
 =?us-ascii?Q?vnot7WeIfLBZeFNa+URY+lfo6GPcuqJrGPgL54jSBJDndpc5U0xmZ4CWXBRF?=
 =?us-ascii?Q?HsAW2n9NiyfUYrjWNwdj3/EwIORCx4c7e8ENamMP8bmk5yjZOq4zMgGhPLNV?=
 =?us-ascii?Q?gEhvQm2a7+K92cyNf8WdLMI/WFCErtdh/g7ZfgMrWIXV5HAnUE7oS8GPTtfs?=
 =?us-ascii?Q?zW7qfagSz/HepE9butcKn694AjHBPablSqfsJ17XFoChGHMK9/YY3dkpCUFZ?=
 =?us-ascii?Q?DHbIkCQpkxlYLP6huiCLfoa6JxfmJPhjEofzLCLOyz3yPVtGhBzr708OfMMO?=
 =?us-ascii?Q?USewDvkfFcvbh10JYNNzCX6b3urwrqsKwOuUVjbiUY41d5J5eXfZ1MSa3k+g?=
 =?us-ascii?Q?fo2Ldk/JX5XOK7RW6iWasUZghDiCpHePpmHdvBXw569e7vetxQUIi2uGBtLO?=
 =?us-ascii?Q?JIrVHkDMA0dYTbBeZ4Ta0uYcwhav3hZuuY2bjSs3StHAVuOKOMqSIwx53Q74?=
 =?us-ascii?Q?ESFrszkS1Vugc4ChJLbqd7eToOPq8FZ1AH+NrcY8ZlkHPRYsBanGDTnAUhRB?=
 =?us-ascii?Q?rUiC8yzsmg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ebb73a-1bb9-46fa-6f2a-08de7e4a62b3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:48.3653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2IbE/bMnJlOzorKnMDRy7Hh0mYbBfZejDq+Bi6dwLjV+NVaT4y2QB12Wg2sZUjO8V7Nepu1OlSEpLkKn2i8u5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

FSP is a hardware unit that runs FMC firmware. The FMC ELF file is
loaded and stored in two forms: the "image" ELF section alone (which
FSP uses for boot) and the full ELF (needed later for signature
extraction during Chain of Trust verification).

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  1 +
 drivers/gpu/nova-core/firmware/fsp.rs | 44 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 112dcb431e26..6a0a02177f6f 100644
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
index 000000000000..cea9532ba5ff
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP is a hardware unit that runs FMC firmware.
+
+use kernel::{
+    device,
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
+    /// Full FMC ELF data (for signature extraction).
+    fmc_full: DmaObject,
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
+
+        Ok(Self {
+            fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
+            fmc_full: DmaObject::from_data(dev, fw.data())?,
+        })
+    }
+}
-- 
2.53.0

