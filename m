Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C883A5E74;
	Tue, 10 Mar 2026 02:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108726; cv=fail; b=umJSzZuVqb0Jx6QQHUz/QWKEgixfMXraNLMrxJ3r9pPYIixLUGAFtNMQ/9xXFy+ZYR2o7GsF16RvrImxg9zdTxwNGBkUvw+PJ34qf7DPzetowW5LiEAJrENj5e5uhqRfpSqvuelOXFCXPV/Q0OaJoBq9kSAxA8ONShUitu1No4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108726; c=relaxed/simple;
	bh=X/+rCOaTv1gSgb/b7n7VyWjOMJal7KsprMZYIFYQgEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dE6G9S7v8Q2AOJ/sQGjerp1gIa78xxklTgjNWuNG5PEWEjDX196VJZtAOjsAcA07cwfSK9eX3RCHrOwDrW4jk3qY3BGQ65/YdLZmcfGbEkFrdLHzlX9tsZJmT9f6IcVTzjLkAwGK4MzIZR0XnfH5wM6owMrwW0SCKxTIeDpHJyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RVMnkflB; arc=fail smtp.client-ip=40.107.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RVMnkflB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUKb5C7bZA8h1KZWyyvXlO1RJS5EwMZFp8o6lR6ao4cI+6cjq6cPyplENdz52gcaXP72ERUOxh4FPAg4raC/A3fF3INvTIO/+Pom4o0XnOtzWOc5R5yTHc9Kshbbdg6UptvmOlvI2r28hcuTJGdy+sIK3tUabp9Uq5op1ErX+SGpPJMUP4IFnFSNmcAqI/YhN6sPidnCDxbFrwpXBJDj1d3W43VJZCtUjRSK3gW3vLPE2WTu+qcv7y/nPqucXWp0YSZdF7Dd+1lgOirFq1ULPv4WMS65bFYjqLRTAm2CUlUtFpojG9InZaZ3cRkegezxGlNTPuBN1avubJV1LjhMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CCLVFEhmaER5nc1kE5xsTkPoszNSny9/DgVxQcLE+E=;
 b=QUDtJUx3tCSZq2pwJm34HGa4FrUKcSyEh4GLurbv4NTIPf2gzTU+/K+iubYCn1Jo3fXnxB3igPnvIL105FvwJz3o+SlUDb+wTQ3Kp/xbXZzq2pNGQSMOiAxgL/zvxpPJxjMylqaEZyd2PQPGaiFD6j6kZ8KskvRq/4Mbyi9tecW9k7TD5VKms1jI44112lOc8Za+ahwv2A84X6ozCWG5X90pFpTbOaixROTJRH6SWdFbw2BX09+coqc/a05LKudjXWUm5z20fTE+EAXn58Z098m79Z689HEsN7IfqPbchOD894xUZq4tQ4LHgRt1vUHHZjeHYxPFTu5T2ON1kXOznQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CCLVFEhmaER5nc1kE5xsTkPoszNSny9/DgVxQcLE+E=;
 b=RVMnkflBM73hsT3rdDBTTGeXpOm4IPSG6+mG/Qa69JctnCjAPI62PX+QgZ0n40TVLeuxIohBvkCoTOnVhK3QcZtqonw8+VMVFxM35+x6g+pY7eE63DPE8E80y7oQIyT/hCqSS5KkbsZQcSEjOFTkH3I7Wyi40Bvn5VsN5NcCuwFV0SJueH0YQvvUPHxa7OJKcKiraHhInb7a1n9TIl6H0MHarT+SRe1uyJ2WrHbF4xPd/K956fC8E33KZATeisQ4Y3TlbegT4fr1EhIo7kgg6BiqOwnBxbSUMMtRi0y9T+l6pw4fxxSzsooxpVn9WJ8Tsn7xgUFsvj6H2L5cG11PTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:11:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:11:54 +0000
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
Subject: [PATCH v6 20/34] gpu: nova-core: Hopper/Blackwell: calculate reserved FB heap size
Date: Mon,  9 Mar 2026 19:11:10 -0700
Message-ID: <20260310021125.117855-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0030.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::43) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f9ae6a-b7d0-4496-e0f8-08de7e4a6678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	ZshHMZO5GV9Hfae+3MNuapq6brAc7b5ldgLYwZnumllRrxzIW3FrJVC1qeF/GjJQbrRO9DoG8nJvqfduRRqnKcHaoyShu53SXjo9e6Qyg/seoUWaRjOnpt65zbvzTowN7M+xeDMkc70FtMd8xVirvAfEWJf/MZknbo31C57coo+9hnM+PEglImriPJqaxrDw4zdKYyeUlK2fdAWC2yM18WfpkzYSrMhgjJs6uBx/4XtP5yIIjOh+sJueiH1U228dHYNqLU2qvIQF7NoS95d7T8YyKR3dM7Krw+GP/JfzTOe5qTDSKcfUMKA3fP3j0Zv3htJc8DMvSuRDX3SJ3XmbyR/A/clN6iaZBESxmrqBWB/bcHm0alf5KydKQOKMkJCnT3Z9F300R9vEW152CBx0jhNnP18rc1Ri9v1rsZ22tHkkb16JA9dMAopbmYwXGQNUHE7jhZ6A4xYAM/YonnMeP3b6IaYVJpjFE01cBFoVMVFJDPjD8hW+rMjuXHicRvnP7s0AoSAgUf0e37abougm3jSzN1iLxUrND1mC4YbuKI7AjfritDqzcAoGuyoEwbrMaT47TUf73Iaw5Yuxx7BIHNAs12MVXhWYyZ0aeDYsunpju6HfHdpfngewX4cuO0iKyh+VihMyZReFaHknOoikxnG/jnmajCo+7W4jvHKXT30cWlF1huCvYblKigO9P8bF6x48a6vA2gyHwfZ0JNbBWrrLGrNVMrIrw33Vqt3+ZQM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZdRKjKK3NzpHnzyFMMweoDNEazrhDh4bx4bQ/I4KZwnzkRox2B5hnNEPv8Qy?=
 =?us-ascii?Q?xXPDryL5iwUldXL6gOaSoPGYA9BXr/V1gC/fzbKuFS2VSqjXCCsTwdMf6TZn?=
 =?us-ascii?Q?emuw5aZKRefGBWXITQB1nTQWRhyz9SexkV1XsU5NYL+5RHC8PbgXwJFTudhB?=
 =?us-ascii?Q?shi6CyiowHepO/H8/myqoqm8crCqQuA9fQE4QgXT2sozuCpLj9TQRBBBjaVe?=
 =?us-ascii?Q?v3JAC2olLz//WG5F6loDr/hUhmuU2o/NszlyMi8Y2swi7bJPflfcmY18mSCE?=
 =?us-ascii?Q?HNrmGvtGmOycHSNh1TxEKcz9W5tFEFtK42awMTrM2BvQfCNgBBRAbziXWb1p?=
 =?us-ascii?Q?ewqQL83vWr2mLBrj3+pDn7+7shBpB5yoXtH2geAv0S4BmZqme6WVYay1LUI9?=
 =?us-ascii?Q?ohjc6YLy8fX2/T/oV6elT0xq7p5kjsBuJ0c3fwYJHWMAvzQykv2Hhn7ca+sj?=
 =?us-ascii?Q?unlk4XQ6fjXyGP6u83tnAY23gBsl7h9lzVihfrIV01oFh4THyQJyrlheaUHQ?=
 =?us-ascii?Q?zJv4vAAgZX1cmCxFFmSNYD7jN+Nu2iE32Ty6g6BNKzJc7D/HjKXYkQw11xV+?=
 =?us-ascii?Q?BIBfugzGFsnLgAq64TpcU7RzlJHjvXzbAFjBZgzCK8BokFqMkxWis6kNfJqf?=
 =?us-ascii?Q?/KmMKLq64HqandWwKd6PjvEKqK+CKn6P3jpsJd3JdZ7RH1OL/rK8pfdrT4i7?=
 =?us-ascii?Q?Wn7HDrV8aOluNIm6kqWJTl7lHoWMTsobxea5GHdcXtr3WNbH3mForMwT5zoQ?=
 =?us-ascii?Q?hMqFiUdKQerl2+qN+Q3knD6CqmPezrTqlBA02mxr6hYGs2vvvGd6TL+8T7kU?=
 =?us-ascii?Q?vOJAiwhAIevdkRjGKcImnlQHZwcJDXWpIMAG/ND+PdMikPQ6eGC2w4s3Uu9j?=
 =?us-ascii?Q?oFjr020rTxnfDmy/Bdg1n4IoRtzzi7iNJe12BJsUNjqv4Hlbnb17K5NRCa6n?=
 =?us-ascii?Q?m0dFQzfCd7RCz7XJiWmVj/e/CiWlfyNJl1W+4EdDJING8pZ37x2zPWN48KGm?=
 =?us-ascii?Q?SF+dA0kSa9RYHmREPILVbypNxMwGhh+BeWaRtlXdEGb1V5oL8eJNMuI/cp7b?=
 =?us-ascii?Q?ElMAltoMd1PsVh5LndGp6F8EUSolvoJ9Y96nHZqf1318sdkM+B3twB9FLfX/?=
 =?us-ascii?Q?5CWiARO86po5owvw+d0WtDKyfW6GliGCbezUJQj5Yk6/UHJ0y2P4XrjpXimv?=
 =?us-ascii?Q?sQsZOjiCBqrEuB76mE8DB6SITcVh7tcxPVxR5rJStf7o6BOLqYJGoZEhOuXa?=
 =?us-ascii?Q?z+zfZe4IWfRF3miepxjCPU+kXQ41qRZh+BTua3ZiAv8KcPshviqKIZwI9dtl?=
 =?us-ascii?Q?LOYtB47/MhtgDClGil7QjXgIQ+Do7NSyJQ4gviGOXEeAiYqkNjLkSlXHC3fO?=
 =?us-ascii?Q?VdDqqzcsKEfArP5Wqf+oiwcKWPQY7VCSoxGARRin6GeGRnrfb5zsvN6C6Do2?=
 =?us-ascii?Q?9Cl7smTuG15PMXBply7mbCWOhVus2mi3A/6OMEnBaI/gChUL+FhgkEqc5tII?=
 =?us-ascii?Q?4mDpXuni9i947BJt0ZQrR77XwZCBvZQFubJWIvWkFzNNnNqGgvJztbc2Dzut?=
 =?us-ascii?Q?9lhplYtODNPNAQVPvCy5wJwZtSTQoshKSr2T6OxLQIX/+2X+C0J50L8aOTcK?=
 =?us-ascii?Q?PlPlkAau4F7cntihEqH5hSzCptUyTFSBDmAa2jfUIa5pfCoJtYGXKy4VjE/6?=
 =?us-ascii?Q?HUuRMXn+V2NJoUpl50fsiAydCKp8fcURT4ZShEwefwcYO2XLD7uV/kjdVwd8?=
 =?us-ascii?Q?Hf7++zaZsg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f9ae6a-b7d0-4496-e0f8-08de7e4a6678
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:11:54.6534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whaZ84UugSdt3jUAGFO3ZVdwbxohcomSri53hSeZArTXjEnimdurBfbQlBHZrWfFGFDRV+kuJ3mAPeN/shp3Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

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
index f1797e1f0d9d..c1f76659dfba 100644
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
@@ -182,6 +185,7 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
             fbSize: fb_layout.fb.end - fb_layout.fb.start,
             vgaWorkspaceOffset: fb_layout.vga_workspace.start,
             vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            pmuReservedSize: PMU_RESERVED_SIZE,
             ..Default::default()
         })
     }
-- 
2.53.0

