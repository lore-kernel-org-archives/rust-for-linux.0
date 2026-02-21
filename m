Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CBC329370;
	Sat, 21 Feb 2026 02:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639818; cv=fail; b=b7BhADfcpSnVfcvASIxb5+Lm7hMnHdrYcPBqHY05/A4bf20YaiC0eFvRKuhV1sPvr5arSkPf1jnbb4kl7dK4wwuhGhuyf+IffkKMLacSpZNk/4l6sQRwxjsPAAvTi5OMPaCMxYy4erVN0uIFvqdDMKWEOpX/wi4EzOEOYr11/tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639818; c=relaxed/simple;
	bh=+4Xb/L/PxsU52LTMC+CxKE9Ld8bo57h1cqm2zsJgNEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DiTT7UOEd3CaxSYRt7gKv7UxLtVAO2umL/EFKmcf07UHJSo1jQIFS6a5YCz+Daka9kKzjHqA/ITOeY0q7eGK/hRYBYbeddC567XunHm06fb1FLIMMHCw8f5HIg0o9LUCUoNMAf85jGSBgfpcLgqiiMyZPnTUhUP4sp/EmCw+W+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rP8A37w3; arc=fail smtp.client-ip=52.101.85.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rP8A37w3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyqIAMyMZ6yzhkS473Ht6YKxVkJAAolChx6s8QIDI9m+A2y9ygH6mTQlE/6eT3VT9u8l3hROmaJUTSH+NAN9LbAb1oPL1537CN50Zg23flPgIChiP/ivp9Gb0lSv6rFvb3ZJ/9qAlpL1MBLFbRGVJIktQlrARcmuv58byyTXyfNOC1Wu/7WiTUbujRuJxXAFDLdQp98BHj1qxRaG1g+sbNl/a+dHDqMBSGjK5Xxh49dY1gFbppAOu7F7jYawSpxvj89hBJjCmgYjD3ErT5xWPh/aaAZ69FQcBD65+ACE3vyidNmp1XG6faa/Q5WRNmsH1u9BuPgiBCNTyUTOd6KA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Umro4fHo9Bzum2jYOtZei8FzanFe22sCcDfKFHjLoZg=;
 b=LGu3HTYvZLq3uEHYNyypZJXMC6ZR65RmHr5YhRpmWl/etYT19o0dD6ootlySzf1F69BIAaZ3Do4qej0DVfdIziWh7HPderJ9TkqnhXE+OG7Ya1/k1igJCr5LYy6ZeEdCXRtEDViYQq8gvzeimAE1Ae7h9Lr3blisEeCCxqa31i8gJMsWRbkhyznaffG9dTTpAxIw077YoqSsRUKEYCPK8BwJQoFJ/0rPAel1o3LImzj86ErsbcCWigYlI81+7Z57JeL1Iwx6c4/Yy/T5P2wXvIr0EOqWMLVrfdm8qvAybV1fli+zGSYHUwVYG0PSQpgKkJsicfkBws4AiN+lf1wIig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Umro4fHo9Bzum2jYOtZei8FzanFe22sCcDfKFHjLoZg=;
 b=rP8A37w3uhuuBMzyXge+6+W/7axWVlFOphdCVkpvvimxvb5UTL/ZLl3NoRDiH2oXDmvi/Y+xknrFbS9A4D8C8rTr+iPn/5cQRfp8izjKLaLqIKbNFVpZBDqxy+3mcwsqh6Ew64+s49uWGeR9QR8AhF4+3pWwreVnUnnyaSEMkdpKpfJHEpRCn2eGL0buv+6yZt4Tl1ApB3kDU2VBQdPN6P8UEdzOS2OY09I54iCMTz1ow478y5A5ygTY78lxQU6wRxVlIkHGLQbHNq7OCJgwGw5eIFq0MxJagqBdoYRSf1D1gG3JD9UAXaAWo50a48Ym2v9IFxo49zxYNesAvwp0Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:10:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:03 +0000
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
Subject: [PATCH v5 07/38] gpu: nova-core: use GPU Architecture to simplify HAL selections
Date: Fri, 20 Feb 2026 18:09:21 -0800
Message-ID: <20260221020952.412352-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 12efed73-9ea1-44f9-abdf-08de70ee530a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2eZoxBco9cvjIU1XvSyCNn6yCYmkj+V+A69PumS2eWllLR3XWAufgrdldeGz?=
 =?us-ascii?Q?OFK4cgBFieSobiDr8PDJiPGxeyAXve6I/qzc8yihyr55z8Fn1gxR5VbEqVSd?=
 =?us-ascii?Q?uaKG/aDKFgaKe87nQDR8UAX9LC3wNcpC1ufe473N6vHVWz+ODp1vuOApjN8Z?=
 =?us-ascii?Q?x8d5DPw8FEOVQC68NDtNmbAsA45+1g4nKpSXJmXIscNexv5rsyaezUerHmFU?=
 =?us-ascii?Q?5BM3dLaLKadl2mwKUfg9gLOVGNuCRxXHYWqHoAp+RWJPfhovwMfxhyoEN2CL?=
 =?us-ascii?Q?CT96SQx69GO2a8TPnvTquNMdoVxecpKUJuzrOs1uv9lbFYgXjWs76UT+GuSI?=
 =?us-ascii?Q?9k8Mxh+WqzmioMObsgqp6KYarHwiW1QLtjIYHNndtmIpjOEqVAcfKpN5B2HD?=
 =?us-ascii?Q?2ys4ZWciYtJr7hs98Osjz0U3qRkvsZ4uS4Q5aMec0MJPwFRqih2ZHjZSxslx?=
 =?us-ascii?Q?udGvSexxngChehi/GjHat5QYstw3Hk5lkYzx9M3LyF9/nADSWqyGX+7i9nEG?=
 =?us-ascii?Q?2O94lYZRuvzHAJ7F0ER78oRLrrT03ru0uFbs8qw2o285SSRG5zaXt26KmF/s?=
 =?us-ascii?Q?/zVadJt6lnzwfsk4vOAefwGT9ZY+UKe0Y5BkObGt9/TNvQZaHa0rTNMU4Hrg?=
 =?us-ascii?Q?3D57LVQca7KpwJIiXQCgmbuKkkKRi+d5TV8rctX+HjNIS8VZMtzKbaCcS19I?=
 =?us-ascii?Q?dW/+7H1shEg4OWY2DfQ4zCz3WF9dH3zR2kHPkHyu+1Z3LAMF5XVCX4orraCJ?=
 =?us-ascii?Q?+BMrTQAzkVWhtitPyjVt3bKc/Rp9RLcyzPm/J0AMLX5J0IKbQcCqe0FEqdcW?=
 =?us-ascii?Q?MDTCb065046nXyB13BUOwwDQDYCXSnQF6eS1+CRmkAN6WlPQQyx4I7YK/F0p?=
 =?us-ascii?Q?vLk2CF0KqKrpItdBm4U+LmswuQhAnV+BGYejc6tkghJ2ZAmsKX59dp8ixluW?=
 =?us-ascii?Q?Hwqlho/INGpF9SxpM3wJQ6s3qj85Fsi2ZqLpqbE4u1+kJKoU1OMPWffF5pVo?=
 =?us-ascii?Q?z3ZmxOiYxs2N1Rnryd0Vi/fZvg2Z8jUc655t2Z/zM4urUa0tFjO4I+RCu5uc?=
 =?us-ascii?Q?VRmGXBeCOR0Fo5xsR9MoERfNvJIGUhus8YWWVIM/xHoaAFub2dTsY0UPeKr5?=
 =?us-ascii?Q?qdS0IiVUQrzh0swm/i8YtPha1CGqPVb9+J1c41qg9R8+J7VRl79/YKLRfe+k?=
 =?us-ascii?Q?G5ykcT0liysgYtvwqNy2uAzQwdP+ZRumOp7PCLW6g1mhL2yI0nwnlB5ERBiq?=
 =?us-ascii?Q?G+pgPq6zsPg75gTmZBTfzl2qHE6xbVnS4xW8mwMnKUY/xrUmmYaj1mZRJdWb?=
 =?us-ascii?Q?wueGyRpy1tyQW59kb+A07b3Ivp/bTcGJw92VnxqgDgh570Du1Aerxf0hdW8m?=
 =?us-ascii?Q?OjxsrCwnt+zFdZ7CEqPPU0pNWYHbmD3TvaWqj6YUVa9+uLSIC2kiWc71Ma/I?=
 =?us-ascii?Q?uAmU+dnUxMJa/VaJJOaTPXAfznR5/uaabdWYgdP2br4rVbUKJpc+sugVjqtH?=
 =?us-ascii?Q?TadJYikEiEjoZAkxTZ16ZSE84lsbelRQO1Q3WgCBV80mx9HJQxi2RAkl1cd7?=
 =?us-ascii?Q?0dXtNc7RaRC26UxIHWc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8RBnQ0mYjhtcfgKp6zpC+wA9fHN4l1r07tZk+QLHbG5BjVwTef0OB5FUDYvq?=
 =?us-ascii?Q?Q1HTS4VZDH4Wy9uGbnGRsPbd8D4bSGkTC1RycUfCO7nG4fjc3sFDREfEtJYS?=
 =?us-ascii?Q?92NAN8PLRXTFdaHAgpMFSbe3MJG70Fyx8dV7dUWdLLhJBnhXB64llxwX/c7x?=
 =?us-ascii?Q?RiZJkoLQ0G4+SCOGXGNzmb2Jpt2qy2mSoZGk17B83OSdejty1SICJaNGmEMd?=
 =?us-ascii?Q?EOFhMKIjMIu8PUGgjCmoLhD9+s74cG1X04enk5SBv/BMR4DpJlsfDxZogidW?=
 =?us-ascii?Q?Q9TSne19QmIzE/FCnbZK154uSlGK02yI8snGYBfMQO/gPO6/YLhpE7dA7OtT?=
 =?us-ascii?Q?jFUQ07fz0iiRL8a6FjgHG8djUXatwTOPcZYZH/aK8IszDC1rr8Smj6vLUpXW?=
 =?us-ascii?Q?Nc3m6Ho0xgFHBuODO+Hi4d3YJTSVbnVmLe/ilLvFRMgv7MiFUqBjt+7rocik?=
 =?us-ascii?Q?5AfvZcn9pZy7nft2ELD+D/tSwK07icq/ZKpgFnmdRWokXIRceF17eBoPcM8Y?=
 =?us-ascii?Q?Cwtgoh0YavMo9U8MLWAM1nY/6gZ3m+4wdXR/FoNCCXehOYAkNeB7kJU/xeOJ?=
 =?us-ascii?Q?/rnujPTuiceU/FDlezjF3rks5Av6Si0kW/nMo0JtbsbsnOTo0KVWsKUaFDO/?=
 =?us-ascii?Q?lLTAOWEaXuyJlLcOLmn5T4XyNlIrRVuA33JHt69D+7qxqrWswzlD9REwkawA?=
 =?us-ascii?Q?ieY3s7FRK9cvWyMbMtmciH+2UMY8RJTx2bb/RpzoQFdfwM0KadYUBQsLJvkS?=
 =?us-ascii?Q?ghfarsS35Qc2w4i8RvVmBjLuin2x9uBz9hfIXucFZYSATJ5vv0whuFXu+J+z?=
 =?us-ascii?Q?ILhxChn0iffIQqhdzOjWev9rnvOPw/qRVnnVIHjplPZXTwaHBionRLmtpn+j?=
 =?us-ascii?Q?m1xm40vBfY1PXR6WoOI812xv+U2fU4+kxCiF1ZvdYEM0cTpDmJaxFjxZqrDJ?=
 =?us-ascii?Q?qkCO6kcQJ3SCAkEyKsstwgOsHJPjfABFT+ZfpfHmd7Okmw177Tz3oFJVoMU2?=
 =?us-ascii?Q?vH6likH2y8v3wno88Biv6L9cvSElZBsW+1au9+HPEHelFmdh1oqEzQa+43g6?=
 =?us-ascii?Q?3kW2hOkQGGsAdsptNXs163lHAKwEf+3KwSb8KMzhCSci6ri/l7Wt6fBPULHF?=
 =?us-ascii?Q?20qF+ihJUGDPYjNDqpW5ZKFyGBQ86xfx+FU3uIhFisPdow/FNXD291gl1bnX?=
 =?us-ascii?Q?Kl+nyTLPC6WXQ5NwYqGWXDSGNABdYkIEoEJDgi84E9ozfQKj/FfDi7IXZZ/L?=
 =?us-ascii?Q?5BwWHKBfV+PIDmSeL8B59lswhgNmHKKs55i90qlPCabxxYc/XU75AlaDMXvV?=
 =?us-ascii?Q?AN1dG/Ala6FkBfQw7IJzPc1lt++J7Boi4W5ZhMfgQZtKOufV+gw/yT0ozkNP?=
 =?us-ascii?Q?Fn/Hboq+RybbfgNRDwEjG69Rj56eGhPbdu97w2ZdNNfY8GMLREudwHP2oUDR?=
 =?us-ascii?Q?gP37BVqrPp7rpjzqJ5o5IW3kzrQ6p58tPFhMaf8B61jfbvn/6rLZWpsANMre?=
 =?us-ascii?Q?etPR3ey9LiPnSjrI49iP7AMoWYaHnUwFFnF+vdmshmmHL/1l6q3/iZTi+gZ+?=
 =?us-ascii?Q?2RLrsxxZDGT5cIjOBLT6S8FJ4THJbQg5FhtcTxNnM6EzUz3By0kkRJN3CK/H?=
 =?us-ascii?Q?DiSmUXso6eArGwKWAwvz/LmHQQQvf/OaKS6ZTgN5x1aKE/15gjPbgncldHks?=
 =?us-ascii?Q?CegWVoUuYmsf4RzVEFGg3QJ0J4FHzBcVCkkRjjblkHAWQJu9BaarpfMb03Lc?=
 =?us-ascii?Q?AS3IeYUr1A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12efed73-9ea1-44f9-abdf-08de70ee530a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:03.2121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3U3YPeSZwmZcOKu56UJO5M5xBbs0o5RJMCQPkvGUx9xyaEUpSsO7yc+lhGLfRVDwlTizXxlEwbbQHpDuet9ATQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

