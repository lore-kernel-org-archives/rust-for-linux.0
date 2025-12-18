Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8146F1D6187
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 01:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766022572; cv=fail; b=sEQWaC1r8y7X3VFS4Hnm8o9XUnZS9atg95hu0E0VeXm+5jMsnD3aZpocVDU21QCZYENhJU0YWCzF8oCK73nBT+e7Ew5EKZVCQu7ci8gE7am2rvjdorZsVQt03hP91DkW2o6uaDnLOGz4buY1Z5KZxzHs4xJuXSMgXWdZFE2/720=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766022572; c=relaxed/simple;
	bh=IZg+xu4o9yyOl6NVKi2y6pBZ9ZV2l4qwliK9L68NgKA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nVbVOFpaSyHWz/NrbIkcQYTXj+1pZfyoaTExBJ0eQkEsyxovCjjfeLNm//d70egfYEr3n3U7b64EMzC1IwMA4Zu6f8Eq9F7JmlTF+cMW8aFN0z/VVGTD4bfctJjHoltfG5hPJJSy+VWpthSdYdW971KvnjUhDhQzsbCWs5BoBqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=boXJHq+Y; arc=fail smtp.client-ip=40.107.201.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="boXJHq+Y"
Received: from PH7PR12MB8038.namprd12.prod.outlook.com (2603:10b6:510:27c::9)
 by SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 01:49:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhjUOoL8nJfoIp/lOdCkiNVFrYC7YKknLH3VHvfCNmrQihAlSbLUg8tcNaueOOG+NSuvf2PAH4CFROIMAyPVBNaEcPH2f3/5dW9XbF42+Q3uhUAoHItPvi0AqxarK99veifeSGdfA9zkf5bQQL4NXV29GAbCrgZA5J/incuJJZSpzr37FTsqu1IAKFg9uBPywO/J2473SSXPLSW7JEnA09aq+wuk0KIDvpD+zEgS4zGtvEs/sJ55Nh0vj1BN5sp6SLiIUfQEWxE3PiQbsVTKL/R5b8klWbiDulaqubLTH9dhxozEIhBWr2wKdavO0R0tEbWaRdLk2qNF3UBXScpCig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gc9C2S/4qSjqphuInKxxQhVxSAggl3Jk5tx123PsoBs=;
 b=axgv3Ex7KhAqLmlXoxNg5dxZtPU+UwqHGmY4GqiLSqlnuqy0C8QiXfdRChyDXioWPIjRHBMZMv8/RirX5qByvrRs+d2O7JnF19wvZ3Jbmze5MnYtdydDF0vtPKPPnodAOn+84DG6OoeI+a+Hber1IFx+iawKs2ym55iL7MBejCV4/gJoJrjl6KmNDRDGpLy7y+EB7QvSlm8ogMb0JKFQNzET9h8miLVt00bJ2qHakrWDsoMbQ69LC3xmR1uIsWBa0mgIt93qtXcRGxM9fqUKKB5x6cx4xjlBOeUaJwGaC4+kL5z/gDpWPc3QATFMeEfBkLb3l6LjDVU9+3mNonZEmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gc9C2S/4qSjqphuInKxxQhVxSAggl3Jk5tx123PsoBs=;
 b=boXJHq+Y7TsP+p6fxRPMksTMOdyq+3I9P/VxUpULVeSlkh/3RCwVCB1Ys2acOSm0s6kgt9SIIceKaQ8d2wJDXA/QRNGVhmrJjUJedSDRd/b5NJi+BWTN8z0nKeyA7AQTNYQxbRvUUnAfKPm+hHkBa/TlSgstWmlGJAVa/JijUyxVWuQ/GSUlK/SiTF3HVF/horUY/ZK7wJBCJAeAnJUqw8Pz2MGu082FEXj5qjzEnQt6gZwQAmbWg1ac3yNoAQ09LJCx+wVDXARmj5o7kc7MPtYK7cBXI597euP/p9O5R/+dx3sRI7IxFJRTpuBXGZ5evyTids+M7xCw6XPqXWHtNQ==
Received: from CH0PR04CA0027.namprd04.prod.outlook.com (2603:10b6:610:76::32)
 by PH7PR12MB8038.namprd12.prod.outlook.com (2603:10b6:510:27c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 01:39:41 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::52) by CH0PR04CA0027.outlook.office365.com
 (2603:10b6:610:76::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 01:39:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 01:39:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:22 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:21 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 4/9] rust: debugfs: fix Dir::scope() to not borrow self for returned lifetime
