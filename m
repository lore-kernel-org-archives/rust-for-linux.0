Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE2F33291B;
	Sat, 21 Feb 2026 02:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639874; cv=fail; b=Krt05+6gpIYh+4LXYOL6jTz4ZL5R2oD74Cev3vMyin3syLmgcQSXaiP/pOv2fkNYgbgITIPOc4oJ1fJ9ul9sOALeqOdIJgSkmPkouLwn35y4B8TBFTXbyzL+y0tEEKs6UzJ0AyYvEMMQOd1PrcCBFTsmxlpGlB9vNxZk2jRG9Wk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639874; c=relaxed/simple;
	bh=bVNIpTCZT6/bAWLPx0eNuwWnnDdXhciEfoQ9CJbBvIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OBjRDiTNA9F22bL5VYtjxs1XXXUn6652aQXxlfc+7scERXIQsX9ar1z173Gt90+l1sVTQdthsRPf7xYQQx8ruAfN5Ylz/6PWZmokROntaJ+CCCxR8Zvwf2ChsuLAbfWP2y9HTpEIY899E2FyT4xF2wsvolkcNq1hOkVQMdJZ8wQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WY0gmNDQ; arc=fail smtp.client-ip=52.101.62.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WY0gmNDQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIUzyKbCjMB3+eCuFADkNl832QqrmDrT46AJsZzGnq2AlU3uUCfrZ9aJW2fwQRI21UsoB0s50Z1Jyln6+wQXFH+TiiNIJaOTpto4Lwe3Qhk/JGpPvf05hOsODadOpvvpAzMPhPAVFEIeYo3jzNQr+AqOYieROjo6kFAsTlghebnVniEgChpP4z4dst+V1s9CdPs7Xb/SbV+h2lLlPGBpIhbsWg+UNUsphcZ4AUi2D5amvFqakihQU/enbc4o5OsfMCF8Hd8j+CDcrsA6nBe5IWAM8D87Fo/E97xHDjVAztI3pciHCOlFodu2tY68Kc82eDxHuzexU3Nej2k8QaszkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2zPAx6cP/WQttGVBccy6pyyPo0kn3UaOfaw+OuTKqBc=;
 b=mHQhMAi0Fz5KS3wO7HeLxb4IpJ6zteEecevvi5cEUO7K3C/WkowPjXym6XipO3i7MqkNbmf4K2bkR4A/puIYD/ZtSF4TqjAtO04dpCrQGXHerfLVjoAHX14LjuErrMssDLUW0icTIooavkNOjHYDuxz97eaRzKyxEUrJHf5rOTNeGfD5mG62EbUv4K2b1BebXKpYOHHqyypSTsiQ/LzmCNEEzMDuKvFHnvj7Gc6gseNsD3VRoICYkWW/CwLQBFf/7vw5ciVxb5ZjiaZ561gkuvOChCpVqtA3Qmxj4ZCubY4Jwt9xKtJyp7+EqeF3yNFYZ6bMo0GeKyYaBTflCerxmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2zPAx6cP/WQttGVBccy6pyyPo0kn3UaOfaw+OuTKqBc=;
 b=WY0gmNDQJpgyKCDP3zkC01G/T6LprQepqEPbkRzrlD3qdpXbLQx/u9v7CwVNxGRyiG25F2B93qSW+0ioPK+9C/tFEZr03lCJsPPQ9R8DCEdZHh+mRfDhbI8MKQbPAzcj7/trw+v5/oUrN+QteZBknhz/clT+nH/pkIgA2JfS8ef5P8ufqjn+/3eqRu6T66mKog7Rgj+OU1Ue93YH9t/wgSz7kRVp8kWeZc4VZtWTsBV4LdvZnjNT1mICnskjFyxsJB3Ag2rYE9JPCM9EE0Ech2ncvmL2zUgKaflApPGWB+/VyWeW+b20jPHxeUxnngeW0HBL6UNKoJzNch5PJ0NNnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7378.namprd12.prod.outlook.com (2603:10b6:510:20d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 21 Feb
 2026 02:11:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:11:05 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v5 38/38] gpu: nova-core: use SZ_*_U64 constants from kernel::sizes
