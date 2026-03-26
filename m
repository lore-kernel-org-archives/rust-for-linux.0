Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA5391501;
	Thu, 26 Mar 2026 01:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489197; cv=fail; b=oenbAapAeRwv0lc7FUMVO1Z3Ag3WxJoHIjXypNqnRFLWTWKhQ4VAwc/4pm0racHROxg3a5eQ4Jt6marnVYNMQPotKbbV/LUeMmTlmefR2dbrM4SpRBU+qadhOhUX/3yiUTQT1EAl00/mgo0EuELDU7R2kMCQwU85DJscS0VOYmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489197; c=relaxed/simple;
	bh=GP5WfgU1/3JEOX0Uw6gu+T91o7UrdkEeUgOrHef8Miw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cYSuGfFCzmod9ti3GsOCrAfRSz4ViOjeFryUamNDKVx6cQZIgtpbtB7/43dVuyE+N/qQvwpguj78abOe67gj+AOud3x7HduaVWBhoc7C5pT2QzmwOQL0daJsnmBa7Qr0cn9rVrKUB/4+odI9BEPdzh/2+vq5Lo+HN6xkysppA6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B/+fWWSC; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B/+fWWSC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dnomu9pYq/gtmxSDrjBBW6+YBWpnowZ6OXT/TtqZcOZrbTTLreiQ3VgDDv/sTt6rbcIQZjZWtSiaN2c0E36dYxugyKzJUALbyawmpMiiTkRb4uthkKAuMjY/4UofyXJRNEjbed6UGV+pzGkUW7Lh4S7Wp/YFLya2h95PDam3mURxPGOEvDNPE5vrfY1P53wGUYrOopdBZGQ879ZZnjKjA0WjNYXYc77Y4eZK3Cyz6cXG55G6SE12cmKzHxauakZ2PpkUx5VoRmg2J3P5woWqAO/3QR5XiYTPTuZBscDU4xd6WgOLwuLYkTKCE1vXWitsN+ELQXs/y+oQdczHMv802Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNFLRslUrO4DENHdTmkCoRhvYkz8L6HYDYr3FnoTdO4=;
 b=EmQwlNMOPaGt41KLxYHPXDBkKwin/WYZIWrs301OK+F7/d3goYWEdSSzbp2dHSmh6UBvvZzhvIiaDVn2YtgEqsZW8oE5ZpVlvWRA24QVmUYBBsOTcwCasFW9vkQUZaWn6myS71FOUBO3gkv5IiL6tp/c1Ir1TN63g1B/4bX65GuWvsSC5CvjGYnMfVsySst8vHM8AQ2X0LG4/lJ260h4bVZ/EV/8q0dumx/mwbwtGV4krfmCPUMoki1VvSu3578Pzdf8aP/8Q8eyPOk21jCuaC+YUj6LVNGHppEvJgMih91i3RQ4LG6VytsR0vUg5qWWCA/N0PLyBQHlA5J1yWOW0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNFLRslUrO4DENHdTmkCoRhvYkz8L6HYDYr3FnoTdO4=;
 b=B/+fWWSCPQn/Q+RWFu6vpSPi+qLmvyXA0mSWth9TOFtONdqZ72VcEaeX0lsJI4fgHwrh2wNv/PV5W/O7Q2O9Z31g2xRncwPO3WpDZXl3Q8A6ez6nCbJb3vplWzaUSXVA1rHpJ6sN9heW32//z689tF0I3F71/YMvRciZoFzjSBhasEV50c/tbAIbaH/E60IFo9/7RpY8J2a0ZlFcghX/HFFK6D+ycmu/baMmyITfWy6py3qxbINzi0QAzJ3dq1Nx3D2QLkWi7ZdSy5U+3L1QpF3swX18Itq76Cp/l8eYHMLhDNpmHhzrrVsioG8IRQD8A9rE9ZltNmQqdsPpcGoOmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:45 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:45 +0000
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
Subject: [PATCH v9 28/31] gpu: nova-core: refactor SEC2 booter loading into BooterFirmware::run()
Date: Wed, 25 Mar 2026 18:38:59 -0700
Message-ID: <20260326013902.588242-29-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a216bc-c9f3-4bcf-14e3-08de8ad88f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4oj6uXH0jjIxkGTtTRCoRGsc2xjMJ5bScC4GYJ7uDwzgfSN7PTinVKW3uk+FMWxvmkSAnAkFJ7Z5d2YTyuKPUYH7lNBAUKNDi2h0PkzHj3yNq9yXAhzYCxZY8HqbgHWrzFOMfrIuqPKThNKSHZH9NXZcBJawRLU7EWlf/iVeSe0L0x2JY/y5gS0xhmi8UR8kZpbJ6v4aafvG55cxeReKtdycAR5rx/rCKBT4mqrkqg/nwW8VU4EXS2jbX+PWrGJsBRmeqgFlrU/GNSma6lilDZzxMZvZQomzbxNQHAq0JMWPGjbm3V2wCnLCZDPH3jaF0i8J7mIPUXh/gtBvi1eAf0ylOuu1o4VBv6Kv1/SShtjXBURAWFIxPHsjg3hZM2omqjlpOLAP5yTEMUfJXvPaMnEgVA7BfBjabfeBwwFw1Wcak0uE+MT9Ss4VqmQLv8jWS6FsxPtWrCvYzaJH7PBcBAIgWcKsKAGsFBnkiMhZ8A0xpqqvckBLv0la6T6kw2OGXqr8CisTvAcfxZJ+QpdXLqyMx1dq/zc9oKd8adKF5cue4gbO/rfKxNpgvXDR56Hx/6teAl3tgAhN5BgrG1JbIicQbvIRvcEer85HWq2f2t1OT1R1bgdSEbk5B4yLkBZAZM6lT2mW8EYJFLPLVs0sXB2+PtpOjgNJf2h6WMr4BC2Wp1/QisVw0GKwekxZdbk+dz6y+VCXPJfUJMMAgl+35Jict7hJ+Zlmls0+Y3WeImM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hmDkBL/MhRykTxc3MVDFAeBMkBay87SR6LoXK5fPpBib60aVv5uvW5Zm4Yaf?=
 =?us-ascii?Q?Lwp7C4cJKS1YDh0KKwD4GAWKM+fwZEidhHTr0eSYUqVhTFAbSlGfov/EHTIT?=
 =?us-ascii?Q?QjLkHiZMm73WsLM04sNjueV+Bpn7THApPQBQ0dafDdIw0zFi698UBPER8ZXq?=
 =?us-ascii?Q?hkKs2ZHXSOCk8tNCV5IqRGmzs6p9gszNdm7O887a205RlJz1E3mJXpMM1EIL?=
 =?us-ascii?Q?IIrtKmvYTtfwV3soNnfNa4u7Q51BM9ktRjVWPX/5N1Y28piD9AJ+5H9AS557?=
 =?us-ascii?Q?lqH3uoGGpCj1EJpF4lkWCBsI+cW1Chkdw++WmpPs9ZU6pbUfx1/e1abL8UlV?=
 =?us-ascii?Q?ZYkz3t9j3/Bt4gRAhx3sHf31mrUzm8lm0l0IF28FwRD6zCZf/Dszx4cPDmaT?=
 =?us-ascii?Q?tW/O4z+TKu4M0jSBM8r4cFhteg/iasd2gG4lFaj9XRftRxOAC1jsPswk4hX9?=
 =?us-ascii?Q?zJKn4iqJHCeuEBXNKd+D+5pikQkOQ4CwdgQVxQXsvSwAx91U4GQTLL0gjhfa?=
 =?us-ascii?Q?QjolJshCkdQNxWelINcRaBQ1fvXb4QeTtJicawgDe+Wphci3ARPrcMZpScKp?=
 =?us-ascii?Q?GmYdwlWiAGVnHD+JRrfk5XwqsoSmzdKwF/jupbJef/OF1xWY9j/trRcryiyf?=
 =?us-ascii?Q?3DOJBW/D/qYxS3/oprFNsL5bukwdaLdbrvLcnrtqHrlgCW+0/fHRgWaXws0z?=
 =?us-ascii?Q?3S8zMyFeA2dtAF834Rc9RLsn3hAnjYrVVwA63eI6ff3m15v1f+m39s148Ur+?=
 =?us-ascii?Q?0n9fuE20hFnWvuYDBznh7XgdIQYs96q1PLgIURE+Spiuu5tri2NhUqXjteZa?=
 =?us-ascii?Q?yO6QyUpgFTPWpgo52oo6gbAe4hZ9o6tWCKioRLhE9XPMF94NgQW8IcSn2QZM?=
 =?us-ascii?Q?xs9SaN+0e/6OVDfy0nSTNf05+4TDSo3P0sbp1DQ6Vj51b0tr/HhkIkBKihha?=
 =?us-ascii?Q?mXSFgaQer5FzkpJSsV5327ZP2oaXEeIXonihP0aYyt11WV9MJOK+rQV38i39?=
 =?us-ascii?Q?hOnlpoAIN2gAXKxWjdSFE4ziTYdCXWU2wbe/W5z2jUEr5AJpV+Lq41pBtrTz?=
 =?us-ascii?Q?Ve/3pnTZxuox4FDjh158HOdduvLpljbMWrm13cXlBFguMxL1Np1HONa9NX0D?=
 =?us-ascii?Q?yksLgIMDaAETjR2BveY/31wkT69A+BbF9+7y4uQWsSDryDCtPjG8lHL9rQ40?=
 =?us-ascii?Q?K6IDn9rQzdPRXAvYm9fMVC+ZUqr0BP1Ha/pDWE4KG+NUfkhhsKe9rgGZUKEM?=
 =?us-ascii?Q?bznkw1k/5OXV/mtYBoqOTeAye4R1Jh6oKt9FTLm04SieRmihCQDR7KIoCZTW?=
 =?us-ascii?Q?qaZwI9FMyRHcJws+YXKlTgxCCPjpNWgbLnjYv7kK4N+cUuN7shGKwsBge0It?=
 =?us-ascii?Q?/ZwKfz8+9J43B0nKAaUb1q0DcQTVHrr8weXMfBxyRUpvJlh+NB3KvWUFb/A3?=
 =?us-ascii?Q?lTSQ0c39dGjE1eJA2DReFwJAYcAfPCmQ/l6GY4lcECmQZ2UF6vjlPD3iPqdE?=
 =?us-ascii?Q?kyLMKw5dScY9UT06amujc4HqmNkrO3totxRC2xwsCY4v1IeGfxwkd848k7y4?=
 =?us-ascii?Q?noOBiG1RsVD3l7fImh4OskNQ7tSJcThy7e2DOUuI5sOi2Tw0qMx6qR0EYzZV?=
 =?us-ascii?Q?ahYSwZza/kt+j51+jxQAYarSYfiVxPG4LmrSL4T7mC8VVC9G3DQZ8vpBmSDm?=
 =?us-ascii?Q?NNpAvjAjTMZjdEtS49b4L6M3wbbVnNsT5ZoNafxAgJt3iAYjQDw7wCW3Eowe?=
 =?us-ascii?Q?QNZqMLpVVg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a216bc-c9f3-4bcf-14e3-08de8ad88f56
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:45.7370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oat+f4SNoF6WSnXtQHm/NzwIK0YHEqHLV4lpvdjhPABP/+mc5Q9AaSvikMnUvRa8iRSplhV3r+C9Bd94rhJAwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

