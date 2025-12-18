Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013017.outbound.protection.outlook.com [40.93.196.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815F126E6F0
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 01:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766022849; cv=fail; b=mk/lFzhR1eXCV9CGkUd74Rax1mXfttrPkTs+peAXjdCK6C9b90gbT9yY5hVagxmgWqBkVhWJ6isk39i3ahoPWhPh7aBf3HN/8+/cqLCXo4aD7VOvP2QzwRA4ZzPJCHlgps5iaaQMq46IWLU8HpXu364YkRDhP3CbWwoyS/1PHM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766022849; c=relaxed/simple;
	bh=S/DiVpVZs8n6/DQ4TRGcgXn0Z8Vh1Hz5R8O+K31CCaA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iWMihZxannsX2vCO4sR4VAGImRqBGN4E2HQWMzhhDKNk9VjWPLAvxjmVRg65ie62HDWKlZ8Oyh88tbsfJLaVsbzUfrT4mAuHSw/bvomHvLT7xG15EwCbZkH5ObQKqCbNDNmeLbnNfA8Hd/V4/gau30Ow/4hfbAQUrT1rd+B0gcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I1GBjm3N; arc=fail smtp.client-ip=40.93.196.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I1GBjm3N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0dJBZyI6e0YmjcrbzBzZeFXhiM1M/vZ0JDqhFE0jGjhcbU0NKdii5UtpQvQ0ed7w1+mgFMHlYCkFzbD335sEacLowSvR28OOW12YjocyC683yFPdUyQmBQLOLznG35bpFS75HGItIHYQ+2iN/V5BbQd1v+R6lrwckODqta2gz2rO7kOH2LogVekch9KwetakH58ko+OMM3p7Uf9dUxr6PH837SUHPHHFKfGIXxVdLWSgzybFLCXdjmhLAO81qEnwKkzbB8/PAMAGj8ytnnjhZbH357+5U3ILBam0q4lQsNPalvowv2GQpXFz2TxwsUFRzzvy2aL/YKQRWhPhH1h6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkXxmJIKJBH3iaTaFdY5h31TEFaTM+pDNckhe0wPy24=;
 b=LoBVorWrwfqsMdvLeH1CNZWNRUKQReAOcNoKPqOKE2PZsZQ4mGDPnKG1HDkKHcMP9+sncBORAFaroOQ5njxWMHq13GkT8sU09hztHrZP0ofl+l3ytSQ4DQeIx5hjB6WeAipQQxwZx5yWKWUV+D16/3klcOTcFctJgB/SaEyyZST5Gbx7sEYok6aPHzF9R6tzmmFXe6uYBQSAYJWcBo7hQan0MoS9MOd6hV9W0k7GuKYL7WQPuPbmXkdpunV3wyBxNgLKXUjLqCfoeWt2NvpzBj3rjONiUz0W5BEjLbV/NOHzgFL3qdUnwrdVYqeJ5xeXn0CYSwiRC7I7tYFaSnwDdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=garyguo.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkXxmJIKJBH3iaTaFdY5h31TEFaTM+pDNckhe0wPy24=;
 b=I1GBjm3NT3O+cOpAbMt1JrbtiHBLEs7F8yMVEEvi26DWXNYLthaIw8I8afAykXZ77S71SkuAHQUeeGdAz8NMkXzvcAo0hPbUMz4J8sx5kewUkV1cOgv5aFPAU3HKn3C1gGM/fHUjjYs7JF02PVd1p/AM6PiQx7UX/sUHiL3wJEkKkLT+H2X1b6ZSx6flouEOMzSbneYOeLPYBYo7xu+CI3ZQp6I+kq2DTRY+2MODiQHYEKtDbXnYq96+s+Vg69RvXshnUHwaEStoAYyfiecYgmeIWUTQAbFgglWwlS5p03BgFNVG18eiuqQqtBU7KBlYUArZxQ/4i5a4bYmPC6RrRg==
Received: from CH2PR12CA0003.namprd12.prod.outlook.com (2603:10b6:610:57::13)
 by CH3PR12MB8235.namprd12.prod.outlook.com (2603:10b6:610:120::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 01:39:43 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::72) by CH2PR12CA0003.outlook.office365.com
 (2603:10b6:610:57::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 01:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 01:39:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:25 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 17:39:24 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 6/9] gpu: nova-core: create debugfs root when driver loads
Date: Wed, 17 Dec 2025 19:39:07 -0600
Message-ID: <20251218013910.459045-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|CH3PR12MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2a68bd-2ec8-4fee-8fb4-08de3dd65160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lYpu48Lbx4P4mVdcoQ7X6RZyUrvNvy1pjRm2qjpSJK5SV6IB8Mvjhl4HfaPz?=
 =?us-ascii?Q?eFhhWELXZ6wf+BqR7qsSN08T/ThZl3nnWcFJ6SkhuOa8CAWn8RWa65WgQrB1?=
 =?us-ascii?Q?ZXt0HjwB4MgfocwZaUEurMmx5UnSwAZkGlDgd0Jo1fCUke+yvtBNZHOprKJT?=
 =?us-ascii?Q?4Gpdovp2iT/b8b+ZTgkwH8DU8vUgSLD+iytvwm/+/Y7CV/WCN/8GKrWy5MST?=
 =?us-ascii?Q?cb5/SNiwqqyEA9MkbJjInVWWtBl5rUJ3Kb6ire9XCVH+gPJ9o1vrlouOaF01?=
 =?us-ascii?Q?lc/3iMxRnnaJIlwwJ2KisHVG58pysXRlgwbCstuejQ5URsKAAGuUUsTqpPJZ?=
 =?us-ascii?Q?tDDIE1rJXen7tc35lWOvoEuD36WItp7DzBg4s5pIDi+PmybqnDhpDY5rDT6J?=
 =?us-ascii?Q?x8XbjUTObcoeigxIlQ4krGVDI2/ckwoXv9kckAW4UNZEdPDfXh1z7vSLMUuB?=
 =?us-ascii?Q?1/F44HM4yPqnTsm43f41wMnIGiTh8L+WfP4USsc72+PutLUAzb7rbfu2blBK?=
 =?us-ascii?Q?eJAKPTjcQQoWdpyS5TfB9ZikpQzaO4cAuz6HNZam7ULVPeIEbzjh1O5aHGew?=
 =?us-ascii?Q?JPrlHqDY9EaleD67hb6HhkJS/1svipwCE8+eVaIH01L3yh3aAYsFVOvNjaiG?=
 =?us-ascii?Q?J9v9GGjKMjbDqy0Y0U9UbDtrCKxEYEtd7mMeG7SpPHeEiJt3dEVTHigLa+xH?=
 =?us-ascii?Q?NqIBxzfMONNVBomWEUc3QmyZaiCTZGfOGymDI+38jTOczq+bSxBcz9doafe4?=
 =?us-ascii?Q?ZIQLlmoeWeP3LSG6eXvm554eT7/dazdzNT5TQoF+MMpNpYhUFBcj3sKww5I4?=
 =?us-ascii?Q?4PRFoSa7mlg8NBEaQ0iWPpaCE7eux16E4Ttqy/oWhMYcWCgwSerUBxYjEBzk?=
 =?us-ascii?Q?79febIkoPgGz2scgTWY5RRfiMYZbewa1Fx5zaNs+YpdesIGp8x7SJWaWNSuM?=
 =?us-ascii?Q?0GAJPxhTBW/79wduTEsX4U7v24YZLc0I0zjrss9WZ8fyf0fax1rSCzslGkIW?=
 =?us-ascii?Q?jXcYZ4nw6bcVpEU+ok6/uHe1BABU13auXISgeNU8b+3YlAljtmfQ1KeDgRnV?=
 =?us-ascii?Q?RzdNXHGY2n5eexZP5HM7lBHblipq2iwt9Mdz41AlFTq0QBgiHHelJ00Tf7Nl?=
 =?us-ascii?Q?FApsogLUmn40VHg8R9FDk+ZtH9VhGjeEpOq5UYTAeexnE8F2JWWYFkZI+z3b?=
 =?us-ascii?Q?vRHiqfgkabSDp3ivOE+eGtCZPNhpFjCthNq2Xzh6SWoNUMfYRii6p2V4xFgj?=
 =?us-ascii?Q?ZO9E686EGfa3KNu761/DDp5kEWtdWE93nzHh7q8KOqRetb/4MOGPEbzsZDjJ?=
 =?us-ascii?Q?GBXDEzDdt/Lxb/0WjmY2y5nkIDJIcXQX3ijvm6NYCYc8JVUtTkJUPxBVczTQ?=
 =?us-ascii?Q?XvuFdlZSrQJCPpGk4/WDT0cw7y34aQKACJVu3rnkbqcGMVKZsFJVKvW+BO75?=
 =?us-ascii?Q?0cXo3VD/Z1zcbFpc2CSUbd4/hlaa1bYQz6ZjuFtwh1EG3/z5jIjkUtCxs3N4?=
 =?us-ascii?Q?62ZWQoX5/xy3IwZLoE7fr0Sueru9dGjEKrNqVEX2/yV2CqdRD6VeFlYVz01e?=
 =?us-ascii?Q?2yz7gDyCUkJbr4QKOvk=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 01:39:42.9170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2a68bd-2ec8-4fee-8fb4-08de3dd65160
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8235

Create the 'nova_core' root debugfs entry when the driver loads.
The Dir entry is part of the NovaCoreModule, so when the module
unloads, the NovaCoreModule object is dropped, and that drops the
_debugfs_root, which automatically deletes the debugfs file.

Field order in Rust structs determines drop order - fields are dropped
in declaration order. By placing _driver before _debugfs_root:

1. The driver registration is dropped first, which removes all PCI
   devices and their associated debugfs subdirectories
2. Then _debugfs_root is dropped, removing the now-empty nova_core
   directory

This ordering is critical because debugfs_remove() performs recursive
removal. If the parent directory were removed first, it would free the
child dentries, and then the child's drop would attempt to remove an
already-freed dentry, causing a use-after-free crash.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 01353be103ca..f17505e5e2b3 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -2,8 +2,7 @@
 
 //! Nova Core GPU Driver
 
-use kernel::{error::Error, pci, prelude::*, InPlaceModule};
-use pin_init::{PinInit, pinned_drop};
+use kernel::{debugfs::Dir, error::Error, pci, prelude::*, InPlaceModule};
 
 #[macro_use]
 mod bitfield;
@@ -24,17 +23,24 @@
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-#[pin_data(PinnedDrop)]
+#[pin_data]
 struct NovaCoreModule {
+    // Note: field order matters for drop order. The driver must be dropped before
+    // the debugfs directory so that device subdirectories are removed first.
     #[pin]
     _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>>,
+    _debugfs_root: Dir,
 }
 
 impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
         pr_info!("NovaCore GPU driver loaded\n");
+
+        let debugfs_root = Dir::new(kernel::c_str!("nova_core"));
+
         try_pin_init!(Self {
             _driver <- kernel::driver::Registration::new(MODULE_NAME, module),
+            _debugfs_root: debugfs_root,
         })
     }
 }
-- 
2.52.0

