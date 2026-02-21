Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CF73321A6;
	Sat, 21 Feb 2026 02:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639874; cv=fail; b=cASAmRjSphx5AdKvACvGiLxq2aKtkdp/dAVIku8OU2wfJrQ4L7WEinUq6QyaWegCsotNz0AWQNXyX2QWupGUSTO0hmLcHoaarabJTBE7tZs0uVKOFXqxSxQN2EdKZ36TJ2suwbltjCIybvuTI/MmXaBMWBWQyOss95qWtW2YC20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639874; c=relaxed/simple;
	bh=97njuFxrYjeXPycqlr800KK9Y48zgmQo5u/q4RH5yzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OHmwKcaCW9DTG8tqiBjFH9UX3nGBCR01f+uiriWxSGMTR3hksnnmyQQWaoNfmSFw/7n/rADQvsagJLzYAc24A+zJvO3kijs+8ITGweHoVHiaqSrcPXs2LKrr3owRga8CgHkjUh6HoVZPaeK7yK0wXLc3+ln65vjccFlrw9IPLZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BbyyjUCr; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BbyyjUCr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m3fdFvcS+QiN9j/46GAdvbtJMzz8gXSxNGpoiRiflcWopdT+L/kPP1Ys5ZNC1sUWq9DPfDs2IrHth+8JFqjByHl/oyXArpJllr/D75FtBr/P5SxZ4YUUG3ZvmZGT6+6+rU4JqJSBYunaTp1G1nyOuAEZ///BCtQWsxJYlCx4lt8G5tp1BqSefJWpONgCnYFBG4fNWrEB6TXWaF04p2/cUlv0k2ZGc3F+pgCLJa/DvybJJaZoOrImVGFVze0shMFpv8eaQFvmD6Yj9/flmgAyOz0i13xZCOTATrEBewMQfox3gI1AzULDTqG2L3Sy9ealcJqBvUM2d6fmnT4rFrRdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOUSLABF27Y9lwvmzx1QOKVDvWBmFY37Y+DmDVCqAJo=;
 b=SgtUoXxhQz4tn+F9fwcdZJ4xMvE2MeEKteTlm1a9iJaqGkdha+yYsLAuUkRX2mVV1YDFeza/7+qRXOrwh9NVcDZL8bZ6mE890MlKGJ7l1FTJdVSK/MDMinrcwaIzF0+47WPdeCwNSkPCyyU64RLAUr+X3yV5XfevIX0QDJCP6d1DUEYlqLj4u+2ihXmrdz/2eq9mFBaBBXLTD12gdsIEDEFyEaK/cw9tYfW6DfbSkmYrn/UuyTDsucchDkojGlGF8JnbymoRHklD6dmGRaPLxEHwF++sQ0D3YhQkLGzOXRLxwrC2X9sFg1sFmg1l3kLCownKu408RsbuPbOxwinrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOUSLABF27Y9lwvmzx1QOKVDvWBmFY37Y+DmDVCqAJo=;
 b=BbyyjUCrhrsslVIHnbheU5ZxnE9BbASig1drontR2NS3ON959Bq4Bb3Bo3M10jT0quK69lUbgwmzk0+LNF7ecb14qQJOU7vzZHf82MMasjHhco3ulvi25/A0/HWPkUsPJE5VufHtGEfUx18ElsMNzNMIm55uUdIa4GwxY/cCWmyIp8jmeDY/AXkprIwnYWkjIommWPO8NkFnOTYRQFxlGgTRnpRT8RntYyoRF9a0RZnG943PzlgLbEUdNov3102PKgeTtM9ujBytLxXG1LcbgAxf74v3XBl/NQSXxZq86Kwz2XfsnWMHIxDKihuUzicqgdnrBdE/oKGKf+gii++JLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:23 +0000
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
Subject: [PATCH v5 24/38] gpu: nova-core: Hopper/Blackwell: add FSP secure boot completion waiting
Date: Fri, 20 Feb 2026 18:09:38 -0800
Message-ID: <20260221020952.412352-25-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 994850cd-af3e-4a33-4814-08de70ee5f55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0oXit/ABlGQEq3rBhRFAiayXLEjeYM3xu5agcX+yMx4XOhulMu3/HSKTtTCR?=
 =?us-ascii?Q?xlWdavfk1UuJ/WDc2eVtHKgIu+s2yu6krv+ZFr9ui54vgDBPivqjhij+ZuX0?=
 =?us-ascii?Q?vOktybhEYmZLGf6ToFy5H5pnS5olZCi7SKpBdoYN7mKoHnWHsqacgOSYE5VK?=
 =?us-ascii?Q?YA7HD9x1ow7BePMZyokDS0A9tkziz0wLpEGDwrOe3JNyKYygP2AZGMVT7gFJ?=
 =?us-ascii?Q?xLS9J04Z3hY4lhrH9kDwuAL1zKHACxzwW06D6K0MZ+6o02N6K718tPN+QzSo?=
 =?us-ascii?Q?175PlRDhB7sHTvI25Ey4XjJKan/PXxa/lWXcV6Kyezy0r5KYFW98v+Ka3KQc?=
 =?us-ascii?Q?dIMJd0vYAcXTE1FLsTjZ3m/a5xIugDiHcoc0RJFILaJp0c4eCwsKvPEL+7Gf?=
 =?us-ascii?Q?5D0u2p19yIIbm2UOaDGAvA5d9V5UhS4iA2hjO+bFtF9SR5VWl1oqmuByW+lD?=
 =?us-ascii?Q?vM+tMdCBSqwpFfaq0Us76S3IwFnygYroPl5Olp6hmPtz5xjueOQAAuYbL+Z9?=
 =?us-ascii?Q?SvSdxlOKvqqetnYPObhryp1yyzBolK2QCT/OD7K63FrIrGKfgVtpJ4G5uJD/?=
 =?us-ascii?Q?0czcSQqfXOmgmz+9Jleqgt41OMmUZHFQIIUwXNoYHNBjoNa72UD3OOYfWxFe?=
 =?us-ascii?Q?Pxw0qHfJ7oyUGxLnMhDmPY6UyHekJH32pBOVt9BOpAAqoYpwdM72OEtoUQI5?=
 =?us-ascii?Q?AlgzyH+lE7X5+f6rjCa+Bvp07D+TC+3eqbOYf0YskV3zPxOx2AgFRxVIr428?=
 =?us-ascii?Q?3fPF/K0WnnloWpDFHDu6kxyrr7ZIsL6cuKonXQn6nXD9vRzKPnphNjp0BMED?=
 =?us-ascii?Q?GdFW5eAeFV975MmEQmnS5jagCY79up2GVUsQvexlidPop5qzBuZQxyaKYZjw?=
 =?us-ascii?Q?JERa/DHezfEnNq5AucoYoPYlFGXS6lDkNzUi5/b0pybDZDOVn5sKicU7WBUb?=
 =?us-ascii?Q?6zvsuvqHnWRfMvRp7+oR0W2W7rl/AixcYcTwthwPcHu8g2z1TK4kJUtyFls8?=
 =?us-ascii?Q?7umAKTqJN/4pmFMEwgiT1bdPWJWc33dpWh3EcjJ27Nq/n5Z2poIupjKNCR8n?=
 =?us-ascii?Q?KYJlv/uG9pf6/Tpqj9kq3IaKTfEuYrqc+NVBFWyQHjnVPW5oDLBftru6gF7+?=
 =?us-ascii?Q?vbGWgyDg7ZPYxVJuPB8PnzbKmVY2oTxGn7pWVQcVnPWiKSRw7s8PU9gogcOe?=
 =?us-ascii?Q?KIrKy5gO+eMtLUJxnUEvfS7XyrCJ/mdsY5/9/KANaqVxcDHXItGASmLN73f+?=
 =?us-ascii?Q?uuKeSnix2DuyJ9naTTP3gR74GACUmJvicD9CM+vagj/6nWQ8dD7rqbdk9i6J?=
 =?us-ascii?Q?+2utBI0GY/2t0c8nn2eEQOCuNs3H4NYpSEY2s7XG+GS1rqNQloT8koNBFu5+?=
 =?us-ascii?Q?zuyQOUyKHMvzRKk47xHpDrLxerf10vpwXVrGg6nprxQ/3qFj83CRinrIC0Kp?=
 =?us-ascii?Q?ZBp2dJWKK+Zw4+ovzf39fVG+ZfGLOws1DdcuRwdj3hyQAFu5iRqiYtOt33mY?=
 =?us-ascii?Q?UNs4knLc0DYRfzOybCci4TWpFpaLr3/59oZTE7MaDXeLAvRqp0cp90RPTBki?=
 =?us-ascii?Q?K1eYVniaDTM7ATOO2oU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+hnjhFZoO9Zs0dWKsgw3kQZ0pqMIf/FG/41OqXf6QnxYMENqX5siitRoICr3?=
 =?us-ascii?Q?90SQZs9YuGJ9x5BkzELd8Bv96jJwckxr7Va/FpzL/AybKJyeNtFyOW69rhmo?=
 =?us-ascii?Q?q92GmXuPG0cE91HQP0e3M1pRJTOawVJmPiOStsy2ezm6POZwxULw8yvtSBfm?=
 =?us-ascii?Q?tTK8xXTE9ELdOlBDgqBw8puTwBrnoo+WsHRTG/4IHDjQg6HAZK+EAYo+omol?=
 =?us-ascii?Q?6DBKDUem/e8VrkhLw5OSz1XAwDNjzj6mlvWSiIMaxoR7VtT7EH70i9tFUbZ/?=
 =?us-ascii?Q?6ampaO7QpkcCXOYJ/WN5TJqn+ti+onxTXHV2Hv2wPvdtZyvVj02/G+vmLqW/?=
 =?us-ascii?Q?TT57rMxpJ93zm/b5f5loSS5wnawcxha4TLTFRJf+6ZrTG+XdsUnicOuRezYA?=
 =?us-ascii?Q?QlkDnxxGsxCozhqOe06rNLJ4nbnbznh2NOMkZEKeS4LFzbtjKVIK16KWqk82?=
 =?us-ascii?Q?3nJ4YuOnArmtKKeZLtPQmm04npZR7jhAFA9f/Of8iODs+Qyu9VOi2tze/72l?=
 =?us-ascii?Q?2xMLHDFav3LqP69VNVJyb7FAkaNoc0b1t/D0Aiw0qbZ3gdCe8NdkW3cS+R/C?=
 =?us-ascii?Q?orT2INr1flkg6DeYW6LcqiQXKzLf21P7zhOBBFbf+2C5tIudgZeTg2uUMJYc?=
 =?us-ascii?Q?ap3RyOs6yQHjpE1PVpU1KsE6a1tgh6RqOiqpzj+ZO8YzLXDJNyHVPhuvjLb1?=
 =?us-ascii?Q?HJE7u3LBYCB9/XgGNF/uRH4FTjIz2/A3DYVHmxmPSB1qRBk15w6v6FjluOQ4?=
 =?us-ascii?Q?T/l7vyyaeclUq/EdC6C71eRieJeUDSdC4S/Ag1HpsabuTDnQry3pAEY1NJEY?=
 =?us-ascii?Q?VR3V/fTX8RzafnJOJsLsciNRm51XBwKd9fS33kZtNYAQEN6jnZs4yyPrBpoA?=
 =?us-ascii?Q?oC6G/23idx2P9hxykVf1mblKzTOAGRZJaBtrQbgVRoQKr8IahbkT9E9dbRal?=
 =?us-ascii?Q?naDMX0nhfCA9fQ1fVuXlTxd23UwNS7urYbkzUvVxPjdralFc4zBRnV4TFRXV?=
 =?us-ascii?Q?VOu9Sfv2EB3H5/ykG2vQytth7s79Omt1A44ZzlczgpE++PmknjLoxsXXbaVG?=
 =?us-ascii?Q?2xyqNrl2Qiswp0kHLnCkcw0KEnHQtGaWXS0HnC4h6AF9RRWr43HgESThNsr5?=
 =?us-ascii?Q?wVnJvRxDVH4VBIXx9poWUYtMUqodVHCxE8OYGcbe8qXz7D/BsQWHj0hVmVbG?=
 =?us-ascii?Q?5KbNneVQqRaQJMAyQjvTDJjzEpmiaB+WeNi8VBBEz8VRPvnNQkO0boUsa+V+?=
 =?us-ascii?Q?FXDsJXhnrKTUCSwryjbtDHZFjq3+T1yh0+zPNdlOp+WMt1c+smoEnThRY6Nu?=
 =?us-ascii?Q?6nPgvQiEcYPDf4TGZiBL965z/IBOyYR+wvCd91TTfN80/Uzbq6Uf/SMqHrjZ?=
 =?us-ascii?Q?qiPkbRrtx38GIzhQK99ttxSen80uBosvGMk6PgtIRXqtcsy+fpqubBq5RCB5?=
 =?us-ascii?Q?PTSuoKHvpkeigvicLMedugHpcUStpUA6FBQ3MbEtZrEtTNlMA8Ns4oy1NcjW?=
 =?us-ascii?Q?yLFMA2iNSYgwuzlYIjwzwlkmDZhxA5bJRIFWL4cNp6BbR77MLvhMFSQC6Va/?=
 =?us-ascii?Q?mmR7I3a8vIwIBcNnQyMxn/ratCbndQ8qy72Bf1aoo4P5mygFOQ6f82g+ss8q?=
 =?us-ascii?Q?WZmqORC/Hv6paX2nZMVmo2BoPblUilgGOT5Hti4BrqSrLuaFE6a0hKZp87/p?=
 =?us-ascii?Q?oXHgBHeZJHv9QtPaCpwSHYBQEm8IU8RdIBgnsDy7xe8LvOGgQ671d7vT9YRL?=
 =?us-ascii?Q?1xSfxx2ZMQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994850cd-af3e-4a33-4814-08de70ee5f55
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:23.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOLVkqnrtgah1L/JGdiUXPLpzrIvlgyA00vEDugqzq/VY5IxLduINEa6XpnQNa8qI0bmYFSE0XZ/Oofj7YFptA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add the FSP (Firmware System Processor) module for Hopper/Blackwell GPUs.
These architectures use a simplified firmware boot sequence:

    FMC --> FSP --> GSP, with no SEC2 involvement.

