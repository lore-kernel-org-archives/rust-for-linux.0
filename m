Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACC01482E8;
	Sat,  4 Apr 2026 21:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775338200; cv=fail; b=aHU9j7rA5nC/2QrE7kGvFfrHQIKQIhzne/mvyiSlCm2M00mmsA8luluncV/HaGJ5bFoB885bXbOIj+xIvMElffLGlrAT9A2NmQhGH+zQzb1woaghIC8pqMC6LkaTwLv3xld373RxxYJP6N7BMs2vOCnz7f2naBmAHJZv7m3C+/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775338200; c=relaxed/simple;
	bh=kqNdeR9RrAQ5HV5FZwvpgskKy0G3L9rZF8QiMbbGO/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jMqBYjuDSL7VqHx5Yw7BMK9rh1oPQi20rDD4BhPwv/g342YIr7xQmcGR1YCdoR3CPS4n5v+KlMtALD2MC9JQCPz0RQKpQLOEp7a5+afrma6hD16O7rGNFB59u7lp8Y03FT7fjA/BW9zvXT0MG5BWnBeAHClikgJhKGn7G4HGoVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sOFUDyab; arc=fail smtp.client-ip=52.101.52.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sOFUDyab"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kd7sxmmXWQO59fRhEgFpJlcmj13iINLmKR8M/Y6iXmN7E79KGUxasHZPVVQeCALcdjbfyGTb7ZAEIkCZ3LEvlFzrqkAdiVEqwCSSVS9jcbnJ4EVNb7ovrXJmEIJFXquiK26Dc2ALTjq+ODuGUpI42vbSTcfjAz1UZxFOb0HOkNi0Xpc8tXGCnfgDmVmSywbZEEr5WP9omz5QXvrF4G4cbELCmgqiWHlRrpkAfg8Bn1tUTWNqtWitPrFSso7LqNC15uDkV5U3HLc8o95uc5jUOfzZgWCvUbZKEPADmPSGZRjA15qE8L+L19sOLf/x3Ngui8X3zIJSffEVSCGHEZGyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+X3wGceUjizv3oozzYNoHImTaQgc7m4ZY9LBSSs4ew=;
 b=ye8DRNgc76sA6/xQr14xQvjoGXv88kTZoopbpG0dxE15iEpdSCL45piuwhyNma6q9/MC8F9dKddKyh+K3z27q/gd/5V2o5uJXZOcCFjjnwVMaRq6on9WDLhfOeYpzQOV4/9ZyouZDoHKzeW42shPhfdsq+KbROZqEIHvJQqJapl+pSKd6x9UElc2ByHRxfYLDndjZXWHuBN8xI2my5z+QYELwSjd8suQfi29KvwhqOBTLHHzUCqmnels86z1W/x6quDgammMcJ2uccclYXjTbhpZ1JaIn2sRqqt/N0T0k1sHGS1OGNMCps64VBq6V7OH7fqJr5y6t2s1ekzdJq3mkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+X3wGceUjizv3oozzYNoHImTaQgc7m4ZY9LBSSs4ew=;
 b=sOFUDyabWihyv9lR28Ktggq6yArj645NzSSD5aEe5v2s0D++ubzemv19b0UFzyYWA4IohDT+4ju8TDI4KK8TuNSBJvyNRHdXxPJ9k9aPi/jV3ynRzuRGZFT8B/jTTlcPXo0ER926L+/WRoiH7uLJNMFHIO7IvgRjJ2Ttv2r6LE0wYi0yDQfnMdfAe0rOJqUEjPdSpb+0qczCW6TJDa3X4CIztMbIHl1CnNsxicHab//2hKczuw6J2WZ85D3N3u7RHBmGIqxL3QwP0oXw9PiJ0zvE/rF90X590I9xKhQaJF8A1J60+W5Xi+vzWyzUzydf1DDpIcyUp02ZElzpkaTuGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.8; Sat, 4 Apr 2026 21:28:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 21:28:36 +0000
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
Subject: [PATCH v2 2/3] gpu: nova-core: fb: fix clippy::precedence warning in read_sysmem_flush_page_ga100()
Date: Sat,  4 Apr 2026 14:28:30 -0700
Message-ID: <20260404212831.78971-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404212831.78971-1-jhubbard@nvidia.com>
References: <20260404212831.78971-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0058.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: 39621db8-6fc0-4bd3-afcc-08de92912172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m+eB2aorILMoyGc2JQ8TWBk0kES4kr1e7XN4x9c+A8t97TzHWEsZt+3/tPZ/3fS2L31kY7eKilyeEu4SaMi0Iyp/Pplek6tTb1/gWWU/TVEWNUQHwt0L9bR3KL+NRtfjIMAFTckFT8NCK43J3RT1uSTuW+/2e0u9DMxWO6l5HLpVQZ5I23XabP0q5LOXjufpnluc7gWYrtfr3yE3gOSzjCoRISNrsZ1vLaXhlVVJdkKjTMhnikxAnIHDhr5a8Rj08AfOZyUfh2D5aXiN+g9JySgQ8OzYx6MQWQ90VxM4xa2AS/mJ4l0WUB9aGZeKf6EpP+OykdNxQR72uQteDIAEGMxQ6YGmWv4w8sx9i3aWs3BXwZn7453dZnX5OJCkE6n3xeZQllIqYkeOXEPaQwqNK+DFaxukQAOGrxXKWRszmJOU3GWAY9Wo+Fxk9U2ehxYHxLT6QmVCKdB2lEhM/k+OXgPtFya4psxtcbKUvcJULyX5+l9r5Z9UieIH34I71qcDiryhkUkfE7qqRt3UaL9QhJStNhbgJVI/fhWMF2cqXHE5IFXkQc3pncIFvG8BcegI0USJM/cf+yNsIxw+Q/h2F3zAldZ/5DA3w7crkdapVhq4TppIqeZnDYvpyO5FrQbc0UcW4u2CP3UFHK5evO2h8isiFjuhjg5hM7vOfLhsq0ShIf5aKXg3jqEmAuCBZvzMJInGgG29ub48J1A6BVS7PoaVMftsUS5DDEEMN/51eGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Prb79y7h7tgSgh2pUMjaUc6yTR3Vv9cPnkSEUwJdwcxFM9/Nbwg8w5OeOoHW?=
 =?us-ascii?Q?pwYkPDzwUChwU6KTiiBwR5vu0dEEctoxkZ6sgDkowFjKgzxVmSExQ+lsLsIY?=
 =?us-ascii?Q?bY0ZwvstdY1/3t22DNofQw3u9MWdH7xdy8HStpSR26yEsDF1jmOtHOeUBir3?=
 =?us-ascii?Q?eEenz91kY0NRYt/1zfdwurYBBhSjW5BMWTp571kXycuaFWKGId3gu+m+7r1z?=
 =?us-ascii?Q?2JFO38newVuvDFSxyV7DJoZyAmFZcui/3CsJD6bW4ooDZlByADtbxwBBS4Mj?=
 =?us-ascii?Q?IeTjaARQvrc0cMjAd6ly30XN/bliOPg43SKNhunLmVp/vH8PjQHagA95N1vg?=
 =?us-ascii?Q?i7XbbH0bxinp9gpypqfujpDxVAYiMR6/L/+OzH/Ag7AU38m8hw8wtGF7sA0p?=
 =?us-ascii?Q?ksqpNypaZF/sh+z3Gi8vARGfSPxGKmRrkrfGk6pWcViSqPv92eXkt1cMibwf?=
 =?us-ascii?Q?jCy+bGdAlwb4Mou4CjVZUrtOSr2l0SbVcR6x3AJfsorFGnIy7OCVb1ZKuuRS?=
 =?us-ascii?Q?saiSob3oJYjU260vNgMbWeXr5BJv0wDyw8pMncIWBKa3ZFfMAt/S6E5rzn3/?=
 =?us-ascii?Q?iQIDLiPkYUZ4t+y6qVsdYvW7SOx/BFFWsaB4St6KPWS1L+FMI4cei4yVAIt7?=
 =?us-ascii?Q?C5AFWWjFBj05ssm3w9IzdFTr2XOGtS5KzYT1wDT94k7E354unC328B6Phz6k?=
 =?us-ascii?Q?huDiDZOYYQC5EioAK1unnk10psNta0ciPRbp39xwLk//NjFJ8pl7EqSHw/rf?=
 =?us-ascii?Q?NjQrW6jheH/iybmKRbh74k6JFrbNUFjFCn+I/qpoRxhqiaoCncXlvlg0JAIs?=
 =?us-ascii?Q?75SyNNM2PJG9uoWCQIP6/XlhgySoBIDEkFl0rhVX/Y9uPcDQiOsGHg0WuWEO?=
 =?us-ascii?Q?KLFk/Z1xHynDP4NqCffLB2PwewrVmtbX+x/zw5JvNTt2djzXXz+LWSg5p+EC?=
 =?us-ascii?Q?K3JuGFsLMbT1rDvzm7gX5GQ8D0s8eI3H7JRwFLdqlg7Rs0Y3QT+g24vSl2OP?=
 =?us-ascii?Q?Zn9y7DUHC8ihMp4hLSnMuLdu1CgLGNjGj1/N8rbC/9HNxdCkMmGsNxdEDPRi?=
 =?us-ascii?Q?kZ0sJNDvi6aQ5rBGzzXCeRRLHXjcitcn5b8F36TgBfKRlLi+AESy3cxin1UZ?=
 =?us-ascii?Q?IIKRD/tF5+TW8D0VPXJm9gK5qXnHGNV6u5KRPrQwbTDFvPcP0eaPODWE2adN?=
 =?us-ascii?Q?UcQrEHQmmotQCoZEawoA8c+i5JCWo/M22xkQYTT73mpOGO18CBOWjJdm4r50?=
 =?us-ascii?Q?tvZ0nsUJiUr2oDXZmFBEqekRpEuyaAXjEMsLpe9EMol1CXR25AmwMi9HPU4q?=
 =?us-ascii?Q?uqA/IhIEl0hpIXv+DCT1Rt8UK3Sw214En7Icsmur7ZtJLWFnSBnTc6lJCMt1?=
 =?us-ascii?Q?TCUs7ER6PZZtWJkKSs2uwdL4M6Hu1Wp28u2uMGaiY2N+wqgJ2rvSBNv0J3zh?=
 =?us-ascii?Q?cFQG1dLBaVJajDL9MXkzVYJEPPemFD18Z+DqA1VJ7Wc2m21JzXgSmH+1qyaJ?=
 =?us-ascii?Q?Tdp2Rjwdl4hMkELKCzKqyURg2pzWkgD/LhmquLH6efyzk2vlK/qImgWH1HMe?=
 =?us-ascii?Q?pOU5wxNPcr5pku7evAbNFGBkySMfXXrX3X+MPgFKwWLVUg7xGsDWhXjJvye4?=
 =?us-ascii?Q?yVWHWl/sL0AIC6fnlNhKHwxlnWpauD/k60eS+qigxs8+qJBvHypBQnTb9KRu?=
 =?us-ascii?Q?UlEpH5+uTVvzmsorc/QaFn95F2NKmIc47nyI1p3sG5nkMdHXmT0KoH8vQLwN?=
 =?us-ascii?Q?X7Jm28P6TQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39621db8-6fc0-4bd3-afcc-08de92912172
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 21:28:36.4810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccvonDDSdHdj4prLHwtghAZep7y/OyETjd/Gn57g2M4LAvxins1duCsaXjWT9Akr2nN3Umz1lhA5ZaO9/rntwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399

Clippy warns when shifts and bitwise-OR are mixed without parentheses,
because the relative precedence of << and | is easy to misread.

Add explicit parentheses to silence the warning.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal/ga100.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 1c03783cddef..b5d0f04198f0 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -17,9 +17,10 @@
 struct Ga100;
 
 pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
-    u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
-        | u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI).adr_63_40())
-            << FLUSH_SYSMEM_ADDR_SHIFT_HI
+    (u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR).adr_39_08())
+        << FLUSH_SYSMEM_ADDR_SHIFT)
+        | (u64::from(bar.read(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI).adr_63_40())
+            << FLUSH_SYSMEM_ADDR_SHIFT_HI)
 }
 
 pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
-- 
2.53.0

