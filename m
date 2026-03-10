Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011040.outbound.protection.outlook.com [52.101.62.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C5733C19C;
	Tue, 10 Mar 2026 02:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108714; cv=fail; b=RNi7hBaISZ1kIOtIggvAo8R6KfLd5amLU5DDO4jiSQ7xQbwnDc1QNKd6nu2TXuKRBdyP+Z0BMpXnsK1b6AVFkOv+m/kartLprL4BLN2GmXwdsI3GwMqwIBp0cCm9sWTRR9FegjMZdnz4r0prPjKMZjTGhkWTZQrUXxoMXpHaomE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108714; c=relaxed/simple;
	bh=Kx0q5J+3eSaQtGfgwqlDLXL9x2PDTCWjLc3A5uMjqcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DsDMwcwVIOCkdQSnoNCrYLBvI4EJEE75SbNxLlG4wk7EBwWqO4A/08aKC/gUfZrD47otLdadN2+ei80+awoHyXoaJRiLS4RshHGoGNreBjebbBLVFbqK0QllYwAU7B6HXPTayUcuEZ/40eXKf3alXdRLxATXIhgH5+D1CBYoSaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tZoA5Q59; arc=fail smtp.client-ip=52.101.62.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tZoA5Q59"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbiusZSTXYHJpdmr2ij2Wb3X6EGcznbUTKKOrkX3CjkD2OWeaMJuoh861yUyM84E0Fwa13+Bba44aE1Dbai4G5yMkKFZqTbJo78pv6mhxQpxSngXS8GaHjbJaKVGdKhXCYvTcXVOSvOX9WeRgGsE9Ztw/DgxduPzkNlcwg3+cuvIKt/3gSj3d8+MHTZO2nOObM349gmzn+dSdf/QN6D+LY7N/BE5Z2E33Gc6iNSmD4OFRJiK2qK2qvwXXq/F/2jOfecwWo3XAtNhq/khhYNWriDnY8IXP5oIybDzZmEpRHBXtAXplZ0CH6ZF5JoS6JAoBzXzbpD9gdW6HpXnlNM2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTdZAW4oScs9NUiE4pAXFpE3NO/LNde7xfbpi1ngo/A=;
 b=fHJNfgh/qDZbuYruuwI5U1B9wV4oqf4eOCvJiou+CSTs9UZ9lEE5rPmKvtGnqN3k31mjRqJUSP39ll5vTxzAsNtLhqfuwqHyd+nEBkB1jqek1YF7g7zUaN4WPSn2RkmBCV/qw1QkRoBn/jCBrdTO0n5IbW/DOboQ3vHLgqt99/lqb203zgFU20CDQmvV5Or3guqJ92VZfqUlHVzuwrKYyeC0CGthXloZjY5epO51Z/mfQSDEVFTJ6Aj16P2E3HuOekULkSyh4SWJHu786kDEvn0noUmNs4uSNKtnJGScHIHA7ZSyarYzm4WNik1ev+mMZMDwgAz+I2gVz8UjHnxL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTdZAW4oScs9NUiE4pAXFpE3NO/LNde7xfbpi1ngo/A=;
 b=tZoA5Q59OYuwsAL6IHfrICeBaNAmsFYQhirVXHBqXlqisW7mCE/kxkHlGmz0SL9D+N3+h1QwY61mpHjgb0FqDbaMRApUdUA9vVzfYAEUFwCRCG1sqN1fbedLlL+EesQtMaW9fdKeTMqlcIQPRt0Ut9criPyS7qT6RA7Bd5bai3m44WQPWdhohpZgLprc6Z6z4K7UOqzSmConUgPjL9OHBolydSXAZwUPgUDli6Xi0o8nA64IB9nl6/wEKc5m/upbpNQEzV23i0ForUAqyM1gaAKNX52UXAiJOL4cIOIVAABRUPuYDgfx2fXiSs1ZsXhj8Cx7YFgtiIMMUzYbhydPaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:39 +0000
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
Subject: [PATCH v6 08/34] gpu: nova-core: set DMA mask width based on GPU architecture
Date: Mon,  9 Mar 2026 19:10:58 -0700
Message-ID: <20260310021125.117855-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: db113fcb-ef80-405d-6c0f-08de7e4a5d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	8/qfnNLzSyMbsx3MWEQowwuCnKmD3faXBBbjLUNwst+OQDKVZs0WTcqgy0R5c3A0vfi3Gqawr6wvr5+utKX7LapgKIbJ5l9mjFP3x/JBy83vvhJNymBRuw2mrugwWh5kZBbK1fu0Wt0nJrJGAFkgXtUIo3kG+06hB7J9Y8FgT8CaFx/sOReKuzDNeZ3xHeBk/lsiwZuVrIlKHywh/Nhqn3T0S6CupnWkR3+xvhKUP1vozn8yEmSh/95TWHL+yCLf0RGXDBr/Sv70lbwSZCcsRRwGzR6iqzOmRpJRsDvLzbRLuaQdyN3IKrPHAEwsCOSSpyfMW2cYlNJjX6bt7T20Me2lFZn62D4H0DNwAf5LUSP4XePkuk00Bes5Rn+yms0AfVoaEDo82kAVafYVH8u/97kkwtd8ITJRD8VNsQEMHnTk17zpR9AZIHG0dHjNT5wRFKGnh10PdAOB6zS5ztTyXANaQ+PuPnxNzTOA/7QnGIM8w9HT19BwbnAw8E7KERU57G+kHUo2aEAJN4/w2yYfinbwYNcQM7kWCJk8fJYBiX1W9QywryrZVOVltlwrrHIseuDJsPQUgd1ctTaKfefbZTB01XrTDO5pbNUXeN1Lnwb8UwHOuguqp7gjVFcacBiwupONqIJunWO/826oUl/Ps+E+36NCX8Y7WM48TNWNIJ+FsenNPLkZU52LugpXReXz+x01EP0xHDGnUPympXngMfuNHDEYkwxxOjihBQu6aH8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uut1wiPwxv0RXAvyQ9XV1BVySFT+PUiKFT5LG1G3kVAdiW2dDu39YEWlDfba?=
 =?us-ascii?Q?mCV/PbzZVhGRO4sOfRXWhYwmmutkazIyeObL0ZGNmAZdOxqO09uD6Qxw3Dyo?=
 =?us-ascii?Q?L4HeEV8M+YeDkbv7NlheH6hH+dFaXB/m/2p8ZcIBgF9hqg1SONXxZxBonLf3?=
 =?us-ascii?Q?TgMPaHKUeropywJW4H7z2/zJ4boqKsFxMOpvyqDxZ/kv1Xyp80l6M7cNe0FD?=
 =?us-ascii?Q?eC3y/ST9Xs8YBnRL708TLQ8PkOCIFKNkSTHX9N1cJBTUdQwMtjc+H8Pth8rs?=
 =?us-ascii?Q?yHsRwmlA6xIAWtL+bQtkyBULdDrG0Tyadn9E5hOfYTUqmfr2yY7wjT8M+e2/?=
 =?us-ascii?Q?JgsBx0GhOQW8qv8VncoX2A/96O2l4NT96BeZk4xNym0IRlt/i5WgMS/zci2U?=
 =?us-ascii?Q?KAORPgfTAlkNZx33MgiFxTa7tEASB852HsJn1I4oFs3Y5yzANWEvRAeJ6XeX?=
 =?us-ascii?Q?kBOBYXEqK0TcrIx9895qdjYYx1s7bU+Lgz7cOX4fRfbW26ql8oPkbeUffnQL?=
 =?us-ascii?Q?xIagnhF5kNPPXqMCy6x/ZP+iXgK5BO+aVZxqCZdOIa2manL2CWnxeGD2e32P?=
 =?us-ascii?Q?S66MpyGoSWCrnXixjDKHLbXyK3xOEtmedvRonB7wUTkVfpObG18YaKiqVpv5?=
 =?us-ascii?Q?8uBDlmOmIfrvoqoYfftMf6W8mkYcUgP5AcBoki3W4uFV+ptSGmqgpBhOxDcP?=
 =?us-ascii?Q?0lPsVvKJ2uG2g/ED6hjtu30/PAyvwsEMO/+FiTEV+nrcAwXo/exaynBFoe3N?=
 =?us-ascii?Q?+51Rmr/nJ6kiYcJTYNXsI8smrZ1ISPtsAUCLpjFD+/afMGK0hB7uhXydL2+u?=
 =?us-ascii?Q?LB0F7gOqioDUb62tto4iL1tgtsSAYZ95VKVA7pR4ypAAjqBP0o8D5GXfLSO0?=
 =?us-ascii?Q?rUdpmMos9GrQa/M9ToNQKEkEUuUaJqmbNGWvI58ZEeMKaOZHPhnijG9RK6D0?=
 =?us-ascii?Q?mRKy9o9bX7PdcjUL0fVoVsxlcpSIn8IczLTcfI6r/QT/gw4W3WMrOiMMu960?=
 =?us-ascii?Q?1P6nFnyCR/hmJjPgGkU1OeK2DhH5T0FHElaIM410KHNHoEFZNIEtfSe67wI5?=
 =?us-ascii?Q?ZpgzpX8Bun7QHLSSU+p5wcZOaJ7oHxiORYzfBC3Ams0X8P9dOuV3p3AaF8LR?=
 =?us-ascii?Q?0rdDKnXrChnZ/vEX/xFmAVB0WF/x67GObIZiYOYQBnQeTL4C6uGH3mC09vtg?=
 =?us-ascii?Q?abCwFYyeyaDiZgIpU5HpaYlIxjESnhh6UILI01XpeckZkPdOXv1i1iMW3MEh?=
 =?us-ascii?Q?JEJm0M8SMA4rRvWX8OFn61/XSe9k5pxvfcTVMXihsQ7migQ8WrcLh1eIyZhF?=
 =?us-ascii?Q?Do45HTvVJHDocdgB0voyEkCSWXModNxenyd4VG5Hyd+1BzxbjtTdXLTEYxCN?=
 =?us-ascii?Q?cwEPh8vfqev+a9Po8/RbX8JljDDluKf99w1Qje2KSR6ScNqpZsSz4Onf5V7f?=
 =?us-ascii?Q?pvjpuF/0/ncALOypVgZjQuD8Tdy4DQ0bjMa/kGBet0qpj3kPGZBLqwEo0oEV?=
 =?us-ascii?Q?KDkpHtDGgU7F4GoizpHC3yMH80r2UpevKYZ1M+Z9U4SQFZs+B6dVGiEYqng6?=
 =?us-ascii?Q?7o4znkJxn6MrBNEYA99wc+rqV5PLdEPAPEuLGyF3+m+6AUeQM3+Irmu6kagr?=
 =?us-ascii?Q?wiJ0DKYkfLIaqMGczqwq9843+Q7VfAAzL5hly+4dQDGbCPq35i9H0MpDvcqK?=
 =?us-ascii?Q?kkbpTMfHeSwv4x5OkcLPbU9MaRek2aFk4aL5Om2wYMx+nbKfvfr+Wkz8S0ge?=
 =?us-ascii?Q?+hQDsETB5A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db113fcb-ef80-405d-6c0f-08de7e4a5d5b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:39.4062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OsFtjTG5ecNnpNKdox+UXPvOU2d1VhMATW7Ht4D/det0FHB3kemBpt4YRJYlkJ+2pR9ta4acuCHEFM2FPP/59A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

Replace the hardcoded 47-bit DMA mask with per-architecture values.
Hopper and Blackwell support 52-bit DMA addresses, while Turing,
Ampere, and Ada use 47-bit.

Add Architecture::dma_mask() as a const method with an exhaustive
match, so that new architectures will get a compile-time reminder
to specify their DMA mask width.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index a7f1957880ff..efd1765b4f86 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -166,9 +166,18 @@ pub(crate) enum Architecture {
     Blackwell = 0x1b,
 }
 
-// TODO: Set the DMA mask per-architecture. Hopper and Blackwell support 52-bit
-// DMA addresses. For now, use 47-bit which is correct for Turing, Ampere, and Ada.
-const GPU_DMA_BITS: u32 = 47;
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
 
 impl TryFrom<u8> for Architecture {
     type Error = Error;
@@ -308,7 +317,7 @@ pub(crate) fn new<'a>(
             // SAFETY: No concurrent DMA allocations or mappings can be made because
             // the device is still being probed and therefore isn't being used by
             // other threads of execution.
-            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
+            unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch().dma_mask())? };
 
             let chipset = spec.chipset();
 
-- 
2.53.0

