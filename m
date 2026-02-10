Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5068D33342C;
	Tue, 10 Feb 2026 02:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691634; cv=fail; b=aYuAdIdYmpcjn+740wWSQng4U2cA0ADBgQ5W9wuX1zjuzfku/wgefVb4aF3Zlp+S0v022MIo4sJEG5y6yMlVC6UtfHxtanO027nA80m7XBej8nQAtqSCg9P3p4E7KOmflY5eTWFNwDK75oMhJaH1eWGR0r6zWDnRp0PLcCpPdIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691634; c=relaxed/simple;
	bh=1mx5sZqNNTBhJBiDDuxNeuNwR3bwla8ud6CfDG/lPT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kt1MwPu1SfgV+4La199VnebMGO9dv3TAiT4jaaxlVnJTtCPnVwU/21RYQ95i9xse1u66r15Ln8OqKYH6/iKyczniyaFQksxqFlp+2G4UOdrVHTHaIfWu5SiVO8EdVHXpNLUMHiyQFgZ7Yw3KMs3r6GkgeCTxBDAbshgdtqg12Ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r1TbJhhF; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r1TbJhhF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtNbQhgeg0A260ky5Njtm1QHEDIr/M047zDnpIWQruu91AT4b5FUcFfv/t10GEMxMaQfBWcS0nvCt8CPCRFpJw/A5DLiK64pDPFN7A5Q/ku/iaohSj0AhYOlNvjBXtNO7kvv5POBKuYX9XFwP9HdVE25wLBkm53lVKeLf9zR9kWtReuTS+adB4s+vxz0As+PRHxbUFkOIgAaI711xGHf5RZmweWoOt4ZkTcBjtRYqHBKTbb0Csl+ZzH13Qjo7uaDRD4ycd53SztKstz6txcduePch5Ae/KQwKTyUl3ImyzNmLzsTuU/+yzyPCx7pCVNTPeJFzCO7q9Ca3Ou/uF4JYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1tlk4rk3WvL3tjpaqpK3N2NFYg31GaP4Am+HeInZuo=;
 b=RG80DPTbVJaVGOl5AIFuo+9xvZdYQyaoYj1550YoEUpxRstOyaRTiS3onemsgxYg7YRK8y0PzAi5Vo3aONvSiGMP52LhnQrDMvGkc+XcNN7RAXEO/SsGNvCcWsD95vab4CLHcGCr6Xa5W7bcypwXmkr31bpcWjce1xWsyFlJhcHDyH2qNh8nPOyoL0UIDIfwTi/zRxMYV58FEufxV0xJTnuP2OcTkrs61tkNiFc7IPQDYXnr1nGfpRMOzVgl3YGFRu7JafaG/77/UOQVVLjkDl2WU1CWwBvnxERjxqnP0/Rgqf/1mC3D6NPqj5Cv/E7FkjESZNXc5DJpvas2q4zjOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1tlk4rk3WvL3tjpaqpK3N2NFYg31GaP4Am+HeInZuo=;
 b=r1TbJhhF/0P7Nvd/IvXKnaS+BlreD5yxdWLYUWsgH5BBTIU23w4adQKcqLRB+5lNDtv1cWF4RwpTCvNwJbgTFEwDrNyievEEOakUpFGSMgRXAD81PzAGqwyuL7Z4BXNCE9WaWhzKONk9etC43Etp8YlAwjWGtnKHPS0jWxZIDwmy51joSRCxec+QUwNlHRTC5zJCcm6SXIE5v95WqIQ9CtHmVocY3Ma7CZ4BjJkbiEansTD0Sy5YRY32Ipm2QttawfntDhip1MIumeev7YOhPPAnMmaRJ6yErEhUM/c43MG7W+4rI4arST/D16lhz1rSUYZvz945exaRRx0NbrEXYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:47:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:47:06 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v4 32/33] gpu: nova-core: clarify the GPU firmware boot steps
