Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F5F186A;
	Sat,  4 Apr 2026 00:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775260982; cv=fail; b=TxMU8t5TlA4KyptDlBSJ0hZH/bFl6Xm/tgmorUfnFY81cdExonYrRC3FiRpAXFr62qyavflTh7qbas96Ph7ru0LwTOUdnmCoN9bC9sgH/zklKudKxWx5JCbabVwAbdBrFrU9gXhjNa+l9htY/rkcHSwLEsAF6+NHDl49p5nT2ro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775260982; c=relaxed/simple;
	bh=EgKQomDXTn+mVolqhSUwUxZp7WLX1QYVldYAmtD7dn8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nxzdhW/ge0fNyF0B7UHiq25fnpDiiF4heOs5RXmjNHMXrwPwJuo0h5+8orRPvpBS7dijURq3zYPa22Qyn8WOmYRvlJNaPDv766vF56mTbQxmLxd04UANf39wKUHVHaQArT+ZAWimpGrG8m9HukoHP+lPKU+1JkSltCnew6uYBzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iv0f2Jkw; arc=fail smtp.client-ip=52.101.52.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iv0f2Jkw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mU9vTklKeUAuEtN99kHcNg6qF39+HfJpejZ4RPkMt36EXNTqwJrGaSsU55YaStBMZJ1oqCkUye7MmBvuC0RlxD4rmJh/lUowDq5HQVQkZAKIjaaxToiegGW00LuqL7ZMC1nxvYgbHZBwzvULpv9NwZSjYj8PQ7rFXhPvlVJpAoBWbX3EtSdlg20P80Kt+P655/VZn1or/kVSVEDQBnb2xrKDRCu5266/zXk2klp1VoKPZVpTQXUReXqUJxe/YjtJKUWQmOwldNpAwR6E1VQVHxy3zFrWQtvud/vIdWUHb43YrhB9uny4OopOkuUvknbAT4RNffdohn+/P2Owp9fCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ekNcszkqIZa6MVbBhrJEoWYAZ1nBX4h2JmwxSXhskM=;
 b=tFR7sQ0NgkefG3evbie3xXjN6285zC+KKNMjopJ5Gvxo+G0yyFxx5h8CIPTAjZodRD4UUZhhq6sweL8ppCuHOVdUJ94mU9az8lyq+W2NdEQxDB7PF3F3tvhIew8L5pLS2szbxfbVpMnTqg01wnaKDVLTS+o4ckS/FtzkLOjHW7jqKfE02Z4eYTAea7ekiXOUqLSiZamU7hf4oY4WwPA8GQsLFfljJsKBXNQCoezWwLX25l1EPszcMN9w4XTmruvtVK29lDn4MWRf7i9u8YWzSy8mLcG96dUypWkRaaoHV7fc3lFQkeLrKGj3is1rkccmU1iOmwb8235es/hUbjFcBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ekNcszkqIZa6MVbBhrJEoWYAZ1nBX4h2JmwxSXhskM=;
 b=iv0f2JkwlNr9Z+NBHGL5txLfP1wF3iC/2bf9XVRrHSYKiVLmUdcyhr16HhkFijMgzt2sx7aRrrRs3ReutKSGsFBFf4If7m7v70hM9B+2yN2v/YxRBsG3PbT/LgYF8KmJJ8/BWJv2GyMGrnCfYfkZflZ7glXr/BeP1r7kkckYQmGVrgJEkBRtuwR30GHiIMvBeCEAUhy0uqmRDYg1lAUzIpNJZ6fA0ZAjGLgFkvU9yTaigolWCWZf0DWUoGKJ6tvxMA2sGmIYuCyNbbPXsIwtAlNalJpB2O7jE1qqIVjq75XQiuW+7i7uzudVQnUJ7PyIAywvcW7tj+bRAdMwLCWXRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB7578.namprd12.prod.outlook.com (2603:10b6:208:43d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sat, 4 Apr
 2026 00:02:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 00:02:56 +0000
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
Subject: [PATCH] Revert "gpu: nova-core: gsp: fix undefined behavior in command queue code"
Date: Fri,  3 Apr 2026 17:02:54 -0700
Message-ID: <20260404000254.284467-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0168.namprd05.prod.outlook.com
 (2603:10b6:a03:339::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB7578:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb5fa23-b895-473e-b98c-08de91dd8697
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	JHPCTw6lWjA2inWLtqMVAGZKCLkmfAB0kMbuHBgxLd85Ad67CGYXV1Ai1oaNzZT99hXPH4j/PBYx8vEbJ5027jmN1Fy9HXfMbKAcDz+P6FJiX6KdlEVjFGNe9Ivdz2pKpugWb3KE58hfOPhe4rSlA9j3YoWECnFoGnK1lLaKiOEuSZ4XGHYqPQZWExLsGYVrrFLVeLXVj9dflZ1SGZ+AcSXaKsS2fnayceXM0XQ9tYue5hlhiFO5NZVTKWd2fTcnU+60+Z6qZi69RzolWhHhwrcmGHNhoEelqib3RvruruK7PH6FCEs/yXXL48txDPgtw/ATVv330YOnQPymmKb+iqpZWsyKtYG5onbtHBdIYtwMhQhQGo41/JGz7hakYiWYUtQMmxLHmLdobuMSjmhxWZQvZFX2U60UyXkjGoiKRmZCJ7p7IR1B5frSwWVyclwcoLXGlnCoRgMqyr2jQYd8kWtQ0blPadv1DS25q/mkkjKm1gy+/1OMooFnP/fr0mm9IJBIXbqRg2mzP9uJh4/Kg9+Wu+WGNv9033s99EC5hJJaw5bSD1PqyLc9csynrUWRr5RpL5hFWsJj7c0RidDHX2pOTDQIvN/KI1XvOghT/Cl0r5onSSwhpl6nQV7dNxmltZFsee+KSaaq+5iva+qpP2vvLejw7UtoB53NYS6l9tCTlWXJOOSeXdRZj4rernq8Hf7eMp5UmCzYgL0uMZn+EITJW+C3wqW2KtRhBTBTuHg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j2noMXpBn9C3nLWa3Xov4KLKLbiIVqz25Jrw61RcmmRd0K96MDt2RIIn0QkM?=
 =?us-ascii?Q?7wLBxwd2Tvl+fKezzAjTMICqZwsS2bdw3aET2IBu1tQgvh4QlEFyRuH+iztR?=
 =?us-ascii?Q?KM8GcrHrsDSTWO+c+BS1dJg7UzBU17aryG6HWoO5nIWPWNTqDJ8J+GK2UYnK?=
 =?us-ascii?Q?+b0j25MWsSyQdSYYYn2PooTeqgVJdZiDtf26nbqV3wPK0hX0HuuZHT/Rz48X?=
 =?us-ascii?Q?evQTEygUli2fJauVJIdaAHa2XmDqi23IrfBvzSmgC5pQetaQbvMMVcJTfzDn?=
 =?us-ascii?Q?Uc6Ll98BT+/Mb7y/wyrH0fnnIMeGRgJYChtoPIPWUJrIOAdg5kPHO11rRh2P?=
 =?us-ascii?Q?+hXAwhAwv3drmNxGg2c9jxPvZfpnI//H6FMvi3MlcZbQGqREZV30DcPi/qst?=
 =?us-ascii?Q?GhmD0Nm5pabsmBGZSZch3XAwGnZMd3+8SZo21PtCY2C0q+pZhcmRAEi38qoX?=
 =?us-ascii?Q?4Ci+XktA/yJ9PB3mWRFXFeotOHGFSpEQRb0ZvXxcnd4HX+hYrvqeqGhA88eP?=
 =?us-ascii?Q?F2EvgCFl4Ik9wHltge/6ppCH4iBVqNRprJWedoq7ymU9RCkttZwULI444L/H?=
 =?us-ascii?Q?V+491Rk3lo6WcDi5Gv5+nIWoK8ZOia5roO1l+Gey6nUia62uTYAM0mTa472p?=
 =?us-ascii?Q?vrqyHHAza/EmW4m3vxD3lZobMKOFUL0BqBoUx1AzD2+IYCE/Ny/LtVBXPqtp?=
 =?us-ascii?Q?Z0MPuRxrPWZiLrVbkZ/cOzMuWVhH7Z3s6xoDmXhIv7HcFc7o6zB1jZ5WdZTq?=
 =?us-ascii?Q?jqwvvpeWphDlxxjDlMS/UAi/HL9QUOvamlKtDCN9A5mdMClXKfPUz48uwXfC?=
 =?us-ascii?Q?PVm0B4Beql559+XdX9eeLXKjQLwks1S800h3pqWSVb18wlz6Egq2+yhVhrtt?=
 =?us-ascii?Q?SVDo/tlUUXcS8oKzwQOqBD4YLuvPnczjbSxXRgv3vwsDBnYfwX1rufXkGhqL?=
 =?us-ascii?Q?X/u7f3/dkuezcDZXM3McjMLWhuyRrQrwFmWqcNmJGvhZxnW+2UPzMMiO2MRm?=
 =?us-ascii?Q?/zdDtRf7IrZSn4v9jDIu+Z7aAeltDU37aP8yqFZCNiWJippFPOyUvvmr7aHX?=
 =?us-ascii?Q?5QUuTGNMU8FRF/ZW6BUTuwhnMpX7T5SHVh7fa5fsNm2AT72s87SQv/wLynlV?=
 =?us-ascii?Q?aRtl5XmJvp7WxaTz2UObUGSsOmKMpIyZxJc33onuBd/iWXRXtI+TDhX3XOcj?=
 =?us-ascii?Q?6n6V7zB96Off4ZCg/+pH98RLKhop48KoRU94G44rIG3LqVdsLsI80knmwMB9?=
 =?us-ascii?Q?6r630DAhZ7hguU+ixpaqft2iJiHrppd4nvD12qYg7yn/QoNiXw2oAlmGlcYd?=
 =?us-ascii?Q?fHxU23gO6SGWnariiOX3M591Hjm+2LNCCC6QgbySo2jeKCcI+ziWBRA0gHNs?=
 =?us-ascii?Q?S864nutbEnqH3Rlb9bxhk6xktNDdnGPAnWxWHpyC1l81SztbXNckbwgotvvP?=
 =?us-ascii?Q?pXpQUx8EouKQ4MlH43ggMW3wkAJaoAi90t36OYLfHTSXbZsCAo7Fm5A3SJFZ?=
 =?us-ascii?Q?sYR/+RIJuT2BLmTxuNVxnN52CKxXcEd7CMIBoAk8XltG0HII8/YBCMaC6XJq?=
 =?us-ascii?Q?qbTLnWI52Cu58/BA0kEAS2lUD4A7CbA1rD/1yemnDaq6zd7WFbMGhAytOuNj?=
 =?us-ascii?Q?sHACm+ZgT+GM9jGLFx/dsq6nRfiPDIUU3oFisHGbLMzXJ2+24HoEQ8aDRNow?=
 =?us-ascii?Q?8ajle9pLf0WYyl3mLOGJ3UAgRpzWr/KkD7p69MLLt/XKIE5Rv+t+uGyDqewV?=
 =?us-ascii?Q?Q+kUh9T6Wg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb5fa23-b895-473e-b98c-08de91dd8697
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 00:02:56.6270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SHoAzK+fe/PYnAnZkuMZuEm35KUAnBY2bR9NPndUtMuy4xHLa6KjQri1O6cGfsslw66mUMJI0+kdwjn4E87nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7578

This reverts commit e3dcfad7a3c485456146587f80498348efd4f3de.

The commit uses ptr::project!() infallible range indexing on runtime
values read from DMA-coherent memory. When the compiler cannot prove
the indices are in-bounds, the build_error!() fallback survives
optimization and the rust_build_error symbol remains in the object.
For module builds this causes a modpost failure:

  ERROR: modpost: "rust_build_error" [drivers/gpu/nova-core/nova_core.ko] undefined!

The preceding commit 8815e8427a82 ("gpu: nova-core: gsp: inline methods
providing queue range invariants") adds #[inline(always)] to the pointer
accessors so the optimizer can see the range invariants and eliminate
the build_error!() path. This works on LLVM 21 (rustc 1.93.0) but not on
LLVM 18 (rustc 1.78.0), nor on LLVM 19 (rustc 1.85.0).

The kernel minimum is rustc 1.78.0.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 114 +++++++++++++-----------------
 1 file changed, 49 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 485d0c0f2a4b..72e9b79619eb 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -17,7 +17,6 @@
     },
     new_mutex,
     prelude::*,
-    ptr,
     sync::{
         aref::ARef,
         Mutex, //
@@ -256,52 +255,38 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
     /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
     /// that case the second slice will have a non-zero length.
     fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
-        let tx = num::u32_as_usize(self.cpu_write_ptr());
-        let rx = num::u32_as_usize(self.gsp_read_ptr());
-
-        // Command queue data.
-        let data = ptr::project!(mut self.0.as_mut_ptr(), .cpuq.msgq.data);
-
-        let (tail_slice, wrap_slice) = if rx == 0 {
-            // The write area is non-wrapping, and stops at the second-to-last entry of the command
-            // queue (to leave the last one empty).
-            (
-                ptr::project!(mut data, [tx..num::u32_as_usize(MSGQ_NUM_PAGES) - 1]),
-                ptr::project!(mut data, [..0]),
-            )
-        } else {
-            // Leave an empty slot before `rx`.
-            let end = rx - 1;
-
-            if rx <= tx {
-                // The write area wraps and continues until `end`.
-                (
-                    ptr::project!(mut data, [tx..]),
-                    ptr::project!(mut data, [..end]),
-                )
-            } else {
-                // The write area doesn't wrap and stops at `end`.
-                (
-                    ptr::project!(mut data, [tx..end]),
-                    ptr::project!(mut data, [..0]),
-                )
-            }
-        };
+        let tx = self.cpu_write_ptr() as usize;
+        let rx = self.gsp_read_ptr() as usize;
 
         // SAFETY:
-        // - Since `data` was created from a valid pointer, both `tail_slice` and `wrap_slice` are
-        //   pointers to valid arrays.
-        // - The area starting at `tx` and ending at `rx - 2` modulo `MSGQ_NUM_PAGES`,
-        //   inclusive, belongs to the driver for writing and is not accessed concurrently by
-        //   the GSP.
-        // - The caller holds a reference to `self` for as long as the returned slices are live,
-        //   meaning the CPU write pointer cannot be advanced and thus that the returned area
-        //   remains exclusive to the CPU for the duration of the slices.
-        // - `tail_slice` and `wrap_slice` point to non-overlapping sub-ranges of `data` in all
-        //   branches (in the `rx <= tx` case, `wrap_slice` ends at `rx - 1` which is strictly less
-        //   than `tx` where `tail_slice` starts; in the other cases `wrap_slice` is empty), so
-        //   creating two `&mut` references from them does not violate aliasing rules.
-        (unsafe { &mut *tail_slice }, unsafe { &mut *wrap_slice })
+        // - We will only access the driver-owned part of the shared memory.
+        // - Per the safety statement of the function, no concurrent access will be performed.
+        let gsp_mem = unsafe { &mut *self.0.as_mut() };
+        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ_NUM_PAGES`.
+        let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
+
+        // The area starting at `tx` and ending at `rx - 2` modulo MSGQ_NUM_PAGES, inclusive,
+        // belongs to the driver for writing.
+
+        if rx == 0 {
+            // Since `rx` is zero, leave an empty slot at end of the buffer.
+            let last = after_tx.len() - 1;
+            (&mut after_tx[..last], &mut [])
+        } else if rx <= tx {
+            // The area is discontiguous and we leave an empty slot before `rx`.
+            // PANIC:
+            // - The index `rx - 1` is non-negative because `rx != 0` in this branch.
+            // - The index does not exceed `before_tx.len()` (which equals `tx`) because
+            //   `rx <= tx` in this branch.
+            (after_tx, &mut before_tx[..(rx - 1)])
+        } else {
+            // The area is contiguous and we leave an empty slot before `rx`.
+            // PANIC:
+            // - The index `rx - tx - 1` is non-negative because `rx > tx` in this branch.
+            // - The index does not exceed `after_tx.len()` (which is `MSGQ_NUM_PAGES - tx`)
+            //   because `rx < MSGQ_NUM_PAGES` by the `gsp_read_ptr` invariant.
+            (&mut after_tx[..(rx - tx - 1)], &mut [])
+        }
     }
 
     /// Returns the size of the region of the CPU message queue that the driver is currently allowed
@@ -323,28 +308,27 @@ fn driver_write_area_size(&self) -> usize {
     /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
     /// that case the second slice will have a non-zero length.
     fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
-        let tx = num::u32_as_usize(self.gsp_write_ptr());
-        let rx = num::u32_as_usize(self.cpu_read_ptr());
-
-        // Message queue data.
-        let data = ptr::project!(self.0.as_ptr(), .gspq.msgq.data);
-
-        let (tail_slice, wrap_slice) = if rx <= tx {
-            (ptr::project!(data, [rx..tx]), ptr::project!(data, [..0]))
-        } else {
-            (ptr::project!(data, [rx..]), ptr::project!(data, [..tx]))
-        };
+        let tx = self.gsp_write_ptr() as usize;
+        let rx = self.cpu_read_ptr() as usize;
 
         // SAFETY:
-        // - Since `data` was created from a valid pointer, both `tail_slice` and `wrap_slice` are
-        //   pointers to valid arrays.
-        // - The area starting at `rx` and ending at `tx - 1` modulo `MSGQ_NUM_PAGES`,
-        //   inclusive, belongs to the driver for reading and is not accessed concurrently by
-        //   the GSP.
-        // - The caller holds a reference to `self` for as long as the returned slices are live,
-        //   meaning the CPU read pointer cannot be advanced and thus that the returned area
-        //   remains exclusive to the CPU for the duration of the slices.
-        (unsafe { &*tail_slice }, unsafe { &*wrap_slice })
+        // - We will only access the driver-owned part of the shared memory.
+        // - Per the safety statement of the function, no concurrent access will be performed.
+        let gsp_mem = unsafe { &*self.0.as_ptr() };
+        let data = &gsp_mem.gspq.msgq.data;
+
+        // The area starting at `rx` and ending at `tx - 1` modulo MSGQ_NUM_PAGES, inclusive,
+        // belongs to the driver for reading.
+        // PANIC:
+        // - per the invariant of `cpu_read_ptr`, `rx < MSGQ_NUM_PAGES`
+        // - per the invariant of `gsp_write_ptr`, `tx < MSGQ_NUM_PAGES`
+        if rx <= tx {
+            // The area is contiguous.
+            (&data[rx..tx], &[])
+        } else {
+            // The area is discontiguous.
+            (&data[rx..], &data[..tx])
+        }
     }
 
     /// Allocates a region on the command queue that is large enough to send a command of `size`

base-commit: 1db742b7ac4dd3fdb7dd62d1e1e6d0faf57f1173
-- 
2.53.0

