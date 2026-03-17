Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011050.outbound.protection.outlook.com [40.107.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CD23E866D;
	Tue, 17 Mar 2026 22:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788060; cv=fail; b=fIZ/tDSt8afHNMHBIIHVZmZEMLucCWq9vpbVvB6Q11sO5zwbQMU9VuRoz7VgYO/HTTzoSBlSJjtyddZctUws4nSmpBZbuCLR5dzjBvxyqGJjiFJyuglL/DuFgVXTBbk5wZIoGs8eB3bX9+SrKuGDzNPMKSxPwasgGvTFF3FLaek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788060; c=relaxed/simple;
	bh=TAJKGRXFKGRrb9Uxsn4wPwawQlU++wiPLveNOozUxyM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J8WDJFClwsEMvCiQkdBtWz1arK44eWcsxn1zIwOYQMncE521Qjw2UR19NNj+wC0Ww4cbCfkn/TrdihPzyiICnCH6vyD8/FN+2PVsis5ycbv4xSrCIyy1f5OTuXUXLJYYDGXRRU5h2azQonMVR6SNeqS7L3uLYyW8U5rxawZFgYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i9JyK6Bb; arc=fail smtp.client-ip=40.107.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i9JyK6Bb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9ya7ptQIjFAxP4TxcBcSV7NLNa/YlECD8E31vKR8g/WCIp/aQsBzt56yIB55yB4Tie7XQ/9wgEmByScIfSp9CLgtXod0V8lcJIt9wQwa/EQf1wmn1R17tTZQAHHK8O9aVmt34va5WtfXq07kvYDjAjaDQAuYptxK3YQOHmK/vH+pHJXjMEp84dXEmaLMCNS94TdQ1PYq+DTy3dWruuRwdsjfbajh3QqYOEmNHuLGctVCSHvqd8y4lYgVbqQ/Vqzf6LiNzIXcwEOK3GwCepIP2eGTLfSnzcbEkVHCH1s3cLato56XB3kFu9Qcf83PIRZsMNunRNx0ii3yg7kzptpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtXynqz+dK5MHq399KbbebQm50z6eyjYaBpIt0SwMtU=;
 b=zHo5zvO1SpUo92dVwl2lmJnfCEVp1v37XDxeVILre5Go8CilPzjvvcv4UwGX73bawoMTlMpRAwsr1w/9vzZnVV73gyHR+cpZFXn8WhLtSS38oxO1IQBSGhsXYQjkMiEm5jdttb+HBwzPRNrMk9NAJU2OUkX+0YHsUJ0mVS98vhXshhUhAc8dBW2AEPo0IKpDfJQ/jUi10qpMzqWiS9L8/oDsZ1jpA645CN6ah5EQlXGMuAWUnCJIU8JChkPu87EiAUeru1F8hITXK6QpnGi6ZQAhvDrYmEzeL3Pg0gyEbvejTgSGeO9RTAyrG1JjW77lNWIiHwCCVkrQy+bK3rQI1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtXynqz+dK5MHq399KbbebQm50z6eyjYaBpIt0SwMtU=;
 b=i9JyK6Bbs2MHepajSG79h9QNkqUVjDKq3yrDlJxuTAE8dpkqK3lG1nyUAQozu/iAd+bdsKunZnkUgTlGZRdQNM/yRrvt33sMjOAFeu3LYrxUpBu2sWWTg2Of5XO5ToekIeNHgZvWiPkUFfUop1GbAUZTK83Mo5pTXBYVuCM2GoFGjiZLuVqW0/U6NH7GEBvn+Dg5vXoDNjutAUShYkHxM3Ir5dVgpHuPdquS9VDzgBGuu+UqUAUgXqSkzqJ6tDRx0s/dIS/D+41XQLFdxMX2zLlUs/Yf92Fp4PMrgh8iAMM+/PZUZRwRPRszkZf6kPY42fv9IbUIiTdauqy4nxO8Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:02 +0000
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
Subject: [PATCH v7 03/31] gpu: nova-core: use GPU Architecture to simplify HAL selections
Date: Tue, 17 Mar 2026 15:53:27 -0700
Message-ID: <20260317225355.549853-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e9f6fbd-2da2-496e-c7b3-08de8478158d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	tumCbNxYcAH45piqePyOSYpEXOLIp7xUGaab7OQjKFimpsUc+3PSWEqG5reAOUuwWc0N6Gbnd2dgqOss1GjlAyiB6eakAwwSWrUzu4tLd5agRJdI6aX/xBczYLFMErvD2E++M6dsf9Rn26ZfZINDlWdi5SO8prlW9zPQRCVCXR/+qdpPQi32UDSvff78xApJwFK8hqPgIvZ7cwMPPBDs/RLKPKO0MHBw+Kqq7t5M58fRFrU9NkEHSXvDCdfJ0Q3n2yaFf0XWghEaOTO3hq63IKTXZfFW0H9mkrUfuqD6yjjxkoPX/5tPRJeVvg84AXFyCIRkym2Gtre50kbE6ovyTPrwNhMYpgShCSMkLSSI3PFn3Bh5WH20EhD6Hko8l3VHhxYqmtiCO1LnAv1CwVcE42k2X664y+atx90PBOD+VOgK5f07J3OlOnT2jpyvX4qZpKhTn4TvZdqqULLnSFL11YOoSFPQbvGGwxyiNyg90I7N46x4GXODx2twIdn98n+QmBiPit2QS/hDgMbWrq7NfyihaPWG8oTeJyz1hijRZ5ERjc7ZQypX5hPyWnFMgTtxLB2BvD1N+xZOok08sxqyPnOiJyKd2b23nWmjwugpeqCpH77CVp3gIoNva+5haIh+uweyJ5Nta1EKXuboKNipcQHkzTCXdJqGp6tRIemwxliE54WUEizenhN78YQd17rV+9bvctAG7aVUpLzuSts7mZxYc4gnm75q7ZAU0mPi+9Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GVWrb78Zs+jyPlXNJq8vBaJcJNTsPGyPndT4PJKtgw3KrA5TZXtwMDSuX7+r?=
 =?us-ascii?Q?SjwMAUR/JwR4t0chA9r2A71rPLGnip3l69RId0P8Tf9cZ8Im8IAF/v/aLzL8?=
 =?us-ascii?Q?S6Et63z/4x+QX+f1AqpHeLu64ITffZj7B5NISgT0jXaMtIHn/h8KP+gt9WcO?=
 =?us-ascii?Q?AuiwjQC9FBW1EwTkhewI5NQRUAFFsQrgkckNSXtrSZQYhl4biVj0Y7QCoDKm?=
 =?us-ascii?Q?2+QYwYfTbWnyOBEyJpVwfCZG7gXBOXt7/YUiFX4WLlgP/Wx6J+5X8M4NjvpJ?=
 =?us-ascii?Q?sSCOq5fk/REKkXsIh6vHu1REwb3LjJDJFgAVBV8KGXE0d0+KhSKJJc4vmT6S?=
 =?us-ascii?Q?k80FmxJYYqVtD4m2od0Tgu/DE3zrHG7/3xswEQQFmZqb0dX3dFatlyhsESBn?=
 =?us-ascii?Q?WYE2zgqHVxk6tRbtDd8M6FlpBvm55j26IvmN1PjNto/J1cwRjJkg8iEBRYmI?=
 =?us-ascii?Q?gdwodfQpi8OqYzTP5ZM82tOTAe6R2YsPqd0U5bJtGO+eiHqu9Psv73V3B66a?=
 =?us-ascii?Q?fKOGPImACCNeLQZV6+DH15IyrjFvSR0u9MrBoniHd9FmJlmaDxbPuBjLpUqb?=
 =?us-ascii?Q?MCOH8IqpIkWaIag4OEMzHc4v63jziF89OxVA29XCgYAcYTdUjeFs50yIUvgp?=
 =?us-ascii?Q?RIQ+eu4rHExILkqbYsmrO5EHGolBLYYSh9YbcGMvXAqy/05J2X8JR/7jYQA2?=
 =?us-ascii?Q?XuiADIokwPXogR+Xfhde3BuliEmIaFDV1WCnMqiTXejV9kE5hLssQIYbijCc?=
 =?us-ascii?Q?WpVMjWUz87tmeSEB8XXqW8LUOJQIzoLlBGlbloypDEqG0tCye1Soazch/yyU?=
 =?us-ascii?Q?7JrJU+4U+WUOA6A4QksVkzzO+zCpg0aJe8B2c25U0lLcOTwf+WU2Rf5dMsej?=
 =?us-ascii?Q?oHcf8U+kXa1X/6/C9CGwuRKDWLrlNeGmtM6cTpWbRhGHoCFSHO/MRrLtJPm3?=
 =?us-ascii?Q?mgQssMbvk1fP4rcv0hv4fs/1yMX2mNy1MNADhdRk8NXYHxQSu69x1Do4s034?=
 =?us-ascii?Q?flF7fO09JhOzcLoph2BNZGxdZjOrZbQlw4qNmqIpF4cmVJRHkVLYkMyP+2zZ?=
 =?us-ascii?Q?jLfbdlytTezoVwc48w3V22ObOs4fLwCIfgOvBAKTyb+E88I90gHwYZqVpA74?=
 =?us-ascii?Q?OLzadnJswFjc3Fn9rsTV9bHvY5yJB1xeP+Lja1kIKzYqbRhcXS7RN1s7yw44?=
 =?us-ascii?Q?ZGQYanNoF20wYEiVI20aiuPruugOxjlHQH40TwS3ttgr8m11FO7FfZ+43hRC?=
 =?us-ascii?Q?5wvVnAdXIZgMxskKL/rWSzDjYt6jcChYm9LXbAjdkyfspYkDlCSKqDF32G7v?=
 =?us-ascii?Q?ghF5tGgkbl9uCR0zZkk9sDywp5/ASywZMA9KX8a/049SB4iz1mRvk9QNwRud?=
 =?us-ascii?Q?vz1vdpotRBAo/4cIz1v+D4TyjeZtA8bXozzu58jj2aSk8ZzJDSjnBUNORJUb?=
 =?us-ascii?Q?+PPnNAZgsl/6oD8WQys2Yz+z/uZ7bPOY75gc3CodLywK/27otw51ynSnYolC?=
 =?us-ascii?Q?jNK7W3+O/rajg9KysXMnITasZZWi9kzfmQLrD8Baq+6yvXXdV5HtRDybfefS?=
 =?us-ascii?Q?+nuvUJtl1l60JvMxHZoG+Fe6ZMY3zllJZs4fQsesWVPKdAQavEqFiZSDNnf6?=
 =?us-ascii?Q?f1Q5V7l1NzXFmXqQRuihdjrwhNtQRjsQx+DSA5v0Ry4Lt8WNLQk6mvOFFUpK?=
 =?us-ascii?Q?rdCdnPhfRQsjkknlxZK+v2yi3ZKtTTeiNgeL2I6xBWsbl3AUrOWq/reVPOxW?=
 =?us-ascii?Q?PCZ6XBMPng=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9f6fbd-2da2-496e-c7b3-08de8478158d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:02.7534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtOyfyhJQDp3HZ9U6YtPSusDJir0AP0Zc51Ca10+R9kXHgRmWKlV9WKoi/Pj3iEsA4r4K5nHgqArVzNeOxX/UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

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
index c7f12f2a7a35..721c82f6a831 100644
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
@@ -74,17 +77,19 @@ fn signature_reg_fuse_version(
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

