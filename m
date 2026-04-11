Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FFA3033DE;
	Sat, 11 Apr 2026 02:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875825; cv=fail; b=Iemax7/524IxrZnfHlfA7VW20XAgHGRAMouWfttA4wrw0vYmy6eERNuNIZ/XPer+KCYCJTp3C89P+qP+F6nxPUGxrp30OEDNjBdmFqyOHBpIL+hQJ9gWHZ4ouk34h25rjrB6/bCZASBB5QL9FKq3yoDlqcp3if3fehoQ6pdenp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875825; c=relaxed/simple;
	bh=vkd5km3vQB8Iom8cTgiv9BWDD4/QqEaZ8spHSHyMf5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QN6aA9nSulbmOHulalQjcDgMScI7KUVwq/AA88UXxLptZzgLB2huvrJw9YgusnwZ81Prab6iruMDlmRTDffGNLHblii9arz3JMm3IC9n26OgswR4XE7hWCc1FT32EYoWQyko12Jhc8PwD+s9vDhotm+SNiSumMJkwtgLGEKwK5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R6sa8uMS; arc=fail smtp.client-ip=52.101.56.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R6sa8uMS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfmjQXEA6o3iUfNm1uQT7ydVcHX+KOrMznoVWwbqhP9POhS6n1F4nDxJZLrQ/0GAEJPRV1nO4VOOtSsDg7+SmIKSa/CC+ZYN/njagYCQ3rzZJusq/W5JoYlIXDKM9vxD3eZUUyhABtj7osHoH06zJO+Sg8NsSqKVVTDxOFzJ/4cvXqiEX/81h4DTMsN53i3yAGBZAjttZiEE4LFlL3AmUXlZg7J9DgLzZQGtB069fX/Wn0MN/LacKaSqwGK83D7rLpwHh907/CwkhAlmuPeidVV3VLRjmrxHyf1PB3KadlEO0aGgsXHNl50d/ItMtW9fLFLWgxiQ6TZ+ut+2tuClFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yo0oeeg4vdWmKS8ngdfqV6BjWQhsUWgiPowiqfjXxek=;
 b=fPVGHtS2Q/t97DJwqlxckbdwOVTwFiYXK7DWb8jVJlHF4N+SNGFQpt8Gt0s8XDHedt5X2L0j+rjJadwinGSMUs5qgenl099+2gYNeZAJ6fq+tJotU0/NzdaWEqNxfStRCegMRsCfFhDQYS6oacWvRJWkK+o8OP8YuZoe+JODOvOX7Fx833YKUiOUS52GIBPg+mj7uyvqkEwRXtRGhK5IBc5q0n5pYQ8Dq4W7+TBj8oovKv+akESM31KEAu5IYkdKFiu9kgBp6xSVKbHQmaMxm39Oa3I7l96GAH665fSsU0Ll7lhYOfHz2GzPd6jdpMSv6XM6NjLwD1tbY7nrwN6krQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo0oeeg4vdWmKS8ngdfqV6BjWQhsUWgiPowiqfjXxek=;
 b=R6sa8uMS/tYtk4qa9dsHzP82a4Ci8JSNgtB+4eQSyuzHt99/E8651FcX93NcaPQ2hIdFc0/cbFGe+mnN5AZbti3XvbI+4JBfa7O3ha8C8BfyaSl2f4kxHXbC6LCr5+NylhZ7VwPVe/NK8epbhPfTWJiwRwQyuKuNmmF6pkDpqIgDHKXCdLvAEqBvqidHcKMM5aPHDhOalZ096HDu0WPqnLFa0v6mJ83Xut2LRfx2m00Wvz9LHClohcfHCgi5G36m46ps9AjF/iFjoR1+xUwwxKSY6aQ5DzGKuc0zbFkddnwnv2NZsy5xpWzePNGN4vXdnxq7nY3WKLN8QPeGJfny4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:15 +0000
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
Subject: [PATCH v10 15/28] gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
Date: Fri, 10 Apr 2026 19:49:40 -0700
Message-ID: <20260411024953.473149-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e53221-dc2f-4246-0301-08de97750f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	weFvyJZCBgrKm1CpTG5fKclz6yhlkNYrmqrZOa1Q1MgPkXD5o3Cd/vMJRoxxGRVsuyz+0u/aZvPPm5rVmeqdNu/Po1AIPpcy0ga2O9EuE+T2MlekYrS2xWCVj57+4TeWziACUwcW2xbkBuk0xg+t4hC2rAboKP1u8/jhnq9v04MIDMu16dF4BMViUf34UiveVSdwk3ww1ra8bDl/THFMj1SEFfoL6X2jZJC4/l9e2FuAG6pgXXjOLGedNSrpwEiD05FnYmnOlaxxYqsf/6t6O1rrGqbutWW1Eg/XOR5Cj3aTiwQp6uuEvz6C8NSFtjnC+xOxrvUPUWVM+udD9anrCZSMm100CKSMqFNitOTnYY/kClv3qm0kHrtCWzgwsHt6Yxlkr+2hQYHevnql+taUS/lGepMhtjCQheW9h+y7zHJmOP8QkoiJHt7PXPNx8Gno/c/bRDIdKZk+ghj0XUnBcnZpklCAbDMCTjlLjdBzghICw+jktAg2RxRR4ozco+e5bpUNjsCfaZfJ55aM5itSHoQXCT0ZnXTHybnl0O6K6i09/eR1BqIuUd0ALS02ZxvldzriNUntvG6vGaRy/VzAzHlk8vz46EM93zDqfi+iwcXCsPmuLGPzwM7VQn6n8kp9Oh4ROyqms4f9CSR/7JG0grVnWp6mmDzXNqCd0A/GBbYGzATCMAa31LbY1yptnZfk4S8fmgnJH2S4qOgB5G8s6GDgiUYy5FkcVtn0Esphw04=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/ODAv1vqET7HMZF2B7k511TAcQgiCqmou4sRh8ZhDEhq+KuYYocCrshka68Y?=
 =?us-ascii?Q?O2YDDgu44hgRDN7zd8M6qWgdLLrSlxUMp7AjDTNv5oDA//CUWTsVcq1sINUL?=
 =?us-ascii?Q?JH0IHDBsbfXEO35JA++AwxlmL7byCMnAwbhAqNhpQ8OdIZ3ybdY/zQoiUCdv?=
 =?us-ascii?Q?b3/w/F22X6IzTYE3OrZS2Q8HfiCZ0Q0UEremP4lmxWUM7aOUkKdbqk0D3leK?=
 =?us-ascii?Q?E8JYHichgFOcXakLDZHtadlfGkEAIxM9zmVI+H7GPksY/rfBfORApl/gMnSf?=
 =?us-ascii?Q?0o+gTGTh4RMpygT7MwLlLCb5ykiH0e4v38lyKnoWEFUvK4TAZ5kCAJo/PDU0?=
 =?us-ascii?Q?UetNFG6zYdYlbee82xtkPZitiHZPa73T8RlXdiub1wmZ69I/7boMklE4ZWGy?=
 =?us-ascii?Q?yA+fVcRVOrGLodxge4IDDX0nwTOq/xx3elE/vGSJXU+gYAd2JvGIol0zE0Ie?=
 =?us-ascii?Q?hcfDB8nyYIs6AFsd8YdpUw0j9tkstWRrKucgWupsjP5CDci9vD5obbW1uVj0?=
 =?us-ascii?Q?J9O1t/RzHYgakL1KW+DMbHkGX6AGkSNJk1NbDcTWDEzBpjPDC+CumAa6uTPS?=
 =?us-ascii?Q?nHKSSdFmWXk0pIbY4xLh/V5VuyYqQOspN8R273uCkqxMTq+ICYx3vFlAbBxk?=
 =?us-ascii?Q?WqRjPHsbPM014ja99WiqLulh0ofbKdQwMMvqCyDwOhaocWyf0sLTQXNCYeji?=
 =?us-ascii?Q?73b05MiSwpnspmKmtP+DXkXZbd+eIIgYV25nKwv4thwFEkuMlBLaRkrzeAWI?=
 =?us-ascii?Q?emHVbEaqXlYn44MmTiDOcO+RJHC4PqWhKGNB0W05vPOwjZ7lExpNk2A+ay26?=
 =?us-ascii?Q?wYKaX2mQ94FyNKkFvm5XGsLcIxgVhkd0MivBRIhoJpwP30Va0J0nn2pOzyd4?=
 =?us-ascii?Q?ggZQE48C/nqN4YzRs4JQ+1WGRlcwLfzSlzKSfBxeEQEDgoWF66gSukMtL3w5?=
 =?us-ascii?Q?4XXuUxVIzOuKdsnVChwaQQjJzFrZmvGw5VnCyU3ZwACik14bLUZQya0jcK+r?=
 =?us-ascii?Q?cAlaJ3bfvy9hwnbkNSIH/X7hreJCvXZGH6P+vrOeu0JbE7xqOK4ECjfyZP2e?=
 =?us-ascii?Q?kZdkcZkRk6JlE4TB9e0OO74H4oseeL+kIAwCPyoJ19Tu1qYtEcX9zcGu8AlU?=
 =?us-ascii?Q?9FNNXhT7MvDsX/N5ofMXysOWyMYsb2l3cCNNaxFYhAs26EyPBi6byoWTw98Y?=
 =?us-ascii?Q?WW999NwNhJNfXAtsmC8bNIVbMwNU/ZL4VkvdZVIJGnbruEWlPgY+LmBLIFn9?=
 =?us-ascii?Q?HVAFXD2DZlE/ZDmbixDubiqwfyunySZDASb57CB53Y5iy3gFxnXzvlo/H+PG?=
 =?us-ascii?Q?GC/Yr4mQ0QtQ8C8bzianVy8YaW/pSTAX7G66ID4bIEHTY6JkOV7gZamCCpzz?=
 =?us-ascii?Q?vmQ/obKpKKNz3wqbajfK2pNHxlX+owkmkqaPT74T9XQ/z3zbmXT5ty3xuyWs?=
 =?us-ascii?Q?blOa4dSlpaH+lEn51l3wrYJ44JBFj342vLevJnEXs/77jYj+FlIRJ1yE+O8L?=
 =?us-ascii?Q?MOn+LSjs1pznLHy/c1/eoJYO3pcifvz4fXiZhcEedg69/gOaoC2Y4hObZjUA?=
 =?us-ascii?Q?kvl5lnutjF0IhtQ6UkZw5eGK9dv8HINeN21leqgAOn7GUa6AiinE0JTyTGRp?=
 =?us-ascii?Q?3tJkpZG8VMUW5RASNA2rhNYRmU8b0U1bBGp1ts0XljjS08gvpPHTVh4dpunY?=
 =?us-ascii?Q?Bn9NCPNxJmqbd6zGJIX7441K3rkCVR8U04uR1JKbwn/15MTUwRzjvih4tOFv?=
 =?us-ascii?Q?Oa934HbGCA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e53221-dc2f-4246-0301-08de97750f07
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:15.3535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Co4YbAvS1frVdKcpq9TBTlwmUMj69x28tWwfFL4V5O0MZrxh5Ct11DFXSK0aKXB3f3MfBNjFWctXrWPeHUiPRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

