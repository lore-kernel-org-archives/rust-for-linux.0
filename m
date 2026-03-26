Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010038.outbound.protection.outlook.com [52.101.56.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7663A16A1;
	Thu, 26 Mar 2026 01:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489195; cv=fail; b=HF1k9mqpB3uwf6R2Llw4HDB0zsDCRtYOOtCGJjNNZVogf2HAfz6BtMPNLx+Kx+ip0uMjKAJHBqAyXaaU7I8xf4Du4nmSkwV8aC4EW9Y0U12WELYELmp1YeJudw42s7yUoWn3egd8aWx/KsvYjoJUJM9ImJ4LRklVSv/85bNZw98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489195; c=relaxed/simple;
	bh=D3oMesYnL3w4cSC40H2q/IlphxyUt8Q6v/251LnxEZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kI1XNfvMoiwcDn/JyxhyhaVyMyHQVJrEHOB/4ZTQ+jB7CwTEsP6VG5kezfI4dBGyuNx/Z2FHfPvHvQMx0Wv2+Kyg5tU1/aK2PF/PDc2+kTrSNMnzwUYBBrUm77ra9VRL4h4ZdIc6G585tC58u3NBu8n07uJvFyJGd+RgrdI6Sy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SrCF1htw; arc=fail smtp.client-ip=52.101.56.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SrCF1htw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=koJkc1dzt+TZu1mU8wFHWfvYHTWnHe8wWU9jB7IUSBZXs44aQzP9Xu+CUafjOsOzUGBL7DHRWqiosQ0USKpuxGRjNjQgHLvjVclUIWYs3XqXMMbQbbzIhCZrRsYw53qElUpmxpONhA4idHHvXys+9K/Xnk7p2JVkJbET+FSCPV6AnuMcAND1WmvKsM5VHvlruZkDc9c0tKgqeK1qBqquT1zQAqh4l1HtadnNyt51c30LXOAwaQuXcVZ4GdJyoE5sw5OpJ1fQf25nRsY1xCaXPoPDDwkhIQrzls+ElBmJPK6QvrZONm5iNqKIDLC94ktHgdPW6Jei6GqjF/IxpDaAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GNEN+O08oVVF1AlzFNtRgNxuzRaDTZf3TZS+oQFkuw=;
 b=d73G79AVE8y4Yijg7MvuQhYR/0QshxVhHmBbXPDehWFjbaNPzrJ+x311DyW5vwJyIppa4Dr0+nr7TBeV/HZ3ED633fFZ4z0tXh3QSsQXJe3vHcSF/l/q51bhDM0ecuHSPK7go9GvyMTTksvcosiDkMPH63cdTbeba3nChiNmiybFZJvWGcf3wfX2UUhBlTBTIzIDN2gzFjVggha+ZhikTZjzhZTg8AlbtcspTpEsfFqi6ZUmap2MpoEkiGenYQJNCD1Lp/QBsQQrb6p94cGM5n6OOvlZ9eje3LiD639SrM37pIXD6Cx2rLmTPohUmrQGuk6I9JAf52T+Nc7JmdLHEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GNEN+O08oVVF1AlzFNtRgNxuzRaDTZf3TZS+oQFkuw=;
 b=SrCF1htw3BYYyz1VRaupBssoH87YnNqBAQEnaEhZo/FU75CwVAoop99ZPk3fSiHA6vaLPfLi4BcQDtCoa+y4wMO6numWiuQZCfbqzRdhT4EOR7mgEr045J2ixNfxTvSa9Fv790mbByX9pe0Jr1acgtX2YYcblWccf0i8CRUTNhlWRSBk5ugu8fLhGans+TXxNV22wo8/zYhuRJhzH8BQR+RjtqLtscUiXpYTJvROHd9ENHG5MhDnbRBlbnT1TxiShQGv6vchM5+rhEXyZniT/xSmtT5TnER7xuGGHQh7FCNXk0tVkcm03Cozks4kEYBb8PCuh7bCV9KUNQo8XaXeoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:44 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:44 +0000
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
Subject: [PATCH v9 27/31] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
Date: Wed, 25 Mar 2026 18:38:58 -0700
Message-ID: <20260326013902.588242-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 01ddc0cd-f9d1-41b1-a198-08de8ad88e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EIefb2CRTOpvtIiWdSztvFhqn4XklkUTQZIRkEYuzxhBQRcTO8HTPE0DlVKVNqPa/gFjYYgJOk66rsqF/4dH2W62NIja2Ain/lFTukGJaakn2/CorSSXMPTbqaai+57tTvR/+Ad/Wd4xW+MfLVyZZzQIp/SnhKYIngwXQZDAbwqBgmO1pLb9tIdD3h8oGdYESw7W6eJGrNgE3v/j8v9WzCLGNAuTJcHEdt3J8wROfGL/Ek811b6B+eRRFVGapGCI3pHteZ9Z//TtKfyV5MOTNBZ601jQR3F+NnoJMXdToARsZaFmcFaYkPRZzlGgvJHoz3R6srR0IX2S26xiBRJaRJxarMH0ECYt93rB7hsAIO2dQLL2iMw7wwXhwyAxHN9cbukiGlFrSrOBbq0WAxOjn2+wm7Fb+/YAcaCaaj/Kug/qPWoo9QzVE61rmeixX9+QZHl02BxgZJR8jWUbFq/6zUhUPjbVDVuCMr08c52e9eJr5MJ7ffwhzbPb7M/nNBIemf2+JPNkcF22QY3rC75ZlhMnJUXfVXIj0rO4daNIfyv4W4+VE0pR0n83PFYrDC7J6tCrenC5VqpUDVca6UW1goRKx4h/cGQ36QHdIX0ctzQPb84QbdzDLEltSthpn5qTSE+6PZuVocgJlJT3ktVld3yheS++bGjCeXoKPN6B6dhRhY4Kv7fzFkGvwKjcfAVYcRKwyZauvyjedtgeUJOsyf8duw6zkeycQjHHsB1lk0s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?szBpQ339AunQE3gS7UVFfmqXjeimObNq7lCxefJH+l+3tvldRKMIHnE7GQdM?=
 =?us-ascii?Q?roY1VeJQSAStqKPpPtnRSZOGelK9Msz1kFtqaNfpY9n7zA7gey0Nh3kJ++sy?=
 =?us-ascii?Q?HyV8xeMVSGV7IeNb5TqMXS7xIOlN7hTx2hVNaZ4/kl+I968PPzEdTbET1gIP?=
 =?us-ascii?Q?0hOkzMwZP9usm/W9flthbHr2Oy9kRMe7MNUrfCTKC0E5MOUNQM42mra/iBEv?=
 =?us-ascii?Q?CFFWkK61O9wAgl5wDL3v+llBYX+UnbtExIwBVpILyYzLAODbPe8g5uvpmx/I?=
 =?us-ascii?Q?u4PHsoLi4FOnaTCKDKdxG2bvFpfIFgDOHdpYJQBLUUZ0LWXIOLow589z+xsr?=
 =?us-ascii?Q?+64lzFhQnzo8ZuX+ZJVXiYS5RBf8KhCITdfZ3GsNAhKGv2kiEbodUxhWK2CN?=
 =?us-ascii?Q?SuNAk5Vx830wiL273uWYu8gBI4kvp3kJj4PihehjihHdwChQ+NeuGCXHlljy?=
 =?us-ascii?Q?OnOJdFItHDPYlo8z1ok05jOEZ8K+H+juwyO6MSLUVmMx7VKcovc22PcTJZja?=
 =?us-ascii?Q?4Irq/GIBpy8GVeFxOIi+4/9JOHoo96nRMLTqzJI9UbQOMFPBYwsNOj3+AwCr?=
 =?us-ascii?Q?GqJuNKdhB5Dn4ckDqa4SAKAXxTdBeDsXJEsYrYLDyPSHN98SBQ8f9LF7RHnL?=
 =?us-ascii?Q?4YanaC3Q9JuPWR6VrE8CD32I/ETy9ht193UneFZPSSguh37DwtWbdJQUQebj?=
 =?us-ascii?Q?cRoWZudoj3tFPc6S3DqBmKz7C9hY16aqi2dnt/x1Gr7RDfcV4h+oljoKLEXE?=
 =?us-ascii?Q?TJI1D9XtJpFZwKIvlElSqsb1JLLtEnrCQp0BsnlQK0lTYG4FPtrjyHSg/gjf?=
 =?us-ascii?Q?f4ZnAFuL1PferekQYwdlcrfd+D/Q/hjJI4PyseTmYZ5dmdJn5yXaVVFZRgAL?=
 =?us-ascii?Q?v/JskTrKvi4nmiRcLhkdbMZVL2uMEpsOZ6JXYRfFOwRlsIXVNhuVS+tQuzw/?=
 =?us-ascii?Q?aGdcjXmPg7kbAK/QLqoDYBNQ6IRcCM7T5hBpe1PJNsyRXuDcS/2qcx6Wb1FA?=
 =?us-ascii?Q?3U7/se7YjGZ+MrhgKfyHnf2A3oYkpWGBIWlRIIvbKBzMzmMVw+6VEeyKlWZD?=
 =?us-ascii?Q?YLsP1DwZTM3MI9S1+vCR+TxCcT4Lx1EKL/AdmPowrLuQcYP78DYiKSbWOaFt?=
 =?us-ascii?Q?j0LZ5HMS/opwgp+oie17NQAB8uiwds9CevqUo5Hx/g7x8lLTj3gf4wtOBb1l?=
 =?us-ascii?Q?cg2XpexliADvkr7Eh4g/1mjmmD08LuJCcST3LJ5xnTtyBGP7Gobrk749xzdd?=
 =?us-ascii?Q?BJhLAv6cJNs3r62QY5uE4SA+30yKWhiC0d6Z4xti7e59YgndJdovaLB5ttGa?=
 =?us-ascii?Q?uFQmLFy0mpvbTwqsu3naggY8NllUi7lLyCnR2mfSxDgEmfbecD/uO3+fFLSJ?=
 =?us-ascii?Q?e9c8qCeVX1IjhJMQwdd2NmKIPnFLbh3iZCvA10txvxWsseW3uiDHScu5oWbK?=
 =?us-ascii?Q?a9R/v1jq8AfKSDyjbUiI0CGiS5gH1nIGmvPP0bKKCmaSv9txk9VMIC0IcQcC?=
 =?us-ascii?Q?eZZACJWmR/Gs3YNIrl5FvAIBfZShW/+gqXeXOhxhf5XhwktklVGmBBDBvZje?=
 =?us-ascii?Q?tMEK7jzCq4fxF5tZ2hPjEmpyGeWgmrgMgm6DxAKKE9dx0GYyl/b5SxRuq7rm?=
 =?us-ascii?Q?xX2iw1V0/tQxWFGVY4mzdsXhj9woEbmjKxWtfsD6Q/MHyroCcye5EH32/t4h?=
 =?us-ascii?Q?Ew3w9Yrqx8sRGFeiBeXq6EQ2BFEP1BeosbXvfHEvI4g55mIUtI9P2aC11/8Q?=
 =?us-ascii?Q?9hK4wMdsvQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ddc0cd-f9d1-41b1-a198-08de8ad88e81
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:44.3363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V3l6NleVZbEwdMvA/aAOnCI4Aaw7XmtArTmG09vwVEjj6l97t9GrVq5mDp6JextCogkMjEwcm6HdXcXvjMQ4wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

Hopper, Blackwell and later GPUs require a larger heap for WPR2.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 63 +++++++++++++++++++++++++--------
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index c510a9cea3ba..f1531b71ac62 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -106,21 +106,41 @@ enum GspFwHeapParams {}
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
@@ -164,12 +184,27 @@ impl LibosParams {
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
+            Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
+                &Self::LIBOS_HOPPER
+            }
         }
     }
 
@@ -183,7 +218,7 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> Result<u64
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

