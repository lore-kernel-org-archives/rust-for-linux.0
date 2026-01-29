Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D23563EF
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 02:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769653751; cv=fail; b=uSb5Qwu8mcKqt0MQh5fDkAGDh5//T37qz9b0ooNzxMNzCG3fIhvwE3aclwlHPYlzQT+EqAVwMsyWWQnHSed7nC+es9CBeStUaHde/bnEPU6aEnaqbpL+4HJh62vBz2axGj0tmdmvixPkib5bwuMK0QczEDlBgidoqTOzfXqVK3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769653751; c=relaxed/simple;
	bh=S0SpwsaZ0C4G+t1kB+JaH+A9tL+ahqCuEtc4YlJBY7M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i2AYL5JFmQ37ssYtorfA2p2o0jlUByifIUFiOA09tq6uJJ0gTqKiHBNZ4/91hwwwtIMF3mN1iKjcDPyRSstmgPYrU6vb3WeMOd5VOUaNCTplFetZnLpR7k/fxKx2OHnZufCBBANtoMBO25HS9DdBtOR66RGkU0aqZuh/sanS974=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cVU14QmA; arc=fail smtp.client-ip=52.101.56.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cVU14QmA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggW4vcMVNPT0D9rQuind30xwRntXsnynl9zp8ekuNQ0fshjWqlbfFL41qP70r++Gi32XsQLYnXmIzJmHbodx1aUGwiLhuA0wejjO7Cv+uvT9krTIvQcQLVO2KyaDQYkQEExSUkmkGNkgda2eqPxMZ5833/x/V75RvFsUz60ALIWYqar45XbgQx9Ss5983jmWM6e4maorIHHAyTzcIpEqH8fjsCqJYLHTMPj6I2DPqwG3/svHL+DGRYDd2t7uxgiLHaNeNM3YGQ731Evv4v0gg5E8UIRbhW7+/o2NtZu134bLwgTBiH7h7fdtcd/m7by1KDBUCyGZ7ZqlJeRMkJHzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bdtngLbZO09LGUqWTsozwdgXwqaQpbEN2nfOOe4tLBw=;
 b=lJqtaROZUdf8O2oaIHWJ2VrmqeYjbAi1fzbDBz4LKv1tTcPhFn516CVCXizicPxTsOufU+UYSA38OpaRt8tjSLzvhYYrSdwroiBB5B5RyOynvtifg4k2SmpA5pv7RqT6oXXHwDCm5lGdB+uMfYZwVN+dtjH5v4S9MxtAlsxwM9QfG8JGZn9ORtNBmI0tNd90CJOnnlxNn7B7q0cVsTuSngcxk9gqKfShlSp3bgso74609h3bmOOjFzwJWPpORUYigFsOc6VxryIw02fjFoNk4LN3NLKkvZ5ka3EAU+WedOgTtQJs4sQoTQKScOqdB0vV0aAQpMqc6beM8yhppp39YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdtngLbZO09LGUqWTsozwdgXwqaQpbEN2nfOOe4tLBw=;
 b=cVU14QmAo6ChVmoI3OoXbhQa/kShAqxkONzq982OBo1xm8bf9hxsBFD0dEnfrEMJIV6zXgyvINF8gQwEJGkwFCu0PxYfkJ0XysdIpmZVd5L4D4nY8Qwz17Hq44RF5Kkd4NGJ6JvviS5V5Qte9YrZJJj0O533xxD3jhbfJQhel1FpmvVqchVUUm1eZVVGqdBBkUVcIsrYn/WBUyTepNryfbAesmCBqwxAi/Q1dEm2+DNkhfr8+1C6MifXZiPoxLHtp/snA+0bzfza0YpZPYfnAkgrCCRO03u0QXzeHeHxCcbdTWXVURa7SfiQCwRDp7wLHwevAbZztf2jnVR0KfwcTQ==
Received: from SJ0PR03CA0044.namprd03.prod.outlook.com (2603:10b6:a03:33e::19)
 by SA3PR12MB9199.namprd12.prod.outlook.com (2603:10b6:806:398::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Thu, 29 Jan
 2026 02:29:05 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::f6) by SJ0PR03CA0044.outlook.office365.com
 (2603:10b6:a03:33e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 02:29:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 02:29:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:47 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 18:28:46 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	<mmaurer@google.com>, Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 1/7] rust: device: add device name method
