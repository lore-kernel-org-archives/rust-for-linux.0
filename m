Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011031.outbound.protection.outlook.com [52.101.52.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0C33BD64C;
	Tue, 10 Mar 2026 02:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773108746; cv=fail; b=W2jSYemxcfuNtJnILCMiECLg1+Gh5GLWCXOR99tBwjwNaRMHRu1mLC2k992WO1uZGsD7a86clsb6PT4jYbR2tSw/FFIjbM7D28ggYjVKrNShU/z/0qdYSp1zC67v76XPh0w7oGRIj0JstlFlxYDgtZ6vWRV8xo93vZmV+rujdm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773108746; c=relaxed/simple;
	bh=JVbkEL743M65GyC5PAfyiZeiFOk8ORn5/iz4JlzgUas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fCw+zrNOB/CHsRrRHGPME/flT4PTy4WRbHU3jXmf4qlX5FH2d/X95MKwFKCL0ADBDdEXRB6zsea5JGgQGwHfUdfQB9eOZ45fNkpBWH245jvMQdeb11gecfZyj1d+w3C4J4Kbv+r8XWxwSbBf+O2Ad18alBja0hpkG2WnQKZ/Ogg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ppk9PWOJ; arc=fail smtp.client-ip=52.101.52.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ppk9PWOJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e08u5NZZcg5ThpFbLVTKeWo3Wb5ILO8EtXgLihcCQC3zyOjZnFNjs3PUP6xEzmVB1EXvu9FaFwJc8v/jT2xZ39y7odEvl31Vm2LmHJLNp7LyQur5WzWWfXaTFMU1BLm/ovOuJzqBp3gfJ6aLf684E3CR6gumo2odDHl3xDQQVfIn0u3lrzrHySkKiHuJS0x2Dr2aRu84tXugl5/Bg+l/9Gvmw4mzHQYDcyxEa1RVYYQKm1JDfVDy4AyMFXQpcjrG2u6kfjHmkLvLYJzSfchItZnrfDxYCpCwTV6ZblUimW44knAc0kkutxbzAgW6g8tFhRArBXc4pVa9dATZQcEq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRjyN1b3GTVUp6QVsJxbnSlFb0N/vIemd4Y4ajT+QzI=;
 b=F2/yowibWI5pdQlT7n9SXR67+O67BhdYLhFxG/l1LX7UT0bi6IA7982z32E2Lw9dqz0bk8fy9Njf+xJCDUqjtRESu/g7Q5ie4fpE0u41dhowl5QpPhAji5eJJdx1+P5Njffi9wzMMlVAWQj00TTnkCA2UDBc8weVrZNRoDd15iFsxC3mEwlfk032NfqYYX9qEq2HINjT9YGbY4QyMZvDH+iaaP0pCNWzHB4GshvuDw867bZJ7rIsMPxldA8hfZVHEv5HDSJaLF/OtROFolRprJeTj6qqfw0gEKX1HEUkaHV+aC20tTxHn9Up69qHbDI+4MZD3S1gfQXwz/ESnmPKzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRjyN1b3GTVUp6QVsJxbnSlFb0N/vIemd4Y4ajT+QzI=;
 b=ppk9PWOJuQ6Rn5kSJsFRVOnuauvsY5ig/QjuTjsOa2vVrju0Zcm4zFmKXOCtpbU89lC1uGg5HY+NHXRN/C1a+WwOAsxd6WE2C7yhqVZcuAbsw4VX0JdTXzTJJpaFXiksVAYRavpTQzPNkvCpDx3Vzr+fxBfX2RrWk2Au0GGpDEnbhzUTjAOu2cWU25Zu3CgQXTKwfGX1A7lbIGfB+5F66ftDucn3Aa2VKMQjdTmWNN6qNZRDXaK5n1BQ71gmXYRWdMGicqCjbBiaXSwvDOmZKkLZTb48DsJ76oJaLrht/1/9FFLFqNPRwznPiKy7HVvhjxzBt+ptZjXB5ZTmDvhjFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB8070.namprd12.prod.outlook.com (2603:10b6:8:dc::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 02:12:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 02:12:10 +0000
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
Subject: [PATCH v6 30/34] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
Date: Mon,  9 Mar 2026 19:11:20 -0700
Message-ID: <20260310021125.117855-31-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310021125.117855-1-jhubbard@nvidia.com>
References: <20260310021125.117855-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dab9ccd-9b67-4dcc-a61a-08de7e4a6f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	ZAM4FRwTRJi9h8hse89Gsi0fSjK2g5kTehfrBaYXN4zFfynPj2vOhNkz5hOBVEAHF3MFi/7YWHJ/TA9TTVPOdNoCXNdGDjcWn4sh/5yphaZgGkEWjhsUSyckLzX9woaKVSZHEwicialHaqdwiAltVKiSz+CxWTvwqt65zThn7VEY1ke9F72q83Pfhzdf7LZmF+V/LAKtTjmeuKm0HzJLKAdK61DDt03FTyz2iinmMqsoVaXF2a0MUAE0psHPCSL3rhBaW/pUoL5/P/C76EqRgeTizLUFqNRNGnWSvQRpiP7h+Sukc/LtIQDlhUA6Ximyx3aq44/9R3KQPKbR7y2/o8jT7cr9p8/9JW8nyHow/E4MzdUKi0F/YjiIS5AqVlFfU+jP1AGBkH6GHZEXtuFUzn6IpwdUWv4asaZZ6R3dmXjvF0Zp3lZrpC4D9MTjfj99SL5+wW9lK2hXFm1jTtmDN+DVUeqE3bdY9sE2Duz85Uw+QROjrDugR/uLVDVQjeN8ihGY814AtEXJkK4AY/XIvOrYb+lvcYQBjVzUPzHBfaPlpx6v/GCHZTGe8XKXNWPYxUm/IXkn4W2PnX7muAMXFoXk1sw6/xjYp6Pa4UHwzol1LdKmauW/U8vxDoCWG4L9cUbLq5FKGA6mWLlsdfy5NECIbOBUXqsy8cpR/f//kT1Ca/q0s1KW7zNAffFsXSibTByM3Nay/cwZy04Pk5x9j42VwbrvQFd3IxrF0EWMMHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R83FwTUNx4ljCxHM/72OvItzdF/RRxKEnKnYIGyRAfuX/GnWHLLzygke8RGG?=
 =?us-ascii?Q?ThYlvEZY4wahrTMGn4JYexjMZSycCk+8mHY6bNAfzJlpvLRnlKUNZJ4VTKYA?=
 =?us-ascii?Q?ra2bw6eLr6CZMjolcDLKzmrpO6fykVj9ZeWyq1a4pNWvgaRFsjckycSUEIt0?=
 =?us-ascii?Q?n8oZqFWQMSae6rkXr9CXFUB5wjmdOR8twu7zfz4utB1+UHCte4lxrj1zhazj?=
 =?us-ascii?Q?isbxyLsPh8Kgpgq4ZjN3R4LPmkpX4sBmCjriHBGYo2Z1fjUaGdaf3z/mrEms?=
 =?us-ascii?Q?RhF8YH3waJHPD9pVIMrOLvYrFSqxhQV0hnZKBDKLlkBdLsgwoU6pbscJzjpc?=
 =?us-ascii?Q?VVAWP+Gk9YS8YrNxmZwlsPa8iXZxWCIzLjp8CIfpgvcPnG3JIMb2bCC3iThE?=
 =?us-ascii?Q?jnkk6SLa2X1ermM/JCwB1XYdQSIgR6yDtTf72CM9INl6OKrZ7jGD8nBoUvzN?=
 =?us-ascii?Q?P+x+d1u422GrFxRvLTqnp3YGuI9VVQz4KoDIx/wQZL0G7BE/7o99SedKkm3Y?=
 =?us-ascii?Q?Q8knS2mF2iXgJG6m6yDMtgX6l+MXSvndwT9nbuwsM0nFRVasQ/QbwDbuqTUq?=
 =?us-ascii?Q?PxpDVuusj5giBhkpYamQHoKnHaTEFvcS7oWEUZAphC5vMvHUowqzO1JfMyC8?=
 =?us-ascii?Q?C0p1vn5iRQBRw/nVRc1kv9F6UX+5WwXGu+2oWQwGfqLWw6nWLsMRK8sOCeb0?=
 =?us-ascii?Q?/A6EiXpO6F18WBDZNXBv1p1EQ437F3VSqwnTmgqF1V0bNkKoAt3uJ0Dg9MPg?=
 =?us-ascii?Q?Joo7pC7rCwE6/kY/L6qCJyn8L+9I/gqDhHASUa2NdlAnXmxsZZ7naAkj3vSU?=
 =?us-ascii?Q?0lt+8StPSkfKnUi2F79KwzXMatXizHRRLRurCGmePRexTNi2dM6dDPfO4CVx?=
 =?us-ascii?Q?o48VBXWJ2cst8vqNFOBt0XXoTMVu1t+N0j0gz4c4+UrlOc79D2jEtAuq0uNg?=
 =?us-ascii?Q?/DFZ1EegpJ9Eo/RXFNtiyoRx1DUAI8oVxJSzLPfBTGQE+ztzl+hB/Ua4F/En?=
 =?us-ascii?Q?sb0j05RpsKZ7JXJSB1lb4dOu0uqdwsmnYoiQdFSwIU9dWd7amwPnKSaQwGdI?=
 =?us-ascii?Q?sWU8Htgn9Pr9Vl5LD+g+O9COxVGkobG/ah/4WsYGtA2WZEEHYP9ws/flQfKA?=
 =?us-ascii?Q?jDsk3+CZxPaZriT5Y3a5iuikGfm1Ml+73gLE5aPuQdBW/Z0y9ZfVelX1gUDb?=
 =?us-ascii?Q?jjk4vtbkK++tlKvwzIf1YAocKuwnV8TT7DmnSXKXdTwsps/CjCZxHu2NzUUZ?=
 =?us-ascii?Q?nUCDt2Zxo7lASRm6481qRUjsSkXA4udjhYXIjYDw69K+8W3XFOLAm+6w7n5M?=
 =?us-ascii?Q?eBEyZmClAG6f8v/QZ5/5VFAaZ7DeuK5lElv09J6wF04Uo0dcwbth8XOTHriD?=
 =?us-ascii?Q?4OYNYQqvLbyX6pOftKx5oax0BkGJ9jD/+YwkFF1sGu2x1/ACpwlEHuH6Ki8o?=
 =?us-ascii?Q?mSjvtrCXGiKEc7vOW0oe6rSAp/yaNCj0bvwLwCQsKkgKGSzB6kOSZy4irw2P?=
 =?us-ascii?Q?tPLDpFWOulQucVhdGyiwrwvxcOsg8FIJFZWL6Si+fTgnYeuZ8Bkiwvc1G6FR?=
 =?us-ascii?Q?yoWULwzkw11j0qAa8hYYG8/6RGmfWpUR8tZgAIdjfT3Q3/BAbC0s1JMagG9G?=
 =?us-ascii?Q?SCyEenhOQ8WbapRgMsPweA3HEy5ZFnctHLcBlaLhd8KPIHvuFyRKZRqnQjph?=
 =?us-ascii?Q?7BFXHJlJD5q73Cxl+goLWKjOlDZk5oBgEoPquLW6ACg3r4HRGO7N7TlB1/VL?=
 =?us-ascii?Q?Ew9Psf7dKA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dab9ccd-9b67-4dcc-a61a-08de7e4a6f32
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 02:12:09.3243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx1M0ZP3WNOteWVUkhG5BkDe8aYzzlSx357ek7GyYG3fAz1LnQ17Ax8hMwdfyYxPYOwM9dV3aIWrg5ADfe5A4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070

Hopper, Blackwell and later GPUs require a larger heap for WPR2.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     |  2 +-
 drivers/gpu/nova-core/gsp/fw.rs | 74 ++++++++++++++++++++++++---------
 2 files changed, 55 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index c12705f5f742..5943db2b619b 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -247,7 +247,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         let wpr2_heap = {
             const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new::<SZ_1M>();
             let wpr2_heap_size =
-                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
+                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end)?;
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
 
             FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index c1f76659dfba..7834efc9095a 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -48,32 +48,52 @@ enum GspFwHeapParams {}
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
+            Architecture::Hopper | Architecture::Blackwell => {
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
+            Architecture::Hopper | Architecture::Blackwell => {
+                GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100
+            }
+            _ => u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE),
+        };
+        size.align_up(GSP_HEAP_ALIGNMENT).ok_or(EINVAL)
     }
 
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
     /// `fb_size`.
-    fn management_overhead(fb_size: u64) -> u64 {
+    fn management_overhead(fb_size: u64) -> Result<u64> {
         let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .saturating_mul(fb_size_gb)
             .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
+            .ok_or(EINVAL)
     }
 }
 
@@ -105,29 +125,43 @@ impl LibosParams {
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
 
     /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
     /// of `fb_size` (in bytes) for `chipset`.
-    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
+    pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> Result<u64> {
         // The WPR heap will contain the following:
         // LIBOS carveout,
-        self.carveout_size
+        Ok(self
+            .carveout_size
             // RM boot working memory,
             .saturating_add(GspFwHeapParams::base_rm_size(chipset))
             // One RM client,
-            .saturating_add(GspFwHeapParams::client_alloc_size())
+            .saturating_add(GspFwHeapParams::client_alloc_size(chipset)?)
             // Overhead for memory management.
-            .saturating_add(GspFwHeapParams::management_overhead(fb_size))
+            .saturating_add(GspFwHeapParams::management_overhead(fb_size)?)
             // Clamp to the supported heap sizes.
-            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1)
+            .clamp(self.allowed_heap_size.start, self.allowed_heap_size.end - 1))
     }
 }
 
-- 
2.53.0

