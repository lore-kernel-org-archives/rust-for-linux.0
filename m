Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C1A30AD1C;
	Wed, 25 Mar 2026 03:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410810; cv=fail; b=hYrtXjKAx6Dxt683pjIJ4WNr0ImdnqNw/ISCQcfq+3kIt7mOeG+Ja41CAatuzOJV3HG06c6+YcIJ8lRvGAUHcN8PYtcSyF6rmBMdSCEK6uCAHdLFzPQogbvPevd83V5j3v1kJY5eBXRjrXGIXgjtRJDmLUw2oAB6MQ4i8nZclOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410810; c=relaxed/simple;
	bh=QsjnAW67Az+TV1QnWvKxnoz2LjCy9b+xd6O6v09Etuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MAu5iW1E02EupmEEE662fXEPAFlYtzHb95gaqILC+eTyagwI/22wSSgll+x0ilYK9yw4yjKqm7kTZtMHIeu0ImmiBHd5MWumLKl+TIbbJAOJX799ReLa7n6Kdwh0ojRCqQVbp7qu4mj+KM8NW2JFdhR2wgo38IHv6x5Rll0gZB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MU5zk+VE; arc=fail smtp.client-ip=52.101.46.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MU5zk+VE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlyIOdeKj6dmr9045rxmXzWOIbuhVZI1IJPxoUwK8mTX4yMKjkICgR6pZHhOX/DnBrRN9+iQoYWeiG94C9ZUw7di9lVLBUGZXUhg6XO2VNqa7co3x/WGhbt1ckKE8Q6b/6DcX2a/cFDoLTfjlVFVg86ZKuHy6vqapEJy7ZJV2xBzfPYZJxT7szZKbweEkKD+MYc8TQS3xKaXK8G5jRNZaG3Ol9O6uMHL4LihGcBo9wubfPKN3Xh/8aiMBBHrnfMC3eYiJzwU+6SUhp7+RJoB/VlFZAPVe0Pivfg4ZaD98kP+9gCWJgB+CUF/p/vLtGs4DIEi+eFBIdGI6zMAD4RC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUbyoGi1g97W2nKYjQSSkNRhXs+7BIbRTM3Q2KLaXuU=;
 b=r65IJ9tVbOQsXSgnB4u6+vcF5K3BzXlnPjvLbAOD8FoV0FA6dQlAYJxEBrf3bb2ZMKlSVJHdGL+z6Cpn+tG+jFvJRSSVwXaQuauH8db+sS0H0LYa+bA24Z7R6jwrRvDtKA23hpava954tOdVy3LdRJI0OqqaRmv3pntyPzB9LB4d3WZludwO+cIkkRFbq7MItFFtQM0Jjugx4hScMhlZFe6AqqiZKFqcfxYk5I/nDy0rlfs2EU6WLHIrjzWTVF7Mf/peaUvIKTSHy/5KSIxydDoM9SOsv5e8ZNik+p1RIxld7VjHJ3d0wwchVu3T/hsXM50oqnq+5nz8/vvm3Cw9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUbyoGi1g97W2nKYjQSSkNRhXs+7BIbRTM3Q2KLaXuU=;
 b=MU5zk+VE6btwu0M4pKlQlQm6/QusQeIR9o0CYVYJynuBaCtAIDTntEpnpKjHT92geedzAGyU7eta4BNwiTMbIbOZIoqoBvLyO7NNEmHhVh3aNmPqARlkezwTMJ6z/GqBFO5mskXvvU/Y9/SoZA0GaeHYr9jHz6VOmBJuixjpjzSSaEjJWKuZ7i+iQNo2mF8tzD7hoInTv/csIasj4cTiCBwzg++cVNVZ3H2bVdw4MaY7DbxzpxWZuE4JXctnXfnS+9Me8ao18dVaYHRm7mKA6BJa1obdQ05or+qNRhVyRgvuxTxCSVEeuWuxjFKRWY7p5KY0FZMUGQEaeb2+CkSc2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ1PR12MB6121.namprd12.prod.outlook.com (2603:10b6:a03:45c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 03:53:20 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 03:53:20 +0000
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
Subject: [PATCH v8 27/31] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
Date: Tue, 24 Mar 2026 20:52:38 -0700
Message-ID: <20260325035242.368661-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325035242.368661-1-jhubbard@nvidia.com>
References: <20260325035242.368661-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:40::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ1PR12MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: ec231627-7875-45ee-0134-08de8a220dd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	wrGr3iEPJk108KZeqncVhge0uCAUjVGVq5hSIKBzSFiyfuxBTVRub3iAvbt8OcMJZGTkLzjJJkh6jHFfGeb0cCBaD1b5Q5e8rVJO7G7sKf8IEp9GsZ0L5NTEli/cqcVuPLriYuMhPWOY0SjfLKErCOEV7sYvIcVSDGV2S93IHImMsRYSS+/jSeMgiFPm2XZ6W6nOhCRdl0DQosFrG+XOCwy962S6AvPWm1k30cD+XoTrjEp7ovBEB3uVXBwPbTz9XlUcS974Kpgvw0NlkT5Gxd9LBcUYuictGbpA/aK75YVex1P+/A3KDw/TPZiHvH2UljG3MmRe+7JIBoOPCAFDUaE9N0wmb33jd2WSneh2nKkCGYmbxF1K3xllwlCrup20Grol9t6Pewsj41rVGwpF0STm2ZSGrw+jQSrjaEFsyv/xz1KgQuYbLrKjCedySYOazjVEYtrL5eQS1UTvDUVJhXAEKLC3Zm88Vgi9F59eCliisB8p1Yw7fLY2urkIUYpcN8GqHdZBFaHz4hAu9HpOibxOUdNVkuPGTqaHP2E9y4W6WkQeIoAJfUl+k9vFAShS+0z9oF11QfCZjmVJjTO5cssz+fEAPUNAJYQ8wd00KuHWwGIwTft47bmir2x3C/qfoI/T0uXxqTEU1D/mTXOlvYdvvqzIotpoZV4KeUTalIrLyflF/rmp+FSkqWvNYbigLTNukQVaG3iYjhgh4WGKW5wHQse0j8zuSApvL5Y9rSY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C+j4AW1kR9q/mtsbMxYZbRA9E5UiX0pacB3YV1lKFKXrKPWIm9+M7Mnkxafu?=
 =?us-ascii?Q?6+pbdv2W0Y45NDpwKPjlUkBgpjiPZVhO1pt92CyfofASlN0tX2fE+DoVNSbE?=
 =?us-ascii?Q?xBfMn6gkpPaJlr0HJE9fSba31TKsX4ijJcPtiaLkeij/4rhKFBG0AmWb7SYs?=
 =?us-ascii?Q?Y+9Yy7JQj5T5L9JISmtWyDedq7tHDqFdm2489YSW8oSPcSphrh+dWvBKY0Dn?=
 =?us-ascii?Q?RPsreWWhdrPQY0V+9Xf8FS5bj7rZ7atf+b9+9WVYii0PLvPKnYiKqBiaPT/X?=
 =?us-ascii?Q?9oeGGYcIO/vPihoZLbID01bFBUxrhKMFKUjCF4Umo9uEjjTev3SOHc51gohv?=
 =?us-ascii?Q?G+teSd9r3/JMOpyfcXeh0WoY6iWfuLVQzA3ZTJytMGudnstT3UtV90aoScGJ?=
 =?us-ascii?Q?4k/EbeT7LoYb/Sep0CL0vLdOQwJdtXCePVa6wat1eLCvjPyZ9yaUcNCbn+SW?=
 =?us-ascii?Q?JrPnF0BkI1u3D1rBIktAzH888ymKzeoyd2eKr12QeqwDTkLcinP5Jh6IW4eX?=
 =?us-ascii?Q?AlIBqXP7GbOA6lPAGTZJ7WQMZgJrURCWsYOb1mtI7/STrvqRWFyOAtg7l4KW?=
 =?us-ascii?Q?r17y72oBVMHd3TCxoHbr0XAscCv8s7ITFr6ozmCi8GShzp8n35i3OQNGCfPf?=
 =?us-ascii?Q?aq3YgNM+AnHc/H7t0X3Wnwql83bE4eQRJ1snuSjDsH8MI3O7Zs+hIhBiYcuN?=
 =?us-ascii?Q?KRvQFECpDgMNElSFPZersW3uCGfpf+AMfDq5xj82TniFkinOgMRR5BjkzNie?=
 =?us-ascii?Q?hDZGhFV8CPJdlWZaHpkqYWHTswB21aEtT5JbXuWoXiDDxuLpqhfeRQNaGlBq?=
 =?us-ascii?Q?tu9bpHtHEeU3e4nslQXM7g8tKsma6UdmMPJo/WZmwUgpryIkjntXcFqZClR8?=
 =?us-ascii?Q?dYriFw/Q4XHUsOrGwVxouiWc6yU1fxRRzMpjCqB+m7h25dWqgcVNvDMl+54S?=
 =?us-ascii?Q?BA04U8ku027yQQlkzimhv/9/3vGkd3uLbsbomWJ+7gM1G69SMUnWgi/NmY3Q?=
 =?us-ascii?Q?NfUnWHjkuu4Rzv8STs50TfS7A5G19FtB7i1IZyfSrN/0sI56bwgUTw8IDX6K?=
 =?us-ascii?Q?zkrlqoteRDXMKgqjhohkjHStx5ZaW3Ho5/0ZBEfch2SWv8VUkkQaAt2tbrzO?=
 =?us-ascii?Q?UqDsVQ52lxlITtSI5mjvKsuVAENUVoCvh4EUPi/Ev5yboqWKGs/JtgFfMC7x?=
 =?us-ascii?Q?QyJZayr/upBX8rvkOhVq754MTERbSTzLuYLtk3VUpx4kWOX6+dszwKaiFvVe?=
 =?us-ascii?Q?SWZ/PxwQaLfZQoWNwMeg1ZuGYB8jR8TZRlrQhfWyplKmrMH/e18CUFUSdch0?=
 =?us-ascii?Q?cap+0+qBtEb+bwpARlbaQd2sUiw+1E7j2LwwH0hEN4GFi+dZVxR5/tpQzHef?=
 =?us-ascii?Q?g7e0OE/RXFzROtalsZN/Ttk0z8p009SPSkNkGE+qF0ybojDn5o6/7tW+gStP?=
 =?us-ascii?Q?jQMF/WrN6jbgiORYnahVyV1H5RAr1/0XucXqlu9+1ZgRepgb2l2d2gJ0ZzkM?=
 =?us-ascii?Q?aWd1hrrpfB76E+4Ide/X6Mje6OTvZt3mI9KKrFRWzciO8XNB7+0nrgLZuglt?=
 =?us-ascii?Q?I24KHZv1pyCVU0I5q1j0r59mhgeaNnA/5tSeLsxR3a7mzS/TozR3VqXqMjnn?=
 =?us-ascii?Q?DteB0akJv837JlUqjreWP+G1qXbT7y3XHlZ6oRdnMDuxP3Hc2yELTram2xw1?=
 =?us-ascii?Q?eJHJU/IZsvBmXqmkh85KwQ4lQBECJiIGzN0jodMM6NaWOEyUbRQ/G/gEBZ7T?=
 =?us-ascii?Q?mSIQmoReMg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec231627-7875-45ee-0134-08de8a220dd9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:53:20.0407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZaMmxr+KmdtjUy0nERSo3ot58TsivkKb+ST2uqXrLT90OwxlHrgTFP/WFnX2p/3q/o52hmJu3pz32sZKRGa2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121

Hopper, Blackwell and later GPUs require a larger heap for WPR2.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 59 +++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index c510a9cea3ba..08d7d5406445 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -106,21 +106,39 @@ enum GspFwHeapParams {}
 /// Minimum required alignment for the GSP heap.
 const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
+// These constants override the generated bindings for architecture-specific heap sizing.
+// See Open RM: kgspCalculateGspFwHeapSize and related functions.
+//
+// 14MB for Hopper/Blackwell+.
+const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 = 14 * num::usize_as_u64(SZ_1M);
+// 142MB client alloc for ~188MB total.
+const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 = 142 * num::usize_as_u64(SZ_1M);
+// Hopper/Blackwell+ minimum heap size: 170MB (88 + 12 + 70).
+// See Open RM: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB for the base 88MB,
+// plus Hopper+ additions in kgspCalculateGspFwHeapSize_GH100.
+const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_HOPPER: u64 = 170;
+
 impl GspFwHeapParams {
     /// Returns the amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to
     /// and including the first client subdevice allocation).
-    fn base_rm_size(_chipset: Chipset) -> u64 {
-        // TODO: this needs to be updated to return the correct value for Hopper+ once support for
-        // them is added:
-        // u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100)
-        u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+    fn base_rm_size(chipset: Chipset) -> u64 {
+        use crate::gpu::Architecture;
+        match chipset.arch() {
+            Architecture::Hopper | Architecture::Blackwell => GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100,
+            _ => u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
+        }
     }
 
     /// Returns the amount of heap memory required to support a single channel allocation.
-    fn client_alloc_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-            .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
+    fn client_alloc_size(chipset: Chipset) -> Result<u64> {
+        use crate::gpu::Architecture;
+        let size = match chipset.arch() {
+            Architecture::Hopper | Architecture::Blackwell => {
+                GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100
+            }
+            _ => u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE),
+        };
+        size.align_up(GSP_HEAP_ALIGNMENT).ok_or(EINVAL)
     }
 
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
@@ -164,12 +182,25 @@ impl LibosParams {
                 * num::usize_as_u64(SZ_1M),
     };
 
+    /// Hopper/Blackwell+ GPUs need a larger minimum heap size than the bindings specify.
+    /// The r570 bindings set LIBOS3_BAREMETAL_MIN_MB to 88MB, but Hopper/Blackwell+ actually
+    /// requires 170MB (88 + 12 + 70).
+    const LIBOS_HOPPER: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+        allowed_heap_size: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_HOPPER
+            * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
     /// Returns the libos parameters corresponding to `chipset`.
     pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
-        if chipset < Chipset::GA102 {
-            &Self::LIBOS2
-        } else {
-            &Self::LIBOS3
+        use crate::gpu::Architecture;
+        match chipset.arch() {
+            Architecture::Turing => &Self::LIBOS2,
+            Architecture::Ampere if chipset == Chipset::GA100 => &Self::LIBOS2,
+            Architecture::Ampere | Architecture::Ada => &Self::LIBOS3,
+            Architecture::Hopper | Architecture::Blackwell => &Self::LIBOS_HOPPER,
         }
     }
 
@@ -183,7 +214,7 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> Result<u64
             // RM boot working memory,
             .saturating_add(GspFwHeapParams::base_rm_size(chipset))
             // One RM client,
-            .saturating_add(GspFwHeapParams::client_alloc_size())
+            .saturating_add(GspFwHeapParams::client_alloc_size(chipset)?)
             // Overhead for memory management.
             .saturating_add(GspFwHeapParams::management_overhead(fb_size)?)
             // Clamp to the supported heap sizes.
-- 
2.53.0

