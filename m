Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350F13FD13F;
	Tue, 17 Mar 2026 22:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788086; cv=fail; b=O6ZUUvAwn0rr8Jh6Gvs4w+/XuVhtbPu5vRAjD4ryuBuRb5pZ31vPkmmNQEYF0QfslkJ2LCdkbiz/m7Pt219RnTy6PFAZCIpZ6/saBdBjhIlysZFjEvA4/Nziywj3yc/2nETdK7HGCF4Vy0IdHnCMC6VxZMQkJRlb9vImhB7Ltpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788086; c=relaxed/simple;
	bh=ChM/Eud7MBuksC2FahNM92M5fWMrlTYnuZ4HvpH+aPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H+LCJaSlCxpcyE7CDj/ozyw4o1mrzyecqbW7XuPkemxxQbiINIGakTNkyBthZXylEs73ZjG7DgZRCI5y6EFi1xJ9+7/XFw8isf8ll9fYyKWdhA+tytpmGIPyQw69wclw9tgclU1knfKFfba4lmRijkp568cYHALBWklDi3kyyng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KY3rLw/b; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KY3rLw/b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZ0FVyEgITEeqBG8xVIvuNeTb5am2SwDPZpxXCStVC9W54ueFQS1r/IZo2ZYJPaJISFcm+6D6iRpsPw9LqteIwDPvvQ6Flv+NI3KxBj7Gn3zj9NKCXbp1ElaRKbKoqhV/j9qEiKZyAEd7nDGUgVxeaVdq+XWGg1r36oIb6YmpDUkLnTtE7beZ624yR1mBg20I9rG6QNovcsdm06CZAFSGknjgZa5qo9Ek2TJm0UFMjQzo7HG7+s+btIYuhkSzijFz2ZRQDtVdhvWILWl3XM9IuxJcl5O85n2sa+spwpENBJTJG3MBxoklFQhRqDQIiZdoOjlJiOq57Vl6TjC9vWt3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBOunwLqsPLVm3lEzDQoSau/FyhvFqdMhgAuDQefzYg=;
 b=bKXAumLttFXIbcXTESy9JXWCJ6lbQLUaTu3cVay3JJ77IlnAVrkYzfKYk/ewUCCgD+USlAeUUl7baHUxkFs412TDBPiegToljXU6arJWntUIqu7UXoqrl+ZL+f8uVnPE27Y9wnO2f7gV7vWXNlvf73gqXJ4cCKNVnas3T9v4Ji8+LhsmdccfwGAFbQ5CorA8bBUzxTMsT6aXJWf9r4k+9FDVR8SWfwIj/SXK9nLIVKYTbNxwlNTG+DblGZQc1u9K7O3MLF5ej/pTcTM34/dQsMN1hmOh+ozBB+ndSwdyHpIjU/1zhb9/ZzFvez/ghebA54rjyLoSVjyKVMOcoDqzrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBOunwLqsPLVm3lEzDQoSau/FyhvFqdMhgAuDQefzYg=;
 b=KY3rLw/bU9PBgbsC69nU0IMyU++4frPW/ar0Se3EekgaXSrZV5u9/70k6dD7uR9p1wNIs2IiK6awhWw9NZSr8hFq6Tm/cIz5da7+A8DVY9qrZUdroaWQ2ZiiLj1yclJk6ZvxUmErMn7A/X/iS6UaLO/I0olAnHi58Qe9cHH+7JhT4Oilf+5w8ApmNLWIQ4A6fGbnbH+BZ2jKkE+x4nYs3OHtbGSbj5VBo0MP+fwLcTkTedF6MO8ulh38WluGyDQAKrfqRMIqVq0epcWlQKo9k0r/yoO45pmsr2dI7FNVo+vDpp9omYXnlTUDFREaO47rvhHY50FTqxVR+b1ioYWQXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:54:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:35 +0000
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
Subject: [PATCH v7 28/31] gpu: nova-core: refactor SEC2 booter loading into BooterFirmware::run()
Date: Tue, 17 Mar 2026 15:53:52 -0700
Message-ID: <20260317225355.549853-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0146.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b30785-80f1-43fe-b038-08de847828d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vG5zdwWcRK6oOGQ8mOhUyAUCb/GATO2sUNDDmFq5Fpj1PH46lAwjUHoBSKkm1bv9WgYNavfvSXgxgayyIKGrxLY5WZKL/wLcWaJxHQWnRxHtC31EVpP/aVcBiYYzN6AXPPQEWQr+ZzCgHm0hGgeP/c77vSmSe/el4cSC+W80SEY/UTO5Cx474Va+Qm2nQAZXqBH4IldN8gPLLF7J7oW21a/pj7zMCzWVa4GFRjRQMYP8J7ciTKuJeian4YKybtIwTNk/9l7z1b0oKlkM8pTommT+h1xNtJyvV7swjVLMi6wS5hlfOkJy/lHZgJbUMV+CC6OkXfiEXOciU0CaYtUXLritBFMt585QxNbJcEWSFnhV/X0C/SIyhGNodb0rYnSwTxasvWIJXlTcxdEdnWK26ghby3b20oU6QamCrSYjMuPuyu9B40/B0WvO6yh2SLkxJQAO7AsejTdRey5YB0G1VH2xhdyuzxlTffjOhdGx8o7qxu2+NmeRj83zi9vKGqcdslfJcFCAt/Bz7v01dKuPL+5yE82hdtrAls4Yr2ZNhxDWG96uXhIfp3LxAtmt2YWmN0Dd+uycmZ+I1QH1FZ5ii37BqSO2K47YrcoMdteM4+DHzO4fKueISmNmmvH+SjW1hDNg+EvedP2Wu5+EjFhsP7zwNZrKHBXJHArVfTNxbM4xQo0eqYkwT36WhILnhREqD0jvOVcpwSuIaMGvb19L7itqG/KcSGDGZImnFFY/C8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+x86IWuN1eZKcGcKhEZ70ljAB/GLykyBiIk/zal6v1E2YFXF/8HgnNoHpubv?=
 =?us-ascii?Q?sRwwTieN3Lpxe4SxLe/hOWLTASN5YjQhVtWc5chGUupPSDZK8YuwdUhIsQ2G?=
 =?us-ascii?Q?mgkGTsbiltUbNx3eyCSXDRbMmE70++a8fMUiyD+RDlIoSy+bY2n/qkQa5/pl?=
 =?us-ascii?Q?uAns3DO+3RUqra8rdy/3ej0bbh4HUu3UJVlSBQnBqonzU5MIJEfpSe07xpzj?=
 =?us-ascii?Q?5XczKg8+1MjY4WVvz21TD0aCxD/7fCK3nLEXkjs7GSktPTzaRQ6+Ux4S499F?=
 =?us-ascii?Q?iIBuoQkQ004zmhwxLGTRbgzn4Rkz4xYuESbQ4vks1s2xHhXeRm6eK38mDolD?=
 =?us-ascii?Q?Rv7slZGyKllfFM60/Dkt7j6tkwE1iJFuxWbWtTUlWyTlOJCCsguNY/xqRxvp?=
 =?us-ascii?Q?+GOyzNq+oqXqNpoPNltB6BK/5y4BLlpMxzTYp0vlI2kogiJHYTaRMEsSwA8u?=
 =?us-ascii?Q?c/bA/GDnrysj3kzT9vHjOpFDbcDAs3pcPPXYmNkBvzrJeIPMPt42YyUkEv4w?=
 =?us-ascii?Q?/aQ1uu6k3/XoMkZvpSssW+hFcX7ynK9lqXCDkpTwOoNoJDnNuSUycfw/n9UN?=
 =?us-ascii?Q?2G7KYnR6vejvoB7CJ1n9jM6visDB7lHpCvcH0umWpnw26d5tNm52vxg/n5so?=
 =?us-ascii?Q?kGJ+csR804Qf/1PyPLUxSJfKb8g0gydcARmMkB3HLjzO+AwmtCYuJVGlJuMM?=
 =?us-ascii?Q?MBfUbdP5tiNA1WJFJ8tG8v6qu7m8yjtYddJqBqcZCbTaqbhAK+y+YA44T8tW?=
 =?us-ascii?Q?U5yK22gDIPEm9LfHSP7N7rAk4nwbnoSSKkN7ADkISrJVrEJIjHDktaNDDgGV?=
 =?us-ascii?Q?SFCwqi7W88YHK0g9kknTdnb5UOlocFq+EbXZgDfM5bue1MO2IO5KKQHisqyc?=
 =?us-ascii?Q?b24GX4okAaPVweGi8IlbefC1cjyhtrB3GgO8OQxBtU7Gi6ORSP+f6jKydkR/?=
 =?us-ascii?Q?Xp/NUVbD8vHvdteHqeTaIpgD8tfAuYwD/X1gUw1RdIFqUDVebcMqAk89gJp0?=
 =?us-ascii?Q?D58dAIkoaVjn4XwE487dj96VAa9RE7m9GIHF3TAeg8rlKyhKFKiu2EBHH4b5?=
 =?us-ascii?Q?T1F4tFAQAjx3iVmg8nAS80vI3orbTN4EXdEnHYNw25yJk4Py1H5Jog5q2yMp?=
 =?us-ascii?Q?Dq9vU2LRm6DHnRbFAxYHiIb7VQ6uwf1oi5lF1NYBNHvStSd9etx/DFsP5Ssn?=
 =?us-ascii?Q?MK027HWqSD0BtPm0yRk7BHFo8D+piibvYUCHzMyX8nviR3GUE7pLYDMnxD5G?=
 =?us-ascii?Q?XS96LN8JJ3l80lne1+i0McQSlOqFcmRH2p99n7egBhSYjBJSRdwyQyUmYodf?=
 =?us-ascii?Q?jkZrxcBxwo7fJPVccLBIBrjy5USYrjugPbeuNYYBbqQ8+CKhsyjE1ESRQXN3?=
 =?us-ascii?Q?sL/0Gj33jWJ3N3XTYXoS7AEJJ4Lp5PYSxj8S3GUhawmMF7bh9fucCqr87K2d?=
 =?us-ascii?Q?+tGP4gA+1TWm9jz338WqR7VrihmAdYuYLpWoVlxgyteK2ujl8VHIP/7teIyx?=
 =?us-ascii?Q?zrFIV/nnVPU2Z4ce2SleOBammsoJBjBDc7G+FbR+9j+2GNafJK1YQGu67vtx?=
 =?us-ascii?Q?2qSvrvm4TH2vbCt9+8proSt9fCF7E3IyysemtKetE2Gu6u+UTfJilFu9O5Yx?=
 =?us-ascii?Q?QcA3eIwUJBOMXiAre7VsLj8xhhrfv7emzDYOl/5GL6fvur05PwubHb3VH+PX?=
 =?us-ascii?Q?CKlh6ud+SGYMYMmUbhHh5evhnT0dDBxMkEn2LEFVS7+3dE7NCSw6XIu4iLJX?=
 =?us-ascii?Q?TmYoetsVkg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b30785-80f1-43fe-b038-08de847828d6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:35.0718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTCVLSEV3nONvSk2i4fUpVWLNSEuzDZpLaDdYJNIfo0prIPxQYAMuUcqEdU+RukpqkVo7c+5EGCzI7EH+md4OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

