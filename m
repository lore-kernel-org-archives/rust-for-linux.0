Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED531A81A;
	Sat, 31 Jan 2026 00:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821014; cv=fail; b=S+KrhUCfw+3IRa1B0SNij8lE5ZRpi0UkTr99ZIV/EQfLNvOSx/zpHobU418mARAwSpUm8wH09Ttgz7jLcbRZtgQhMbceB6dHBPW+8tCaiAXtA4ubJ3d2EggD3n8LAnf+7fHs0jnVf/8YBkajNcmEb3/yy9WZKZjfdXz2UeTLjOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821014; c=relaxed/simple;
	bh=wqHxBoSz2djmFgpGc5Kwzu0VJV93D3RYKa4thLE+Bp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WCR359wCYz94Ru42hO/+t0DImfp0PrAjssl1zu7zL+eWBHI/ikRXCm2fKUklT87PbuqzBCa2MnoUptaKTqoZQFJDC5plRUjl/sjgkbHT1oJPWGtU7q3BDAiyMcqjVilVgD7Ki7od6aOdf1ZR0PDMe0mC4eZ7nbdqdlqJAUlrN/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rjrJshho; arc=fail smtp.client-ip=52.101.61.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rjrJshho"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXAG+OQD9RncGS/rXP3ee4/elTu4I2mNwN6oG0wdVdCIC1uxV1f6EaLaDLEhosCCvsJ3Dk+vqevo/TLe3I+3uZa/rQ1ecQ8lo4AlTFIqUVrYtKSvJqT8NxQsrAubkg2FRgToASrkqsB3pVbEdPtQkpB5DCS0V2ruDx4QNaNcF+KEAG0uclxjHHhZsuke0Ct413PWSlgV8l0RHXKWY1ArQzQexnYLSrxwujShPDL8Id60y1SOkuZE8KDF8Ybg0Kg6VT37BnD7soweLnFXRoNifJo5gun7nOLlKzmsHhguNQj8hIYg3b46Uo8NVXfgcfbBAnkcWYB7cLKdCs2o0Np+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5NyDQG7i8aZ9MnX7bvOYxEfxkfZIdFOorUCjGEguJc=;
 b=cceaGHpuyELi4cBM3XlUBd1K5cjSmdbzFfJZ6um0SPHJ7GZOWEcyx51mmtOr4REfjFoxe+jwAylqiCWgrrOZYwQjTSzsNDjXdr9LJRCkmF9ICb6HhPbuj8BAByorVpJN+fNMUBgh+crZVMv6C3m0w1w5PK4M9q7+h80jTpofgYJGOUqstyJxQO+s4MIWL4LpRAQ+mjCy34FW6SRmF3Hq3OmDxido8TDUJyAvPrBcE2pdl49OI8w2aG1DuD655pMZUtkogoEtKiZNQhlGWaZzezBxD9mm2e07Gl8jhLTbMroesbR1KCteWNMkOuD1ozuGyIDFH90Wuru2xlD0VjpucA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5NyDQG7i8aZ9MnX7bvOYxEfxkfZIdFOorUCjGEguJc=;
 b=rjrJshhoDiCEv8sr+3AGKlP9npCq2dZwN5ZLeGG21uzwMn0u+NmMRYkbl2uaVq2cW4HK3Y/GZlBPnzuyJEgTfbyZFEMAERAjhPQQDKoZhx7+N2OM2YWFSm7uuyNT9eS4ylncRvyQHkVxMYuKaoTO+s6lNq1QoJJwzuWpQ+DezQ5Y/nWx8VnOsoc7UopF8u/ZoY4rOAZBqhaV6Gadm1tw1qgSFJS7C/lU3jh+2Zn4hmAHyn9xe6lbkyxevaR9WTe9G8SNJTQAhLcbL8t243e+Wx3iNrz7W9Ukoxs+v7iF5O57+fA2qhwu6kEgIuahEy4IpcGJPMR9q007N1IWC6U52g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:48 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:48 +0000
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
Subject: [PATCH v2 26/30] gpu: nova-core: refactor SEC2 booter loading into run_booter() helper
Date: Fri, 30 Jan 2026 16:56:00 -0800
Message-ID: <20260131005604.454172-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0384.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ca1b1c6-1483-45e7-a55c-08de60639c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HgB84EmhmbQZWFxg9/nRin+ZYH1CxwUPGCDcUUkonvK72dBscqF5VA5rB2t5?=
 =?us-ascii?Q?YIm/Mv3OGRWJNE8NIP/Tx1seZg/NcjYrnzdNIkD2hITRvi1hgE8FloNM2rtU?=
 =?us-ascii?Q?pfR7mza+eF2gk4y35gOx9IPw+VjC6MPkpX4w9FMk/4n6of/eKoHxC4OH0oUN?=
 =?us-ascii?Q?jeTANusb3XjhJNM4A6iIg8+84xOzUVqYEBKtFT/JuqlBV7L2Lhzz3CQ2FUeP?=
 =?us-ascii?Q?QP0/tEQrr1q6d/OiSSlRBE2r7s6B8kbk3lBjS6rwPQfevRHgppFCckpGeSvw?=
 =?us-ascii?Q?EEN+xbbQK7gBJzfDD1YoJBHplOO6NSLvTwJx1kmjvx2RjrNZCbu7qlaEo28v?=
 =?us-ascii?Q?XW6RVfWoIE1DooA3zwtPYA7CbaZ31dq51cIXwJKIwXEJccq4y0A7mLIpyGlE?=
 =?us-ascii?Q?XMCJKvVYB6V1pJAdpn76IXsdlZlOsx/7n5axzw3zQWv9xjqWAp5DE4dNJ0lW?=
 =?us-ascii?Q?w6zUbHuCYJ+7jF8XdBC7fvaMGViZNURDXr/PvIGyqE5QSQGS1uIbiTkh3ZZn?=
 =?us-ascii?Q?LI4IGK8son1FM5oKeAxB7Q3zM6sQcoLqSCZD2v92pZAL8USjY2bFYFZk+wbG?=
 =?us-ascii?Q?jPbWsmQ7VJ1wcwIwzmb2Z2ybZrlS3elU5mky0mtumH2uTkTUlVdUoUJpfFck?=
 =?us-ascii?Q?Q9prJILJVAUX2x+JQV9EeX3MEve/w64123+1Cms6DhcAMNYORFCg8/pDM8+l?=
 =?us-ascii?Q?oaumNd6hOnea3oVAl1UsjMcbBNncO65bFeZLttVDqWmzVjbKKF0Qzj1KSOn+?=
 =?us-ascii?Q?h6aCteJpuVs7nRMeffHKL9Vmv/PTo+HcnL1RHsLcCSi2vvPEThwaVC2xeuYU?=
 =?us-ascii?Q?v3IE7s3mGdUPsm9tCaCF+6Bh58Gk8ezclKAymtufW7TzN9jmQIXkeP5RlQ7r?=
 =?us-ascii?Q?C4cgWIScgCzLZc2uVVaZmJ6UyX7eYH4lTroQ0WZfn6A4W2KR56+V3qc0ZpT+?=
 =?us-ascii?Q?oMhmTjbH2nezRmbZv+twaltgDINTOnWe9cvmAxSiWseI2KSR1tpsVwFAWLYZ?=
 =?us-ascii?Q?OMLa/GGqJJam7EJShPZ3J7llOd2Dad2zx72BbmaRNrQUgg1RApJa4/GU776m?=
 =?us-ascii?Q?XTlshuUmCyB5RDzXLw+29a0NsdBeTlAoCzyzUUA3XxCSrCgH1x7Zef4pu75j?=
 =?us-ascii?Q?lFwNoOgKQXSsbNuo+tBGXgj3yoA9WmxnJHPybJEyLR988wuBwB+r3J7juGYX?=
 =?us-ascii?Q?W4oE6u9fzriV7BM5Eh+Qc2Gj1atgYtJfhBYalCAdI4y2DvNvEGjg2rC3eMd4?=
 =?us-ascii?Q?bZD1MsQEWS6z8UKW9a4kAzx/cMiSdlOYAOjGtlRoUKxj2XcNgvhBD1+wqhk/?=
 =?us-ascii?Q?LJwlXdU203opuQnFwWsbYvAIq7gObc1BcFLS3dIsN+s7CVtDHWrX1HqcTs8u?=
 =?us-ascii?Q?AALbi4+Zqry63nrfhczIhsdeNPSqnbKgel8xJenOmE3SRtOM1cqqwlc0EB7y?=
 =?us-ascii?Q?aZU3DZmAxcV9VMqHge+5VfRMOiwwYIz90hkOk6ZYbfX4OkGR4aFNgl+MJI1q?=
 =?us-ascii?Q?xwphFLe4nEVrkEi3QxeWbnnb+oKfigof6tkWMPOrTQAtHpX0j0wMQ0WLyOGY?=
 =?us-ascii?Q?gnaCxPGdJqFGCnvgf6o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NxCwCLslYOeaWcTb9rZwjNBXbHU6p63iByiz9LwAoTMq35+CyINykMiJBFPh?=
 =?us-ascii?Q?Q9vcFct+Xzd/0Uhbym9NuGpre7HfF4iTvOw0VbRihKAoxaScdTVmb+8Hdp1w?=
 =?us-ascii?Q?nu4fsFTo7SkEf0yCb5erjWNn3M4Al7ogfdpgHbLB5pHHv6KwEZh3jTuZovSV?=
 =?us-ascii?Q?UXWS69VH9SnhZduNFGW9I3NtpoQ9Ydzlj74OwuawLLclrOjD8EloQgRNqqGM?=
 =?us-ascii?Q?UzNfNBV0El0O9JAUQHlY29DW/lTLsjby3GaXv9OCWpbk0YbJiSfDOz0d5AJD?=
 =?us-ascii?Q?NybddeztJXQ/coux3jAQn00aCjtSwoi4tTk0JdbaDTrO4zElZ+Q9HmBFMAW7?=
 =?us-ascii?Q?Ps7tv+9Rp8DwM/U5Y0vR+qKb2n4f18iKNcop6t78O1YmxV1zueTGS20kkNJ3?=
 =?us-ascii?Q?aZf9YeNrpK5S1B2+umGWqqapExmjpHWS2q+sSyCnFeac8xb2bzfCwvTtnn8d?=
 =?us-ascii?Q?X+kCgL8Z/H+iyXpSwx2t3sMM600MOcU27zkiAC1Bo4MDhd6PChiBodf0AXwa?=
 =?us-ascii?Q?kz5d+Gqq4ZygyhT57JVNu38gSn0CU1pIok0at+M3yF6DaFMJ7vJG8MuWgP2n?=
 =?us-ascii?Q?Y4ky9hDa9wVt4DQR/LLLB8zLwtx4uYYOIDXRIN+A5FxWxyQyuktWvhuDJlCT?=
 =?us-ascii?Q?gSGrNmw1WP+X9qYtPoQiejyxWayJfbf3g7w7wgw3K9tC3EoSLEUTem9PEH65?=
 =?us-ascii?Q?KuZzrVJrEU7vfe12muS639y6Su03YarQgwITTQwNrMtJEQcvHkZcRtsjm9VS?=
 =?us-ascii?Q?X2TyiXP3Ebf/EQ90zwiqi4awM91S+Uk3IXn5FgVlTWbmiLXvYzlHjg01+KKo?=
 =?us-ascii?Q?1brsymD4D9sPhasn9kvRa+QLpRHKN136FLE6n17YQoHrTyGSbdJnScSsHkZx?=
 =?us-ascii?Q?I/DeXgG1AZVaIbDtW512Mww2uW91mUDFtW0Rio0o+u2epdCDSExPdvAhWpq5?=
 =?us-ascii?Q?w11NYwy7ESpCFWRntVLriZDvrstKrpvykeYgBwsMxfuALwUJ+iKm/vxVOSz+?=
 =?us-ascii?Q?amKGOuOP2rdc2GGFdhVy0Ldoyr44Bu+SYU+1v/LzluOK1Iae5WAFBRd+cLLN?=
 =?us-ascii?Q?aJgq9eyZ3FbzGo8lcrKMsJJgbrLcqMEsZBfqx2S4b4Vb2SX6XrLFHW+ee0Lb?=
 =?us-ascii?Q?Vd9OSVhHwEA5YQdjLVGe5XbfAe8be5V3xcJxva5MMI9JTRzkAf4Pgf64XTCI?=
 =?us-ascii?Q?YfHcegFYOK1n+B3S3QO/zFmTUfOkyTcAMUmeEppyAtIjBqDX53yrTkcqD9bC?=
 =?us-ascii?Q?vyloYh9HZAOJV4848vGUUxAKxRNSJXZEAkfpkACaADYL/q0YKTL94sp8BjGx?=
 =?us-ascii?Q?urY9O/RDwoEMMqsZ5vrdqUDGhp550WWcLG70qC7Y0CCxRnKDo8TJZykOPiAw?=
 =?us-ascii?Q?+NB6Vo7jnylA5ErH7zZI8nd3M8qdOkqDAD3Hyfb2OXaKlMSdGypgJhRSi5d8?=
 =?us-ascii?Q?n/wx2pgj7replgSWECD7OFAZ1RWqGKZUZAwJaQq2vnOtsD+0P21GrJe2FGau?=
 =?us-ascii?Q?G+Grf71Zi+Epk5UQ5ukNf6VyXDWU4eqTsfVqRV8JjHEl2MoVEvMXx1B77Xd3?=
 =?us-ascii?Q?PPvJmOh2clOf3A0qbrxi+mIpWiePBJa3RRe0+C9s5JChR1Lrm/oB2ErIG7pd?=
 =?us-ascii?Q?Yny3jZ0Yx1+OieIuMq3ysPlQLlEko8GfDFoOW6SOOK/R7A/P2a/Zt+f+8Vkx?=
 =?us-ascii?Q?kqSe7i1ldtJSGj6W2H+Rty3glCFgo8RH5Mr7s5vqpFNYZOjE6rtIWfOzBWQ6?=
 =?us-ascii?Q?vGulCrIo2g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca1b1c6-1483-45e7-a55c-08de60639c94
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:47.9598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QkKd9Xc6b4GYyV9FJFkId5ob1a/bynph6Own4QnUNjq7j3NlEaKX3yb5RsfJ/giV+GV9i48PVmuJ990wLz4tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Extract the SEC2 booter loading sequence into a dedicated helper
function. This is a *almost* pure refactoring with no behavior change,
done in preparation for adding an alternative FSP boot path. The one
slight difference is that an MBOX1 printing typo is fixed:

Previous output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX10x1

Fixed output:

NovaCore 0000:e1:00.0: SEC2 MBOX0: 0x0, MBOX1: 0x1

Cc: Timur Tabi <ttabi@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 67 ++++++++++++++++---------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 036a42a6afb6..b6aa6dcec28e 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -120,6 +120,40 @@ fn run_fwsec_frts(
         }
     }
 
+    fn run_booter(
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        chipset: Chipset,
+        sec2_falcon: &Falcon<Sec2>,
+        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
+    ) -> Result {
+        let booter_loader = BooterFirmware::new(
+            dev,
+            BooterKind::Loader,
+            chipset,
+            FIRMWARE_VERSION,
+            sec2_falcon,
+            bar,
+        )?;
+
+        sec2_falcon.reset(bar)?;
+        sec2_falcon.load(bar, &booter_loader)?;
+        let wpr_handle = wpr_meta.dma_handle();
+        let (mbox0, mbox1) = sec2_falcon.boot(
+            bar,
+            Some(wpr_handle as u32),
+            Some((wpr_handle >> 32) as u32),
+        )?;
+        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
+
+        if mbox0 != 0 {
+            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0);
+            return Err(ENODEV);
+        }
+
+        Ok(())
+    }
+
     /// Attempt to boot the GSP.
     ///
     /// This is a GPU-dependent and complex procedure that involves loading firmware files from
@@ -146,15 +180,6 @@ pub(crate) fn boot(
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
 
-        let booter_loader = BooterFirmware::new(
-            dev,
-            BooterKind::Loader,
-            chipset,
-            FIRMWARE_VERSION,
-            sec2_falcon,
-            bar,
-        )?;
-
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
@@ -182,29 +207,7 @@ pub(crate) fn boot(
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
-        sec2_falcon.reset(bar)?;
-        sec2_falcon.load(bar, &booter_loader)?;
-        let wpr_handle = wpr_meta.dma_handle();
-        let (mbox0, mbox1) = sec2_falcon.boot(
-            bar,
-            Some(wpr_handle as u32),
-            Some((wpr_handle >> 32) as u32),
-        )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
-            mbox0,
-            mbox1
-        );
-
-        if mbox0 != 0 {
-            dev_err!(
-                pdev.as_ref(),
-                "Booter-load failed with error {:#x}\n",
-                mbox0
-            );
-            return Err(ENODEV);
-        }
+        Self::run_booter(dev, bar, chipset, sec2_falcon, &wpr_meta)?;
 
         gsp_falcon.write_os_version(bar, gsp_fw.bootloader.app_version);
 
-- 
2.52.0

