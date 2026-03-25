Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5131D2DEA9B;
	Wed, 25 Mar 2026 03:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410778; cv=fail; b=ECpY55hTxErcF/wTaSicrDzCeKE/gAAZi8iWlMLht2mKx7tVAidGcuW1ew4xlUYKV4cIbdrffDohIf9VKm9Izl7jRqcHiFKq2CK8u7qQVcv3obdBdfpoxwaVsKLwB3rS8fn1sH8GeTVEHgrb7mScjZDG59527wIpainMff9raRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410778; c=relaxed/simple;
	bh=Ija8YIpxjpmRoDARx1VwtKjQ9xFyXVyTXW4MaBdCVGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZFuNUdtsK1nLvP4Bq8TeaUY7fZoxS4pma6aYiKx/p50VmWLRbU0iEPrfHbi/cGmemOX1yJSC+XUYnJnYSctsDmGa7mfNZBDAbPaJXBrTJtruJKSw1EYXRiLroTbhUCWxhJ2sn45pFFHQFGHvKOQjGREpXLV488LcFady99oUMZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I4ToLxBT; arc=fail smtp.client-ip=52.101.201.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I4ToLxBT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCWKaHNF+IJ/xNBOeSnhMiLjAxzqXz7MY8aSNriNRYKHVXjSsQNUNtlv0A/sNomWkbtByDTpMbNtkB3ac0zpcRqzWpjATYUBcwqcONWJl3QGQYqfftNLBBvSs6Z9LpwRQvAql55ljOFbfVjbS09TKkcF9HdS27IugLWG8TUxfXOyTGMtqYYR39yyxo2xVE8I/2kYuTpz4QrXYU1uHK+HM0apMhojcEPYC/FXJ6gOuId0DnmeDnRuiiopvTzUIrqYC8oabKrGE9VU3SUqoVzAQSNa1+jDbyM2qL67IhYbFWpe23oVcMFAm8nm09CBxVbiwJM5H6pQGEn+P7O/XAbPdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQ5AUknuuz92nKYLsSEI10VQa2+9U4fn0S+1vhKeJH4=;
 b=AHkgK0L9qZRFMt9Sttk4DEtCp7FAF0Ljm0TN+FWzsMmni9BLFnULb8hOnvrlT06HqHmIO8CHZ/vKk82MYGOqzWzUNP6Qqj3bXmYum6Aus0vfn3VTMqaGnhAJei2Eijpm9Ze2dL1dE1e8nnakH76VDZWwsIHmjALyiqs+2xDllFtNtdp5f1IvKlO74zQ/3lhNFIbLOXEslWrecckX3h16xJCrl73eLAz0hlor0UmnvEEp9PYSZad7FerMvBwoqj8GlmSEW2q3GKx4l3FtECY7Ikuh+u+vhtPLQaEhJEdgQCd1PpyFVFJevyS8gEqb+OTIuqa+liE4EIMfM6IUf7KIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQ5AUknuuz92nKYLsSEI10VQa2+9U4fn0S+1vhKeJH4=;
 b=I4ToLxBTzo/+RwAGoXu8GlkBhRjxJJS7JblsingBNETQjRYXKqcpRoO6wErX/BK8JAYjvHsQZqx6/yD0k9NyPxx7MWvBR4zCZ+SwHXBpXgLVMwpRj5+z/yShyBp9zu37z14IXj3PZb62nynQJs2JOuqdbMvFNDyGUR1WbL/aMgHvnYe3X8443ZJxc9EIsmQ/2sYAVvdTSBrMreUwsTL6QksOIwk9bDinEuHGqXlpc7um33D5OxK4SwzeC5tbgk848GwC1C2ZeBHhkx1VT/CUTmsjDnP0A2doD2SA4nC5Aka5sSUdoAphG/bwZTRcsNJ5eLneu9y3v92Bi7X4VYWNGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:52:46 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:52:46 +0000
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
Subject: [PATCH v8 01/31] gpu: nova-core: Hopper/Blackwell: basic GPU identification
Date: Tue, 24 Mar 2026 20:52:12 -0700
Message-ID: <20260325035242.368661-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0119.namprd05.prod.outlook.com
 (2603:10b6:a03:334::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ca395a-8e10-439c-e985-08de8a21f981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	eaRF6Sr0jVZbd+M2SCpH5g90nOejXTf2hf//klspF0J87dlLVBpqiq+5Y3aAMdGIdD6ZsVPqbRb9Nl+Ekjh9sskvWDCQwOjF1cvPwYDl7Pnk5djgMPDL4vYlrvdKXwLVxghayYQZrqJqgwcePZz0ZlX6Dqvh7EQnofpZl8P5vYaezmtX0ykftrsNCbZuMYFer6QjJVCJWNTDCeFPMcBp+2HZ63Rn6+/CYWbX5heBx8EbxGtAvbi2/P7fTd76jn4qvsakiqgqpdvm/YIXV5Dpag/PpKSHzCoXD7LsCcNaWhvObWygkRqeafZksBSOfgHrWdAgcDaKLXIIUZ6RGfONrLXJopRavlFj6z1G5x5kAFj/k1o/niwTJU+FqIyhik66iNGLpnIgcM4JCrupMoZt1DXO2X2OmT5XOv8Ih8DQ2hPmkdCbZiW7RTbXUz+EKe7coROKLlnM7It+uFhG7mcUeQVy6DvQdRigG6UNMkYc5JI6L7dXB5xqv77mB4+0Pkmz78xWh4aIAD5lWm93lJPBjWoVbSb/E6T2ByRh+5aflcUOSBrA211gD28N16RxaSX4Rh/AONOf8tSRc+jNsQEse93J14x6NaV592kIjN3cQWxkztf6Qdj3e8MiCalsok4QVWRmU2X2E/33fbgh4zCXRCGJ4JeSvcrr++cqjVDyCzbl++dedy23WN6Wnj6ZgBiHuqN4zhHCka2h9hzrDw8lyGVEjL0BmuT1gLhrsJELFII=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oTkEIfN1tdYndVORK3AHKrP0K8Jvf909jgzu26fzgUCQ12wjDOw4GIdVjGcY?=
 =?us-ascii?Q?LEthmH3FS1ZzcLsMK9eW+o9WQLrNklad+okXectAMTuqBsIzyGFtNGU5rY7y?=
 =?us-ascii?Q?60Hj6CJ95C6CWIPmSGLp3D232vVpzBzX2hilhZxHhWcfyAuTiEYc6eUFYXBN?=
 =?us-ascii?Q?pc8bghFyt8fyLwgykQQ+FDoLS7YuMj34mxtHAypMNrvnw5Uah4WyzdqIATva?=
 =?us-ascii?Q?K3yiCkD8o6H+G6E8TUW2gNWpNYTRIhcTGzdqzscEquFRNPVwIzcIUfgDar9C?=
 =?us-ascii?Q?XRI1YI1lW/zf73mpcnRKmgZW05zD11+tIvbTOUw8MSG01jukHSrw+Ub7hy0d?=
 =?us-ascii?Q?I203My7ljVAKTssVT75dL//G4FKdxI8xrjNQ5IYgmFqNE8DjXzE+7hHzeNOa?=
 =?us-ascii?Q?rjCX6gegfacOpl5l2ivrBZNQg5BRiSwLa1VWiGw2wXWffZpSJdCFQ0rN2eLS?=
 =?us-ascii?Q?GgU/zOeogs3331V7WoEkUTD6koSwcU8qxYvUkVc4h9Xni+7mcYLS7798573i?=
 =?us-ascii?Q?Se8yPjACYsso1uLERM1OTJvSPmOZfRH+1rOCIP6jAWdWKE5Z6yM2i9+V8+23?=
 =?us-ascii?Q?2a9+eNnTRid7wTzR+LcuzF/GFTbE+MFoQ0kmRRh2qZ/OrLJaSRqwI7f3RaCw?=
 =?us-ascii?Q?gcmxk+mjquraIr074JgZuorwCdYqJQKXNMHiu73YVnWygPR5I45GT/SlhW+R?=
 =?us-ascii?Q?YzUlreuFRr//+msBgusRZM9cKu31Ek/XKlSgjhhNsky+sWxJQvGJ+Oxreb0a?=
 =?us-ascii?Q?gPe6d69o8Znl2g6tERlHUadBgAnRl/qgVn2sWGILsT7UO2Txp4joAVH7Ntvx?=
 =?us-ascii?Q?kDLhtBGLY9rBpMyHIt4DDU252hjBnE7VlXeMPqkmagZvYckbgEU/f245vgLx?=
 =?us-ascii?Q?uQzhMr+qfSyzTaW5jfh9Dqo6ZDCkYMvt1k9rzX7LfI/Mc6G2eeBXsAMjAmHY?=
 =?us-ascii?Q?ih6f5y8G2MPqx8393xFSHHiQGd+GhE9M5mHaqd2HPlndeAXFQl3qb6V0ojME?=
 =?us-ascii?Q?9f+rv67BtE4i6Y21pBozxfe0aVEbB7Ev8ZnSLs3xnbCt+ftiKT2WHiQUtvc4?=
 =?us-ascii?Q?AjD7cuk1r8y86CRT1VGaSlP50484thGghp2oltIuFTwPokGMLQKRkE4yp15z?=
 =?us-ascii?Q?dCLFp9u+f8HFYgRqqFxianux0taKUJhBsnWWnypvXFytgr4vZQtxMUdbm3UU?=
 =?us-ascii?Q?rlTTQNzb+hXKNAJ8+SM4gJBCZQA+gIidW+eYgkjW/C+qqLCCm6ec2nrMSLUE?=
 =?us-ascii?Q?rWyaWJIxphaIyrTGzUZ2wO+oCPJ6Pnk7ZwDtXF/qeHV8DnaOfWtDAzeghadz?=
 =?us-ascii?Q?pzCNdIPyLFCD2VfiYka7XnUhp9wiHsGV0uZURcN3XyRrdZ8vQQb4Bb0VYtWB?=
 =?us-ascii?Q?AYhOZtZn6u036UdBANtPEmw0uWoGVuii5vBKmI9L1WMJ8rHma2VlXjXiizsl?=
 =?us-ascii?Q?0gFvDXZQxBDY3Rxr9Sp+sRy1M4zUEr67uqnIS27qN+oHhdniRvwzoskmywqI?=
 =?us-ascii?Q?+hi2hqPfj/M5cTH7Uke9swnrNO7uznYro4O4fx5KF1ICF1uIqd1A6PpjD35/?=
 =?us-ascii?Q?3FJNVB7h/n5hJuh9J+LLJzqowxXWki7nFASgEXPNaiO1aR+c3kzs4Ngr1xVx?=
 =?us-ascii?Q?d0Gvb5Y8XNf5VIVgjM9DE2z0fL5TAqchauX7SJvrKAWh2J85H6gR76rbHHF1?=
 =?us-ascii?Q?Q/LTk1hzMxgFUS27DgzwzP9z3TuXKDs7VPhMXJWPwmwouv8GuVv7vhkxWIV+?=
 =?us-ascii?Q?30C+pqNoIw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ca395a-8e10-439c-e985-08de8a21f981
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:52:45.9335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SSqA0K3UjEInM2MQoqNrNMVU+8MF0u0JFRzE3pGCRQaT6jzRsrC/8YkglZJXVpSCGs/jxgx2iZbW7IMs1WAJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441

Hopper (GH100) and Blackwell identification, including ELF
.fwsignature_* items.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
 drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
 drivers/gpu/nova-core/firmware/gsp.rs |  9 +++++++--
 drivers/gpu/nova-core/gpu.rs          | 22 ++++++++++++++++++++++
 4 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index a7e5ea8d0272..c7f12f2a7a35 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -80,7 +80,8 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
         TU102 | TU104 | TU106 | TU116 | TU117 => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index aba0abd8ee00..e709affaa7e8 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -34,8 +34,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
         GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga102::GA102_HAL
-        }
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 9488a626352f..c1f0a606f5c0 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -213,8 +213,7 @@ pub(crate) fn new<'a>(
                 signatures: {
                     let sigs_section = match chipset.arch() {
                         Architecture::Turing
-                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) =>
-                        {
+                            if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
                             ".fwsignature_tu11x"
                         }
                         Architecture::Turing => ".fwsignature_tu10x",
@@ -222,6 +221,12 @@ pub(crate) fn new<'a>(
                         Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
+                        Architecture::Hopper => ".fwsignature_gh10x",
+                        Architecture::Blackwell
+                            if matches!(chipset, Chipset::GB100 | Chipset::GB102) => {
+                            ".fwsignature_gb10x"
+                        }
+                        Architecture::Blackwell => ".fwsignature_gb20x",
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8579d632e717..3b4ccc3d18b9 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -83,12 +83,22 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
+    // Hopper
+    GH100 = 0x180,
     // Ada
     AD102 = 0x192,
     AD103 = 0x193,
     AD104 = 0x194,
     AD106 = 0x196,
     AD107 = 0x197,
+    // Blackwell
+    GB100 = 0x1a0,
+    GB102 = 0x1a2,
+    GB202 = 0x1b2,
+    GB203 = 0x1b3,
+    GB205 = 0x1b5,
+    GB206 = 0x1b6,
+    GB207 = 0x1b7,
 });
 
 impl Chipset {
@@ -100,9 +110,17 @@ pub(crate) const fn arch(self) -> Architecture {
             Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
+            Self::GH100 => Architecture::Hopper,
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
+            Self::GB100
+            | Self::GB102
+            | Self::GB202
+            | Self::GB203
+            | Self::GB205
+            | Self::GB206
+            | Self::GB207 => Architecture::Blackwell,
         }
     }
 
@@ -139,7 +157,9 @@ pub(crate) enum Architecture {
     #[default]
     Turing = 0x16,
     Ampere = 0x17,
+    Hopper = 0x18,
     Ada = 0x19,
+    Blackwell = 0x1b,
 }
 
 impl TryFrom<u8> for Architecture {
@@ -149,7 +169,9 @@ fn try_from(value: u8) -> Result<Self> {
         match value {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
+            0x18 => Ok(Self::Hopper),
             0x19 => Ok(Self::Ada),
+            0x1b => Ok(Self::Blackwell),
             _ => Err(ENODEV),
         }
     }
-- 
2.53.0