Date: Fri, 20 Feb 2026 18:09:52 -0800
Message-ID: <20260221020952.412352-39-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:a03:331::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f1584f-7561-4868-1665-08de70ee69b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P4W/UOOqnuuSo8ggacue7/qi9d87ic/NCzIVCWoL5GpmA1IhUOi7j2rvj0q5?=
 =?us-ascii?Q?hw0/SB5mNcCHiJ0P6gf5aXtGqeG0jIidDf1nNTxZ+5o7J41kusl4UfnBOeBr?=
 =?us-ascii?Q?/WsGFF22O0hk2qkAJCPScMn1Zj1/g93B/OSSEUP9GSm/18zMyRiHMs7U8URE?=
 =?us-ascii?Q?JqFg4+GkycBjMPE0J4KBROLhIpZOdpZ3DL/6Kdh7rcKJPYJLiBEqWSAlsuOc?=
 =?us-ascii?Q?OjF99pY7NPtRyAs+ThchMUEVg28zVs/U88i6whlFJeCVG4BkgmrH1gL37zto?=
 =?us-ascii?Q?HW3iWT4dKeDpOwTuW7d9GIK2cA+xrx7dMjWoCEoJzyz6I2FNy4wPBqwRef5W?=
 =?us-ascii?Q?GsQ7CrNC5zZf+1IMXyNUYjJbmo/EGW15XfT5pMU2U6zl269tTun1UsALZ1US?=
 =?us-ascii?Q?Zgu1ZesBaJpaB/NgrtqVKKwn72pIZ4BZGDk4VUlYdFZj8muKurbqCdZN8fWB?=
 =?us-ascii?Q?/HtGVCNFm6AsJ+9zUeet9E4vWGedyTBKTwyeKleDMl8C8blKuS9KtHmSXZ05?=
 =?us-ascii?Q?DnYf8BAujkvaIis3PNR51bkfuuv/UbDjfWY+98jN+G2zgc0mMOhLi1tIZkTF?=
 =?us-ascii?Q?bjN9qExjfHVd56ENLB0MPtNk25q7CXzGl6qMe+1R4z/KjQpx7OFAVvjciC27?=
 =?us-ascii?Q?7dq2pNIrGKvUTJAC98cOtb8GzyjwQX+0t2lmXAcJpG0sF0LgJl/k8/bij8fT?=
 =?us-ascii?Q?/c2UKrrRr5gXRXuTaFyDOJSafeKRIyT89sGCUADmln36bC6KxeX/0u97UEMX?=
 =?us-ascii?Q?ZKMI0TEHZ/gxf0POvcXfVCqlTiPfVkdvVtLyUCbm++OaZKxuUdZcRB452qdD?=
 =?us-ascii?Q?bpYPrJuXSBLjJ6xtX9xyo1VgVl55G3WfLerJVENIb6MUnC/9+Ne5Xd05N77Q?=
 =?us-ascii?Q?J0NY/asud1NHNIeG7+jhfWEFes3dg1RVELyLBjKNOEsBH4sEYCfB+9J2YwwM?=
 =?us-ascii?Q?n0RRdtwEG4j6eFAvJ/Gq/lEE4Ckfu7UEANyPKz/tWzw+lj/IkseyPM4Ztnab?=
 =?us-ascii?Q?ccI41SLqbSV5g8kGOOv/PwKAHzZpSrsjh2qMsigI8O7k3ra7I0xqY/ibZdFG?=
 =?us-ascii?Q?U/OH90ntXlJkrp8GB2yxy4rhImdoMdEC7QY4xV+vtio65kGm5xF9nB0Oc4x/?=
 =?us-ascii?Q?avkm7tRo6wffDH6eBm4YuYpT9yHsEe7v8u21r1l6ejudxVDLkHWf0wmqSFBB?=
 =?us-ascii?Q?ZcJ0GvS9V9uEcft3u51SYdgdowCgiCG0IIE3gJlUqsoqv8hlv/uONPDTWAH2?=
 =?us-ascii?Q?bxjXbNuwTL+ZIEbbPdMJWoj+obNh86f46lq67HdcW450LL7fgIW3VYH8NY+i?=
 =?us-ascii?Q?etiAr/d6jtIw9VWUP4g3lnQzTzoqSIP2i1gHUuOBXfaoAZWwwH45xcZkBr7T?=
 =?us-ascii?Q?Z8HXwgr77UmvWQlgw7TnNC1yWAQmT/duMS1ZqU/Wq6RbshiWgT7Kvo6fBwUe?=
 =?us-ascii?Q?6ckf4moUet3JWOlPMWdrqhU+ogJ02jxTESGwqF58eX65cAJLJUqdklkMukO8?=
 =?us-ascii?Q?BEI+n5xsKbLV7deevOtHUU3sq8SiuSl94At8VrVxoJS/VniVlpNz3Ges6pYs?=
 =?us-ascii?Q?orD2MWjKKZvDCKN2acw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Ta4kQgcFL2oHfviJdOWpoxTaP5B06PWFQenbQ5BDqqRoMHvVFRRJgdx/OqU?=
 =?us-ascii?Q?JitRl5gfOy5LB3XNVX/oYa5pufeFBO+F6SBfGBK0xJHmyTfA4dde6JOnqKV/?=
 =?us-ascii?Q?Q5nHxlJo+jc8sjhvLcE8z0g1Ss/kgdtpyPQcpQ56DUYWlbwfXitfLPwQ1J+2?=
 =?us-ascii?Q?Mo/iXa2TtbRpxrUVQx8ezERZYSAMLLPu4Og/cNUN+NfCJGpzYkGBwaHwqHyk?=
 =?us-ascii?Q?SD1/IJslb4oE+LSLBCO+CR5KApkUS1UVHJPnRzRCQc7qvaflm014VI+NGPfL?=
 =?us-ascii?Q?CT2ir9sJqHIITDJdipRDZd+x+u2+BUCqwghNDW6HBXosI8m+vp78Emuoiuwu?=
 =?us-ascii?Q?cJsOExcD5y6PEpp1l7yLeNOGPgpgjlpS5j/27Dq1rtRaejL+Vrgy6ZDJ4hHG?=
 =?us-ascii?Q?mtswgzmej6veH+00GMBCt3Huy2vJ1qaUKux5C39BDPaXbVMDO2g1yErrmcpF?=
 =?us-ascii?Q?TO1Dsl0G6vs5cWncw7LmoXtu/J/fdV676BSP0JwOIZ8j1yNRbzYLWtI70MRM?=
 =?us-ascii?Q?nT85xazy0N3JU6zJ33HOxPef24dCZrzRQ9Z39BBboLajtgj+3lGOjh61Fjys?=
 =?us-ascii?Q?EA0yc8pWL/Xnzb+CfUSzuWeM7BaBwPRr18g0BfxWXddjA+aJVTnkT9QwDYag?=
 =?us-ascii?Q?Z+zWGi+zH9c0yTj8s63unZ6/7pyP0a/9WARY9TBCSbF/TQyO3Di+azsL1KpA?=
 =?us-ascii?Q?Fw7twiB7SOXAt1jX1NEtz6HOz0tNGJwWB0R5intIW2QFgUfEElnK99b4ezsq?=
 =?us-ascii?Q?4J0Ylx4sKUXQijLfsmhxjVgedgc06KZNiUksjvKlJQvEN1eXQVBNOq4guFPM?=
 =?us-ascii?Q?Tf3HMu+i6Cmy1SbSVmvJ72arKozlSMSvEkAB9wmARcGtKHSb9ejaGVvdHZkE?=
 =?us-ascii?Q?DKecyf/41DNprhhglRU3R1vECPX8v8CA/wgi0qwcnjl95/xclZlUQugprZkQ?=
 =?us-ascii?Q?vGe6hg/5mWPZk5+uL1o+JryQohraH3NVWv030BIXU9gNl83JCspDONVBX9+7?=
 =?us-ascii?Q?Uqx+37jha0jhyY/qCsNh473iRQjCalNEwkeXdYaDSbW3iTa1uyeoUSSXittf?=
 =?us-ascii?Q?HZFmc9xo6xZ3dvvZsNoqGfGY/1nDDr67zpnYewllENYGRxZ+iIGHRfDKaO/f?=
 =?us-ascii?Q?kfr/zZQQIPjXdSTWewS91pr6/PRE1KKySaByFEC7YwkRgoVYNtDhdANJ+c6Y?=
 =?us-ascii?Q?z/70cLR3p6kJv9Z/hv/DJDSM1VNijm3N0oAqnkIDMMAuSSklOLErpGoln1+n?=
 =?us-ascii?Q?XF7erBCJWBYyGR+Hdsqd3tJ5ezvfu7jDZFi5nYiUPECrdq6OM17BxMdtwUvR?=
 =?us-ascii?Q?YeQVlNysy28c3sXvM2EzDgZFBFuyeJB41EXYXW4nW509QmYXMtfRtGkbpKxK?=
 =?us-ascii?Q?gVK3w6SWWD9EAIGYzuimkX2SmK4qhbF4M3T/CWfnReebOPSs3qVcoiujGMte?=
 =?us-ascii?Q?oqhWvPruKyTUNCKNor1mjFN1N5Gk3VuCR9+K0aI7dzO+RgP2eeK6oV7oujCp?=
 =?us-ascii?Q?hvzwr1LgFNMrBXOefqnPnyxp5ZKCpvWRKkxhEDf6VvmZse7+fmf0R55/Vv+r?=
 =?us-ascii?Q?N8L5I7Xfo75Um0/N86lvwyb5BvAZAGb1QOqyfXhU24hk5WIDwFH+30KGq9ZI?=
 =?us-ascii?Q?fM0S6FxlK54YA4DUQHvAm9ELdTbICa6hhxoa+6UKkubq9cXkzgGGj7pEYwUC?=
 =?us-ascii?Q?KbQMozRhWLIo5fOAyoQQpWAv5DJ5BGJmVI1nSxp9j0objmrYYKUYMMGNEbZk?=
 =?us-ascii?Q?ktVrDkjDYw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f1584f-7561-4868-1665-08de70ee69b1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:41.2415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxMtv1tvJPkENW+w6mxBX2JjptifomN42Ac+VxVIOnVM9X5DYkE5hEtudnXD50zqHhKBJwsfKWOJCJLMS69hBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7378

