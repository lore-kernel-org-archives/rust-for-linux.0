Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFF1318BA6;
	Sat, 31 Jan 2026 00:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820990; cv=fail; b=C8SzDRnw6KQvHw4e4dc3gg4+4Mvx71wwnCodDpQ+fF6kvaGfzWHWUZuAMzPcN1qAUJAeJ+VfaifDGtbEZ2zgdd8fF2FeWq7z12hvE7f/TolMVe8x2M7mqMIZM69FkBiZBU22pN/jI3VmKQYMyHpzYJgUFY4ARgXcqgHqK4D1Smo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820990; c=relaxed/simple;
	bh=Zv3aOoDCLoYSSGuzVxdj+SUGTjz6rxQFBQCLPLOyYDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kl3lozVJnOwzFuKxnx7ChAlvGpye1mF3QMP1SIOEw95P5jjYWHdxuD6wb32WovLkwDQrcgubwz6cZ9YZbPqG4vycdN07YHtE4KVhRk36wvW/jWFUfySfYd63xzn5YHOfg7BFmY3WCLHA3bEsG747nqmGH53j+V7Fus6KofoZUlI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PzUUgIWu; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PzUUgIWu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiCOyQphnyOMdzs3/VkEjePKLrSGgpHwUZFK42IfGlKy748lnt7WLNhCg06y9IxScp/ZG3jyXnAb43HtPifgHrnVRE6G2ff8yL0hyeZ/QGYyObNetJ+PGHMtLFq5ltLZCPE4Etl70Z5vmjw+/evFtcliraSo+1/ZQvh/Kg1RnTm2uRBCBE86zJ6pa3ycdTiKj5Dw0m8kHPdpibM3B2vFAuZYjX52wt7MdHFHpyEHcZygkn4GqNb5Ki1HRYL1DLGgEUnipmscS94l44AUGQP5ZslakqmMcjFs0yBnvm+vv5E+W4PDDMC/YrVrz+oSu92vGN7K3eH1UuXH9B+fM3R7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K97o+ExnC+mOG6C5+FGSH/tYISh5wJcNlMqq+RLZzUQ=;
 b=MoEs0f9EYNYMojSutSlpzAzzseHIQeRnB0nYF1lHweXI+k8/VCSZZ67iznzHVd8y53vhkswlnN7SrntHCRGlgWKkWqH5MkgVllWQe9ChJPtfdJKMcvY7WLnQesgWznyz4dAUa82uRrspXODFCKbXDYEJc9hqH+SMEOUayz/Rd1tM2dDnH6I9UrR8ewQZevljocYW/W4t0WVhwO6lwYdyxaA+GNwWPE8gNjvtgOAzDzdLMD8fOjqZjKk2qUhXQXC4hSRekjDsnP7ZFEBC9p8+hQVJlnsRuDUr7CRwjIu6bbYNkkMGI02sGbvIwGr5/kSAchKD2qX5hzamIr8bsRNUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K97o+ExnC+mOG6C5+FGSH/tYISh5wJcNlMqq+RLZzUQ=;
 b=PzUUgIWuXrHXJRu8F+9kGwiaIVOPgc/Sw+qAfe3McqJGcZ6lyqAgwPTQyq6rZmC9BpVqhCodTssNfxOqeL+HTco78hD2RCh/D0/w/XpiMmyAD8YiOlqSCr2evO2p7h1ts0o6BUkAr5+2ZNEIXhn7F7VCm4XamQ3valDYflWZQ/YoTFSZ6aOcPi9NLvYWopX++CkuvN15ioLva30cqkQpM3fMc2TExMhbzQvgR09iZwQyQUqRKM+RHu9tp3floXvabUbv/N4na/5B+XzWnE1sQIE3DSbcBhhBA/He8D2lx9yehiTf339r6uhuUSv3ykM+rL5RVbK1J7dGnS+328j7sQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:19 +0000
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
Subject: [PATCH v2 08/30] gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
Date: Fri, 30 Jan 2026 16:55:42 -0800
Message-ID: <20260131005604.454172-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c2ce29f-2263-4282-5ce9-08de60638ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ESiEACsRyM4bBgKvXQYcOz9jmuzcm/yENECYYXMpk1KqcLw44MRSZq5AjYw6?=
 =?us-ascii?Q?SEhOC/S2pSClFZZuQg1PM2CG7eXfg0hzHylVjCA+XoVVKrl7h4fP+4gYYgCa?=
 =?us-ascii?Q?J9ngntYRpz4UMEqoKtw80RxXWRL5rIy1uVuP2Ti+wj2inTb2ncWcllQgCxa5?=
 =?us-ascii?Q?DJeD3rbe8VI15yVhgwYXY9pTt4RpQ1LXevWWSKgWl0plHkuEvdHP8v8iNGp0?=
 =?us-ascii?Q?xJXJK2j1eu2EUhE8HTAjAE4AZScRL6bM/9Wp1KQxaA7z4HGeSjCK+i1dr845?=
 =?us-ascii?Q?xprHB3+FMqw8M9+DYahriNgiotkO+rFnuMTWKhO9OnPRXLfKdB5hLZOR/tE8?=
 =?us-ascii?Q?FOI00Fu1k2iUpx3vg1e9cGDwFlnXghtNPG7MluSyPxQ4Ju19wNQ6d8GWdcOY?=
 =?us-ascii?Q?rFQ4zY9eSCC2fUzPg6MhztgDMzhazxMbYAPimFpVFHRvf4iQOYaMyJ30FTZe?=
 =?us-ascii?Q?UR0WmjJ1uX10KB1DHVfaiEsoVocnbbnX8sW47iYY5+xo8VEzCdAkJmA8UFGa?=
 =?us-ascii?Q?pMddqwd3Tm0Qgl6zVrr2ZKy4Zc+SDmpLuwKIhgtwLe2jDai9twDuYC3VAaDn?=
 =?us-ascii?Q?54T0pH5Pm9iBlFQgk+gkaUY4W/Dbe0vdGLbfJgySsyq47SY84jzQ7h7gjNF/?=
 =?us-ascii?Q?T1nK8RCyo8J+DhRCUUvoTZb3fL88KHZQ8wHrQV3TcjuNidFdxmCq8KH3Re/X?=
 =?us-ascii?Q?decuYQd34tAKcRAVl7AbNNrZjDyLwsYRJQ/Lx6jv664gKnaXnVRb77nmNO8P?=
 =?us-ascii?Q?Sa71JVFzvRQkJBaGec+BjyvqvD9TOX51P3GUZqdrEzVE+hE/7cBv72Oh5j7P?=
 =?us-ascii?Q?YA3wYiV8e18oonh2NaVOMcr+8UKLyZq4XLt+9KEW0HdqmSXiKuQG2w1k7NWS?=
 =?us-ascii?Q?VlM+hsXyWOFgdhdpKIo4x8M8kf7XMztrE9P28ruXkhIxy96iVMlX2nyRJtv6?=
 =?us-ascii?Q?jeNjbzBywUYc+MSBMKcgytwBGTMq8mFGUva58qUeMD7EQSR80KCUQCAgVA4B?=
 =?us-ascii?Q?z+2tTYBDxqV/dy5J8nEKMDzW2Il5FzYa0MGF5VrkWktBanU7PmqBlDjsvhJi?=
 =?us-ascii?Q?h9A6NK1fRuJQYX6LZnmckrVuBNb71VrEMqPBFvhH6NQfCxU2IkChqUXvAFoV?=
 =?us-ascii?Q?tKZqNhhT2N5IpU9cpJWUr88FIVjy9LUjaHalPphkY4j8mkyNBvviiwHHmBK5?=
 =?us-ascii?Q?IW9bFuVoWcKNRg+xah8raEx/RPg04bR9oJXpRbq6ube3/pKfHB0uN5caEQ//?=
 =?us-ascii?Q?8pM1D0tBTmi8VRZrqwc0WBItD3UsRGo+X9/3VH9m+jkLOubxt7WzZbfOSKA/?=
 =?us-ascii?Q?3HefeYX9tbCqeA3/7M4pk5Y1M+F4dcT7gULKUi7dGJ0lYbbaRNfW2bXDbkc3?=
 =?us-ascii?Q?UM9zC4vnrb26d5X5s8SLlz8HYeurHQSN23UNQrb/gMaJ0t3Pc/KBxLb6yek1?=
 =?us-ascii?Q?3UE70AXVq+gDx/iT8679+OThlWeFOb/0caC5RM2/Sigt8dHFb93CL0S7LTTW?=
 =?us-ascii?Q?zhkGV8qwbglDovNrZHZ6mAVcFGFFBtw7y8Tz2L4VpoLdH/aaTy8ohEFcJqub?=
 =?us-ascii?Q?XsaSKbBJgaCTZNBPUs4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?36/cobJJ/N36PS0hpbJKypxTxkft2yn+I5ctUpK63nc2XwkynCa5uq3mtymm?=
 =?us-ascii?Q?3D/05qAPXwOFCdn9Vpcyoq37R/6J63iMaxxxA41w7Eo1ZDDlEicdvOuTokmG?=
 =?us-ascii?Q?ISEZe0XyzDeRftTgHCuC6Xge6xkGgQKFGpZ5UCwHu1gG9ssoQGOdij6Fq0X9?=
 =?us-ascii?Q?i4I54kyuwzqqtBZlsRkHJhJI2V1MedK8JcpdJ+70JL71PiDaxWcip8a6rd7L?=
 =?us-ascii?Q?Ai4JThcHXcUYoRQ0O/48Bmjilhf9HAkS9i7D62EVwbAAQocNB/5UD/QyjOBk?=
 =?us-ascii?Q?v0j5ervlh/QLzcnktFzdTPlX6NJ1b61nAUxS/x38JVWg8H2QBlnB2nEtyGbz?=
 =?us-ascii?Q?+QWSIQ7A9VmGRl0vBmDQ2nZfyAuLFiaEmn17qFywQcsCh7PBXtpPWcSioObs?=
 =?us-ascii?Q?UM5PXfDGtzzsWDS83U3C72V7XBarobTWbOH7hxCK57YnAiREGNL0TNo5mLpc?=
 =?us-ascii?Q?LpjMTQknl6RQ7eIJhvt+jy253XffuKPrmal7F4PUvQ+Pj6Y8JvK2puIKdDsZ?=
 =?us-ascii?Q?MeDU0RujWt7BVpkLlKf8TCqgTOQskU6a5PzvuHSqmW8HPm/9wrFyxFIPoYgH?=
 =?us-ascii?Q?4qmYichbPTDFgkyfnG9lT1jEdbIuGj+pE6UeS5mN9eneaytPF+VbPyQFqW0q?=
 =?us-ascii?Q?vNtLbr4BpKclBH0RGNuqJ0gtCewu87ceosLxmbHuusNrvyHBEXenOI9uPZhB?=
 =?us-ascii?Q?7+VhUCXJoA+pHtiLIikNDfVZvEiax4W/vZ7uuYqrW5NJ3Ayd9XMEiKGGjI1h?=
 =?us-ascii?Q?dYpx/s6LtIPC5waVANY5YPQDy/3DItysOpoojADYKBACSMn/OIR5B6gFeaQ6?=
 =?us-ascii?Q?GbBy83PCJYYtUa2Hx1w7LfcuJzQS6C7Ij3PKO/RLqKyiMvR+ucrnlvI032zq?=
 =?us-ascii?Q?p1pnYvpBoGuwQVtkrGXqZdBVTxtIPiMu+qDQGf8opsOC1oSdYfsqYbpSFXy3?=
 =?us-ascii?Q?uf6RozX8J+Jj2ENbc1oAuV9mX2hXExSRF3Evpbbi9dmPeZXVojfD1vZO9Po7?=
 =?us-ascii?Q?+eq5RXvuGnOUYsn7hZPr2O1b6I8RGe0mpTidxrl83O2tKmzGelDy02RxCUQX?=
 =?us-ascii?Q?xv130esjTerJGVpHyJRMRInZ1HVu8iwYGL7EjLWbirfrIRclyaGHXPpyXITI?=
 =?us-ascii?Q?+dj10CSbbKDsOjx3sYqYRCa/m8A5O4X29L199ypvo5X3xacMMpqdTg/0sN+S?=
 =?us-ascii?Q?KLGYMarOs0tLUz3IT2Cj2gPe9lm7xSFq3o7Uj5nG5Wi4uJAvL/ue1blrB+O/?=
 =?us-ascii?Q?vu8Bk/pJWU6UYoo96SkILFW9bCUzU2RqobTj+ZTGdD2iR5BWZ+R3VIx+B6su?=
 =?us-ascii?Q?IttfKzG6snaid6/Q8mWcTagJDMHH/RGHzQipp5QozdFL7jVe0qzRPgcLhlXq?=
 =?us-ascii?Q?F0o7wNJ/PafSafI/RKMjAlROCfQ2EUXzRUiBsN0XZCupJU8awbkcXUSt/WVY?=
 =?us-ascii?Q?oJBD0/qIrPNX3hOEnP3X4d8WwEWpMhGZ7X+385ISy/y8LqOxzM6822XUO84X?=
 =?us-ascii?Q?yn1t8b2L7RZcJbfT6I++NFu8szCYm0z8wTCyRY1GDYJelRAJaNzdDJWhCALp?=
 =?us-ascii?Q?hl3nsk4QZJgLlB2zaR0K7AXeNMA5ApmBSIN6IbQQV4LZPKb+z/Pu7oCpAmTR?=
 =?us-ascii?Q?MSrptEnJNy3XIkKdHPYtWXGyrdBxRy8VCRAxqJL0e8aVJtJU13iDg6J6CegN?=
 =?us-ascii?Q?GeIjwPcmRqSg592sP0AgUM2/9jaKD6LQRkD+IlgNcK0pXSGlW7q5yI49a4Vt?=
 =?us-ascii?Q?Esg/GpMJyw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2ce29f-2263-4282-5ce9-08de60638ba5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:19.5551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nplj9bAbl1CxwQ9DBKBZplrZ8Sf+UllB742BohwMlaf3cRyX2Rljg22fYFHH7Yyryh5QQLbTxOzsgXrp9MDtaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Hopper and Blackwell GPUs use FSP-based secure boot and do not require
waiting for GFW_BOOT completion. Skip this step for these architectures.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 2e7b90b80877..2ed0f6d8d19d 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -304,10 +304,19 @@ pub(crate) fn new<'a>(
         let chipset = spec.chipset();
 
         try_pin_init!(Self {
-            // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
+            // Turing, Ampere, Ada: we must wait for GFW_BOOT completion before doing any
+            // significant setup on the GPU.
+            //
+            // Hopper/Blackwell: skip GFW_BOOT completion waiting entirely, and use the simpler FSP
+            // Chain of Trust boot path (elsewhere) instead.
             _: {
-                gfw::wait_gfw_boot_completion(bar)
-                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete\n"))?;
+                if matches!(
+                    chipset.arch(),
+                    Architecture::Turing | Architecture::Ampere | Architecture::Ada
+                ) {
+                    gfw::wait_gfw_boot_completion(bar)
+                        .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete\n"))?;
+                }
             },
 
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
-- 
2.52.0

