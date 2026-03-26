Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010066.outbound.protection.outlook.com [40.93.198.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4293E38F926;
	Thu, 26 Mar 2026 01:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489185; cv=fail; b=Lhq7p6Ih1d5TFGrlQkWRpPau8Q7okZYKgPedP9w7o3vvSAfHDqLd74C76cZ30UIM34uFzBXldm46KxKoBXpp/R2z/q/3iTa5TiCw3U56V9M3+K+cepqWYmEVEeShH/zQNMPmp+ymzOl9Pcvh9LTNgX4MPF0AXPLBFWpNTN5XtbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489185; c=relaxed/simple;
	bh=Y+ZtLqq7J8whFXT5LYWtgXNdVtnTzOYrvFGymmehupQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EZ3wSRa/HB+bBghVg8ZgwkJVORabsrBqSEGJ/Caiz9/zTCUhYRxiHJQcQWpyYlU+fm5irr7HIhd10bXPvqiYk+C7T9LRMmbWKUMFjiE0Uya2fXB4/xnvqDDp+xI8fr9eoE/2PhrkZP5cdyr4w6rVV8AZRYSDe9jkdTXzVWLjH1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=clKIJ+xP; arc=fail smtp.client-ip=40.93.198.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="clKIJ+xP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgCNLVW634AfC6y+ePIC3T5TTNknooFRBM38+sgG3gCIVhA0AD2944wVKXA6107u7/nkOo8JqLhLkdB8b9CbFsU7HrY7ZriH87fvxOmW6ROpll32jLAsQ3UVpzRUetTzjqV7jXm4slEEHwYWJVHQWFkzwW3Ppk0+gd4ECAwOAB2/dkH2rrphPmKhS+12GOn8qKtaXgnjUYgd1nEU8uAYMDp08b/YrtZohSdMlKLoB/PQX360ntI80Y+9/Q3RAIu9+CmsZEVwL9oJwqqyV4xZyUEUO0vUClnX2QAri6b6WUwOO9jsTuHKKWMJQseiLbcPIUeOcD0DxYGdDT5b4lAnKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHkl2dKvNcuDwvBpcOmW4GVNZwqaBJjO0RYPAZF1Enw=;
 b=wNmLGtbryl/1BkcrQd1LbWn+zy8NqqL+UDUqYOPIkJ0BYaeOia5wqxcHCA8Pt2i2g/71wBsY9xp3wOwviq7NCm0AzLL3dWVVyk2vnl6iPmBLvCHrky6JHlRYUivsaI7yFs+QEYpf01FRpWVYEimIkk5s749qkVOSZI8IV9EVPZeI4CA4RmmKl+GeOr5ziaGAPTie908bjGodF7x2B4PftqPAiNWm85i2Jyj+I/8a2ZpnC6j0UOIhkI6IeuolqBL4q24azki/4UIfq11pHQ80b9pTfQV795W8bxYBjZiY6Ju/YqI8vdCqT5B8XcoVi0oiT/k8sxrbh/RwVcTq26QF1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHkl2dKvNcuDwvBpcOmW4GVNZwqaBJjO0RYPAZF1Enw=;
 b=clKIJ+xP6KJyQM+5eEpyiG7EMrAZHoWFKabUWqj7WSE3/Xqm95wm9aTumpuyvRSXvCYsGaCS+lht44xRR+V40HnrlP9HjjjokSS/t6QAtOW2buuirlawyxWf4EPAO8q0WWi4RoMdf1ln2JmiWvzA1O0QjMW3/DC6oDilwifwfFCVPTQA2oRftnHT4xshb7sNfa/E8CuKxfUK11OSZR8ulVO13teYIl8K2XOR3/flwyu50eX3I5hPQYLqN+Py+DBSrjSJg+G+zFDnHEdVI/o+y3Khq3O5ScxGqI4h9srPWMwZSCzMO32QFeSGxvWr7yliOyyHCTyy0vPNlB8sBSYtkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ5PPFF6E64BC2C.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.13; Thu, 26 Mar
 2026 01:39:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:27 +0000
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
Subject: [PATCH v9 14/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
Date: Wed, 25 Mar 2026 18:38:45 -0700
Message-ID: <20260326013902.588242-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ5PPFF6E64BC2C:EE_
X-MS-Office365-Filtering-Correlation-Id: bb7c7d5d-3158-40f2-4188-08de8ad8841d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0K4Z9xjxZpk12sWD/3mUNNin8T2zmDoSYc8bdKmGC78/7FpZnEvta83eE1tuyqXXHFW53nmaYjEmnhkTZ4WrIOZMwPyo7LgCPSzoAAopOqGMFD2yNIOjdFXZvTzP2x0ihfJFNobyimxMeAlQUzy1jpkCU1tADrrzHisLYK9Yz8jZT+ZE2vP/DFmGDepqACY20kTjEDyPhAZemFudLZny8Vr5RWnfHH4vrPY4NUvRAiqCQqyuOiKsmVSykErzd3EiwGXb1G60PIyar/9ktKoymep/CqFYJwWuL8/QnIqA8kSPwgDPO85c8vFyAg5mjv+DkMM6AEERNFTgghi6+DpFh3+97+hrYql5e6nRbUKf1etZ6pR5u1/7+Qb4PdYLLmEgkYtFFin3NiGZtPNKe7qRaFRkkSPgYMnM2d8VDSZNPWmjT6ZsM82ZNenwm60SxwqqwBHaVT3C75dlVsQmchKRQDCVqAzwFxTBVd3nR7lrLeD+x6kaWoTpVJBmubVoB2RUa9/XyYba0C+4jzloAVUJsv1qnTChFsgFpbPBT1c/HXEQudfMo3CHkHUdvkCmH6WbZmnmL+5+JDsuy4MqNXPsBqb9TyJxMgmDoi7pLUUa8BU4Fq6ySW0W3uoi8IVMEkwa92GENQ51SiVnHCeePd2v3IlSdeVy864Gy0Lo3ISTDGtDuIgS8RWqk7mMbCuFfYKEBqvEgcBF0V5rYXZ+vcgn8EIJVINUYxeTlLFOCEDb2Tc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TJoGpjuOly/Z9rLg9aPETfdqan6wyIWHyfdZCNSjeKMkrwY4XROuAXFtEPg5?=
 =?us-ascii?Q?SQU4jGy7n+l5Wg0YpDCH+4ZG8ZI37fZV7FmZt71MocryKBllkgbFTxuLB/lc?=
 =?us-ascii?Q?ZHArF9SxWBjJ7AfmJHyYHkx3SeA1NttWhrGuC14vE7k4dKNmX9pMliIeWuch?=
 =?us-ascii?Q?b9D0hoL1SPRsEn2Y6Ao0E7uHSKunmdPWOXUQ4WHLXQb8xLzQMSS5R9Yo2ErL?=
 =?us-ascii?Q?pCabenU/WEqC3md4UyjdaiRfyeV+vsKRfSJLEEtJtICoUVej05Fz1uZy/Zhl?=
 =?us-ascii?Q?g1lYZUSWOCCsDLB3Hztpsvt7+C0oBnqXcbta5qzZu0tQsOJL/NB664lhEv9t?=
 =?us-ascii?Q?J4o+AzCZuG9y99P7t/9PLsU282Tgc+uP3akpkzZbJdwLi/ELXwKBDHBekUed?=
 =?us-ascii?Q?876IpUCiQTMDFtj9h1LV1KV1FMMyd2PIV8dcHE0J5roXs8OliyG/O95SC+Ob?=
 =?us-ascii?Q?4qn9Sb8/AlS0gcvVDy3a7FAGt2a923i4YRxcsKy2soU9m9oq061o+g3PjV0Y?=
 =?us-ascii?Q?RO6L1QAZVXp54QB+a2UFIDbGRFcbAK2gavzDGePR6YznMEK5Ws7eql4RChAK?=
 =?us-ascii?Q?pQ2fNxL2wVYT7PtfNbte3tube1hC4k2sIiiTiJs7TrdSs/q9loT1eoEA6deF?=
 =?us-ascii?Q?ElaZeWFIrZtpa7UFAoXkRA6MF8s0E8PxWElys4XK3AgFb8ZxB49nvVtDa82G?=
 =?us-ascii?Q?0DQ4pivY1j1Ub9u/hqmpzHEWjBkzKBz4adBgFT+cydiSqiZBIaBL+Nd/GzG2?=
 =?us-ascii?Q?cXJapZ7woevyrmPZrOjepM5BszWW9G+S08K67e4d7nZFDGAwh4RQgGt4yzHc?=
 =?us-ascii?Q?+nGeN0zRNVVy8J+BNB2vDbVBCZokdkj5w3vK/wjVrTvgZY2AnR1VjyTUR+67?=
 =?us-ascii?Q?r5E5YHMOmhDUKLHN7D2zqkECfGsSOKZm6qBr+9equSS5EDmokEN6yOP9LwJP?=
 =?us-ascii?Q?rF5xVLAPJLH2V7gqmUgRgiNZhjxY9vV8WL7uEkr75ubBveQsHZaN+kfWx6QC?=
 =?us-ascii?Q?mxex8/Bx5WUS8Z0+2xtUiMBHCghtqxpnK9OPvCPWgexq98jo6KMMgLNDFdBb?=
 =?us-ascii?Q?jl3+Clnmh5AqGVSQSMqhJYevQty8KE/M6T/sJGSKDju+ypY0/MaQgOrURJlk?=
 =?us-ascii?Q?OEKKLVKS10Sq8JT36X7p9ztGk0btDjO2+95ay47Odi1Tn+vwQ6yj8Gn1av2V?=
 =?us-ascii?Q?0UQaTep+kp3l1nPcTLftsO/kcbFasFEGovsaFZqdDccIO/P0yGJm7sIjGqYT?=
 =?us-ascii?Q?rX3QPwWY/jip16310+pgb3P9kpu3Wu72fhHMlGtWDFFhlD8ZEvq/44M866kI?=
 =?us-ascii?Q?xEVvyV/8kKzSGmSULvDKBMMi/joYB/H1Pw0XqxW9mGXnFULVK7xrc59EdzTV?=
 =?us-ascii?Q?JM3nGhGK4771TvIKhFbuwnIZeCulSSXldKZweC6TWzpywe46D+lly7v3uQZ2?=
 =?us-ascii?Q?ZVSsyM+KQFQbR3y+a+BhI3VlukomlqC9r00FCkRL92jlYurDmFF+uG7npMiC?=
 =?us-ascii?Q?Jx7Zobs4PLS48HLVp29YOylO9qLazV+lv0EaLsb3suRkILZRqTmeKRSy3ihI?=
 =?us-ascii?Q?1HPAmlq06V9BqtHn4bmuRdBkOS/ghxPcuZNYNiW8i+1D3t8Z/FEXjAyiXNZq?=
 =?us-ascii?Q?DbxCj+gbUpuCMgyo85WGkLOE0aCwnr9qHe0Y/BCSaYtEre2cXT7+DT3nbA1+?=
 =?us-ascii?Q?Vh0ZYmUqRDDLJg7APeP/G5ub1Ud0bEZ8jcWMLI+bAaJZAw2QcX2T08PNZ/8I?=
 =?us-ascii?Q?/gAlySrC0g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7c7d5d-3158-40f2-4188-08de8ad8841d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:26.9088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQsDIW9JIY9DMjU0sIeAaJxWDyQvEPHXaqaEq7tML5yxmtFSCCL29K8Tlu3C9bj1uOrp0kEQp0Dl5j+7e/OBJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF6E64BC2C

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 120 +++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs       |  12 +++
 2 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index c5ba1c2412cd..29a68d6934a9 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -5,13 +5,26 @@
 //! The FSP falcon handles secure boot and Chain of Trust operations
 //! on Hopper and Blackwell architectures, replacing SEC2's role.
 
+use kernel::{
+    io::{
+        Io,
+        IoCapable, //
+    },
+    prelude::*, //
+};
+
 use crate::{
+    driver::Bar0,
     falcon::{
+        Falcon,
         FalconEngine,
         PFalcon2Base,
         PFalconBase, //
     },
-    regs::macros::RegisterBase,
+    regs::{
+        self,
+        macros::RegisterBase, //
+    },
 };
 
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
@@ -28,3 +41,108 @@ impl RegisterBase<PFalcon2Base> for Fsp {
 impl FalconEngine for Fsp {
     const ID: Self = Fsp(());
 }
+
+/// Maximum addressable EMEM size, derived from the 24-bit offset field
+/// in NV_PFALCON_FALCON_EMEM_CTL.
+const EMEM_MAX_SIZE: usize = 1 << 24;
+
+/// I/O backend for the FSP falcon's external memory (EMEM).
+///
+/// Each 32-bit access programs a byte offset via the EMEM_CTL register,
+/// then reads or writes through the EMEM_DATA register.
+pub(crate) struct Emem<'a> {
+    bar: &'a Bar0,
+}
+
+impl<'a> Emem<'a> {
+    fn new(bar: &'a Bar0) -> Self {
+        Self { bar }
+    }
+}
+
+impl IoCapable<u32> for Emem<'_> {
+    unsafe fn io_read(&self, address: usize) -> u32 {
+        // The Io trait validates that EMEM accesses fit within the 24-bit offset field.
+        let offset = address as u32;
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_rd_mode(true)
+            .set_offset(offset)
+            .write(self.bar, &Fsp::ID);
+
+        regs::NV_PFALCON_FALCON_EMEM_DATA::read(self.bar, &Fsp::ID).data()
+    }
+
+    unsafe fn io_write(&self, value: u32, address: usize) {
+        // The Io trait validates that EMEM accesses fit within the 24-bit offset field.
+        let offset = address as u32;
+
+        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
+            .set_wr_mode(true)
+            .set_offset(offset)
+            .write(self.bar, &Fsp::ID);
+
+        regs::NV_PFALCON_FALCON_EMEM_DATA::default()
+            .set_data(value)
+            .write(self.bar, &Fsp::ID);
+    }
+}
+
+impl Io for Emem<'_> {
+    fn addr(&self) -> usize {
+        0
+    }
+
+    fn maxsize(&self) -> usize {
+        EMEM_MAX_SIZE
+    }
+}
+
+impl Falcon<Fsp> {
+    /// Returns an EMEM I/O accessor for this FSP falcon.
+    pub(crate) fn emem<'a>(&self, bar: &'a Bar0) -> Emem<'a> {
+        Emem::new(bar)
+    }
+
+    /// Writes `data` to FSP external memory at byte `offset`.
+    ///
+    /// Data is interpreted as little-endian 32-bit words.
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(unused)]
+    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let emem = self.emem(bar);
+        let mut off = offset as usize;
+        for chunk in data.chunks_exact(4) {
+            let word = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
+            emem.try_write32(word, off)?;
+            off += 4;
+        }
+
+        Ok(())
+    }
+
+    /// Reads FSP external memory at byte `offset` into `data`.
+    ///
+    /// Data is stored as little-endian 32-bit words.
+    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
+    #[expect(unused)]
+    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [u8]) -> Result {
+        if offset % 4 != 0 || data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let emem = self.emem(bar);
+        let mut off = offset as usize;
+        for chunk in data.chunks_exact_mut(4) {
+            let word = emem.try_read32(off)?;
+            chunk.copy_from_slice(&word.to_le_bytes());
+            off += 4;
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 53f412f0ca32..f577800db3e3 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -461,6 +461,18 @@ pub(crate) fn reset_engine<E: FalconEngine>(bar: &Bar0) {
     8:8     br_fetch as bool;
 });
 
+// Falcon EMEM PIO registers (used by FSP on Hopper/Blackwell).
+// These provide the falcon external memory communication interface.
+register!(NV_PFALCON_FALCON_EMEM_CTL @ PFalconBase[0x00000ac0] {
+    23:0    offset as u32;      // EMEM byte offset (must be 4-byte aligned)
+    24:24   wr_mode as bool;    // Write mode
+    25:25   rd_mode as bool;    // Read mode
+});
+
+register!(NV_PFALCON_FALCON_EMEM_DATA @ PFalconBase[0x00000ac4] {
+    31:0    data as u32;        // EMEM data register
+});
+
 // The modules below provide registers that are not identical on all supported chips. They should
 // only be used in HAL modules.
 
-- 
2.53.0