Replace manual usize_as_u64(SZ_*) and u64::from_safe_cast(SZ_*)
conversions with the new SZ_*_U64 constants throughout fb.rs, gsp/fw.rs,
and regs.rs. This removes the conversion boilerplate and the now-unused
usize_as_u64 import in fb.rs.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs     | 19 ++++++++-----------
 drivers/gpu/nova-core/gsp/fw.rs | 23 ++++++++++-------------
 drivers/gpu/nova-core/regs.rs   |  6 +++---
 3 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 08e6dd815352..ab52a82e21a4 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -24,10 +24,7 @@
     firmware::gsp::GspFirmware,
     gpu::Chipset,
     gsp,
-    num::{
-        usize_as_u64,
-        FromSafeCast, //
-    },
+    num::FromSafeCast,
     regs,
 };
 
@@ -105,7 +102,7 @@ pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
     hal::fb_hal(chipset)
         .non_wpr_heap_size()
         .map(u64::from)
-        .unwrap_or(usize_as_u64(SZ_1M))
+        .unwrap_or(SZ_1M_U64)
 }
 
 pub(crate) struct FbRange(Range<u64>);
@@ -136,8 +133,8 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         if f.alternate() {
             let size = self.len();
 
-            if size < usize_as_u64(SZ_1M) {
-                let size_kib = size / usize_as_u64(SZ_1K);
+            if size < SZ_1M_U64 {
+                let size_kib = size / SZ_1K_U64;
                 f.write_fmt(fmt!(
                     "{:#x}..{:#x} ({} KiB)",
                     self.0.start,
@@ -145,7 +142,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
                     size_kib
                 ))
             } else {
-                let size_mib = size / usize_as_u64(SZ_1M);
+                let size_mib = size / SZ_1M_U64;
                 f.write_fmt(fmt!(
                     "{:#x}..{:#x} ({} MiB)",
                     self.0.start,
@@ -195,14 +192,14 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 
         let vga_workspace = {
             let vga_base = {
-                const NV_PRAMIN_SIZE: u64 = usize_as_u64(SZ_1M);
+                const NV_PRAMIN_SIZE: u64 = SZ_1M_U64;
                 let base = fb.end - NV_PRAMIN_SIZE;
 
                 if hal.supports_display(bar) {
                     match regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar).vga_workspace_addr() {
                         Some(addr) => {
                             if addr < base {
-                                const VBIOS_WORKSPACE_SIZE: u64 = usize_as_u64(SZ_128K);
+                                const VBIOS_WORKSPACE_SIZE: u64 = SZ_128K_U64;
 
                                 // Point workspace address to end of framebuffer.
                                 fb.end - VBIOS_WORKSPACE_SIZE
@@ -222,7 +219,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
 
         let frts = {
             const FRTS_DOWN_ALIGN: Alignment = Alignment::new::<SZ_128K>();
-            const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
+            const FRTS_SIZE: u64 = SZ_1M_U64;
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
             FbRange(frts_base..frts_base + FRTS_SIZE)
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 7fa9d3b1a592..6ab0586d5e85 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -16,10 +16,7 @@
         Alignable,
         Alignment, //
     },
-    sizes::{
-        SZ_128K,
-        SZ_1M, //
-    },
+    sizes::*,
     transmute::{
         AsBytes,
         FromBytes, //
@@ -53,9 +50,9 @@ enum GspFwHeapParams {}
 // See Open RM: kgspCalculateGspFwHeapSize and related functions.
 //
 // 14MB for Hopper/Blackwell+.
-const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 = 14 * num::usize_as_u64(SZ_1M);
+const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 = 14 * SZ_1M_U64;
 // 142MB client alloc for ~188MB total.
-const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 = 142 * num::usize_as_u64(SZ_1M);
+const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 = 142 * SZ_1M_U64;
 // Hopper/Blackwell+ minimum heap size: 170MB (88 + 12 + 70).
 // See Open RM: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB for the base 88MB,
 // plus Hopper+ additions in kgspCalculateGspFwHeapSize_GH100.
@@ -89,7 +86,7 @@ fn client_alloc_size(chipset: Chipset) -> Result<u64> {
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
     /// `fb_size`.
     fn management_overhead(fb_size: u64) -> Result<u64> {
-        let fb_size_gb = fb_size.div_ceil(u64::from_safe_cast(kernel::sizes::SZ_1G));
+        let fb_size_gb = fb_size.div_ceil(SZ_1G_U64);
 
         u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
             .saturating_mul(fb_size_gb)
@@ -111,9 +108,9 @@ impl LibosParams {
     const LIBOS2: LibosParams = LibosParams {
         carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2),
         allowed_heap_size: num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB)
-            * num::usize_as_u64(SZ_1M)
+            * SZ_1M_U64
             ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB)
-                * num::usize_as_u64(SZ_1M),
+                * SZ_1M_U64,
     };
 
     /// Version 3 of the GSP LIBOS (GA102+)
@@ -121,9 +118,9 @@ impl LibosParams {
         carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
         allowed_heap_size: num::u32_as_u64(
             bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
-        ) * num::usize_as_u64(SZ_1M)
+        ) * SZ_1M_U64
             ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
-                * num::usize_as_u64(SZ_1M),
+                * SZ_1M_U64,
     };
 
     /// Hopper/Blackwell+ GPUs need a larger minimum heap size than the bindings specify.
@@ -132,9 +129,9 @@ impl LibosParams {
     const LIBOS_HOPPER: LibosParams = LibosParams {
         carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
         allowed_heap_size: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_HOPPER
-            * num::usize_as_u64(SZ_1M)
+            * SZ_1M_U64
             ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
-                * num::usize_as_u64(SZ_1M),
+                * SZ_1M_U64,
     };
 
     /// Returns the libos parameters corresponding to `chipset`.
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 8e4922399569..7b075ddd3ccf 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -10,6 +10,7 @@
 use kernel::{
     io::Io,
     prelude::*,
+    sizes::*,
     time, //
 };
 
@@ -33,7 +34,6 @@
         Architecture,
         Chipset, //
     },
-    num::FromSafeCast,
 };
 
 // PMC
@@ -166,7 +166,7 @@ impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
         let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale()))
-            * u64::from_safe_cast(kernel::sizes::SZ_1M);
+            * SZ_1M_U64;
 
         if self.ecc_mode_enabled() {
             // Remove the amount of memory reserved for ECC (one per 16 units).
@@ -255,7 +255,7 @@ pub(crate) fn completed(self) -> bool {
 impl NV_USABLE_FB_SIZE_IN_MB {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        u64::from(self.value()) * u64::from_safe_cast(kernel::sizes::SZ_1M)
+        u64::from(self.value()) * SZ_1M_U64
     }
 }
 
-- 
2.53.0