Add the FSP (Firmware System Processor) falcon engine type that will
handle secure boot and Chain of Trust operations on Hopper and Blackwell
architectures.

The FSP falcon replaces SEC2's role in the boot sequence for these newer
architectures. This initial stub just defines the falcon type and its
base address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     |  1 +
 drivers/gpu/nova-core/falcon/fsp.rs | 27 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/boot.rs   |  7 +++++--
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 24cc2c26e28d..053ce5bea6cd 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -40,6 +40,7 @@
     regs,
 };
 
+pub(crate) mod fsp;
 pub(crate) mod gsp;
 mod hal;
 pub(crate) mod sec2;
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
new file mode 100644
index 000000000000..57817a594631
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP (Firmware System Processor) falcon engine for Hopper/Blackwell GPUs.
+//!
+//! The FSP falcon handles secure boot and Chain of Trust operations
+//! on Hopper and Blackwell architectures, replacing SEC2's role.
+
+use kernel::io::register::RegisterBase;
+
+use crate::falcon::{
+    FalconEngine,
+    PFalcon2Base,
+    PFalconBase, //
+};
+
+/// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
+pub(crate) struct Fsp(());
+
+impl RegisterBase<PFalconBase> for Fsp {
+    const BASE: usize = 0x8f2000;
+}
+
+impl RegisterBase<PFalcon2Base> for Fsp {
+    const BASE: usize = 0x8f3000;
+}
+
+impl FalconEngine for Fsp {}
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 88c7d2106052..84943beee9ca 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -13,6 +13,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        fsp::Fsp as FspEngine,
         gsp::Gsp,
         sec2::Sec2,
         Falcon, //
@@ -196,13 +197,15 @@ fn boot_via_sec2(
     /// This path uses FSP to establish a chain of trust and boot GSP-FMC. FSP handles
     /// the GSP boot internally - no manual GSP reset/boot is needed.
     fn boot_via_fsp(
-        _dev: &device::Device<device::Bound>,
+        dev: &device::Device<device::Bound>,
         _bar: &Bar0,
-        _chipset: Chipset,
+        chipset: Chipset,
         _gsp_falcon: &Falcon<Gsp>,
         _wpr_meta: &Coherent<GspFwWprMeta>,
         _libos: &Coherent<[LibosMemoryRegionInitArgument]>,
     ) -> Result {
+        let _fsp_falcon = Falcon::<FspEngine>::new(dev, chipset)?;
+
         Err(ENOTSUPP)
     }
 
-- 
2.53.0

