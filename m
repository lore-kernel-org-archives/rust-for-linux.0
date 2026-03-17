Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCF03FB062;
	Tue, 17 Mar 2026 22:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788074; cv=fail; b=Cm+Ma3zHXUVMLIzz4mfWrjbGy2CjMoYgGk4BRnJH+Swlc0pZzJBU7hKWeL+jsHalDlqAC0l02KHbai/jb3AYnbY9CUTcOkTsdQsHB/6TyqvFJd3eVr8c2FJPP/e1NZl8g/Rub91lCcPbW/fiSVlXMydCsyxh0P+eXTOPAudFL1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788074; c=relaxed/simple;
	bh=EhJj+JSv+mlUBOk3rkKeIF/qCGhVcegVU5eGpjfOghk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eTea7GFOB+uQR3p/taTsN0PGL4kMbLqrwXCM6o/P3Inhqk9Ybxf6qFoYmvc7TJOsYmbM3Vp3KZqz584s5lyDrod061n82vScVCMem0YVK0BDY3cQPayxA71O7ES+o4FS+toq4HbBzAc8oNF+tAiEQeivkVawFjPvTSqH4mmxZ58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QhmxH3UI; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QhmxH3UI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sw4rzeZQbRpBuxeqieVcFudk6udOZli/1tzPZa2R4IUeAHwW3Jm0S0wRjGRQ4lexPDxvU4zExesxOQkdc9/1MvZq5622htHiH1nBnRQLiAz4qTwSftLNIsO7TlUkRL7Jjspvyiq084Fq9IisevKZCqFgBkPB3tRZuIYYIm6evCra7PHbXj8Z73eWdBM8TsZVnR/dsGT56yccMhQC/i0KYZI4MoEtKeFseQSeOafoUkukx2OB5Ooe2Gy71v/3rRLPUjzKM+kwsRU5nlLBXO1e2jBbqpN77vLdk90V/Eaneb6pfynyvPKIhj7BHvuADqR+Ky3GHjUa2m9+oDyCoaFSFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gf+jsGbR77cE9ouw9SuS8Zz66UqUUpOFeErOxlCcmUE=;
 b=AgFffXmLfsfkMBJlLLPjYH4EDRwINd4JLxi7s3ZmvGnWve4mHv3J2wPzGBkJqCpofcUn1Vws4w36StHjMXgSlESNDjrpQI71+xpLNy4FxN+jT87DRcDn9X9tL9eWK9pbsGrQBZQRj1nvuLxgV+qO2Q8Ank/nClHPT5h5/cQpEZy2km+EqH12UzSPhVPuRAAnWEC6/mykXYaJYagQk/aeBYCxrD4LGYkOojgwnYcxQNRQRCUQ+BFcBpYBlSGTVL0QhzAlj7xTipnbe6fpGifL62uDm9qGJhz7FcE1u5pGakh8h6n1pm1LiKHoxRdDDQSYIkuX5N73UZTAZ8xleNp2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gf+jsGbR77cE9ouw9SuS8Zz66UqUUpOFeErOxlCcmUE=;
 b=QhmxH3UIgDV+E9RhJ/GdeAWRsUzL+EPoQIAvmXwxQbZlObwuwCwWofbkH8T1eNHA3XTIUkCE9xc4u1gTSJScGyZWJqj0fQm2C+tI2FyQKLvxwO5px2zIbho5tIZms0ihUzWN9+7YPs7R7Qq3HG8c6pFUFUF17XYccbnb6mV2RmlhTZpnbOP1wlMUJxbSlj2oz9CfhXNmnKsZXtH4zTen85A8Y4OueDKFe963NVRSTsmDEduGuOkb0mNJgd0xmT9m32fazVSHVoijFITU8u2w4iGHV7LDwl3k4gZ2lK+NtYfkTLWWPOto43xmcXWvBjnpgbSDr4qC/62WJmg0wVo/Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5848.namprd12.prod.outlook.com (2603:10b6:408:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 22:54:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:24 +0000
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
Subject: [PATCH v7 20/31] gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
Date: Tue, 17 Mar 2026 15:53:44 -0700
Message-ID: <20260317225355.549853-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0294.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5848:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fb9e15-984e-4374-9ff1-08de8478227e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1hXTVqwhvcbvAepipyemlz8Q1pOi/uxAy933e17DNV942ScqWl0p7RBDQan2mwUXICthziNsI1eOrep+TViOX+6C+2uHCjXkssLYbKZMp5EnVj2+O+kwDdgyT2jWgJ9vVz0Q0poWfXpcYz0xmVVgeGO+lM6qC0oQFNWtPyhoraC/PBUkOW0AespA8MnB9p8mGUsyN8FMn4qghP4nNlssR5T8vE0JActHaM8mhqESc++lM+pnnS+MnJWKCHf1xdSIwl5OBHlyPCzzV6extxCO6IrDAhHNoMlU4nQfIr+7EcwsSJQCYZRneRWXuCF2UotqBv4N0PeYBxY7BXaHVaX82wehJYdYKF9FlFGlgRMjdkZFRDRSeUAygt4eCZXU9JU6+j2g+MqAkfI1iJcbVWC8aJfVC2sEom6ou/QB/6muMZtC1tL2nbX9ALLMi0Up4sNLgddxiJXjLF+FZRCHRX+Jn19qT9aAQkFYoDlEV/iYaD/b7/QSWjJY4XngRy5mBsBYYujDzhFKmz+SrEByRER9ohB+3d4Uon1yutiyHscKCZr0G6dWQMVnbTE8fIyF2Hoi+qS04L5a1czsIP17ti9eIemCkxHx0BMXfuBtl30gQKxeHzIKvhFrMDH44Pu+jfXjpx5fiJPtF3QjVdJyMsds/V66Sllz8UVjA39cAaJK7nqniyHTSQ1MrBRM0rw2tIqAgN99XyG8hEVfeLF2dwOhQQzY6iPYvDwoK3xTXGS05v4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SjVHz9H77KQTj9SuyT3WszFdOZFqrfb1sRn9wyfG5aYebwxxnOchn7cw2Wl0?=
 =?us-ascii?Q?o4vkz+z7w64Blnjlr9kF5BiCEoojoQ03CaB0b4WVI+dgK/mFr1NUXMO0jpGe?=
 =?us-ascii?Q?VXplGKmiq4QLS0muTP9hYcY70G1qFcG6+2Wjt0Bas76DQ4gmjIy0/nF/W4Iv?=
 =?us-ascii?Q?uxcfhQ7L9/UooOzP+VABLIDZJn5f7XBfWta7VdDgzrFIIAhgXPGIwAnoK/Pg?=
 =?us-ascii?Q?+qLHKYNZo/ZvNj+Z53O1Y8i6HPX9jYjL4YFIdwaLgLDJh4Q81y4y0fK+ZytT?=
 =?us-ascii?Q?cPhdqTku8kiaYKsY/L8eWZJltY7P0smyJhWpNTZcjVzqQ8tfmKDUdPSymApM?=
 =?us-ascii?Q?7871pQMV74UeAvO4rPgUWGvRkXJpSmSsjyVNjoeEH+8r1nS5TQgQu+x0KSd+?=
 =?us-ascii?Q?pzudin5YW78iYW2S1r9h1jow02ogxDglftl7dSFMGKMDBQg5V8wy61DUFB8M?=
 =?us-ascii?Q?hccnHfGHex8RvM87BO1+JYj4cExh1HGBWYKcZqUVKW2XrVdwGUrrU9oZTA8G?=
 =?us-ascii?Q?n/ElSVWtcD5g0uGAW7XP9umd2FxMSqTlAmTUkcxv4Hr6o3FF8uOmq0pdTRv9?=
 =?us-ascii?Q?ysGW5+RdUq4Y23H3ON848s1+CaoQdR3T1JxmHYXPXpSCNDyadeREtX9sFOEO?=
 =?us-ascii?Q?7aRJTXgtkkRV/U8mcyBHq+gWDTl39OS7paSdYDEMrQXJkA7/BOeWV5UnpYmC?=
 =?us-ascii?Q?KLImjqUvmXASHbKZQ/u+u+PmSD7zLNk1c2EBGVNp7vvaYqDkghh0nELOniCP?=
 =?us-ascii?Q?qPfsAYfe5s1bvuUypyMWs0iMooLwsX61kLct1mE1OInYqmW9faTamfECNaCj?=
 =?us-ascii?Q?nqBA8l8SdsMbmJUJr9CHN7/4U9/XetkBCT1Ll9MDoUrXrXXQQqwb4KTQcOf9?=
 =?us-ascii?Q?kCMwJu3s0eqv6YF8eA3mgm/9ZxAS53OZnAQ0RI/lfvJGLtfsUk6nPWJFdsMD?=
 =?us-ascii?Q?uTeKOsvYLuXT8p9FORSdqxPS9eRgXAUwVuWU4C0JJoB6wq1dYZVAhNCAQ4CW?=
 =?us-ascii?Q?BqNa4FcGX+qJbpJNVTlP8znzQYfpBeQDTvtSJKqFI6Z7tzq/omgLFxNF4tPh?=
 =?us-ascii?Q?B5I+iHwrfxPQUMntNlyLrDia8/B2nSMADpADU+m43B0EgfoRuigQfJvEEKuQ?=
 =?us-ascii?Q?n3QDp0+7omVB9/ZnFm9y7EnvaOZrld8u28wGtldjdzSAlTztf5IQKL4PpDBk?=
 =?us-ascii?Q?Fy9swkVPh5CgtzsLQ35A8AOsae55l8SPmE60PneGC131Z6jvBaTXzCxZVY1w?=
 =?us-ascii?Q?v8L8CZeYec5dmGAASM8IX7KPJHQZIlmaeKfjQgIGEk2T7KbWbIE8iTh8xrC6?=
 =?us-ascii?Q?0FXLpxav5e8fS6THu91dEwB7hKCOqMrMnzlAvt5ZMDHH7QIKal7WeOqtftIG?=
 =?us-ascii?Q?ACdx3cZgOxPGuh9bJyzUDKEdspmF2rWL/NhF4DsrOkbnfnLpdXh5cLNyk+Fm?=
 =?us-ascii?Q?i9kp6OcloGKF1HEffx/xto6U1wvu8RkWbIwa/aHXbt0uZENEvYwSk2EC3dne?=
 =?us-ascii?Q?yXbBCW/UBbEiHYJZsNdU0VHZAaHIM1YZJYoy5mpCMKlG3/EP7Wo1xWZs8rqC?=
 =?us-ascii?Q?/Jl0SXVYcRuog+XocA3tN+xgGmCd7aWCvqGC6fRKX0pHZAirQCWGvIqOICuE?=
 =?us-ascii?Q?AnmsfUo8vkY+IMa7vE0285NpaBlipmFxzC87MmzygPzu+UmYtfAFHz9KsoVD?=
 =?us-ascii?Q?PahQLzRhnl2yN0bp5FSwAWQBCb4SlgCDnFoAq3MAjjezS9+xYnx3P38pvXD9?=
 =?us-ascii?Q?QHHwhNMQUA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fb9e15-984e-4374-9ff1-08de8478227e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:24.4358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYHb3mJhM7Z5S/7Xm9KfuYRgr0fxO8h5BbBYEEl+58/AjIinur7u96SRQSFnB3b3XmayEtDoyxKjdOigTip+Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5848

Add extract_fmc_signatures() which extracts SHA-384 hash, RSA public
key, and RSA signature from FMC ELF32 firmware sections. These are
needed for FSP Chain of Trust verification.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  3 +-
 drivers/gpu/nova-core/fsp.rs      | 79 +++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index bc26807116e4..6d07715b3a49 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -26,6 +26,7 @@
     },
 };
 
