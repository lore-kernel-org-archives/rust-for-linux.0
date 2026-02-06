Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5DF33F383;
	Fri,  6 Feb 2026 04:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351715; cv=fail; b=sgbR50a+G7Fqs5C9Xe8TE2+6jmBoK56L4CreXW4m41NhHXxHOLeNVlLhIEPZB7ChYHNLiled3TokOtZMglUfWbzAhFj84hVXjEm2dU/y1lx4cD6oPD1dfn1TB5Zw1OznGdN/WshUMFgniMT/9LyV1KY0F/1xbcarIqLpQjCeLrw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351715; c=relaxed/simple;
	bh=31scFklByFrobSwEq5ENB0jPpxALXtUz9msAMbZv4Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mPT2uJtmIFKZa27BTc9oHeSvRZKbISKjev0IJffIbwqOhp/D/aUrbscWYYgIrYhlIV/cUSPkIYijUbKkBPw4IRaZJlwZk9z3wISLRm21dcy7s3J5BhA87tph+IWxODTlC/H9p5RhfS7ltOcJ/7/vqPRV3Pna3dMwS6koo6y16tE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sWedqko1; arc=fail smtp.client-ip=52.101.56.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sWedqko1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3xODRuz1BBKYYRpo2hu9GH+/k9qlwHwk8RXm2U0DPWdF2xr092XtErZ608ryBeXBGvAfBnUmnz87BYjMzQVKqK/JhgY5L96TiLh+2JO019tIXcjM+kVC4Zav7DHq27R7HcMEga3Nz3Ok0hR8SVClXbyP4hb4tzRaf+q+yjXW6Q37cm14udLmUzNiVVoWqVJ6tHEZMknx+vZnBaXlkQlmS1ApMbzlEznxdtPo6NdBV4At6NN44xG45bW4iCyyxjHcEzqYLDAxaEF3DuoZZtU+V41GbokvyvvNFWQf39720Z5Pfmkzv+zdgMcfBh7+bHm1pxHqgqSI5ojfgne01/xyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OhAt2YwXA95ZMZ8/n9+LpueXsp3P2zd8vuBXlMW1ro=;
 b=K5lUibs3Lr69TV4qL4nRpSVuzeBQYfcIf9k5cthP0bPGs6SVS9I8PkfYVglKLzYB49e05iCEIj7EpkeiM+8oGg+/ScYtvVYk3/g6LfwjObhaerfFcK2aLxibfLJWEh8UOKGMWeI8s5JLhft3MouAwlIOpzYMru92pYIJZKBSKBHGwcrLR0Jdu/k7FdXdjjZGVe1m/Eem2EJ6C3dvlJgeI71pUYabZju7M7cb3EivSK8GIAbbe5166eNcGRZ1MsNinllMqLpG/FvRuMnA7XAUXGCwN7Rb0gi95gTVWl1bdeb1tHyY9WUtsXvjRND1NG+pzjW2fmR0I3trr+/kC7XR2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OhAt2YwXA95ZMZ8/n9+LpueXsp3P2zd8vuBXlMW1ro=;
 b=sWedqko11YqeLNCOYDnkoH7AC2VOSPZZAaSfQ5ZGPwnQ979rH1tzhkk0x0W/jx3Ur9Y/IQlexlTxG7LIy0945rZxXWgE6O3sQQDF/iywoptxU02LyUyYOuvH68zejZbAsBuI3raG2AlOhaZ0wRSs/UYNsQS1EX3g+9ADWjGOxK7CknX4bkiBEW0tqxq5ker7uOomaeqPcmspZ8ejPPmf95XaGesR+TeOgxHnaVMq8nCOoSAsQyJHfwSkKmCkrNmvZBunGObPYoUpsilWDLuyWRP3mGR12Vg2+ADx2af0VHjIFcB6amQW89qIuEdGOvTWp5+jwcQ2LqQ2wnKDyk5Jiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.15; Fri, 6 Feb 2026 04:21:51 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:51 +0000
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
Subject: [PATCH v3 19/30] gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion waiting
Date: Thu,  5 Feb 2026 20:21:12 -0800
Message-ID: <20260206042123.303281-20-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:a03:333::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: feb9bce0-d0fd-4434-76a1-08de65374064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8FaMbNI558VCvRBq95I8ASqbthKz2kT7ssyoR03y9QQERpKBRwNkOxfoCHLz?=
 =?us-ascii?Q?WcusERMT3Kq1oSKsPBvmQjN6akBr+9eDUGqelIx2nwVveDOS0l4BOts3LHqk?=
 =?us-ascii?Q?vM6a1Flk1QwIl5L041a7NPOZOOHDDo40z2RYz57ZL0SHT+O671ddirtfAorv?=
 =?us-ascii?Q?/YfDwKKB7P9ohuWXSuRZ7+F5P9agijNrNWqXZYRC/f50FxVgUtpSJguj3OuQ?=
 =?us-ascii?Q?yDCsnRWDOkenG7jJBo/crOI3EG9AQ9I0VjWLljmHBzlj+ZH0xQdFgUt0en7U?=
 =?us-ascii?Q?n0Z4AVwoOxb1MA47rxINTYdnREYC6R10dg7KaWNTQnJG5aQD95fps9JI4zf3?=
 =?us-ascii?Q?E+w5KSkRpsOLclmLDZNVYqfAt4eWBQWGjAFUc1TdihAL1fnZDKXrCOO72+7h?=
 =?us-ascii?Q?swcEdUapkIRRBCwh9WTA4Wo6eHpkLWLSSouWoNbjTGgjcxYvdv5jvjHp6XxR?=
 =?us-ascii?Q?84IBaHL4YDhrf6/ts/Vm8lDwHrTW7oCd7v8N5ZuW+YtqjK8pBa/xKj1U5/2b?=
 =?us-ascii?Q?pT6LmJmGwV/CyxOKZM8mo99GFmFQ/iuPh36zLk/tSqUqWCFAjA/TgKxSEqJG?=
 =?us-ascii?Q?Mv+AKq652OY+ThEj7xsdxEPEo1Poy/G3qx/xwR0womDB7DQrwWxsa/0AKHRM?=
 =?us-ascii?Q?KvYMFU2zOqeImhWKOyoLhlz2S/yK5gR7eOJpcKH1Z0S3Kr8bLf875gL8uNMJ?=
 =?us-ascii?Q?SslR1+qVmKUmYnTJRk6pAnwx9ukKcVvETzjQAsE3PIlCYphPMFL90ntX78Ex?=
 =?us-ascii?Q?ZmzwOfi1n7oGlcjqtOB4GNdYjeuYYHLQ8ZFhEsZDNXflD5LbR1ouYzOZUBZ2?=
 =?us-ascii?Q?a/UEbtV7jI7qVQEJ78J6U4cdu5GVkBybuUI2fm0X8xenV/a5X8DIHIZcHw0q?=
 =?us-ascii?Q?UpC4SPQiF+dt5x5fXgz2GT/SAJQ2KbbOIlShzgagS7HeatiNpaEooIuTmp90?=
 =?us-ascii?Q?gxEV2mySss/PrCE31ve/PQtW8Jl8XJpD0KgzdeRb2Ev8mahtbEhgYE3uhzMA?=
 =?us-ascii?Q?xhD05HJiKqY0zyfXq2tg4tbLICbKswcSc5lcfaT2+2BPh7+Ec7iCGeQJEIRf?=
 =?us-ascii?Q?G6XeloIF/78F67GbW2VNJIonN4EaXekZ7e+sjS9qbKjrI/qQSNQoVqGJg6Cy?=
 =?us-ascii?Q?KB+ISho3O3euIiPHAGaZxluAZz7Z+pkfdmFPb+/0yfysUDOS0UmqbIP2/Iar?=
 =?us-ascii?Q?fUPvr/FXnN5q99nMOvnQP07Ocem9YVWy7JeLUo3uge1SOWwgAJH/aiR2lQgf?=
 =?us-ascii?Q?U06KZ90IUR+a6t4QskWt8ORTctJEZBs+ifhE/XLHqxtVvbLvHgXTkbRJA0+y?=
 =?us-ascii?Q?T2uP+rn5F6VJakvj5SNKKOu7yaFsjbGYoUrTJrbfbq74nqk1gr1KVr4KCmru?=
 =?us-ascii?Q?yjNu3QbnbMy8Zmp1Z75LPN1itJTsoCpBbgDgLxsQI9fHFUV7sCtxIYaiyPtG?=
 =?us-ascii?Q?aw4us8lvZUTbiGby+ewO9WNMRWpu7dFFCsnnGJokNc0mRvRWLzzby+hc6clq?=
 =?us-ascii?Q?CDfL9hVtAlsk5REcg6jJGsLFhIz9ZpSkAmnRvyMB2NlFyAefN2BwP+p3vkO9?=
 =?us-ascii?Q?waAoh8EOPfA+zQXQW4w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kf++b65LsGMK+yPhKbZRGOu0wi+uPAD2BqgBMJNSyOpbNW7/0Vxic1PWS/yK?=
 =?us-ascii?Q?LtBH7ZqBqwlguaJ4oO5uh7UiRGYgNp0dCiv/RIF4pPpvfCMrBILcnNQl0mmI?=
 =?us-ascii?Q?xiomTdSGKExykHftvJWrwKmdFeckvtgeyzmciQ7rOtS/VXGTszcCYGscNyJP?=
 =?us-ascii?Q?1QGSHfYMiB3WeMjQfnYlQweRrYmawnQvdxn5ggdKW389am4b5vsHUSKfo59B?=
 =?us-ascii?Q?mlEmlEIbM302JeTnfCKgUexqpFvZWHSxUSeLPOcH8p2fJvOyoeintqwx/Gps?=
 =?us-ascii?Q?O28FlBQCzhn/isKbZmFp8vQXMctn4WsVL7V4+LcqmGLmegVYkdEJPt4T34LG?=
 =?us-ascii?Q?paVSsk6LCHd0rRQMIos5H49WbcYcqdu9N433MgvcbfkuqAOLYwKfolgIVd73?=
 =?us-ascii?Q?4KNDjWT2t2wvKF7lPQcqn5FB++qVT+tt/Mopx5GQPalbXT8aIpz60LkWtlWG?=
 =?us-ascii?Q?vaH0V7UNqrMmYlWeOaGJ7uz5P5QaxFkoq5sFedSWx2qcM9mgVak0TTACuq5J?=
 =?us-ascii?Q?Y+/P4je4yjnWV5wP8jxCzvfXIrGgTTGW5Bx1d7kbTWarkUP6R0pnIx402bLZ?=
 =?us-ascii?Q?GccI8Fh98ngJRe/fat8nIFH3TYlcA5pPZxIk8qFpOK83WjTmJuF1saLXjjRb?=
 =?us-ascii?Q?1cGMCYUMX1V0HiIqRoyU/6VLG6A978SiZlhHBZEHvHOp+1BrDj1xhRvBH+fw?=
 =?us-ascii?Q?RdhuHzKw1bK1fcZi897nyOmOfCeiLsSjtoH+9BcruEwxYCB+FCQO6Fo6GY/v?=
 =?us-ascii?Q?e99Iguz+Z368zHWXhhRFQ9wf5PfMRKtsoihpyw+9tlKXYZEHu3ZinFXzSy21?=
 =?us-ascii?Q?T2Tcqnz5fNi3JCUOxvoS8DLvI8dZ5ga+vhUeZpgwgL2m3BI4idL1R+u65I2j?=
 =?us-ascii?Q?xEz051QxQQqXJKGtVS6QI7t1Z//rB7vYnQBAyhXndHsRXx6vtxY49DbG2KBb?=
 =?us-ascii?Q?mr9YOrMHhtCfdBIHuB4ylhNntU2y7u8uBPcnrPAAD7ilKEnX9T1cJnqCysCk?=
 =?us-ascii?Q?Buk6Snd1nT+0HrcY/lxK/1E0htgwaYEIbgVbo5ZQ1GVM8sGt8zjVNi3NzgFo?=
 =?us-ascii?Q?XOZKzHn3srBOK6CdLIcMLmj4OQ4QfZi1+n4en7U4F9at0VlFX6V4vas28fdh?=
 =?us-ascii?Q?uJ9vh4ItSFJsENSKyIjDR+nxSesm1+Pfon7Dl921BB4+y8zkWmVPCy9FnNfV?=
 =?us-ascii?Q?qQyLD9CNi1DfFAamOADMY7fb2EeWIKdkggugVg1PF1O9fWMYTazntag0BKox?=
 =?us-ascii?Q?+5t4Zs11N5nXiEbIycLQ4AgHFPO+MvKgrMLxon/DTgj0E0Xk55ngo0P2Tkoz?=
 =?us-ascii?Q?umZJSEwYCka4kyRNwdpFpPHWIK9xL+HOyjlzQi3PJgpUW7qpioUaXELBaLUY?=
 =?us-ascii?Q?Z1KcCld7u2JUmhGEpV5xevyF25Fpjl4uQh8EMPh9873XDZ9TVWviIwLrcMA8?=
 =?us-ascii?Q?cViecK4t3TGzxqJP8jQfliPsPah+OV8PDbtvr66+kawrYLC6FEp5DOPPrMDP?=
 =?us-ascii?Q?F45JjDe8Slok2ycWpfxUAKSospqgM7oB24MBJJP6WNkgn9KWeIdl1E45QAqT?=
 =?us-ascii?Q?0A04L3fN4vSDNNRBc6KT3CCxCtjU2/obx/wGMDlrPp6IkyJ/F2zjADJaqAwB?=
 =?us-ascii?Q?8KqnFtKd77AtNFai/qRE3Qmv+yuDrPdlwr/Whsfnp40Dd57wd58M2p7nrKcK?=
 =?us-ascii?Q?VptmDc0iO9MUoi0l9eF2wej/TJA1cKMCKEn3m8ehqDu2vzkIscFEdtiduRWN?=
 =?us-ascii?Q?gkMR9TIJ/Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb9bce0-d0fd-4434-76a1-08de65374064
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:51.3570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uCWJsWN/rqWgabctvF/+MDYrWUUwOL/Yg8Geg9ZIkmoSShm5pA1rRNPwZUbKSRTVnwag0miob97aIRcJJ0WYLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4215

