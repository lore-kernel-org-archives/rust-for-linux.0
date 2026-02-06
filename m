Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010054.outbound.protection.outlook.com [52.101.61.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127812E36F1;
	Fri,  6 Feb 2026 04:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351708; cv=fail; b=IoCT2kmvvy117prlk9NTjiFBaLtjbeOLYzU7xlu7/kcMVoVfh7H+atqreZeShLHACTpydCGSODyByL7Q4idDbXs7Cl31sDolN04dpFbcW59m6i0Ox7J/3i44qSpUIqwW3/DWnZ2JX6zNBrRhlLK8APYZbs4DmitU0n4+iEoITL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351708; c=relaxed/simple;
	bh=Njh9lay5dlRS6HGyNjy4wI2cEcQCn73v0RmX0of3NGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NsrCaJC6bzRaO4MODLFI6KUwIdHWaYgHbRAoNBt1VRv3qVwcXkQdIHZtF/ua8pLpou8Ex1tUbEYZQwvTZZpcldVT18gmv1D8LSWJEbe448N+ShVRpZePZyz6IARZBSJ3Q9VazMD8ZLa56sG1Xo3V8fyYw8Ve3QtMPm5x4Hs/zC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pnEipC2k; arc=fail smtp.client-ip=52.101.61.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pnEipC2k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v91qrdUCqmKWp4m9y8S/VqDdDBrFGjhVH3+QTrb5x9gBW8DQx/IQK3+Ibq2G+qLsNg4L4wgSnE9LR39Dz5xDpSaNmgaCfkbjuWMzPCdLkRzMsYRIeLYD2DpPquXFXLoE4WJON36rwY/0wNHq0emh2IOdcWBFACdZvFwO3AaiMO5YtKGWzfMJg5gA6sWTMrFuuN+1PkXNUoWl2IO65PyHky2IJhyj+K6aap0+9Nfi5igNUAv07DyddnjqwsK+AbYzVABZAruKn12CmIhwdpX/VKb40d+czCK0OIEiNlQ/O6sY1uGSJv6f5HkvVgDaA47Z8zEqMZXJq3WJp1iP7LL6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAndklGJsZHVwLvALvBM3npq1jW7283gIK+d7Kv6r2c=;
 b=G82zKsNhXTIRPuM5y4toGbOv4sIBZqS5f1YNvZJKccQflledDX+Od70FEqzx4ysnXnAeMp/8HHs/aLWnzlqedBfn0NkyB5BgywaoMjLlO7aHICAja/+4rdf2H4LKlK2hH18NUsk/EtjmnaFUPNyfTSVCb4eHcYwceC7G7JqFr68DbwG1/CqSYJH/KxUT/YFybOrOi9fooFWYA7493hHxEStjOvgGRi1agqKKfz4W3C3vHyP2hV3hrrOoRgt/ChAq7XmLKFgUlfW5AwDJ3urSrIp6WOuNiOPG3bk+MZzNDmO2NQ9OWn7IicVbvoS2nf0DFSZMsGoDMouiAs2Tp4kQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAndklGJsZHVwLvALvBM3npq1jW7283gIK+d7Kv6r2c=;
 b=pnEipC2ka7hdomzTNI6hxMM6vh9sK3tKyL72G6okMmXRTczJZb96fS4FTjyfIAODwt/D6cwbiWSGghVQcGJVNDxaqbYL2RpQN5eZyvRTVvK6P9w3oA7RrHuMHyNI8XQSVki88aAegf4q1MvX/UQyuXy6DYCR3wPqfRIvnKZwEeS9egS4vLbhC/2h+Kq8GMbrd34tgiGtTHY+3Tcw2a1DIrLF4oq9Ahw6ge1OUtCEBpIuTvZOg4JocbQPFuU3iOjmMQwLMyTsMWqx0EsCt9+rP0hg3eKT8Qc92aN4u2OF+FBQXlTcm4aFpm3KzCg64MlOf3F8XkSRu5xqpFylCi2mwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:44 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:44 +0000
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
Subject: [PATCH v3 14/30] gpu: nova-core: Hopper/Blackwell: add FMC firmware image, in support of FSP
Date: Thu,  5 Feb 2026 20:21:07 -0800
Message-ID: <20260206042123.303281-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: b60ca0cf-7d3d-426a-9ea3-08de65373c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IjR9enS6VZMcxiqr9AXZXcuEwRpVclDtHaX2x99YU9A7u/4l/OmmyRf9bOYU?=
 =?us-ascii?Q?RTdm05cgN2wittgCQGRk7Kuc3UceFHuh8ieIhxK1Uv7aeGl2xNy3toiIO98H?=
 =?us-ascii?Q?yz71IWXw9cnm7ge5vkh9JH58z2quf8gJS6TxGTh3jbsvS50YW1iZP9CMyvCP?=
 =?us-ascii?Q?L19e0ZOp54VVrBBzNlHVrOKJEl+ByX4MDwA5nDuBYg+qZXI2AivbGECYDdPp?=
 =?us-ascii?Q?oxScsD5QmLTeKp8TpSug22kb7P0ZCOeTSQwUyWpsa0e8s7e43Nk/TAP11JjP?=
 =?us-ascii?Q?c8KXrqC0WbQuRxa0wtZE2sjOkKZBGZvr4KjGgzgKTLe+yJ0GzArnu++YjNFU?=
 =?us-ascii?Q?srFdcNdBJXoP7Oxlb07/6hMnaNd6BI1AkKPe4MJzTg6zVtQ57N07GqQ8saZF?=
 =?us-ascii?Q?yRiBa8vUJTfw+ovopBgZTSd7XsUUdH9SgoljStTP0HywDAd5mWbmaRjCsOXH?=
 =?us-ascii?Q?LR76Rw1rNon9DopzWHwl11ID+e7WgsLogJgbci9lVYvnCanhC5dgRz/vvgQz?=
 =?us-ascii?Q?3GfZDnKxrObUTzRU2uq+JA89s4OFDZWpHzglYxgyzz5IgmwosLdQ0jmowN36?=
 =?us-ascii?Q?BCRDSvb+E7wW+9gYitwYEnFeEdro0/lKGhPSgx7Rwl7il/RwjT4JHSsCr7y6?=
 =?us-ascii?Q?uKo/ueGsPl+ma9DEgZFRh7dcwxHMbrdDHCmPaOUVOW8hQ7DI2zFlbBITzNHk?=
 =?us-ascii?Q?DOvjY9t3O1uEh2dkNM6HAE2tMJPqfD2vhC2TlDG8ZXhohVSh32cDSrcpyo/P?=
 =?us-ascii?Q?Tu+nDc8Uc89zoT15YSqWRqP7VoUlMpEiUSauTFwo/ch9Bx05nWapfIIgJsj2?=
 =?us-ascii?Q?nOgw049ang/zp2SE5IXVtdf9RweQ4gP9UCnPR9JNzjU5RgnXix8EupHgiKZY?=
 =?us-ascii?Q?t557biO/lENb1LGCw2xuUpmH5fVhnemEvAhLXgkFICZ0O+6SJlvIJCsUgjSG?=
 =?us-ascii?Q?Rsq3NyRlqKQjvAA+Yu0onMBcDY5fnaqf/B3Ld/ikqOQolvS7yZ2L//mzqhpB?=
 =?us-ascii?Q?c2i4f505PVd4gSSYlAL3V4fV4ktFHUVGG8TpiNM8UbLXUI5K+Il4QWEr+Aei?=
 =?us-ascii?Q?VQFJTaNg6nkeR+P+Habve2EW4GLrE2QUTRlPNI7tfFX0B5rFSyRMyPI7tAT+?=
 =?us-ascii?Q?ZAtVwYXZschOSsMMFTZdnBBrbxct28VqGTRHXwhJ/P076mwJsay0OAwzXXhm?=
 =?us-ascii?Q?+9ogO8nz/wHZOWhNWKaGfS+D06S0+eeSKHTgXdEojmc1dQ/juVGJyNhWczUs?=
 =?us-ascii?Q?H1KxWgvZMheFoOpYpMZXuHrDi1saf1ovoxnokPvg/V1m85VKLnmalV9ol2U3?=
 =?us-ascii?Q?IfoAT6SXY2Oc6mMbag6aOvzq4F1thHDg6w2nFzH1M75W4pb8Pqm+7jNwYh5p?=
 =?us-ascii?Q?LMyTzweaFyCMEVDvU+DSBo/1yMtLlc7qpVbGgts01zuuMSSjoWrs/5WH/GF/?=
 =?us-ascii?Q?BSXel0GSGotkMFtKZGcCpIF6B9kywYs99l4fqK2WP3jsJxuVNS7XzMEVGfA0?=
 =?us-ascii?Q?DyuIbyKzO8Y8lJzXVk4EL6h7tW9QhL8+Cc2LfBndoy2sVHyACTEubCoJC7dZ?=
 =?us-ascii?Q?TNnVI5fw0scgA9UtyJQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8/RSE62wUrmrMWBcMh3gWCOYb3SHo1cCo+5P657EiuZGz213070CLP/P0Az7?=
 =?us-ascii?Q?aMz58hb82KkBOiS1DHWbbyfuVLhSrPu/yclJYE9YayVG7sIEzJPV+FhmFZZD?=
 =?us-ascii?Q?bv5BOgGdt9aKSS3x3aVKsH0uml9ffZOqIRGcK6+Sy+7R9Ffc/coMc3yPsI0N?=
 =?us-ascii?Q?bupmPb9vRVgH8LBxERMB3IqYgzLsbAleRSmIi5oMSmPkXICg7rrasBJ7ACop?=
 =?us-ascii?Q?TM4l9JhNty5yC2Hg2c7BppOmWtstFwqh37g2x1dBh4hLdKczTBp84DUkViBE?=
 =?us-ascii?Q?Tom/DGd0W+a3HTUGcNqddOYUQlHTjtaL1aDDlx/5NL1ww+tqWpw1Av29iaYW?=
 =?us-ascii?Q?ZWJF03q1Jou4Z6nFIAgMzbKW3xS7J1EXnDgKqzWRBSqTEGnTgXCiwxeJtcmO?=
 =?us-ascii?Q?17EEAuQBO/4Ygoe8dVcGi1yvSyQbV3w9gwcrs88k3ssxNRzg21Hav0E+z5x2?=
 =?us-ascii?Q?QPONNQCf1bwBau69DwBg3i3SJJOeieUkg9UrylrqpZ3bt0BuwS7oic/E3T3Z?=
 =?us-ascii?Q?Qh1cF4qR++DcZ+QBJsP0eS0KWQgtUgNHpDvvoJ9sPdjsJesOsePuzzTo/REU?=
 =?us-ascii?Q?7hqi2nq+JMA3wwqyZlumw7sM/X3TEfT5l2G8qCxvOZG7wKs8XoIeh375Kwf/?=
 =?us-ascii?Q?I76kL2dX2TdPKgmIXQxHTtPsPkN+zU+kWH1SS7+Vgt4bC/YBrp9nxDwTffO6?=
 =?us-ascii?Q?3+D62x7AhvgtC72kV1QmoqdNWBWKujFfzAE1NVBp8y9t6WCB+S6JNVxhdhES?=
 =?us-ascii?Q?vh2hju4vuHWg4LXEk0rI2mXeFE+iFqCcoOqXTgIkNVXA7L95DOt4v8u0PFEE?=
 =?us-ascii?Q?7eRTeDlglU4HpEQ8zxeOiC4ZFFQgL7AGWmUsWhcvwN0pTMmTDJN8a0sfLP4x?=
 =?us-ascii?Q?DJNB0jkv81YLD1NbscTAVb2eyZHe1QwUyZ2h1Tq8+b6YDqSaTMkhKvwUIE3x?=
 =?us-ascii?Q?9oWeht+yUikvyLkf40H4jihBEsJzD9XmHv3j+0brSohQeyQnN/WF0QwRQjcW?=
 =?us-ascii?Q?HC2NWe1/uDx7fhWQJJhbsoJhL23UEvhmkVCHWskP9Vnjrkc/LHIw6WJkuyeS?=
 =?us-ascii?Q?usUU0tddCoz4RuJhTQ9G/6OkW9v56GxAOJHK0Rq5NOkbvhgVxgMJ7vo7L6VL?=
 =?us-ascii?Q?kJSHq+fiCLeSCqMvLvr6QvBj+h5c5UX2o0fdb4N85i4zFDw1Tw7ZNOD0lnKd?=
 =?us-ascii?Q?lV+cEosEcX7hWZdfn/rNb8rxuRsCt57+5Gqjx+4rec/znogtwcCMECE9XDMr?=
 =?us-ascii?Q?MpXKDzG/WAOYF2vfvkgrGNgpHt3pWFmXPmcogb9r8uChuWV4aRXkGm6YPAcF?=
 =?us-ascii?Q?pMepP7qiGAV6CowVG5MqcQxWQBb9Za1ozm9T03U7A2ri83ZVG2Fh9aZcpLjD?=
 =?us-ascii?Q?tCMWmWh6heMcn1Xt1wNar76KczMhuSG0DT3KwxtI20H6Czzb0yjRgrOKDvVO?=
 =?us-ascii?Q?otgXlY62+pzbbijmgnxQPgIajUdZV0omooq62pLRU+KWEZyyq5Hd4WofZrwS?=
 =?us-ascii?Q?VP2UDkpeRzar5F7VOQK8jUzMHby+UtMggX/uq9xOdw+5v60meETHv34L1Gpi?=
 =?us-ascii?Q?LLK71ymVZlEIVpbQRGmckK1YtUNIvQZXJjjKBpbojxT8hQyl+GqiaHn1uhbi?=
 =?us-ascii?Q?n2eUD/2WZ4zaVmaoV15KIlkIUhEpppH6RfVlDOd5mBOgwMXkZYMhfZpDV0Yh?=
 =?us-ascii?Q?7K5Yrvf6X+meiIJydCf+/5BKMbaNAzx5XriOqwMRImxxrSuBWvoHIycLznum?=
 =?us-ascii?Q?x1i/0ypqXw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60ca0cf-7d3d-426a-9ea3-08de65373c88
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:44.7676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGndVdi/I0Neprs4slEXTi8T/bUfnzekYKB/LXCTh5Llod0fMP1oYAWncd5xR3HAhhtK0i8dqIj1Uthu2TFYFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

FSP is a hardware unit that runs FMC firmware.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     |  1 +
 drivers/gpu/nova-core/firmware/fsp.rs | 44 +++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 drivers/gpu/nova-core/firmware/fsp.rs

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 43a4e70aeedc..9a9b969aaf79 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -28,6 +28,7 @@
 };
 
 pub(crate) mod booter;
+pub(crate) mod fsp;
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
 pub(crate) mod riscv;
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
new file mode 100644
index 000000000000..80401b964488
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP is a hardware unit that runs FMC firmware.
+
+use kernel::{
+    device,
+    prelude::*, //
+};
+
+use crate::{
+    dma::DmaObject,
+    firmware::elf,
+    gpu::Chipset, //
+};
+
+#[expect(unused)]
+pub(crate) struct FspFirmware {
+    /// FMC firmware image data (only the .image section)
+    fmc_image: DmaObject,
+    /// Full FMC ELF data (for signature extraction)
+    fmc_full: DmaObject,
+}
+
+impl FspFirmware {
+    #[expect(unused)]
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Self> {
+        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
+
+        // FSP expects only the .image section, not the entire ELF file
+        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
+            dev_err!(dev, "FMC ELF file missing 'image' section\n");
+            EINVAL
+        })?;
+
+        Ok(Self {
+            fmc_image: DmaObject::from_data(dev, fmc_image_data)?,
+            fmc_full: DmaObject::from_data(dev, fw.data())?,
+        })
+    }
+}
-- 
2.53.0

