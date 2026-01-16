Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011007.outbound.protection.outlook.com [52.101.52.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44CE2FE05B
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 21:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768600237; cv=fail; b=j6sEIYg7+pZh8tqFP1Ie3ODOg3o9ds2FnBbwl4+CFGrySkGU8CJ6OqrRvOZD+IWrugey6YHuvawpyrdyjf/EzO8ZfU9EfhMSE0yjimfVKjh5LMdB2IxxMS3KYeFL2/esv/OjfU5Qp0tsKQvj8p2LT+rNI4+UCc5omBpLQWyaxS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768600237; c=relaxed/simple;
	bh=tDQLR1XA/QwxpKxSECfymHVCiY7LeNUq/WKBiEJMKVo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TeRHcjG/xp78bOdp6Degkhky3BbKgGvl8w76KGfGWIdbyvoaPDczd2o9WC57/HOjoqmEnm0MSKfOemh1BviWtXjh1fkhsc/YpuHE5m75o8/RH9Bq+/IF6eKTq9yW/hYmjJOHXqcS+DQOQE9SJfUd7Aot87iEAmVF2qOP7NC62xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hlZ47gGK; arc=fail smtp.client-ip=52.101.52.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hlZ47gGK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTRLm3LgZnhx6uMSZi0mJlokwWmPO6E2EhzYkayGLhCJX4g/rMxHCoR63YHCvUKGDAJ26mcNtDUV3XXhxpMxTu7yjJM6F2+o6cqc5ugUwiglGBKd+/YvYaFZl7oRZ8F0qnxli/wm/4mywDDjPKzY3BXBRF7VGBCe0f4DFhT/3keDRctqPqar9XdxhX5dl8fWx4Axe5GtEOMDz6pLLnyb5K6h+a3VWdD2Qlih2lXpRqZ6TnRf2p5Gu1/9mwkQ8ycaPfL7TSSlZv8Q0/7NWA0GP4aVyYoONNASeD8YqarH8ToZ5EME5h/lLViBQBTpOp3SEy+fU9cDWAEgEUespYlnLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDGvjUDREhdRbAJMfXNnexB4zCIvIb/OemXKATZpUJc=;
 b=JOzMbKwggPZl14TmWTfRLlBBAxuykLlSkI6EgioGQjpnvuqz/7GR9FLC/3imvlkUiRTm6cgs12umDfyO9ukUh34zw14MJZkgwjlF1tMnuF1zM9zLZfcE0/Mms6KnEkrRphz7TVFJvj+v5qzEjz/zsjeIHXQiwguneWzK4zQkNKFWdFtuASKMAqFS3Y6DEInEXrmeN7zRRJ3kvt0r8ntwmGSwHiaCMr8HGb/DAaOSBWow8EIqdT2cliT1NBQ+KbMVf3U8kT9lxnYPAkIC/VNW6WrGyimeVo4XduXgIiIWeGK1VFoidCwoZuQgcbFwXR8qH+xzNJjpNRTUbV2iKpRwUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDGvjUDREhdRbAJMfXNnexB4zCIvIb/OemXKATZpUJc=;
 b=hlZ47gGKainGC7auAzJnqBot7yHI4DxNjeTv5jcCFy7anvlgMoL+HXlfNmObvWW4RZ9St3DZhRNq6KFPSQhNpIvM9mDu5/dTR80Fi39bRFMQT88Nnmb5Mc8Yyqkc0dvneuqCHI5EKXO7QTh7Hc2BX9+mfiAZ5uhaDAsVft3PFOeb/dSF5NkK7tyE6BdkfnMXA+s2lUJ+1dnN+6avNjLzp11DeMNKCA/uriYa+zaJn7GjZ288LDoRRktXojFPQ7tvnspt1hSxw0jL3EKvIVrmSHiwQMYFMSH/zdo1STC0vQTPlSbOTJ8Xou0Tbxij0VUKKSKxfCtaCEZE7DKaXILk8Q==
Received: from CH0PR04CA0101.namprd04.prod.outlook.com (2603:10b6:610:75::16)
 by BN3PR12MB9595.namprd12.prod.outlook.com (2603:10b6:408:2cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 21:50:32 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::ac) by CH0PR04CA0101.outlook.office365.com
 (2603:10b6:610:75::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 21:50:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 21:50:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:13 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 13:50:13 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Matthew Maurer <mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 1/8] rust: pci: add device name method
Date: Fri, 16 Jan 2026 15:49:52 -0600
Message-ID: <20260116214959.641032-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116214959.641032-1-ttabi@nvidia.com>
References: <20260116214959.641032-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|BN3PR12MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d3fc82-431d-40ed-f0d9-08de554945b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vIp6Lv0OpiVZ+usasSTpFDTOwd/1EYqluSYuFDewBy8DIzGO+8Vf1bdCKI5V?=
 =?us-ascii?Q?MjwC1E3kJ8m0HOVqEjjk1x9BAvMFb/vgoBAH6C/J36INxOWtzH8IBsG7bYJk?=
 =?us-ascii?Q?4w15u7w4VOi4Hl2yBoEKVL9REUWI8F89RzidRkOOrA0StEkX1aJQz8CVfgmv?=
 =?us-ascii?Q?guEft45R1jALU4TlOfDqLQOO3OPvgoY/43s4Bw8S0rv/YDMgjM6OIG4qMfW4?=
 =?us-ascii?Q?ZU3pIl9y295b3sGbeveXB97Oo3V0AlWF2dtzOknqs9QfzxW7G5YiHWF9uAcF?=
 =?us-ascii?Q?khjmw6gfNPeidsORoSGwND55ZxCUkh56Mymy+1p7lVZnHLuVvxKQYs+PZvFn?=
 =?us-ascii?Q?5HGn6bJSkfCeloSMZxXnPn0utcesLvw4Zuz430wLMY7ejnYZYJlCzlY1BttK?=
 =?us-ascii?Q?rr+JDxfFPrHp7Jdbptbfs6xBbJo9n+FtLcw+9YAKqjML+D64c1C5Efl2bii8?=
 =?us-ascii?Q?OynYdvLhWQRS8n+k2umeaIAKO5G5AGdmKST9Srx4NS9ZZLLoqVsWN/tmL4tZ?=
 =?us-ascii?Q?jz1h78Z7KHS+Y9eyWJeuCRSqxWzi5tM1kmfD9Ik9FN/0Z35OpvWUi2sxaPWA?=
 =?us-ascii?Q?UBvLZl6cZd16ndzgafv3t0a6IYOWfeRfigCiEII59snKq2tLxUzlrZnzIczS?=
 =?us-ascii?Q?Fd1SLD0F3ZOglGoCYSRQpCNLlLXrVqkX5nt0sRd5vbewmwuGX6vSrm+nzOSb?=
 =?us-ascii?Q?hOccyRjxbUb9gWbzkv0s8Vsg7esBzC18m9WOvm2Chp9OHkQQxptKQF3QCqM0?=
 =?us-ascii?Q?uw+1cTdJlTf8oUXmAiuNbrJdxajT4A7qU9JGVEAxJggEAy2bcEigGoR0cZYs?=
 =?us-ascii?Q?CU7ZYCXNqBy0HkLjXf4++H4N07LXidCovSP4Ro4Fq5AvatNuPv2cLjsBhXiB?=
 =?us-ascii?Q?TV9+/HQ3o70vFmeYkonEWZx57XgFL++tHx/EjpHuVbDCKKAm26FH8OZvL3U8?=
 =?us-ascii?Q?mOLFdsqCHv1HIT3XCto5uC55Vzuv0aIbwUo4Lkx96vWBzNUZfdLg1MqlAzlv?=
 =?us-ascii?Q?sk7S5kGdbw3UNLQHqfBtQHbwyQpDgIywxztm5ydGvAwDeuLDdHrvKf2be0Le?=
 =?us-ascii?Q?imeBH6Cd86dKgY85lOtuOpNa86OuJ0Ko5VBndMsNH692gKKXqVmrV+arQXkL?=
 =?us-ascii?Q?/htnHwZSOQK4rOHTcnkjwKBSWEVgdCUSEOl9lBa2rh06mk1UOolkxJ2SKioE?=
 =?us-ascii?Q?ndVf9omKIHx+YKpYVLzGHyhhTJoFezU4TTgb5UgXwTSWye3u5mGIH9M2NhKE?=
 =?us-ascii?Q?xOySeqQx6yU3Fm6z74YehzduE3zVXap5DezHATG0m1WNIfvkctmt6q4M4qyX?=
 =?us-ascii?Q?VvPvCfwy1VqITzggtx2sNZrDGL7YZrhVbC0uUcgbVDhdrxjy8ro2XUgyLXn/?=
 =?us-ascii?Q?WOARkMJiSFF5a9ndzmEus/d96Eo6KGkuHpRlMRy9RtOz2YUNH2EyBvSdzc7M?=
 =?us-ascii?Q?GS+ioEUfaLffrYTHPanswzQccEmhCbgTIzdEXKysNKBKh6YwGEuAFemaHjyO?=
 =?us-ascii?Q?cUsiO6YHdTIEE1zvNI16mhDWyLbLsivXANFYKmXmN6CsIaOzBor8514ZL6N3?=
 =?us-ascii?Q?X/+QWOpbOEOQNMBlXnIGmGvgY5pFNdj1dUDoUHOE5+K+cbjvIEqB16Yv/0QT?=
 =?us-ascii?Q?rR8KMHJ1jFARW4iEyj7o9phTYRzpRR8V47se1A4lvrsFH/Xw7n9/P5qAHUlp?=
 =?us-ascii?Q?mpPmIQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:50:32.2008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d3fc82-431d-40ed-f0d9-08de554945b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9595

Add a name() method to the `Device` type, which returns a CStr that
contains the device name, typically the BDF address for PCI devices.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/helpers/device.c |  5 +++++
 rust/kernel/device.rs | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/rust/helpers/device.c b/rust/helpers/device.c
index 9a4316bafedf..4609b62f6a06 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -25,3 +25,8 @@ void rust_helper_dev_set_drvdata(struct device *dev, void *data)
 {
 	dev_set_drvdata(dev, data);
 }
+
+const char *rust_helper_dev_name(const struct device *dev)
+{
+	return dev_name(dev);
+}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index c79be2e2bfe3..636c522a8374 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -483,6 +483,22 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
         // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
         Some(unsafe { &*fwnode_handle.cast() })
     }
+
+    /// Returns the name of the device.
+    ///
+    /// This is the kobject name of the device, or its initial name if the kobject is not yet
+    /// available.
+    ///
+    /// For PCI devices, the name in the format "DDDD:BB:DD.F" where:
+    /// - DDDD is the PCI domain (4 hex digits)
+    /// - BB is the bus number (2 hex digits)
+    /// - DD is the device number (2 hex digits)
+    /// - F is the function number (1 hex digit)
+    pub fn name(&self) -> &CStr {
+        // SAFETY: By its type invariant `self.as_raw()` is a valid pointer to a `struct device`.
+        // The returned string is valid for the lifetime of the device.
+        unsafe { CStr::from_char_ptr(bindings::dev_name(self.as_raw())) }
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.52.0