Move the SEC2 reset/load/boot sequence into a BooterFirmware::run()
method, and call it from a thin run_booter() helper on Gsp. This is
almost a pure refactoring with no behavior change, done in preparation
for adding an alternative FSP boot path. The one slight difference is
that an MBOX1 printing typo is fixed:

Previous output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX10x1

Fixed output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX1: 0x1

Cc: Timur Tabi <ttabi@nvidia.com>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 35 ++++++++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs        | 43 +++++++++++-------------
 2 files changed, 54 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index de2a4536b532..7595af8acfd8 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -8,8 +8,12 @@
 
 use kernel::{
     device,
+    dma::CoherentAllocation,
     prelude::*,
-    transmute::FromBytes, //
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
 };
 
 use crate::{
@@ -396,6 +400,35 @@ pub(crate) fn new(
             ucode: ucode_signed,
         })
     }
+
+    /// Load and run the booter firmware on SEC2.
+    ///
+    /// Resets SEC2, loads this firmware image, then boots with the WPR metadata
+    /// address passed via the SEC2 mailboxes.
+    pub(crate) fn run<T: AsBytes + FromBytes>(
+        &self,
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &CoherentAllocation<T>,
+    ) -> Result {
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.load(dev, bar, self)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+
+        if mbox0 != 0 {
+            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0);
+            return Err(ENODEV);
+        }
+
+        Ok(())
+    }
 }
 
 impl FalconDmaLoadable for BooterFirmware {
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 6db2decbc6f5..ad0344db66b2 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -129,6 +129,25 @@ fn run_fwsec_frts(
         }
     }
 