Add the FSP (Firmware System Processor) module for Hopper/Blackwell GPUs.
These architectures use a simplified firmware boot sequence:

    FMC --> FSP --> GSP, with no SEC2 involvement.

This commit adds the ability to wait for FSP secure boot completion by
polling the I2CS thermal scratch register until FSP signals success.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs       | 184 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |   3 +-
 3 files changed, 186 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fsp.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
new file mode 100644
index 000000000000..77ec44daa58b
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+
+// TODO: remove this once the code is fully functional
+#![expect(dead_code)]
+
+//! FSP (Firmware System Processor) interface for Hopper/Blackwell GPUs.
+//!
+//! Hopper/Blackwell use a simplified firmware boot sequence: FMC --> FSP --> GSP.
+//! Unlike Turing/Ampere/Ada, there is NO SEC2 (Security Engine 2) usage.
+//! FSP handles secure boot directly using FMC firmware + Chain of Trust.
+
+use kernel::{
+    device,
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::Delta,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
+};
+
+use crate::regs::FSP_BOOT_COMPLETE_SUCCESS;
+
+/// FSP secure boot completion timeout in milliseconds.
+const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 4000;
+
+/// MCTP (Management Component Transport Protocol) header values for FSP communication.
+pub(crate) mod mctp {
+    pub(super) const HEADER_SOM: u32 = 1; // Start of Message
+    pub(super) const HEADER_EOM: u32 = 1; // End of Message
+    pub(super) const HEADER_SEID: u32 = 0; // Source Endpoint ID
+    pub(super) const HEADER_SEQ: u32 = 0; // Sequence number
+
+    pub(super) const MSG_TYPE_VENDOR_PCI: u32 = 0x7e;
+    pub(super) const VENDOR_ID_NV: u32 = 0x10de;
+    pub(super) const NVDM_TYPE_COT: u32 = 0x14;
+    pub(super) const NVDM_TYPE_FSP_RESPONSE: u32 = 0x15;
+}
+
+/// GSP FMC boot parameters structure.
+/// This is what FSP expects to receive for booting GSP-RM.
+/// GSP FMC initialization parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspFmcInitParams {
+    /// CC initialization "registry keys"
+    regkeys: u32,
+}
+
+// SAFETY: GspFmcInitParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspFmcInitParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspFmcInitParams {}
+
+/// GSP ACR (Authenticated Code RAM) boot parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspAcrBootGspRmParams {
+    /// Physical memory aperture through which gspRmDescPa is accessed
+    target: u32,
+    /// Size in bytes of the GSP-RM descriptor structure
+    gsp_rm_desc_size: u32,
+    /// Physical offset in the target aperture of the GSP-RM descriptor structure
+    gsp_rm_desc_offset: u64,
+    /// Physical offset in FB to set the start of the WPR containing GSP-RM
+    wpr_carveout_offset: u64,
+    /// Size in bytes of the WPR containing GSP-RM
+    wpr_carveout_size: u32,
+    /// Whether to boot GSP-RM or GSP-Proxy through ACR
+    b_is_gsp_rm_boot: u32,
+}
+
+// SAFETY: GspAcrBootGspRmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspAcrBootGspRmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspAcrBootGspRmParams {}
+
+/// GSP RM boot parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspRmParams {
+    /// Physical memory aperture through which bootArgsOffset is accessed
+    target: u32,
+    /// Physical offset in the memory aperture that will be passed to GSP-RM
+    boot_args_offset: u64,
+}
+
+// SAFETY: GspRmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspRmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspRmParams {}
+
+/// GSP SPDM (Security Protocol and Data Model) parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspSpdmParams {
+    /// Physical Memory Aperture through which all addresses are accessed
+    target: u32,
+    /// Physical offset in the memory aperture where SPDM payload buffer is stored
+    payload_buffer_offset: u64,
+    /// Size of the above payload buffer
+    payload_buffer_size: u32,
+}
+
+// SAFETY: GspSpdmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspSpdmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspSpdmParams {}
+
+/// GSP RM memory parameters for sysmem flush buffer address.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspRmMemParams {
+    /// Low 32 bits of sysmem flush buffer address
+    flush_sysmem_addr_val_lo: u32,
+    /// High 32 bits of sysmem flush buffer address
+    flush_sysmem_addr_val_hi: u32,
+}
+
+// SAFETY: GspRmMemParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspRmMemParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspRmMemParams {}
+
+/// Complete GSP FMC boot parameters structure.
+/// This is what FSP expects to receive - NOT a raw libos address!
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+pub(crate) struct GspFmcBootParams {
+    init_params: GspFmcInitParams,
+    boot_gsp_rm_params: GspAcrBootGspRmParams,
+    gsp_rm_params: GspRmParams,
+    gsp_spdm_params: GspSpdmParams,
+    gsp_rm_mem_params: GspRmMemParams,
+}
+
+// SAFETY: GspFmcBootParams is composed of C structs with only primitive types.
+unsafe impl AsBytes for GspFmcBootParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspFmcBootParams {}
+
+/// FSP interface for Hopper/Blackwell GPUs.
+pub(crate) struct Fsp;
+
+impl Fsp {
+    /// Wait for FSP secure boot completion.
+    ///
+    /// Polls the thermal scratch register until FSP signals boot completion
+    /// or timeout occurs.
+    pub(crate) fn wait_secure_boot(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        arch: crate::gpu::Architecture,
+    ) -> Result<()> {
+        let timeout = Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS);
+
+        read_poll_timeout(
+            || crate::regs::read_fsp_boot_complete_status(bar, arch),
+            |&status| {
+                dev_dbg!(
+                    dev,
+                    "FSP I2CS scratch register status: {:#x} (expected: {:#x})\n",
+                    status,
+                    FSP_BOOT_COMPLETE_SUCCESS
+                );
+                status == FSP_BOOT_COMPLETE_SUCCESS
+            },
+            Delta::ZERO,
+            timeout,
+        )
+        .map_err(|_| {
+            let final_status =
+                crate::regs::read_fsp_boot_complete_status(bar, arch).unwrap_or(0xDEADBEEF);
+            dev_err!(
+                dev,
+                "FSP secure boot completion timeout - final status: {:#x}\n",
+                final_status
+            );
+            ETIMEDOUT
+        })
+        .map(|_| ())
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..af6f562779d6 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -10,6 +10,7 @@
 mod falcon;
 mod fb;
 mod firmware;
+mod fsp;
 mod gfw;
 mod gpu;
 mod gsp;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 861dbde5a0ac..2d0f9b3dc9b8 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -8,6 +8,7 @@
 pub(crate) mod macros;
 
 use kernel::{
+    io::Io,
     prelude::*,
     time, //
 };
@@ -475,11 +476,9 @@ pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result<usize>
 }
 
 /// FSP writes this value to indicate successful boot completion.
-#[expect(unused)]
 pub(crate) const FSP_BOOT_COMPLETE_SUCCESS: u32 = 0xff;
 
 // Helper function to read FSP boot completion status from the correct register
-#[expect(unused)]
 pub(crate) fn read_fsp_boot_complete_status(
     bar: &crate::driver::Bar0,
     arch: Architecture,
-- 
2.53.0