This commit adds the ability to wait for FSP secure boot completion by
polling the I2CS thermal scratch register until FSP signals success.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs       | 141 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |  12 +--
 3 files changed, 148 insertions(+), 6 deletions(-)
 create mode 100644 drivers/gpu/nova-core/fsp.rs

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
new file mode 100644
index 000000000000..d464ad325881
--- /dev/null
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
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
+use crate::regs;
+
+/// FSP secure boot completion timeout in milliseconds.
+const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 4000;
+
+/// GSP FMC initialization parameters.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+struct GspFmcInitParams {
+    /// CC initialization "registry keys".
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
+    /// Physical memory aperture through which gspRmDescPa is accessed.
+    target: u32,
+    /// Size in bytes of the GSP-RM descriptor structure.
+    gsp_rm_desc_size: u32,
+    /// Physical offset in the target aperture of the GSP-RM descriptor structure.
+    gsp_rm_desc_offset: u64,
+    /// Physical offset in FB to set the start of the WPR containing GSP-RM.
+    wpr_carveout_offset: u64,
+    /// Size in bytes of the WPR containing GSP-RM.
+    wpr_carveout_size: u32,
+    /// Whether to boot GSP-RM or GSP-Proxy through ACR.
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
+    /// Physical memory aperture through which bootArgsOffset is accessed.
+    target: u32,
+    /// Physical offset in the memory aperture that will be passed to GSP-RM.
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
+    /// Physical memory aperture through which all addresses are accessed.
+    target: u32,
+    /// Physical offset in the memory aperture where SPDM payload buffer is stored.
+    payload_buffer_offset: u64,
+    /// Size of the above payload buffer.
+    payload_buffer_size: u32,
+}
+
+// SAFETY: GspSpdmParams is a simple C struct with only primitive types.
+unsafe impl AsBytes for GspSpdmParams {}
+// SAFETY: All bit patterns are valid for the primitive fields.
+unsafe impl FromBytes for GspSpdmParams {}
+
+/// Complete GSP FMC boot parameters passed to FSP.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+pub(crate) struct GspFmcBootParams {
+    init_params: GspFmcInitParams,
+    boot_gsp_rm_params: GspAcrBootGspRmParams,
+    gsp_rm_params: GspRmParams,
+    gsp_spdm_params: GspSpdmParams,
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
+    #[expect(dead_code)]
+    pub(crate) fn wait_secure_boot(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        arch: crate::gpu::Architecture,
+    ) -> Result {
+        debug_assert!(
+            regs::read_fsp_boot_complete_status(bar, arch).is_some(),
+            "wait_secure_boot called on non-FSP architecture"
+        );
+
+        let timeout = Delta::from_millis(FSP_SECURE_BOOT_TIMEOUT_MS);
+
+        read_poll_timeout(
+            || regs::read_fsp_boot_complete_status(bar, arch).ok_or(ENOTSUPP),
+            |&status| status == regs::FSP_BOOT_COMPLETE_SUCCESS,
+            Delta::from_millis(10),
+            timeout,
+        )
+        .map_err(|_| {
+            dev_err!(dev, "FSP secure boot completion timeout\n");
+            ETIMEDOUT
+        })
+        .map(|_| ())
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 7350c2069bcc..3b2109ebe9b6 100644
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
index 35639ea32e55..77d590887ee7 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -478,17 +478,17 @@ pub(crate) fn fsp_thermal_scratch_reg_addr(arch: Architecture) -> Result<usize>
 }
 
 /// FSP writes this value to indicate successful boot completion.
-#[expect(unused)]
 pub(crate) const FSP_BOOT_COMPLETE_SUCCESS: u32 = 0xff;
 
-// Helper function to read FSP boot completion status from the correct register
-#[expect(unused)]
+/// Read FSP boot completion status from the architecture-specific thermal scratch register.
+///
+/// Returns `None` if the architecture does not have an FSP.
 pub(crate) fn read_fsp_boot_complete_status(
     bar: &crate::driver::Bar0,
     arch: Architecture,
-) -> Result<u32> {
-    let addr = fsp_thermal_scratch_reg_addr(arch)?;
-    Ok(bar.read32(addr))
+) -> Option<u32> {
+    let addr = fsp_thermal_scratch_reg_addr(arch).ok()?;
+    Some(bar.read32(addr))
 }
 
 // The modules below provide registers that are not identical on all supported chips. They should
-- 
2.53.0