Date: Wed, 17 Dec 2025 19:39:05 -0600
Message-ID: <20251218013910.459045-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218013910.459045-1-ttabi@nvidia.com>
References: <20251218013910.459045-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic:
	CH2PEPF00000146:EE_|PH7PR12MB8038:EE_|SJ2PR12MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ba543d-3f49-4651-6576-08de3dd6503e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?CSv2qcdNEit074FwDQLbjQ6CB+K2G/Xfqr760u4OjGcD8Fv9hbzki/3AZFc8?=
 =?us-ascii?Q?7iSsuVNLYELOgnaUkkapR/Ba3UoN7jdv89HZbwfLCElWJGBx7V9ewJmIYqVn?=
 =?us-ascii?Q?VcJyI6vEkJD/IJVPirGJxsQg6ac67R7vojQ6h26wkuvp3wiv4R/f4xX1Z/Hp?=
 =?us-ascii?Q?O4d670q5z1mQDa4PBB8NLt6WFHiqJiYm9AW75pR7cz/NvOx4+Q6zQTo14ylZ?=
 =?us-ascii?Q?mj2hwwigwMm4Xu6egA83fQqrqzpEN4Q3kf1mU2L4+sSacD3hm+PSt0vYYjhZ?=
 =?us-ascii?Q?lbtEVYYjEgvkaLA2AAP2kaEFk09VwK0g9FIAGoEDfoUnRZlUCAMhKOw43dqw?=
 =?us-ascii?Q?xxUfXplgKC0oyDUwGAxKZFLkcN+mvF8csA+aXaVFtgll3JCeCgi2gUytRaxj?=
 =?us-ascii?Q?pC2CnDjDlOcIjxKLLESSdVBBA1Kd4ersFUNPrNa9QemqtJSt8Bh8neNXKdKc?=
 =?us-ascii?Q?a3Sqy6TcupLCPl3Wbof+9obeBjH641Aqq4DY2QGGmzf/xI+y9p3hq3kCi/XV?=
 =?us-ascii?Q?TnrkTgkSsU3mNqTl5y7pX8hPr0eEcleM25G6M+yfDv14ngdyVaod6rcyxpYW?=
 =?us-ascii?Q?37IVV9sdO5s8E+iQpCfzm6xNStvo+oyQfhKU4tiLJOWxsVqfQaDPVMCkeThY?=
 =?us-ascii?Q?k55C0FLg1jR7L4ihk66LVF8xsXIVXyz5geqYkxLAsiVwx4OXfEk1i+SlpAC0?=
 =?us-ascii?Q?4XDkT8I77oIXR5uWyUC/ZG4adk9FZwYDPvQnEo4+rQ/ahOhnurwYdz62js4g?=
 =?us-ascii?Q?zzEqcoGfpr4CiDOvcL3B2qFrW8c63B/PU/Yu3AZPjDVTgv/8bwTbnkSJLPIZ?=
 =?us-ascii?Q?g1vfVmWOeTk6qn/crNMvYyY2OdvboqLvBPcOzr3iyQfKJl2tEa8rL1ddY2uT?=
 =?us-ascii?Q?3j/QAma+ZS/mt55I2Pc9aOeglJ+X9C1A1I6CJMV4Vq6mS22kPTqYbcF0LtqJ?=
 =?us-ascii?Q?/kRkAYuJno5hEdcDYc+2lHXfSnMZ9UEsgDdDww7ipkrQ7vVW4rNk4QovQezF?=
 =?us-ascii?Q?2Sk0+C4AIiFRQHQ+lPAt/NDgD0lTBRkhTn7Q9i1GVMOlRbJ5THT42ET06Z4k?=
 =?us-ascii?Q?fkr3WQtta/Z1E74bUTyZyA9PELCCvOcTCzgHt0mQjV3hryhX0u1uINdjXpoX?=
 =?us-ascii?Q?kqRu++OEEmH95/96/0RR4xeeKOPrIuTwGqvEveUhl8jlZ4TC+LtidQ7AUYjX?=
 =?us-ascii?Q?5+EJckvio+l04rTgEhPnXi7uMuTbSj2WOkxBf6ATf8Ft0HsqU1v731Fbd5Fo?=
 =?us-ascii?Q?JS7I+Y3FilfJntxFz8JU22ZMjDF3n7IuYOqLyVGA4ZD0vTcEXxaitKOu0WJg?=
 =?us-ascii?Q?A3TsdeucOVEwAVO1oNc6Gwsyqz8unp06ZQoyffch5iT72HTNdq/NK0SQntVN?=
 =?us-ascii?Q?xEKbUkU5HrOeeEELQeLN7mWkhor5ZHymxck3bX7qJb8b5p8EXe5A4nj9qqUK?=
 =?us-ascii?Q?rIqOhnnCsvrG0QOHSO361zoE4JBwjUz5GJUPST1tsQdHv/m+pcSQBGwLEBOE?=
 =?us-ascii?Q?XLe5qgyLsPY3cn6zZxZFWC9y9Gjp6s8Ln11d3kmMr+rG9iQ9Z9ibNXsw3Tic?=
 =?us-ascii?Q?6MhxEZqWEoU3mqka9Ds=3D?=
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 01:39:41.0060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ba543d-3f49-4651-6576-08de3dd6503e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
 CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8038
