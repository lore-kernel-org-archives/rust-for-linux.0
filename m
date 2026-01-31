Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBA1357712;
	Sat, 31 Jan 2026 00:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821019; cv=fail; b=JChAyG4wqB8h+XZNBK4F3pvnhDpYBAQhqW0ogthGGcnKkzNJT7Cn+QH3w7axj0nUzC5/PMY9a1rYnaCjVStHRXbJxCuz15litEFpF5Mk6qM0BE6/UtyVdMFmnicKITDuUM3LHRhYnLHp27w3vjYbbbA1zOQmYxuzb3FaxL65mwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821019; c=relaxed/simple;
	bh=LHt+ZzVAL2rmBSOVhkAv1phYHMBbb2U3arui3hyOZvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lk6xrHcHZppQOYfDaMGyqKEngG2nTkDzN2NH/6v28I1DaW3epXZ3Gub2VmBA/M6htSfpnWTZENo10HZ5uSgxHALZKssLIjPzMyRBYufAG5/9t6TWj8xecudloigmXWYh8yRnXbXVZwP0hVvWVbFLrId/rLJZAgddzDhFRhq/JTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VT94SX9M; arc=fail smtp.client-ip=52.101.61.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VT94SX9M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M29nxgWT9+TbAQzTcZG+6Fe1dEb5jU0gXdhZ9VywZML71VVXxirdz8nYp5DBaEKahfZ/K+HbKce43QaWPynltrCi+OPLcXhX/OjAzNgna1To5V3by/xJlADySbaxeiHv9UFCZjwpwwaZ1cR+0oqZp5xTPeCHFTgLr/kY8qRyQPH12GbZZ0Cjjv9Nqe1OVf48138zdOLGR03EYEMiA6TznnnYd4ZUdxMfsQa7n00xx4nzVtIG2usrN/SRJWi1E/rsi1+Srcw3pK8FgyZFfi2Xk4mn5NgcMf4ocfWL5gJTr1kAGWSq87xGtzWxDuP+HN6A2spS4G6Fjv3nZYc9q+QFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaQASU1P3WqCzrjn1EnNQHyOm2AnOgDq+z29I1jUWfI=;
 b=VD+AWVOlgrLRrmBjkfvIYvxJAdGX8DEoXWhwLVMzAXShhNQP/eaSu+Oqzl+K13Q05s2AVwFfM9ad18KWZ1AW6fI0hUQh+x12c5OtX6QkqisElbZSazvq3MLTF3jqYqPIN9IIlHmNW71wMJnGNp4Ed19cXreO8YSIszbXrdhcrcJdtbkn13D799ccrdQ4OifGaZH9SUCxBjH/0VK73WnhzwgegeH1w+3FphbXMq0GzUhs4PrTS/MVct8hhJvUatyNUkHKlaYQAuorJ7BvRq0bsG/xWczLZzWkl0jZQYA/nHJ6G95WdiLWWaCUSIVadOYetHrqzDcHAoZByNtWGkSdnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaQASU1P3WqCzrjn1EnNQHyOm2AnOgDq+z29I1jUWfI=;
 b=VT94SX9MIUKOEiyYUC79g6tZMwjySWMQCqRqVD0Er/N9QRSvOOO8hK2OsAnTsks0K7Qj/+UL1A6qSYNNGxr87ZjbfeQTo5QxVF0+WqjegF/xlpWTwRGpy6uGfGppvdxuxcLk7swzLpYsVM1eJ0vU8x7A1+QWZYw4BYcwqc7XQ9Q5l40ALRAFOc6Yd3wZJKwK2QjVh4A9XhQacYTfGPEVMuxBchBH2jqWEdyxIPYTaAFQCXaEvTQJRrYAptf0qyAU0GKM00r7fCMYd7TTYps1scoyBpeAPSKL11qtJtJojq2vlpp3c+CYwTyL4SDKQacSFKI0+KFhK3PgCuvai0nFZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:52 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
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
Subject: [PATCH v2 29/30] gpu: nova-core: Hopper/Blackwell: new location for PCI config mirror
Date: Fri, 30 Jan 2026 16:56:03 -0800
Message-ID: <20260131005604.454172-30-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 2199b595-cef2-4072-38e8-08de60639ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HhiP7Qx3FfHR9dXfqQtzBU6MOgJf5dHLUSh6DKxVJYQZtoE6mUY19/YI7d2d?=
 =?us-ascii?Q?ND+L3+7zL8NMlqpvOgd5GcF4HuTWeo9axIWX0cDtTFGpO8XR9V5d9Uvznf9N?=
 =?us-ascii?Q?Oh/SykAUPRAX98VkDvfv0Pn75K9kXxNUra5wep9+31jlib9ItUtej4JGGGnR?=
 =?us-ascii?Q?++BSm1aXAeCHnqe8NYfC8cbJr+TmYX2K35O2RvTQHRMlLrmtSk4qjfJd6wrt?=
 =?us-ascii?Q?TceB7fZgqjF3shWsi9AgmxKAHl3JDNWSOib1RwUyS/HXe/qFOtolBCO4pN2G?=
 =?us-ascii?Q?cclSyFUKs+B26KuLh2UoiBdVJbWpuPQ6VxjayDea4J7EMt74JWFz0SD4SH6G?=
 =?us-ascii?Q?ZPTUl4PSn8bLaowcHA6ZuVYHx5Uo+G8IQlrSMssApo91YRTqQKrovbstGvRd?=
 =?us-ascii?Q?6x63sH/ZK68Ak6qwKem+hG5sv4FhVsiJ0fbkYlicLF48HF3xs/TlgKuPzXOg?=
 =?us-ascii?Q?q8pOXTkWZrgLz0YaWEcatz5F1aRPuFUfiKIZf8KyNH0FoW6WVHMeWIf3Jn1l?=
 =?us-ascii?Q?XnXw/AJ7fQArPR6R6nL9HXcbH74teDqjvTKZxcbwVQ1bosZvPAisXhzY5dtI?=
 =?us-ascii?Q?AybXlmxS9aQu3zhJkA/NqULWgpAA2Egd5mMCUHfClYk4D2wOQkpXvJ2Q6efv?=
 =?us-ascii?Q?8gRPh0YkR4ii83ViFkDg9QatZPRLFS3lGfChHdntJUOjIRasbwNKrYV2/0oB?=
 =?us-ascii?Q?1P1fIqKeGCnmlEjrgdIdKdPWgygG97jiPLf9CUfkUdg0EmV15DZBy0rbjd5v?=
 =?us-ascii?Q?55hjwsahCLaAmBMSYt5wr36+A+WmWfusH5xIkzp90fWpk5ReMA9ZujMKZOrq?=
 =?us-ascii?Q?StW+SALsv7Om711m5ZDr6WbKExOCyqdu1RTWTXPSkczSAagH0ez9jTp1a8kR?=
 =?us-ascii?Q?tnvambTtglBkhkD+Wv3IUfwYQwBJtzYD7pxFFjB+3OLf5oyxKwbd+Wbd4cQ4?=
 =?us-ascii?Q?Y5kxfElt9idfNr6fUN7PVQh5NT6SoirHhRopuGytqaJ7UaiXObY5W8Fryklv?=
 =?us-ascii?Q?Dsd1l2hkWYv37Ba487g5X2i+1tI9kLcsU21oAiRwvEf1c+Icg4g4r53CbGfp?=
 =?us-ascii?Q?Xhmc3iS0Gh9TnddV6Uf2xL5eW6GXe0gLj/8dPZOKvGX4U762fDfZoCoxDmNj?=
 =?us-ascii?Q?bajsDUd8Pt/rhyEoLWDQlCnc9dOH8fg8DHRt/85HCnGMju6QBB8DQIdxvpif?=
 =?us-ascii?Q?iVbmVNjzl8zqkf1sV74I0uFqFatNov8TYmGSKGisj0hX+wUou1kJAVhbazba?=
 =?us-ascii?Q?VVa9Mp5fykbx3QP1kUwAjt651HvWySaahxStWnLd+H4m4XbKZYW3sIc9OkGE?=
 =?us-ascii?Q?uYFtmy1MLT3pzRbK+sHJJWfBrLIC+rxj4mLvMEjSxfp8Imp4BHjzHxYMzmJN?=
 =?us-ascii?Q?vxkHv65kphzzfYgB5X2EhAlfAqbKYq/1KEp5kX8BfvWi/+sZttX3oy7PaNZA?=
 =?us-ascii?Q?mEfnV2YLtni0c3ExsewaLXI18nDKVqY9mxd4nwAxH/NBcood5ytpAze94Zxn?=
 =?us-ascii?Q?TtM9JTbWaaP8fXEii2jM8ABnVD7S7mELiePvXWfoM8POms9L24xOo3YQH+MQ?=
 =?us-ascii?Q?Jeu757cVikxGAoOv8tA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pNbDF072U3Y4sejZiR6SondR4jPdi+1rRcs1vzLtbrwMLDVKN5cd24WhZijC?=
 =?us-ascii?Q?xveFAG1OJ5D1ZNXXSWQzIXYApsZkMZIjflgUc3UbHgUwKq3df6yyfP7anYJM?=
 =?us-ascii?Q?6N3xBWyWbWK5c+CScoFJzMUHEBgRIQSvt2tOIzk6PxHgSLs7j6+L3It1PTE6?=
 =?us-ascii?Q?LJyYTfA7+6hLQl6qNah/ZnKnj10dh+nbC8eUiwSNKY2/SEbIt5otGC2zznjn?=
 =?us-ascii?Q?sTRbl9KVSMiep2go6DQ07vU2lgzaYNNtFW+nr5U5SaQFGHPaxBs+mC/zJX77?=
 =?us-ascii?Q?OzpHWJbPT6yNczMnIbbaRGy7LOPc6JluX91qU6PKLv8TF0XBkqShgAALqw8v?=
 =?us-ascii?Q?jJ0IfSxIkW7OrFXPwOERBCBmCgtYuBcYgSB4xTiqhSfS9yGf0XEY7e7KH36r?=
 =?us-ascii?Q?ouoRrm7iDmraqHqKjXbvEr7XRKDNdnFnw5gMFzCke3AJqtkrLo6u29I4OY7u?=
 =?us-ascii?Q?hDOsO5wo4eqlV8wP0L6dunX92BaPXeFAkN7bc0MMG1JKt0CD+58j+ge3wqHN?=
 =?us-ascii?Q?spDdPaQMHpmpGpiuZbgdgqANbtDK1WA6A7xSacuXzU99z4DuvPfLjsI71WDF?=
 =?us-ascii?Q?jW8LYHG9ejv+l/Yu0tgChkjxHPKQwZPU8H3FVdKD4D5lwBf8RnJH3DAL7oK+?=
 =?us-ascii?Q?Q+iA8rxQxEW4MlgvZblu7KBmXxaEyLZizkZFwgiRvXeOotA5/ZIyUCHZI1Eg?=
 =?us-ascii?Q?uTkTz17D277yYh/6s2Gd0qih6AaQkCS0/52xsykgG9E3fON/7Q+b+MVwyBH8?=
 =?us-ascii?Q?evKq+AobhTFddpB2rvUFQY8subj7wm+FHPLEG9werF6hQUtx4w2KoXk1iwp3?=
 =?us-ascii?Q?FiV/ErHf9zZoy8XNtl0P54NAe2BAKwin/0PHe/QsQSLj3Sfzh6h+tOi/zLqY?=
 =?us-ascii?Q?JA5cMxKmdQuyt080kKDvc/lyqpEgT37G/vgr7kLAKc7PWfaUrwGRe3GSdyhG?=
 =?us-ascii?Q?TGboJVELuI96cdm8aJx89PHdnKuxw+pFs3FAU+FMg6p9BtYuGWfNYXQ4QcJM?=
 =?us-ascii?Q?sn6olwlEiCjIMj70F3rdxyg92DmLgMPeQk2xTJQfQL+fcx7JeA0Lqjip0ovl?=
 =?us-ascii?Q?ifusjGHhC/zAiGzcxLjxtgfqJR/A5WNuadkBBJvU+hfBpXuqrlVuT4IbleMs?=
 =?us-ascii?Q?kag06F3ilADgRRfRd4qYHqdIIm8l9//FejXOBSEvSQ3mJELn2LQv2L0r5sew?=
 =?us-ascii?Q?jjEBipON2MbsnVFVKQZfnW75PqMht9Ri0KMsGe4LAbdyBRSv3idY4qO9agLb?=
 =?us-ascii?Q?FGy6cyE+UYVxBI27JG6u7ssqL3+IN29Swj91ttZ/Hev9z3QPboEAKvy0ZNHO?=
 =?us-ascii?Q?8ZhlKbj69z1Ko6gMPSldtZmavP3Fr1ji3JdpjJ5xfqxQGYWN5oOAuNHHMvXx?=
 =?us-ascii?Q?vytKI5Pa9Ee73xXqFt3l+HZG7qbUb95T1Br/x8a2oTRKjDThTcCwHviSTs/9?=
 =?us-ascii?Q?HqpKybIhbCSpWPD2NVXzN6UBO9Ld3QltWvz+WpUBy3xOmzKI4Jcpbw7mNsCJ?=
 =?us-ascii?Q?HUPgLpAcLWu4rBF5DX4/1DWV64zcj9ywLvIsa/qxd4i+Q6SZs5Ds+24t5iWd?=
 =?us-ascii?Q?vyAkda6082CFvmv2E/0YbpTXYcDVUQKE+xdIrFlgVE2+MnwnCacE0c7csUeT?=
 =?us-ascii?Q?oSieIgwOrM+fQwK6z8z7FD4GyhLblOy8cguVIFbte2khvB/AbhXIZZZWiPFU?=
 =?us-ascii?Q?ncVOsiYDHkUGg/xfDCXelXwVtnb4TTKpUocebBsYoXluCucDivOb368uz69g?=
 =?us-ascii?Q?AaWFdf003A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2199b595-cef2-4072-38e8-08de60639ee3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:51.9043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7OxcEysFY8xZV1rT3ogP+wMZrNZnL8Tio8/d3ND2mlM7iq8tcnPqMh66v9qeeoDKBz72xishB4Ha1qTJ8I/ZUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Hopper and Blackwell GPUs use a different PCI config mirror base address
