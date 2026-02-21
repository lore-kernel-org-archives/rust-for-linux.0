Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CE532573B;
	Sat, 21 Feb 2026 02:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639807; cv=fail; b=KOoEaoW/aT+VioxuzU5hfMdFoA0GSURo4j7j+GGc96PEMyDXWC9tlhjON29BwN3odTxiI/qdoLUXzeeZN5LHKnDawSxQchlUB8SG8O7MIQaxM6DLbwC/1qnhW6dTKDKps0Rq4azdghhNErMwTR+QArJjjuJ6Shcy8KAgcl+jxD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639807; c=relaxed/simple;
	bh=jsvfXKBiisoteNE+4nfoqcJw9Eaj8KX8gjROU2rc3bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZdNcDWrxMAqtASCeuf1LBCmjWz2C4PnRCbOZ1fO0uywb3MOF48fCZfZ4qLZFbwgWDhyjOUa3LsJa4TtrCQBwSZYt/3I+tBwP02sB7pQrzICExKiMHxdgWgwiY1g9HX5dD7Og/Q1Rfra1hxBlOtdt/jlA6qsp2kfeCMcHy3+UYhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gp1n5BAr; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gp1n5BAr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivExxmYDP1sj5n+xVOsCP1cL6kNIKj9ZyHpeGPFtBVmRvPfqSfvhy9YysJhUz/UVsWDdkqNR/FGl0PPJaiu7FOv6JCNSCeEy9tAxBTOOs5WhJXLIYbRcXETa1xIWe66YgNpCNatEsaU4wuB0+ak3+nW23/HpYSOnw8vkrL3t7NKe1BeRXGA/L4tUh2EPOhBuu2wW8/lLIsKyV7KxcrKryozK8B30VcVNmGFTS8uzW+dhEHfFoiz60yGi4DUaeOrz5+IQuDUcUZSL3dhqehkbJWY7wrU1HR0o40V6r3KffNI1tJJmXb8eTFEil2TH6hI51j73hKht0YyQtUA3Mt6E1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7dzexcy1JZGVJ2A+umFkVYmwpQc+02s1APhpsiI5g8=;
 b=q//+siwTG8bhW8xAag+afQbR9n5l11C/3w97oXNXUhyzZCUYsOVOvCjmNgcfrFPEwj1SBw5K41nQgiX2Zlet6Ep07JmUcvNTZ2OVw15lkHqzO2YFPYWzI7vY3JK2lo/XiWtAHu+9YOL2Wv7c0EnrtI/flJokc/sv5om1TzLjmz8C7yGmH+vSoHXemNHpxr9EifldUimFUizBS2pEoPSDS6/VG2fulnitXeM/dl2W4WUR11ZtHbT6bPvgyVuWPEc4sjNAq8/zjXGKRe0F6/rmKxBWGf4Nya1DBLBqp+5G8/JbNTjoUwq386n/NwYIOH94vBKS/7M/yrRdZqRTjvvzfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7dzexcy1JZGVJ2A+umFkVYmwpQc+02s1APhpsiI5g8=;
 b=Gp1n5BArJu2XLbL3OfHcDzTyQ0HwC5OqVjAOPxbm6yMc3m7iBNCiG0PfeGkO9MmCiEGsCa0rvSrRw9o3OrBRXom3OyVvRW5uO49/ZeKF1xJe2YTNHlFXqxBa2Uh063zvhmebxNdLAjSv+yxIWuC7hYl43xYwAAxWpy3RnVmW0g7MCrrAvsDfF/Wu5PsUEPiylzlZGWTRBQgiHex5O5x44MHp1NYaSitaFgwidyft2P4cw1K/zkXXnt0TuQ/JPosIkvrlnaOywZdryf43FoJPTSU28aX+wJulJ1i9Qcc+JrX2VvPFt4wmOr6mAi0JJabeXoC7gZRYJ7+5jejKexJoJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:09:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:09:57 +0000
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
Subject: [PATCH v5 02/38] gpu: nova-core: pass pdev directly to dev_* logging macros
Date: Fri, 20 Feb 2026 18:09:16 -0800
Message-ID: <20260221020952.412352-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ba050d-086d-415f-1aaa-08de70ee4f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7vqROojnZJEkltdzIYg9y5/fnxNNEQV9x9zvwwsgWZorRyNqTsayuLn7E4h7?=
 =?us-ascii?Q?7vUYAwf4/bR38jJDZLidg3vpJdZWdtcelDjB2Z2HTqekdKdgZ+V+zvp53j6c?=
 =?us-ascii?Q?6EOd145BCRvpbTEAfiIlg36aEz2MhyN0EBPUDSerHt6Nkh6xzQjyto5XmNc/?=
 =?us-ascii?Q?+gIU4jfar0LQiKmiMuXlMxexNeGtkia6Hb4TdSNBfcxk/jAU4yo4lReRTkP3?=
 =?us-ascii?Q?IN+ogStT1qARvK35JipQ6jd3hiAAOORATjNS6urkTodF+yEN9201iUYV4Ihw?=
 =?us-ascii?Q?n08jj7VabvKNsmp9kXAV2Rp/LE6msXew6iXl+BaWG9zxDoNcBI/TR4/2Kcwi?=
 =?us-ascii?Q?Z6mCGF+QkLGg3GEWugvdTr7rO8r/zzNrMQn5HmZNKgsrONsFSclFzJ1NqIwX?=
 =?us-ascii?Q?fy9DACe04xK5lPKAAPly/dYa+exw3mi+UEx3s8ZbzM9fZGMqWXaQtZVuAduA?=
 =?us-ascii?Q?afSyjimvpaA3ntNCzZRvG6BbWb8okvGLvPCsXQbnKkcQ+fSf1vL5u26HHL/3?=
 =?us-ascii?Q?xOs6sIE+71U0u/ozbxmrEq75MdDRgisz6087+eYHAcXndji3C0LfpOeaGY2T?=
 =?us-ascii?Q?6GhkZEHX92VCnvGutfXjQIAv8eb1KgdwoS/elZTMOLd+b6pgq5NRXO5etnLT?=
 =?us-ascii?Q?MtANhTgnhMzmSO/NXdzy99b4iebEd4Gyr6NCM6L+luBQ4735Ds/OPkeyCAAE?=
 =?us-ascii?Q?912FUvDIHM9KpMIMNd1ZfXgs3D6ywWDKBpS3JeEScKOBVXdSGHUEgYzhnz7M?=
 =?us-ascii?Q?855imErd36loERxuM5r3g8s4kt0S7v2ve4m17ktgs/3v38udMNWRq7+bsOsa?=
 =?us-ascii?Q?t+1jK6XOsAIiVNr5C8oLv/4K6Z+iRSpoLoMFEaERFQT2BLxzQ1zLVBL0V6/X?=
 =?us-ascii?Q?0pEuzJCZR5lVAYcKVbII1gkkrQrTlu5rPA651+E+5dj/q5R0RbjCuhczrHDJ?=
 =?us-ascii?Q?uQLMpnUYUhpdeT2IVQs5pxA6LP1SSf9ni1jP2//pXnr5bnpNPWkzbpFNpA69?=
 =?us-ascii?Q?1GTIZgJKxAjCUxn4+LgUsR/ZBB1tRFo9kWRWFmR2xA55HInz6Txm+eQghFeU?=
 =?us-ascii?Q?OL6qwzuk1kDqvXNx/j5yhBbZVJppxRSREhjF0HCsllkVTGnbNZaayVHsO2/a?=
 =?us-ascii?Q?zaY67mhBMCTktmIa/MGS747sQYxaco9wPBHUpfPnkl482JiM6V3c3gVmldbJ?=
 =?us-ascii?Q?mx8OisvOUo6c78144qil3/Xr5Kax4l/h5KriwgPpVcb/+e9AP6XbGPIEb6Np?=
 =?us-ascii?Q?aCcwLGbePVx5vRLXOQ9GNb0Cz4RlKUHOrnGC9e8/zJYThLqIJY9rhxqGDj4N?=
 =?us-ascii?Q?Nqv9pEe7NNL1W8ke1rn4JLFaPcTvsqaDOI/uA9wNeD5dSsPQDUaF2N8BoGHe?=
 =?us-ascii?Q?2s2Dv8GBlqMFL28AOnxlSPHH5BVtQGcWm1TV8FsJcB7J8e0sBrlC7uV6RSCT?=
 =?us-ascii?Q?d75niWyRldJsSTvV6RUWmxXii29rZga4QwfI8zm8oJPvOsf5R+54yzoii11b?=
 =?us-ascii?Q?8Q3GDHkvmAG76NguWtZkSJ2AkrpJCbQQgXm2kMQviKNzWbHrwklETQmQwV8P?=
 =?us-ascii?Q?xSuOgIlEZLMcnZzGFxM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lBnwEG8jnMR7wKqFUak8GegY6zFubugg+AevoqnsfsJ0cPUDmknPfxgvx6kc?=
 =?us-ascii?Q?j3qgKxJyf0am+Zw9xxGBkoNEQIEuAKHGN1bjQBSXq2LSx7gvTMGDLs3kLkil?=
 =?us-ascii?Q?BNsQtdA9KgG7mTMq7ntIduTsICPg9VAumsM8EAGfHA42AiFZ9AlMMVlTOqjj?=
 =?us-ascii?Q?W0I6crZxg7mHnKmsDWlDaVjBcIzMEROhQUGQlwMsKbX8v4zrIqUdxsofB3DD?=
 =?us-ascii?Q?clEB/JDWP9aL3o71eDsvNMWVhQxsEtjV0yAQE/5MCcdcRggqeA0ltAvCyMPb?=
 =?us-ascii?Q?onh6ZtrYB+GTmliBH3oJjL258yvN3H7WIzFFxdmRVUXC+CwfVk14aF0imwcX?=
 =?us-ascii?Q?CFm/r1w7Q946XqUHxyI6HhNMgJ1bgOJuifcYlx5ZkZsd4Z3SdcqMZErwWE/w?=
 =?us-ascii?Q?BycPjGgts6muhnaNaCivR/KKfyX6SYryGnNo/6i7F15lxOTxd8RWEHodcm/f?=
 =?us-ascii?Q?MOamjTXUvA5UhH5zv6RsN7WXQ4fyvdzfTCq4g6ENRWJjG2nZBXHdZRlqLwuO?=
 =?us-ascii?Q?KCbeTSG6nDP2q4nUc7puG87/m4YNDJfNaK3zAyeTfZnuE41rScB0uV0N13Kg?=
 =?us-ascii?Q?HacHob6VTv4m4DlzATBOLdv0ZE2H1hgH7E609w2fwCI2spR1S1p1dtcAuC9N?=
 =?us-ascii?Q?St8aEmwOKAxcMuo3kD4cdu/tZtKe3/laWdhk8Nyr6PBEF9a1fqk3pHPSVTsn?=
 =?us-ascii?Q?TsI6z3D2VLaKmERbQjMf7oKUqr7wU1sv6sgZ8Z/8ExSSOwAhJETjUk9uMSOm?=
 =?us-ascii?Q?YKk16OiTOAkb2mqBtqpaQNRDpLaWNztQzMgEf5G2D8YfPg4hXGca8hUIt6Ji?=
 =?us-ascii?Q?egG0ZAfcsZRd+niR3cNKZiFy96eAaCbLMfrCDGN1UBIcdYcSYAjy3xF/sBbH?=
 =?us-ascii?Q?NVLHwizuUE+ubKSenrkLIShiF73Fz77DeY2+zNct5WPBukffQDOrW6Gmme1u?=
 =?us-ascii?Q?1cJpr3EbH4NsVKgM5yHu2TYryYOSjFNxWnvLFvlNmzIo9DHH0BnVIJL+zpVJ?=
 =?us-ascii?Q?N0Q8vsnSOznSvgtmMJivV2j/460599gJpU62dS/JMORWX76pigZNjqub21Pn?=
 =?us-ascii?Q?ee7PImx/AKE+pweWzgtg0nzpKdL4f9B9akl40N7HEBKmLqlXMKvQh9ID2Yt2?=
 =?us-ascii?Q?t8t8xJkP5U//voulyQtmlMBD3kJwEJCQkgzXtgJ42ydChcSXt/uc/JbMGdOB?=
 =?us-ascii?Q?J9rFoiklvarcEWykw6xuiwoSAxdbORZwdyidE1QbicfI91UeGzSypyZCZH8S?=
 =?us-ascii?Q?LSF39m5+6PHYVGFG15FAZNnqcxa96Xf3YZU/5A0REnd5mYOAXGj2A9Kx9Gnb?=
 =?us-ascii?Q?BG+LlzqvrtzQ172yGkUg+JQpC7NySy+SEAn1FQxU77GNhKs1wmQ/G/w6rrtN?=
 =?us-ascii?Q?ZOdXXe4Wo+eqxzaimIVLACAQfHKaC5Ig1a48dthoAP88xqHyYU1C5iVX9zz7?=
 =?us-ascii?Q?nYxyX1c8nFyUxMXYa1gehxD9O9s7qFihGSikboE2pl27Pk9cYbhLrpeSMfPr?=
 =?us-ascii?Q?Uy0KntleVdeQvUkakXTT2i4vHG2dm/zzYsKyPzqB+VMgo1aNLrybWQDRryre?=
 =?us-ascii?Q?FN0paHRgImiOxRwHxd+xUJVQDK1KrOhQMPdCV52DlDmaf0H3jI3dV+0Lcq8X?=
 =?us-ascii?Q?JTEp0iqUIx2YhYKGX5FcjeR7oNpzXmsgH6IfRVSyKCaZhZc0P8UgrtwO7X9N?=
 =?us-ascii?Q?534UXEyqhTNny7hnlQJ5MKDQ6yk0GuZJ/Ko2jx6fZHi5qk4n5DeG3zwLxvI0?=
 =?us-ascii?Q?/RfN4KhRBQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ba050d-086d-415f-1aaa-08de70ee4f84
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:09:57.3252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gy10oRqYOyDoea0arN7+Yvg3woa0cHZDhTh7DQ3+yMTtYFjo5N3YyOCnR5GeqGjnIkEvaR4GRDbep7eWXsT7hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

