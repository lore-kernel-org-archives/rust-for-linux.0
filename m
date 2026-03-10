Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11D832E138;
	Tue, 10 Mar 2026 02:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108697; cv=fail; b=QRGi47nhEnYj+a/z9AaXTPgVs9Ve6cCbiw7URArhiu6WEJ1ktLeRZKLCQA6kq/EhSn+iuJu33DpUHzBmb3JeXWWGsRt5uqKEhJMmrittrYURgIiEvnWJSVY9hPLwJpX9wmEKN9Rg2xUtvUWxNUNp+RhD3XGnuEPHXCtLz3k/g8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108697; c=relaxed/simple;
	bh=tnigXvJ3W0jVSpQhXYF6gIi6qp0sxGb2r51RLLHMN+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hwC+rPv4zE/dKXNHIsFQVWh3zRxCiVDb3j1Vd3hzwnzjAJXPBgYuAIKff/ia2BxRXQdfYm6HVehr35hUF2G/y27ZRcP3CPLn3uaptO7q0I0SEP6LkwEg7n7k20PLJOcnAcCdTlIUSXnHIQmkQYt5OzzneHG70JY9Z9JAIBPgP1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pM9DBvsD; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pM9DBvsD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+SuuSdgrw/8E8GMcMz/ti6qXSA+V6VTnm/EgoI9ESjuruGAR9D4aC41pjxdW3JuOqvIYQG1i9OCtIEKRAYgAG6MBtTUyuI9ILcYj5w0hwIZcQTsBtgXmWQ8eCq8lsbwv6aMLOG1/HOtXaItkxPhAg+S7VoJbZp+IsCpAE/uOklWEFxwie14cWaBgw38JvliOXGTHkg1lkt/us8h+EeIYm0GNGtXGvS0aBjSEldpxLDbRtPZmzjr1C1JUaxJLLlhX6UELmska4XDZ5FIhZUMELTNsObxeUJb1iEy/v3eZ3FbhCnrzIm9caBw3ipzF1RzqEnXL91g4umhQ9S+lm/b2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUjpL7dC4xWvaMrYxH/J/ntiDRfa+EsuMKx0QjPBfZc=;
 b=Wo0m3icsQjYxtmPFb9jWZ3/0zYFPr7o1yGWxyaaUTc9pLz6ab+R0b/PpcE1kGjvwBSyf6U9/uFJXEr0tJxn/4JOvJ9TfVqhGlFy6rc8lOxTmiGHpvvwIV6ne9XNV90wKOJ+E4DIEcgBhvU4N8aKRXWVoSfyxxNEbhrXOjwO3EL/VK21DomFf9GKAR7+WIx6daWVAdiwo0clpueZJf8hSod/XEP0uBX/fCzHn7y2sQMrfVMUjvX19CM2rL5a5wnHMjtqgH4feNMq7esaJkU8PNopg5Sxk6EW6XouAy0bocxwshIKaFgr9/i79qhnZ1t85RF0iXgpupFT1qhXrPw8tCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUjpL7dC4xWvaMrYxH/J/ntiDRfa+EsuMKx0QjPBfZc=;
 b=pM9DBvsD0BMbh7OaRuvd5Va/o6vdedKRLkjXaSaSPTFtRaYhlzeeNqRhAYEylPV8rTqan1Vs0pf1l09O29K+5Bbu5YsJrBwxBh2M5cX/2DjYifDx87dOefsMxCL7Tb7bAskHZgx1eMVUU5Ct90C8w1XsKLwNuQ+9Z+cWdyWqIkpCWwUHo56nEzyX6BtNcMoGjCny9aQb5Z3dQ0LaIM7nNySnkLwxWe3Q/0m5Y5maStcFwjt5BKUlzICn6dm5uJ+wg3jTtUe/I+mdtJJqjaooViK79MLWNGZmnwn2Eq1cGfNbrTVnB28H8xoU8MfnkcB7biIIjYzcJgcPFkvFqKoTCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:29 +0000
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
Subject: [PATCH v6 01/34] gpu: nova-core: print FB sizes, along with ranges
Date: Mon,  9 Mar 2026 19:10:51 -0700
Message-ID: <20260310021125.117855-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f55634-924f-4778-bb82-08de7e4a5766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	5UjDFzcxzHE+5FcnMzhC9rQVWjoRbwQovACeJbZQmSLXvhm8tHr16NVk9NXyZPlbeHRcMy3TPhfl4y938T89mWWf7tlJO789ouPeOLRaF6gwM3AUtkJXALV4HT6OJN0I62+jL3AEsDnUSS/P3Gma1xSi+/aDNagib7i7p9cfFrCz9dnKE2llORc0QxYlxfWTtR2ivdSbynMdQAVlrGwuOY9DvqTSMWGVRfMzBFLp0mTnZbgI3cc8qUGn/lqTjrDisleAEyc2fEuTUOCJb8WYUsJo3lf3E5CMRWod3X/lHslL6TRwH6HIQwohxTrMErXQuDL07JufgAxJLOMhkCaJxivPj86kpsdcYjr/0BQuCFjrrGd/ZMxLyGlTY1YtY8ox4X62lwvhlL5VCM6DR3zja65SCYG2jSF7hlf2WRU3HO8rz1WYn+HIQXYWpWb2pz4pcGD3tiUcAVGuQ7llhelShTo7l+wEUoT0Bq43QxWGB70df/cZ/xynuYFhEsnhEtjKjMF9nSmUsjP6TZ6lj/n7wof41pxTidg3VPWZXiKLsZbrdwqzpAK61G94njPKbANu++DTSY95fjgCWnoZfLfH/0ovChs8SHan4swZFOOagAavtTxDJqVzgcDihbkj63/seR3boGB9WgFjt0nm+CSu99D8KCZ7Aamywzh0tCO/CtJytuhdkZ+aHHtINKfDn1V/g4eT7PiQfZDmsRjJblN3r3sQkQDVeyy7i0bTHHyvXDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HFKRsoigTgJWEGSCWMZ8PQBbHq37+Flp/Z2WMKhKnH5XwwKCFTzSMrl6JdD6?=
 =?us-ascii?Q?ZXb/MxFiS7SH4EFZUoT6hmPQ1HicDn8lvKooRH6zNIYZeCSo+993e0YfGz3+?=
 =?us-ascii?Q?zr3Abd1mQUjjloqLDkmyeSe0xD4sGl4ClRG5GsoGpGY1JkbmNdtnK8BaRzjQ?=
 =?us-ascii?Q?tyRdP42iS1Qv+5gecqofd6cLZEEJK8CBXv+gxfWysRxnIZ/gkOg7q1SQCsQj?=
 =?us-ascii?Q?AjQXBCQiQz6HT08ij7goxhI880jvGOD+XAjpFQiqK6s6LIAJQxK/vAtyh/DI?=
 =?us-ascii?Q?KWxg+4n2r3HzzZ9ns2o1oCKobXJO3LMgMPfRBXRC0JYveBujBsZxjNsgezaZ?=
 =?us-ascii?Q?LeStoUdaMYYA3QWoRiBon005TtEYinZj8t5UNpzTX5pArVvgr3ECObbU42jE?=
 =?us-ascii?Q?0AFTKCTHG9id1l8bNGgTYeoaToWRQldNA5NBDFznIF3lEuUlPPsJQ4GxeOsl?=
 =?us-ascii?Q?nSYEjBedblBeQjqvsYXW8NU3jutABD78rRUbMgiVGl+v0aPSwi+d1HxHOQxS?=
 =?us-ascii?Q?kD9R6QC1YNvhYGujL/igPtKR2vewvIi0zDEGe+9mYky0W7fiWfPMBLu9CdE0?=
 =?us-ascii?Q?00XqJwL8XqN1l0jwQ9FnUg/mkiURwHpjb2DSPBk/tgSUocDT+HnOvtnKXb+m?=
 =?us-ascii?Q?fEOj+Z2L67ok0QmHdzKfIKPZ7P3HSBEWqVwhLQ6pPod7jQdj+t1geAlU+klJ?=
 =?us-ascii?Q?5Ajyyy9392qYvEhqHIRzKo6XmD0RbrDhte6/iilK+wqqTjI4KhGyAcNXiaYs?=
 =?us-ascii?Q?r1X2kGYHGMiR3DjoSyYKqkocdqt7jzs2ReXeJXvEn9RPZS6IJzkrJwQKf2Si?=
 =?us-ascii?Q?Ky6o/SHMZ59DW1uA8WFd48See1vCkwmSiPLkl44+k+tzi74HB9oOkecda+8J?=
 =?us-ascii?Q?DzgpDbSEZyhl3epLAhF6rMXgCJozgOcccNsB1Ky6g5evYSTsrx14Y4R1IlSu?=
 =?us-ascii?Q?vAnesGJ1FhlAdhlBTClpkZqsTkHNj40A/kurAHSJVgz/0hYgtD7izRfiuwY+?=
 =?us-ascii?Q?d8r8sG4dFMcZS5zNDBsS162JnfxJKBLHNW0Dk5G0L3Zj1vY0kX3yabZH7Vod?=
 =?us-ascii?Q?fl4zxKAT9DaIbrY3SNHGCQUfpLu4MZRvipuwYFdwEGPhUNUKQO92tLRAIXny?=
 =?us-ascii?Q?fo/ZhGfirW5b3YrXfOglQn+D1grNJV6MtJdFTsCWbxmfNrsCEH7cDF7ffAu9?=
 =?us-ascii?Q?uTrOSb34bmR5g9OOT1494ipHKRXw0aN3Tg8ysThuYOo6UgyeRjh1GSTTjz1w?=
 =?us-ascii?Q?VFp5SWJ8V92qZr4FuVBifPmpgwiBskzunnzdoDRVWzXSDePu57r1JkU+WD6p?=
 =?us-ascii?Q?UV6brc+wdcrgZqJmzKW/YFStIC8Ky5jfdDR2tvJmRpPWsleNmnOXMaJ/0R2x?=
 =?us-ascii?Q?/ii9fMWDHPlVn9OW2eJfcsJsVQ6/mPzYne8zpt8Uox4GaRtykdpeB2BVMTKJ?=
 =?us-ascii?Q?vAj3vd+HAKJGFaEMcSyF20E15Yj1UAEzUV//eDSl3mbquu1SzMHNyACQf3fk?=
 =?us-ascii?Q?FVcDZ3l+Nj/fDB9U7HhuE+E98Dv8hK0DE6vNHuQFd7eJsBWUPIBnA7zEW/9n?=
 =?us-ascii?Q?y9sDk6F8yAuBdbkABSpQBPKMXPLPlP9USXwuA+ZDBRYETrE0AsXiZuIM9Prd?=
 =?us-ascii?Q?xktaEadv/nsOTReiPTJDI+9X2/dOTAGDy1IL7Rx9iqPqSvOOAXZ5LMq3nYkJ?=
 =?us-ascii?Q?ja4wUt/vMVI7IvDBQao+kYuc1bqRD4tH6+xrP+3PuNS4RWfyDYZCYdmiadkd?=
 =?us-ascii?Q?s9PNL0cDeA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f55634-924f-4778-bb82-08de7e4a5766
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:29.4475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlkAh2oolh2GFIro2dTTthZZMTr31OFaDRWBy6cpQgevH4GESbpCfTokVgYwaJq/bihWcSVdS6HysJDhObf3wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

