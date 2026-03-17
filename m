Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F3134104E;
	Tue, 17 Mar 2026 22:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788057; cv=fail; b=fZ78bVfk5O1lRw4+l5BE4XBiMoEP9MtR+hNfTRBS8/0HVV5UnFkCt8t0Y724MWM1mANnhU/Q5aRCiK4zi9U0VbhAGVOM1jgnLj9Kwf4fiMuqJcEpkvEhfwiVVXgXJ6U4l6Zk7D0zViaBO32n7+0oFRqiPKoKbRWZT7Of9aKuYis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788057; c=relaxed/simple;
	bh=6UjxlWXvdqSI2p8zfrzCkCu/jhNLO8kW3eu+vLIb7aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MwCKj+iKuows3V2QniqOxApUQjfP/fUZxWk+pOJFo6bcgoN+jN4jFj43TZkZrKGGBxtbMF7HgE/UqZZ0ex84KuRR67Huq55YWIzWnJSz9kptEKK01cA9BIXeEPMe1dEL0EZnwhfF/8Je84xdJadjoKpPDYDP52+cc0faWWj54L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dsd2x2Q/; arc=fail smtp.client-ip=52.101.43.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dsd2x2Q/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxbtPnzYdXVKwrmButi8l+NcXUgWr8LlXEJOWdKpPjq7Rasg3aOjnFwTgIda7ljFUdZ9AuE/3g4QhWraXyP/5X8PPr43BUMfrF15CJGqYNQWvUevzKDVDbU1tzdy1gFr+AGQknbABmZxHBPqpiXLfiymlDmCGFvCtN9b4OpG9k7La4q+IfyC0gwMx4+uiDkbI2kzvird4EUvb4/b7yUk5IwF56ty59OTnXbwAXyurr1az6uP5/4MIY92xpxIFpqrI6lMTpKjYHSb5ygk4oQnPDeeRcn3TLwWPofklZLICFtnxSpEUffLkcFEtM3YCaNtefJbHeXJLMvKi5HCXKRU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDC7V6N1u8Qd29esawTAkeYfOLonaVAiX1RjPOs4S7E=;
 b=DymGpk6vNlHZtwrXH+msAE5jLJ+ai9Iq5w6VnQc+xahjyGZM3DepxK8pr0v+WgRZk745XZR6Mx6Zbp5dMS3HuKd/vjHl/np8tydUBk1GNhh/uiR262cY+9SZsTdZPsmxL5E0PmHUxWM4W2x2olSnHPT3fRTlZRTgzpldPMplEICJ8v3YUScxvGJjDKBggt2ATfvUt//YVA8NLOwEvIaMH6o6NbGPtYKIHYhBLgDY5UnbvG90q9kzr0nPLvPQkiczS3wo07cS50vhGOPObFXcPpJo0XJSiLba7TggGOa+nf1qcb0aglWRpSzpurc+8o3T1CFDFJXVoJ3WuPGZUdGfYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDC7V6N1u8Qd29esawTAkeYfOLonaVAiX1RjPOs4S7E=;
 b=dsd2x2Q/x3mFExJUvQN40+67BSqA5BEjYfCrsUMNIXMfZ4Tpl53KBPxtLpnvpNgdywmPLwcmbdtuXGECjU39Xuy0hw0rzvfjuKOrRPKsa8pRNrhrA+12jDsC7jZZJvLZ3SnP7hCgs3ZoPKSru/uGghDkDk1Qxhw3BVjaA5mZgrI1OzRNkDOsADIjbC/ixkJQmKoRK1lVyzsNPfgi2Pe/ycTufpabGrjExhh1JSeTFmb8W3RNHqipjvXnT1zMNPEIxCk5HM2s7MCDbKnRzW/R5qEzEk6rhC2aulQuALPS7GN3YlW5+3x2Mo/A1jwiOSFj3KRQDG2JXAsJOAkYXWXolQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:03 +0000
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
Subject: [PATCH v7 04/31] gpu: nova-core: move GPU init into Gpu::new()
Date: Tue, 17 Mar 2026 15:53:28 -0700
Message-ID: <20260317225355.549853-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 2323fb4d-2a8d-480a-ba0c-08de84781643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|7053199007|56012099003;
X-Microsoft-Antispam-Message-Info:
	z0wVUuL8CE1QBVOATX6NTfgGVbszQWJA7zXxd9wUEKaSqDPucRH0RxfE/0ugdBJjzteDvziGUu2ds7ZPlae2Y24D7V557KsFGgKUgKywf81LVI9g0wI3CY+DPggkBYvorNjkyRrCd1azsR/Xsbj0TDhcgaYJsZFnfGm6PIurtC136Du0cUH5qLbwpM1ZwjdHHate3ZVesvV9vMwowoqXNm/F1vHdx/zMM0iLHMSflUAy/tpIToHnOe7lEkGHobkNSof5krOu+r/q+Gja+WEx5H2/MzWWGCxZ6uJ/BKZBVW1b1qlfxyn1WbhzdNVPRwc5Wu7tZvqVgI9mselP80womnfcU/vRYTQyrDw4Nc3WTAhqbNpiEEUc0UTi5yn+9NbzRJVXa2AYcSQLiztLksYyrEZRdSYYBzjtwOhjgt4GpLa2xJivwutI6fMmGMMUSF7/EEyWQris6w8s//IpoHdzCBwRtO+i1tvhBmMk+VlP7fwms9pNAOVJJFPPGxA3e5kqmcszeCwTugM95fR9KbsheVPRHCW+G6FAHyQ/LzRRO18IP4lDdw9jOKEPwz2Yxn7l56ThnASqC/XtUycRk+tKL/APdmRgfXxn8UXE78QE6qSGbbSIhl7P0X1VQZzngzpgEx4SoPLD9NzfFLoZCiAATnSRNhtuEpR//He6vvjnU+/fZJ0FJJ/e759+AtM6upeUvTHrrVzcxDzZ/ey3D2c8nhFtvCrz2WDkNXeP6N1NFA0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(7053199007)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T1yBbK4D3lkU0vYXRkXMTi2sBT6IVkNOUmVNO8IkpGfYlHApD7cX/zCOhBwW?=
 =?us-ascii?Q?EFc+n1GXmF7T5II41wKDnx9reblbqUN8K9eaQlVgb+y8gKBTNYbsXFR1CpOH?=
 =?us-ascii?Q?x8Z3VIFEqXbJrB0Jd8d3nD0wQgTGO1xDk47NUMqn5LJI+2ZDDir+0FOMNZ3Y?=
 =?us-ascii?Q?tnvypICyRmvvj0DyHiTNqsQFFd1N+ZlbUrwoRwOHvI8UhWJweFn0pnj7Vf8l?=
 =?us-ascii?Q?KgyD/AZJTOvrX+ofBcoYIKn/7e8fZioRPA02ndbSW+HStOQq86WL8HXW2X+U?=
 =?us-ascii?Q?CxVKEh1+gQele5JDTU+Mkbjw4Fnjsjqgr9Qe1s6c5cGn9ooZef3wTop8eu+x?=
 =?us-ascii?Q?+6KXxZAkzIJ1n97PmyQRe7LliCRT/DmZUqb5dC0NNioTdaNrKMbh50kcOTLl?=
 =?us-ascii?Q?N1RWpUcr36kfyUD6WgqjBXmjXekm3w920NhmRZ5ToMUbXQBr0aTzjM4y5vk4?=
 =?us-ascii?Q?l1Rl3/CR5VtJiN/y8ooAcCUDEAWJ1OuYU8JUaCXyfGAmpqIOerr2WliMQ9nd?=
 =?us-ascii?Q?NAgSR2XQZedgTgF96B4wYTGiKVSqlrAA5X215sO8VYE23xLj5GT6uQ3BZxaw?=
 =?us-ascii?Q?R99FTcYLfNa/EEBGpc1Z/Q3hjf7LZZ8s6HXKfkS9pKsP7j1fMnhNZ2/cZ/tc?=
 =?us-ascii?Q?DsBZ14do43MZqvJkcl2asH36lzVwDUJ65pnDUFaCIRaP14kiODTIvZc+EiIA?=
 =?us-ascii?Q?LAhzYRY8qNzvidZPjp4AgSF4d8BjffVQEeyKy7AoCZW3LFj5PWTn2jW2FuB3?=
 =?us-ascii?Q?EdQvBS2Jd5xSJd7oERwatn22Q+evkEQKlSkC65v9IDz5jTrU+t4qyKE+bqTF?=
 =?us-ascii?Q?uXjoHUlLEGCp6Np7M8ZHzbEMEYysPWWbuYuTqSydHQ8pgvb1HmeqRoJj7P6m?=
 =?us-ascii?Q?OrfhUBiieoaosplBdYb0iSdXemxZaObCMeYROie20yTJ2T+43PGbDnjnNEFs?=
 =?us-ascii?Q?JR7iDP2ilgql+iMamY+xE8U+JFgG1Jf/MO8gh33rU9soe36n+20WSyp+0ucR?=
 =?us-ascii?Q?aZSD50tCz75pui4DxVsTJdLLAISFkSQrR9moNDWprJB/q7XjHejxgW1HymDF?=
 =?us-ascii?Q?1tPGuaw95f/M+BucZ2TP/AXrMiEmiDz3twlcYuqbpGMD+gsaGRFwe0ePYWya?=
 =?us-ascii?Q?WwCOKR3mpQGkqUuNROcrjIqUCQYnNF5opcrWQYWmGLMqCRRzVfUxcQp+CvKa?=
 =?us-ascii?Q?T83X2zEmQT122P7IVfpcJsbOoL2KSuzCQeM5lDOunyZBa7Lu1DsjWkxnWy0z?=
 =?us-ascii?Q?5raMQwcQfcLPtiqk11/dK0oHMw70dc9KN1v0vJjSpiFtlFxTZ9XcgOVPdQTN?=
 =?us-ascii?Q?9kWBuECelzr5VkvN9obgbewOcRqzzphB6q1ObrIOxoxcrGQXC4VTW3SIxrib?=
 =?us-ascii?Q?kbm+05i5RrD3w7inRA4C3SqdclSXDznlUT0CRKqooykRGi3QDbk58PLTbquV?=
 =?us-ascii?Q?9IT07/BAguWyb2CqelNpiKfsJABWZ1iVguOn/9TzFrLoNTXCLjZ5JxBTGn1d?=
 =?us-ascii?Q?q91CNkioDJwtHMtn9o051FvaQQTODZ4s2bo6ZrJDwrgMW3NoOPvgF87l7jkM?=
 =?us-ascii?Q?LfLm4c+bg57f8bnp1i40K46CIKw9KrbSvqCrEpVslReH4RoXMf3Dz1Hpdiv7?=
 =?us-ascii?Q?pu3A4UnmxOBLv16i8qzt1D6IAzvrziAL+lL+WhpzoUFzdhanMVSBdQCMaZzN?=
 =?us-ascii?Q?0UOtCoNVHV++IVyEatpMuC2WacbL7Qwr3GZWShjVGdd/CLJzlHqxGYdWWfdu?=
 =?us-ascii?Q?5TgbnTCYHA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2323fb4d-2a8d-480a-ba0c-08de84781643
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:03.8938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FVmdO04AbYCZm6t+ZAINLe22nHLT4lAHzcrc8j7Juh6MF1QfOOVr7dyff+etTuxpVjqze/QvRGyJbkLXMSZdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Move Spec creation and the dev_info log from the driver's probe() into
Gpu::new(), so that GPU-specific identification lives in the Gpu
constructor.