X-OriginatorOrg: Nvidia.com

Dir::scope() was declared as taking &'a self, which tied the returned
PinInit's lifetime to the Dir. This prevented using scope() with a
locally-created Dir:

    let dir = Dir::lookup(...).unwrap_or_else(Dir::empty);
    let scope = dir.scope(...);  // Error: returns value referencing local

The borrow was unnecessary since scoped_dir() internally clones the
Arc<Entry>. Fix this by cloning self.0 before the closure, allowing the
closure to capture the cloned value via move instead of borrowing self.

This also removes the now-unused scoped_dir() helper method, inlining
its logic directly into scope().

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/debugfs.rs | 41 +++++++++++++++++------------------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index b0cfe22982d6..35f9cbb261e7 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -397,27 +397,6 @@ pub fn write_callback_file<'a, T, E: 'a, W>(
         self.create_file(name, data, file_ops)
     }
 
-    // While this function is safe, it is intentionally not public because it's a bit of a
-    // footgun.
-    //
-    // Unless you also extract the `entry` later and schedule it for `Drop` at the appropriate
-    // time, a `ScopedDir` with a `Dir` parent will never be deleted.
-    fn scoped_dir<'data>(&self, name: &CStr) -> ScopedDir<'data, 'static> {
-        #[cfg(CONFIG_DEBUG_FS)]
-        {
-            let parent_entry = match &self.0 {
-                None => return ScopedDir::empty(),
-                Some(entry) => entry.clone(),
-            };
-            ScopedDir {
-                entry: ManuallyDrop::new(Entry::dynamic_dir(name, Some(parent_entry))),
-                _phantom: PhantomData,
-            }
-        }
-        #[cfg(not(CONFIG_DEBUG_FS))]
-        ScopedDir::empty()
-    }
-
     /// Creates a new scope, which is a directory associated with some data `T`.
     ///
     /// The created directory will be a subdirectory of `self`. The `init` closure is called to
@@ -427,7 +406,7 @@ fn scoped_dir<'data>(&self, name: &CStr) -> ScopedDir<'data, 'static> {
     /// The entire directory tree created within the scope will be removed when the returned
     /// `Scope` handle is dropped.
     pub fn scope<'a, T: 'a, E: 'a, F>(
-        &'a self,
+        &self,
         data: impl PinInit<T, E> + 'a,
         name: &'a CStr,
         init: F,
@@ -435,8 +414,22 @@ pub fn scope<'a, T: 'a, E: 'a, F>(
     where
         F: for<'data, 'dir> FnOnce(&'data T, &'dir ScopedDir<'data, 'dir>) + 'a,
     {
-        Scope::new(data, |data| {
-            let scoped = self.scoped_dir(name);
+        // Clone the parent entry so the closure doesn't need to borrow `self`.
+        #[cfg(CONFIG_DEBUG_FS)]
+        let parent_entry = self.0.clone();
+
+        Scope::new(data, move |data| {
+            #[cfg(CONFIG_DEBUG_FS)]
+            let scoped = match parent_entry {
+                None => ScopedDir::empty(),
+                Some(entry) => ScopedDir {
+                    entry: ManuallyDrop::new(Entry::dynamic_dir(name, Some(entry))),
+                    _phantom: PhantomData,
+                },
+            };
+            #[cfg(not(CONFIG_DEBUG_FS))]
+            let scoped = ScopedDir::empty();
+
             init(data, &scoped);
             scoped.into_entry()
         })
-- 
2.52.0