(0x092000) compared to earlier architectures (0x088000). Pass the chipset
through to GspSetSystemInfo::init() so it can select the correct address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs        |  2 +-
 drivers/gpu/nova-core/gsp/commands.rs    |  8 +++++---
 drivers/gpu/nova-core/gsp/fw/commands.rs | 18 +++++++++++++++---
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 5284a35dcc2c..04b6141a9c38 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -388,7 +388,7 @@ pub(crate) fn boot(
 
         // Now that GSP is active, send system info and registry
         self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
+            .send_command(bar, commands::SetSystemInfo::new(pdev, chipset))?;
         self.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
         if matches!(
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index c8430a076269..a0ca13afda52 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -20,6 +20,7 @@
 
 use crate::{
     driver::Bar0,
+    gpu::Chipset,
     gsp::{
         cmdq::{
             Cmdq,
@@ -37,12 +38,13 @@
 /// The `GspSetSystemInfo` command.
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
+    chipset: Chipset,
 }
 
 impl<'a> SetSystemInfo<'a> {
     /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
-    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>) -> Self {
-        Self { pdev }
+    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
+        Self { pdev, chipset }
     }
 }
 
@@ -52,7 +54,7 @@ impl<'a> CommandToGsp for SetSystemInfo<'a> {
     type InitError = Error;
 
     fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        GspSetSystemInfo::init(self.pdev)
+        GspSetSystemInfo::init(self.pdev, self.chipset)
     }
 }
 
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 470d8edb62ff..fe8f56ba3e80 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -10,7 +10,13 @@
     }, //
 };
 
-use crate::gsp::GSP_PAGE_SIZE;
+use crate::{
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
+    gsp::GSP_PAGE_SIZE, //
+};
 
 use super::bindings;
 
@@ -24,7 +30,10 @@ pub(crate) struct GspSetSystemInfo {
 impl GspSetSystemInfo {
     /// Returns an in-place initializer for the `GspSetSystemInfo` command.
     #[allow(non_snake_case)]
-    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
+    pub(crate) fn init<'a>(
+        dev: &'a pci::Device<device::Bound>,
+        chipset: Chipset,
+    ) -> impl Init<Self, Error> + 'a {
         type InnerGspSystemInfo = bindings::GspSystemInfo;
         let init_inner = try_init!(InnerGspSystemInfo {
             gpuPhysAddr: dev.resource_start(0)?,
@@ -35,7 +44,10 @@ pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, E
             // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
             // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
             maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: 0x088000,
+            pciConfigMirrorBase: match chipset.arch() {
+                Architecture::Turing | Architecture::Ampere | Architecture::Ada => 0x088000,
+                Architecture::Hopper | Architecture::Blackwell => 0x092000,
+            },
             pciConfigMirrorSize: 0x001000,
 
             PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
-- 
2.52.0

