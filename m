Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6C639150D;
	Thu, 26 Mar 2026 01:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489182; cv=fail; b=P4yWt8UIfRDzK/tRlU2D97VN8tb7V59A/fyKthVSOn5AZ9zLTZVor4d0jOvGgFdyTU1qBhVUBdoxgdPfR+jWcLP7spf+9gqlwZxus+hNNOL4cHyIc+cL4wX/ivJdJZL389sZv7OqzsfBhfAl7yvU9RUeXpdV4ihYYtpJwc7H72c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489182; c=relaxed/simple;
	bh=I7bcfjL9kLQDjAAEfBj4QUrP6Zozkj/OONBWONkC924=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aOCSX8VWTPdI2H7GAk8ZQfUaPcuxAhPo80g3th9qF2/UXEn49/qvbpds+qx5q07If3xigB7rXWlolfQIsum+ygnstCGMWYOElBFZO1W599EY+Ww4zeFNjAfGNw1aX96B5dJ1WJLWsCyfpo5lqWzNK4AcS81ViJuw+paf7QwZtEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bDmzDB8Y; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bDmzDB8Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUz4rvG+Oeeq+7Xftj2MzqA9p6170dQAolWnrQQYAoLXJN0o9vkqnAGvVadpu1izVJCbnfZKiX4b8stZDe4jVdUqVZW4L4TpG2k+qtLYOt/NltPxil/2WJ3ThRbRoANDi/ofxkgqZCTWy0xQ0canDujvM1wMerAP/geTKUgVg5wpkQBXLcd4UAv+3vSWKEiwdMLigQkAMU36hp0SLJqoXRD5IOM6dGvvXGep74EYzKv33TQnbw/U69wmWsscH3CP8OiSpqZm7TOTdlN4lxP0c9vGuLaQTWydyQOIUity9psrfwZnL6AM20RNuAehJB5Dp2tu8js2OnBDO3FGM/sROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kx4/nLphfBuA3qmnmuwGlt4XO8pKv8oc3yNM7GreG9w=;
 b=WtJBBPZ3Mfokec7vQpTFAPLCmhSqGf7e4v+7sbPXPamu01JyGaqfNzfSWoAXhvWqf/9ur4zBz8m7qmXStUf4wbAt5Xe6SACqCicZD3NXx20W0Ld1fJvPt11FM8qKpNnL429jXR8KsG/9g+T22P/lqJwbGPgRxqq/83RodTfACk0DVpYrTmQlXv9vOokotAV+aGtBqRfjGWAUtltapWnYYrsKrSN6qoxpvisgDcR83Qiek6B07+dLA3CNcy2bdVeVSqxJWop7/a7xnHlgle5yOA5JnENCYBc7YzUJY9ldg+GzjCRUYtsjaSoJ8tzA5SBPpuH+wAWDqQ/bu67SMgZDBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kx4/nLphfBuA3qmnmuwGlt4XO8pKv8oc3yNM7GreG9w=;
 b=bDmzDB8YGprRAaouQnFFclXqu63Ow6L0QTqtXbd8EMXGT628zmBlhNak6jXBUVKBVHUruDYg2epvwMxahgNFTqF8f4jvwvZBOultqzgh47cTMawjvJKIbM2XB3kiArtFeWLAWk3NrvWKgpVSkf+L8kQGYwPH0pADxnYJAdHYF8hV0ix073/eJ4xHXsamTNAxmjvnve1MHv+cMqL0LKoS2fdmPB45QUIv9eSHbY5h7MHuhtX/Oz/Zp2Tbz5PyGsLVnLyM4fzZML+NyPmIE4py4tGKkLkISCR4GowdVSd3XqH6SHjAC2p4wKJcRnOoyu4BB0MBeaQjbwihfMhUoAySYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:31 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:30 +0000
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
Subject: [PATCH v9 17/31] gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
Date: Wed, 25 Mar 2026 18:38:48 -0700
Message-ID: <20260326013902.588242-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: f40fb8d1-e374-473d-e3f3-08de8ad88674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KOBUCKEa8qvKrAZApQOfVb3PJuVj1U+xvD2F7diSwYvlPlYPRFAgVZK+cPc390//SUBKszE3gHhDLKx+8IJgOUF2qncJmCztgeD2roHOEewI7Ty8eJoSCs+cTMNWQxXKS0V3zJNFvey1Nb/bc4mSh8ZoaAyg+DKSRVIoZg5SxkVjEyGXCW7QbXrI7iSvhB4IWuGVK0UXrgYoJSUjqoi7ekc/Y6x2rjWp5IdE+D1SLDm32HrpVdsu5EmYaDmAnPGX+lkRSgx7qaguctT99AQdG0pgc30EB6Q6NhI89Z9+q2BpgL7MEmdVirggjCI4dlBDGaipcmxnCuo2fYVydSkrAV3H6Y+py7qEIR3Gx+ffYGKeBRsrA+4eqO/5RzYreECnFvDgq9socA8IRsNOGGVdD9tUxh0TYjOg1v8qYMcNewfbgb6uFscGnrwgeMY3PVotrUoi/fMhvyb3ZZQGi31GA0WR8UIRwSiCvB+6g6GFko/BSs6GWjnAoTsm/kQ+f2U/LmRnYQpQK23gZrDHg4BWzJ714G6biADSdEBfZqHYGAjSGV3TGhd8Gng51sSvvXdUeRXj+98KncYB0PMqu46A3mNYD4M227z/aDXzzf3kXFCQfhJokOAEEjXl3Eqv9o6SUaON0w5KVoVi3qbjq/cXrAG2nqSUNKlGrU132QyIcVB18AfRaiD9dp3GWjiMA7ZarK94+jP6ohp2g0AWoW44Q7C0eqedxzGsb75QuXPulZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lcpi6t1AlBvJg87VNITXa4j3VTOX5CrjIOhwBs94mk3ok+FH1NMD3HJc+kN1?=
 =?us-ascii?Q?pD9sxXB43F6WX1lNGdZx352rAC5dGIYchbvNF9H6U6HbsbaBO/ziTfioAVor?=
 =?us-ascii?Q?U2RCYhoQS+Ygs/Rjhx3h0iwQpDj9dX/zo51p5NbqdDgYEo+hPHru0geQQWxi?=
 =?us-ascii?Q?5ncVVROagm1qdht9JzHhTfmtSPdrqTDrX/nBLHUTYST71DofreuQERLUhQmQ?=
 =?us-ascii?Q?UKeUPXws/Qxh9sXwU9kNF0OH41IQvqTQNGUT+0jZP9Lv7uSTDNJhlHyVSTog?=
 =?us-ascii?Q?0adZkLlt8biDu/G84IgpJTGtFd2OAbkqBwL+vfQiprlE1+dCzT1pFcDkGYAa?=
 =?us-ascii?Q?u/7hJtxVHjAi7F3lGm18ieLSbdr95Adu+boExGLaGnqY2kqPcoYjGc9wTAqa?=
 =?us-ascii?Q?gj/jtYj2yG6Q457s0MDQo7JCQzv9oF6qkKGUfAiabM+zHW1VUMvOLihDm8re?=
 =?us-ascii?Q?EbozflU8RJV08nPwC0zqWUEa//0OgVCHxlm1c450jJEvVaUam6hWutmoQuah?=
 =?us-ascii?Q?2aZUv7of+SubuTU0swnliIDjszPKnCCzRGBK2fWuNfIMQ8htsNRFBEggat5g?=
 =?us-ascii?Q?zWiX84Jg6PO6/4RUZpeBzptJiPfwpqP4ZDQI85vhKU3FWlOtGIPC/UN3cW7W?=
 =?us-ascii?Q?5xxNh0GMXrMRyqOoXHssPrKM067TJn/cJWrc8JdSZ4VBcWT4n3HCCEyQqZs8?=
 =?us-ascii?Q?XEQFh8bDM4dyf5GJgjCc78lVrg7ccU0dKtNL34I/XgivMm1we/MURb1L0x4A?=
 =?us-ascii?Q?TgqR8vFIO90sfbMdA0xzvveMSHQe5rKJoLx/XIU8W9zcZxbTUNRNAORjHjq8?=
 =?us-ascii?Q?vixXzqZeGUGMhS6HX6Uqj2GiBKM1gkoRf7a3jdQNztB8SV0OXIEfsTTSWAet?=
 =?us-ascii?Q?66biwcSFeDoGJ3p9WbCC/oxoVQiYOB/g6nKVsX66Kdrkxw1X+uJi5kTpRV6E?=
 =?us-ascii?Q?jEeq7hI9lIPOZZrteYpLQPW8V3bERmWX4zC03W5yKI7rG1ARPb/akiX/BeUi?=
 =?us-ascii?Q?SOdQzqTKji2TmNuN7IUSP0ObAUEFlpvtlpwi64Yu3Tt95701XTI7Pf1pmr6z?=
 =?us-ascii?Q?O+o8X92JuCIKxO+VD1RKhwBtgNUaYn6jgNCHsz9dBpeuI+HVSqf5qX/kwQDa?=
 =?us-ascii?Q?d/EcD3nVWDIpfkE1aXQ+PeKnTYHe1iGunIoLJCSWZYY7dPHSPOiXZgwW/nqk?=
 =?us-ascii?Q?NxJv8GceYuBJzE9/cUkOh8G6mnj8r5lSGGozVdyDOAdCYsOXWEs5cMKrofEG?=
 =?us-ascii?Q?tzmWvecOjFmf3qnxJdiTftnDBXPQ79OaGEoEGhxrHK65a80Bm/oig5DjEeTH?=
 =?us-ascii?Q?b1m0SRo7VXOZ2WxQk3zfWIzctzqmGl1LJWvL95oTnqqPfW/u/trxFvgnQbH6?=
 =?us-ascii?Q?PUQAZRc4dVa7+lOx9Iat/2c6KPGoOj8Ih4F7geNrwmJVQqQRVwpYLPgyO9bA?=
 =?us-ascii?Q?TkxZd/aYvK4TRn/6X/RLu7wh0PmvgaCYO/izD1kzECyT/8x6Z9U0VZ9iJ++p?=
 =?us-ascii?Q?5D5mLZINZ0ljSsBEHJbd/0ntB+XphT0XlTwIuj8eyXuGCyStdUA1mclW6Hmj?=
 =?us-ascii?Q?X9DDW2BNDa9OruW7ib6KQuFayq6AZIVEM4k6rQD3S4EMELV2pBlg8+EzOjlk?=
 =?us-ascii?Q?/BeoBLDRnGkRiSpLKJ84AujT2XdD0QDe4K/pHJzNpI6KUiwHX8QbqUaCUiyn?=
 =?us-ascii?Q?Soy6qcivz9OeOwOUqLwQW1WBhNYg7D07B5gbNNBvhCHsS1E746vS9/EJ4wBw?=
 =?us-ascii?Q?AZoG69RfKA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f40fb8d1-e374-473d-e3f3-08de8ad88674
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:30.8202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3XcDTSF9GfOjF09iUaX6eySqIBzn9muoqizWFk8IjqPCRHDNp8PayeSog6sdNpOVMYh4JzJXz4qF9EzbZ1pkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

