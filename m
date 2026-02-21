Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9602B32827D;
	Sat, 21 Feb 2026 02:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639824; cv=fail; b=nr3FIr+yFtFnvx1keHRNMArWJfja1gAh5REHErEzODkKS5X4rFOW+BtZ9cUSHbzsglwl2bSWRLZzBanDy4BUScuQaqjlZ/xnybEXbEe6Cep0lM1SCz/HfSicxbwKUshwM8KT/h1akv5+48GISfrvnUpUVhSCfv/MaIui5hH6PWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639824; c=relaxed/simple;
	bh=1BQjTBsS1qeXvtzHGNZU+cZWQa1C6FBlgR3qml/VNBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rRO9G+gONYrNm9PXZdw94052HDE0T6jExy2v3UEmmgWh8jJytknv9wWtqXCLE/w3vYGR1GQumPmysXXz0qIUGnmG+oVQhiQlYhbvboC9rfMRgwL2Rkjt+NU+MG7eQ+ODK8vVniOQkPUyPJn+Tbhc/3Ark7OcpVBCcinC5ZyXjeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R8GyHyzP; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R8GyHyzP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSYAOcTG5ZWOS0312f0fADZtq55XCi3tDiUvF2Ad7saKKzXXi46OjNWOAdGEjEXtNrreivTOmfY3n4fiKodFdIjYD8uFGjtxZJE3m1HtvsKU3GcVh81vRh8xuyqMGowXWNqyUf/Ef1YhYzj8IxvX+R27Gjk5qdQk4HjK/zXzkIr5dIb+YUeSOqIu1vGQaqPShHdSJwjOYdV9WRV3aIexs+PqstbkxfOT1G0K5hLr+ey9DIo0EfCYt4KSceEghwy6fU0IrFx32YeJ9Qj6BepmxLKdCYnU4Qh9eFRWpMNsLGAZuoJqGid1Q6oNeb64Ag8Iz24OvNLgBffrjihf2fqwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFQXhrk0BG0Wcm5xluB9UJO9Q6ZaiIs5SDUUdhSVVac=;
 b=q5O6KrbcqTO3eVCWIst/u1WyIkbRI9JgxU2rO8eqZxDcr7IpKFkHoviKQkQpbCh+D3d36ceBX3KMiA4qWUuXdMhVuNxGMmrgBw20BCc+7ACP1RYyTxburFubpjs0LYiHIIGstPob/uU1ay0JIFtsUiKEDenQfeFLVmdGeqo81bOErY2aNQQbW8c3XV6XjIaZ2W9u6JJD9OLKEtOM5AAwM8gUjNKMh9ergCHJRg72oVt3pcCIDju6TyYErImCAMRN8UX003+2CwXeH7cU41rg1u8ZqJPSP0jZD52uZnH0zK/iwes/QhF1vRJ4PhZpNeluZBn8yNwJS4Adn4i6iSi8AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFQXhrk0BG0Wcm5xluB9UJO9Q6ZaiIs5SDUUdhSVVac=;
 b=R8GyHyzPEAPX2MxoIqJubDpcvh4st8E4C0S50MpJP+6NmtEktm7wv/v35Nr5E2zWkDZWAn9TNGojY1E4OjoK8PkHOhojx6ERByEsOCbMNDAb9Krp3JvqQVpiZk/U0R8js9O2iWM6xgVUC8j9Iw1ZqvotLRpQYuhAVOCaDdF/YFUFtL6e6hjvmchoCqYj57/FMWbzwkkRHZWEq8X0a120ZLoIMuEK1lBlpSb9OjymOTHJGA88b+bC47HfOAwtoChpgPt3a5je7LXPBmYAyD/ZYzilbdbChfokqZE2wWUTOmZdwSGTJUr5CVz9llYhj0QiB7DY2N+2qzsQx0XVab+tJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:10:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:13 +0000
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
Subject: [PATCH v5 15/38] gpu: nova-core: add support for 32-bit firmware images
Date: Fri, 20 Feb 2026 18:09:29 -0800
Message-ID: <20260221020952.412352-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff0cc3f-1d27-415a-67d7-08de70ee58e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0kQA9PGegL8+OEfHlRucHqIVH0xL4iyGebAfyXmK8wWlOijKMrP8xoZS38gF?=
 =?us-ascii?Q?8/K8wq5/rRu4hVim5jIVCywHQsFoJpwGWm/D5mJOrU0c13AMMtcayazm8Wo0?=
 =?us-ascii?Q?9MIQuejwVnNRBb0B1HadVeORh0Iyu8iOhXWD1Mn2F0gQxe8CAzRPCOCG2OYE?=
 =?us-ascii?Q?YjBDe4tA7P1SgQ30D9/xW7C1gdl5kDrUQlMnj13kdRl5hbsaU7b6+4V0wY1I?=
 =?us-ascii?Q?I8rSTM1JnShg9a6GArWIshEHEARb3HwIabSi5pVlw7A7stWHihFUmwGsflRo?=
 =?us-ascii?Q?S3mNPbyTb3s+X/YhhNSeD1SPRrH5y2ohBEHlspQM8C3Iijz1TExSy+U0ZAM3?=
 =?us-ascii?Q?pGvSXMxFcxRbaPRzsDHfDYxH3UtFv0eIt1UNWzdz5Rdzy6Kb4jGIHZargUJ0?=
 =?us-ascii?Q?OTRUc3jnIOzV0ndb5o/udmXyB8df2/6CHbP9rfTUv853Hg71APuw2AjDMUn+?=
 =?us-ascii?Q?1RoKNJMNXhWk7BLje9hinOUPrId8TIwkM4cZS2xe6jXj6TBmIE2g/HcSNYk4?=
 =?us-ascii?Q?QEq2EpMerOX6VPA2gRwfpRJ1NUZGP+8Y/ZAetRsys/2GhcoFXFksu+j7MzEA?=
 =?us-ascii?Q?eVdB3LVdN5tu0AtgHZ0//i6BTfuHTxvszpeSpJISDRZmjngQDO/KflaikVRh?=
 =?us-ascii?Q?+3b3EvdzldPkQagb0XWLNxIXFH+rY/TYZb7oVbn2YDChNYm9zcgs3xAlNPOL?=
 =?us-ascii?Q?siQ0XjUf9QYmSVMKSr6dIvTvGxBnMxLyEQhwKhRotwHL6UM9lNDJJS+uzc/4?=
 =?us-ascii?Q?50GRnDy64GUMGKxnFbDBkLXzTzbUVacVAhdnFs0Szw31VBreWTP/HJ3g6QP/?=
 =?us-ascii?Q?DW4PFt+gDmDufPexVBoal3J/9ewvu8FW/S13ZQJ7nhrETk3NhXMPup3/xBfe?=
 =?us-ascii?Q?nfq8k7G6my4TQGHb+qOC+qXqzwBaecV80WXsp84B32wnb60RN7GgWaTw3ivI?=
 =?us-ascii?Q?4RLrE5HhsjU5BzTRHVkU6TQm+oZU9PiWVGr0U0nIUA8fBMVqJIVUu38iQrln?=
 =?us-ascii?Q?Jh8UzGhfOHMJoKWMgJVIT01hi8ovHXBSCB7MltOxDNDsJ0ifYZfJTyFQMaPc?=
 =?us-ascii?Q?tDSGwC8SPstR8Qu1WYotUsnacKq/oX11BymXW/YEa6OZb30ZaKXEuLhX90zJ?=
 =?us-ascii?Q?hJ0XUWC/beMjZw5lDxOQxajX/Siwc+IMAZOcCBO/mtjHNCbjgYkZyR++Razp?=
 =?us-ascii?Q?KOH207YkAGLFah3BQ8MmbjVV9Thc8BQegL9qpcJXm4PLlqdcO+jcxdK/8bee?=
 =?us-ascii?Q?mXi4qH8kW1SuHd8UMoHXsdNOtQ+HAFlSWg3BVr4/609Sn/uSBCNe87ss4mFO?=
 =?us-ascii?Q?5Eb/TtKq0KpGtRVEqv5cmPU8o934PmmtqXasbySdqhl3APyfWhaBnSo6BwS8?=
 =?us-ascii?Q?LfKM5diCrdjJBBd5RJb0gaAcbX3g5JRT8RZlua8NY68HxmJXGBVUzzcyJM8C?=
 =?us-ascii?Q?PIiwewYnW5eiAqYKiO7Xoh8+b5RLmt9kY2VnL3fRsI+oofpbVkQkEX+pCx2z?=
 =?us-ascii?Q?TpUJfZvN79WVUb3iMddRUL8l9+VNKiFEbwaKJ/xG6AEVUNXsP38fLv9T59B6?=
 =?us-ascii?Q?eWVIJgAuCi4RxaD0CfY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zXJlPgpKimVM9ObRwUDGAZI3ORd4N9FqxPFvyrbWYsevYHqU7c3eZuYHCYu6?=
 =?us-ascii?Q?0DQqpGngrpAqWovJfIdi90n/TBq53cqzfOI1OCEuApA21nJ+YIZ0iQeFMMZM?=
 =?us-ascii?Q?/R9ybslQlXeu5X8c0ySYwsuYcM378+su4n573/BWEm8o6cX39gJmU2ZXIU0E?=
 =?us-ascii?Q?p8BTrqHMopoWyr9XvFyhiOFtB3O75VURJWs2m7jBLI2fwFE6bjUbsOlGaFRh?=
 =?us-ascii?Q?EbG8O42dh9y+aeXAnM8fhsmbAUUnb0XAaa9GYF4UUjxSQKaf4QfPQp+dHE5F?=
 =?us-ascii?Q?spHdrzJh0gYQotWgMszWQwhdcLsbOiM3/uxUwPEgu1kXiuy5DVPoUbnZKi4p?=
 =?us-ascii?Q?yR1cYHSNL1U2R3tCj+V7Z04b4jxeC9S3WXswhMNXiVkvUu3kezxiaKPSN4o9?=
 =?us-ascii?Q?wzXnB3aTAxPKe80K8YtH+/BqK3BAlwnZTJK1dlNsv+p5jow320uUYpyIbYUE?=
 =?us-ascii?Q?H/PCjXa0jvBzUPTP8G2tuW81tpDWgVBWU1/f0m1VkO/9i68zX0gYK1l06Fkq?=
 =?us-ascii?Q?r2SDIk6GJXLeorUkQRygq9KrqfF69h9VdcLIARdSplE4amAl/iV0oMKlNRYt?=
 =?us-ascii?Q?+Da0LaSluiesGl6rSXoFiyi0/lXiGqeage0XUtFUc3ivCGVzwFnkaxaYLyw5?=
 =?us-ascii?Q?wn+bemYiPSjNB/dA0UklmjWc4cPdRMV83OHJ9sQqUQA6B5JjaU17wwETzfEr?=
 =?us-ascii?Q?r4qFWYCgkockiLdwwZgvzAk6QZ4w/vBThf4srHsm2h4nNBadGx5jaqeAiDOU?=
 =?us-ascii?Q?II2c1YM2lxdXU5zm4q9ZycjINZgUi32oTW72VaZ/2QPnKS5MI1BeADAA7mra?=
 =?us-ascii?Q?zHFUx7JraGxSkxgkVTqGQinjIsSD5OhJDP9SX49qiPgwqfw8pBvbpR3AmSBH?=
 =?us-ascii?Q?gxxOmwLG9eE+n0f4/iVkCvfXdM2S+B8m21RxQZ9cEmI1wTeZaJFuRj5iZ2Ho?=
 =?us-ascii?Q?b7D2DlMrh8B+5BMC1KvZPpidCz4gTj9y7IqKjXMpJbOlZyzeuou3Aaa8mpKA?=
 =?us-ascii?Q?NZk9RCRuEKbcTulqDaPhYGCSgbpBpn3yOZ6K+ANzrBNjl8HOSEJFwWWYIDyq?=
 =?us-ascii?Q?x/4mHlq80XiVpE5m3CLbNHeIuun82RHCdWSn5Xcx87Ii+F3RQrh4LbXjgWhz?=
 =?us-ascii?Q?KsYM9oMqBtkX80TUYHA3bIE/7cC1FfFkxRwVa/r1AdSziIJHRJsYLyN630+g?=
 =?us-ascii?Q?t3hP8h/WQeuP9qBX+L3qBj11GFYz8pCl01fLXhyUh/d5eKDeTBufljXttlLV?=
 =?us-ascii?Q?EVfxmpAmpEldkZuo9By0jyb9lT0ZyMlleJVDCBbRS5MIC+a2OXILGJsOEBfJ?=
 =?us-ascii?Q?GMrnI9olNdMSc758ngAhQEg3Z8mbzCbZ69DgYgSDVsT5v52uJQU7HPsVDh2I?=
 =?us-ascii?Q?bRxW/xe6DgWf9CcfHqlhmqQDj11bDJ4X0i5Ehvtt2uo/j/O2W7oyO5KWQ5gS?=
 =?us-ascii?Q?0j39uYYKHzJAU7TPb+y2J6VJixoY6DvEA00jj+BQjQDktJoynI9uEQEqWDVy?=
 =?us-ascii?Q?/PELYpMCIwwgSROyzCaJ6HHbYlfKHdQ67bADoKW8kZIhTjFALFuRfVxarzwk?=
 =?us-ascii?Q?b+MAF/InkpnmfFlg4UJzB1uCw/882rLcCH+zxTZMjx/w0S0cXgit3z31dFQu?=
 =?us-ascii?Q?1C2tCwP7SLlULZYFEMsVGV1jyDg3zdV7uDkYguv0+V2Hd9Kj8mTwinLI+58y?=
 =?us-ascii?Q?akCOwiyCG3oFnUrrlBB3cQ0VhAakdY2u2eCaHOA0bNDrL4dDlY5dOwDS5tqI?=
 =?us-ascii?Q?HE6yOnqm+Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff0cc3f-1d27-415a-67d7-08de70ee58e4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:13.0399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTRpxTYAWysPKQ7jhqPhaaBzCtlOsjs0yWQwvUvLIB1s2sI78xsWretXeXpDIjJcrmNJxrzKk0pxoHhDu6u7ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