Restructure Gpu::new() to use pin_init_scope wrapping try_pin_init!,
which allows running fallible setup code (Spec::new) before the
pin-initializer. Add Spec::chipset() accessor for use by later patches.

The DMA mask setup stays in probe() where the safety argument for
dma_set_mask_and_coherent is straightforward.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 49 +++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 3b4ccc3d18b9..8f317d213908 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -102,7 +102,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
 });
 
 impl Chipset {
-    pub(crate) const fn arch(self) -> Architecture {
+    pub(crate) const fn arch(&self) -> Architecture {
         match self {
             Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
                 Architecture::Turing
@@ -241,6 +241,10 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
             dev_err!(dev, "Unsupported chipset: {}\n", boot42);
         })
     }
+
+    pub(crate) fn chipset(&self) -> Chipset {
+        self.chipset
+    }
 }
 
 impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
@@ -289,32 +293,37 @@ pub(crate) fn new<'a>(
         devres_bar: Arc<Devres<Bar0>>,
         bar: &'a Bar0,
     ) -> impl PinInit<Self, Error> + 'a {
-        try_pin_init!(Self {
-            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
-                dev_info!(pdev,"NVIDIA ({})\n", spec);
-            })?,
+        pin_init::pin_init_scope(move || {
+            let spec = Spec::new(pdev.as_ref(), bar)?;
+            dev_info!(pdev, "NVIDIA ({})\n", spec);
+
+            let chipset = spec.chipset();
 
-            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
-            _: {
-                gfw::wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
-            },
+            Ok(try_pin_init!(Self {
+                // We must wait for GFW_BOOT completion before doing any significant setup
+                // on the GPU.
+                _: {
+                    gfw::wait_gfw_boot_completion(bar)
+                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+                },
 
-            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
+                sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
 
-            gsp_falcon: Falcon::new(
-                pdev.as_ref(),
-                spec.chipset,
-            )
-            .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
+                gsp_falcon: Falcon::new(
+                    pdev.as_ref(),
+                    chipset,
+                )
+                .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
 
-            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
+                sec2_falcon: Falcon::new(pdev.as_ref(), chipset)?,
 
-            gsp <- Gsp::new(pdev),
+                gsp <- Gsp::new(pdev),
 
-            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
+                _: { gsp.boot(pdev, bar, chipset, gsp_falcon, sec2_falcon)? },
 
-            bar: devres_bar,
+                bar: devres_bar,
+                spec,
+            }))
         })
     }
 
-- 
2.53.0