For convenience of the reader: now you can directly see the sizes of
each range. It is surprising just how much this helps.

Sample output (using an Ampere GA104):

NovaCore 0000:e1:00.0: FbLayout {
    fb: 0x0..0x3ff800000 (16376 MiB),
    vga_workspace: 0x3ff700000..0x3ff800000 (1 MiB),
    frts: 0x3ff600000..0x3ff700000 (1 MiB),
    boot: 0x3ff5fa000..0x3ff600000 (24 KiB),
    elf: 0x3fb960000..0x3ff5f9000 (60 MiB),
    wpr2_heap: 0x3f3900000..0x3fb900000 (128 MiB),
    wpr2: 0x3f3800000..0x3ff700000 (191 MiB),
    heap: 0x3f3700000..0x3f3800000 (1 MiB),
    vf_partition_count: 0x0,
}

Cc: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs | 83 +++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index c62abcaed547..6fb804c118c6 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -1,9 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::ops::Range;
+use core::ops::{
+    Deref,
+    Range, //
+};
 
 use kernel::{
     device,
+    fmt,
     prelude::*,
     ptr::{
         Alignable,
@@ -94,26 +98,71 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+pub(crate) struct FbRange(Range<u64>);
+
+impl From<Range<u64>> for FbRange {
+    fn from(range: Range<u64>) -> Self {
+        Self(range)
+    }
+}
+
+impl Deref for FbRange {
+    type Target = Range<u64>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl fmt::Debug for FbRange {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // Use alternate format ({:#?}) to include size, compact format ({:?}) for just the range.
+        if f.alternate() {
+            let size = self.0.end - self.0.start;
+
+            if size < usize_as_u64(SZ_1M) {
+                let size_kib = size / usize_as_u64(SZ_1K);
+                f.write_fmt(fmt!(
+                    "{:#x}..{:#x} ({} KiB)",
+                    self.0.start,
+                    self.0.end,
+                    size_kib
+                ))
+            } else {
+                let size_mib = size / usize_as_u64(SZ_1M);
+                f.write_fmt(fmt!(
+                    "{:#x}..{:#x} ({} MiB)",
+                    self.0.start,
+                    self.0.end,
+                    size_mib
+                ))
+            }
+        } else {
+            f.write_fmt(fmt!("{:#x}..{:#x}", self.0.start, self.0.end))
+        }
+    }
+}
+
 /// Layout of the GPU framebuffer memory.
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
-    pub(crate) fb: Range<u64>,
+    pub(crate) fb: FbRange,
     /// VGA workspace, small area of reserved memory at the end of the framebuffer.
-    pub(crate) vga_workspace: Range<u64>,
+    pub(crate) vga_workspace: FbRange,
     /// FRTS range.
-    pub(crate) frts: Range<u64>,
+    pub(crate) frts: FbRange,
     /// Memory area containing the GSP bootloader image.
-    pub(crate) boot: Range<u64>,
+    pub(crate) boot: FbRange,
     /// Memory area containing the GSP firmware image.
-    pub(crate) elf: Range<u64>,
+    pub(crate) elf: FbRange,
     /// WPR2 heap.
-    pub(crate) wpr2_heap: Range<u64>,
+    pub(crate) wpr2_heap: FbRange,
     /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
-    pub(crate) wpr2: Range<u64>,
-    pub(crate) heap: Range<u64>,
+    pub(crate) wpr2: FbRange,
+    pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
 }
 
@@ -125,7 +174,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         let fb = {
             let fb_size = hal.vidmem_size(bar);
 
-            0..fb_size
+            FbRange(0..fb_size)
         };
 
         let vga_workspace = {
@@ -152,7 +201,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 }
             };
 
