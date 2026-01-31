Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CBD32548D;
	Sat, 31 Jan 2026 00:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820988; cv=fail; b=ZRFR6eHqvgayZbwOuKJpAsNVKmfX1onxcf67VyvINGUhsfnP5hqSDnsM2CaE27bmrv0pb6/m5D2L254E+xvs4m2CBxWvlQwTlGVFdAfKAN8gU54cLajgd+h7MFk0S9+WrfTKY/1tu+5IB+vqUMK1yb0r68plED5BHRWwP2hTmz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820988; c=relaxed/simple;
	bh=5ay4vU8PodYYM47de0nplviLkLk2Yc5l7y5IfSCJWs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eGZfw+srvpvAbTuqdTnOSKI1ol3sojtxXN0lcBlv3zwrwSd9/EonDzDBwvhgswlImYZuayAWPahnB/n8bUD8asv2meWSeu0SO1N1a2EssRfhtd4NofvPDmAY1JFkwbcA4RIb48RdDVz4IAGGk57ILkr4/99e9VWqKVvB97Mjynw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fo9HHGnw; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fo9HHGnw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llYwJg8t+szI8B8K4Wt7BIKVM6PSubzgaYds6Twho3vLYdlo9iUQ8kE7Ve2MQiQ9xDAbLQkq6LZvf7zgZ4MvnqHCua75ESOf82kwjPyxjDjoAOV2oPTUU8o5qXj4zT9o7R49Ai5isKrPhsJqlK1vRweRiVly/cg0FV00wtQmV3lIUCbl34hp/P/a3ufrQaR0FMI1sCbrvwbtpcXLa33JqskBjR+RY117T06PVODoZLf907EAMVG4Wod8LWgGpCt3aYoSjWVYfhBqTUqtPAD+f9S3wncwdkJ+UwJcWgjn7r1eEVyoUgzKlFsyp0T1QebDfb2KJ9GTtUYY8OvNd7SuZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnjYf/QaTaYXrnv+Ep5g17YALTNIV1XRUZLCwPs2nms=;
 b=ly8T1GZeTyalgtZqfTQuC5LzF1edBv9e5srAgJ7Rs5VXCM0S+C9GMiQFryu9Hs5QS259DzMQxFJl8C8usd9+usMSMwgrI3XSclf2MPb4CQ2tueXZEOSr6eykHGFAEtdv7EXc95q16LLg1rpUhiyxHUXXsQYgaB4323YpN7JpYA+ytZOCNEQflxj6AWviYJfaixyqlp2QnX3q8cXyhG85qAYCRvZzhyXw0gFgIaNl3i9YS8L/Mz8cfD8qtT8m+QBe5yDKZ1XFoK5kpOqXDIhWCN/WNdwWI+7Q/E6XHfPbbW6MTDHZA0Ug3ChDQ8Tdl4fFzMJxq7C1CYf8ceE7rtmTAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnjYf/QaTaYXrnv+Ep5g17YALTNIV1XRUZLCwPs2nms=;
 b=fo9HHGnw29Ny/V8SwNXiF+MqZFHJV7xkdNBU0K0x8IRhGzVWUU/PiXirNpjSv5YK3wtJ+pNWTHf0iyaqv6cFKAGQmGfLBk+GfeLMjUsMfIe9QUlpTQ1YvzkiA3Pm+ysd85lNZ/k+lTGpRkD11YzFO1BHPoVk760jQquktBMMFZMlyZfIMpKtFU8nGl7DgGsLpI1BFZOtd/Tt5KcxAVP6kxXmWxFs96/0DzxqBmNTbgOR2Tqt0P75c5n3LYpYIk8zxYKQVoEHoOTlvxx4cJFBy6Ep7F/tJ9t6oH1BO+Z9XENPA2yEgBBv4tYJVe5VAINAJreL1KenPOtgzqvCxWCkXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:18 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
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
Subject: [PATCH v2 07/30] gpu: nova-core: set DMA mask width based on GPU architecture
Date: Fri, 30 Jan 2026 16:55:41 -0800
Message-ID: <20260131005604.454172-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::41) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b451061-c224-4c14-6501-08de60638af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7sV535rzZdvCl/LMIYIfDKVWRmpUYzfoNdy0/ShSWub9rwT1T64+fw+fBzSs?=
 =?us-ascii?Q?BqRjaPjU0OVb5JTUSCfwPvZn+OPT6wLyFAJgRrM8/0xvPs1Q3JR5Lcx1HPVq?=
 =?us-ascii?Q?vPH6VTgU7D7zVIb/2ZYyPAirOXNBBYh41olAzAy7EBWIXAF5pxge3d2UwJty?=
 =?us-ascii?Q?8UI3p6lgZbX9RgSFLgZFACNCi9t8YM95TEsO2pRpOVfHiIloEDAP5+hdz55Y?=
 =?us-ascii?Q?gR1fcATc2nw84kQOa105sePiFtMSBSBwZCmgeWmf2BDSowY9EZjTSGM4Yg81?=
 =?us-ascii?Q?Qz5gmgz/keQsj0SGXensBPxExqmy4f7qhUzGigXzFjqzQga80AArf1KGp7v+?=
 =?us-ascii?Q?GYZOqxW0PADtXNXq9Zf9jkvLxXi0HuPK47jnZggTsopNvBXTn3mKsUPCbdaM?=
 =?us-ascii?Q?dQwMHE9J5MunUjgw+H0j/eaGaeKQYeWAsETlg6Zl9DNV2Dt7eec2zHwmI/Hn?=
 =?us-ascii?Q?RuH1GJNb15Bb80bUgUH+Apj1pXPbAPFJE4qH9WOnbNhTnqa1F1TueF4EltD/?=
 =?us-ascii?Q?Gj9POCZXb4X3C9a2IYzcAPJ2dB3HJVNX2B4CgF3Pw+Ybl71OJnf3RGUTUust?=
 =?us-ascii?Q?gOZ18iCM/kaXRUoYNN3Zlw6ZIn905BEFZmoo0Fq0stfnM7bC6A8xZv94y8xT?=
 =?us-ascii?Q?lSm3ilpcj9E5NGlNWU/9pTVSMWh8AnaEqSgrDYBNQOCv9blobEdsP4gz3KjJ?=
 =?us-ascii?Q?SpsGK/WTGPjUD4rA/YVW8Mlezb2gh+fRfdqAoNnI3X4KMIpwW4GQnsUAd+xK?=
 =?us-ascii?Q?EKHiLNSJF+YTzeeXd5O/SnfU1oZ3LMsMXnMnklvLgu8gY8ZEc2c84O14zO6+?=
 =?us-ascii?Q?xyFKBppiQlvQSHlqjc85pWmIiXWsnncgnLsuHVVaFi1GbIZMK4zvz/ROYZLG?=
 =?us-ascii?Q?RVYzeTooCp0kKdwz8LvnZsMUYbJPtuKv2OqIt47t8REZz8OqccBwwplqZhcN?=
 =?us-ascii?Q?XeY/piIb7wF2JVNWga8WMGZBHSPBzK1IVtOGPNXeHc+jLWEu2CK/3vQZl4Bv?=
 =?us-ascii?Q?W/izOT8ys8OcXF32MJq6gAfh49TL+RvTvo8Zl+lVVEFrIlJQv3eKcxb1WdcC?=
 =?us-ascii?Q?HDhoaVqe7hS+1+h61KoYM02rDpC9m7botGOoZ0CRy6AbZcSM7c5uJy8Jmt0e?=
 =?us-ascii?Q?wUYHKnWGx2WiyXkiS9c9mQpeiG1ThqM7y60tPXXc9mlNCS2et+9vcdZCZD7p?=
 =?us-ascii?Q?rIYyLz/i8M1IawOKs3QB/t3YMyWG/AM6YFLZ00RwneCFADwmOFYgzYTJGosv?=
 =?us-ascii?Q?1Mvy6so2lqWS4HyESphqYmND2uRzNhlw45a3ebJ4CxLGqyNMy1uhH0xzjX24?=
 =?us-ascii?Q?Cd476fymIodXKSRxx2+iVFJlXP93Z1OCdQR1zW+OBp/QVWIrW+zRZ51uXLJ3?=
 =?us-ascii?Q?OSZWq/7rt3/tcL8tb2z2OZidHk8rNugTYYthbuZz+xpolBPYuC/iBCN6Ccj5?=
 =?us-ascii?Q?7EO76fwwbVCTHkZrqJapB9zPukd1hUkOrYzpGKrjg9av96wQfWNugJL1cpCx?=
 =?us-ascii?Q?lhgRN4nn3J3YkF2xaELGMZLwbFizTdmLradz6st4QsHQekKMtlbt0CDOSzuk?=
 =?us-ascii?Q?ktV7U8N+odj9lbdxrFA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CmSteFkB+s00iL3b3aolnZXDXcDI/5V5xZ1QaBXsfhG8wyzX4zcXG0I1Ad6c?=
 =?us-ascii?Q?y0URet9yJ+LuSKGSlPOfnWL8j+ha+8GHeg9LGLdHslHKlLk9jtOM8z+n3TUk?=
 =?us-ascii?Q?f0gf1xVj4BqqJYH6xUiMHgzFQMRKSyGa227z4mMh9axMQJtt4IfVDsosgXJn?=
 =?us-ascii?Q?LjkLnJLELYJ87ZbLn0owc+pFTI9nh8eWc68p502/WsaZf8/Qng1P5mB0UVrQ?=
 =?us-ascii?Q?ZavKQOqdCesAYKcPS4xn34qiD4nszffEhnHXoUMC5FhHaSG7t/PP9UH925mI?=
 =?us-ascii?Q?eSPbfSbUJzvMtldUYm1BR9WWYZbpf5rawaYfOTVfVzSDY4HksCwNWZZCZJYb?=
 =?us-ascii?Q?Q52T4+CgRAdbRFJ5wivquZCdyOjUfZ1QwjB0vabo2FJYNPkM5vnivExuImmX?=
 =?us-ascii?Q?kO2W0Xawl0DJ87QDhad9jkH8z1BlEBCKRO6DPd7sH0nRF7IkoPDPg2tWc4Yu?=
 =?us-ascii?Q?9p9wC8u8kqarDQrY/YzHdCha+wayUSRed0qK/BvBw76SMYXSbrDocyUuTVhU?=
 =?us-ascii?Q?QNTLVfDuRnPDwYYjmK+MlmQiGf5RDooPSuIkmGZGX7jSQxUi1SpJSmxo72GG?=
 =?us-ascii?Q?NVRl7BVzKmZOvsJXzt2jqWFBlNIh0+Pe+HNH/6XEtKlC+OGnjvu/ETtUSf2S?=
 =?us-ascii?Q?W3vx3LQl9dPhCQKHDqpKGP2XYT+L1s3Bl6GxHZ31dDd3ewk7/zeXAIx4aNQo?=
 =?us-ascii?Q?gc4x7BkMOQhZjp3Abbxi7l3ZtEL2KLNORGTUdFr8dMzFvjwTC2ugxJWK4hBM?=
 =?us-ascii?Q?pox2gnqxjfcUNXPD2WxKkvD2+a9t0AdGKOSzFivwhxrO5dekMmNoDJwsCOn1?=
 =?us-ascii?Q?Icc4ylugj8GjFBNkZOyhnRG15MyJ55WBOzDI4+fMf18t95OaTaYdqYxRLvCM?=
 =?us-ascii?Q?DYMYynBZgCfxTkKURszEzXB0/Pi03cYwWEHJSXgrq+pbcRgIKZbW7fPwX4jT?=
 =?us-ascii?Q?uLADE7B1aKZZ2Istej7nEzpdN7bFU0RFk3nFlU/2IE1f3z/+gAmFTcSTZX4H?=
 =?us-ascii?Q?03cX9JIBJNHb6vxqOMIU8+MX3vVZjtaBK/50q+MultZaurpQ3ue89ld/+DPo?=
 =?us-ascii?Q?8IiOCop3EbR/OWbM+fxqGC8R4MhQXtMFODoLB7KRxOJmK2wsEs77jU/Awto8?=
 =?us-ascii?Q?LQ8brtcgDuEUTRfeqWVwkcz6esNWmceP1AhmlH42jgk6KxSro5ZgRBFQ2O87?=
 =?us-ascii?Q?8vq9EkKDVEU11wUIxIybhxFWzfb/ZeU9yvQ5Qz4E2VJs5CbfHBTGfH0veuBg?=
 =?us-ascii?Q?MtZIftiSIuCgFXo/YdHEDjYVm4qyfgwCweVwD5qTVboHsal1SzGdii42KLs9?=
 =?us-ascii?Q?zpiplavfUnxFZKGxoyq0n9FVcWyqCvMWUXY0/TN62wDsNj5mGmZMO/Pc1HT1?=
 =?us-ascii?Q?EyvSvFlliifdgJRou9hW7pkd4eYMzqSM471lOubR9eMFSLZKdsy7xkvSX3HA?=
 =?us-ascii?Q?kuIK9oXPnf8vjmi+QUbg1R0vvV+DxRx7i9obr/IXM7NZijwn4riJhH7JIDrY?=
 =?us-ascii?Q?duNO4RYCZuCElo2fsyCMNbtMbq7SufbQKjjTc1s+Gakb3/YCGix914pbSsne?=
 =?us-ascii?Q?TxUeaoMunCosVyixl6PH3dvFZpjcs0IojwaRAjnDa2raqvwEXVK/C0XHLR9h?=
 =?us-ascii?Q?DnXbCkaeQX+P70RvoQmWf4Hj49QZJiln22rcD8EVaxdZKfUp5lPO/Tcqbvyw?=
 =?us-ascii?Q?fm7JnPAniTVuqSfqZFurpdzmtFgyGSa/F/utjYrwIsCenJ3dcoVFAbO8nL9c?=
 =?us-ascii?Q?RcC4FIK1Ag=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b451061-c224-4c14-6501-08de60638af8
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:18.3897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZa/40mkPnKv6CE5r9oq3/tSICkqhgzV3n4vZlYgDulxdp10Ho8YjL17fBGLzQmwF1gHrK+BMg0bDZ05tNFQtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

This removes a "TODO" item in the code, which was hardcoded to work on
Ampere and Ada GPUs. Hopper/Blackwell+ have a larger width, so do an
early read of boot42, in order to pick the correct value.

Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 33 ++++++++++++++--------------
 drivers/gpu/nova-core/gpu.rs    | 38 ++++++++++++++++++++++++---------
 2 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5a4cc047bcfc..1babde79aba8 100644
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
@@ -75,18 +69,23 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
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
+            dev_info!(pdev.as_ref(), "NVIDIA ({})\n", spec);
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
2.52.0

