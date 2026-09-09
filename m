Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012025.outbound.protection.outlook.com [40.93.195.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA65425866;
	Wed,  9 Sep 2026 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985443; cv=fail; b=nvy7rroFXWRLHqDMBa6j9+41BGCBkt5s2WdoWVJImqoAv/+1blyxtbsLhHQrvOi4AZL3jZitf0P8F5QezNjS+NHHB+eopvpPYmuPL5Ix8/+l9P9U5GhKXSRK9T0hBbp/At4+E2s8HHbDdm76avy5kO5d288ckfxyohuL/a5SlaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985443; c=relaxed/simple;
	bh=a6RnOfOu/BmY65rCbhfrsU6jtMq4Gn51oJTj75bU6z8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DOsZpsQP9kAJJJrqNufjdCXRm2/4mMrC09enUmIoHcovhcvCSFu1IKcJJ9AZ0lZQbR2nWzpckH6AGnJYo+jt2ByzFnCR6FCPpXCQYM/fASzZ5IDsG3x5BXOV6jnxx0Vlm567lG4q0UcQVELIiBxpgBKlk5scVfLGaYFFBUE6h4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MxBozvAM; arc=fail smtp.client-ip=40.93.195.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MxBozvAM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZYv4UhFQS/sDIWqf8LNH2lQyNlC6S1ds5Ewons+xntAKZyig9RG1Qg2vgP9nlu2i9342ogE6gV0U0grOsNSX5Ke5vl43xgA0PtzCt29BdjZyhA3q8TISOFebuWUz4UGAVNDd0+Vwxedaf6pWZo0R0CsZgOdDN3mkLPEJ+ROb8FDAoVRi5Mkt2CdYJVOOG5ivn82JigFNgJkEqNvpUVyY5kem6PB9ISZqHFpMIMPuKUMSN2fHfNtSox6PwELXIT5Fjnneb6nwIeSLBCCgpQ9ngETR+Uhi66qubDxPeUYuj6ZJcTQ9Z0EhWQ1Wzb+EmbqbZdUfJy/JLT+q7IuwBlUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IPMvnNNt8HtJGBGXKXHohKK2hbZ0nCkpJMV4xDBdQ0=;
 b=dN7DdqzDUrBg10zw2OgPe8geK4htT/hcRAcxgVTtPJTO+YfwWd5jSJg8c3c9gmX+XBtLNDywyO4C2QqWttJ8pl4V9nGqM6sVPOAPI+vXHhkkgbMnCs0KmqSjLBGlM/n0lm4U+KxVfs0q6WAqFJar/Q3F+QR3sEzA2ty/IN5BH/Ebp9grjpRVh58kG7taCBuyA16TUOLlWSg+VwzcQDJMRt1EhSyTCgVtR4Lby771lGZBBLmkh+TuQPIuGUQ/emgsjb3iToiZ7wtBbmeUaPtty5FpguU3xDHPitsaTaYzR26PZs7pzgdR4rdfidDfUB8JGScU7l2hbjbXNmDJnc86dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IPMvnNNt8HtJGBGXKXHohKK2hbZ0nCkpJMV4xDBdQ0=;
 b=MxBozvAMuR7nhZzbEwcLmeSSZ5XGN5g9VLJndj6i8QFBMwmuCN1qnRKtLkevQok0J+0A9RJwcJiZtUxFiWWjKwYAQeqP8CIs7MmNkBn3TqGiBlAf+ckY1l4ihND0jXL1I9Ttvo/6RV2jOwgWTzLkrhpRVFy+mDPvP9O0TsU48SvQqf60Pe/OVQJRS5UOUGZa86H/5WoTP+PIKRujXKZP4/u5tqtWRVyXdJJMjRKftq5QPC3X8eszqTRfb6eja/Qw/m/Pq1cPGBy38wKkDkfsnX2w1ihDkA3wyOOiFD9pqV7wvT9tuDfGfddIIRDss21D1Cqcwu/GGbgTWyJ1b/IQYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24)
 by SJ0PR12MB7081.namprd12.prod.outlook.com (2603:10b6:a03:4ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 20:23:49 +0000
Received: from DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::120d:ace8:656:fac2]) by DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::120d:ace8:656:fac2%6]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 20:23:47 +0000
From: Edwin Peer <epeer@nvidia.com>
To: dakr@kernel.org,
	aliceryhl@google.com,
	phasta@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: jhubbard@nvidia.com,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Edwin Peer <epeer@nvidia.com>