The dev_dbg!, dev_info!, dev_err!, and dev_warn! macros now accept
pci::Device directly without requiring an explicit .as_ref()
conversion to device::Device, thanks to commit a38cd1fea989
("rust: device: support `dev_printk` on all devices").

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs   |  2 +-
 drivers/gpu/nova-core/gpu.rs      |  4 ++--
 drivers/gpu/nova-core/gsp/boot.rs | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index fb54f28f6da1..e887bcc3187f 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -78,7 +78,7 @@ impl pci::Driver for NovaCore {
 
     fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
         pin_init::pin_init_scope(move || {
-            dev_dbg!(pdev.as_ref(), "Probe Nova Core GPU driver.\n");
+            dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
 
             pdev.enable_device_mem()?;
             pdev.set_master();
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9b042ef1a308..f5907c31a66d 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -262,13 +262,13 @@ pub(crate) fn new<'a>(
     ) -> impl PinInit<Self, Error> + 'a {
         try_pin_init!(Self {
             spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
-                dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
+                dev_info!(pdev, "NVIDIA ({})\n", spec);
             })?,
 
             // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
             _: {
                 gfw::wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete\n"))?;
+                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
 
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index be427fe26a58..bd6e6dc57e85 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -171,14 +171,14 @@ pub(crate) fn boot(
             Some((libos_handle >> 32) as u32),
         )?;
         dev_dbg!(
-            pdev.as_ref(),
+            pdev,
             "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
             mbox0,
             mbox1
         );
 
         dev_dbg!(
-            pdev.as_ref(),
+            pdev,
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
@@ -191,7 +191,7 @@ pub(crate) fn boot(
             Some((wpr_handle >> 32) as u32),
         )?;
         dev_dbg!(
-            pdev.as_ref(),
+            pdev,
             "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
             mbox0,
             mbox1
@@ -199,7 +199,7 @@ pub(crate) fn boot(
 
         if mbox0 != 0 {
             dev_err!(
-                pdev.as_ref(),
+                pdev,
                 "Booter-load failed with error {:#x}\n",
                 mbox0
             );
@@ -217,7 +217,7 @@ pub(crate) fn boot(
         )?;
 
         dev_dbg!(
-            pdev.as_ref(),
+            pdev,
             "RISC-V active? {}\n",
             gsp_falcon.is_riscv_active(bar),
         );
@@ -239,8 +239,8 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         match info.gpu_name() {
-            Ok(name) => dev_info!(pdev.as_ref(), "GPU name: {}\n", name),
-            Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
+            Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
+            Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
         }
 
         Ok(())
-- 
2.53.0

