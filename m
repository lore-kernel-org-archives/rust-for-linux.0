Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC83328F8;
	Tue, 10 Feb 2026 02:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691633; cv=fail; b=GS+ArLh/dk+zY44GkmaeEt9HSUasOqTFXNBCW+6T8A3JzLfAZJVwLLBY+v5dU4n/VVVveQgsLav3Jw4xKGZajI2s0PUfKmXBzfhA2Lv1RLNYWIL6PcxwSRyBIxXOq+8O/HtdGJQxeoG7lWYRgNmQAErlAWOQUl2eWSSKhne3Ygw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691633; c=relaxed/simple;
	bh=lhgzmE0b5Lvd6tKN/np88J+1QpF6qj0nOmtw1fSwpTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f4k06iuRTWQxAab9/85FBq8vg6gT5GLIgNUxGufGL78LDSjezh+zu87CqYzApLxcRUEsE0/voPiAQXn8W1qmq4th9upsqQL7ebCOH9BZI+S+gx6OL3K5VFKWX5I/hBwSKdQwjIJjLP9dWUuutYmaiv6ReX1aKG0+Xtv42eRtk8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T+vhyBad; arc=fail smtp.client-ip=52.101.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T+vhyBad"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiwbQKnbXzXWEiqi9lpmP4OZixThz9MGlPr3k2IlclkS3Kj+p2W2jqabpABQ5okUYMUfjnln2BiPkNl9gDtUeCLUWluE7It7hvm4/uf+w27sUFWa5TOQC7kVf5tLfo9tHUoceLSQoTP544LW8gXoOtJcnDc8z6NaRGJtO9XoANa+h4ieE5Tuxyc1LN3HkoyWm4ztFc2Ipeag+h4+7KDJMEHLNVsmfpZFyzfIIdP8lWjf4kLMp+kqKwN3cn1MNHi//4EsoATucN+j9Msfim7uB0sKBnepL/oJejLU60UWBU+Qp9+QlvaUoLgL8HHKwLTeBDRn7sZQwa77Z7iuA2vxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6Vy3SOp+9XgHeZeeRjDLj0mmkmO2vQb/6/l2iDBIF8=;
 b=mjHxlwCurcz9PuP88agqg+l7Nj0CK1/nr+B7ljUqorv9CIg74KZgQNBs4I2uz+I5ZOZ/ivftIDE3CLfpofOmvvmWNMMIpH49rstJImGcGjSmU3crHAmG9lSuT+//DXCwfkciZthDQ8NO+RaC30iSZkw9SCd2bv5JQYMZ0LwBIc35OlnR8Mkc2XaG44eVOdi/9q87IJWiwvFuam6Z41ZfJRJ7VlM/BgriHyWWRlPifPI7SmO+8YFo02PEAo4qqJt0amKkr9P8RZxos/YPe/kyX/+p1oJI3PTc7A4PKKQ6urbwQIwBaHaIGBcufQ6dEB+LnDSVDCAxcR1n6vFjeNITKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6Vy3SOp+9XgHeZeeRjDLj0mmkmO2vQb/6/l2iDBIF8=;
 b=T+vhyBadI5JFs+3Q451NrAHtYGktxMALmiL/gyXfeMBMRiE+9u/LTwQ7f/5j11kTTSXZlmhcUBjDogaRneB//emRhxpeo2gPcuoJ4avlGzEnr5yuilQ0F5WBW/A4R5XPdRUNFuuMQZl4PKacg4Cym295ESSr2n1zHzz36UOkMVxX1RVzZnvNWTMLCvTOvUvkCQmRzdo7OQ8yGW+RGUf4M6A5+cFZKaX/4OhezpnnBixxIOa3EGDZaxY9O41h8nvrsOO5McnlqN8q6n9iu1zXIDLd1woROnp3LwjyRbavgFn6ew0hfhTrQk3yOWQTHzywStoAgJAueRAwPyP4kvuaIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL4PR12MB9506.namprd12.prod.outlook.com (2603:10b6:208:590::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:47:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:47:05 +0000
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
Subject: [PATCH v4 31/33] gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
Date: Mon,  9 Feb 2026 18:45:58 -0800
Message-ID: <20260210024601.593248-32-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL4PR12MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d75b96c-a351-4efa-d336-08de684eace6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Squ6yfbzFusjQ++RJozqgF+PoqUZGpmyxdojKJxPTkQ10FwWWBlYLqPqPygq?=
 =?us-ascii?Q?Klp0PH3uJz28ZePBTnIYuF17JvKZfkn+K3Ip/wnU1xcdjfFtVezG85zH25D1?=
 =?us-ascii?Q?XOgAzrRZsDywoug5p9ccBUi3Y4oHt9ONJ41YliFlfn5LhS1r3FVhN5yak8k3?=
 =?us-ascii?Q?san7fjeAp/ro4+n8L5eNwVs3WQzBuYmEug7GqknVR/hvGG9MuClZZPfZAwUe?=
 =?us-ascii?Q?Sm3uRMM6vJxt3J4IzMuZvDTt9GfV1sjdnehGajjWZoH4dNbiTMOZbfGymrs6?=
 =?us-ascii?Q?Yi2CrHXAr0hkKsrxeW+NgShSEssQnSyYLVECO1TBsKp4df1zrG548iNqwF00?=
 =?us-ascii?Q?QGa40YJ0bpoItkFMKI6EueDb4j4VK1zGRK/333/EtABbHU1XFoMWr3InCW7a?=
 =?us-ascii?Q?pQ1v/vOyEK3CPY2/REe/LQkTuRfXg3ne+i3X7DJSHLD4MPc2IFaorzNbvl/n?=
 =?us-ascii?Q?6TH/oVBNpKhkqirutvoDD68DXltCOLaXiFxd4HMZOMUh8WotejrowMl75Hqq?=
 =?us-ascii?Q?owu3T4Q2N2uthcHr2COXYcqKhuTp3uosPdGRlU9MRIXkbiw/PGKI9TKNw9cz?=
 =?us-ascii?Q?mwtHzV61kBCESKnTizjK5BsySR7SgSYoLKBSokEJqSU0ilhOtwrPjopusQVJ?=
 =?us-ascii?Q?TtJfNNgttjthtSsNRoeJthHz8UeipU7t9aw1oLGnEAqg10sg+/DFppZOYrAv?=
 =?us-ascii?Q?lRlHs2x9Tg6S0eEqA7dNUr7vf6eQM7NqReuo8NiQjXed1lyJECXaaMDQrjKD?=
 =?us-ascii?Q?sYnsEQ21eC94oUnqMo18E8J5oBCWOfSMOqkTvu6fHIOPbqyz+J0Ro0WtClc+?=
 =?us-ascii?Q?BHQC541OpEQen15+GP1fhq/jdkb4YejAE4kuGZSwjzO9Vn5drg1pHcpqN5xq?=
 =?us-ascii?Q?UuS5hs1yakJuUrFtGOfd18Q2elWsVyxEM5gA/sHZiECrStuFuETiOXc43tlL?=
 =?us-ascii?Q?FxyTQXWRMFzaAuV8ihuZ2WLG4Ns29F6eXEYHLwqF6yjnR5jbxL+SRdKyAwWX?=
 =?us-ascii?Q?omeNW7UqbYWhy8vnc/L7YMR26U/9Or3Sqqq93/fGtOuraobLQELBAnty+RTS?=
 =?us-ascii?Q?HrJWR2M0wvpqzV5ialmh92RPlIHCpYQCSaL38sLMAAuFHFryKpDrj7SGrcZI?=
 =?us-ascii?Q?bdG7TfRvQSDwqVVpaodQx0BNNPb6/3FuDqDwAtX7ivrcpkgPKxvWU5YDL9Xb?=
 =?us-ascii?Q?ku8UN1SxPCa87mT4Vi4hUfnNzlDZhPtxFxEzRGhhbQ/s38HbXFaPoKIw2zml?=
 =?us-ascii?Q?//HUb9EHmYJ3oniuwlRr7Dc9Ca3awnjC0KN5eOCcMdAQaeDSmeyU+5z23Ttr?=
 =?us-ascii?Q?bA4kYAgZB4Sdq847p2ij2cZknQLPK0qassEyL/9u2C3q1doI4SCY+DpiRRLX?=
 =?us-ascii?Q?JHFg4yZAvzGQfvU3ekw1te3+4DWWVixwkvO1jt9AKSLB+ZjzCN9EK5t1iAsO?=
 =?us-ascii?Q?cfaTFvsMfIFRri5hwZyhXTsMTnLMSPvL11IF0JXMrYG/gcTvRkYvidASq8Mk?=
 =?us-ascii?Q?ULBNLnqxDH9qF3Kvg1tzmpTleOvOUjcSjDRCcMeVZI3jtDUdbzoNlzYijPrb?=
 =?us-ascii?Q?CpQsVwEbNRzkjqA7sls=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qGNikb7SRVWR38lCNE3k0FH8hBlMJOfEUKwLESGGnR/devW7yykJ2dYmX3bY?=
 =?us-ascii?Q?dhIG+6VX+WaHTlKbKEK+vKDtExRaSHarLN7bYcl/XqM0oqRwaFap0gL43y1P?=
 =?us-ascii?Q?vnW+IcfNW/5j1wxFrSmxuZ9enA8Q4oZJ9cWWGOohqkqxDrA57xZ4xJDmot9V?=
 =?us-ascii?Q?MZUSXARUkWqGkaVo5suIPgysRtkyaBwvMrQWyBCq4ApWnEyPYsX3m8HRAUzI?=
 =?us-ascii?Q?DN4p5IRbqjoi8AVxeHryTCWfKlA4tGnyyznB0KtL1hb2cqZbqkWN/ewwYyOI?=
 =?us-ascii?Q?K2UWD1lW1W6XM16hvufhKy2XNKrvpYZvFbwzcmAB3hxwsAmMPnmqchDWZPZk?=
 =?us-ascii?Q?DcgTZ+PET5F7eljuyZY4pNYy72sIy4n3frvOA7StUARcpYS7PbGFbBbSJg1/?=
 =?us-ascii?Q?kSB/APb/Nf29DA3AikpzzdYZzA3f7i+RKJyQVRQpfN2bFuyxlyu1U9CbS+l5?=
 =?us-ascii?Q?ySL8nO4Lae8T6QfOrrU5RU9n3gz/tlXFEGVW83hflJg1v1R5d021J8kKZR/4?=
 =?us-ascii?Q?EyLOR2s7xqDoWlX185xrL19QfIO/857UjNVHYc5jiKGHyMEyjCc+sRfKGVyx?=
 =?us-ascii?Q?fUOj0codvUrMm/xmp2fWCWOBnLmoovEkRmgGPHdo42pmFWtr5TIl6ZRiMKfb?=
 =?us-ascii?Q?fMWEUoCSZi+TVoeO/nfvXJr+7eD5lmub31RmtNp6hrg2N5QoC+IfV7MWWgI+?=
 =?us-ascii?Q?+wRdR7i1s2mKhvKu0WR2X8saBrAjrQvUxF5NwUEVl5wlOUHFp+si9p9FjQu7?=
 =?us-ascii?Q?HO5ga/xeWqygEUcZqL72gBuEmcIOHCK45wU2r/B5rOcY1QUalDxCaAwawBE0?=
 =?us-ascii?Q?Mg+olJ5y3ReRSQKXmzz1k6p49uxDG+UCIeefhu55KdRwGG9ZNdKSEAFuWmQg?=
 =?us-ascii?Q?I9yr5kF8anrhGqGUPf4FXdhW7n5zI2NjBRX9ScJPO13qZzLUAAXEOXh/0rEO?=
 =?us-ascii?Q?Hg4Q81mz4CxjoudZE1ZGA5bcW8qohKn1bqL7Wc9th90h/H5OqoM87C9Sympk?=
 =?us-ascii?Q?YnGb6PQD3GVH2igent7M+3jZa5ZICegE3+yvTyVxGKISGHJ36p7SBXQeoIY9?=
 =?us-ascii?Q?hopvYSzsObetjy1vg7uvO4pls5f5oPXsGSip6rFfD6bB0ODm/dM/R21euzyH?=
 =?us-ascii?Q?uL2LJTAJq44zB2IdSvCJEs4ZSveY/jrHJm8GFR5ZF3V3ePSe+p6n0WMphj+g?=
 =?us-ascii?Q?c5k/m9M8Uv3df4XOQziVDfc2TIMNNxVDJsPHbfxIJLjwvQrsA4wSqOUs3oDm?=
 =?us-ascii?Q?+ZV1xHW55P3EGB5GNI/34AoN7qakpQJvwWWEmqEy8cZIhdpEBOHzh1Waw6PJ?=
 =?us-ascii?Q?ALj/MiH8Fohko6JqGnyayTBYwjvkCCCySz+KUdOUrMM0dbsnTVOabnwAPj0L?=
 =?us-ascii?Q?5T6CbVHJNE6D2Gm6/3Sx4s0ysNznM/3PwcPF/O4fOzHJ7BxhF4XQ8HfsCSPD?=
 =?us-ascii?Q?M2XhT4b+9ALXsbuetbWFRWSaeLcMaCPviPUfp8RHqJ36SsMf1au+8GTuMGFp?=
 =?us-ascii?Q?a+begeJ+uudNcGOuIlOz7Kgr9eXlsLce2JrYnyyba/M32qLdG07FrGqiLpuN?=
 =?us-ascii?Q?B8h2PUEqPTQLyqXift4JrQNKPZLIOxuNNFMtmEoV1k6yBGSMlYm6S0zzG+jN?=
 =?us-ascii?Q?BsHccbN6QCcBzjgDKgcSYj2mXTtdzT0xIbDKJ+wEj+ghK5XZJph1PIkPtMEH?=
 =?us-ascii?Q?G522NGgfVrW47HxYmotW/VM6LQN8GN2Q8hNc1lklV4mlQhAXegkQrndudP+Z?=
 =?us-ascii?Q?72EQertCMA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d75b96c-a351-4efa-d336-08de684eace6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:47:05.3829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqvTOM3VZVtr6j2NdfpQRl0kwqhFMCTZgQ5UYBVrKvi4LhH5TCKuqAVOP1oZLWsvn1AutTIhbXgobFad+ct7hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9506

