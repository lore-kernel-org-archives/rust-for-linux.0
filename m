Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15303FADFD;
	Tue, 17 Mar 2026 22:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773788072; cv=fail; b=YlLd9W2uaCN/guO/62I/tjdoK84DRKtbiGS+GwmVrZVuZVMKIgq8Fe3YfkDwq5kR2D4BdpNLQeMBSpJ1XHLodYIwgRbKODi1nUf5mJBLaKvnjVTSc+jXUlF9MD6Dpbg/xcc3I3N6kl61YBCOjL+uBMhxDzNnlqFpe8H7lQvYKZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773788072; c=relaxed/simple;
	bh=vL9HN7MusoVWBLbqmQwTxH/pKiP0j46BQiaAletpib4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HEKuM6rcgJdOX1DHJCj4VduxZJljeteezK/1kymHFWt/aBtypK3rdCjsfeUAyxkL8wEYXGUurxZHhBSrIsFNPhGlhpzRtDapzJ2N16GpeiO1GrY+ecPsGf8hnRmczx/EmN7S1/Zn9f9WTn4vQRYG7Mz2bIN0EwrkFI8Q74Fdids=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RAA3fny5; arc=fail smtp.client-ip=52.101.43.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RAA3fny5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlRiHdosRC2JQcntwMLO7BHoq28wyaHiqOkytGQQ1zgk45mLGIMan9X4+5vZ+D0wEd/XdGhPPk0fT6i41/urMsg9yQIQFollrjnmWSzmkdTdr8eMehfufI3JREhWakh2tz0cO/zpTL7Y8Z/4Bbkoi85olGfZe+3gNMj8ImGdaE+uS/jlExA+svJp1QyTa4Tt1fGfVpQtBzKlaJBuWuwGmDAibYceV6L3dcR5nC0oFlVuij6B6BHM4UCas/I/w7pZ35/9XE82E3Jer2waVKlTwTjAovxvaPDelJteBfIauhb0vQnfiEZyD9NnrHDl9Kid9QFjoCb3wDe7hSM3BVlMMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJbrdlRXmMxHiM1B8iOy9zGroCqW0VN7hNJtzr9a3hw=;
 b=EloG94YYWP0gBh7H3LjM/IcNzWWYgGx4oCUOQ0ynpp4+NjQMunCFvodEQ33Zzu4O1UwajgoMj+5h8tGpTf5GthL1cMO2H2Z7mjnoLlEGa3h65fPxtlM2pyros9RSMC73woubIkfpTEX33cZqhw7Yucx3+BNyZtuB9d6zJhzdllU87x5b5VC6MuVF5lQ7Zo+hK58JAYdLsEBMyxHR+js5DZQ8tzwjqnr+4YGKRKCyGLSJ84x65pa/stXub2Mpudzyx798A3KptobAxdwyk2HLgVIfcQvIL9+tV2a+rlow6HHKfql3kXlGnYHOLwLlt4tsUu34k1JznhLbPSursr7grQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJbrdlRXmMxHiM1B8iOy9zGroCqW0VN7hNJtzr9a3hw=;
 b=RAA3fny5tnqigVbhgkR9Kj0noGVHVsNlWcP4EOM1TCT7S4B8JTA2QKCPMCv3Crm3qlIfZQT7sEhRy/Zs9OdN+H76klWVjbrDzrBOEWVtpWea/3/piivTlTBXU1T5o1K8v96fPzjI8IPV8DQnT3XvznK+f3VGqxUGpChaKaQ1TkoYbB07uG7dsayzOTwkRSE94BOHfD+ND6i29kLm7QCyFTfDUHIHZmeRDDNalze4Et8owfKEe6TmeK3YJCxJ4twnrEiLu/0S+jZgCO70NngbSspM4WLmtSJm9eKmvOQL92sIR35axtX7R1oY9xSy5T5w20C3yumqRZFdaS/QCBxSGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6489.namprd12.prod.outlook.com (2603:10b6:510:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Tue, 17 Mar
 2026 22:54:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 22:54:20 +0000
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
Subject: [PATCH v7 17/31] gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
Date: Tue, 17 Mar 2026 15:53:41 -0700
Message-ID: <20260317225355.549853-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317225355.549853-1-jhubbard@nvidia.com>
References: <20260317225355.549853-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0298.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6489:EE_
X-MS-Office365-Filtering-Correlation-Id: d0688f6a-9ef0-43bd-997e-08de84782029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/vtQvMy3BHj8L4qhe6snzV5yiMpV00/cywGTrw4UpQ2nqggP1f4D/+z8Iw8OCUmlnOsgOPPaAmWS2IoEeAyvSjBrViWICPmYuPYOlyQOVWb+doPhFGsUfyIAobVfJ1ZN64HC1QbrBA5FV/8qRAsE0WR8auSIcSsVRljHVOiS9AF36rF2Fzuo02t7GJceap/VuFiVuxwgvgDGvwIREuwFpYEBSZgtmVwfCWSXW5uiclKweuTwiY6crILSdrhTvXC5QI81ZkEEoM11A3qbeJStV4zFJUOn/yQiIBCv3iPa+IwFCH/MDk2bbeYs0hEEMbByffby0JOdQLMNFJ5a+EHrt3W720eahDAZo/mhM0WmHucwdSrTk09x3Lt/kzjd0rM9pqnvIn56rcvuqJ6rgaMEJnD9uB2kiKl4SpOiNfH5EtttV5B6mkNZJamV7IP+z6UKU+zeKoKtMC9tYR8PhLhUxe8C2PW2XJ/dut9Ad0SLtDPI8rF134uHbf2iTxuY0+iYAwOTbPTrMtWaydMSiveDTu2W1cPz8R57YcFDaT4Xd6bX6NFCRLoLy3B1MbzFplFIa4xKIt2iTRFAir6Dy+kHgeDB3KyYwTDlYMWu5C+UFCijIlHfO5DsrxMe60mB3nI6ttXlxyIC64sF9QqzwkJb3vpT0JJlIa0E06N1B4w8H3fIBm+lHZNpyZBHMO+vmpJrxwMQHFs5HoltDKrdTplRoecjktyAy9LQqnVZwUuviIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i7gVB9i9NUemf2yKMUtkI7XNvMzgNvQUXUybZLpyyJhtCW32HoDNfDYamz3x?=
 =?us-ascii?Q?ep5vr2Cj76ThY5kGqZOKdQoS/uVeGFjklTBY9HEAJQzEakDmrYQYO5Od2LVY?=
 =?us-ascii?Q?pvosxA5fw1wp6wkVamiAWT99XH0EpDAT7NQECCMgGFBPjMdUv+FyX5TRAvsF?=
 =?us-ascii?Q?M2p/EC5dOL+LDR3JaXC5KFqEWyq45ld0+p0sJ5u06BXtPi/YVK+tMKQO9sFn?=
 =?us-ascii?Q?81sebcNjglt9QcsktwydQbv5PmMEKHtzYchptDfMUh6/RaLK559ldVrCqE/3?=
 =?us-ascii?Q?x0zN1yyk+uo8bNaIeKg8gIjVhM8SD6wDjN6Q61B9DVEIv1ftmKicphoT5n2w?=
 =?us-ascii?Q?gduQv2dik8fsKAeUQ42ytB+R2Ky/CNqeimhcvlv2QBZ9TS9+o5p4w6drtldO?=
 =?us-ascii?Q?r9htsYfVLufXrkpNhwA43/KR60Hvz+tlSkhFQw9SB7lXscxchNLl2evScOSh?=
 =?us-ascii?Q?FNkkkbT6vN3gqJCJz5OUnNNRSiF7vQpc5kHJQ9gxkuZrmRPpWndRObYMF5Ce?=
 =?us-ascii?Q?h3t4ULe2+E/blNvrGgd/n8LKlb2rjAtrE2VjSscAB5jLqOXBAOKux/NvmE7D?=
 =?us-ascii?Q?MEujTK3S8wHua+6OFFJcQ+Kef+rqXEnp+CQ8xkArG8MlUf1K9Qklc+BKEVNK?=
 =?us-ascii?Q?K6qZqzPAShq6rJCmOhwQPIdJ/N1xslPbFmOTlnXUs6SJ640Rh7/snkIE8zLI?=
 =?us-ascii?Q?VAdw9jrkwDCeQs0j65njE34fXzo4s631rvg6Bh7DNyzouGZN1LfXoamkiXEW?=
 =?us-ascii?Q?PZ6XR6jgmUWGlTOBvrVZo/JQvSbvFjrdoRnLHPHW3sCqAu6WfeLsM1H7MwzL?=
 =?us-ascii?Q?3bGLXcynRWMhiPBGIz7BF9FLN2EcM1aiH9NBcDnjz6VhUUZmR8Pr8pL6VtMl?=
 =?us-ascii?Q?Yy/3G9clAFJ/K9N2wMDQOY811bfX7EJx34VbpZO8qYqU0cXKojD1AwL3A+gv?=
 =?us-ascii?Q?tB0BGATuucIHYpCPlp59WmqdzFbYl7rxe7Uv96fTH8RLyUkJRp0E6lN+xBmK?=
 =?us-ascii?Q?enQ0WX6cSzbN7GqS7E6MNVkQh7E1iyLY84SG6FNspnG4fZugdK5bv5/RrpcT?=
 =?us-ascii?Q?A6r4K5RPaPWIfYS2IvtMQ7ecuZPLwf4dK6I2Bjav49XV89ScAC9lgUs2lm4b?=
 =?us-ascii?Q?z/Np9twHBOkZeH0nf+x4O/nJRNtEitqG0jNMXINTeT/utD+Aaae56dfn23wD?=
 =?us-ascii?Q?Qfu8nJJ3WzOZ8BYHYJD1gNYHv9ZtaS3n25mz2k1s1eYdeCBdioSaK1kkLTA0?=
 =?us-ascii?Q?3lKOzVvwPmHWdiEty4IJ8l6XQqc+9y4RFDEQoVJeTbFgFUd5kJfH8DRnLTrd?=
 =?us-ascii?Q?ZZDQYrqe5LQJDvYJdh7iTnTlyC75JypkVUm0opUxkvbBsjgR/fTsf14jhliv?=
 =?us-ascii?Q?sIJKl6zQVvJJq9troAXVlGY+lrOVnh+48iQZDLJyHCAiCSMFiaYIFUW45jHk?=
 =?us-ascii?Q?+Cf+KT+LEPBlJK6l6Ge0ihcN9wQlowizz/mQpzC6OIj9ySsPBz/rlsb75DDU?=
 =?us-ascii?Q?joqeFFa53ITucEW+x36SsYt37tUKN3FvQ3aCOoL6PVHeEzwOoQTvBDlRdSNq?=
 =?us-ascii?Q?TqozXMZcSpzDETK6ld0FcwziYckFnhKN0SYLMOgsiYL7d6+VtrQ+hB7bWRJF?=
 =?us-ascii?Q?XtJ2NTEVVx1l3s+1m25+0hU/htTXtueM7dnzm6KR2V1Y6nWw4yU7SGhatcT7?=
 =?us-ascii?Q?QDAx/OR1dD9wLvgYkwoxZYNT+LGp/bvDAQK4+JcHw8OyN6dc6tphSdA3Agmm?=
 =?us-ascii?Q?7pvUxPKehA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0688f6a-9ef0-43bd-997e-08de84782029
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:54:20.5445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKzZuQN5RFty/Hy8J7RydIGHcfTikDUOHA7vW3o2pQCTfsnO2bxFNSeT8N+cBeq2Jlb2fiW46nPV6T6NwIQEMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6489

Various "reserved" areas of FB (frame buffer: vidmem) have to be
calculated, because the GSP booting process needs this information.

PMU_RESERVED_SIZE is computed at compile time using const_align_up().
The total reserved size is computed at runtime using Alignable::align_up
because it depends on the heap layout.

Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 8 ++++++++
 drivers/gpu/nova-core/gsp/fw.rs | 6 +++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6536d0035cb1..ffb996b918f8 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -10,6 +10,7 @@
     fmt,
     prelude::*,
     ptr::{
+        const_align_up,
         Alignable,
         Alignment, //
     },
@@ -270,3 +271,10 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         })
     }
 }
+
+/// PMU reserved size, aligned to 128KB.
+pub(crate) const PMU_RESERVED_SIZE: u32 =
+    match const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()) {
+        Some(v) => v as u32,
+        None => panic!("PMU_RESERVED_SIZE: alignment overflow"),
+    };
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index a061131b5412..92335e7fc34a 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -26,7 +26,10 @@
 };
 
 use crate::{
-    fb::FbLayout,
+    fb::{
+        FbLayout,
+        PMU_RESERVED_SIZE, //
+    },
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp::{
@@ -255,6 +258,7 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            pmuReservedSize: PMU_RESERVED_SIZE,
             ..Default::default()
         })
     }
-- 
2.53.0

