Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F182C235E;
	Sat, 11 Apr 2026 02:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875843; cv=fail; b=HErEQo+lOteLmeMNhsq/8KobewKebHyjQ7ttrySNHnvEPcieO05Lep0q8IzWHXucNmxEo5ZhWYXa2TwpjeSMplOOXjSG9coAs518QHJY9anjdfx8urZ9I0EeFYrp7jgOfwxuFDOUOJHcHlCdjcejmQ511ZUNE9P+PlbT7878s+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875843; c=relaxed/simple;
	bh=rRYmsYsUWqc23Gu7pfrzon0LTJxaiL+T5wkdpGKCe/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BMGCcRFSCdP25H9QA1y3L/U9bKV4E3Z3MFC/Y14KlV59XjlucAfyv9+NeTHJu4pwfUoT1L6+n0tgEbIzblB7VtJV3sK+gVw5tSP3jaXzcvWcGzJ/rlwyjGlZzyU49Rfke8oa17FTXOGCmRgg48h6T6fPgnU+AaFwGyjuV22pr+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o4dTg9PQ; arc=fail smtp.client-ip=52.101.61.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o4dTg9PQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRcCnKWV5acaceFgcsW+/4vqbaquFbbV4wetXm5o77NuUQzkwWHyT7F0tnUWZoujzj9bwVb6cjDnui5w3ZH2gTMP9utgvhImHMONBklamumeEFHnzriAXXXZ8AU+r9kTy+tElP6rMIShzvQmMC42qgtJa0DEekQatd7A50nTyj+HOaD49qVXiWx+Ev/H2+Wscz3V9YZi/S+UxTLMTfEUmHirCOa4MdTIPM2ixr0cH3UFq2hsGyxIGMpwywl7JVHd6ec2LlzR+KJxmNm9KMG2qC7PXZWmlH/JWg6/hp9MmnCYD5lpx0qlXez5TMDAbjfIxNhPPYeq6u2f9ve7+WAtkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdtWpj5WGOD1OB0yBnMeSf3iuIyxhZAcchODtZijogo=;
 b=bW1GAlL/LR4sRc9CAjvKN8akW11TkvoBbaFMAhNxu5U+5KaCDZ4ACrl1GfOVPRBij2g9Rc3/i+38Kdb7A1fWqpc/eOq1h0k6MbvLZDLjXsqoeyvJBETgnDU0L3mOxQvBPCVDhfHBh99WNSaqS9FQhJZAmxfhkfh5zon4ylGa/ptbZqKSQSUJ2BT2H+C7BFpIdUKldF3h0PZGzH2Of9sPLGrYuXIHpZBpTq9B3FBDs/z5s0dzU1Q7J7Oki5fe8QWwcpkgYbg1mxJmQEuSKjtDcM/3KluBN/xHLVpePCkAxXVNThplxkIaQriRIfcZ0G8NaSKPXWClBgP9Dqsx1k8DkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdtWpj5WGOD1OB0yBnMeSf3iuIyxhZAcchODtZijogo=;
 b=o4dTg9PQKjcXz0nJ2NJ1R5ISmtDnNtA/sebhmzFlaMwA9BgdemkCsyIeEf8WAr7Jyj2ydizhrqzBitgRcQ/IPblU6lB5EeChamXPHkyChelKMD1/prObrx5WDIHcQhov3sH4t8Be6wExHBB9gjUU5g4TRC/YQ38BoCdw3oBtObKK9ZYZ0guMBniyUeTlzosC2YH9Z3TuEcFCzY97RY2G4QC98gBOHngMGAt/p3d7575xFUHz8OspUVMsQeI2hCzpTZkCT977gGnQayo/eGezz616JxX1uS5RipAdglCA2W9KQjS9nWqJZS1hVPrNDkBmfzI92XYzy88J6jiDKvNA5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:25 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:25 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
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
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v10 23/28] gpu: nova-core: Hopper/Blackwell: add FspCotVersion type
Date: Fri, 10 Apr 2026 19:49:48 -0700
Message-ID: <20260411024953.473149-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: c245aebb-1650-443b-0226-08de9775152a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	rUM69JHARhJWILb5tUiZmqmHBoiicKPZ2dhKzkdyMUqlzVobvb6lecvOK3EdRWqq8sb6Nvx98Id+fPfDOVAvw1DbljbUBjy81EQAbdM8mDD2yMwBA0xgSonHTMkfsQfd5dAstlh6F0gJbNqIfojQbgaewkFcJG2OsSI1gsTAm4FC5ROSIpYpC+IbICBqr/uSVQIIb2xuOQUY1iyoff3BrkWUYp7YWzMJ8ycVeftii+jKfUZXpJqjC7czNodxff0XuedzfgHhHLM5QJewbC2aRayA2Vktbu8PCfAeEU8MN/Uir8zh7btmY7I2ykV2bklV6XnJtffRVWufJz9zydaSbAVrkFzgObfA8zWQkHcvJgc2uX2PHQOylhlasJUYKfyELvVVe3kU23NE47/IaClVUXfp99/qHWzhNtu2BCZ/fyG73xbiPaluNwKE5YzFj4EcEuN3je/1rKu+B4ZWU8d/RiKkOu6fGKR/IID0MC2JmUtKqZfCi6a7VfNVx+wTSlP9EciupVXremz2iDgj4BQkGmO72jGcBdRjKfW8Qn4KLuyWt5fB1iC9IuP7tOzDLY+tD79pE6+w97w3wBRDQO4keD+qbZlIdeTwjfIf1giFWW2KInkbLdwGxMljdmA6bP3LNggF8wFBZuyrHV8yn7LJJFsG9umKZpfS0fqzqewHHhevQcuFGVb5/eQdZITOcXJW0EQIbIzJwKlPurAH9XQQRZUqen/MrZe4RfxXjbLsN04=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kGjYR791Ni0X+Fx05JPAyzCU1FM/p8fkkcOY66ern0an5ifPo7w89KX1VBeY?=
 =?us-ascii?Q?JKjp8YGqELsRS3YxHUZQ5XQvBozhSsAR5j+92blpVOnsXovPcsNYmoz2CfAB?=
 =?us-ascii?Q?A+Y/h3R5M+ixG1UE8ZjeswAECDcmV7D5jiKudOZGTK0YRCq2nXR6PWNCsYvR?=
 =?us-ascii?Q?x5DdUS8joAIaUV1G8q93KGTRq2pWAAXJY6Gky/Ibkn/a9WpLbHxIU5w4Ms9n?=
 =?us-ascii?Q?GumW3Tn7cu98aZNABUJHsGVYvfagn9jL9NqB0XTIwpM8pyPjYUsnp9FiLHU6?=
 =?us-ascii?Q?vU+n+3mOKYeR4i4VzKe1YK839JlQaQKdd5yOXG9hA3mpicGcJsLcTTlldz1r?=
 =?us-ascii?Q?qvRCCEd73pQVWbL1RSyptLF5Ht02wA4YbzwRdc16LGDAWgLrvkfQ0MPWT2OM?=
 =?us-ascii?Q?UdA+lj/ZETxe+G2//cwUiH0IrrX6ng3MAXt+kfq9GhXtXjkpob5UDjjjB6bx?=
 =?us-ascii?Q?02nrudIvtBe0QgXawidjaOxWbYTwhPd5o2QHwrVhFj7WSvPxkfUBbV2u0QAu?=
 =?us-ascii?Q?JE1fO8nYTzT5aADr5k8JbkzUyxJa0e6yfkVoljNertEcCmL2k1uZhv0g3S1A?=
 =?us-ascii?Q?qQIW4rkpyYAHgBebIg47Ty9/vcssa7xhRKl9Gbe4tupcdm65dXHWQhBpRUQ1?=
 =?us-ascii?Q?m9ch86fFMHf9bjiky9upLNQw1hRflpbe1s4niZc3JQQF4aftGcCqBpXUO9+z?=
 =?us-ascii?Q?EE8QYVVqzCWI2IQlHMihbi3PFT/CHL/UXmLhoHr4i+zZnGEMH5GOwR/7ML/c?=
 =?us-ascii?Q?rBX/BJz+JAYXBhwKYXrMEw/+9o1l8zIKmDdDF5RIIbFdQ/ZSAcgCCof0EU/U?=
 =?us-ascii?Q?K8dfO3WQIIL+YcHCrT8NzTZYaJWWv+/B77cUbU12CsxxKfTSe8LkyACfg8FW?=
 =?us-ascii?Q?iV8d9o1w+dY5aYlL1cGxgPX4/rS8bt2dPGG9IIX7xFGV33vhBAl+mzLD/d7r?=
 =?us-ascii?Q?i6/Wgr6YYRhjIGyhy24ti2xtIRBNpMuSJuFMszNC1kqclUcCevmkbXlwuUmT?=
 =?us-ascii?Q?aar6mVwelent7tpFSSxlt8MD1/cODfCIWjup7seL1g0jRvOmo23ncGMC8AjT?=
 =?us-ascii?Q?VDzeI5RbRT12GJfROQg5cS9+0DF6SQd6Cr6Ma2VleN2LzubGzk7DCd/XXHcd?=
 =?us-ascii?Q?R0tump9kbBVmdbvfLJSJj4N8RNMz3rl0k2678M24iRnousZCPuOKYZF2+Umx?=
 =?us-ascii?Q?sJNh5JMohMVsfqGx5SAPzg/wS3Xcvu23sIK34tNmt7vqkMTmbt9n85eecMC1?=
 =?us-ascii?Q?zyyxgI59g2mqAMmmmWIr/OALbEXYb2ZgwjxR6mDnMxdQeZhPdYQkoOisTE9b?=
 =?us-ascii?Q?8ggk4u3VgT4VrTYvx1mX3bfZ0ANDZd1kWrmdM6wMZFNeHgudYXwsGOYh0RL7?=
 =?us-ascii?Q?g8KYMn+Rd7Klf9e+jwQ3+lx6pIp6WU/SwVkR5sFT9aiO+Ff0u2sDrbArx+yT?=
 =?us-ascii?Q?xUq6H4R/+kT2t3qAQkrFuFYGjYsiwq0X5Kgd4PX0akWccOeEnJLeX2JtAco8?=
 =?us-ascii?Q?XfTXkcPzhA3ugWNRQD5VIxg1UAymYcozcgYSJiAyIzB+TW+B3aVgsYyuIwY9?=
 =?us-ascii?Q?f/VTTpo9TzjG1p3ckwDs8cDMCd9dLDK/PP+2IRdckOV4BqxsLj+bUrjkV1bO?=
 =?us-ascii?Q?s1TPRbYfEtMuJt7T/7k3tI0pujPpfY6i6mM6HjccoLUKCxt1n3/GTeqBbZAr?=
 =?us-ascii?Q?ZeYQ2sNhdf97eWph9AiRhQ6uYe7cs6y8OYbcONqsedCdPl8I6tagr8oSixft?=
 =?us-ascii?Q?ouXTyqlbzg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c245aebb-1650-443b-0226-08de9775152a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:25.6771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yd8VN9MkjXZg1wYeLup6LooZ6byPBdNxXZwoBfjZ31pIkYWY5o9B3IXHNDpu0n7JWU4qIcjqLhz0qiwUk9RmWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