Subject: [PATCH drm-rust-next] rust: dma_fence: gate abstractions on CONFIG_DMA_SHARED_BUFFER
Date: Wed,  9 Sep 2026 13:23:27 -0700
Message-ID: <20260909202327.33285-1-epeer@nvidia.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To DM4PR12MB5182.namprd12.prod.outlook.com
 (2603:10b6:5:395::24)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5182:EE_|SJ0PR12MB7081:EE_
X-MS-Office365-Filtering-Correlation-Id: e205b15a-43fc-4862-fd82-08df0eb04078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	zCk0/kpBZXfyX0U5XVbclXBVQlD0PjD6OYYPlv9Bfi8Ed6LkntXw6w4Gu/wEhO7vpFMq7qmPQ5L++XWClchP3CSrJX4yTXgWVmVssrb3QvB6R7O35sWkpLe0MOjBV5uZaTlhLWBOBPtiNeB4apuIkKqKUNzu6EEymWkzraNnfJPbk8n5mSIUrkkGaIJO1r4evJ+I9n7ZZoWtZIPTes08iSwobIT898vaMRu6IGb141lD50fNNwkVcGTWsCSalzee1PDlxaDGvX/FCJkRVZL87/uNmMhFpC8YLblH+FALX1/KokIn469/P0oXxp9/Kr/slA96TSInfk36oAeZTNkaCXT6oQ+7N7N/FFlUkyUMmW5f1nos647sWwfJXH27yn6WuigBPdBG9FVGwPaOA3B7ZvHDTkPj9jZK4IgExNUHq4y8vmGFQuRLqYUNoLk8U6fgd9QwkTvXvx99EUExccSwZnVNaHzBDcPXiQ7519KYiLMAQk0pWnSlv96efzEKtlPHUmCEJys3paxwZglHg+/TiLDlQ21MKL6niTdAMiq0IJSXsMqVDy/kn5vvLVNuYPQkkFp2SodPvag+hTzX3pZxM/2ijqXrekloVSF8dDSoeJ/NnE7AmT7n0o8jvN+lYmnvJggNTf4ob3vrFfiaAuYSfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5182.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7FCV5GoVb8GwoVsvce6bd4xMoGgMoIv2/K7towm2Nz3Z85OHYyLZejBWnILQ?=
 =?us-ascii?Q?NmzewSPQPU7AzTwAhxSPHwX3aA3PFYYZrC4QrKl+atCwfIFhS6/+N4caZPIp?=
 =?us-ascii?Q?DZOIx+Koa0GLGwB8bk3mDwa33X7J/0jQLCYCO/n1xt0QmikWxJLHl/RD4JcY?=
 =?us-ascii?Q?4g0jejmd2SYqZzVubfuo41mJU6+RV5o81B3mGT06l63/Ol5TTYaIMRU7bcQg?=
 =?us-ascii?Q?xQa5djAIgjhEr5msWIjiFmGMhn4S7jQLL7uS/YhkNtkhkHF0/WVJEMfJbhpQ?=
 =?us-ascii?Q?63dWjbchu0SvTt7VmHAH/fqLxoS8k8nfCUhkmNWCLT7vNEVVwfHZScrvrHJI?=
 =?us-ascii?Q?d+tSWAraikYNVWhYb4+cIDaJuLmG15w83AgZyWyDRHVBR8SA2JX/RMlpYSv9?=
 =?us-ascii?Q?4KHgloZk00bEfRFf8rgpbY6Wq4HJz2m5wum4knAsu91mrGPAnkIeyJ3KEXml?=
 =?us-ascii?Q?ITzRIs4N1IV5O0rdfEVw5NBXs3kGfCzvgMIYJu8R9TZRHWcPXcS85UyHnhUn?=
 =?us-ascii?Q?pXZVwTkmbBIW0mwSLJosjo9dFhQSGQUsYVlcWm0FEoDNSuvdX143IEzmsupo?=
 =?us-ascii?Q?PGj193RppYAjx2LdfUyfomO0wo6nYiacnjKQ7b28fhVVj00Nf4PRBAJl3MEN?=
 =?us-ascii?Q?asY4DWqqZNhAQp0II1L1Bc+YaEVAnoFI7AMtdpiesOtXLb7v5zu9O5Plnxgd?=
 =?us-ascii?Q?cZ3RIMzNIKWo3cSSCOmA2oC3vByljS+6aY66qfehYwJZPEbL5OnbSHBrVdXv?=
 =?us-ascii?Q?Zf9VwCCuvLyMBOkQEmH0si4MQ95BheXaZQM/sYspyAOrWgisRHY7gpOsk9+i?=
 =?us-ascii?Q?QvzCWByAgIGD1i8fGBWxBaMrX9TYdPX/uBE3Msivk06jrvpJKr5oYytrStsl?=
 =?us-ascii?Q?c4wfvqWV2bY5U6Da/AslvjZQoj52ffRqfJmsQO22BDqkN9dUC39ltJ1sY1Te?=
 =?us-ascii?Q?d4sQfyPzotoWv71t5eGcV8ObCEVk+nAsRoSccmHMz8EvGf5ByH/5zjJbLSdu?=
 =?us-ascii?Q?fxP6J7TrdOfIdbRnkN/KB5rPv9kIy0vVHIyJVEuHVZo8XhiwpdjeeAqeHImM?=
 =?us-ascii?Q?0Pou9XJXdwAM52lsdrFRRXMBI1rUD7nrIJl8X2ggsnd3shqmKcFGqM/3552z?=
 =?us-ascii?Q?T3j1quRnKoZTeSFSjaKbR9/H67p/gGXIpAlEn7exjQuE8XGfEXOJZT7Mu8Kn?=
 =?us-ascii?Q?RzMyl8bPA2OptYLr58ruPLRHbYlxmgHlzZQAFNvrhOlfqeizCV74ZZn/a9sO?=
 =?us-ascii?Q?TLGzLcINWwCrecLGISYYbr7Je4bQuET++hnwQgxEnIrVHnXFeGp73NhA/V7A?=
 =?us-ascii?Q?UN3Z3fNgQGsaTR35nDM6bsN5cMIHxx2aYkEfEfK2+Vn/iO5B0PS6n4T37Ls1?=
 =?us-ascii?Q?s6p5NYolx+x3mj50dLJ/u9bHkXRws/UyORH5a02HNkQ+v0jEwvzAYsyxZ+PY?=
 =?us-ascii?Q?GmaaaWJJ2mtdtrdRiOk1lk5GB3ppY9YRNgqtzMoCdRnO1nh6VBvrZpZ4VviN?=
 =?us-ascii?Q?QUow2Z+8isunekE8G7JdDyJH4tUiFyzmsKyi8X2bOshu8i2en+qDAwcWz9vP?=
 =?us-ascii?Q?LM48BQSNqUrDpL4uBf3fP6m88W4oddU5r4dtSmPGABMmCa+XFbVJFvte7CC+?=
 =?us-ascii?Q?BkW3ZGayCP+1u300qB3sFO+NIoc3MwPGQd266AH8IrLc2/Ab2mnykbYDCnKC?=
 =?us-ascii?Q?IUWAfLepFjsjj2UK2iCNjL83wfP+SZWg15jz3Nt16CUdL/Gm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e205b15a-43fc-4862-fd82-08df0eb04078
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5182.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 20:23:46.9760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1FXzaGXmuvrsRe6ZAf/QXvaP+WXYpIUhAmuClRZHP7CyZWr4B6M/agiENjwAvfui5507eG0mz6kenEpHMnTYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7081