+    fn run_booter(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+    ) -> Result {
+        let booter = BooterFirmware::new(
+            dev,
+            BooterKind::Loader,
+            chipset,
+            FIRMWARE_VERSION,
+            sec2_falcon,
+            bar,
+        )?;
+
+        booter.run(dev, bar, sec2_falcon, wpr_meta)
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
@@ -155,15 +174,6 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let booter_loader = BooterFirmware::new(
-            dev,
-            BooterKind::Loader,
-            chipset,
-            FIRMWARE_VERSION,
-            sec2_falcon,
-            bar,
-        )?;
-
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta, [0]?, GspFwWprMeta::new(&gsp_fw, &fb_layout));
@@ -186,20 +196,7 @@ pub(crate) fn boot(
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
-        sec2_falcon.reset(bar)?;
-        sec2_falcon.load(dev, bar, &booter_loader)?;
-        let wpr_handle = wpr_meta.dma_handle();
-        let (mbox0, mbox1) = sec2_falcon.boot(
-            bar,
-            Some(wpr_handle as u32),
-            Some((wpr_handle >> 32) as u32),
-        )?;
-        dev_dbg!(pdev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
-
-        if mbox0 != 0 {
-            dev_err!(pdev, "Booter-load failed with error {:#x}\n", mbox0);
-            return Err(ENODEV);
-        }
+        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
 
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
-- 
2.53.0

