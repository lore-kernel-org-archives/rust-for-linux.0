Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869C53BE17B;
	Tue, 10 Mar 2026 02:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108748; cv=fail; b=NnyvdmtCHLM0cIq1hiIPQk2CI5fjAzNqv0fAPWWyi/FKtDOugfsiyD7zGdSmHrc1mhkAYagE87wF7hpuBQz+0YDSHEcUeTVYVLsfGJ8dzuY0dLceLK/Ku+rrpBZhhUAjNrOI37Xc7+WQcbd6HaccBNHcXf9gwOgQCituCI8QCWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108748; c=relaxed/simple;
	bh=oYbWDUL6kW3qfjMr1krgPQAYp/9onV4FK75cA1UhOhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CI8S95U1HG3I3Gonsu/ATiM8ztyeG0AK3DupPv3ZjXl2bRLQUQMTVQKYoUpN0M8uq9vWwIT5CWheCNSPkRaxAImSYS8PfeRwR8Hgp6ax3wOGhSRJ1ztSurD5CnPfiq44OG6HcTCCEna8R2N+vq1OUNupqg8Zdg3p5miNRznLZpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZnBNlSKs; arc=fail smtp.client-ip=52.101.52.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZnBNlSKs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ienmUD3Uc1qHkefrJxEKJCd+uo6uOTHI6LiiC8JsZUeOuQi067BpGZiucFEUbbBTbZU9PvlRKBYReq27nGMFW3ALzgzxGqhXAmxEZHDUUB/6eGfxv3/yiXr9EOnawKAI7nJqWeoPsjujtj8fHDUcLB7UGijpfQd/Cz6Q6t4LEyrSAD54NqrN+WhlZYy5I97MaC04X4LVWt8hpoCSFlTnySu7TKuBZNXo9GUntfz9WS3vC/v0Zq6c9WfrzJl0U8DvGCnIlYpyzCTFQrOuaoANimII3NkbNcfUlRBWHUCUyUGdG6NHPkl45+tN7kIlCYK40y+x8Bdv3BflNiiUzH6l0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoHNhgtKutGMXVcPNY4xb9QHX69tD8T3ovVfFzyzGnM=;
 b=fiHaQoY9hAh8w+znjQ2a2VKpeDwfn+/25ZnQorOfWeaUZwycLrbVwYH54+dxQ2S6BXULiYVqe8vady5M66qxRV8gn7qUTywH78tmQloW0THi/1Tz5+uBSQ4dJJG94USwACKa0q4hTdDAEM/NvShJtz5XO4xTLAeU7QQh2UqkdKnGF28OOGJonTHTzTMFoKomC40jPc3cP+0EKBRRR0jTgXQZMbZx07hLRQVYO6T1aXOaVWbsNhSPipJhs0srnQ2hMRBh/dB2z/ydyYd5huukNSn9JtELMpewCGdkaVwjisi+w6MWs6t2knB9Tk25859OqKuytViJfX9iW5iXyNwKXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoHNhgtKutGMXVcPNY4xb9QHX69tD8T3ovVfFzyzGnM=;
 b=ZnBNlSKs9z8sw1xbRjZcu3SDcFjww1PG9RxJ15rm2N8XC1KmK5h7EObcyxqejfsSA6KDmuPlwwoxTwtTWPdVOCo08X140iuU1raYqxWTHxTK2+AojeUtXqrya7v/CPDQebZt5bnsWR1WM19fI+HU3AZejNyuVdaqBj5ixfClR88zXDJm/QfhcZBhOSZoDYZSY2VoyeaV7vId4aSiPhY/Iw5X5dGZY+ZnIB64KWDHFHET0zeDDpt5x6E1qfxY+3+e9B/7SZol8dNm/3PnKVbhLBSa8fYDxMPAyK0rnW5t8ObIiStCLkGHd9aMpZC0lLirlXkct1NNRRYXsjXCnbfUQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:12:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:12:11 +0000
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
Subject: [PATCH v6 31/34] gpu: nova-core: refactor SEC2 booter loading into BooterFirmware::run()
Date: Mon,  9 Mar 2026 19:11:21 -0700
Message-ID: <20260310021125.117855-32-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d994fe-a8b6-4fe4-d15b-08de7e4a6fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	+q6nXcxl2aBQ2M6bnxJEbJ2yG2+8fWqYEGKYCWtncs4hT12MMGLy3+WygJ6O3pOkb6HpAzZwNfD6576DC49J2cM23BEpQoE2YcrtdaghgiQN5NV5TZ27lzjIBralanddOxUCnpA1I4FAXL3d3NjSHP/44Ds4Nis2yOhXgCTM+HTqTc02TBJ/lrF7XSCMjxwrjARbLAhn2wv+n6HCnqfd7ooPsx10z6b1BayAq5LKQrDaVfpazrcIm67fsLCZaByBnwZ8VRyWzEhkI8HjpoD3BPUK9QdwNY+uCap9nNY/2ivOm4KNwveB3QrL/8oMP6lGpyia8OJzhnTr6GHifaimgQ5WRRzMmxsujcuxb6I0AIT7bAb5F/TMZ65ssBP24103szQvGC8tvSw2yhitTS1JB2e4n37cyo0NWr2veGt4T87uR36pdNe5oo3Pr6yyM5vCTIDdeCULKWQ+nUGajPd4Q6xknHIE7QQxsjBugROLfZ5wB3mHucyG+U9zSrCNRd10JDM3vW5kXiVpQYtkcBrb3YURpe5qta5Q3CJ6cInrZ82UwAk9CrAh4kE3WZvCV8prrOw0Vtj9Yi+MILJwuaq8qDyiLn9MXDJb8h20nBjVU8zs69h6Eiita1Bxrck2x/DmrJ6yDdwWQo/C7mkvzA4DmRNin3jQ5Nu7Y4L/tiev3xAqxU8fSOVMPmK89NwlO2BDXPSrhFF4lO9KSkF58gonag5U6jNJuvciq+Y/VE2QDjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fbUGqJTpivowhXQzav+RZl9lLTiRgZibqRJZ+3Gb+ZtazYQQZV7jiFUeNRXf?=
 =?us-ascii?Q?JlQgsChmhApmNiTLfQ7tMKUn8FgAUjUcDqVK8rwSR5gtTkWNUnuf74LUbC41?=
 =?us-ascii?Q?6mG7qk16Ps/T0uwhw7KF6vCI/ifbGAEW602Yl0FcrMHvBI4dA0p8MBEgyc9C?=
 =?us-ascii?Q?uqPeWme9gipzjd745HYiMgM88uhsLPhG3OjFrMEeEYpb0KULP+/C0DXAwfON?=
 =?us-ascii?Q?AvhmXA0xmrtJd+2T840xh4u0diEpPXYiGuCYP3q53oM2shXUoiyhVeu+So37?=
 =?us-ascii?Q?N6vFcABPpTJ5qOm9LW5IIQ+Gd9oTZnbQEFjrCi3KNOddqW/j7YfnN2/iGvFn?=
 =?us-ascii?Q?/FpLxLiDZ1VLc501L9KX7muSvnKKnfNVJpf3t0ZjdAm3Jqcvg502C1GwkMdj?=
 =?us-ascii?Q?ZdFRa5zNNU6gqGt6BnctYftlSxd1p9sMuyE/nR58A7TYN5zxGt7VE7SOfRum?=
 =?us-ascii?Q?xnfhiaKMooE9eXY+J515x/Y930NSkVJk/Pxmch2m181bBdCB8X3RLpOeKrgv?=
 =?us-ascii?Q?g0n4GwaeEiDkpiIlYgDKbziJQt2Rf24MG8yWO0VqvjqbrIitsa+Sto3UrEBg?=
 =?us-ascii?Q?oMH9BnFmKmu9aNgFhRDTdFBSkP2zoGxW7ffaf8uNcWBFRgS7P8A5hPqD725G?=
 =?us-ascii?Q?S/wT0/8KQRN2PBHRV8Qm2/4y/mvU/fVfAkZEQYXngdjDK9rVcQ1E+JZ4ClP9?=
 =?us-ascii?Q?jnWClaV4xzpTP6kdXq0GbW/8ugJIXaA8gi5Jaqyy8/zY3n5VXj4vtsNZd12u?=
 =?us-ascii?Q?h/Qk6l+fDZ9N52FNJy21G46fVHF8pRYtaDki8MVboxxce/uRyOdu75Wewwaw?=
 =?us-ascii?Q?iNUTGEajNKAKEIXqm45or7L60KLzE7NE8NjNltJBgCxIQwo5e/OkWm52cSWy?=
 =?us-ascii?Q?d9jih1z0HIjay8e1Qs++dASHOcdOs+waoX1DzC6etfo98CvmXZdv1nf9sGwf?=
 =?us-ascii?Q?n0GMh/Vk0/EnAoRX9eSV3geYcFrQwNABzXOH1CFdUXln/ilGF6x5vZw9Ueoy?=
 =?us-ascii?Q?rDkMxTthLGSKeDZAh/JdM1Eo+evSezVeL0iGioErgXmBqaO1G3rDfYgjCbn5?=
 =?us-ascii?Q?1OPaSSWwJ7s1OesiVxaIdVfBsedaX3wIsvBO+rNrzTDTv2vCJqnanMF4M5jr?=
 =?us-ascii?Q?qse8ZbVVND7XvwLGfSm5Mb3hSTq7KuluKyMeRPOExz4RfSNUf2CMhn30CTaK?=
 =?us-ascii?Q?hUW9HlXuRXe017gPFeEKFl0BbwF1Ihy2UfK0MDqf1mi/HLa8qkL3fsDG/uOO?=
 =?us-ascii?Q?isRLGC6361jrQZVHwo5NrSjmetfCE6RlEgjGjSLmqjcuHBC0SGhBtqJE1rBF?=
 =?us-ascii?Q?IHS0rd2MZR7dGZELmUS5eZYwc0xGPot3mMtKR1HStKqw2SEs23K1OpKDMiPx?=
 =?us-ascii?Q?8B6gzVr0oebHHEmyWTnRLfTvVI9NL3vDbkA4Vys4qgsI/87bRY5QseEDWztW?=
 =?us-ascii?Q?mM7DBwRZFeSUrW7sKquXmD0eAnrmXfM4rhdzRFFBMrN1dTqagFV/6sGEWCIk?=
 =?us-ascii?Q?+zQAn+wQ7BByQkc2HH+740VmWTJRgEIAu41V6+kxp2YJjub37jDAD0GOHTSi?=
 =?us-ascii?Q?DsfRYQ+J3Karzj3uqFpQrBMZ9eFMT7pD6ldnAsszrd3BRiGKNuDVCgpwOejt?=
 =?us-ascii?Q?60dgqHidYf0ETvj9xwW/rB+kIA+ERTNIYuA1NuqAQ/1MwWdK7Ykvj8X1kean?=
 =?us-ascii?Q?FtHbG1sWEBWlda5KJcrOXf2Q/fYBpS7au80XghycnGqOcBEEBGrV+dJBHnBs?=
 =?us-ascii?Q?v0DuQF393A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d994fe-a8b6-4fe4-d15b-08de7e4a6fe6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:12:10.4699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7h4NzognZSsyWPKj2O40NSTQ4BMA2hSGqt4Zn81/XTp0CUs53SbrL11tGd23CaorNWkmLTdMLG3psa/GwIQqqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

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
index d278ce620c24..c66da4fe81a7 100644
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
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
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

