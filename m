Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BF0328255;
	Sat, 11 Apr 2026 02:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875844; cv=fail; b=tRZuhKzX/OQ86GmNd6F3C7v4/eIPQThhc1b90ghHEe+Dbj0QPO4UIlRtMQZLNHzF9k+ADaGI/iTTF+uuD+98i1LKkS4Cjhewkuf4AGx582S7umDERR6sMWV4GAw5qNa8PDGN8D+4SoIv4LEBENA2OuA8vvLExPWauyIwUisQvwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875844; c=relaxed/simple;
	bh=LyQGWiK5HHBttWxEj7/vm5r+lZrsdWo7VMcubGT69+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eRmMCByL8GtsTErTzsKWbxvniEMfUgY1/y4Ih8pJqUHlnfy1QBV/xNg/sjQ2orykD0ENSWchiPa5iKc0TGQ4Tb9vpizw29LD6hDRJN9QzkHyMnRW+/3/TX5HrQZ574S4CI8dtpSRJHZtulw9hf5W6jeGSIUfKXK2oQ1ZLsl7EGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cMpylmNM; arc=fail smtp.client-ip=52.101.61.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cMpylmNM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bksvO6HT+zKYBGA0kFOQrMu6IdhMV4FBnsonl6s8Y62wSLKDJ4E6jt7j+GTi6iQt73kKcS7cJ0KYTbOaMPpEGIaLROcsiFYer+iYcPK67QxmYZcmb9eQOzC/CrM9UgTC2FfLObsMA510xfMdzjmu30D0Xbx3+S+VqOeKZu/+HjaI1oSoFam0kFy+ToELjEidK37gh2NxUPYVrD977rEP2D6QsPFrHfl4w8bTwJmpJpblEmBC8Unm783do2uIlvuBmx5TvL+C4yUoh7dhf9J1D8uLpc1Dx+QX488n1BY3i03TGoIve51fHmxXWXHmfTURN2AGgmykd063m9bh0aGc/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6mRfrbiIBRCGbCD25kqOD+YzsfqvCulcCQJvQ8Qz4U=;
 b=oXTos8UaOOeZGVOC2Zmley1kEy7LLVp1C6TSrt+qZBRzkAgYAhZf78AVnP0QclKiWQzwhbYexNhG23KcmIBHILG1/g9ieiV8CH8WzGUxOQXDUGRd8a4f7VyoA57dLm69pD9382lQAH7mKPFhmksMb+RI0FxdpFMvhmkAKI/PavKEURPNrKghk9jRp5uO9EQ8fXz/BeyPL2Hj/zWvccOXlJ9YZor5YYEfs6n3E60AaA3ftdoEF733K77tbDz8DADkThRkLz/bKCc7ZuRqcozW/3awhsxOujUMoyhE+6G5fahw/v9YbjGzi+1PIs5DimyXuXpq1t+S0TWa6Z1weJ3Q/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6mRfrbiIBRCGbCD25kqOD+YzsfqvCulcCQJvQ8Qz4U=;
 b=cMpylmNMWvIORAJOzOgwRXMHRcTw0sXEGN9s6Pd7HatpL/QbLLhIVMH8zv+WIjaoStqLNuAlFXsDPNGIsaSmjpEETcUtSA3tDc3Rqe9QmsNv6MlLEFFbr2NEcuAPqH8egz0Mg3AbcO86ZGM0r+hm8Ugo+/Mlcg/2vAX16BD4vWCBabwDhk7JoQRwnKWPUaiuZi9QkXk27zNJGgzRgGKzetsrwxXjvsDkH8r+e8iZbVm0KachGxNjrLLKHy4h5dXbqDFn1u+xPAYckyG9Jzaz0Idvn8I96GuMipnAK1z4jXJrMtuQztqcDQfCejPtrDfolWioAfSAzMUl5luthdZ9Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.46; Sat, 11 Apr 2026 02:50:32 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:50:32 +0000
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
Subject: [PATCH v10 27/28] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
Date: Fri, 10 Apr 2026 19:49:52 -0700
Message-ID: <20260411024953.473149-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024953.473149-1-jhubbard@nvidia.com>
References: <20260411024953.473149-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0023.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::36) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a8d445a-c486-4ea0-f102-08de97751845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1q9gWAzPuDC0Lqdx8hgMzHIuEPNDGCnfTfX6DqtTCsuGi1q6Vnyls9hWr8yzujDZwj707pLo9z+dyBd/7yYJrXoyzx2UawhfRiaNAr/XFT3L7fmUGXx4rrxKxff9wMULS2lLQ8WtLEysTCR+qKwUA2rHK8Cw9cavKZoWTt7rTFWdw3yeERG+dXL3VoYkCtY2mjYrwENCxXNgx6ZCxKOQBR2LxZa3MBFw0+4V2CtSXG9s61MSd7SJf11bk4hIRpWL/XL3zchpjwx0OAYdNASLkDTseuow4yX4JnlwRLnrZUlqyccSe6OwEjaBqkJ2ntfJJ3ZlfOZyV/xFYkfWv76bV19UqbqUEPXhEpj8VUgjRUkCyZVswKroWL9tJXlx5mQSHX/sHVdM13vw2MphBrYLAF0ACjURIlxySwMTky7/rGaLb71jrJByS/OFSaqLTvba8xdEQXasW1TV+V4jUPFPppwERozZ0FY69jJNMhK2y4hXTJJcEJekwbLZgD/+DkeZmXn8WB4TZQPUnK9pA55Y4RXz7jUL0aspl6r6Jm6TcSgP74kk7mZ6RCx9cf+JjCCk8hKYEEbMj77NYUyyA69YQ1XSLar3wIXH2OMntWJA/rJf3WSLtZcZsjm0OXOQEut7jMAh8K8sG9FQyBcScrTiFTIp+Fl25z1jTsHEaIwngqrqJLHUji9gfwh8xaacqYcmmrNqe2L+9P4S+kHPFiOvdN95C3sEwTP1J6oTwAk/IBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X8FHNiih+5bfJ9OXn2d4e9WeIOOPXaYji70B98p2yAaljPrCRAlk7buujp6p?=
 =?us-ascii?Q?CvJns09L9Qy66cQsprJPaFHzXTKRGcqhiwbXUKN+JU2UcB/6A7Uy7eMlg0GU?=
 =?us-ascii?Q?NbYT8qnM509WJe/IpLHwIYwy00bv7ixc6DuZzQaYLxXzYsy+EeShD9kmDE8p?=
 =?us-ascii?Q?+juS644MFLzf3n7lLmSURFoCYxgc83Fudw8leuFC/dZ3468AiLvUqNmOJ7Sr?=
 =?us-ascii?Q?tcwVWoEslwgtyGvNNKfc/HUwkBmrgW+3Xls661mCmpgs3M4J+6XZUUYKNgp7?=
 =?us-ascii?Q?91TpxsfgPr1oq4cUgmI0o6r3QBbsM6yi4fZqGoHfG1JyEPXa297bt1nEDc9Y?=
 =?us-ascii?Q?L4IV+eEA6jLy6CxzkvZcqfqPRuRWhH8zpwE6bSHslzV9IRVhDLedcok9/vF+?=
 =?us-ascii?Q?zoS/ILqs45WCRBMmZdi9fXfmha0qwBJo1lI5NGR31SlkcT8GJ0KaOGDwL6v6?=
 =?us-ascii?Q?wo6fAgj/rprIxEWiS5ftz+5L66Da8PC2ER0IlCj5tDU28JsSsAsmNKry+7xU?=
 =?us-ascii?Q?vTsUuZo5fGezRPttqj1Bawp75I7Qdr1OAYRB+O5sqEGzfXvdU4Qrea7+ZtyW?=
 =?us-ascii?Q?zlzPO7X9YbqXHD53kurd0bOw1iXox9gUFbfXUK/9sxewEnKFF6fm7/eoPpEs?=
 =?us-ascii?Q?bfc7Mcysz3AejUCoQpZvmYE5BeiBizM7tfV0zKi82LN9RAIkuDtgW0uvVv+i?=
 =?us-ascii?Q?niPAtCvBAmbDb+ZxgDiHtuV55RAdWJOA8qFH4JaTWXnq5HmzDWumyLnSkbIM?=
 =?us-ascii?Q?vjUNV3VslO6dWZx/srkrI0rdq+rxWpl6Dfha6BuhcZkGYzbsTSTIY9maBZr7?=
 =?us-ascii?Q?FoOm8zEDJvRpCKm/EyGI0hHHdz3T8WUCSMrzhrRxxsnMHZIQusDQcF2XHYvj?=
 =?us-ascii?Q?DHFhzs8iYuZMUpKA5FXeIxRzTKOebYzdidD9FKUzg7o3rn7BgB/ZUAcYKHCF?=
 =?us-ascii?Q?kgG02G5Qkps78hhHB/Hr+2YcMzqtr6hm7d3MKH30Ey5fspCOTVbJVc9Lp3UJ?=
 =?us-ascii?Q?yHczwfvk7z5szI/R/pD35ISPzlBhbwjalAMu14ncK6M36pVhaVGmk75CfmCm?=
 =?us-ascii?Q?1cZH2bLnOTeZHbgUei+o/HC5tiyvORGyjQ4jiXTcQXJC+Z+2SZLjpSDAdRMx?=
 =?us-ascii?Q?aocei0CR/SYrVayywnXutD1hu1NOp0xlHtBhhNx7YfiM4IptUkaM6Q95cm89?=
 =?us-ascii?Q?nxa4bNzH6ZHgzHlPbvsTN6NxBWmswrkq7BV8I7Y49vSCRgkSDl5t6Ee/fEyd?=
 =?us-ascii?Q?T6XJDB3NWiLzRhUUEJ/Bp4fq6WtK8Tf7EmheAmQud5thadI6uh1CoNgng2Eg?=
 =?us-ascii?Q?5SrQ13ADv/uBc5YUWADulL2Ze6Q83GBy3/nHcJhjSh/kxeWMyejDB6CUJpU8?=
 =?us-ascii?Q?3f/wgzqAnuguNRpzQQ1+sDXvfh/CaJl1/u51Ee03vBiuitGto+1mdDWMlL+j?=
 =?us-ascii?Q?TJyoXIDLswENILP8pCPKTv/jQd+3oE5CS01BFTUQGWkxjWqaxzX0b365o0nE?=
 =?us-ascii?Q?GzNzVuFo4k+hZE+SuqQCluIpP/SUlmWZXzAwEOw/WfQeTBqyd2yvRVrUbhdx?=
 =?us-ascii?Q?ZeT9BPKvPg6bsbj4e3hCHfoamoJculb/k8DXfiZ1D+M+8MW9AmQ8TYwkmmYP?=
 =?us-ascii?Q?0YUw7zYVo0GZPIRCWFze1w6NrLEjn/07/MGqvf1wR+KRq6b1gwJXpuo/OBZ6?=
 =?us-ascii?Q?yPf9vIiPLlgi8OXgD9vyaUY2TiUMZyXdLCrnvJt2m1HOXu6kGUQGDJHELOKZ?=
 =?us-ascii?Q?+k5gaiYhEw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8d445a-c486-4ea0-f102-08de97751845
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:50:30.9257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cT8xCHOr6uhnM6cvPDSPreFfpft4M9L35J21PdIzlY3ocpUllFQ+pg+PUvPOsO2FGycnp10MPDYyEngMpWNPcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719