Date: Mon,  9 Feb 2026 18:45:59 -0800
Message-ID: <20260210024601.593248-33-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0067.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: dc9acd01-9432-4ef2-19aa-08de684eada6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EYpECswZw/2EDgGcgjL4n5tNsY7I+PQp03BiL1DEIg1FMSdcuejUAmINmkDB?=
 =?us-ascii?Q?42k4lOeHk9mX6F4zqVbmtpObOvehAYBsEAbHYjuzhJziCjQd/2oGBAZCk5lM?=
 =?us-ascii?Q?6ZFMmhKdMFTAlnvmFVed4k15i9/RNOvx6/MdatLR5GaWyMOcRvOd1SPdGqQz?=
 =?us-ascii?Q?Znlr/gUbIjhGPTSCMSJKyW7/45bwF3kKHjeVCyEVmNq9ggBSZRoxiepGhB3x?=
 =?us-ascii?Q?i7KItEPIVwpdXyAuzDJCUQEj5fc69sNVJOnwK8JhPMqannYLptEPOH7iu4oI?=
 =?us-ascii?Q?wDX8x2jfkbQ1H2zHR8YKbWzGHXVCamiFA+VYhJ5vgEBxQ4/8TlIqa2G/1kR+?=
 =?us-ascii?Q?LdyI85wVmkLgktTY4cgFtoYRNY2UzytQVbgaoq0MQhPpYXqaYobcnR/WI/Rn?=
 =?us-ascii?Q?tcSy8CDa5MlC1G4dXvsYJLhQVszLaseowUN4pX2ZZIW+0p9uHlTeNfuuZahr?=
 =?us-ascii?Q?s8B0sdtW/wnxET4tAgEs56JK2/zLIYJOzEAuuc8mEkSfOWMwcAP+TdjTMeAE?=
 =?us-ascii?Q?JTTFyuctNvEK9oAkqAt9UnFMvdf1fmsJq0N10Opl05l4+PIKl+gtkSZDItuF?=
 =?us-ascii?Q?S/6PUdKKb3HOMyPa4topZiR3wV/FfgPrBt8bG2CcjKRxvv7sxu/ZPVD08I0h?=
 =?us-ascii?Q?hwgyVmg12EvcXTMzIszMYDNBbaheQt6WqbItYcjkoYBU+cRSi+rOfoKXidwU?=
 =?us-ascii?Q?1BpCQg0olJ82jHp2KlbV+P8zm4kEyAhN4UivSJEMuM8EoFNRDHnyT/cm0k18?=
 =?us-ascii?Q?YErDL1PpoHEFiRR0tv/oKOM5kPfRNKKplCcKUC6KESVESeJUWh/lkv6lNAWk?=
 =?us-ascii?Q?503X/ikQtk8Cni33r4UdgnwBwwzPUzAsWYGyvGgF+0dXeIM3hA8crnYy3aYW?=
 =?us-ascii?Q?bpeip2g7aE60SQsYN0h55CCm/6fMo7MtFgaEYffeQqW0PxvIjJLayuqL5HR8?=
 =?us-ascii?Q?P8bntf67UAAm0hd1Eqo1QWxjqvn6S8/S1mtc0pSkkKNgR9sMB69OHM7pttwr?=
 =?us-ascii?Q?EtvgUePtjJ5LJnPbGxXT8SULE9AmPtY/VrSrbhpd6dgFhYBWtadMz61HBvZE?=
 =?us-ascii?Q?HW1OwUSXAaaT0h0lv1eFRx050NijPvC6dV5NsO9YAZ5RhdFjUgFE5TsoPSXN?=
 =?us-ascii?Q?4kMN1jIHRaxpx1tzTtugCU0YLXVqTJbVoT7e6XQWdwgfWqlDv2mHMMnFbgwy?=
 =?us-ascii?Q?seIbggos68zmYUIAJfnFtNjIOvp26QPQhcVOX3p4j++5DQixWJBdrXwxg1xi?=
 =?us-ascii?Q?JHh0rQ4hIgfvG+MbrHhP2LCI5gHf/E9vSzRKu70oMmQw5VnpT3OrAU5MZ38R?=
 =?us-ascii?Q?tuWnm/UHxvwhwXiJGWpe+BdtnBGSPkJkILQsP9oxYMdfLQl6ra+IJNr8iPwh?=
 =?us-ascii?Q?VrsAl2YGT4vfsSwr2CW3dpxyQVZbzAMEdWt0mdOJTtfLECF2HskbXDvHPpZa?=
 =?us-ascii?Q?rxD6nfoYDo7rqQvFQwvhuTBcoL8yZdOGlzwTxm+YnOJr3glNvL8UX/mMLvZj?=
 =?us-ascii?Q?tkiy0NJZgUBg3GZopYw/kvalUmzMx1FNSf3mWOc7Y6qjtVNUdSHdnNLYAAe9?=
 =?us-ascii?Q?syj8lEFREXZZkIudY20=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uhYfhFVXzNFKQKL5GYZe+zAoMajOvVm107HK+qwaO6UgIsV9XUWBrus3DiQv?=
 =?us-ascii?Q?Iv6R62glZ6FuRDEW/iDnk5VN1NKJGorLP18RyzW65lbrIQL/KOYQhC1+7PTt?=
 =?us-ascii?Q?ZLdv4g9eaQVEG7Emgu799kggIRECRblWtG6ruE7aHPWsSsIPk16/xl17/C0s?=
 =?us-ascii?Q?uIJoESSjnTMpehwYdn/ZLlxK1PrTfsjx5AwKWwk57zYkFAwrC2eauSLrFWx9?=
 =?us-ascii?Q?2ftbrsH8Fmj2xEIaxwxefEhlSe/jnSLaJ63PGC8SBwrS5t4JYvH7W0QPtWwV?=
 =?us-ascii?Q?aZOV9xOUXDe8KuvaV8jMD15jUCJ/tq5SZDwoW8VlBXl5UPK0Ae+fytEWJ6xp?=
 =?us-ascii?Q?N+Ap2MFnYjGANlWZWqvFTM4C80CQF3c1/+GaBcEwuBy2x8cCHNITEfQXF9Rk?=
 =?us-ascii?Q?GeL1JYEjMEkjsEnu5LafI2BZsXnjPNDScwsDJycGzVFpmc8IYtYJkVUrnM2w?=
 =?us-ascii?Q?Ke8oCEZfmAveUR/i7wu0+kQ808/sJIk5FMRWJOLJdP/dTjTA2gnpKjtKhjGX?=
 =?us-ascii?Q?6FsXEvdE9EU2OdeApKXyZS6t1IGNySQPU4jS+gwFxvUF+9y0wk/pJ14n+uiW?=
 =?us-ascii?Q?qt1jV/wyKbQ2Kspi6ej+97DCk6uz4+tz1XnLwWBeRr70ltpqZNoNJwm49jNb?=
 =?us-ascii?Q?v5xO43cy0JX4iP7Nd06Do0xVHrVv+Q1+1EQWH8tCcbQbeuX5SYlFvZ9PD66I?=
 =?us-ascii?Q?L0M3t2BzHSPGWenMVl06xw+FOdl2fi3uzibUpUd1RpSinaAxuSYnX5TTsQWs?=
 =?us-ascii?Q?PYK11TiP36xnTM7QLoRs3icKloH0oEZ3Zbl2YvKTvQ/3+TNmH5asRwYVKjVK?=
 =?us-ascii?Q?WNDSVxwcNX4RAZppJXCbX5vhRTaeR2RuvTyh4otf+NOO6YArK39bRnQimDEr?=
 =?us-ascii?Q?ahJNMCOd0+1L7+o4OIih0FyvwHqoaAT2YyHaTVquVkKnAZgIPLMd2W8LVLYb?=
 =?us-ascii?Q?/Odw+amOjQnKjQOcCVR2uNTaqBCUESyFFOjywctrIgnIHFewcwMzJr8K+Fer?=
 =?us-ascii?Q?ER1avfEU+qcqzo1G8Ll6AcZxGJInuRMleoPDAqhOWmrbjd4BAIBLqH4ahvwV?=
 =?us-ascii?Q?CBrQHezkjnS/dknpvYTQfK3EbxC5Ol1vgd4qnuNWtOWoR/hpdQzCJXOfKyKM?=
 =?us-ascii?Q?34Rz02Z1fvVBx+2dTyZVodpaIuNIDytlVmBJn0lmB73YEeyAuaXz27tOwKc5?=
 =?us-ascii?Q?+hBXHf1Bx+ZuYBKy5Qudg/SHzEySqUElpiFqYjcpLOeLbMhLtzXKdGxC+xSq?=
 =?us-ascii?Q?zIwD4GsyOSiRPhACujep7dy3rk++YtJPpBC+IFf8fmZvoLpqYVI6U7mPrApu?=
 =?us-ascii?Q?RHF5MRXibNqJxxDcNMFOm6XDQcp8usavdtHqtIlf1ExnBlHM+Ud5yqc2KwQQ?=
 =?us-ascii?Q?NNzl0aHUNVnycSV2Y9ForlQSfXJ9VDbOxaNSbEZbtNNUO4xrbADXaETA75Be?=
 =?us-ascii?Q?EpWYsDhKh87YkNJPhxjNGz01pTr1GE5bE9OUzTl9/81M/jDwaSVGAEZXlsLp?=
 =?us-ascii?Q?PG/LVPv1eLsK38S/WNrZxhESJSGTtUNxdER4Y+bvpeadfvr33VJmaDLi7h+q?=
 =?us-ascii?Q?toyy3FUdzfGhx2ihzKPvRJOxLHuLbk1guRWPLp3xXIwH0cG8WXCVpasneoru?=
 =?us-ascii?Q?VPIoQAAqHcGhO+WthvDBU81RDT+LyOMyipO3FI62MaKFYXqaE8/sz5q4oCBa?=
 =?us-ascii?Q?RjzKDEJ/PIH9tEFA8RYSsTLcCp/ulrE4bpE58X97TjFLWn3vICMZWNgmzzsp?=
 =?us-ascii?Q?Vc72tqZoPg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9acd01-9432-4ef2-19aa-08de684eada6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:47:06.4721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E40NVX5N/wfsweXUIEplhXFcd0/xKBlIr/gA2ztfmIag4ZHiCn6sfdpE2c/vi7iUJYFXMl0I4O287rKa1Ni6Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506

