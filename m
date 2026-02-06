Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013070.outbound.protection.outlook.com [40.93.196.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D3C34B66F;
	Fri,  6 Feb 2026 04:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351759; cv=fail; b=mUjGcE/Hx3XUkg9p+VqeE8jDGUSlhqyLRFG3TCyR9LXKZ+KPBhlXmEGz5nE8hr/9YEelUy4am1W9enLmeAQ5n0K3PF7I99OmhrzY8wgNAZQh7opFcOjQea8u72TzGDeKL03RLD52PVbCJTAUIWccr0TkeTm/ZbGMej0Gw9tYz08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351759; c=relaxed/simple;
	bh=5qbxk0tXfzTJwsL/MFKKEcmFT5pq/DS5Z4UEQvBQuG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=llAzu/xAgxFzoUZcXsIempeof7QAqYN7RltyiTBTO4aQlX9CxKLccM25V/umV9i5obUEnE21YvUkiA6f32fmMsMo7ki9aebGcYxPowjpQG04EQlNjxos0dhSXSF247m3G7yNbzBGrPe+SHFhL8DtQx89dYkPSq7EkqwoJs3CFIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hfa8Skhp; arc=fail smtp.client-ip=40.93.196.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hfa8Skhp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6NDyBXiUNvLtfxEx5Vpbd10d6hB5nGeE24eFrX0A8UcK7To4FHbZwuya79t1mwJmyG9cIII3ArWJgVNYC8c1EJ0OSXIMh8PSjdyNFmcdMAQkoMa/BPSOohZSNoG8K4YdC6RL6IbMUmBe62UFIzFyfakWLEL+WyFxGsQijW8EfV+87d80BMJBQU/R4bwo705x9S0p3vcFjMCeNssWPx1zjKQtAm1PlxA++Q9/3fmQGOPOrla5ycWeVcTkIbV4aIo/1gcjAADsMm5sVRzXoFcpBWH9xzc1Nh0RkzHJvmTLUSyar9VI+b1CmeZuWj2FrbaF8THzOv32vMHusGrcHcjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAI+8U1aYwksD1pxvHYZ1IM8bNkVQwR2xB8WFxUvioU=;
 b=tH9UmlduQ3OywcgGRRs0STBc8JaDxGnwMlI3ocHPcJN/yrsAZNsosDAgyGszO3dW1hz+hzNrjnqyuvfNK2nSzQRPE6oARE5xyS9fJ+Jp6oHgavEYATzfxOxydjoAGXwNsFeBG+wMWlpSuGLEGrKLG2RjdfwQ8Xfal1KzxwRAxdpZyB4vUJHvzIXLt3PH6ZvpNG+pnBajyGy5WsvGh6k2jHF8Fr91NYSNnoswb7FtJ5HRmJrEEwL/kdmypAfS5A6DY+iTZ3z7zJ6Kd4Yvvb2VPkFPFcnruOFasVgxoQVDYFX6j4ixgsJLiiGIwdffIFwtv7R8uUIcBvzr6/0yMLK0hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAI+8U1aYwksD1pxvHYZ1IM8bNkVQwR2xB8WFxUvioU=;
 b=hfa8SkhpuBBdxiDUTu5J/Pbw/DL718s1XjNzifhqjWI51bqwYcHVy1s0xfE5i0+qS0W9ZicV21r5Q1Oo6DT7T4QQmtVhtxyVuc77JdpfJYsQFgZDNd1znAxgBBTqICPfzBrMnHGku8Sz6+7WzRnGcW9jA1Ua9l3TCHQkegi16PT/oKg8ag1PwAy4dElf3c+yyIp8NanCwmhX/d2O57xX3t1rnfK9Dsy4i2qD5VkzgdInKIHLrGOmm13GVG8DLiF/aHINJNStKkgucOX5cJKrBu9R6XPRcEPoLcL9jeg9w049dUrPmapIkbqsFBYgS0wk41qXTiEbkP62Z6jve3/xOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 04:22:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:22:35 +0000
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
Subject: [PATCH v3 30/30] gpu: nova-core: clarify the GPU firmware boot steps
Date: Thu,  5 Feb 2026 20:21:23 -0800
Message-ID: <20260206042123.303281-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: d247c40e-e639-45f0-e801-08de653748a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+F0EhwUwVR9gP7mt+sk5D2gq7A1Pl1c2ZsOS1/GQHAiPANOI+ksetw07ub2T?=
 =?us-ascii?Q?5uamgtRGMJ4WlcLvA0UbTFIwABXpSIVEUA3S/45lxFLeSTzMk8LGhqMvDD9u?=
 =?us-ascii?Q?dsDAbqt7SEG6Ihkanrkrv0PpdZuHp+uxcOgCNrzjazIsXU0dFva0glaY3O4T?=
 =?us-ascii?Q?stYuhMlLFQnYmCAVeBmEv9iobMILxVKGv3f3tW6nBJQgXUrwEUaIZXjtCsYL?=
 =?us-ascii?Q?V6j8WXOnCuB2h97IzOLk49ROyTb+2ixIHfZFygrmBxKpaCqtkIwP01zObxMe?=
 =?us-ascii?Q?CJAndRLfe0QxSlw9WocszQlt4QdGazmdSK7mEKc0Qk+DxkoiisEblJujMSGy?=
 =?us-ascii?Q?3VOjU419mby/XbDpuM+H74EhmALS8Ka75QvobIT3aLX6dXRH5Fj40ulUiWix?=
 =?us-ascii?Q?0c4j6Ov3XXL2M1HAvt74MZQ8H86kwTE0ERAfWNWiCvaRKOtdiNp+7aQsfMyM?=
 =?us-ascii?Q?jVrPsVR3hoiPztUkvzsumX6MnQnNIULwCnreKNc8jK3wmMBgtW342SWSUaDU?=
 =?us-ascii?Q?QnpZDttExl38Ut9J6If8E4C/hVJ/UapXeETo4CRxuAJ5kGzWRcN4PfCbiEHZ?=
 =?us-ascii?Q?IXNuCU8QiGHsXIraNrgy2GhAery2wVHUL5/rkQNIOmcAO1+NUTJX6Y71/zKg?=
 =?us-ascii?Q?+MpZLgLDs0ntrWOUac67FomD/6U6hgIgwWfLv8CZo+9TFlnv1yICCUrc33xD?=
 =?us-ascii?Q?GT2HBawYWuhBlYvW6YDyCIqvsVIarFBskzO7TB1O2up7piAKar0wCqcy6FpP?=
 =?us-ascii?Q?yrooAtSRnll8pfa3uNiDK2lFwNuTX/2SqwiWTsc6xNL0BGrXrouXWfLnj4Bf?=
 =?us-ascii?Q?WC1TGW2zVwSpKvU8xPvgz0122mqaAQkgFL+Ho5FEF30DnomGNOJxHE4IvYZr?=
 =?us-ascii?Q?KxpzhCJ02rIEYegWK8ZK65drlo/wypldnjXYLPfMuko9i+VCEejQwgzwFlvj?=
 =?us-ascii?Q?UwuXb9Aa8ZGbfQhZVJlzTb9gTcJx2Z2i1+RfVOwBQ2Yf9syZrHDVX73cZpf1?=
 =?us-ascii?Q?sWzDOHrYyNMCRB82cwK9vce+v+y9jii4ZPprnm/NOQqgbl+k49MWelZDJ8hY?=
 =?us-ascii?Q?B5vA88L0v0lMmf4lpt2W87aWLLKw/xDO5oHWQnaBPX+mHxhGa4ILy/0NX4eP?=
 =?us-ascii?Q?2bCVFBKlJPYCVrDfz0t0rO8XtPjEX4sBha10rLYhoSaRxZEC4a4ws5zlSI3T?=
 =?us-ascii?Q?OR7jAW33foHhmja1V+nODTBcgTgvl3G/lDGorVUTIquxGmQWec7iC0Geu7fE?=
 =?us-ascii?Q?zE4sZQubHj32XPWVlQZAC1OXk+02xx0ZBHnnhtTuMrXY3SdNNWqWYHh24Dga?=
 =?us-ascii?Q?+dFi8OvS6YZxhHQun22R1ABHctYlescpuyR1l/TGVE6G/wvlhD4017GgiY2Y?=
 =?us-ascii?Q?q8e7cvLbxR7h39D1dlQNMbG+0smStBrvWR6mdk05Udj5bWy6yUuP0wmFPFH1?=
 =?us-ascii?Q?28dF9IlU62PcZy3ZErsa7a2IPwJOQunj5GlgWIT108pfGikfaE1lg+UaZG47?=
 =?us-ascii?Q?FU1olAQUzoa7TlKwgvjjVH3R9cYlNWPGOEQvkkPqTPuszDjKyypbLq7clfUN?=
 =?us-ascii?Q?ZRF7EHR8BFZsS4XUSsQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9G0xIeaIav0ikcwDyrsc0e8Nvljqjl7HrMphR6RidmCBqlRmDVwlhYI0eNTn?=
 =?us-ascii?Q?5fObBRqpAJbtXhj1S+nPd7cw/j/oQVOIdbF+Qs6pEazSAX8Y2yhfwff6p/O8?=
 =?us-ascii?Q?AFwYorY4MpnTALpbDq6rYWWrcxOprfRwDUh5mhY2MOBEE+4LTz0Hchjq669E?=
 =?us-ascii?Q?nYLQ8CT+DnczJaFihNK6nCia0KugmDUY1mKCPWSqxoL+wqsFscJyVDvOWCql?=
 =?us-ascii?Q?XrklJgNqdV1uU69FdiooI3jl3Suv3cqVzvT2n/SeUEx/jaWLRYMxIQurxQog?=
 =?us-ascii?Q?uVR011XqjRL6rxDcLkse8V8NzmWDiJ4qF2o/H/5t2CmH7bRRXP7/MCwn3lKJ?=
 =?us-ascii?Q?FP8UsQSxjxDE/AXEHmah8dohbyZ1RlQ81Ijmyk3JewF4AXODM0UDNmWJFB3y?=
 =?us-ascii?Q?QxcCnVjsB0kocf4GyEswRmGISqb4dki7E3j8lwl6l6rdLLARfAgQq/0Hk2YO?=
 =?us-ascii?Q?DLjAaAfsmulVVBIXspSyckfOx84NopcOvw0Mbj+Kh/RCQQf48tll0onNCtiu?=
 =?us-ascii?Q?bltxcQjm6TWooIZNufhPiTHcnWWuyw4Z2TEnk/fjo+2RW26MZr+tg3e5M2qJ?=
 =?us-ascii?Q?PFcGYSdWy+9GIqyVgvyFG6umMNCX/pg0GDoPW3F1XSgWGgWW5VB8a8BGD4Jx?=
 =?us-ascii?Q?lBqw1r606snyFF33ilZbuBjCbUeGULRAyW6bDjfn6bmlAqWWz1WxyIvY2vv3?=
 =?us-ascii?Q?VZbZodbkVhPMIY2sBsLdmw3Ybay888DsWpGHrtZsALnL2jUEheUHWpDP0cp+?=
 =?us-ascii?Q?+092Mbz592vbsc6PLEM1MW2rne4Y74TMIZfRbsSns4y4SKiDByBIBuZm8DjF?=
 =?us-ascii?Q?EfK43YnZuHgfLsyFgXEkJjyJYlbhKYzjegQ9AnAiUH96IlzOqI05wv6Otx9j?=
 =?us-ascii?Q?Za+8v0PdRq+CDtOvwbar/h4ToZ1lCXKcpYf3iurD3oySa23PwgCJlsyIMx+w?=
 =?us-ascii?Q?D3zUXpA2/+152kcz8PidC8kb5BB7zJ17XcRtKxAdC+krSPJF4+sjVDxwx6jk?=
 =?us-ascii?Q?ByruxmfEdVJFuCHltFyIy6A55b7KgOGVUC+ZcJr2zqXLRIgZgEigSC/yPIha?=
 =?us-ascii?Q?4+pMQ89AlK5yPgFzcthp8GQI9vcKOh/dKhOmhwZEMInWTbEDjF3uz1PTC4+Y?=
 =?us-ascii?Q?RI365ywUhu2wm9L6dVIp/OMo2vmDMQTTDc9Q3IYO1Hqyr/poufarTZC+DGus?=
 =?us-ascii?Q?uV1eJe0IsfzJieVg+VGwU7GwW7HBSaJpja4uTE9pHqGSxatYbxqmx2ljahTv?=
 =?us-ascii?Q?36vGaBUHfH2jNbhSDUQGgpEN8HWG+fsQ730fQ4xC7lqnIByTLEGWzSNKYwVF?=
 =?us-ascii?Q?3wHoMj2vkBgiN59lLQWm+dsRemAFMiC0/2mTKMin97eos95eAuMWfzI5p1QF?=
 =?us-ascii?Q?QEmUvmL7U6lhPMvLiRW8Aonfw+5soMW1Ltld75Bcz1AtAiGgox3ScixXATWn?=
 =?us-ascii?Q?uMlwYDlBdzc3dR7UcMWDyOgmA/PaNWqCMty24jKH2JuuesagNDMlHs9xPCUQ?=
 =?us-ascii?Q?w4SSZChtKK0jRZebMhQcJaZgKboVTENsXwIZWxZT6cvHybQhOc08gjeif1kS?=
 =?us-ascii?Q?MkJaQdqGL0E32cNcuk+IhKbfT9nsGpjRbIMbX7/8DtiiGv5LNDd9yzrRpHBg?=
 =?us-ascii?Q?HtHDrOrRsaEWsewwpSElsm9MaLJyQWH5A8g45acjJdsIQWygJdbHOkEQdwSu?=
 =?us-ascii?Q?80KmRXQJVNmXiC1kI0YLZCO3wPFNgjaWfGYUP93TDrCwIJQmswDiMiBaYMt6?=
 =?us-ascii?Q?rPl4uKWYNw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d247c40e-e639-45f0-e801-08de653748a9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:22:05.1517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmrFEhAu3RL0bPoKCdvOTwlUxzJ9WKtSqs/7AyHJlD7THGe0jsTRxlKXxR/eAgFdiFkUHI2zdjlK2BtzfKrG/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

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
index 04b6141a9c38..02eec2961b5f 100644
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
-                pdev.as_ref(),
-                "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-                mbox0,
-                mbox1
-            );
-
-            dev_dbg!(
-                pdev.as_ref(),
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
-            pdev.as_ref(),
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
-            Ok(name) => dev_info!(pdev.as_ref(), "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(())
-- 
2.53.0

