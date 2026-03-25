Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8302A2E5B32;
	Wed, 25 Mar 2026 03:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410809; cv=fail; b=b6u/rNpOtfcgBsEeWnKd6tTx0jIKLa+ZNXnt8OcVjsCahqL6g0Y6IyGlheg72GPJ8N/VEKVRsHbVkx8zvHGHhG7vu8ionuBgabZBPBK3MfsS3BAuGBny1XUierZxAOmpFSgpNWsi3dZ3oCUiLXABrJydk+SP0Y56hI6gMtTLuak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410809; c=relaxed/simple;
	bh=I7bcfjL9kLQDjAAEfBj4QUrP6Zozkj/OONBWONkC924=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EhjLeE2G93z0UnzS5f+qoDVck+sUaOY/QQ8EIILIOkuC8MtqAf11iBinuiP42t6JWKlw3cuU+Nsed/IqaY58DjUNjqTfYfK3KBYh/NxRpTg7yN+KTqWl4fzEwJN92DuLgCrPkx8xJ8WZRPEujPmBl+NgTt5j3kbUbB8PwK2xnTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aB9J3yjh; arc=fail smtp.client-ip=40.107.208.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aB9J3yjh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4GQ1oyMCFN+U3Yb/p0eZrTKPAoTFSmDwAl8AeNKMa8+8uh0tKuHecclZap/2RVOoDsyhzpLCopuSNxopu+IbzVqEvunSVYb9zBaroOTZHAAOqgZooCj+31Tfe60sdWes5FPm+ESoremCa7118dPmjE7qqFQSBMnSpKwhkf/4r4RT6Z5nbWR7qJM9M5I0nGoO0m+e7A88fjuuBJ98/AmL968EaI5BMwuCZH+RQPqh98r3nX++Gw2FSiw3dfYxILDiL7FzUN7K5Q2OxtU3dj+yCisibslRFsavvex30m8NxbxL4FZiBBTB3XWOhiWkXxtP8oA75Jc9SSbRwKmkLggrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kx4/nLphfBuA3qmnmuwGlt4XO8pKv8oc3yNM7GreG9w=;
 b=MzoJZgp/JfSak5pXuApxVBh/poo60PSObK0AlsnxmhNXc30BNLZQEisHMHl1AIf+FX2e3QLLbMLVTQ+OpV2IYbhIb3SU7fkpUK16o11UfvDQ1TB9FiPdkybPmCTT1FDGxjYY3DgnGlz1nItPyH1Jh0gplbpdkvUhQTr1IWdHxC342o3zBMadSQmQYsBMqIYNDysUSPclUzfXI0fYSgTeOjmrIdePVnZiLBFAmhdI0nR+f1Adj7Su2k1xW3faWwB6/WcLUjW4L3FTd4MdSJDiHiFlJuMmyQKPp8dhnk3n34R69xHKA7hyOox5w1dsysF9xYHX7eSEWgxloTFN9Nbo3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kx4/nLphfBuA3qmnmuwGlt4XO8pKv8oc3yNM7GreG9w=;
 b=aB9J3yjhKwrhNXmSDvXA1O8J9GdaEn82cdEFvORDCmRla6DbgI+3fw0TNu5/q6H09XEQ2RDOeEd/9mKvtpvseW8+x/uiHLCHUVOzglMZUHM6uZbkzy5TvxG2KC8n6TrVA18Ys/6uD0035TygXHtx/6N1HWg85K7uURnIyrQriPbATaLf93ljrI/mCjmtTNEQ37LjMAYlrzVjcWFFk5p7r7aHPuqAU0m5fhr299GjsfQ8fIgr3kwKnZgbndRxHK7D/LhO/28CF+sHDgqKs7SGXtE5ltJShXO4lnFnHzh9yR/f9bBm4+LRDj5j2EkNy+zKh3IDPYyw5g8zdB3P88VCPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:06 +0000
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
Subject: [PATCH v8 17/31] gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
Date: Tue, 24 Mar 2026 20:52:28 -0700
Message-ID: <20260325035242.368661-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4de8fc-c0d2-47de-6b58-08de8a2205cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	D2l7ukzPwRV26Az/TSkIIoEn6dKRyvrJvJ+JD3bO/y8tibXatDBBMM4wrZaa3luAfJh2aixZth3P/NVXEtcomnTYSI+PFuVgfGqXKwpaiEHKqxGrFEf2cAAR7l0FAgg91QrFb5bdxRZBeaZcRh2d7B4wOdOfWHFnSR7p3wxJKtMQJpVqemStj7FYEoRNNNO1OKqTeWSop+AQxyHdOJ/+JRbwYXx1924IDbHTcNUHbLuDIdnH3bczMDaN8BDbgBMRkPU7vBg9ROT52PW1pun9Ronmi/67Fw41upfUKdi4VV5h6BPxWPPBkdJ7UKABArxGmj0Mi7xIal/rAqmXXn9mlxRx9MofvcH4fl/VFcCqjMcIt4AQkhALelqgy8nSWy2R7//w5QJvY1c9mxJQkDTjiGkopEuiuyYrrhAJDUnyh/HafDNMO0csYsAKhQeh5OXkMnyHL6lGqpud60Y1WeFDiK8SjJ2Q6QkRjcBzrkGY14YbB03jXF4v2U53vetEALfSAWd/wwTh7sJghuKae6HlqIKpDi8aVESyBevKRDs/sCSZZCkPwvU6Sp+sRs70Z8uuSv8+q7SI7JN4dEnTNAlXTPYMrq8mfFUINgH0fpSJ56goG3HK3HxmI+pffm9dmcuNDVVeQY7oBLBjad2V5RhpN1aNV+8aS8EtN/Q4QWra7YatoO5tdJ05dtpOzQO8COrPOyajFXnhQJYTe0vEMzdbe9wPQXhmZ5EgO1BSpWKo0J8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c9nCGULNOFkN4eKEwYb0O0zVyuFX1GTvuIx9YJPwvbksJWGbgMrNA6ubysuS?=
 =?us-ascii?Q?vY3KkJRkBL7+MhnLS5Sry0M90HPkwoArKF1LRJpAXAqSJGorPbplecGRVckW?=
 =?us-ascii?Q?8ozs/AFewaNVLMf9SaNms6ygb9EEBwHOqA9ekgFBHYJtDN8eV22UqiJ00672?=
 =?us-ascii?Q?qbeIUPdVWPFu5dkJUdlnT3st91nP0wCQBPb+BW9fLUh2paga3fhF8LeRu/kr?=
 =?us-ascii?Q?YLAAy+FoxcSoqIN4F4p2vsjSNJ7EeZKT+B5W7Uaxo+712wiN8Qur5FSIgAx5?=
 =?us-ascii?Q?nInoVx/VRyzww3qdRwct4dMVhY7+HnUh2k0OZZPPLxIm59/uqbg/xiSdc9Rb?=
 =?us-ascii?Q?La2bTlZNSFtkDbvV2mVMEX7GqckDIDTbjc7OCUKAOnez2JtXTXxOU8QzjW8Z?=
 =?us-ascii?Q?Vu5WkB87yJtxI4dXebT53XFkud+cygSchSwblCfPTVWsXesNhcqKj85vY9GN?=
 =?us-ascii?Q?6jiRuTAcVsuvEk/UW/tm0IjJ46Tz8a7TJznp2IKg1r+fZo2KTLzpSdAWQ7cD?=
 =?us-ascii?Q?u5PE4A6cQQA2X37r3bm1+Qf2B5BduGNKTnJuSVHmUrOZZNWqCX2BzJa9TX3a?=
 =?us-ascii?Q?g50pOKnym+9lGidHlyXsuctJuL3bciE61VF3uXGgmZSqTBHe5BL/hczTdmi8?=
 =?us-ascii?Q?gnE7RucVf8sox4pNQ4UAYWff3bUIbSOZoeLJrIsvOZVjEoE1v+xsvv0d/Atp?=
 =?us-ascii?Q?a/icucyuenrYtMVShTOgAVtmoyB1LRGhuwWrQIC6q6hpTsJ1hbS4NygvCzDp?=
 =?us-ascii?Q?6YKQsBKqV5SwMAxq566suKRyEHj+w5CICKtM5cLMECqqGpKrd6l2DF39njS8?=
 =?us-ascii?Q?XJh1SWe7LyIoi03cf+0r+zvTqaKR6E2YB/33qaIPe1jQPiPiNZPtT50QRs4Y?=
 =?us-ascii?Q?jUmUS3Ly3Gy7n/QqPdPjy+K68bdbioIVVB1IV0Wy+iKdHNpS64YsLsPpPirl?=
 =?us-ascii?Q?/Gj8+AZsOAY/vxBtVaiMYjFjEtJTphwJh5F7TaeMycqZYBm2jE26GRLzFEu8?=
 =?us-ascii?Q?cHuHwI/njLN+G2epVU/bhY4NSaTJ2qjZBtNgiFJLBdQWLNMfncQLhUUlEVsU?=
 =?us-ascii?Q?jc/CIEgxkMPhkT5DAyPzxEvg3FxrbY1YYvy/Ii79vaQiLJh4kHkEVpYWiJD2?=
 =?us-ascii?Q?Y5UGSVQokBDQzPmM4nWvQoEZOQEtezHc713ZNMrfsu/+93flTST4B7F/vBSN?=
 =?us-ascii?Q?2AnuD9swuUnzPjAH5CrQYWEVy8jwQwm3mC7XRNYbNESnkTwLEtJn4bZrU/T1?=
 =?us-ascii?Q?UDMe5uDKj5nzwZPV4u0MxcR92by9Vcl/aZ+x2u6i+xC7FDtjy58BNCsrx8QA?=
 =?us-ascii?Q?lFtQNRH0tapXZea3JpEM8yRzvl4i9ZY6mwXAM2R4tTg/p95PV4uxZxeJ8x1w?=
 =?us-ascii?Q?sTSqBf//cjPOjiF18p1aStFnfmsguze1WbV5WoKbxReGHoefuZaBcKR4jnAX?=
 =?us-ascii?Q?u+fb65bfaUq22snN9qIkDjQVT06GvcFm9xtpKxhw4qcCpthLJVQpl3HEObiv?=
 =?us-ascii?Q?40TLLaYHkS3iu6QWLP4hBmYeEGPOA51r3C/bWiBOSndVlIob8/+htrlJnd8T?=
 =?us-ascii?Q?AeVvJmhc2VPHRb4SCSkkK8XcFoYxcjvtUuMR1ek7UZ0FGK1dZFhv7Cq9Jivz?=
 =?us-ascii?Q?xcfllGNUnx1hYDRgdxZIHNRUD+WhTifjRjfeycq87FDT/tKAlKuL1uoNq4Ko?=
 =?us-ascii?Q?+9Zxxl7Zuf5xdAYUr1HtTS2x0HrEcAsP1pZVSzsAEyuTpwCBHFJWlYahYuba?=
 =?us-ascii?Q?riTRYzRYNQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4de8fc-c0d2-47de-6b58-08de8a2205cb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:06.6006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69NkZ9L6bVRVoGqZfLga3U2gmCZaVwkxej/rNZm7Euxs82lGeQREureRx+TYHYP3Ia71tSyXtp5iscJtQ9E0Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327

