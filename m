Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010053.outbound.protection.outlook.com [40.93.198.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953F130EF7C
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 05:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773640689; cv=fail; b=bopG6Vk+5dAv9xT+Hv02BD9loKJ/4AVi95kNt6G4crFuc/q58xZ0nXrPtB1kOGLwqpazNCbeDSVf1GKEYJwMnn0LFEQZ6HRb4EoCBu5i97XR5uN7DLsHz7vXdf2lbSkWwu3/NAllQmmGaqxBhncmj97cl89hHuAgvE6EBWPEWIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773640689; c=relaxed/simple;
	bh=6ZBZN10R+51gqBXQ76EQ8RVCsC+KOXaNssjqdo0G+fw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EYdYsra1YrHrWdJVphZeqIpM+TD5CU3uCrbDj5hJYuFG5QATSPJcTI7Zn4cG7C4QV6+vJDlpANcu45jvrTksB9KKZCg8uO0Rm+2oXa4je9LGWa1XuqLbxeGV/0onOpmt1R9bK9BW5aibh1IDhqrEpMlgrvvP9RhB17FEPrOOfmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hZ2dv+R9; arc=fail smtp.client-ip=40.93.198.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hZ2dv+R9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/yGjqkRR1APbdQWeyqrEe42OohkUolpvtiL21s8DZ5nREflEhTDSuwVa/4k0nhkJpJSJUUuFjeWnxhoRk/uCCURwsLjEPP30aUtEuYGSPZvsRCY0r0E6Yx/hRbhdHhGUyD9Cgr1bOFd27saJ9+XD5neNYvbwSOke/RvZST4bJyuSYxVRcs94tMpXLfuHdQZcTDBFDiti8c3PLZE8PRVgf6iplPp2pTI38vaGfBcjz3lA6ugaWqw97uKigp6YD2gaz2wUulHUw9gYAawm5VqSxTWGcf+vK65v3lT5rGDegjfS0fjv4YtoRiIMGpELvgys9vHAU1wSJV3cqyfPX1gwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQjoQUE1CW4eHRTgi452xauj5JmBvV2CMesmmItVh9Y=;
 b=SeapqISN18JHOyqrIDEpWLMUxt/A1Xs5m7/9x4PCbWwm9zV7TscB5s209akpIe4qqPmEQdHHZ1AfBtrxdhoonvW2c3+qJhJedhNBvXXQdPAXWKdSdlLDcg3ms4LU0TjeWInMb3VQ4kUi3S3y6matObXBL/SA7WvMO/9L1W4ZTk/qWX4q1T99DBp8/m8otuQmMWlB4rOyUdbHzVLTBmz85E+PaESxPsH93t63SNzLby0MlWOHXOcSnAn+4zrnW2NLONlJ/YdyUtG+kwcIuYauJPasux2Yx/PRL+Xvaq0sN8rVZlbPaEcl2UbyEWaaXK2SJzHdBFE99wmSzPD1aDozcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQjoQUE1CW4eHRTgi452xauj5JmBvV2CMesmmItVh9Y=;
 b=hZ2dv+R9awh9xEi+AuCHnDi8YUZh6Yqdj4yvdsvZD/68VTyS7DFlba9CsAjcZbTZDk6H2hA6cwLVf2FxyAn4X2lpikAergVYd1bIlAEfndlaRpXSkLttyNxzpuK7KRnz5UkXut+aTEnK7yKh+NH8MjPzODXhV/GtAZ9WzCVPIycVURymk4ZyaCm61rBu2lg5pC+E22w3eEK+Cuh8IE7qSQAGzbW2lfbuhHUjQF5emvZRv7hi+pFOXvnu9FkKSzN6ubLVKSftT93OaKmLA4kdQJx+5j6Xx7S43Ub73WfbaTp0Ez4I/CfNrvaStSKyeWiTAhTLhWvaL/3k4dWU8/Q0yw==
Received: from SA1PR03CA0002.namprd03.prod.outlook.com (2603:10b6:806:2d3::11)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 05:58:05 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:2d3:cafe::71) by SA1PR03CA0002.outlook.office365.com
 (2603:10b6:806:2d3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 05:58:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:58:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:49 -0700
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 15 Mar
 2026 22:57:47 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<nouveau@lists.freedesktop.org>
Subject: [PATCH v9 1/6] rust: device: add device name method
Date: Mon, 16 Mar 2026 00:57:31 -0500
Message-ID: <20260316055736.1690546-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316055736.1690546-1-ttabi@nvidia.com>
References: <20260316055736.1690546-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|SA0PR12MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: cbef45f5-b150-4f6e-27b8-08de8320fdab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	bKYlgol2lEIQ/CCpAZfPuaRMANqQeibMKmBSc+rZNkPhwTxSsjFe1squc13IWVRDvtG7t+xyAale+0yZwF9d4AEA+t6MCLuwlSsl4ps2n6sITd8eMrlyGNv61Wzt+e7p3bTZ3P6CPqd3du0ZDBltTR4vDzZm2mtnbO5aj5+qMt0pKsoYm32+jxCVzupdVl3yJHtN5eUjsWAJpnMPyBEoB8zWiyFJg680/XmRsB6PPIe8O2FfyHv1f8dtQJYvSubcJyClMQFxxbXEis/ezqmNF2W3IjcsdyLujdM1XBBy+OH06J+Bt67iSKOPIn5SJLc4473f+hrciOtnUjoIpSCBX1fOngU5PWs4oRipIO/qNwSaHcBYqXHq81c6IsK7x0nBmwkGuK8qY03kryq6P+KOOrL1uLujigiVnuYN3DKKaQV/i0Wuc1C4LDyCyXiGKfvQf/Wj4N6es7PU/0KLGjH/clDGup4i0iwumXDgTRzy0d3XlmBm5lFQyUfGD8A7rOM/K0cDH94j/zCGOqD1jphabs+PGcpj0v2WxOa5vw8EtC+4HD7+uE5pFzRnYM5gAbUvu4KVHjHt05gFELNUWt62PqIVIyGrgwHLRT9u8cy6hSmpAG7Ao0ZxcOAHiCMf6PyS+8mloJmLHyBGJeqDLYLl6aK8yrVgfKXcXOA1wiLIMee3Ytzb360kzyGER+5BS2Arm/XSUjGEVvbncvxXBodKzyULe1YJdXL9i19Sq9Yoto7Juwyl3ZW46scDLL7DKnvT2PcUnpg3hatgDGY9PJawRhjDmEkAF+TOq2hJf9OP6fvEUk5vbKG1w5RPz/7GjMBU
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4EZKddXrBqigWcm+0QLSf0u0H3bMZy53nobJvO452vOXuUoEZ40ti6XrDm1jYouw/2ZTp0ye9UP19V68ASMixt0qFHmTJRMxgG3qN3EFmPQ9kTnAa9ZVwkMfYGGTcqqA/ow15ZzpLeJj10ZdGs7M0rgaznE8ZzZhfGR1urkOx8w7s2A9pbDdjLQIqFyUhmdiFvp+zAryEAc+3xOT7UZWeZEoNzyuSvDWpSNNhEOjsuDfo5Lk2FgCd6y/QIhIX+R7x5ge8xKV+3F/yD3jOh7LowS/96/eH474VYoS/AFoQCU8/zJfUGTytiYmYDG3WAyBrN8gKbV2OnGm78vIoXB67U4nwrbqs34uL/srJnUK5umhv++AAYYq2vgLFWRd+Mx9EBl4IavqracW4hVbwikbLU3a8f113Yx76DVawMv03srpwsLxJgA+us40i8L7Fjre
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:58:04.9829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbef45f5-b150-4f6e-27b8-08de8320fdab
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447

Add a name() method to the `Device` type, which returns a CStr that
contains the device name.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/helpers/device.c |  5 +++++
 rust/kernel/device.rs | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/rust/helpers/device.c b/rust/helpers/device.c
index a8ab931a9bd1..3be4ee590784 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -25,3 +25,8 @@ __rust_helper void rust_helper_dev_set_drvdata(struct device *dev, void *data)
 {
 	dev_set_drvdata(dev, data);
 }
+
+__rust_helper const char *rust_helper_dev_name(const struct device *dev)
+{
+	return dev_name(dev);
+}
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 94e0548e7687..8f6ad4f53101 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -489,6 +489,17 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
         // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
         Some(unsafe { &*fwnode_handle.cast() })
     }
+
+    /// Returns the name of the device.
+    ///
+    /// This is the kobject name of the device, or its initial name if the kobject is not yet
+    /// available.
+    #[inline]
+    pub fn name(&self) -> &CStr {
+        // SAFETY: By its type invariant `self.as_raw()` is a valid pointer to a `struct device`.
+        // The returned string is valid for the lifetime of the device.
+        unsafe { CStr::from_char_ptr(bindings::dev_name(self.as_raw())) }
+    }
 }
 
 // SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
-- 
2.51.0

