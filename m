Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012010.outbound.protection.outlook.com [52.101.53.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC9F3A7F45
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 23:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773791679; cv=fail; b=ApSw3Qi0Xvrxo1C52en1NQ8/3RMQlaCSEVUeipquNPRgJ1KlnEbROz7nO+gIbJmkkjGRMNUUOOhbBxMaFrBboxkPYwT1NkZ1td56nOiPkKKNQ2C9a/EPW6m+rmWlXNl80NQLrtPbtsZ16ujAZlUDajYb9xxP6q9AEbWL8OL3Mvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773791679; c=relaxed/simple;
	bh=Z+45/RAvF/NsSGD7APjYcqBaBGCzw9mAaoEIDgJN59w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VjPlr3UxQmMVt+txsH4aNyhKtb7fPvtLaN1VNaBTNuO1TdJ45OU/URi1s1px+OAz6HERhsGceYPtojyVtSPvvScxzB1Hn2FnzR5zcqN3gTAUy0Ys563i0y9+wLzewgRqwZORh2h8Ab9iUgTPVkRr/QcNtAXyzneFYmXGRQRQN8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ON5ufSy+; arc=fail smtp.client-ip=52.101.53.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ON5ufSy+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPzYZRDoOoSVqWqnXqaFhfIomm/QgaZMXwUUmEH0CYKPyicQVpYRgmDBdwfHcyAEMy9fO0jRbm0bTjjl6rsnojOmYrjVG1gerx1qxnO1SUl4yVyFdIwXJG99iwAdYM6XX+cBCgJoEYkakOFpSs6nDkkzD7N5/Ttsvymnssm1O3tuOvxIiphp0q8952IjillFe/Hvt/B4gAoxqPnenuJA8DBW/BXkH8ZNGRPlkq4U2twJ92L9p0QmaJAz8ZGZiZy8lHu4aciAgb0T3D+aFcj2bKyQuCSS2GotAA4g9hsLtK9lhODV+vnjcU6mNh44PDobdI1M+i2ahxod84MDX7LqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBlbu6tufz9bK440hjDNW4ojPbUa3vKYoZuYwE3kgF4=;
 b=V35QI0aV+sL88+Moj47HeJrhcoTlJtUuf8bpBFmIOQlTch2gO3W/tWxzr+hXmPm6SiMCDNrd3T9qShehOxPxy19Vzu1W1JwPwte+fG8yMGeIUVT2h+eKtk2KKxrBkpWp/2KnWYmTtLLtDPBGMxpbGq1MViuSvQW0K5fPWxSHp7+BD8fewI2+SnZk2VxLfYAqPLYwoKrFANepQS4mHKOsakglgUCEm36e/5+TmLqJUgB5irRhPv3AY6fcCj834iaot2lCz4RLYRprKRVgZab4+PYedPfhm2b5k5vRULdqGKO2GBVVPURtMtVNzjbSe9mSifuSTxbinHvPjyGKVU7WQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBlbu6tufz9bK440hjDNW4ojPbUa3vKYoZuYwE3kgF4=;
 b=ON5ufSy+pYEUy4VFK0joiBCtVtNbErcAyv3OTahB242mh/I0v1YPwHgoyVnhUNTeDTCv1NKjQrQxjYkWqp4a9LRkqZ6EAW2g4lZspwFdjw/rRYm6TXtX0pFYfxTx5MEWn+a1Pq5jOcsR4YwfZuWeOJ4HOT0/ZdQ5vCEbpnw4jCl46/jhCzXSvgDQHscfmaNEQf2QWQjXrRfiJdY6TryiCNc7MuZY73FOkSmWIUjV/Ws6WJzvUgehL507gZMrwmouk21NtLikBXtnNGM1dcRg41ZxYZyn0e++d4kEFkq4xEWcnmQBcogV7yvH04/+yN7CFg1AfRp4zvoDQKMCzDOXbw==
Received: from DS7PR06CA0001.namprd06.prod.outlook.com (2603:10b6:8:2a::12) by
 IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Tue, 17 Mar
 2026 23:54:31 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:8:2a:cafe::c7) by DS7PR06CA0001.outlook.office365.com
 (2603:10b6:8:2a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 23:54:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 23:54:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:13 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:54:12 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Alice Ryhl" <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	<mmaurer@google.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, Eliot Courtney
	<ecourtney@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v10 1/6] rust: device: add device name method