The dma_fence abstractions added by commit 3282d5916019 ("rust: Add
dma_fence abstractions") are compiled unconditionally, but the C
`dma_fence_*` symbols they reference live in
drivers/dma-buf/dma-fence.c, which is only built when
CONFIG_DMA_SHARED_BUFFER=y. Kernels with CONFIG_RUST=y and
CONFIG_RUST_KERNEL_DOCTESTS=y but CONFIG_DMA_SHARED_BUFFER=n fail
to link:

  ld.lld: error: undefined symbol: dma_fence_release
  >>> referenced by usercopy_64.c
  >>>               vmlinux.o:(rust_helper_dma_fence_put)
  ... dma_fence_signal{,_locked}, dma_fence_context_alloc,
      dma_fence_init, dma_fence_{add,remove}_callback ...

Wrap the dma_fence.c helper include in the same
`pub mod dma_buf;` in rust/kernel/lib.rs with a matching #[cfg].

Fixes: 3282d5916019 ("rust: Add dma_fence abstractions")
Signed-off-by: Edwin Peer <epeer@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/helpers/helpers.c | 2 +-
 rust/kernel/lib.rs     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 609689fba3dd..2c5eecc091c4 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -57,8 +57,8 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
-#include "dma_fence.c"
 #ifdef CONFIG_DMA_SHARED_BUFFER
+#include "dma_fence.c"
 #include "dma-resv.c"
 #endif
 #include "drm.c"
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 72f5527ba66c..f9ef36217bb5 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -67,6 +67,7 @@
 pub mod device_id;
 pub mod devres;
 pub mod dma;
+#[cfg(CONFIG_DMA_SHARED_BUFFER)]
 pub mod dma_buf;
 pub mod driver;
 #[cfg(CONFIG_DRM = "y")]
-- 
2.50.1 (Apple Git-155)

