Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D052C1EA7F4;
	Tue, 10 Feb 2026 02:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691570; cv=fail; b=rxrqPNmP07jzv5URzysWxpKzYOJDKXMVbUmhtyMIcDaMKjTe/gsojVFI8TADtHCyMx4ugeBO8DXqD4NaCBqYODSiSoDFr5O7yZRx7DrD3XWs/8fCNPDHAxj1hQsxyFlbLrNFPcbxpnMbu8Dk9t3auMdNRG7huVPhPn7/4h1yZrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691570; c=relaxed/simple;
	bh=I6j1UqWRQQbZHU0HNC/lYWbNyge5FeJ4OnLvvFt3FUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q5kMEk7Ygrwo0k4YV002EXfJkB5UOWzDPhMGp1p+o+dOHlVOWM80KlE7WLsf02FUDK74S5a0KKy1AMoUOGIPIy59EPiM9s7naScfOoxYbO73Xcdy0DDXuO+Gr+Ee1PkJptsWX7ADo455LebooDx+VQjAtIEcFbLRRkbgQdNZYhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kMFU0c5H; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kMFU0c5H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnbAoT0g7+SfAqjcxSm6Pig0qp0NOSL6mCIIIK0n9KaGJ/XDUcOy8gVV4gRuUSy1mm+2aKsdsVmld7AthkPAGsBu8CvjpeeYh5NBblk2XtKQhN4WW4Dcuz75l/jQGWraLTDXUnCrvRnx6bQYGNzzyxRxXLx8gNrQneLc61GaW8lKgG4Nk7tPuMu7HAcb23oRCS0zT7NZfDRNBuy9Pdx/Kou6RttegkqAd16AyWN5ZiV3W28nRJUPiPe/oDd1zAFFM/wyOvuimGwPpwt8j7cy+iJsTZ/8iujMaARFMdOQDK2C0gBWjZW03LnoYYchnQ8CU9PctJY5NBj54sru00zO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3X10GppR3M7xhRsBNQgTxoeA9gciFvVGAF55tWNNHc=;
 b=ImkVyY/JnbbfFpHbNJRFr64lF+tQKYk9sv0t/PG4J7jK3CsHAecRe7B5J2OxsuG7PAfuCo5Rjc5UuQLnxzsqOi5k62p54OSxShWVkmNTqtbHTLOB3RmQ6PajRXtJXZVu7q4josq7cIV8pdpiIc9p0VSRzjIvnPWyaCQh+dVWrm4JGl0KwUbRSj8HxYOmdc8Ewgu7xel62VlLH6phAyaERWaZeI9r3lEreV7g63I7CHfSOpRTyVrabF6jc5sEGGC8iKNfYD8ZCxFdCJ0vJ10qzJhQfpk7mS+WS36rKjosdYr7o97Qy50MwH+AgxGPui8Ov9jNgodWclmRZKMCz8WJgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3X10GppR3M7xhRsBNQgTxoeA9gciFvVGAF55tWNNHc=;
 b=kMFU0c5H7eRnyBJHxvkYJhGbIMtztpcvQ6JrVdSwaFKWAEo24OFOvtfGmVfOeLalNCl+L8Bf12L+AX+uzv1dP8rLye6FcxipxyaoTYAFb6ok6kK++naQtTpyi6bLCIXBn0bIxJXAPKqYVWBqD6Amqmi+0SYkZopKioc6flLIOdjWEBxvU8r8GRUvb5y4B0eARI9zCGwF0qsiUj6e34waSita8wpW4r9IiijuQ1Ffhiok4302TBw/Jo6d+nFB6AhIvMilGov+FLWdum4ZIIn4xqsCJBwrh3boHwOfreAonbRzhWl+unDRsXbIdGGyk8mFNKwRlXZR7q//UoxG7hoGrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8797.namprd12.prod.outlook.com (2603:10b6:510:28d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:46:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:04 +0000
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
Subject: [PATCH v4 01/33] gpu: nova-core: pass pdev directly to dev_* logging macros
Date: Mon,  9 Feb 2026 18:45:28 -0800
Message-ID: <20260210024601.593248-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: d5a78e7d-72db-4854-5e74-08de684e88c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hJQnEih3C53+QZi/79kDqDkbIzNbFzt8Lbp+CB8CmkLGnx00ZOgL63qkxgBk?=
 =?us-ascii?Q?/OGWSCB7sxZdoW3+l/spLuVJ64jIP8UWNX4dhM9JGGbMVMx5yB3JAWd0Ro+F?=
 =?us-ascii?Q?ymfiU9L9aqmqgzs41GafBl6sRjmsaoK27piNOSh9AijXkOUkv1JENdahXTz3?=
 =?us-ascii?Q?++vnUCU6ea6+i/LHJpxJKjISC9m3t0gVHjSoTqzMKnwOqKM9guSnPQzOoMWG?=
 =?us-ascii?Q?rwlcC7/4NurTWA/OnJrX4RyQ2ls37ibqpXP3Wz4jwrsr4eOwjLV8BXSZk1GX?=
 =?us-ascii?Q?8ZbF39GMDEoHbgPaEEp15R8VHxB0YorXplhsaxenrvLbcmUL2mFxpcal83yH?=
 =?us-ascii?Q?xpXG+YgU2jBf71MaN3jbxumb/oFhcgj836vKS7Bigo+pZNxUqi/X8mGZ9suu?=
 =?us-ascii?Q?KfWXWb/OFedYSy7b8m3Sy++e6NlCzT250LHMf4rMngL3gwI3wdzUqf2K8s2P?=
 =?us-ascii?Q?r4eoib9Rj6yNzn4TL/2DLGy4LuUS5W3GoryqALCFmHS1scO4ckpW0Om8Fo2K?=
 =?us-ascii?Q?DXkhKv9r4bsBTI5I1x9y2BdnIL4O8svNxIt4Sr58kKannhjouytf6R9dNLj3?=
 =?us-ascii?Q?SFOm2uTK8AaER+/u0VEu4SNE3WjWDdtlpZQY95gYXans18MpkJHG2c5xPRuq?=
 =?us-ascii?Q?oPUtOayMUZC/MC90gejn/1Rhskbj4c6De/Uk1jrRAEmkC2EAyBxLJrTGtWrt?=
 =?us-ascii?Q?11Fsumxab0EJdEEY/sJaDIXTQkAejHjS1/bTHDFR+bCX8vi2gA4hmnU9Mnzu?=
 =?us-ascii?Q?efXt+tDlghOaAq4folHaVbV/wy6XRc+zqJf6u+cnWq9nUvUw48UyeZaPEBZJ?=
 =?us-ascii?Q?XNt3wT/InWWKpoIsRD8pfyLT/YlGoIuKD6n9aNQyMyDVvbM/nZSffivdwWdZ?=
 =?us-ascii?Q?1eI2Zx6Ni9TjCIyBOyx/0J7SdO9aFUSuRgDRoWMLq4lz7uf/PysTiasDwi4+?=
 =?us-ascii?Q?8PG8Bt3H9NllVI3NDesINlEaUlAB3El1oeJpDvQzXygaVBkczwi8HPeXXcC6?=
 =?us-ascii?Q?Tqd3UBHcX5TFgrPOpffM4mDpAcaXFIXwLeUofb4/6GMogN9QvdmONgjcJpWb?=
 =?us-ascii?Q?2DR23W776oo0Fg0HE9pvcoWARFd2uYjZdm0B9x1e4Sr2/ckWFxheFU4nkRIU?=
 =?us-ascii?Q?jDNSAIgQK24hmSx6LD1ML5uTPExQ5WTxC3T3Irjtpk477b2nsAdUd6wieC2v?=
 =?us-ascii?Q?VrMy0G2w/tZzCHNak7ZwdgdrQTQTSodvv62yEE5hVTFzojftSCksyMlv3All?=
 =?us-ascii?Q?3ql7/UcRnNkbKTnRYKCKRDFqbTdPRvY6NC6z9ciag9iNyw8AET8jlMdJtv5d?=
 =?us-ascii?Q?f0s2vzdizWUWDxri95RWUfjrv5JbArfUAhsE96qPNx0XgIKc70Q2x1fce1Ci?=
 =?us-ascii?Q?Yjxr93owTSVSHj0di90W/tB+RHXt9geSp7gC+LxxcIYmqjsdwPo1TI5lkrm/?=
 =?us-ascii?Q?cPsCqKlpdIFu9bAjuREfdinIVe28oNAKQlu8S8DWHll9eNJ2DNEhFjE+pCOs?=
 =?us-ascii?Q?WqE+qxWaJs5gajcCT0PTKErSKZL6ijoKbsTWyjSTvIG6p4sFwPm0SeC2w1o0?=
 =?us-ascii?Q?KOgnwOhMWe0RnuA+tGM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fI+VsTD9DLmP7c5hsNf8/lKqIlA2JGW0NC7CJy+4rXaDGhTdFktAIPAsnaW7?=
 =?us-ascii?Q?R4OSL78+oOq5eOA9o2zCM2wmTjNdAnH/hzukyyGtNDlquPT1v9WYjcic3Ng5?=
 =?us-ascii?Q?FMOCLs9PpoXPU5DcMxfPs9SgNzri6cwtAkG7zmutHwF0mHnVplwgOa2KE7Si?=
 =?us-ascii?Q?YOQrr34qALyot/XSAcZC3Q+Y9W4AXV7mPXrqpH276ukNFoKdWdQ8g1eAbqsr?=
 =?us-ascii?Q?Jdh94ED1/mFPPBw5tPa7pSw4M+uoY/uIkIOvlo0ZgSNVoOjdKZZUFoVi0+kC?=
 =?us-ascii?Q?z5lhEwawR34/dfTy8j1YUNleDGy76LagwErffr1r0ByMnPAL21Ekp95H7L1F?=
 =?us-ascii?Q?SkAS2aWQ2/d6jHu368TZKno4luFe1gRUFCUjkMyiu5JcOmXEPT04rIwztGhh?=
 =?us-ascii?Q?nfRoLy6UFj+7bykKbIlDBWmKdcvK6ln/tBtGHT1joUaUBLKcSpb0bVCVHYwF?=
 =?us-ascii?Q?UGYAPq3zLudq0bmV5AZNytyyJ6DnveTOfP//GD1z3c9iboB3X7dEC4VbenC7?=
 =?us-ascii?Q?/esmuI5+dV3crDiduY9QwWxeac35ok2yPGb6BcdW8b30kUaXtQGv9/jD+9BU?=
 =?us-ascii?Q?6HKnzzTCVh6SIJ9WEzBE4F0AR5SNBi6h7BNJH1i72NwjE2z2iABjVy2tZ7wp?=
 =?us-ascii?Q?e9j7FMxL18DbRkJgiiS7bOiivdSGJ/uMABF2A8x6lLR/kjfIY8dJtXV7O21p?=
 =?us-ascii?Q?oMiJaHy9SLpg7ttsKXeeH9Ke5oox0NYCe4v8hgo3J9FvuQov2VY4hOoDQFU7?=
 =?us-ascii?Q?lVtEmtUx6DTlSdVeDI2lCtfEbS0GCvPZBDJjEAbw3gLp1A+0KsmUHkLest5s?=
 =?us-ascii?Q?IGwI4O9x6N1EzycNexwJxsGVYTdF7sFuClUThx737T6l3YtDmFWv5viLuGnf?=
 =?us-ascii?Q?dnIAK+0gyznzoz1gCcPUooUAo2t1lg7lY/Xu0cOVqp5kJA6a4c3tG8hkVvCY?=
 =?us-ascii?Q?7Rtuyc5WhRNxZBbvnkx/xYZIDMtEaun8PLsrb6Qpi1IhNbQJvT+ryCRMqtqF?=
 =?us-ascii?Q?jBQ9klhTP+O9JNOIMi/DCh+i6unP4r64qlK0H5ze4a9CyhGInUE6rXMaoUso?=
 =?us-ascii?Q?hISzOnHcjWnYWfjwX1/Y966bNLCLoANU7GbeSKmzZPNfnvPTytoxZ46aG0YZ?=
 =?us-ascii?Q?pEa7YZB0eBp0QpJ3f51fQJYntq6bFMPugbkobaxfmL9OdlC4KQGkBMzRz/B/?=
 =?us-ascii?Q?Gcp8ezRaEA+lP+95uWc59q6AeNO66g0wA00h7OC0Oss4AQGjbv2r3ZbHbSIL?=
 =?us-ascii?Q?ZFye9sBlhkPvgnfKdxS8fXO/JWsNnnvgnG4Tp8H8ZEwG7lqa3nA5wgegY//O?=
 =?us-ascii?Q?nuEhCij9DEoBLe3EK7lGnPDi+8f4bORW8Qds37IgIUwuJRCmwB4zpPtlU6aC?=
 =?us-ascii?Q?j4EKoV4ipiCamf3Fbp9H3CeWhSXDowQG9If3vfZauJuvOq468dDrJ5FctN3+?=
 =?us-ascii?Q?yKSvK4vul+0wCKRSNkLicC61+yr3R4wk+mnBM0+uxfbIAg21MqXD7xEZ6zor?=
 =?us-ascii?Q?22iBS03VD3B0hWWOLwPcuJ1ArCMxgOb/+MUzUsFm7PvlmVr86sM20N4MfUjX?=
 =?us-ascii?Q?Y+UItqF0jSueTzgHQj1m4eZTd4g7f2RkZR58JZ32hsadBQ72KCYoh0HmgJTc?=
 =?us-ascii?Q?DI7G6rQEKDVeBH/m5j9EN3fO+jUnerZJ/ciWbYvTnhlGCPPfiR0Cz5V30Sk3?=
 =?us-ascii?Q?R0l/cANvopKpY2jbw3cE3Qsd2YWQXmZEn8qTWTWeqhXwacZhpoOrzK0UYg/v?=
 =?us-ascii?Q?bb++ePZayQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a78e7d-72db-4854-5e74-08de684e88c5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:04.6305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFustEt+2BKhqDo7GhgnrbPPYdKB/czw6E7cqYvDy3bwCJO88b45gHu4GQ5YnPDfX+6nkPbBKEiHC5HZLbPHUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8797

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
index 5a4cc047bcfc..e39885c0d5ca 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -70,7 +70,7 @@ impl pci::Driver for NovaCore {
 
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