Date: Wed, 28 Jan 2026 20:28:31 -0600
Message-ID: <20260129022837.4133832-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129022837.4133832-1-ttabi@nvidia.com>
References: <20260129022837.4133832-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|SA3PR12MB9199:EE_
X-MS-Office365-Filtering-Correlation-Id: 1912a7a2-f008-4b9a-f440-08de5ede2c8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?96bXWs6JYuXqmHomDqMQP5l+nyMPGtXFiyMJV4pLH1yrSStZCQ8kh8V+a03n?=
 =?us-ascii?Q?DmArNdFk6K08MCltk9123TolvwGpDV+TqiFZJb3iyhWxuWaL9+L28PT/3acM?=
 =?us-ascii?Q?BNOaYkJHr2XcF7xNGVH9vYPte380Vq44Xa2wu8WYnQdGZG42wLQwIBtpaMmQ?=
 =?us-ascii?Q?2voE/cYOiZiZLfIu5lLXso7bED9fRU2y0fetfVz+GM34arhZ8Gc/YPwG2rjA?=
 =?us-ascii?Q?ORZaOOOUg1mnO1g5CS0oP1h3CKZ4bzLbMYB7wqTEGZJ7P5RRw0tZx/p10F/U?=
 =?us-ascii?Q?gsefY+JqfDVZ17I4iUS9WlJXrzHy6yA9mdyIYbWiM4rB08eZG6LJCWTWTzbY?=
 =?us-ascii?Q?ts6BDSx0WlxYXt5oe3BJ8FxENtsbhFyV+hsTCTYG96cvXw/kxuow4slcICDr?=
 =?us-ascii?Q?hQnsOme3Rc3PuqD6wTz36YCHuj8R45JsX3HT3tJMKMGvs2rpk04VvMUecOHs?=
 =?us-ascii?Q?YZHtx/IZfc2T/LYE+DMs3TkGTE/P+OyKo9bACD3PkJbfXz0Xa8hnkl8lCJqO?=
 =?us-ascii?Q?5euFCmG/+yvK1MEvBCwrBj2jtZwV0fBbHlO5gHFioMSjib1v8toIehqD6I76?=
 =?us-ascii?Q?Wsw+7KbkUun7eYC2RULDXz7XCy/KeBraQ4GxtbxqJzm8Eflg96kEG3ZOJCbT?=
 =?us-ascii?Q?ZNAXm5LY3YiCCpcf3tcjWVoSn85hbe397rKyvNlt5ZklPxJMkss0SOV8mYyo?=
 =?us-ascii?Q?fYQ3M5jczw2pJw8rJKGmlRq+fO9g4sJgd4R6C1UmJ/P0aIHEZ2ySFv1VVfv+?=
 =?us-ascii?Q?VNGIlBFUi+W6IUYH5YNTJPfn9wD8kz+Kwlo4DdEF+S+ZrIeGvLwxq2gG03Di?=
 =?us-ascii?Q?wTbyqdgaE7IESub6qh3zPDlF4RgmnLGrgiYbVrLavfQ20KxExutmXtNDc1Up?=
 =?us-ascii?Q?ELKOBJW/KQ14xeXCAazmjCZOL8II/qScQIGY+Nb4T1SzEvLPJR07IpB2AcmV?=
 =?us-ascii?Q?nCDfFFlHd8yz4jdtRih1GPCIUD/+zRJLUJa7Oyyq4fuwhOVvn2mmkvBhb0Cj?=
 =?us-ascii?Q?YF3YGV6Ijc2jYYZeBDhIflGl/lydEP0HePsOCup51uYhey6vkJFMhgoUbQv9?=
 =?us-ascii?Q?sbn2fjjwpFk4lHpOMPrPN4mrGoEkBwf1se0wtX7fB8RQijN+7pyT0r3arD7i?=
 =?us-ascii?Q?kdiJKMWW+h1JpC9yddx6qLXffqUuW994NfEeg/WmXV2EzG2hT86QFNaayOz9?=
 =?us-ascii?Q?ck0yRHNgYhqksh0w++7vcZqG9MTosqxI4WFxXC2ywX29tMCanVbYIGfxVj8/?=
 =?us-ascii?Q?tPurJbisNOIBqBJP+WS/TQtG4ApuVOpdBx3Wi17KxKrGxwHIwz1Ezp1sNm2j?=
 =?us-ascii?Q?ZhLmMKLotp9imhztQmuJVOZy+q+I2sWZzoWIxAF7ODL+g2B0vGkO3EhytsxP?=
 =?us-ascii?Q?GD5D68304D4PFUXCaga8t2w0IZNqLH0ltinG3/Kcw5hEydWtXiuwxUsFe0dZ?=
 =?us-ascii?Q?hZarMJHki/xx9P2dTySX5aXXZY3U/qazZ1mWNroLRwPzQfsnFtZzV4mutZEx?=
 =?us-ascii?Q?xJll09yyUXED1SZvxdNvoqx02reyjyDUVb9YKdwlP/HUc8PrIIyaqxYssGdY?=
 =?us-ascii?Q?T0B8EMe91K/69l25wUu+S/3b/SCSwXS+6L3uc0Qn4AbV3/Z8vQTdsF/Rfaqo?=
 =?us-ascii?Q?caZLpyGjfVDCKX0oEsSzkQQF10uLCSAD4D1yIPSXAA95j+pSU9m4qZtJpDk8?=
 =?us-ascii?Q?zAeQ0w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 02:29:05.4950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1912a7a2-f008-4b9a-f440-08de5ede2c8c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9199

Add a name() method to the `Device` type, which returns a CStr that
contains the device name.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/helpers/device.c |  5 +++++
 rust/kernel/device.rs | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/rust/helpers/device.c b/rust/helpers/device.c
index 9a4316bafedf..ae02c199b11a 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -25,3 +25,8 @@ void rust_helper_dev_set_drvdata(struct device *dev, void *data)
 {
 	dev_set_drvdata(dev, data);
 }
+
+__rust_helper const char *rust_helper_dev_name(const struct device *dev)
+{
+	return dev_name(dev);
+}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 71b200df0f40..69665d275e24 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -482,6 +482,16 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
         // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
         Some(unsafe { &*fwnode_handle.cast() })
     }
+
+    /// Returns the name of the device.
+    ///
+    /// This is the kobject name of the device, or its initial name if the kobject is not yet
+    /// available.
+    pub fn name(&self) -> &CStr {
+        // SAFETY: By its type invariant `self.as_raw()` is a valid pointer to a `struct device`.
+        // The returned string is valid for the lifetime of the device.
+        unsafe { CStr::from_char_ptr(bindings::dev_name(self.as_raw())) }
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.52.0