Add ELF32 header and section header newtypes with ElfHeader and
ElfSectionHeader trait implementations, mirroring the existing ELF64
support. Add elf32_section() for extracting sections from ELF32 images.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 46 +++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6ed76a7e15f1..d94dd3468f3c 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -507,6 +507,46 @@ fn size(&self) -> u64 {
         }
     }
 
+    /// Newtype to provide [`FromBytes`] and [`ElfHeader`] implementations for ELF32.
+    #[repr(transparent)]
+    struct Elf32Hdr(bindings::elf32_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf32Hdr {}
+
+    impl ElfHeader for Elf32Hdr {
+        fn shnum(&self) -> u16 {
+            self.0.e_shnum
+        }
+
+        fn shoff(&self) -> u64 {
+            u64::from(self.0.e_shoff)
+        }
+
+        fn shstrndx(&self) -> u16 {
+            self.0.e_shstrndx
+        }
+    }
+
+    /// Newtype to provide [`FromBytes`] and [`ElfSectionHeader`] implementations for ELF32.
+    #[repr(transparent)]
+    struct Elf32SHdr(bindings::elf32_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf32SHdr {}
+
+    impl ElfSectionHeader for Elf32SHdr {
+        fn name(&self) -> u32 {
+            self.0.sh_name
+        }
+
+        fn offset(&self) -> u64 {
+            u64::from(self.0.sh_offset)
+        }
+
+        fn size(&self) -> u64 {
+            u64::from(self.0.sh_size)
+        }
+    }
+
     /// Returns a NULL-terminated string from the ELF image at `offset`.
     fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         let idx = usize::try_from(offset).ok()?;
@@ -559,4 +599,10 @@ fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
     pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
     }
+
+    /// Extract the section with name `name` from the ELF32 image `elf`.
+    #[expect(dead_code)]
+    pub(super) fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf32Hdr, Elf32SHdr>(elf, name)
+    }
 }
-- 
2.53.0