Add FspCotVersion to represent the FSP Chain of Trust protocol version,
and Chipset::fsp_cot_version() which returns the version for each
architecture. Hopper uses version 1, Blackwell uses version 2.
Non-FSP architectures return None.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 19 +++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs | 16 ++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index b489845f733a..bc98a5c3cfaa 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -21,6 +21,25 @@
     NvdmType, //
 };
 
+/// FSP Chain of Trust protocol version.
+///
+/// Hopper (GH100) uses version 1, Blackwell uses version 2.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FspCotVersion(u16);
+
+impl FspCotVersion {
+    /// Create a new FSP COT version.
+    pub(crate) const fn new(version: u16) -> Self {
+        Self(version)
+    }
+
+    /// Return the raw protocol version number for the wire format.
+    #[expect(dead_code)]
+    pub(crate) const fn raw(self) -> u16 {
+        self.0
+    }
+}
+
 /// FSP message timeout in milliseconds.
 const FSP_MSG_TIMEOUT_MS: i64 = 2000;
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 0b3a62f6ad1b..5d7fd810687d 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -24,6 +24,7 @@
         Falcon, //
     },
     fb::SysmemFlush,
+    fsp::FspCotVersion,
     gsp::Gsp,
     regs,
 };
@@ -135,6 +136,21 @@ pub(crate) const fn arch(self) -> Architecture {
     pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
         matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
     }
+
+    /// Returns the FSP Chain of Trust (COT) protocol version for this chipset.
+    ///
+    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
+    /// Returns `None` for architectures that do not use FSP.
+    #[expect(dead_code)]
+    pub(crate) const fn fsp_cot_version(&self) -> Option<FspCotVersion> {
+        match self.arch() {
+            Architecture::Hopper => Some(FspCotVersion::new(1)),
+            Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+                Some(FspCotVersion::new(2))
+            }
+            _ => None,
+        }
+    }
 }
 
 // TODO
-- 
2.53.0