Various "reserved" areas of FB (frame buffer: vidmem) have to be
calculated, because the GSP booting process needs this information.

PMU_RESERVED_SIZE is computed at compile time using const_align_up().
The total reserved size is computed at runtime using Alignable::align_up
because it depends on the heap layout.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 8 ++++++++
 drivers/gpu/nova-core/gsp/fw.rs | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6536d0035cb1..ffb996b918f8 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -10,6 +10,7 @@
     fmt,
     prelude::*,
     ptr::{
+        const_align_up,
         Alignable,
         Alignment, //
     },
@@ -270,3 +271,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         })
     }
 }
+
+/// PMU reserved size, aligned to 128KB.
+pub(crate) const PMU_RESERVED_SIZE: u32 =
+    match const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()) {
+        Some(v) => v as u32,
+        None => panic!("PMU_RESERVED_SIZE: alignment overflow"),
+    };
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0c8a74f0e8ac..3a76d24104fe 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -27,7 +27,10 @@
 };
 
 use crate::{
-    fb::FbLayout,
+    fb::{
+        FbLayout,
+        PMU_RESERVED_SIZE, //
+    },
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp::{
@@ -246,6 +249,7 @@ pub(crate) fn new<'a>(
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            pmuReservedSize: PMU_RESERVED_SIZE,
             ..Zeroable::init_zeroed()
         });
 
-- 
2.53.0

