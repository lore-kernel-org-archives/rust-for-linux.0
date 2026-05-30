Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C28D34A797;
	Sat, 30 May 2026 03:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780110640; cv=fail; b=PAX/HwOrHb2H/mmOLLNtHhwDwllC6zhDDd7wcs7fR0oGhw/M3D0MMjWeCwKxN1kQkz+bdmIMIiSJY9wzY8e7rPcC8xrHUXx0KV/h3r/X72MdYRiUDb/vSmEWlGDlpoBmfShL5tHVS8aJjGG+2WniUx2mjuyzNeUs4tnkiODqfgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780110640; c=relaxed/simple;
	bh=f1UBiKHzbYj0XIH8CFz2yWzF+A9xoXlHkEPbhDH4BOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OPkUrbUJKTqD9uO01EdUg1MdRofph3PRDsiet/DctlCg5DYcKImvw45AmTnZGbtjBjtBN8NugioccCmZMK0+YK3RooeopsLfqUzOOKTwtewGonWSGW3+Zm1HQ5HSeQbJt4mSW+FhzKM26iHWt9eN64uZkXN7fWjjaok6i4ehOes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oCiPZ21f; arc=fail smtp.client-ip=52.101.85.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oCiPZ21f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxJyOpMtxsJoL29T+jwPX7+D5nr54tg7/HuiqcrL0KASfmg1ScDkBy+Mz1km+Lv3cLkLOSF5kbpD7rxLiRJo9xBnQs7uR6iQCEQiVpTkQYPcco4pi6rNmoPtvKqL68fsif9zT65rVhPwAHMIMWQLBdo3XdmXMVXN1K055/T/UIKeYrmKv653jaPMKpKJAQ7JB5Te6qNS78Z6fdniXyGxJOjSk2LGSRgqzjA5aYAPeJHW0+0R2odMFoyjur30hTYD+IfnCR7nlbSxz/xZuOHCSpT1AeP7WJpyi8kIG+pIfrmns2BdKEbJHZPJvdsqoG/TB7U55MVJznVgpgSg5RBLbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWSuwU5O4dxY0xF2Z1/XeHogvuuSCzhX5C136J+CeZY=;
 b=SFu2NlFIUYGyczxHgzBuivET1kEhOthvpj4tjl0nlsNuwzY4CjpS6nSaxOfIiyfFpNLX3lrOkNlSm+UGKvmFOjbfGmXjQPr7/96RqWWGdg3OVHP57NZU37hTaV3yr0zGFsxaixXRJqa0qtiXcwZkXkJsTgrmJylbRUOpaZZi35zroVksxZGr5ji6v5HFNIk/ETQdGWIVEmpxh4YVuSJZbspPn/k1Z1mgI8wb4PznjO6JVi0y1VIf3FUftBwa2WqIag/8vsjRSag5uEgQD6uOmxz2ZHGO1YQGmmnqcVka+dNCANk7yDwil874geS035t5/duudmhJMagEkB5v1aORAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWSuwU5O4dxY0xF2Z1/XeHogvuuSCzhX5C136J+CeZY=;
 b=oCiPZ21f6Z8ScpHenZEcqz1pGFYarsOQz9qzw83akU6Rkhs4IBeXqY2samE0+7ThRnOHUSkZgra1cA7zcyCX8ch/2Plt9vs80Ra/g6csPmwRjnE400Oby95aF39diGs0NEGBla6rUjr8C0tPmhcn9m/e8de50hSaA4dQuYiriWSy23PeZABuHjmXOKb4P5kfVHGAnX+WYKvJUaQ2x7E+6LR5KneYBRk/zsGgr6sWFSSp5diKYqkOG6fELymtfuHVZttLa5Lnd08k1+kcq0vREJzKuZ1RuA3bpCAMAZapRXdufA+UnDW8fvYKY4I8R1r3Hr8FkbjFa2eIjm44WH7txQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6850.namprd12.prod.outlook.com (2603:10b6:303:1ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 03:10:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0071.014; Sat, 30 May 2026
 03:10:12 +0000
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
Subject: [PATCH v11 14/22] gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
Date: Fri, 29 May 2026 20:09:45 -0700
Message-ID: <20260530030953.740561-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530030953.740561-1-jhubbard@nvidia.com>
References: <20260530030953.740561-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:217::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6850:EE_
X-MS-Office365-Filtering-Correlation-Id: a7469d9d-de81-45ca-776c-08debdf8f6cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tDqmRjYiR9lyqJ7LIpYLatmenl9U5GtuTE70+pIQjtvlKtDD1CRSW2KrMyQbuXeWj0oQRKsenCxajVqPl/tBxrhJpTiHUxvDqQ1JXiS+JClUlmyNaM8LvaTr1ogVY/IGnKT7bbYRz0qIbjpAZMhHkb5k/rmdTrOJqyY650+rX1NLGyG5YIvt8QTVKbLCbdn8xOqqRCG0JTyC178nMMCOPXJFz8N19Nity5wqykwxr1Xmzy4z+ZH19yoaF+hwaQw78zWJViwuzv68phyJFWQVNrDZ1nDPDe7M/MoWMSOi6VVldauVGHAcQv9dmj6dndt4fmhAzwvBzpMfTGpq3U7DJB+C8l1ZJJIxhrNJ0lyRqb6MHKkFKgT17ujXs5jqPdNAn+yXdyJQfGUAvYwzdOvo76vurJU34aw7Oh9uH6uMBCkJxmi5npg4LEU+KAsQ07lEi7swOmgMOmblZ7cYjoA8PQuQ30c2rYtCbcPlMYlxocEGNQd5jRYMWf3UV81QTSDyXfDvgX+qjvR+IuHxV8ocRqaC/CbmVe4Olj8R8rel961/URbVNVWGFjEwYXwPtqwnphGLYF0wRV1VxhYvLPzjQ4NBbu6FGX0FW64f2DlpDD988WIxD6CYXydQP/reHdejCNxOszIBl+p5GMNclJ8I0CiTg7XeNwuJQt6/otO6VMKH8Ezv3+2chT4hzRxLEfi1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wk51EjinwLBBz4dRmcqOZdW36Y92lSa+Ydyerqmf+48vIvLrj1+eQ6feeNUk?=
 =?us-ascii?Q?fK5nvnWyfIgyRTbO6LC3woU5eIewmn90YnL+qZw+QzliBMLmCdczcpsbHoVj?=
 =?us-ascii?Q?0/kCAsQ6Zc2KN3xbyReSjtplJRAkH3TsU3i4RYCqBBUvwU8r78phVMO6eKF+?=
 =?us-ascii?Q?SBm1tJJADBUj+LMgJkOlVq9q4AERUQsA9c3Kmm2AOlVJMB4Zy/eyoAd/+lWj?=
 =?us-ascii?Q?pCMFhDa2muFvBKaZut+uw8kqjXiqHIGGRiDSv9KPRVJYDIqQewWSsRimX7w+?=
 =?us-ascii?Q?OoGUe0tDMFBYZDAY5T4WsBoz7v/SPE890ZWrgtm8k6rSXxemNeewzuc2UhxQ?=
 =?us-ascii?Q?gomezfJP+l/XWEeLYOo1mewFktd0FfnzJwZKMCnBooGnxN8G4AHVdBnZjCuT?=
 =?us-ascii?Q?/DSMqPmKO86EPv3GGXkVMIbBqyWKZUmDdaNr5AHv/z3R6RoDmSrCfU+0JUW4?=
 =?us-ascii?Q?BlRGCQ/NepPP0L6vAxFrsli1lXY/nIH0RZV88CSLWock/CIVVx3iG/8F6FQS?=
 =?us-ascii?Q?BIMO/uQaiX5Velygx8+MytqDc2ryoFnNQJ9OId9MEp0oszVAmSthZHNEkIf/?=
 =?us-ascii?Q?512O6O5dxB+PXL13wQEuZKS+VpbPviPDQvH3a1kkVDj/KN+d8gu8leVLEA4i?=
 =?us-ascii?Q?KOt0f+lqvd1fI+E/0G8Ck/btxPS/U93PEZYBVqmH4jCOd9rJUGxg+7E54JHy?=
 =?us-ascii?Q?KrlTKkZemnJYYhBDcGKyW052o17lWiOIsKG6GF3MWisdaLPwOHxfPKCTEQF/?=
 =?us-ascii?Q?3p/C9SQP5Sc6rhxRcmvCcTomMVdVmKUahnAU0ZH8/GZA5MU/OjTi03QJHcM2?=
 =?us-ascii?Q?pvBUINZXUXM0Sg6egfFGApolK3U99T6Hhxp4FF2DP2ribBDJF8UdOXdV80nA?=
 =?us-ascii?Q?i2oQlSDa6HC/3aaH2mHpcAOEXq4w3C8u1fOvMfWjdBMDiIwp9cxtPKPU3Qx1?=
 =?us-ascii?Q?/hPz5H4qTSR09qDfXNv1YgYu/QitXqBA+nONJNY7rXXlhledt0NtLAmVgFzc?=
 =?us-ascii?Q?j90t3lbFf5mhjTxyZTpeFsToVS5tqZ72z9Ebm5e7CFPExVKankuyhYaQ5ofO?=
 =?us-ascii?Q?qhmOvP/gbQ7LZrjtRPNdxasmj2gsfOWzyErK9O4waXSPe0UTbrR/qScxP6Cx?=
 =?us-ascii?Q?91W6kS8j9WpuhNFlqwst+3icJaUIbZyex6OC5U4uPUXhaO2KJiyFjDhNV2oP?=
 =?us-ascii?Q?F5l/JM0bRPIsZ1j9uFOlXfZqnXSMljboIaLCYxZBoSx3bIlpr10vK9nJxmHJ?=
 =?us-ascii?Q?XRsKk99ZYTlAIeps1sW3u/0ggS1p66/GqaNfLGiG1ocFjVxT/OuzjRp13APO?=
 =?us-ascii?Q?vsTnX4rTo+gvH6fpi9+Ebi5dm56J1CmEgJb8pCdSsl2QZQnsy8K069HT1Q38?=
 =?us-ascii?Q?vn851u1cqwa4ZEdHON2qtwK319AtGRgRdM6M/6lKbo5e89mMIdu2Sl0oXUBG?=
 =?us-ascii?Q?HehOhWTEKhagxUA4a7VFDaVFElp0ibZp7Iuqu8bLeNchg9dEu4Zua2FhE4pg?=
 =?us-ascii?Q?+ph/w6JQMZTVQda5197c63vxmMeNWt4E9DBf5S/Ya/zSGHSXQamE7oFwvcj1?=
 =?us-ascii?Q?3uN6rp/DMS6NvslSZTjtqEQJyyU5W2U9lRw+qTf+9vnFdof7AD6eVx3Od1/N?=
 =?us-ascii?Q?AOHuDz6ZQflUi6aDdzLvFBtKHob54Fsk1Dytm6dtk9wBEG3mCj5OPrhT+7nW?=
 =?us-ascii?Q?y1kpg6g0ZF/xPDdZpFYssXYJOLtZ6Pkh301zINYYCpqs2NX84SBzl9ta8lQC?=
 =?us-ascii?Q?bKAK0AWAFQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7469d9d-de81-45ca-776c-08debdf8f6cd
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2026 03:10:12.4718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfc4A+hMbVpbV3U/mVIxspe1cqxJsc+1sdkfAXJn/ptOq9CfU02KuUZV5MzOGJ0+fszgoCmzUyQROuw/tqKvxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6850

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 130 ++++++++++++++++++++++++++--
 drivers/gpu/nova-core/regs.rs       |  15 ++++
 2 files changed, 140 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index 73fb73cb73a5..7067c1963745 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -6,12 +6,28 @@
 //! The FSP falcon handles secure boot and Chain of Trust operations
 //! on Hopper and Blackwell architectures, replacing SEC2's role.
 
-use kernel::io::register::RegisterBase;
+use kernel::{
+    io::{
+        register::{
+            RegisterBase,
+            WithBase, //
+        },
+        Io, //
+    },
+    num::Bounded,
+    prelude::*,
+    ptr::Alignment, //
+};
 
-use crate::falcon::{
-    FalconEngine,
-    PFalcon2Base,
-    PFalconBase, //
+use crate::{
+    driver::Bar0,
+    falcon::{
+        Falcon,
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs,
 };
 
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
@@ -26,3 +42,107 @@ impl RegisterBase<PFalcon2Base> for Fsp {
 }
 
 impl FalconEngine for Fsp {}
+
+/// Maximum addressable EMEM size, derived from the 24-bit offset field
+/// in `NV_PFALCON_FALCON_EMEM_CTL`.
+const EMEM_MAX_SIZE: Alignment = Alignment::new::<{ 1 << 24 }>();
+
+/// I/O backend for the FSP falcon's external memory (EMEM).
+///
+/// `EMEM_CTL` is programmed once with a start offset and an auto-increment
+/// mode, then each access to `EMEM_DATA` advances the offset by one 32-bit
+/// word in hardware.
+struct Emem<'a> {
+    bar: &'a Bar0,
+}
+
+impl<'a> Emem<'a> {
+    fn new(bar: &'a Bar0) -> Self {
+        Self { bar }
+    }
+
+    /// Programs `EMEM_CTL` with the start byte `offset` and the `ctl` mode bits.
+    ///
+    /// Returns `EINVAL` if `offset` is outside the addressable EMEM window.
+    fn program(&mut self, offset: usize, ctl: regs::NV_PFALCON_FALCON_EMEM_CTL) -> Result {
+        let offset = Bounded::<usize, { EMEM_MAX_SIZE.log2() }>::try_new(offset)
+            .map(Bounded::cast::<u32>)
+            .ok_or(EINVAL)?;
+
+        self.bar
+            .write(WithBase::of::<Fsp>(), ctl.with_offset(offset));
+
+        Ok(())
+    }
+
+    /// Begins a write burst at byte `offset`, auto-incrementing on each write.
+    fn begin_write(&mut self, offset: usize) -> Result {
+        self.program(
+            offset,
+            regs::NV_PFALCON_FALCON_EMEM_CTL::zeroed().with_auto_increment_write(true),
+        )
+    }
+
+    /// Begins a read burst at byte `offset`, auto-incrementing on each read.
+    fn begin_read(&mut self, offset: usize) -> Result {
+        self.program(
+            offset,
+            regs::NV_PFALCON_FALCON_EMEM_CTL::zeroed().with_auto_increment_read(true),
+        )
+    }
+
+    /// Writes the next 32-bit `value`; hardware advances the offset.
+    fn write_next(&mut self, value: u32) {
+        self.bar.write(
+            WithBase::of::<Fsp>(),
+            regs::NV_PFALCON_FALCON_EMEM_DATA::zeroed().with_data(value),
+        );
+    }
+
+    /// Reads the next 32-bit word; hardware advances the offset.
+    fn read_next(&mut self) -> u32 {
+        self.bar
+            .read(regs::NV_PFALCON_FALCON_EMEM_DATA::of::<Fsp>())
+            .data()
+    }
+}
+
+impl Falcon<Fsp> {
+    /// Writes `data` to FSP external memory at byte `offset`.
+    ///
+    /// `data` is interpreted as little-endian 32-bit words. Returns `EINVAL`
+    /// if `offset` or the `data` length is not 4-byte aligned.
+    #[expect(dead_code)]
+    fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let mut emem = Emem::new(bar);
+        emem.begin_write(offset as usize)?;
+        for chunk in data.chunks_exact(4) {
+            emem.write_next(u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]));
+        }
+
+        Ok(())
+    }
+
+    /// Reads FSP external memory at byte `offset` into `data`.
+    ///
+    /// `data` is stored as little-endian 32-bit words. Returns `EINVAL` if
+    /// `offset` or the `data` length is not 4-byte aligned.
+    #[expect(dead_code)]
+    fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let mut emem = Emem::new(bar);
+        emem.begin_read(offset as usize)?;
+        for chunk in data.chunks_exact_mut(4) {
+            chunk.copy_from_slice(&emem.read_next().to_le_bytes());
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 270779d31ab3..5871bbce7052 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -467,6 +467,21 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     pub(crate) NV_PFALCON_FBIF_CTL(u32) @ PFalconBase + 0x00000624 {
         7:7     allow_phys_no_ctx => bool;
     }
+
+    // Falcon EMEM PIO registers (used by FSP on Hopper/Blackwell).
+    // These provide the falcon external memory communication interface.
+    pub(crate) NV_PFALCON_FALCON_EMEM_CTL(u32) @ PFalconBase + 0x00000ac0 {
+        /// EMEM byte offset (must be 4-byte aligned).
+        23:0    offset;
+        /// Auto-increment the offset after each write.
+        24:24   auto_increment_write => bool;
+        /// Auto-increment the offset after each read.
+        25:25   auto_increment_read => bool;
+    }
+
+    pub(crate) NV_PFALCON_FALCON_EMEM_DATA(u32) @ PFalconBase + 0x00000ac4 {
+        31:0    data => u32;
+    }
 }
 
 impl NV_PFALCON_FALCON_DMACTL {
-- 
2.54.0

