Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F236338932;
	Fri,  6 Feb 2026 04:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351699; cv=fail; b=Eo/7nlcALyq8MgU23DLVV3YS9I8dPKKYDQ2ZYctxkq0mngwfxvF0FVsY6hJKjvilCZ574TU8ZdfBKU02MPStdeDnxL0vDzpvaRMLviCCCdTyh4F5yt/jTVsBaRDgSPEkFEq3l6Ge43Fo1FJD6gbn03TXPmYE0cJR7/jRm8g15mU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351699; c=relaxed/simple;
	bh=z/znO/BfK6g6IV3FtTgmoKDC0c6Z8kmIRF5JbZxx6fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aRjtID7TWi4bhdJ/qsjhen0OTkKzAlBHc1d1tN+QZIEEYBBmowHnkeiPak6RZVAX/zluhw9cgyITfXWpkiTSEDDfcVB2ieGrLmOaBM5Pm05oiLjw4l40H8jV5wqSsOnmA7l3M5+/K2QmXP8tyvaQEoKgiWQgt2rWiz99KZb1gCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pqxzb6I4; arc=fail smtp.client-ip=52.101.61.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pqxzb6I4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YM//qQ5hBesv11nebpC4ys6nCnfEr7j4rlZ2TJONUgz+pQc7PUYPZQAIfWykgYAcr0Wmzsvz7oJBSo0+IBSCE0quQc2+LS6FPxd0EgqKJ0+45Pp+LNo8BTB3sSRY3d73qDDCnGPkte3PL26oKSTqGjllBZ8PDAhg1x3BbtEut8QyqAOh0lGFcK1IJweeWQwEm22R2uGSNARFPWf1O+Nr16Z0nXRXFv03+YWqFaCrFuRZBna4GQremZ+gH+VZQw/RVZ1eGc5FhHhxtmIP3rSKrxNE7uVH+48s0QX/7SKqTUCPQK8JIEWPo2O00jwZI5pX3egAWbgJiO+CTxEOSNCxoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sm8Es4MMc0wDmAoNqriBb35y6luPtZ/PBryqnIqeEI=;
 b=NFJTTkHH3Es7tcTrdXRCunjU9ayevIzvC1f3tnorvLDbbqotmb4y37nFwND/tM4J2PkrPBPrmYZdHSwdR9ZyqY3gANe/yu0TvpXTb/sCjFMsxOCoxTDY1n4pX2OHIJaQVxipwSSuUse7+O0Yu8ox6zcRLfp55bZ65OtII6LRMth+hB83zpn+Ggw100V1n14gKSbl0QKbfgIyvPXG/QaW6HHmZCgLhhsa5xUJU61G/Fo6h1MQUSkKWqBvI9HyHLN5bnjFVMZZhTZwSMUXRvK4FIdM+ZLhfw/jE1SBmXA8tFXUi7ZJiwWQs+A/um+5rlhRz912+F6b6wwEOipKUwvdVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sm8Es4MMc0wDmAoNqriBb35y6luPtZ/PBryqnIqeEI=;
 b=pqxzb6I4TXn8WYQR2jCcCn0bmVkoe1uIc54kY3JbIETw9h166O7qxmN+JI3H6MCPTt4Oja5oA84dvIS2ghy+2AAb0tYsPLuEjuhSybPOOvGgMmsQ2BPX+UZ+v8QINQ+wb6uqhLzIUI1ese/81ytzRpXsjpq5S13RER3rM4Mryim5+lQ73eFal2Jy0blA2CFVGmrXxYKbwgTAqo3RJ/JsM5IR4/XFUt+Xs5jMLCWlVUegNMQxIj/MPAeLl0bQgEcwRYcdXL4dByTJXfGvvK/ou1Mr8vNmVfgR5C0i4kKAyGEssCugg0lbBdkGNqSi6eHUwt71/ekVTEHGYGi9gL2Xcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:35 +0000
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
Subject: [PATCH v3 07/30] gpu: nova-core: set DMA mask width based on GPU architecture
Date: Thu,  5 Feb 2026 20:21:00 -0800
Message-ID: <20260206042123.303281-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:217::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: c6527fe7-ba32-4ddf-68b1-08de6537371b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WXqn4YQ3FSEhgjdEbZGyh5NSpP3F/+MkcO2P0YuE8G1wkxw7F7tH5OkePOXz?=
 =?us-ascii?Q?2gAwUZDnU4tTJ0w8ovxkvTKQofCFUkzIGTd47IVQCLyxXyg/29qg4wAv3vbG?=
 =?us-ascii?Q?yTQP8/6sUMpjAAEzHAxH18dahYw3/mHQd/QF6OyEUDje74uGD7XKAw3OAvnE?=
 =?us-ascii?Q?muNIu3KZ/DAeKEj2rFPWC8r295thIic1JGug1sNslaSJhruNW9f5a2b/zJMC?=
 =?us-ascii?Q?qJrI8E04V8iU2Ygucj6QCqlVhhUGH/anLGWwRWMG2jK3AiVHIdRR/4eEY80P?=
 =?us-ascii?Q?Nyup0A9nJ/ofvaOaERvsf+4jLrX0J31+j6HDW2kFv550tgpqqyB1HfZdXfuL?=
 =?us-ascii?Q?C+D+s8SSeR+HgbVGcrn483SM9Z9Dh8RlFaHqM+g2UEMntoi6mUOAlA+RpFVJ?=
 =?us-ascii?Q?MUoueOo+flUV+TP7Kf02qz+GdhNQko3A+YcqKbrC30u7IReJE4VUMyFKcq24?=
 =?us-ascii?Q?IeF+HusCqtm5XOoQLrcFn37Fi7uzjeS5MJsi0RhtBDWi8US3H0gUQUGwwYwu?=
 =?us-ascii?Q?BF+Y/558TnssLnODOsgVz+ZVdeXP7P89NGDtS40ujMvusLPeMS/2ShTJ85Sf?=
 =?us-ascii?Q?ttxkrZY2qUVbqyFA5HlkmJn2oCDSe/CJTbjVHSPLBn6p8kRf01mokjKNndKV?=
 =?us-ascii?Q?wZEFpQSn0pLkIrRqvSIHd/3saJqbNrCrB8vQnmiGDmMFl2NURLs26tKWPzkL?=
 =?us-ascii?Q?G8bpDPjDWsYxWEevpYCMaIBDCzp/GLr/8/H3U7JaVPSC7BP7DeZYqxgPeLyz?=
 =?us-ascii?Q?MT39la9VvRBbDuKrxmD7k8JXTTbCSSPKh9/NnIssFIzTcYpXCq/P5Is2E5iq?=
 =?us-ascii?Q?Q+eFL7XN5w5ua0Oly5zES+XmudwEOvToKD5CnxmfEHnS4TjBRkDFhxpF8Ltp?=
 =?us-ascii?Q?WxNEkPvqMKMVEeVs97b7XDYSnpuTnyPSJZHD4k3I8GzN+sdrehdFKrI33tZ0?=
 =?us-ascii?Q?565X2JLwXFatMqdlQ/uX+NMopaILPhcd4317xT47zHgNYrp1kK7usvRTyUF6?=
 =?us-ascii?Q?fCTlT2rS9uTgrBk7d0d3wNnUEI0HqYE21w6AgGa47Pw+HrqHW+Zxc8xaYRvK?=
 =?us-ascii?Q?v6SlS/+RLz9hBGWrMwZQYlG3MgrNFUrnNZRgHkuU4lWLKuwn/uwgi28O3OcV?=
 =?us-ascii?Q?VYy9mPcXdR3Hg1Kl/lNdFZiKv4jExda9u2ySx1XbsQR3mR+P3+AU4Sg4krbm?=
 =?us-ascii?Q?ui3562GphXTywvvqPJM+JQnisOn+W2QPxqVGr79r0RcKsRgxtRS/QtFcftjl?=
 =?us-ascii?Q?KN9uKkZyWkYTZ+kCqLDc57ij/VyMmK4rrS2stpVXC/J1O/mxGbsucSJ2zle9?=
 =?us-ascii?Q?HdJcs7F8iQq8NhGN3fmAIJThu6Sichzp9lgN2H3cbHSE/ffisYR6spfzcL0k?=
 =?us-ascii?Q?zb/lTUZKz4hOslz/fqB35gIz+VVRo36flfy3bbID89aCXW0q4uyQ9U8y3F9S?=
 =?us-ascii?Q?T7fviQpmm9yVL7IXtFXiZYfXdATinpCiblM4AzIbNO4StbIYXdFE3YFU1JY2?=
 =?us-ascii?Q?8qRATyS0VPgqqHwNI9IYDEzWvnrh5pNyo1lE/697hxsBSjBB59CtZeQV0ugr?=
 =?us-ascii?Q?R4YW+/C3gthoZKtYx+k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qezGFvABh4Rcp3qDLHv7D6kX4aOqxnVEA/BOWsY8/32mwvYbAmtGBeT5VASz?=
 =?us-ascii?Q?JfiA8OXgSyCm0jH5pgxrLuArnoPaBP/bGB5UxqrBbi1ZRVE8dx5unXtOvCTR?=
 =?us-ascii?Q?qWsP0syHiNbAiJO2CsBdX/DHV5EiN6FSlNj8yP4gjpJ86m4x2Ton3PL/weE6?=
 =?us-ascii?Q?HlCtfdKFQx/puOhIEMoKtujKbGQYKscJg4QCP1gOqH/O5HSjSkBa+HxIgtxu?=
 =?us-ascii?Q?C2lsp+wN0CRE1WLCnfAON4UyTDT+KuTlHJE2kKX0phFu8SIUIRGECOmnVCng?=
 =?us-ascii?Q?jxqS+JTi2HJNGcSr/tNOOeqdBzkEi794kokn6EK+diFfSe6KR5rY2JKfdiRG?=
 =?us-ascii?Q?S7kjMLhjhBVVnhLWFaskH0txRlvUnYEq7KIdc3Lq0Z2/AHmhy77TLZ+NDNcV?=
 =?us-ascii?Q?6MWFzxUokmZYPyo6gs0mIViRjN9ZjXu4+k0BhyZU4IQrGnV6JnJyKuurZXMq?=
 =?us-ascii?Q?PrACNh3sLRwCH/JF12HOOznInZxvNsulrbzWC8To8clxoklNV4p75aUm/r4k?=
 =?us-ascii?Q?QGeJVdBIFAPHhOke2q24dRDiYtI11LG9pixOG5iJo58I2V3MLPX26BNNGGKT?=
 =?us-ascii?Q?9ihIvZgeVeFI4Jx8QMwlnPJasDve28SCBuRjiD2roFAF8cEicUq+qUigNBQV?=
 =?us-ascii?Q?0ReomGvC9mWoxenH5s9CUIV/PR5rkFNKhP35X7x9ETS5y6LZqyJFtxCzB3bM?=
 =?us-ascii?Q?tARmqc2kPE31oC/ceCCHVbwL5yHh5oGgZl8D13NRxJyiJC++ZZQQFBZfSf40?=
 =?us-ascii?Q?IIDeNsHR555dhmJES62wUzuONb9EWqRiFamiAn7eFa9LjXU1+6RTHddCAzVK?=
 =?us-ascii?Q?xkvHEv2xm7LvTWoDouhEH0/V954XWsh24KavCXnVuoEeFYrYKnpWI/3SfZdf?=
 =?us-ascii?Q?/ukxnGhpgOlRu5I0FAspw1oDV4oT8iRqYG/rRLUeOxCexaDJi1uOiDW/zDKI?=
 =?us-ascii?Q?97GcM/aRXAFljC48Fl2KxT79uAwbVgAfmmjOAXlbeoqSw/9fp/VzVuC9c0CK?=
 =?us-ascii?Q?BrufzyXeXk60f0Oyry8FaHP0CBXbVvbYw9kVLKnSckc9ZnjYuRH8VsSFyu+m?=
 =?us-ascii?Q?1vBFNwwUpRgCOeEU/FxHkZ2tHsK0QaNf/dg2h5t0dnjyegmWYsrZqnKI02mL?=
 =?us-ascii?Q?+BHIQjq8ruNlzhk6Ka3b0KCiJW728MOX/VtVJdAdg/awplw2HLfgeFNoLe1q?=
 =?us-ascii?Q?MblZxFq53PERbhwGwnNV5UCugfrE96isp2Nxv/xCgLENOrr1AnWRaa/ZXEvb?=
 =?us-ascii?Q?GK+6MTWmc09FpvLiLJIGza1S//QuhwgSTcNSFzp9eMn5T/eDHtIrc7QIaOl7?=
 =?us-ascii?Q?AkZwOtXHWbJ8oepT7Li9nhUGkfCBmEkP58+0oHC6DYx920fJLSNfPYGm+GXQ?=
 =?us-ascii?Q?70XVXvs3rtmKQisAu6opMgXHVkdGwc/4ArarWHSjeszTgvlQAlwmawUdJ27s?=
 =?us-ascii?Q?djq6rDlI3Xyli4g7khK0E2EZHAy3kXscszb9cygL8p7EN+XCzhkVnCI18K/M?=
 =?us-ascii?Q?YGU7S5eQeYOGnr+cre673VRa/8G1skriEjSBzkRl8jWFcKVz/O0lVvdSsnYH?=
 =?us-ascii?Q?uIi9MVTFszDHC0u5S1oTq5+3oBvHkC88DxWnR71rBT2z/RN3GamMDuGZ/6YZ?=
 =?us-ascii?Q?4FKwyCD2xwHANr5v+l6NuTXKp4T9j4MnAm6EOnzYqUArhAkFt4rRx0E8+toF?=
 =?us-ascii?Q?5VVA57HFeb05BpSNQ76GO51BHhFZTbVZunOezWqaazmi+ldCHdlIr/xbzg6F?=
 =?us-ascii?Q?Uy/AgyYQLg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6527fe7-ba32-4ddf-68b1-08de6537371b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:35.6874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oSDM1719kdcDyTP4yGl3k5vrkxCIj+DCpKM0o7AfrlsmYdO+6zkJRHRZ6ErSkTdpE0hagKMCJ+LJlOwtr0FS5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