Various "reserved" areas of FB (frame buffer: vidmem) have to be
calculated, because the GSP booting process needs this information.

PMU_RESERVED_SIZE is computed at compile time using const_align_up().
The total reserved size is computed at runtime using Alignable::align_up
because it depends on the heap layout.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 8 ++++++++
 drivers/gpu/nova-core/gsp/fw.rs | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6536d0035cb1..ffb996b918f8 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -10,6 +10,7 @@
     fmt,
     prelude::*,
     ptr::{
+        const_align_up,
         Alignable,
         Alignment, //
     },
@@ -270,3 +271,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         })
     }
 }
+
+/// PMU reserved size, aligned to 128KB.
+pub(crate) const PMU_RESERVED_SIZE: u32 =
+    match const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()) {
+        Some(v) => v as u32,
+        None => panic!("PMU_RESERVED_SIZE: alignment overflow"),
+    };
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0c8a74f0e8ac..3a76d24104fe 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -27,7 +27,10 @@
 };
 
 use crate::{
-    fb::FbLayout,
+    fb::{
+        FbLayout,
+        PMU_RESERVED_SIZE, //
+    },
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp::{
@@ -246,6 +249,7 @@ pub(crate) fn new<'a>(
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            pmuReservedSize: PMU_RESERVED_SIZE,
             ..Zeroable::init_zeroed()
         });
 
-- 
2.53.0