Replace per-chipset match arms with Architecture-based matching in the
falcon and FB HAL selection functions. This reduces the number of match
arms that need updating when new chipsets are added within an existing
architecture.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 21 +++++++++++++--------
 drivers/gpu/nova-core/fb/hal.rs     | 17 +++++++++--------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 444c95fd4ece..edf4d27d54f7 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -9,7 +9,10 @@
         FalconBromParams,
         FalconEngine, //
     },
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga102;
@@ -70,17 +73,19 @@ fn signature_reg_fuse_version(
 pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     chipset: Chipset,
 ) -> Result<KBox<dyn FalconHal<E>>> {
-    use Chipset::*;
-
-    let hal = match chipset {
-        TU102 | TU104 | TU106 | TU116 | TU117 => {
+    let hal = match chipset.arch() {
+        Architecture::Turing => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
+        // TODO: support GA100. Its boot sequence is a lot like Turing, except that it handles the
+        // FRTS steps differently (specifically, it skips FWSEC-FRTS).
+        Architecture::Ampere if chipset == Chipset::GA100 => return Err(ENOTSUPP),
+        Architecture::Ampere
+        | Architecture::Hopper
+        | Architecture::Ada
+        | Architecture::Blackwell => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        _ => return Err(ENOTSUPP),
     };
 
     Ok(hal)
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index e709affaa7e8..d33ca0f96417 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -4,7 +4,10 @@
 
 use crate::{
     driver::Bar0,
-    gpu::Chipset, //
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
 };
 
 mod ga100;
@@ -29,12 +32,10 @@ pub(crate) trait FbHal {
 
 /// Returns the HAL corresponding to `chipset`.
 pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
-    use Chipset::*;
-
-    match chipset {
-        TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
-        GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
+    match chipset.arch() {
+        Architecture::Turing => tu102::TU102_HAL,
+        Architecture::Ampere if chipset == Chipset::GA100 => ga100::GA100_HAL,
+        Architecture::Ampere => ga102::GA102_HAL,
+        Architecture::Ada | Architecture::Hopper | Architecture::Blackwell => ga102::GA102_HAL,
     }
 }
-- 
2.53.0