This removes a "TODO" item in the code, which was hardcoded to work on
Ampere and Ada GPUs. Hopper/Blackwell+ have a larger width, so do an
early read of boot42, in order to pick the correct value.

Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 35 +++++++++++++++---------------
 drivers/gpu/nova-core/gpu.rs    | 38 ++++++++++++++++++++++++---------
 2 files changed, 45 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5a4cc047bcfc..d67104eda6a0 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -5,7 +5,6 @@
     device::Core,
     devres::Devres,
     dma::Device,
-    dma::DmaMask,
     pci,
     pci::{
         Class,
@@ -17,7 +16,10 @@
     sync::Arc, //
 };
 
-use crate::gpu::Gpu;
+use crate::gpu::{
+    Gpu,
+    Spec, //
+};
 
 #[pin_data]
 pub(crate) struct NovaCore {
@@ -29,14 +31,6 @@ pub(crate) struct NovaCore {
 
 const BAR0_SIZE: usize = SZ_16M;
 
-// For now we only support Ampere which can use up to 47-bit DMA addresses.
-//
-// TODO: Add an abstraction for this to support newer GPUs which may support
-// larger DMA addresses. Limiting these GPUs to smaller address widths won't
-// have any adverse affects, unless installed on systems which require larger
-// DMA addresses. These systems should be quite rare.
-const GPU_DMA_BITS: u32 = 47;
-
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -70,23 +64,28 @@ impl pci::Driver for NovaCore {
 
     fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
         pin_init::pin_init_scope(move || {
-            dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
+            dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
 
             pdev.enable_device_mem()?;
             pdev.set_master();
 
-            // SAFETY: No concurrent DMA allocations or mappings can be made because
-            // the device is still being probed and therefore isn't being used by
-            // other threads of execution.
-            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
-
-            let bar = Arc::pin_init(
+            let devres_bar = Arc::pin_init(
                 pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0"),
                 GFP_KERNEL,
             )?;
 
+            // Read the GPU spec early to determine the correct DMA address width.
+            // Hopper/Blackwell+ support 52-bit DMA addresses, earlier architectures use 47-bit.
+            let spec = Spec::new(pdev.as_ref(), devres_bar.access(pdev.as_ref())?)?;
+            dev_info!(pdev, "NVIDIA ({})\n", spec);
+
+            // SAFETY: No concurrent DMA allocations or mappings can be made because
+            // the device is still being probed and therefore isn't being used by
+            // other threads of execution.
+            unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch().dma_mask())? };
+
             Ok(try_pin_init!(Self {
-                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
+                gpu <- Gpu::new(pdev, devres_bar.clone(), devres_bar.access(pdev.as_ref())?, spec),
                 _reg <- auxiliary::Registration::new(
                     pdev.as_ref(),
                     c"nova-drm",
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 289785530ad7..2e7b90b80877 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -3,6 +3,7 @@
 use kernel::{
     device,
     devres::Devres,
+    dma::DmaMask,
     fmt,
     pci,
     prelude::*,
@@ -102,7 +103,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
 });
 
 impl Chipset {
-    pub(crate) fn arch(&self) -> Architecture {
+    pub(crate) const fn arch(&self) -> Architecture {
         match self {
             Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
                 Architecture::Turing
@@ -155,6 +156,19 @@ pub(crate) enum Architecture {
     Blackwell = 0x1b,
 }
 
+impl Architecture {
+    /// Returns the DMA mask supported by this architecture.
+    ///
+    /// Hopper and Blackwell support 52-bit DMA addresses, while earlier architectures
+    /// (Turing, Ampere, Ada) support 47-bit DMA addresses.
+    pub(crate) const fn dma_mask(&self) -> DmaMask {
+        match self {
+            Self::Turing | Self::Ampere | Self::Ada => DmaMask::new::<47>(),
+            Self::Hopper | Self::Blackwell => DmaMask::new::<52>(),
+        }
+    }
+}
+
 impl TryFrom<u8> for Architecture {
     type Error = Error;
 
@@ -204,7 +218,7 @@ pub(crate) struct Spec {
 }
 
 impl Spec {
-    fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
+    pub(crate) fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
         // Some brief notes about boot0 and boot42, in chronological order:
         //
         // NV04 through NV50:
@@ -234,6 +248,10 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
             dev_err!(dev, "Unsupported chipset: {}\n", boot42);
         })
     }
+
+    pub(crate) fn chipset(&self) -> Chipset {
+        self.chipset
+    }
 }
 
 impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
@@ -281,33 +299,33 @@ pub(crate) fn new<'a>(
         pdev: &'a pci::Device<device::Bound>,
         devres_bar: Arc<Devres<Bar0>>,
         bar: &'a Bar0,
+        spec: Spec,
     ) -> impl PinInit<Self, Error> + 'a {
-        try_pin_init!(Self {
-            spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
-                dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
-            })?,
+        let chipset = spec.chipset();
 
+        try_pin_init!(Self {
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
                 gfw::wait_gfw_boot_completion(bar)
                     .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete\n"))?;
             },
 
-            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
+            sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
 
             gsp_falcon: Falcon::new(
                 pdev.as_ref(),
-                spec.chipset,
+                chipset,
             )
             .inspect(|falcon| falcon.clear_swgen0_intr(bar))?,
 
-            sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
+            sec2_falcon: Falcon::new(pdev.as_ref(), chipset)?,
 
             gsp <- Gsp::new(pdev),
 
-            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
+            _: { gsp.boot(pdev, bar, chipset, gsp_falcon, sec2_falcon)? },
 
             bar: devres_bar,
+            spec,
         })
     }
 
-- 
2.53.0

