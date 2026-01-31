Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB6531AA92;
	Sat, 31 Jan 2026 00:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820982; cv=fail; b=J2++V2JGJwwUr5V4EAxq7quPfJ+fjvS0DvUGMZT/xUta5k3yekuEson+F/Mtd1o5Ex01Ld2eHmhy5NBPvWbxOkftbo+tlHgeTopyBLONd85h+492V0d00D0J0q3vo64nuFzDJdhGCpwbw7KQ1ZAnV6Y39smVUSbRd9ksQHqv6VM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820982; c=relaxed/simple;
	bh=LQBtl2ACy0pcS6xEcIFr3P9gRQ22YCntN7mIScsIAEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ghrrH5fc8ElTW/6Yu4WfSjFWNCTIoUs8B8yHYIxTP8pnCgwI1WGBlxuTJaI7H8WXTzII+/0ADQF8cpszqw98fprLzNiMc2GMKKW8fdZtXGjMOUVxDFtWeACD1CGGa11OwxjDR0QoodMKsr7aUvNlpLgDtaWPNR0ffHGb6bRMHPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kg6MT56+; arc=fail smtp.client-ip=52.101.61.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kg6MT56+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jU8F8pvACXvReDRcwR0XOwg/flIFVmvfTYgjhI4htYQwzeSGP/PKijmcD0todPQZtXm+2+El4iqk9BRRbPQXb/1Vm4hz/NK+/b1FNMMk3ZrTpmb97S9SV14aGzoswPJsm1PBwloIIHNc8I6NgsKQkkioHFUAifDqk+szRnRKDRU39FuBM02G5acTRydZ8NckMUmGe7YsgRDkgHs+oZ/2SWUQ6IvEXPNyrX32AvGha80LPdo4Ptm4JLWqGrq/8Rf8b8M5SHlbtri5+2XK13ItfHSBDn4FBSmvFUccePf94ZPapzVfdtPqjZZtcqZhBtZu6CSGh/E1ZlB+0VKnH+ETMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JZocfLBUNCWYNx6sf3CJFj1nlmUtVIkGWhEwYtofnE=;
 b=fmQ06E0C79Y5zJVqz0vgepXHuxpPwP84E4giHgFkttyMwDUEraO7c2TjMdeCfZht8C69MYFHXA2IUsTcNU2/lWHR2atRsaWcrlna25i64QLdWnfydnlKau2o3CfTr8jzQta9tHhpgG6OpOmsFmBrgSltHGYDd9HN5Dta2SHI5++zFj/oLpPQKTppQWffWbDleuR/vWsFfY5+TOcp3ORpU6NRhvwjfT0E/0PAdbO8sZXx2cuPayrpJxDu7NPPYujsDV9DThWNv2LOVUwaPdR/E8JdWwtPm1mNoGoDQbkTVEHCVZJ77q3V2EkqjALh04ZooMRUZUr4UvYcvjSndAttmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JZocfLBUNCWYNx6sf3CJFj1nlmUtVIkGWhEwYtofnE=;
 b=Kg6MT56+KTE8nAeLkeUSL35iAYh5vMQ+7Vnxwi4Adqzj3kP0NGnvBwjW8Dtw+ILdh80K6RfaF+uXetPjfWt1bRxPmLIL0YDpVkVGM6M0yLFte4bvvhwAFGqeXZyejTC8tWEq5M4VyZSFmcxsPB8s7XkARqzKpUH4Jz072PdCoyEdRB8GDUZZZnH7e5McY1JaHYTHeTs9VQIp9Hz+xFzbkh3DATStJf2+sm1+2xG8Vlykgy+/ouTCmY9TemI8S+gr15tlYyzfajwAgBtMrsI/6qcggAoiwQqzH4G0vQzVpcNKXKvWXOJrOBAXoLZeeaK87k2pL+8v8bMFnv0AM5NuEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:12 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
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
Subject: [PATCH v2 02/30] gpu: nova-core: add FbRange.len() and use it in boot.rs
Date: Fri, 30 Jan 2026 16:55:36 -0800
Message-ID: <20260131005604.454172-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a551db9-ff12-4f24-6a7a-08de60638731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qsHflmMjB6wL9oI3K0gvqWtIMPsVu17yH35p4425gUdTV28CCrTuaQze7fxD?=
 =?us-ascii?Q?OJ9EdJYUBoVjsAM6r6nPVQIs/gqKqQ0V/cU9F3rJMZFvaL1sIswgjpC03yo8?=
 =?us-ascii?Q?iLIaTtFxolTIwqQp2Mekki6wuQrcT1VlyC28PSCAl8a/Q/Kf2dPhsYgYzOdn?=
 =?us-ascii?Q?vphYSZMLBh76fHMqvyrM8ITxql89KmG3PTYV9qKu3ZmilOa97cvKOA+PKSGb?=
 =?us-ascii?Q?JNEfWg6P9H/L+YhIW6ff8qUQ9m+kNZOvXyRgkP7Mp4sNuuaJZmx9GAgZG9Hx?=
 =?us-ascii?Q?b4hC+y4LuT6PehfuSZXlsE/ajqj0v3gtb0McdzdEhfijTsjPH25X3xsgftOW?=
 =?us-ascii?Q?Mk/V1F61Qtxu1vKiuQmOPx0jZfLJjaGsvjk4CuIAH771Nu+3VTmImYXrTp3j?=
 =?us-ascii?Q?qQb8uI4sy+LksLR0sUfNBjbyQw5zz6xFDnQd4FPnmqu2Wm5MK/KMHfWSag1A?=
 =?us-ascii?Q?4KlQr5g5J0ftRZ0ssofua09zd+zwOKfGuzUyjshGTwBrUENlrdFv76KQe1ZK?=
 =?us-ascii?Q?bWdHpKWE804pMQGD26Ri6fGqxw3jVaneSxlxBKZNBQyjZE05btPliqGYC51m?=
 =?us-ascii?Q?EK//PSy28TvIipK2fzPR/5l9TT6BO1IUtrfUTunW7udcxZyIUOu+dSASPjvG?=
 =?us-ascii?Q?UF+Lk9lbAVE286NMT13tAsLQYugGQPiVgpssuesQs+oAzQ9xFmAvkv0ouaTz?=
 =?us-ascii?Q?90lDCh7ZqgHfCn/l5/3wbOTctMVocWgDiUhJI6abibsawaonhRDXsF8TbtnV?=
 =?us-ascii?Q?erWrKlqTfpA9My6hiQrvGj5AYx5JpqOiduBl3wHU+mVUVo0RR4mJDE2qMR8A?=
 =?us-ascii?Q?rzwUYh8fxv0p+7JXB6E4u1jD1v3aRk/RzBokQc5ewwdz02IoB6OMktAcGE3b?=
 =?us-ascii?Q?CdUtchtoqbDbdk3jSDR+hJRJI6tkGeLBumEHyltBrY+cxl2z8qiBfjHo2iSM?=
 =?us-ascii?Q?Pn3M5IRwHSFSzf0XKD1toDCIpe20fM8gcDL0G7+s42WoDNoT0ZVpqL5Rjm6i?=
 =?us-ascii?Q?PRntkhpidksYDeoLKK3wnFwPLjKg8U+KQwXMIjge7YlTFmNRl4lSjVuAv0hi?=
 =?us-ascii?Q?Q7Fdu/7tUztBvfUjFsM3TMMGmPUpQ0te0v8y/L1v6WAbIzkpk/svWsQ+iyy8?=
 =?us-ascii?Q?VaVvtldZ1iaohtLflpFqLSdq9Y1LgSWaueHANWlAsRTj5t4/ouI5qfKStyrQ?=
 =?us-ascii?Q?RMl/QArO41FROQK///jmdRjABe8nlr5bROHYB35Cc9az7LXblbaZzenwf1u1?=
 =?us-ascii?Q?JxJT768ErU3TebjlwfO/F2moUnkV9stmT2uUi96PVsiBThXNyzh+xOtX+8Wv?=
 =?us-ascii?Q?LzJct9UDt1JWo//UCgh9L0YjLBV7ggO+IcysR+bRg1NUB796qi3wCgN7RRCs?=
 =?us-ascii?Q?wegJx49hhnbBHCJ2oCT54rXjtHBgNPfxlcDUfCapL4+Va0O8+iKlnmYzwbrl?=
 =?us-ascii?Q?Wf9NIhvIZ3Uxi5TYp7ysEk+MdRZ6qX2/8+Wrc7A/1m8gYcJfTm2jtm2HMM8C?=
 =?us-ascii?Q?fdv13CvqBooCPfvR2gxCcH8rSMTAC4+bVH4ZZVnZVFLSaywtAjVATsAQo3vw?=
 =?us-ascii?Q?lPAjRjWEWWybvJZu0FQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S74mBd1mxvr/Ry07Z7UAfmCwmTw9aGnTJLMY2iRsqZRnT1UDyrOEgwEyf+UL?=
 =?us-ascii?Q?nxtfNoB6lloMzysMga5bt4K8GS9so0znl7r0Yuwm7v7ZCP3fa3R6G1RWWdsc?=
 =?us-ascii?Q?VP7PSkzIg9pjy9IYzKlBnE0UdbXFzrPjaTbt13u+79V7zFWhFScxGT/9u1iJ?=
 =?us-ascii?Q?aiZwL/kpQmc+47+1SjJGD1UTKda8YOBpbudilgzUPyu1dcPXMr3lVDiCyRPc?=
 =?us-ascii?Q?trZ0LZ4lDmX+IjI0l0sKCb/4kxp79xNwAaA9PwnwOrwL+sCyynLMffnahmjL?=
 =?us-ascii?Q?y9WiaueMM8sMVogYw/TXeq+GiQPvuPN9Nk+5w9naSQQ2MBMa3bh4bByetKYO?=
 =?us-ascii?Q?Q+R52fr99FVDSQJ7e8RwbpeEtuTYRQ26lNqu43dGLRScETETHTua1KNKCJDL?=
 =?us-ascii?Q?X+bnP9p1+Allr/kylnmkMEo5PSTt01JgjRrNk5VKkqi3YJ+N+OY+vRSF/Dju?=
 =?us-ascii?Q?xtg/x1zXeOwnAh8r8dqdEmGjJIg308Om9bevX1pB2N4CLBEsoLXlmCeWLQfi?=
 =?us-ascii?Q?v4El1FY1u+y5P44OcqINlHvBYPaMwTFMPaNp8mEvpgyGQacnktQmpcfbTjxi?=
 =?us-ascii?Q?0anLU7PGZyEUW6xXqGONZjQQXi++NkjMxjPwCOv3RCUHLngJ4iMvvLAuAzsb?=
 =?us-ascii?Q?D79O49EJzHFR74UyuMx4Qu5WZ6nKrB2Yj8EgpfO1GZPoTyfo3x9cwHby6+kH?=
 =?us-ascii?Q?LfmqBltuSm1GlU5ZfFrEze/TJhmxvvl4U4tmhAENGv4aIYmo0TJelSMKawPs?=
 =?us-ascii?Q?JGLEXBLY4clU+P8kJzNx5o/eHsMnkQXhoy2k1Yx0x2zaUboOsm7Gusot1TAV?=
 =?us-ascii?Q?6VL80soXvxLNommMVPp8rKy/EgdpnAVN/kCHSlVNDS8U9E6TxQsxZFQ057I5?=
 =?us-ascii?Q?sQXUTDkgME5fz6I63DzlS/dZ1ZOZ01bWrGeMLmJEgk6rwGSgGL/Wc17WnYdg?=
 =?us-ascii?Q?Gm/wQC/PZtBxaYkSdVE134MECzbAUm59j8xkiMXUCNJCJ+8sPN22UOWrB+tR?=
 =?us-ascii?Q?iwRLbBm/PWWLo0BEnK/sH3JBqTPldl3PiT4E2NW4v7naR41X6kOaeCvCgzmw?=
 =?us-ascii?Q?uHmspCaYzbzPqTUYdKNTfFIvwcWXhrL6goH2V34tCFxPH9o99PCkBRKMXVen?=
 =?us-ascii?Q?WD7t/A7Z7EWnlnrsgeIKmFJfm6qmz/ZHBt/Ta1Zy1PwS3we/kSDdSV+qawtY?=
 =?us-ascii?Q?g9ibtrMOuNikMC624WMUgxWbLj9NnlYGbsmh0d2rRAqPzh9r33/wLHRR8x0G?=
 =?us-ascii?Q?pd4ZQJUtqdn9X20ck2RGGCNaS+Nq73kS6h2Y88gi4M4x+5QAwUDQuoPmUJnO?=
 =?us-ascii?Q?DIs0bEvHWTmy21Y1VSuqDdYxRuQt+62TvnuM6UR/vHjpaDXZuSwHLgDz8znm?=
 =?us-ascii?Q?H/KB5urGpa6RFmAeMpnfsAJ0jk9bBS/GW6lsKOcWepLApLMgAWys753HrBO8?=
 =?us-ascii?Q?EzHdFf4xXWjBlU5Nw3Ajg5EOcmyu99tFmwJ8r/s42l9efcWegIafDIa1jKu6?=
 =?us-ascii?Q?M5tvozdB7avL05J3w4BAOYQbJSVSJQldml1i+FgLv7YoHCf04Vls+kvKLfhB?=
 =?us-ascii?Q?NZbHkYDJj8bDnUO4rF1mApVIVlhI6nJGEIYoGzuxXskHRKqRpc/ZkbrMQ3Aj?=
 =?us-ascii?Q?uL5aKwXAncJ5xdxtwnFsCDCfSsTJ6jZwg5ZlZDFUkS+Pc3hTG2+2ghe+uXWa?=
 =?us-ascii?Q?wM+knmXnWsAWqu6Y7aqzHeCaQrsG/aOJJkld2IAKiKk/2wK3kVpR3qumpEZV?=
 =?us-ascii?Q?//6tmSyRMQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a551db9-ff12-4f24-6a7a-08de60638731
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:12.0679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExghQ15FwlJq2Y53BTnDATXpxhKF4XWm3y4Vp4b509Pn3ugISqo3Gptn4rw6aP267YmBGrT78R17aVehaP4Tkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

A tiny simplification: now that FbLayout uses its own specific FbRange
type, add an FbRange.len() method, and use that to (very slightly)
simplify the calculation of Frts::frts_size initialization.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs       | 6 ++++++
 drivers/gpu/nova-core/gsp/boot.rs | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 6fb804c118c6..e803e6e0cdb9 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -100,6 +100,12 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 
 pub(crate) struct FbRange(Range<u64>);
 
+impl FbRange {
+    pub(crate) fn len(&self) -> u64 {
+        self.0.end - self.0.start
+    }
+}
+
 impl From<Range<u64>> for FbRange {
     fn from(range: Range<u64>) -> Self {
         Self(range)
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index be427fe26a58..036a42a6afb6 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -70,7 +70,7 @@ fn run_fwsec_frts(
             bios,
             FwsecCommand::Frts {
                 frts_addr: fb_layout.frts.start,
-                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+                frts_size: fb_layout.frts.len(),
             },
         )?;
 
-- 
2.52.0

