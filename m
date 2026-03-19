Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011001.outbound.protection.outlook.com [40.107.208.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064892ED84C
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 21:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773955653; cv=fail; b=leaHnXJnJjt2TQjVUAcSSqfFWlPoawCqsmFmveleNb2tAMKWMlggAXJddJodfT3nK8RDQxWgdQ3v51r7loZWuiUB9Ma8SEVT1BCGDRFKPmqHsOiAIhNxPaX9i1RH+2mGndKEoJB2Xio5Jdf+qBpUcalN3DnPSO9yeUyLL9vwHCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773955653; c=relaxed/simple;
	bh=Z+45/RAvF/NsSGD7APjYcqBaBGCzw9mAaoEIDgJN59w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HDbbMKP7kdVTDIl35CHHrDAAuDsKh0THj0UrKNDW+r76PkGVO6Iwu28AUBk7+el//BReWp/9Zhew/81yZXek4iG0CafJYdrJq41T1hjesUuyHkRgBbszcQPs9HXfdB1NYcuAXhJc7Ull1yGgBGIu8aZQnLiLMaUcZkAZjoiF7gM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VVdDwTLp; arc=fail smtp.client-ip=40.107.208.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VVdDwTLp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Al1qHNqfSCtNxwMP4xJtUrgjhvh08cVdbhRMk2mg3ZqL318SQybjYsn6Nnmi8OooIm/vWcn5cXl+1opgrsY3X/e0/t0JcU/T4ow2lUXTLBxpZ1BriUmVKXFoasiJHbCp4/+uwqV6e7MSelAkXeHunzqWUt5QsAfho46avw8PybmiXuQotVQT6lpGO+x5j39cAwZCAbtBa78iUxyfKnWcvXdLSmy4jtSCacU9SuDnOHLxUQCskzxAlwJm8kVteaZHgCVJUxNYKEX8DnYtchQl45J7Bvlfeco+778v17fDRfF+lML1r7vLlVrxeoJeO7O3zmxSAptjlxmiXspNnrDWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBlbu6tufz9bK440hjDNW4ojPbUa3vKYoZuYwE3kgF4=;
 b=WivAVDjdHalfeudR/W3/nQnoj+bYeeWjFp+fXnoF6ZbcA18+dP0yAH7PkfVObwZevrw16uB+RhRM5onVhXcLY3dQboR/tdmb5nUgbmMfq6oIgAKRTDhLrXBxkXYeJOzLAtBmw0tLYiJWZyjyWrS0HK3vm3T9iEFPSVeuH/9tOkLGZN1aSjDQgNDxypBHqATm9hPaDdAiEQ4gFSKES0AUgwR5sNocp1wxChNNs696ukwDiK+kt+Up6KBLB36EffzhS74Ds7siOh4I3DFJN7UvPlg5lA4kRs3rmM1N2PrF1CuKEGdMCBd24+yuuPYYXGNZrVe0vcel9ZAI5pMMLoP8cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBlbu6tufz9bK440hjDNW4ojPbUa3vKYoZuYwE3kgF4=;
 b=VVdDwTLp1wmLA0AvYkKfncPTvlNCLZzVRvXy50S9vrdnFQQw/WZMpYU7mhBHPJql5Fqx77mJN/RLdAQP7CfLNylrML59VndYAS1OkOcgpk9l8AtnUw2r8rn5DrS3VpVabzy1NymPQKmjkqde4iiNhqXCV960Q2ngZH0ZWnw5tiUoE33wLX1WbqQ2ZEkxGdBlG7sUNKbNSd+krEu7KGqmH+TbLjXlaXZkrnrallC7/C9eypieNQ09SNjX6LEkn32j8okWz80AGv4bxEfSUGP1KL3cr2FqfBb7G4T2632rrEzsOpVlDn5kUVdve/DZxsv3pHojfgZPkMFwsY0Sco64yA==
Received: from DM6PR02CA0073.namprd02.prod.outlook.com (2603:10b6:5:1f4::14)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 21:27:25 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:1f4:cafe::45) by DM6PR02CA0073.outlook.office365.com
 (2603:10b6:5:1f4::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 21:27:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 21:27:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:09 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 14:27:07 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, John Hubbard <jhubbard@nvidia.com>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v11 1/6] rust: device: add device name method
