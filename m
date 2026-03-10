Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012001.outbound.protection.outlook.com [40.107.209.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70D538552B;
	Tue, 10 Mar 2026 02:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108717; cv=fail; b=NiEWGsbyNXl44zu6yxplsoFvmOkHzd8HnCPOZLckYQOBUlIAYET6BfHeMz4p2ICWn/NOlwrPCoTEN75zeHVLQiplS6UmS4W40P1S7vxH1AFmHOilTi5tAbyyR0wkZoozTwUJlgKLoyfABBrS7/Ilma1ThacHVRJmVNOvZkvlbSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108717; c=relaxed/simple;
	bh=EAWrsU9bmHt36zAvdvfhAQ4/zjua5cgaEYclS204mQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fREgbIR/5hF7GY3mbd8l1zJWo7R78aO8zIuaso0flunXeYqMXABsUYN9mwWIjWmC7z5y9GAKITwF5j1md0S8IdBVWrViSwPuW/wgJ4Zy8X+Ape2Qa9YlsLEbMJKnnDODPQMAtGGLlbdh7bueNdEp8dM8ToWVOQpLW8ycPCAxgrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y+ARZPBu; arc=fail smtp.client-ip=40.107.209.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y+ARZPBu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmO28ZaAAnig2EscOReB5HF7io/2oZg+kyZ14bHRez5VYHdM+5T5rp/289opKbKtYkluGy44DA1+FLFC+rgQsfk2vF/soLDbUfmKjE/SJ8mb0uQQhN231TeVTW3Sy88shlP0+j6Yf2ANTaqRM7iOaEzqQiRNgHGgSHBQxWLI59mPL3kPs65pjsRU4oAfGaA4JzkbtyeMl6dnGKTosmiDrgK5VzCoJ0Vc6VJiwJIwngRJLoMVS4dAbqQWYtaTXEOKewUwmD+JqdEAELiFWJeUi/qtMQQh6ciIiP3WPJfkBtZf7kCqRchcdOi7XnsjoqZqqhKAx2847SsQoqVN87ej0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+LRSRAhVKaKnqOTFWzIzS/mN+F4W9wlCsNet6cJMWw=;
 b=Ha+/kIZgnKdAGcy18TpZN0+QvS6O56qfRLqERB50mhKzSQXiBtols0OXj0WTYx0tjIWZ9Oh6L4GJPPgqIIrdFnEuKGeGSK4ktBIQGQwqIJSI3C/HvLL1BNeKJ1Hf84kYjuCW4cId+gfRo/nX7Ejdtn/GsWly8GciL0+29eh3oXjBRhxnWtSagBvB2kn+mnWaadu8eWzLtgx+kSfWXnvEpH6T7h8meq8W6viIRUkfcgW33wDsoYVNB//AA4xaK4Ci/DnnUNoA7lhP1nPyuGW68ZvIF7XxjKLYBKd+U92H+ZCRvOfRipSbfNxkUVXiuTlE410sIIVTvVXAHjwtzeLG2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+LRSRAhVKaKnqOTFWzIzS/mN+F4W9wlCsNet6cJMWw=;
 b=Y+ARZPBub7Mxx5I7tKjPeKni60hwBVvRsZ50s1oSvDiZK8Zq5osqtNT1aMlNdVcjkWB0bXE6ezkie7r/p9vvE1V2x+vPzZPshhaK6vESYUyu4pl/c0xIhuH0uizYgZdAsTQ24pr7d1m7NMzoaaqN6RWAMS4ITdLwM8wNGupHlSKbR53PY+lDPaHvin9EE74PP9aU+T3BgUtl/ds0SeFHxfQwUO+3qyRa3EhnlY78EZ+VLvELtdr1GcFPdFqDBi0Z1hOEqyOjCNwapPUkS5jGYKbx+7s2mMiGg+My9C5//lyRhBf7wGoTQt210eqSRz9ChW04pCNfBEWBnnT1FA917Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6930.namprd12.prod.outlook.com (2603:10b6:806:262::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:42 +0000
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
Subject: [PATCH v6 09/34] gpu: nova-core: Hopper/Blackwell: skip GFW boot waiting
Date: Mon,  9 Mar 2026 19:10:59 -0700
Message-ID: <20260310021125.117855-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6930:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f836b3-f5ec-462c-a21c-08de7e4a5e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	YsgqHBAtlnkpJz3UtDbwpgA0fsM2A1LFP5z2rZyPsbkSj1wPEaW4CiUQ8s/3BUa9sndLEgvSEpliOrz1USvBI+S1VtqehHJKcZHxw3sPghu4L9mePU2MlYA8JKrEExw9s72DivP4NkBK/QoZ+HlYc4Eyj4K97b2qBqMpaDbfyQmpAxwE55LisjN7mvQbM+BsN7COlaQsyrcPbxQIQQuB8JQhM0XhxK8xJ0UiwKSKHSy2LIiJGxNFVkOrnhTLas9k+mcfCO3mZ6tVSdDyv+L9UNDzB6+HqAQ3gKCeRRz6DamlKjoyj22zmbedb4WgfHefQlXJjrYSyiTBqj2oNBY9kcI67swjry4HIeAdD7utq5FvhgvwqvWj0Ft0a0qWi20A7eydvDUaWsLcqwamuKkNWJKdY5OR/Z91rHLxnwr81JG+++fNVgDVS9CMZo80DgdSOjUAG7/8YBAyLzMxUvYH67TXFrXATyBOq4tjaTbvksBBi+ceMxMemh2qc9LDYeWVVEcayXLUp5Z/wwEg7ml18reY60tnGz9zZLurAb65rNulbE50ZFzspXaEJMvN5nn4KWVoUYzIs6kciXTYWptZtU+SepdlQGjGgLWVzYaq5b+aJMpGXthgdU01JaDYWULZXVNN0O83Rl2ozypNhfbF2IEGZUDdbz6+PPTMPAO0OSddLth8OavSYMiN+C40dEfPAN5Rj2/ib05nj+pobVveWl2qzy/dgpl4PqklYcJRuc0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AVoCPQlo1B4k4nMHniuQjADuXMTxT5SuZXIGcz86iZLPr45Z7c855ObxOzjT?=
 =?us-ascii?Q?fZ3lOhIcxkxey47jWNQQ3M5lVPIvJj1A9DJNPldwiz7HasKaB2TA7908XDnD?=
 =?us-ascii?Q?CjwQo0DpsXUu5oj2cteyucAdYY5MPZ4XjmxJk1QGZ1o84Xhz466zyREUo4aP?=
 =?us-ascii?Q?cqR/ceAKz2F0RH5aX9y8M3ZgnxzVfAlCmNISucjiPaqnqWUSIhViX8q9IgWG?=
 =?us-ascii?Q?WZmBwJfT4lrdUKUSGaIKt3QOWYnFeiGLywABJ697dOWPnTfIughFiysEHfSE?=
 =?us-ascii?Q?/mae5DiYjlyQROKTaT995ITweRJHWW7zzE2oniVQUao60cLkpkY0S3l25QmM?=
 =?us-ascii?Q?+qvERLbT8HdZC0JtJwOGJtQ1QVV51h4QNZuhMC8Gpm6Ai1wo7u5XXczWkiR4?=
 =?us-ascii?Q?45w4pLRakqB4DqB5KoXf9MvLXbcZLdJLY7Ma/SCsszMJXOKJZOvbuapGMcLI?=
 =?us-ascii?Q?uoVEBNE/aBMlB8T8KnyQQohubtTRGEkYGGfPywUWA5FnPCF9dqQV1St1AfsW?=
 =?us-ascii?Q?I8cBRTRxFXWQKs2SZ369j9deDojvIt+hlvisPOBpQw8QxzMkqVINjxTPyPX3?=
 =?us-ascii?Q?FsDeIoHHTTDDGgldgHj0nXFiH0g4SuegUGQfc2AbAsiryO/uAHN1/IKGYd8c?=
 =?us-ascii?Q?nWt26JJqRBw/R5tbx5X6uqQ7mTw4ZTP0hYk1WviRLtT3vQbDnn7xd4DDZoni?=
 =?us-ascii?Q?TxDe1a3Kx7TWybsrx8AM842zn0Zc4LAHQ6A0sfbEeJVzgTHvyrEjhlIq86op?=
 =?us-ascii?Q?yfLA34XJLMXUAnenxLMINxighaov7A0Y24wq6vFr2plYwsi6j3lm9e0h5Yt1?=
 =?us-ascii?Q?+YlOpb/j/bFA/BeOmEsgCwwg88uslD3CJw5pscBvSFsHFUtBzNxw9Ho8cdAq?=
 =?us-ascii?Q?SdfOr56K6NnknzhrscqCU7UwFCm+Safg8QBFowFy/9+XEJxiy2mqVZKcOQrG?=
 =?us-ascii?Q?oR0QFY6PoOpKu2TrBHitym7mcCOult2wgJ+3EtSF0NHmMO69g1MbkRfDDLnS?=
 =?us-ascii?Q?UA5+I1YY5+Ztd9JUlZWH5ED0fOrSZsv/hfE3l1S1nG0mThO0qPRkyeLpQQFz?=
 =?us-ascii?Q?31iZJAqpwNCToxnkXRIiLCkZHDfPUyVvLib507lr6rxvTKFTz1gCTBufGgA3?=
 =?us-ascii?Q?9sFJL3/kXUCeUA89uwA5aXfm4HQp45wDFMg9G7MDlFWOJn7knT+Ukkfqz2b4?=
 =?us-ascii?Q?rF/yJCee5XXIilm5k0eEgZLNbOV3Y8XCFoT/Yn9HfAJXRSfgPxJRZgHsPkxc?=
 =?us-ascii?Q?eSr8hrYMpVeCIqvsi05R3ckzBBkIbrL5XL6IVvjjLVdQ4jIXfL71xLopGRsa?=
 =?us-ascii?Q?3shxAlLi17Q9AWVNgRoHL5/Ac/1AQ9Sb/MJdtSdYZCLwn13tnF/op2B2iKr4?=
 =?us-ascii?Q?ja+rlXnjp7+jP/dy6YmTIL0KzQ1//mOJ9D1dYJjp5q5Q1NFxWJPR70QsYbh7?=
 =?us-ascii?Q?KbYbOpzd8LYXUgkfCs6EeGcXkOh/9LHTQVAQPMNC7oFTbHDFmdQuPMNEpo6B?=
 =?us-ascii?Q?nhqPh8y2c/B/UFIxHxC5BTioKK7UPDE3y59FtvIDx86XdTtPrznjXZQcvgUJ?=
 =?us-ascii?Q?gh4z9LLUqJ8StaUIZ8nYhIb7uCqbX0idz5p05kN/zF/v/Lp7L3GjM+E6Wj3P?=
 =?us-ascii?Q?t+gVadaHhDsW1mxj3qWdv8mxJsLMrqu1mT88pMAgN8/DCNeJ5z6VsgSKD8Nz?=
 =?us-ascii?Q?bot7CmyLyA59GM4cT7sAHDZWXqXNaFlBo2O7E12NWon2Pip+QJzxZo3XOubW?=
 =?us-ascii?Q?rAkXsRou+w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f836b3-f5ec-462c-a21c-08de7e4a5e08
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:40.5334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/sMtRO1S0URK4CAjsrCqBuuu3AHB11wD2y2Sd6YUEiQerdGHrYd3ek1jSRfZX5+RDYh670Pcvw8CoDHJFJmQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6930

Hopper and Blackwell GPUs use FSP-based secure boot and do not require
waiting for GFW_BOOT completion. Skip this step for these architectures,
and in fact for all future architectures, because we have moved on:
there will not be any future GPUs using the older GFW_BOOT system.

Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index efd1765b4f86..21a8c6c2d96b 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -177,6 +177,15 @@ pub(crate) const fn dma_mask(&self) -> DmaMask {
             Self::Hopper | Self::Blackwell => DmaMask::new::<52>(),
         }
     }
+
+    /// Returns whether the GPU uses GFW_BOOT for firmware loading.
+    ///
+    /// Pre-Hopper architectures (Turing, Ampere, Ada) require waiting for GFW_BOOT completion
+    /// before any significant GPU setup. Hopper and later use the FSP Chain of Trust boot path
+    /// instead.
+    pub(crate) const fn needs_gfw_boot(&self) -> bool {
+        matches!(self, Self::Turing | Self::Ampere | Self::Ada)
+    }
 }
 
 impl TryFrom<u8> for Architecture {
@@ -322,11 +331,11 @@ pub(crate) fn new<'a>(
             let chipset = spec.chipset();
 
             Ok(try_pin_init!(Self {
-                // We must wait for GFW_BOOT completion before doing any significant setup
-                // on the GPU.
                 _: {
-                    gfw::wait_gfw_boot_completion(bar)
-                        .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+                    if chipset.arch().needs_gfw_boot() {
+                        gfw::wait_gfw_boot_completion(bar)
+                            .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
+                    }
                 },
 
                 sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, chipset)?,
-- 
2.53.0