Hopper, Blackwell and later GPUs require a larger heap for WPR2.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 61 +++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 5d36604ea1a3..7352952e4ef1 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -103,21 +103,40 @@ enum GspFwHeapParams {}
 /// Minimum required alignment for the GSP heap.
 const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
+// These constants override the generated bindings for architecture-specific heap sizing.
+//
+// 14MB for Hopper/Blackwell+.
+const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 = 14 * u64::SZ_1M;
+// 142MB client alloc for ~188MB total.
+const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 = 142 * u64::SZ_1M;
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
+            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+                GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
+            }
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
+            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+                GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100
+            }
+            _ => u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE),
+        };
+        size.align_up(GSP_HEAP_ALIGNMENT).ok_or(EINVAL)
     }
 
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
@@ -160,12 +179,26 @@ impl LibosParams {
                 * u64::SZ_1M,
     };
 
+    /// Hopper/Blackwell+ GPUs need a larger minimum heap size than the bindings specify.
+    /// The r570 bindings set LIBOS3_BAREMETAL_MIN_MB to 88MB, but Hopper/Blackwell+ actually
+    /// requires 170MB (88 + 12 + 70).
+    const LIBOS_HOPPER: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+        allowed_heap_size: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_HOPPER * u64::SZ_1M
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
+                * u64::SZ_1M,
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
+            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+                &Self::LIBOS_HOPPER
+            }
         }
     }
 
@@ -179,7 +212,7 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> Result<u64
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