Date: Tue, 17 Mar 2026 18:53:58 -0500
Message-ID: <20260317235403.1094713-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317235403.1094713-1-ttabi@nvidia.com>
References: <20260317235403.1094713-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|IA1PR12MB6460:EE_
X-MS-Office365-Filtering-Correlation-Id: 5540a924-739d-4edb-a921-08de848088a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q5bkAOcamP936HWvtdBSeUr588R6HF6sFvjWG3PyILXXMaPp/uhZ8oswdfNv3FND+RSXgGZ7p+lgUckZIJ9VUMefpHQG6AmrJRREuPAyXqWO8mGG/atHmWNH5ClLhAXn4J7ITdLNnBKQQERUidDoWFZkpsIqQ1CxvUOUOJfOxvWX9MqDLGh8SOUPea2YpDBkuQ9ZnQ2NTyZJ/pwhItmvWF87feTTG0IL5MOsMDRe6tKUEI+NnI/8Bpa4T9gIlQD6aM561rU3QE38I3hmjG/77c7+oteW6s4+ufm/KCZUijlnzd5rcTo1kpbNKlNe7zZlgznxBcnzM0mfX8lAUfVw4ZZYTfIGHeV/AgXD+kaA5vnIVBUvhiSoodkUwyvdRLc77XYmmP4fNHd5rWH/I7wXPYfIDquBMT5MFkDU9s6fQLeKz/lB8jhIbpnC4K5Q5/Huvi/oLdQVgAmoMhj2JLnxRBwAQftVOgr16FeeEyZEkxxJRKhRAyW7d2ugy8EliDaQX7Sqi5sPAA9XmBL1IxTlv4IfjP0aawl7otoIytYa4IkMYsShhuJ6usQYCm5IrF3H8yFmHvnZMUCQMctd4tyrIuLhIH8GH1/reYGU/YVIbyfyhZRKWtJxhE9dbVtFo18zGhj6pi9Tx2BjTJosybV22wOcTdXhQOq7SAJ+uQ24BAxmkQAN9vFSE0tj6lC1BOjE3kmLjWStFL4hYAXICan4NoDXFwl1X+pXvmcM5IS65Tk7XXu6K9cbeyf0azvLpyAQr8os1kFSdRVGe3lu44itGIygg1bB7svr7Re7Ue+fy4prU49fO6Jm05wcEwZmN3Aw
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pr4CSA0bGU+Kot3bKHypfrUiXFNIEjVhmE0Cy9DoXxJ4p9tOYhgI1lTdg71HiBgf49pXSZ7mvTfgWYXu+XPJ5RR38poZCTM0sF+hMQwHoBXTQBFegWxCdwETScl+6RlXl2U7xTI0PsqEY/VknDhxUrmxWBeg4bgQhyvQI3apqcbqU2HuljSvyWXjTAEwnchMQs9+xkfBCwW+nXGsqCP75g/g8tJh08nj5Np/62R6gD7ReqI8bRS1pQpb3tE/VhqULYao9pZ9hZqgBHOhBlCo7KuOrPZvLgDKkP9N8oLbvabSi42msVDn6SCzbB3/wj4nxewzWRuDUegszjErBLBJ079+qs3Ptyh8oXFKJ7iNSJVXPl9RR0kD0Eqw5GgZoI8etOFZZdkMNWGvp40aLWOg29Z6JCuAkxY26j4J+s7lne0Q/LXef4/1dG1YcihE8ijL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 23:54:31.5225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5540a924-739d-4edb-a921-08de848088a3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6460

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

