Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B306E2E4263;
	Tue, 10 Feb 2026 02:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691589; cv=fail; b=qlscE0we9gyLVDcfUjvxI3kYmRtiI0CEY2Sgv68/phlcUK09PFnQPRG8lbqSUvbKfoMrT6S+GmNbuKmIk/5G5xTU+gJbc03v6LTCblZwmYzgddcN4YxooR0sw+7nwJHjEOgzeAcwFusmF3mKC/lotsa67FSbI2YN0Ejy5Ox7MXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691589; c=relaxed/simple;
	bh=icrobGFRCqysMm5khCe9W06FcbjSmoocdluq3q06pWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e6B+z5WNuIb/LgP0mpB/+Di9IZO704jSszNBg5QA8H6v6HswSu9pREfJ3YUtpYdjN8XlZHMAT5/bet5fnz7kgH4H4jvimG37u5E1UXXqcNLwWi9q50k3o2LerLitb892/Da+iAeZjKXbxq280FlJSO8TtUlCpFqhoZ3iEr5rpAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m9XH4HBa; arc=fail smtp.client-ip=52.101.85.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m9XH4HBa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6xfoCBUvRv86weXzVZmpsW8FQ9TtP5ZeDe+eAep+pm9t4ih/LUkVEltxGf2YAyn8N61XSCpvoa0wdy+zq9BnkexXe4MmIXPCsi9JuDCmutp7lxx6SW3vcCVDPcK7OQRZeFyRlc864+0zN7zqaaCfP7C6RYnv5uuUbUPsDW6WID/lz+Y77OuUAPYHOPm3m2bgfTlLj/xF/rCoAV+vrenfD32Pt4XUfzMxTryD5ukIm4dqrVZTtou81UoONAFvEyjI0SAuAP2KtMTrIznhTSqdys8qarPQxIVyhUCxFlpKbpG287h7UAx41eh8QlFX9ZM9DOMhSE8sgcS7yStWfmHeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gJK3KTojVMmlMLoYAfFjfgmOOdeHrv/JPUAl6oM2Fa4=;
 b=nawaBECoknMqP968tyW1/9rjP7PX02lN5xIRgjEbb2cHLviqCz4AqspEoSSKA2LjncjLSGVSzuTZoxunM855JoaUqtIsaVfW6jnbuqsb/UIRfTM6zizCaMtv54azW/cqia+kt6ukYD/s8HsypVvqkFRzmmASO4AfEMtVeVHjhL83V148prqDxcmiQCdW26Pt1NT4sCAwGT6Nh/VVsLAuXj7SV9AkcdkViNut9UPeyW+apo22LX1uJwuzAGe0hBZxmM4/i/FLpSaiG4Ss/mjWIwOAzy+kvX9RAoIootf0S7lUErUNF4DLB4anEybPatQK59mcdLWwGsgkcAWp6Vitsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gJK3KTojVMmlMLoYAfFjfgmOOdeHrv/JPUAl6oM2Fa4=;
 b=m9XH4HBaydaHh42WsnE2PCyIMaQT7O1wSURpo2V9LaJNouz/dXeq5TdwEyK/EqKvPj4G4tzMPPGJAyN1v+oN71qLoWNzDIGIrzKnypxLwMAcy1wQHtFXjAuwMI+bszliPbTryD8ENoKJTJ0VlOH+8w0jP1eEuuwyiwxCak2CTES8u1l09y+53uJxcWMbWLpdIX8YB0ISQH2cXXQ4+S/MVcZK7B9vuY0uC0nqmg4JcxG7dbPviirrb6cACoeeGzoL988nDOPiImNF2Q7PAC7k22vsrq83zckT6rmu7cYdMDyJ5uo/OT5AOkWG2PXkWh3cCObb59RKVLvTVlxMKbBxOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:17 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:17 +0000
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
Subject: [PATCH v4 09/33] gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
Date: Mon,  9 Feb 2026 18:45:36 -0800
Message-ID: <20260210024601.593248-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: cc900a6d-82fa-4994-78d0-08de684e8e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dkc+g3PJsZEp3esv6Rf2c4HjzwGvFZLtGRO1nZzkQ6jybqWdVKczC99qDQ5V?=
 =?us-ascii?Q?77Vh3xJkS+0R6PoowuZrdtf1reB/4U0LoVSDq3ZUS1fxr9PGzWnIaH7cLA6E?=
 =?us-ascii?Q?3vclQRNYpprzsUyzdqAXxD9huh1xtI/pLy2oUusp1mFVxyuW35WHGQlpsFf+?=
 =?us-ascii?Q?/Kh/LKu946zxVV/sMAejr9Duk81HQQq6+XDEjDCTlUAdEamqxFihn6yJe+kN?=
 =?us-ascii?Q?ZtvZcA/V2mXE9J1yb/eyqVVBKsE0Xbc7Grb+P4MwSowOa+OhJ5KSazAKhxhK?=
 =?us-ascii?Q?hY2IZDjxQpLOgxkCeEJYvfgM7hvlreefmVBiJphBuJuVGDIcy0EwMy3WYIhv?=
 =?us-ascii?Q?QtewVwNv/nXHPAtNgT3EmnsL9n4id/GAwdCl2efj5O/Hpcv1boniezcUL92r?=
 =?us-ascii?Q?SPlkT/tEHyWufOBLXGn87ZAjgwt6wkLYU2Kiuc1MmtuEdo4enN2nCjbkL+7v?=
 =?us-ascii?Q?pKf9SgBDcKUT4YWSwOsrHp/dgB/rU1jyuT1bcW8Z6UNnQonYTXPVsygm5i2C?=
 =?us-ascii?Q?hyVligRInMGjPNFe6QgXIKmIWOkKvTH0CDZtnwichE0pMxmKmdG1aaKKlWCD?=
 =?us-ascii?Q?9lLZ9NhviA0U2WuBjHmD/PZtrSLJDByig2Y5WlvPbT0Uy++BwpnNUV1jyE3q?=
 =?us-ascii?Q?L+yOMvFMB/QhPJSDRUPCqQD/vuoA5VU/2Lipgceu4482mPOJaiOi++IyGiw/?=
 =?us-ascii?Q?udoncR1QOcsSY6MoFtuSmLbiwjY6J3IOO5QbODRUcv1CFxr5Qnchi8lgf/pC?=
 =?us-ascii?Q?IOF3H6/edFDedEw5G7IVgSUrdrQBHp6D9I0trWvMKOiDtVTRxCKNAgIvAEB3?=
 =?us-ascii?Q?SiIcifEouKhV+fgcBRiVTsYdniDTvVPZWb1d6dQcQzx5zokbpmzk/u3YmEX3?=
 =?us-ascii?Q?ZofSbSgpzTwL4zEuqPa1h8Al7TZNR2bRkzt+Zf+TrlEnbBTggkoYouUQloHY?=
 =?us-ascii?Q?1P9iRRlK1SKiDXGQOS1GgN5iOk2J/+TbMbKBsaQuoT9ZqOUUSxxrL1lIVIee?=
 =?us-ascii?Q?TwAIW4AAdPxgg5Xxzgh4Sqty1pdgmRO3qxrSo1vzXgsmo5Ler2LDboW85hku?=
 =?us-ascii?Q?4DMVku2KShBmOTfEMWRPKdxCKM17uErR8q71UrKJIo8ms2EOQSQFjs47CFqp?=
 =?us-ascii?Q?FYNUjNgnUoL8lNS/TqkqEGsWZF0RWYqVLTB2QbVj2+prdQYNR864vS1CoYTW?=
 =?us-ascii?Q?qFj4xZx0vKra0DyUPCu1B9srwXIsn0/09w71Ys5XekjlSRm+UMGf9WKt5R0b?=
 =?us-ascii?Q?CnEQLqjg3wd3f5Skr0MabS/EZkoa0j/R0MyglfBY4UphR0Pg5QklKqewjBw+?=
 =?us-ascii?Q?6SuKOH7m9eTLyBMT5R4NgjmgOtsgSkVfXxP8ZKfBrJ1/lYFwtNJ/O/MmImwQ?=
 =?us-ascii?Q?eVAu5lmcS8yYwWipHDYqIpHGe981xCzvf6g6wysOkr0eFdfW0bedjO6JHwX8?=
 =?us-ascii?Q?Um4H5Z4T3u2dWp+7devIrMKf4BqH+ciuC93YAoUIcjzH05zX8x8nJM2Kig4k?=
 =?us-ascii?Q?3aoV0onDxgig4I5e9RiRUQja2c1ja9Si9NPEk1RSbOc1lSoHZP290vAGg+FU?=
 =?us-ascii?Q?4If1YWXbq0n3+d34Hx8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lpXNMiGkYiugk4APgdryjobHlQTgyPM7wpJz0s/PIgGg/Jl7v2mUEKtutJXz?=
 =?us-ascii?Q?qUP1ps/nsNZyjApMRqlQDb/4lTqXRHts6YJLk7VLMcgz6R+KtTaLAubY8VJQ?=
 =?us-ascii?Q?9XmE/Nr8hOhstX7sVDoaC59kvWhyfUs4SrPnfNUEEnzDCOaUStbFQHRrkKnq?=
 =?us-ascii?Q?AMeOsZTv+M+WCYb6VsUpoheOm6DqkBTIu0N6hf4UsSbyT056LxhyNoJoYOo6?=
 =?us-ascii?Q?RJqC+Zm9Rabsysy/Aab49WEyxjwVtPP4nYghPoVhyPRyWysVly8TdaytrcCc?=
 =?us-ascii?Q?9mPqPZ13T2QpzZMXLvsdVn96CadU+89IjrgYx59HlGLrJY3TQFbCsU2mdMvu?=
 =?us-ascii?Q?M6UKxdwW9y6Pxkt9Fz6+BwrTwA3C4VxaIHqEsud3W4EjH06txY4/ZPhFGA1v?=
 =?us-ascii?Q?zV6p5i6qBrzRXbPrpBPzknxnTxRzzSwOPzYmhY1e73FWKwWLMsdqREdQ0za3?=
 =?us-ascii?Q?tyVg2dwA291XGLVCgRrZtiSAtYiJDxZaxrqX4uRkz03W6gy7w2qt0fspr5vI?=
 =?us-ascii?Q?VraqwNn1gBgIZmQPSQ5R67Ji0Mx25Ceg8TiIUTYeis2S/u0/Ntyw9Ue7L7P6?=
 =?us-ascii?Q?O9LigkmwJY4j1nEjhpaESaD13jXpuKfiFyEigycmuyPV170jHXRXtkC3tZny?=
 =?us-ascii?Q?boXmFj6JamDILZv6j2Y8hkOkgWaWz93fbTz7GydI5DPL76n5OS2bkcBhXCIH?=
 =?us-ascii?Q?M4wDYzVPedKYHtDCVXuRW7oKPnZGkMhDW1Gwdd/Gamoq5zzGoZHG7t7GyMyK?=
 =?us-ascii?Q?TibjZLmszbUVXcYABPMq/YjEpYYE6ik0toTe2uNC6/ihRrXe6CpjKDD2ipq1?=
 =?us-ascii?Q?BXEmyjRygkq4vK9KJXKHAQ5IZQaXbtF7xwotn03FameXfysK4szFncG2J/KI?=
 =?us-ascii?Q?RqqeyAqU5rIV8FTvU46ku8yvEqhlL3v1BDpYVYPaCX9rNuZb7JkIThOJRsWI?=
 =?us-ascii?Q?Kh6e3QjpjA0LcH8ocSTYqXVPbVUyJpaFgc+bxJ3zGeh8XIDOOYHCAuDJqPWb?=
 =?us-ascii?Q?47h4PFyhB7O3CThk+73k/b0dVnZdoXuV7xgaUyaMdQ0seHvdlSAc8ClbVgcn?=
 =?us-ascii?Q?XnTSQX3i7cVOg1gzY4SehbN2JLwHi9JdZcs6GNAnyynoYl+T+FM857sz9bsz?=
 =?us-ascii?Q?XMIWLk4CsRpz15fN62z16VEWdDElNv04mK9pEQMdGCQeEWGpvXxiA97Vows/?=
 =?us-ascii?Q?j8gQAMqsZXlNITpFqXH6onL2t4J25OY/BMJaKi7gtnYh25gpevXU0uDm3g/7?=
 =?us-ascii?Q?Z7LvCnrVxJmTIDk2OCAK3PAIp4adgip9xmC7F3r6SzOgpkrZrPRpV3dPdT4B?=
 =?us-ascii?Q?2uvhaYyJS920RgqJxcnhFMRYpx7ZpwbwDeRRSZnHv5hohSiEZm+hUPDv8hdQ?=
 =?us-ascii?Q?dCn1Oe3eEhZ/k+RUCe/J/lCBkWqHmzaHqKo3fdwh3zrmtcGWvKFWDsv7mTtr?=
 =?us-ascii?Q?35J6wuK5m6Al03vmM0ECyL2SxlDyoht94o5xYjRDiAz6+e5RRcXM4SFqImn5?=
 =?us-ascii?Q?5qgvnlyYX/RsIkAk2BdmetHl/juszF/Tcq+Zd+gRL2nIcXrZdehngTQ0BTzz?=
 =?us-ascii?Q?ygaYymBAnXcJCuYUu4OZMOkRafFqmkvoq1R64UHXjPsGNi69+hiYTwZ07aXG?=
 =?us-ascii?Q?T9rdAFvIDmaqMonB97wCaa/8RrmMu88AQRFaQOJLpW7zMAbqt9lw64ueYcbG?=
 =?us-ascii?Q?dkxS6QvrGRnjS9wCcQYegY4JrJZPoZHGNlBYpfuOMNJMiPMniAwc+w4pYqVa?=
 =?us-ascii?Q?1JkZxgmkBQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc900a6d-82fa-4994-78d0-08de684e8e8d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:14.3401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSulGQu8baL0vXvFj4AKHSp4/KwkFIGvFoIFKO47j3/TN2XYAwT0iFtrMEEmngV9UO7Km3C08YWTT5Ate45Mfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Hopper and Blackwell GPUs use FSP-based secure boot and do not require
waiting for GFW_BOOT completion. Skip this step for these architectures.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 24feb0e8723e..f04e2a795e90 100644
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
-                    .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+                if matches!(
+                    chipset.arch(),
+                    Architecture::Turing | Architecture::Ampere | Architecture::Ada
+                ) {
+                    gfw::wait_gfw_boot_completion(bar)
+                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+                }
             },
 
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
-- 
2.53.0

