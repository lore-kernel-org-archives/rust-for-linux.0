Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C2A2F28FF;
	Sat, 11 Apr 2026 02:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875822; cv=fail; b=f2R3yimO2/BK6qBerml99gBXe6frj8jKXYsVaU/4ol/N7rF5fdazTnBCLftPZ2oC/G0UrsDSxantVrEi4OnXZbI9kREPjIKqTuFZyRs2mG2R21nhIInwXvXaC7JKjOvCX+hBmm6NZJcA5GJEZi87pVRpyMQ57eE9EnBkOjQGY6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875822; c=relaxed/simple;
	bh=G/yDUyRD2Z0su73fXnBg8hQvnui9lWuPWNkaIXyRvqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I7VvA2dSaxsjj7q3dHmHMSbznI8Fnv3J8hzAFZSw1mDf998XcnnrRb3rFragM4CBcoHyvGkV98Pz1Oy7JeGUCrAX9frmR+701yeZi1f4at8unoahIJLXm4pK8FGBOvkwXa4KtBL+GgbPSHSvQH/kAUm6YlxFGz59Y3o074pEP/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IgR/0gQN; arc=fail smtp.client-ip=52.101.201.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IgR/0gQN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQVfFbikKDyHCYwQBoB71em4dKnSg8SOwDhh6NZxhJBuiEW6RIG+wFnDtIRIIkB9JV7SWjZVVyGUwHlIO9VKq/L5CDJ0RupPsKwEqcFtIXQi9Fv00o860mve8pXg5duBd70vkkXFt4uLmWrNjUyEoKXIOt2bYB2fFSvwTLFSYPGSap9a0OJ4mPxz86cOqqZuQrNZlmc11H4D8RrEZeZt9zGQsM2IEzCEYMqyl1ITVTHGaMbC7sLFCbW17FnolLLmRkEvJJnWv23ea/3jftlEhKE4DcRtDrA/LjLAsVg57119e7zgU4ESCS+Ipj0bfKZYosgray9Dr2q8CoiHKAK8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZiM+9yozBWV+Mg37bFeOOpkMyEKVlUTXsF6V0F8JG8=;
 b=r7IT7dUfAM9NMFi8xSA+Ad7QDxxuUgTbhe5ZoqwuoDP2prBIynPkCqFjUuu2F0GYq0ExpWhCwj2UiYftSxLX+U7r/vww8jzSEFPR9HmVE2zzqmjNMHWfl1xLlKH4rzsWSI/vgjjicMrciTpy0YYdajdF5QX/QC3WX/o7nJE4x8DhxG8cX2Po+82f3hoBs9daAJxqt0v9yv0xXGDq8X37CJMlvNkF5mejf6wFqIkA+kBt585zat5a//V2zQg/x/V7VxzcZgjBUIUT9j9cgkSm9GQZDYwb+GGb0LCp5OGjmNgQHnbAfvvzAxvc4aZjjhiz5PX0LleVvsEFczc8EhwKkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZiM+9yozBWV+Mg37bFeOOpkMyEKVlUTXsF6V0F8JG8=;
 b=IgR/0gQNUgkSFxT084+NZbTySjvxSsaORrwcrGzDXg+HTgAmEFQWCihCYeJ23K4nvrpkLkYZMM1h6YxrwKjX185o4OzefZrvl3oEeToxH+X0hcx9I3ZayFGRIbuVTENiQTSgzStMKWMIHb4NpuSqrul3UXb42riGx7UQ4cUFgv2quzg2LKzMv4ik2vMV5Mk/+pvJGkR1J2WxKcxOJg6dSoOHIdw+CV1Mc3nmD4XmyqRrMzv7JTtl1Kvse02E8UPRNjGk54+3df7hja4olA9DzGtSU3OCNyTKGT2i9VFjw9by1i3QXmuF531hLF+xJwtecbRCYjBT22z1ZS8yYWuWZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8794.namprd12.prod.outlook.com (2603:10b6:510:27d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.15; Sat, 11 Apr
 2026 02:50:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:07 +0000
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
Subject: [PATCH v10 08/28] gpu: nova-core: Blackwell: calculate reserved FB heap size
Date: Fri, 10 Apr 2026 19:49:33 -0700
Message-ID: <20260411024953.473149-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0219.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: f6907e36-6a37-488e-3896-08de977509fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9X33gbFlpe0ivYyAJ3iero37S90DJX0fx07ZowwRBkJ+YOS9YzmaG/8+CKwfe2OU1OpLMN/62Pr3gUuq4fYv09Dj/Xs+4fZequ1MNoUMVd+VazSL8sOCid/fhznpV4I1srT7yhc5GveeVsF+nEi82riEC0ZrfjdS3TJWg55Jp4yb/ogwrcI0q721ITadz8FSjN2HKDD66yGRdUJBqpxlfExrF4nKQDAw9NhO6OwjYLSRTT6ZVflsTMYZ2o3eAGmbbU5okpF8iOCb3Y03z8da0Yw/BdOloCunGj/dzuf8/jRp8Z3mf46evTQKLTErCcpUmeM+O1gmHrbD/Vsc+JS86+8j9N3GCu5PEV9aMR8rPeSEB2URwrvwvzpmwBLBtaqiSyjEgE+7aUUHFJddNxZTLDcT84x+ke680y5Gf4G976JGbBs2y5NOAMMgJqqRnuR0v/8FJCVl9dqPmyKvbv5dFAp2n7tCxSYlZzi3CDdM/c5moJolz5sb0tdGVQc+vUHjy7lpdkYREZjh34I6vKwSNdzA3jHnwFBIxPk2u2YrslXKGeHPtyvXw3R9mGj1yiv2KMoJw1WaJG8UDY0jVmLbHFHtLdw+4bJWgttWPQBT7f4GuKKD7F5JJNtLUD/HX8KfZxmhSsconk5ZjF0oOGIG350J1ul5DR1jhb2Uz+Ov49HcjCtF+X3OdHHHon+8yEekJRFtB1K+PqJAdMZZ3JRtXnrdN/IUqu6R8H/eXlqm1D8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A/6MtQ11mVJgrYITE90TbVC5rEXG6UXXE+kZPPKt7AcI6H5rAaLNnrGMnede?=
 =?us-ascii?Q?eDo8yq7Z9I7MxllUxIPIt8JlRLw6gxUBDcm+F+p7iEG4qz41abN5Uy3tps45?=
 =?us-ascii?Q?8iEY2e3Q//0sD87depScS2IkLbIpiycD13Wd4QKPbkBrZ4EJWynAVmXcLGqY?=
 =?us-ascii?Q?D//nmtXKW32ZJM1uSkdJoaM18fs2D/EuuXlm9nAMAchTplzYXRJTgfaK3D9a?=
 =?us-ascii?Q?Zhw9DBNaBUC3YHvS6k38nWRsZdFHPUwCH4CQZDlm4jEPKM2srYXHcopqtDro?=
 =?us-ascii?Q?VdIXi7IPMiW2Oj08QxFkyvx3qhjo8kERaISWt8cBF76f1bhGBaTdZQ8SF4T0?=
 =?us-ascii?Q?btCVsvFFDe33PGcK7oDKmn/4NuELH4i0UbZ+GZb+JM0k2RdHZ4FZ5MBKhUyv?=
 =?us-ascii?Q?nwAndrCWXBAfZcLBsEc/6CfWev/GwyurtM1i7M7dAHcWcpn37muPfTKXDL+5?=
 =?us-ascii?Q?Ctkct0qJrYV6ewy0rKuXapsE0F+sTGnn+KifYl8CMdIEoTckVJsqOPIXwfha?=
 =?us-ascii?Q?t0nthhDdqrmC0DFF7vWwhvzYaGe2NgyXfNxL2qNyzYAfgAN6Gsa0AQ4kyzHj?=
 =?us-ascii?Q?8RvAyhmjAfJz2wk6vPhWgEgG6pxysJh+VtN0D+hdS2Yyz8CtwU+oshCsEulc?=
 =?us-ascii?Q?bePd0gYVAveNTYCZu/mBkSfCAiGG12tzVdKFrasrKE4W+VoxN20YRyca7Vyd?=
 =?us-ascii?Q?m7YJCyhjLZLR8gqgq8qom7FLbx+JCDww+V7D8ezK+ojibAYUOBLpYFci1Ftn?=
 =?us-ascii?Q?0/W1e1SaMIx6Q46H6k9CwBsod+ByTon+dyI09d6nfgguIoOXX2jcEgEp4AbB?=
 =?us-ascii?Q?x40uHcsT2NKXCC3cx334XHS167brbVJcbMp/ckN40ti00acPt2fCi7C8Ocer?=
 =?us-ascii?Q?ynYWBwT61Nyc62bWZY7JQeWjxMA3PSWhmL/Q5a4a8o+6lzpFUCoHzhGpTXTW?=
 =?us-ascii?Q?Zms/ilEPtmkpNoB0GrRGPdineNkJvy98ywX7MC7vOZ3P1DgMHlT7GByYPCgQ?=
 =?us-ascii?Q?QX6sGdj6Lznv23p28IT062qUj5keVExn8c+msBRwBMTw2lRY1cLKh2uVKT47?=
 =?us-ascii?Q?1DZFwlFEe/C/eabniJj9OPjkHya2mQZYQYynPeJWR/q3rDKl/I8iMgBRg4kK?=
 =?us-ascii?Q?DDwHi1D0hNRzjcGAA2VXuh13PyTyTyNdxbSkxp+zOy/Vtl5APtFW0TpCnPKC?=
 =?us-ascii?Q?DfYiTZ9TjTgBJHtrxFxsLW4fbdKSFyjh/2VEakKA9Dnd9CmTGt4yuUi78Xol?=
 =?us-ascii?Q?afiPH5tpXHofMXQlhjcKvC04oNXqf0IJI5BHKtP4cszGxto5wIWTmRj5scPL?=
 =?us-ascii?Q?Qpz7NgJmQhEoJf85nJ7C8lIYbQgAqEu/eDQF8qyauPzArYUXq2FKYe3JaQPw?=
 =?us-ascii?Q?ur7cNlvQTRtM1Qy39Hp0Gt0bxb/fvNdaLTOg5hq6uOpznjClY8z6wlavNPxN?=
 =?us-ascii?Q?Oi/rA1TZYoHHN4nFfPaZnIg5K2DCGQyaOr5SNtdgA2gbNfvXx/JayIlH4X+u?=
 =?us-ascii?Q?IUO4RIdgKUtaVF68lbfj+AvTeeMKUdlIYnmr49apsUTpfdu1WTpBASqkV/2N?=
 =?us-ascii?Q?ZjSUCxAZ38xZmaqYKp0tWhMpwsBY8ombVZQmpS825rV6ehSrx+OlHB8GWAQG?=
 =?us-ascii?Q?QaTn/WyR5Amot5f6TLb9caZjewvFqM3+USS1ewO2a0GuO89a5WqdOzgRN6Pe?=
 =?us-ascii?Q?GGpsdecXbgJfSgJLbLVVmazLFCA6ckib9U3zy7RDzULXnDxlFNILZFEtsIYs?=
 =?us-ascii?Q?pwdGpO50yw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6907e36-6a37-488e-3896-08de977509fb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:06.9316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tISdpidkvQFYY93OWturJwWz8iIJcQcU3gP+GeEf/glxQjGEmHo4q6zPMxeID3X9zNdgtc6GxT9b8Q7w+AVmjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8794

Various "reserved" areas of FB (frame buffer: vidmem) have to be
calculated, because the GSP booting process needs this information.

PMU_RESERVED_SIZE is computed at compile time using const_align_up() and
applied only for Blackwell dGPU architectures. All other architectures
leave it at zero, matching Open RM behavior.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 38 ++++++++++++++++++++++++++++++---
 drivers/gpu/nova-core/gsp/fw.rs |  1 +
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 35899e9b2560..c2005e4b4177 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -12,6 +12,7 @@
     io::Io,
     prelude::*,
     ptr::{
+        const_align_up,
         Alignable,
         Alignment, //
     },
@@ -22,10 +23,16 @@
 use crate::{
     driver::Bar0,
     firmware::gsp::GspFirmware,
-    gpu::Chipset,
+    gpu::{
+        Architecture,
+        Chipset, //
+    },
     gsp,
-    num::FromSafeCast,
-    regs, //
+    num::{
+        usize_into_u32,
+        FromSafeCast, //
+    },
+    regs,
 };
 
 mod hal;
@@ -168,6 +175,8 @@ pub(crate) struct FbLayout {
     pub(crate) wpr2: FbRange,
     pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
+    /// PMU reserved memory size, in bytes.
+    pub(crate) pmu_reserved_size: u32,
 }
 
 impl FbLayout {
@@ -268,6 +277,29 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             wpr2,
             heap,
             vf_partition_count: 0,
+            pmu_reserved_size: match chipset.arch() {
+                Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => PMU_RESERVED_SIZE,
+                _ => 0,
+            },
         })
     }
 }
+
+/// Returns the PMU reserved memory size for `chipset`.
+#[expect(dead_code)]
+pub(crate) fn calc_pmu_reserved_size(chipset: Chipset) -> u32 {
+    match chipset.arch() {
+        Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => PMU_RESERVED_SIZE,
+        _ => 0,
+    }
+}
+
+/// PMU reserved size, aligned to 128KB.
+pub(crate) const PMU_RESERVED_SIZE: u32 = usize_into_u32::<
+    {
+        match const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()) {
+            Some(v) => v,
+            None => panic!("PMU_RESERVED_SIZE: alignment overflow"),
+        }
+    },
+>();
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 3245793bbe42..5d36604ea1a3 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -247,6 +247,7 @@ pub(crate) fn new<'a>(
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            pmuReservedSize: fb_layout.pmu_reserved_size,
             ..Zeroable::init_zeroed()
         });
 
-- 
2.53.0