Date: Thu, 19 Mar 2026 16:26:53 -0500
Message-ID: <20260319212658.2541610-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319212658.2541610-1-ttabi@nvidia.com>
References: <20260319212658.2541610-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 43856d2f-ff7e-4013-8713-08de85fe50ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rUAhmgoNphfLgIozgkvVWFDXyC5eC1HhAGj1NVAutC8A0hdXgTjABcfjPell+7XERF/NSo2wu3GSq5uwCKT4lnKNYKRl21+IawdVUq3Pe8Kco3LShnINyB6C44RDLComA85wZQCpROUA6eC7gZT+Pfu148RV/1B8am7TMGbigyZvzFvrTmCsfp5XpkPeXufaxZ9hPqYyzq0bkGJfVJmW4TMrG5F+s5trMYV6LNdg2hrKPhpRZ+SyCIKkPnSR1uuYA0Cy6a15a8Z+ckOLnGjNLYziFigXnDLRhHOt+1qvi+cVFM3jrKD8cQw3xDrMwphrUi633qDI03mtcVF/J0bvUP+0coDQGDKnbLX0mVEY3BInautu4N7dc7GbUfRn6ddUQquzzWU0Yn81DT248INhGNRWP/r95nYwyfFfEZ/UBG5qvEtimaxRRarbC8buPmP1V6xHy+wbWxWc4L9F8E9toAxDP9j9vb9RP/5Qt9dV73QDgSMepdln55Dl54gwdFvJLnobqGi102TaUhnZUCMEeleWrQ1ZCJ2FD8olUAuEulzqLRj2nrAZ+J1HQ9lk2IYrXffPjJOstbCN3y5b4+0zmC/K/GAZ2dI+cjyl3eI5kGdmTdOYUt9+4YhVqw9mm+WeUOO6UTPtiFl3fqhKRd9aCCtrTIblgDJLo+/nzg/az9e2Y3PFmw0V4Rk0wNkjBrtWHW/AODzI6Hcr9PUwR/EYYqVKXwORSIwRLNQo90ulELKUzWfOWrKUBofHTi3sOr8pYTCT6N5Le4+NpZ4H4IJ8d6sHi/i83wUlCt/SBQfwfLXIgnYO0IFAKiDWuv+9gRmz
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aaj/xkr31uCUUphWC+MoC25+GkC/fqvhy0upL6Nkykg9ZjKWMYdby3HfsAZUV3ISC2YQT55PoVH872a/dpYU+Vb+jfhXuyccPB+vTVYH7QkUd2n37SMPGevxWoVGjsDIzefGJ5YEbFqmXtc/9FBJjt2CIciJgifd3/hxwIyn+6KIX4U4m3SA7dLbS8qkCbk2LoUM/yfcH9IBALbQEs30cuwPIsdJrY3UZwYa42rQTPyptmUqoI6MpV1bZYnrAJN9Q0QGABa4oNo4Oly9aQs16/uDHTJ/UhVanLNj39a4xmuvLF5Gua82B/+/gKtJuxv4VJMc3KKg4u7za03ADpZZyvGbTNinV3MFb65L+IH1dMeQQd958wz1NR5lYQMidH+dkrJVCIKZhVknZxaiF4dLYRTeBqhjaHDqflTk7H58ashQZxoECcTF/eWz9dC1HLYx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 21:27:25.7609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43856d2f-ff7e-4013-8713-08de85fe50ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017

Add a name() method to the `Device` type, which returns a CStr that
contains the device name.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: John Hubbard <jhubbard@nvidia.com>
Tested-by: Eliot Courtney <ecourtney@nvidia.com>
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
2.53.0

