Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012011.outbound.protection.outlook.com [40.93.195.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9952DB79C;
	Fri,  6 Feb 2026 04:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351691; cv=fail; b=WE/qGilpguiA8hCUDKrRYSSy+D6E4CZtOZhjnfq6FHdHEPRUa0ht9Yt1Kk0LljuTJcYldwYQIzVFkRD2rej08kVWPjTddmzajPquPc5geiZboL3Jq52dPvAmL36peRxNgAlOPDdX6OxqP74lVK3M6UHdSViW55imuSbX1hPQppQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351691; c=relaxed/simple;
	bh=zt/vbiFG8svw2FA5IcMXfMc5KK8xP3UFYAdMos2Rl+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MjvY/Lw1tjiRSD3syW3Kwt24YF/H/Q0H4OkXlKWz57tAQa9SQrxRdHY5hE16XraOgQlFtSIfJaQNRkKi8zRceeb8d5k5/svnMl++0o9LZc/5J9XT/Li/sT55U7ensZw8jfYEDawn0fnmmw54G/rdXKOypCGouAN29891g0mzDRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZcT+gFth; arc=fail smtp.client-ip=40.93.195.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZcT+gFth"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xx50fhvgoIxktKE0Tc+2LEwj8KMz3QTtK7zZXpMHmmGin6zOG2r9ACCBES6uHYChM8l5g0e0yWRjhh9Ia7KkkVd0w0pvRWRx/8dAY/uFqZgt9Dn4dvbfMHgRuc5XvGvmLwaI0zsmOqSRoIzvxAcpmI084mfKubxAMJc1it1tSIDkXCjUAWdizM82wXnToDSfSfpH+Im7/rL1VZQnRh3YCTjkqUgjZIBnjIrIIQUr/ttLH3jIvxTMxuhDNOWy0geTT2ckQZiQy8+qDiuMyWbHIzYA0qK6nE33kSuvnWh3Nec3/I4c9NEXGtII8SITTnwTKIjfl45rh1WgVRiemnsDcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6l5qgenhdQ2TGcieM8RWT7sBgqv4/4JR9LuGO3gpBTg=;
 b=d0dB/KvXoKEKlPwNRyHZJyJs9gsSd9KDJ8w9K51Cupph2/xDKFjz6E9abhi0d9YsCjjtzjj6ysxUoLzVlL2hHu9MQFBPp5V0Yu/KvESQlSP8bPdBxQaO3lUVGgEl6XCcRVHJPuBCOdqFsZuPVYFNtyApCaJWBupO0SzGyyfQMnj6MCvI8pPi2tIfWQgXVJlrG/MBm1zbVPL0MryUGzOasR4iocarg86nnMKnkn3r0vRlfXB/FXWChtQNF1CfdzMUt8B6AkzGID18tWrJm5g2tNsDFTtcf6bazAURC5sDN6+pLbiJDE4LszBwGcQ8uZP54iJzCqzoP94agCqp7tGf6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6l5qgenhdQ2TGcieM8RWT7sBgqv4/4JR9LuGO3gpBTg=;
 b=ZcT+gFthZ6A2LCrLqSPvv3pgA7fyS6wQ45VXg7tTnzQWYmdDZtA57EdVzfRVSsNTowk1rex4ghA7I4rFLFgpWdSR3xKnPDeP1XDW3+ci1++HhqEWWCMcPrwILLT5/3uMZyHbb0BVssjuRzSgkdZR7W+WxeTFzNz7R7UulOfja+FPOxZKI8eYPqC4lHBYnN9f2sRTVcPFTYDvNLmzFcxqrnpFaS5AdOQWjlasrLcu84S+dxbp6xhT4OIiizqqA49afRcih4KVsRNoH5NLIJ93WZ5WAwVE2s4mYzHZmLqFTMIu9S0ZXz9eIstQ+G8nQDfFW+QDj0Dns6V7X+StyD+f3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:27 +0000
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
Subject: [PATCH v3 01/30] gpu: nova-core: print FB sizes, along with ranges
Date: Thu,  5 Feb 2026 20:20:54 -0800
Message-ID: <20260206042123.303281-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a214c36-6116-4907-880d-08de65373276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4faESuMBLxTLxbpB5KTLVDJKU/gM7Sv9/UAbl62WDpxJl1zXI9LcInfzHFxD?=
 =?us-ascii?Q?jY6tGO2Rmgt++xSVFlDzwgHaC1+uoBOsJMQp6PQJjW5U6Xf57bPSTyEotpSD?=
 =?us-ascii?Q?VBy8FoKDRhMuAl6Q8NWgp+oM5ZCWwRlpO72CC2+lSAT5nVHqGxLxoz96QRK4?=
 =?us-ascii?Q?X7QogYJM3CTa3YpHobGVfE/GFbZlzDp1BrvTnKFbGx2ukUyHiMcQc9R1FQzC?=
 =?us-ascii?Q?6ChUekvhCZt4gDd6MOur2WzIly/6TeU8VTAW7YsjLlCQxxCbc3MvJvTMfw1D?=
 =?us-ascii?Q?Rlqs5b2hL6PMFcnGvLdzgDeRhB542mU08oRC8FrMcoJdYJHOKe+NK8JvosfT?=
 =?us-ascii?Q?L6lXvNUvKiumyHGM32x5PkFGioyLc9RUpZKxGwCCcUrDpwa0OmxKL0ovIu0h?=
 =?us-ascii?Q?4zsTuh6bg7CJXKEf0uQuzQ9cPany6PdXqY5Ha1OUFjZqHxg4uupCXEJIc0NO?=
 =?us-ascii?Q?C2j/MGNXMLbTb9sFOFWikafJWud/5beWlnBfrgHofdmtT1JBTlDnozrLSVCs?=
 =?us-ascii?Q?FSmV6BFMHkQIgFH5+V0pYG1ql0mi780WXCKpl5hIoTWNBQU/VfBGZfmueY32?=
 =?us-ascii?Q?LF00NtpovIR3fp529+BNDt+E5amiaS5vlABnlZgu2gIczc2wmxXLN/5nh8HW?=
 =?us-ascii?Q?KzzRY4gH2hXOK96vWFStS6pFA6J65WQsjO0kSQGNvE8hq4xKBt4fmLuA5AOO?=
 =?us-ascii?Q?DSMSU+kdgHCuEdPNHx3bN67d12qZlOs/+Jgt8Md433WQ+QIs6luhxTcCza+8?=
 =?us-ascii?Q?IbgKpb9xN7DhIPK3GXHHxoruY0qoJGBAVh3ZNfWz1y8D8W/u9CFgQ3PSs4Vo?=
 =?us-ascii?Q?ZUMN5L9ywimch251exxzCs+t8PLL4AI+jkCQF65pbPfEvMl3PNO/TlbHae48?=
 =?us-ascii?Q?01/NdLrvQa+zKtb//HcTL9y46a40TrgFQ46Glk0Bmsr94V1/Z3ejuAwHhV7g?=
 =?us-ascii?Q?ewWeInXzT1kpgiJ7LrjNjz4436YbVOzOVqW9WbD3j2ZinjTpjjnPcbvUGfAL?=
 =?us-ascii?Q?cjok3HFIK1xHLAb/OJddpEIRS1zJfvZY1FUcE2hJwDTNAF3EF270iUJGOASN?=
 =?us-ascii?Q?dTltHB/7TMtwsbUsc7845ZwYJdfvA+j/wxDgyKGdWyAujZdYOOjy+VldyYXb?=
 =?us-ascii?Q?Nk4s+lmB2cLBqAowrt9nGgDyE1T6wR0f3Vj4GUVX5fe8aVAaLpoPTJpHDcqb?=
 =?us-ascii?Q?D+v7gS7UrYzhl51seKgOe23opi9QOWOs5Gw06uOyFNEgfht8UltZIXyMNHlz?=
 =?us-ascii?Q?3N/bOGOlmZiNpq8lT3TLTOaFwgyuthT1OepWMZbpdOBSSuDzticpxqVqTyrb?=
 =?us-ascii?Q?YZ68s6k/gVJE95Ynr7gYDdQ0F7OGE+9I4zVjidQy2uolQburCjSTSOdZRc6b?=
 =?us-ascii?Q?3NImdaORv7h5JOCDVtZDjqUyOuLJIfo7rdIva3kiLF8K3rW7ln5PD6oMoBhU?=
 =?us-ascii?Q?GEc0t+O/zwgkKYuuswgeQFEaALxVK5C7sBMvb5Q+69nd+tfkhKazGfT2bbh7?=
 =?us-ascii?Q?6+4RAQqoPsGnmTO8KzqvidCgUDd7XmkVGPq0/HrZ94b7meyTEhSbXPCxvfi6?=
 =?us-ascii?Q?NyIrZyf0F/03IuF39uc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v6YVAFI1U4htZkWQpSt9Hs5ZnjBzZpXNT736DNCk4RG5KYAWUMXAQethaeRO?=
 =?us-ascii?Q?CgJy+JIV4WytwsfuT2W3MBcVUqIOgtj9U0csdSb41iihrD8hV/87JLhMTIYR?=
 =?us-ascii?Q?N1A1wDDdrh+3Q2ykUHfcCZj6DZrHW2jKGZZYvqGTkKP1Ki2+HTxVcZuaxiN+?=
 =?us-ascii?Q?9GLySw14qdQh+redX8gR2WCz6ghLNpwblIK19cgwhZ4/ouv0U47yUY2r4fOi?=
 =?us-ascii?Q?p8E+RWlVWNUxMSq1Isjc3FkS8r3ggjOyrQTdCfIRfdliBYE0V1A6d6ptIXf4?=
 =?us-ascii?Q?Uka1AHNXsnDxBd2V3dAxiOZ7yIa2G6Pl1SLQYW69XdAucVWFzBPJwf7fere5?=
 =?us-ascii?Q?h2rAebsmbpo6zUQu4y6SwjPJY1tg7M7RMJ+glLG5IYIFTP0EpDCYHvg1fFHR?=
 =?us-ascii?Q?NIIBPdmaOJHf6SvfrbcczgrCjrTJmyBpZrwSn2aZDdQ+GXowyP9dT1aZ3MlG?=
 =?us-ascii?Q?+rHU0ahfPtNxFAzgpC1EAA8DRdFV1mQKXa0Vz4mAXIeYX+svdoV9Cc/23Rea?=
 =?us-ascii?Q?Waa+RKE35RgculnZcVBQlrj8skgktxhoBHZql35QtY2csDHH+FMnzWwmykod?=
 =?us-ascii?Q?dBEsJ9r0Cu3HuWT469BbY8ne5KNmpt0SBrFhZkxAX59nfwyMPdI3l/YnOmqB?=
 =?us-ascii?Q?3D0gS3CTbjeKaHu7/WqeaNfY6tTzb1rSYgRc2ZZM3LG0A29IJmmrHaTdNFqi?=
 =?us-ascii?Q?3mnwIWj0s60FXJ5pp92yUrPzkFcDewFJok13gHq9b/5YCoq25FSD822JKXWW?=
 =?us-ascii?Q?40KRg/8NlGaDKXOU6PKAnlXSQjLRT6Q+3wqSKHe9YdwANBHXBngE7NzMcULJ?=
 =?us-ascii?Q?YJJNP43PeFRRQm58hC876mXglSplcW9wGNsl8xiIfE9OFh0snejwHgMNLMRZ?=
 =?us-ascii?Q?odRtJtiYhLGsfoDSFJaGGOXag0sbqbHdkSorqvG2qjhTi/M3Ed7n/9p+4EGm?=
 =?us-ascii?Q?7Y37HdK+7g32CaUIfQikv3yZ7M8M8d47dEvDg+wevgwy3GcaF6a3QEbxxzG5?=
 =?us-ascii?Q?/hMhzrQc+qTrV3V6BwEnLfq6eNuYjqnZpAOAQ/3gdhRj212sEfTt4nB5juBC?=
 =?us-ascii?Q?zZ/M7058ikV6eYjo38B4qtqYTWQnUBZN5qW5EXzlneK3fRvb3w0FJ9tFDlQe?=
 =?us-ascii?Q?nArNLbL0PMii/s19AzUt8g4OtJTLqgqnpOfPJDoUbWlre3lCzsfjrcnv8Xsz?=
 =?us-ascii?Q?rF/uOHETjQvXrqNynAXY11FFzyNPmR+Qnb8rlfkUV9OZ4JrooibFYSO24PW7?=
 =?us-ascii?Q?m0keIYhvLI4nNg8/S09uVgeRvry9lXoCPmSu1DYhGc23jS1Zl6/X0V9eKAPb?=
 =?us-ascii?Q?/B7qROel2b3EibsAVuROiA3Vl3bcXJrsM7FMoj1MNtTM8a/Gd/e6grIkhra/?=
 =?us-ascii?Q?6KL2LVHAjHEfUAZSkx0TOlGRorzKtAC9BOqPfGpHTME+nym7Xu7jSWsP+dyH?=
 =?us-ascii?Q?hyv9IF3bzaF6fqmoVkgep7ImExs3OK+0nXtWk30SgXMwrGTD2+BGm//aAZLS?=
 =?us-ascii?Q?0gz+pcD1HmTYL6Ie/R8rXLR0kAYRIBKERy96lHkDmlzVLd30esgbEo7DpALg?=
 =?us-ascii?Q?2OGIYoLxLKnzpyehuJoEUFWvKX/UeIJ0yO1WP6a0Vebmo1iSW1CSF3CM7PAr?=
 =?us-ascii?Q?xpMbm9uK366BdmY8Eu+Efd4tsIA24Ng6f8SiDQesBwxmSpCKwgczaYLSYvc+?=
 =?us-ascii?Q?fI4YvWhIipUqsDmot5jkobMjpfU2nTRX17v1G0Shz+NjdZ7ZI7bM9X2LFZIA?=
 =?us-ascii?Q?PPEg3AGwLA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a214c36-6116-4907-880d-08de65373276
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:27.9209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7AYPexKN4taFdPxGkceXnvjHYAwq7R8aTFJC/HS4UmrCb3FiaNHQXtmWDWakfz18Oav6PN1hovezWPNFPkLFMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

For convenience of the reader: now you can directly see the sizes of
each range. It is surprising just how much this helps.

Sample output (using an Ampere GA104):

NovaCore 0000:e1:00.0: FbLayout {
    fb: 0x0..0x3ff800000 (16376 MiB),
    vga_workspace: 0x3ff700000..0x3ff800000 (1 MiB),
    frts: 0x3ff600000..0x3ff700000 (1 MiB),
    boot: 0x3ff5fa000..0x3ff600000 (24 KiB),
    elf: 0x3fb960000..0x3ff5f9000 (60 MiB),
    wpr2_heap: 0x3f3900000..0x3fb900000 (128 MiB),
    wpr2: 0x3f3800000..0x3ff700000 (191 MiB),
    heap: 0x3f3700000..0x3f3800000 (1 MiB),
    vf_partition_count: 0x0,
    total_reserved_size: 0x1a00000,
}

Cc: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs | 83 +++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index c62abcaed547..6fb804c118c6 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -1,9 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::ops::Range;
+use core::ops::{
+    Deref,
+    Range, //
+};
 
 use kernel::{
     device,
+    fmt,
     prelude::*,
     ptr::{
         Alignable,
@@ -94,26 +98,71 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+pub(crate) struct FbRange(Range<u64>);
+
+impl From<Range<u64>> for FbRange {
+    fn from(range: Range<u64>) -> Self {
+        Self(range)
+    }
+}
+
+impl Deref for FbRange {
+    type Target = Range<u64>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl fmt::Debug for FbRange {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // Use alternate format ({:#?}) to include size, compact format ({:?}) for just the range.
+        if f.alternate() {
+            let size = self.0.end - self.0.start;
+
+            if size < usize_as_u64(SZ_1M) {
+                let size_kib = size / usize_as_u64(SZ_1K);
+                f.write_fmt(fmt!(
+                    "{:#x}..{:#x} ({} KiB)",
+                    self.0.start,
+                    self.0.end,
+                    size_kib
+                ))
+            } else {
+                let size_mib = size / usize_as_u64(SZ_1M);
+                f.write_fmt(fmt!(
+                    "{:#x}..{:#x} ({} MiB)",
+                    self.0.start,
+                    self.0.end,
+                    size_mib
+                ))
+            }
+        } else {
+            f.write_fmt(fmt!("{:#x}..{:#x}", self.0.start, self.0.end))
+        }
+    }
+}
+
 /// Layout of the GPU framebuffer memory.
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
-    pub(crate) fb: Range<u64>,
+    pub(crate) fb: FbRange,
     /// VGA workspace, small area of reserved memory at the end of the framebuffer.
-    pub(crate) vga_workspace: Range<u64>,
+    pub(crate) vga_workspace: FbRange,
     /// FRTS range.
-    pub(crate) frts: Range<u64>,
+    pub(crate) frts: FbRange,
     /// Memory area containing the GSP bootloader image.
-    pub(crate) boot: Range<u64>,
+    pub(crate) boot: FbRange,
     /// Memory area containing the GSP firmware image.
-    pub(crate) elf: Range<u64>,
+    pub(crate) elf: FbRange,
     /// WPR2 heap.
-    pub(crate) wpr2_heap: Range<u64>,
+    pub(crate) wpr2_heap: FbRange,
     /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
-    pub(crate) wpr2: Range<u64>,
-    pub(crate) heap: Range<u64>,
+    pub(crate) wpr2: FbRange,
+    pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
 }
 
@@ -125,7 +174,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         let fb = {
             let fb_size = hal.vidmem_size(bar);
 
-            0..fb_size
+            FbRange(0..fb_size)
         };
 
         let vga_workspace = {
@@ -152,7 +201,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 }
             };
 
-            vga_base..fb.end
+            FbRange(vga_base..fb.end)
         };
 
         let frts = {
@@ -160,7 +209,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
-            frts_base..frts_base + FRTS_SIZE
+            FbRange(frts_base..frts_base + FRTS_SIZE)
         };
 
         let boot = {
@@ -168,7 +217,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let bootloader_size = u64::from_safe_cast(gsp_fw.bootloader.ucode.size());
             let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
 
-            bootloader_base..bootloader_base + bootloader_size
+            FbRange(bootloader_base..bootloader_base + bootloader_size)
         };
 
         let elf = {
@@ -176,7 +225,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let elf_size = u64::from_safe_cast(gsp_fw.size);
             let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
 
-            elf_addr..elf_addr + elf_size
+            FbRange(elf_addr..elf_addr + elf_size)
         };
 
         let wpr2_heap = {
@@ -185,7 +234,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
 
-            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+            FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
         };
 
         let wpr2 = {
@@ -193,13 +242,13 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let wpr2_addr = (wpr2_heap.start - u64::from_safe_cast(size_of::<gsp::GspFwWprMeta>()))
                 .align_down(WPR2_DOWN_ALIGN);
 
-            wpr2_addr..frts.end
+            FbRange(wpr2_addr..frts.end)
         };
 
         let heap = {
             const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
 
-            wpr2.start - HEAP_SIZE..wpr2.start
+            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
 
         Ok(Self {
-- 
2.53.0