Hopper and Blackwell GPUs use a different PCI config mirror base address
(0x092000) compared to earlier architectures (0x088000). Pass the chipset
through to GspSetSystemInfo::init() so it can select the correct address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 18 +++++++++++++++---
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 80d57a54c0c9..aae5ffac262a 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -388,7 +388,7 @@ pub(crate) fn boot(
 
         // Now that GSP is active, send system info and registry
         self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+            .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
         if matches!(
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 8f270eca33be..e6a9a1fc6296 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -20,6 +20,7 @@
 
 use crate::{
     driver::Bar0,
+    gpu::Chipset,
     gsp::{
         cmdq::{
             Cmdq,
@@ -37,12 +38,13 @@
 /// The `GspSetSystemInfo` command.
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
+    chipset: Chipset,
 }
 
 impl<'a> SetSystemInfo<'a> {
     /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
-    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
-        Self { pdev }
+    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
+        Self { pdev, chipset }
     }
 }
 
@@ -52,7 +54,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        GspSetSystemInfo::init(self.pdev)
+        GspSetSystemInfo::init(self.pdev, self.chipset)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 470d8edb62ff..fe8f56ba3e80 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -10,7 +10,13 @@
     }, //
 };
 
-use crate::gsp::GSP_PAGE_SIZE;
+use crate::{
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+    gsp::GSP_PAGE_SIZE, //
+};
 
 use super::bindings;
 
@@ -24,7 +30,10 @@ pub(crate) struct GspSetSystemInfo {
 impl GspSetSystemInfo {
     /// Returns an in-place initializer for the `GspSetSystemInfo` command.
     #[allow(non_snake_case)]
-    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
+    pub(crate) fn init<'a>(
+        dev: &'a pci::Device<device::Bound>,
+        chipset: Chipset,
+    ) -> impl Init<Self, Error> + 'a {
         type InnerGspSystemInfo = bindings::GspSystemInfo;
         let init_inner = try_init!(InnerGspSystemInfo {
             gpuPhysAddr: dev.resource_start(0)?,
@@ -35,7 +44,10 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
             // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
             // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
             maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: 0x088000,
+            pciConfigMirrorBase: match chipset.arch() {
+                Architecture::Turing | Architecture::Ampere | Architecture::Ada => 0x088000,
+                Architecture::Hopper | Architecture::Blackwell => 0x092000,
+            },
             pciConfigMirrorSize: 0x001000,
 
             PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
-- 
2.53.0

