Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010039.outbound.protection.outlook.com [52.101.85.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7688835893;
	Sat,  4 Apr 2026 02:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775271509; cv=fail; b=IyaHeCoKTIQf3FLWKSFlyqtpq9xyNueW1I6OMa9QOkEH9fOTAedpACh8Ag6qWDvVUDQa2bGhOTHmbjGvu37rYKkVxDmyPeU3Srshyb0BMnivKxfuPk4DIlAQiOxM9/8GJ2L+KIshXXCXWCl0J6S+IYEHOPBkuQqJJxHBpd7HRY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775271509; c=relaxed/simple;
	bh=6sLNLKWFpg2pHayggER+8OVJVpC4hMR2xtITkNGtDlg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rKggkEFXof447W0x5xhad4EocpurKdWZvGe6xd2Qx3f5WWbiW5+/alEluK1uS8V1Kxp5uCyeu3New5EyfQkGneCf/s+XLnzDWqH/++tdKi8m6Dpy50SXjiZCSrF4asrLJeM2kFPANW8+hkYSbmrZcqZyFgOEjVfCjQ0WNHwRiIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I2s62AO0; arc=fail smtp.client-ip=52.101.85.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I2s62AO0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2UxDlZGkI7U2SbzZX26xH8wc8o933+DXdUFJloc3x6ncJ/GBhhE9PuPUExfkYmV1gB/gOCiy7ajyeBrM9OVYkhrApWD1Ri1QiPCebhqgXqniDP7lZ0TRX0JL57gbGVPY3pCnmIsWS49+qlV7BlVCj1cIV9xqccQ1UMi06qvqLMFnc+dDHs8rHDrTk0qvUOERGPzgnPKHRQhaSinTrlEzANNgIuOObTRI68T9J4BESMJa4RrnH6oB1y1zMvnqHnBpzp1QX3QbLeA9qhKpXUU2/E98gEUCP8O7SG9GVnwUlUTzKOyoxbCRvVG/MWVUp0Xf45IkolHeksSQ9yF25wkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwxvkZjlk2hbi16GGss/FKjizBcKYAL2H6HzHYof4wU=;
 b=JyZEjAP0OPDtDIwe3ANSCKpLdH/I5bZM08DkM1eERFtT+Zht6IxvmmZVddYhWS1KkMIEJlsLRVCtzLAPr6gShDRIX7hcsLgFyZ8LBdjrT7A8sCYBegIZC9Dx1Pbitp6CbXH42bK8l/RTk6CHxNYSPaWzJLuAsFyJUc0OTKzreOp2qOUGmzsRtlMw/W25TI/HO44ZbvNMGP7VNnXZAFJTtS5fP8/IG03tQV8o1gWkzvd7Di6MY+zSZYuUDBU1kHyKvTxVHu9nq7SaBjUS7FPqNr6MaA+U9VpcYdyrAmk79Lofnphb3h9XUdv09cNyFmaEaq2/a8DSftkiNkncpUvzwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwxvkZjlk2hbi16GGss/FKjizBcKYAL2H6HzHYof4wU=;
 b=I2s62AO0RH+DqV6GTS0oAQi8CXVUXyq1Yrse1RtSoIj5rydRTxmhs8KJhS1ThIn2N9VknlpYHkC5VMyJ+rVw511n2UcSOeMb7GNgxSqkmYuIjX9995Q43dH08ZGE9yltnRd2CETkeHWvJX0z2Uh8gOoXlW+gLT3Z5Foxjc3UDRK1JO/IW0TKsfc2cVLXiie61yzB7HDWOIp+8/lugosR4acGNRCqUGulh4iz8CKPGjFSGMegOL9JWMQ+5clGf7766PopQPtSk/USeVp3+7iR9qU1F88cJXQ1/dxbzuCw6kt/6s+gTsXFJ6TraeVDUiAywzAAa264nGoCy0s8Uvf4bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6284.namprd12.prod.outlook.com (2603:10b6:208:3e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Sat, 4 Apr
 2026 02:58:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 02:58:24 +0000
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
Subject: [PATCH] gpu: nova-core: fix three clippy::precedence warnings
Date: Fri,  3 Apr 2026 19:58:21 -0700
Message-ID: <20260404025821.386514-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:a03:331::9) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: fb652afc-a351-41ab-fba3-08de91f609a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Q4OPceMeXj+PnL64q9TniPvrxXA0l27i5YqmRjbTzteK/1uo6vXnOx7JIQTaVuOqrT65bAIeJEAROU7KEnTSDHT5ZMZo6I2QpWc5oZY7LBhVIu86Zz/O9v1hG4kpvEhONDg09glFi/ABUNFkp732q7N6k30QjFy8bn4U+GBPdCHetJidxMtUAzqav8p4y+actCeSA1jbc8Pi5yRVD6SXLY5O9dZIqquczYyJAen0VVW2QKSTsVqMprUtvHymu2UXBb0tsTXp+i0aCna01HuvTV0S6V5IxUNhHnhqP9anNS/V3ov27ImzjCJAbrrxI+X/lBLgnLeEPSMALI/eWZYCU8/CfTGdTeRrAAQEsLLMl47pHS3lkYsvQ/q6W3tQlgL+ssL2xh/+DNS/xpo9VYp9AdKx592pqjNl78/eTjFsLF1wVFBEWy5eNAhpVf05YPiDE7vUXHv4GMX2rKpDldQqCbg7rxW8CwnDi4Qc/uFQEL4+p1iRrAibsPOuop1YLbvM2j638seaSq9hzWcmlRaQgti5uz7cIbSlIpg/0iQ0KK4hHBMDhO6Y88XeeOm8YLGwd8G9bLXHngPERk5ugXL7VAJ+yvna8AAuILwei9Bzw6vovvGqO27YyYOC4a09qfpMOcS36SOGgsNtiF6QgEgvqoDh/m5R9Pu1a+yG30yoOXj3/Hp8wnuhqxnI9EBFdK0b69T3o0Tyavtej0AnMEgsKsOyZHwO+NxetD8M3M37bWg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?srZyRE95XVkLXeIHuY9FM8FAMrLHfO+uCSLVSitjOQTfKcviHNS75qebzMtE?=
 =?us-ascii?Q?ohdOeEUS+oqth4YeaSDVTPOcl25ViG2EuUfqJIAO4Odl18ZDy+8p3sKOpFOD?=
 =?us-ascii?Q?qKHqF09aUpKD7jJRtWUVpjs0C4tXpOgwMJ3ltYDplyjzpbZPCUeMTHwMJlB2?=
 =?us-ascii?Q?MQGyRD6QIyU5LiVIbXcUpQt2sYRyAir65WfZHA3huwLhK92dz13ALYo8JYz4?=
 =?us-ascii?Q?OE3fsbZsCi/WvVhnjEKQZ51atUeUt156P6nAZMMoIWrRCnkr68nSt0Gtjvq5?=
 =?us-ascii?Q?fGzlF1Nk9dHiXb6KUB++omZqAejUL6gSQcMMd3icGI3Zb4lvevum/QpM6oJD?=
 =?us-ascii?Q?efg92AQj59fSKgG8lntwF9dnCDGE027KQSGuPyEOPnfTpc9x/bgAmy8BExeO?=
 =?us-ascii?Q?zlZiGc0mVTg3mmqb5RROl54BcNItA2HOT/vZJzzMyOHxOSPi+kCLeIDJV2eI?=
 =?us-ascii?Q?9QN2aG7YUwZX9y2XFU9eO0ljV7UQnpmYXW7uOcYEWCmWaXos1o8pl2bFQ24I?=
 =?us-ascii?Q?uwvO75kVPh0qtnfwX9hGKTxNztP54e3f2jqseDrDy1eJohh4KO1RXyTnK04j?=
 =?us-ascii?Q?CVFP2djWGCy8fDP6FfqVARTEWWgyIGiqmDcE6i0MjOUWBfk4MoU3zapIdV86?=
 =?us-ascii?Q?d8/YWUUTGXKqmHu4ybzg8C20xMj1nzLx/1bJg4P/8ObFsjuwGNustbHDTMpB?=
 =?us-ascii?Q?dGUK5lQukoVSXQr8ZSmRFJiYjqRG1BQUZppBaMeOW3IDOU2qex2odKZN8Pu8?=
 =?us-ascii?Q?+jopmnNsL9325Ht7hnERriiCpukJMyODxwsXPjQbJNYnUMLkpAs36VjYpvl5?=
 =?us-ascii?Q?x4hzy8CVlLL6adUe3CmoJcsj3JRklL3Sk567Oz1eNMeY3iRGxZ5PZ2sEfLaB?=
 =?us-ascii?Q?12SUYmuhFi9chy2GHxIdwI1C82f3ftA6mnQT6q1JoWTKrktw7z/JmQVbhTnl?=
 =?us-ascii?Q?eCFuQxop+ebDC3Nsf2918CM1R/sM8PWnJ/9C2tXoURls3wEkUNNeryJ2CXz6?=
 =?us-ascii?Q?Z1E2yh5Gyghtf21tWZ9RdGM3zTrb5Q4dZ2So25KulxJyQMZ2xinLR26x5M2t?=
 =?us-ascii?Q?KhDyYQ/8o1X5Ymv5XcBhS/L0PO0gKhClk2SPXidfGzAstgG0QfUpEUVbUAY7?=
 =?us-ascii?Q?eeXZuG6C3dGL2an6BausnkSMaIkBUPimLwvbJ+vooQxV1dHm/ZOgMDym1Ms2?=
 =?us-ascii?Q?n2isAXoc8l67ZAcXDgfTx3Wj0psDakuEywPDCXJhN/jRkGdsYw9VRr5K3lOa?=
 =?us-ascii?Q?PV1fIGFbQ4kxK9Cqts75WQ7VA1o8lUtyKNXJGlRhKSMWWKJharX8ODBYmpeq?=
 =?us-ascii?Q?Jw/pISCYcO3CFPjFriETLdt/cBdyLnQDzp7THnjTIJ3T7yT1Z0ssHNEYCSDw?=
 =?us-ascii?Q?ZPVjx28ExLq7Z8XRUWBSzzROhzRzY3G66iuM2QEK67BasnvgzhkENAdq2o4R?=
 =?us-ascii?Q?pBs19ekNJdD1htgd2npPRVyOJ028Iz20UAbaEdlaz7fMNnaTxauaUaBZ9h0V?=
 =?us-ascii?Q?7JdR7H8e6HvGPDthMMUY2vJ05MZSqHbMYNsfBGpzt4b+xlm0aoJ4ifs2xtEo?=
 =?us-ascii?Q?wMSwS5I0HIhTPEd4Og7M+op18HejxvypJsboDo1jn2CwWcuJSzzt9yasTUot?=
 =?us-ascii?Q?sleF6/staDyDJ6P4nv0VoU1Qrli+/460Y5arqiD6M1fQFkBVzOeerj4bxOKm?=
 =?us-ascii?Q?4GYTPRj08jWoqUTug9JwIeJtDtyjXrUVIUq9BEzea28ACIajO8wraM7vSuvZ?=
 =?us-ascii?Q?f4dHKtDWxw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb652afc-a351-41ab-fba3-08de91f609a1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 02:58:24.4827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHoQ9TYiMNU/xOU8B7W3+u/hJpQCKK13nDTRdFB+Z8dAfD2zgsgShDK6g4LbDwayjkylsRUMle5YLqGJ3a908Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6284

Clippy warns when shifts and bitwise-OR are mixed without parentheses,
because the relative precedence of << and | is easy to misread. This was
causing 3 warnings in drm-rust-next.

For read_sysmem_flush_page_ga100(), add explicit parentheses.

For the PCI ROM header parsing, replace the manual byte-shifting with
u32::from_le_bytes(), which both fixes the warning and is clearer about
the intended byte order.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb/hal/ga100.rs | 7 ++++---
 drivers/gpu/nova-core/vbios.rs        | 7 +------
 2 files changed, 5 insertions(+), 9 deletions(-)

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
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 3e3fa5b72524..ebda28e596c5 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -507,12 +507,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
 
         if data.len() >= 30 {
             // Read size_of_block at offset 0x1A.
-            size_of_block = Some(
-                u32::from(data[29]) << 24
-                    | u32::from(data[28]) << 16
-                    | u32::from(data[27]) << 8
-                    | u32::from(data[26]),
-            );
+            size_of_block = Some(u32::from_le_bytes([data[26], data[27], data[28], data[29]]));
         }
 
         // For NBSI images, try to read the nbsiDataOffset at offset 0x16.

base-commit: 7c50d748b4a635bc39802ea3f6b120e66b1b9067
-- 
2.53.0