+pub(crate) use elf::elf_section;
 pub(crate) mod booter;
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
@@ -646,7 +647,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
     }
 
     /// Automatically detects ELF32 vs ELF64 based on the ELF header.
-    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         // Check ELF magic.
         if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
             return None;
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index d464ad325881..a13d883373f0 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -105,6 +105,18 @@ unsafe impl AsBytes for GspFmcBootParams {}
 // SAFETY: All bit patterns are valid for the primitive fields.
 unsafe impl FromBytes for GspFmcBootParams {}
 
+/// Size constraints for FSP security signatures (Hopper/Blackwell).
+const FSP_HASH_SIZE: usize = 48; // SHA-384 hash
+const FSP_PKEY_SIZE: usize = 384; // RSA-3072 public key
+const FSP_SIG_SIZE: usize = 384; // RSA-3072 signature
+
+/// Structure to hold FMC signatures.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FmcSignatures {
+    hash384: [u8; FSP_HASH_SIZE],
+    public_key: [u8; FSP_PKEY_SIZE],
+    signature: [u8; FSP_SIG_SIZE],
+}
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
@@ -138,4 +150,71 @@ pub(crate) fn wait_secure_boot(
         })
         .map(|_| ())
     }
+
+    /// Extract FMC firmware signatures for Chain of Trust verification.
+    ///
+    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
+    /// Returns signatures in a heap-allocated structure to prevent stack overflow.
+    #[expect(dead_code)]
+    pub(crate) fn extract_fmc_signatures(
+        dev: &device::Device<device::Bound>,
+        fmc_fw_data: &[u8],
+    ) -> Result<KBox<FmcSignatures>> {
+        let hash_section = crate::firmware::elf_section(fmc_fw_data, "hash")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'hash' section\n"))?;
+
+        let pkey_section = crate::firmware::elf_section(fmc_fw_data, "publickey")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'publickey' section\n"))?;
+
+        let sig_section = crate::firmware::elf_section(fmc_fw_data, "signature")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'signature' section\n"))?;
+
+        if hash_section.len() != FSP_HASH_SIZE {
+            dev_err!(
+                dev,
+                "FMC hash section size {} != expected {}\n",
+                hash_section.len(),
+                FSP_HASH_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        if pkey_section.len() > FSP_PKEY_SIZE {
+            dev_err!(
+                dev,
+                "FMC publickey section size {} > maximum {}\n",
+                pkey_section.len(),
+                FSP_PKEY_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        if sig_section.len() > FSP_SIG_SIZE {
+            dev_err!(
+                dev,
+                "FMC signature section size {} > maximum {}\n",
+                sig_section.len(),
+                FSP_SIG_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        let mut signatures = KBox::new(
+            FmcSignatures {
+                hash384: [0u8; FSP_HASH_SIZE],
+                public_key: [0u8; FSP_PKEY_SIZE],
+                signature: [0u8; FSP_SIG_SIZE],
+            },
+            GFP_KERNEL,
+        )?;
+
+        signatures.hash384.copy_from_slice(hash_section);
+        signatures.public_key[..pkey_section.len()].copy_from_slice(pkey_section);
+        signatures.signature[..sig_section.len()].copy_from_slice(sig_section);
+
+        Ok(signatures)
+    }
 }
-- 
2.53.0