-            vga_base..fb.end
+            FbRange(vga_base..fb.end)
         };
 
         let frts = {
@@ -160,7 +209,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
-            frts_base..frts_base + FRTS_SIZE
+            FbRange(frts_base..frts_base + FRTS_SIZE)
         };
 
         let boot = {
@@ -168,7 +217,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let bootloader_size = u64::from_safe_cast(gsp_fw.bootloader.ucode.size());
             let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
 
-            bootloader_base..bootloader_base + bootloader_size
+            FbRange(bootloader_base..bootloader_base + bootloader_size)
         };
 
         let elf = {
@@ -176,7 +225,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let elf_size = u64::from_safe_cast(gsp_fw.size);
             let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
 
-            elf_addr..elf_addr + elf_size
+            FbRange(elf_addr..elf_addr + elf_size)
         };
 
         let wpr2_heap = {
@@ -185,7 +234,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
 
-            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+            FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
         };
 
         let wpr2 = {
@@ -193,13 +242,13 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let wpr2_addr = (wpr2_heap.start - u64::from_safe_cast(size_of::<gsp::GspFwWprMeta>()))
                 .align_down(WPR2_DOWN_ALIGN);
 
-            wpr2_addr..frts.end
+            FbRange(wpr2_addr..frts.end)
         };
 
         let heap = {
             const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
 
-            wpr2.start - HEAP_SIZE..wpr2.start
+            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
 
         Ok(Self {
-- 
2.53.0