Move the SEC2 reset/load/boot sequence into a BooterFirmware::run()
method, and call it from a thin run_booter() helper on Gsp. This is
almost a pure refactoring with no behavior change, done in preparation
for adding an alternative FSP boot path. The one slight difference is
that an MBOX1 printing typo is fixed:

Previous output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX10x1

Fixed output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX1: 0x1

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 30 +++++++++++++++++
 drivers/gpu/nova-core/gsp/boot.rs        | 43 +++++++++++-------------
 2 files changed, 50 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index de2a4536b532..6a41690e72c6 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -8,6 +8,7 @@
 
 use kernel::{
     device,
+    dma::Coherent,
     prelude::*,
     transmute::FromBytes, //
 };
@@ -396,6 +397,35 @@ pub(crate) fn new(
             ucode: ucode_signed,
         })
     }
+
+    /// Load and run the booter firmware on SEC2.
+    ///
+    /// Resets SEC2, loads this firmware image, then boots with the WPR metadata
+    /// address passed via the SEC2 mailboxes.
+    pub(crate) fn run<T>(
+        &self,
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &Coherent<T>,
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
index e55210ebb6d1..9d0e29e82574 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -128,6 +128,25 @@ fn run_fwsec_frts(
         }
     }
 
+    fn run_booter(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &Coherent<GspFwWprMeta>,
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
@@ -154,15 +173,6 @@ pub(crate) fn boot(
 
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
         let wpr_meta = Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
         self.cmdq
@@ -184,20 +194,7 @@ pub(crate) fn boot(
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