Now that Hopper/Blackwell GSP is up and running, it's clear how to
factor out the common code and the per-architecture code, for booting
up firmware. The key is that, for Turing, Ampere, and Ada, the SEC2
firmware is used and a CPU "sequencer" must be run. For Hopper,
Blackwell and later GPUs, there is no SEC2, no sequencer, but there is
an FSP to get running instead.

This change makes that clearly visible on-screen.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 118 +++++++++++++++++-------------
 1 file changed, 66 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index aae5ffac262a..02eec2961b5f 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -162,7 +162,48 @@ fn run_booter(
         Ok(())
     }
 
-    fn run_fsp(
+    /// Boot GSP via SEC2 booter firmware (Turing/Ampere/Ada path).
+    ///
+    /// This path uses FWSEC-FRTS to set up WPR2, then boots GSP directly,
+    /// then uses SEC2 to run the booter firmware.
+    #[allow(clippy::too_many_arguments)]
+    fn boot_via_sec2(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        gsp_falcon: &Falcon<Gsp>,
+        sec2_falcon: &Falcon<Sec2>,
+        fb_layout: &FbLayout,
+        libos: &CoherentAllocation<LibosMemoryRegionInitArgument>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+    ) -> Result {
+        // Run FWSEC-FRTS to set up the WPR2 region
+        let bios = Vbios::new(dev, bar)?;
+        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, fb_layout)?;
+
+        // Reset and boot GSP before SEC2
+        gsp_falcon.reset(bar)?;
+        let libos_handle = libos.dma_handle();
+        let (mbox0, mbox1) = gsp_falcon.boot(
+            bar,
+            Some(libos_handle as u32),
+            Some((libos_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+        dev_dbg!(
+            dev,
+            "Using SEC2 to load and run the booter_load firmware...\n"
+        );
+
+        // Run booter via SEC2
+        Self::run_booter(dev, bar, chipset, sec2_falcon, wpr_meta)
+    }
+
+    /// Boot GSP via FSP Chain of Trust (Hopper/Blackwell+ path).
+    ///
+    /// This path uses FSP to establish a chain of trust and boot GSP-FMC. FSP handles
+    /// the GSP boot internally - no manual GSP reset/boot is needed.
+    fn boot_via_fsp(
         dev: &device::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -311,55 +352,34 @@ pub(crate) fn boot(
         sec2_falcon: &Falcon<Sec2>,
     ) -> Result {
         let dev = pdev.as_ref();
+        let uses_sec2 = matches!(
+            chipset.arch(),
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada
+        );
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        if matches!(
-            chipset.arch(),
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada
-        ) {
-            let bios = Vbios::new(dev, bar)?;
-            Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
-        }
-
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        // For SEC2-based architectures, reset GSP and boot it before SEC2
-        if matches!(
-            chipset.arch(),
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada
-        ) {
-            gsp_falcon.reset(bar)?;
-            let libos_handle = self.libos.dma_handle();
-            let (mbox0, mbox1) = gsp_falcon.boot(
+        // Architecture-specific boot path
+        if uses_sec2 {
+            Self::boot_via_sec2(
+                dev,
                 bar,
-                Some(libos_handle as u32),
-                Some((libos_handle >> 32) as u32),
+                chipset,
+                gsp_falcon,
+                sec2_falcon,
+                &fb_layout,
+                &self.libos,
+                &wpr_meta,
             )?;
-            dev_dbg!(
-                pdev,
-                "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-                mbox0,
-                mbox1
-            );
-
-            dev_dbg!(
-                pdev,
-                "Using SEC2 to load and run the booter_load firmware...\n"
-            );
-        }
-
-        match chipset.arch() {
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada => {
-                Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?
-            }
-
-            Architecture::Hopper | Architecture::Blackwell => Self::run_fsp(
+        } else {
+            Self::boot_via_fsp(
                 dev,
                 bar,
                 chipset,
@@ -367,9 +387,10 @@ pub(crate) fn boot(
                 &wpr_meta,
                 &self.libos,
                 &fb_layout,
-            )?,
+            )?;
         }
 
+        // Common post-boot initialization
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
         // Poll for RISC-V to become active before running sequencer
@@ -380,29 +401,22 @@ pub(crate) fn boot(
             Delta::from_secs(5),
         )?;
 
-        dev_dbg!(
-            pdev,
-            "RISC-V active? {}\n",
-            gsp_falcon.is_riscv_active(bar),
-        );
+        dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar));
 
         // Now that GSP is active, send system info and registry
         self.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
-        if matches!(
-            chipset.arch(),
-            Architecture::Turing | Architecture::Ampere | Architecture::Ada
-        ) {
+        // SEC2-based architectures need to run the GSP sequencer
+        if uses_sec2 {
             let libos_handle = self.libos.dma_handle();
-            // Create and run the GSP sequencer.
             let seq_params = GspSequencerParams {
                 bootloader_app_version: gsp_fw.bootloader.app_version,
                 libos_dma_handle: libos_handle,
                 gsp_falcon,
                 sec2_falcon,
-                dev: pdev.as_ref().into(),
+                dev: dev.into(),
                 bar,
             };
             GspSequencer::run(&mut self.cmdq, seq_params)?;
@@ -414,8 +428,8 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         match info.gpu_name() {
-            Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(())
-- 
2.53.0

