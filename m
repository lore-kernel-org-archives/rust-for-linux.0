Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BEDF4F1;
	Thu, 26 Mar 2026 01:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774489182; cv=fail; b=j0LT/3WbUphU0pW+iQTcB5ZtpHiQwyQbF405QtQclrlcGsEkciSKRmbSopCYOc4qeof+IHzXLFNepmLyDxvdTrCWhXHz2/HokDB7zpwvlKIhPc8b8avZ7AMXaTcVdYgBJ8yQ3mU7rgOIFJzfXd+aJrcBnhRt8AfDluQ6DpjiwJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774489182; c=relaxed/simple;
	bh=wEepFWOlnVAFg5liV+xBIKP8RpPWIaGekkUMd96yD8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sVak1wNdYQ/fAqk+MMlyuBXE08UF+YGaPUY6PJIoTJWAh3frBPFpBqc6t7tbWKxG/wRNrXBEX+bpZSEMfSFal8lwSvuyaWvZthEvdi4KkgP51nvzxoeY7sTEaYVcMk9GQTh4DUDK15yzwXauaZzmBpaPtykpi8JgLarD8B9HpfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FilfNzSn; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FilfNzSn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rubjrhnV0IeOBxxoTHK9djLcXkSSW29BdqOYwWGJeuTDqYM5HmjtvZYdBfnjr2QEF13SB8wKOTDXuxc8snHXs2pvPLU+nkvgOnfP/oPqDNA2hzAz0AU5bRh7Gblc+MaBOFIH0tdy/heGX+wh1CLiaNOwgNaPV8hek7dgfb1PxIno5uIO+gjfLyj6m64bnNK4bjVPTIUuj/64EirFWGeiShGoT4JdSgv8zUY4TIOqDCdNKACwL5hZy9Gmp48Hb/4tX0MT6Ftb3EtYq3BraFAnjj7gkeWn+jO9W37m/ZPrufNJMEfno7QGWbv0B6QCSNylaKkJA3P6b2w+2jJsO4MOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWgEsuyQh+3M0+ECj4JT7fxefJ28T5seCzuz69wkpRE=;
 b=Koa7/B4g60VrEaGWdBzOfN3SoyoOnZVbcz3nO8iuJ0u/KmKXPQ/Xpfpyvaqtmnfb8o3yu/nAYjPCT1quEHpQPy7PA9eBBDqKj1PpSTanp0EPPoQzpBlj0hnkJfGfeEwEKem4aBaBY/Xh2UyA7QLIWjlY9J+R56XNFAKlU2LP/xxfdBy8i6KUcuznp+sANvcCrqLY/Ij8u6GFG8w1wW2HKbGMtUeku0LmB+/ZUXNyNvroffUzPsbzS99fEilzSE+/rXwAvaHrsa/M50NHYqap6kMxb2t21Fa6Qrwrc5/LNQWSzxZ2C9fT3CegQigewrM8SKKSyyptcDRITejZymrdcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWgEsuyQh+3M0+ECj4JT7fxefJ28T5seCzuz69wkpRE=;
 b=FilfNzSnyacie31DJaqXlLZNzYZLD0DsNTvgkIUVJS7NjS/z1WAUp5pl+FB/oQ1j51hx6zf1MbIeIltTwiidy3zNoWjPIbm7phc6B+qSEMxfu1NFrI7GERMgDwIL73vk9EL516QnhHGsjpjhlqAi+pt2y1QliTSyzylnuVi2O8YEmK8AlvA+w7SFZVkejLbdWSI4p/Z8Z2wGGYNA3zHbWhGV1TjO6UpG7vcgH//QZSyHcR/zHO8Hac6W7UiF23tHuC3eXizCzRHD2QEBOaKbI0uSVnLW39ZJ5dtqUF17+xm+xEwQzr3cBvyfdXgf+dzJzuQuAeXLDalCN98UF1LRXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Thu, 26 Mar
 2026 01:39:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 01:39:30 +0000
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
Subject: [PATCH v9 16/31] rust: ptr: add const_align_up()
Date: Wed, 25 Mar 2026 18:38:47 -0700
Message-ID: <20260326013902.588242-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326013902.588242-1-jhubbard@nvidia.com>
References: <20260326013902.588242-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ece7789-0dab-408f-47fe-08de8ad885b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	x8kB6oes8M7C3jz9sPZ4VfJTUXjmez3lkWlw7WqFKoVe/U8VQL4rxjd1XZ2hwlbezCZ5A2SvVgsmZACtoiaaBcaFl/jI8pFD6kU1Fe4fL9x8WMBmZ0y2tjV7UKw8rzDQ1gO+YTwMcZat1P4X3j2eai8zs/chC2gNx1471b8ex0HGxZgj9nv2qDag2Xv2F6OE+z5+c/WAJnnDVeuIf2zBOlUshmp1yLoIcEvwhnkEDXo2jsUq/N/n/uZrDrh2+lWFWxOnI45oMyYrV8f51Z85WKDLOtg/ddrskAiucltyVlOBcttkPkoKRQq4mi5PkLEE7eya8LxLy20Vxv0E4BGjHfAha4HAYs92awKHOl1MGGYQ9Ru+AG0SDTOopZAtnQd1KiShGi4TihtuWTa9ECOBZzCY9zqP3L/Ytj7YxQu4870FA3mT1+f0FAVn6s9DHiC80GQ0n1O3xs3VvyHSF5c8gwv48f6qQ/8HRBlYWs5ERKg+KssiwT8vVAGCaOuZEiT3j8+s48SI8IZ+iYL6UoRM8xyBQJoatq+EhNCgrz0TSwz7OzzvAqdR08RXBUrA5MwLuirPBXsFIQ3GY4J1Pxr/1Th2cRDj0jE6cRbak1g6INdY82aDM22DYg1dBTKWZHKAUIg8rcMG3LgM6vgyRIx0OL6NQMmZ1TProcRsffJAIXewzLNDDJB4FKXhI8NWT3RIc4DkV+CNPhUEtufyvtRxgRVsZO4WrRavJA1NNx5N7JY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pQwI05gVrf2v1tg/uDXoMFuWSHW1yOFe6Wsnb13MGhYfT1ZXU3sr5IwXAdab?=
 =?us-ascii?Q?9ipf0VXQT7Tj3+CSckCwDHBVIdEbnIXRJwd0kp3nGxCzq7WwAnF4cmQjgUP4?=
 =?us-ascii?Q?lgf8MM2ZGmE2PZ1xr/VrSFHgO0uM3bwQrfSPhIJMsjhBzYhfFJRwzwqVgWcg?=
 =?us-ascii?Q?87LIc5lbJB6sWsqkNMjxliHFYKK717m//rbmMLAa1bdASm8Eca7lIiZOG65W?=
 =?us-ascii?Q?xhB+BxU0tTCLuns6CHuU6/NK1A3KJbXw/VBnVGwdCPqnHdogIKNNHjvro4vh?=
 =?us-ascii?Q?Lgox/IlPeURS08ILfhx/GhPvdX6hRlRuC19am30uidCiB9FM07r1P32u7ORU?=
 =?us-ascii?Q?UdZYVr+D2OksVgkPeipiVMU2xwPBzM2AJ1JmZbJPTCCgANAYAQz1+2UNmSAa?=
 =?us-ascii?Q?/Xa/ZphXTNxDdvGOZG+yiTEA7kdrq1UaObFL+TMr65nD41GPMXLjmvuthOzm?=
 =?us-ascii?Q?iPDMa/PTmM6qcIZxwofZbP8ohdoAZM9aXrG+Q7Rh2+pHDXW/l6z74FQK1BVy?=
 =?us-ascii?Q?VB/OaXuz5Hxz6kmEnHBOkYq20jxDzKOptITk4Vf9LrbbUzCLLdIiZrMtPVwS?=
 =?us-ascii?Q?HLaTvzm/W0CO/WgKl5I67Bs9xAnjkbajfj8ILZxCwIeJIpdanSyL+WFqfehx?=
 =?us-ascii?Q?XfkEaFfLPizblIgoT92LKjob5lb8y6SZyanO3YKlVw8xlD1bHtTk1jOhtATj?=
 =?us-ascii?Q?ijryW7b7hLk6XcBRF4EgoMt03Q6BhQ9ElzUzMPDKGwYVfwCfAbql1Y4Xf7i9?=
 =?us-ascii?Q?dUdZZbjL+WUGsClZAfLAYRf/2Hr+VMEFRggAGurs4BcMJG72bZl1cSD7ksjU?=
 =?us-ascii?Q?BDzSr4o1Kx6zSPKItyB8Ej23gOSHkUk40VLgsDnk64YxlcbJov1hweWpyCCS?=
 =?us-ascii?Q?Hs1F2W3g35UmrMxeRYv8zEABA/+yFUSkTv6qQTJlXnF4N6Uxpvm5cHIa/mbR?=
 =?us-ascii?Q?FX4vb2Qvz/PcUFIR1cTfpGfTaGFaDljdJq/tNCdhH4C4CL4QV05XfH2goWGf?=
 =?us-ascii?Q?8RqUZYEVgGAk0hgo0XH5YPJfZFUwildQzKOTAySgeIDNCcrJQBPO4KXjGZ4S?=
 =?us-ascii?Q?RdwAz979iyr8AgvcWZhU6b/AIFEvWvRPsCq3lD2BnWzeLkZAWOKXGIwiv43X?=
 =?us-ascii?Q?SSIGLdKbIUJPR0hjjra/xbvKrtickjIgu49EqIGJmynGprGBYH2tGlMkbv00?=
 =?us-ascii?Q?1Gl6bmZTQfbpCLRJkQcS079jHTn/AwD0oDC4Ci+lfdyFQGVnOev/TPWh9LZx?=
 =?us-ascii?Q?KeRoHF4iHjzYFsw2tWul3FLbOSmZfvD0T8KaxUPf8fda87m6fQwCBp5iBc2k?=
 =?us-ascii?Q?5uwZGB6jKhcACUsH863iyuxJujsb2bR0qE6KrdPRD1wnS80WnKgcCnldQ5Ro?=
 =?us-ascii?Q?wxdjIrwUIih9zrCdExzw7ePA8aN8neBaZ47FTpdH0UYm0ZsF7BVG/wGF6cpK?=
 =?us-ascii?Q?60GPJXbpi4k0DCbqn8DoZ0hpEN1PjUFEg/sYJPns+bezhDtsvGtu5JQoqWmF?=
 =?us-ascii?Q?ewW+6smTY5t6CEwjZf1jGbBA+4gVT+hpl/ur2jIobvufjHIFW/TFTxD08wHU?=
 =?us-ascii?Q?6pvhsJKuKq/oZ5zwkC5CAHoaODKHK+4xDcivk2QBmLrfNgZjID5M+XHD8GB9?=
 =?us-ascii?Q?rN59iTn375aOe2SH7M50L4l50XDlg2gJGVy2qHGXjsIACCKALsoerB1nSTVR?=
 =?us-ascii?Q?1+2SY/5RhuOrTPTvx97Uq+N+i0gsQX2Oz+zZISEH2G9kHDt8M035S2q8ABuW?=
 =?us-ascii?Q?bpG2gvLBlA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ece7789-0dab-408f-47fe-08de8ad885b3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 01:39:29.5247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H1ByMMotaVFRh2jKn98dQFrQdjsRakCfPh2LwKxn5Yzn8zMX+iY+s0WUak/iFr7vGaFYcsV8DJYsfu4J/ZwlXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

Add const_align_up() to kernel::ptr as the const-compatible equivalent
of Alignable::align_up().

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Suggested-by: Gary Guo <gary@garyguo.net>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/ptr.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index bdc2d79ff669..7e99f129543b 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -253,3 +253,27 @@ fn size(p: *const Self) -> usize {
         p.len() * size_of::<T>()
     }
 }
+
+/// Aligns `value` up to `align`.
+///
+/// This is the const-compatible equivalent of [`Alignable::align_up`].
+///
+/// Returns [`None`] on overflow.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::ptr::{const_align_up, Alignment};
+/// use kernel::sizes::SZ_4K;
+///
+/// assert_eq!(const_align_up(0x4f, Alignment::new::<16>()), Some(0x50));
+/// assert_eq!(const_align_up(0x40, Alignment::new::<16>()), Some(0x40));
+/// assert_eq!(const_align_up(1, Alignment::new::<SZ_4K>()), Some(SZ_4K));
+/// ```
+#[inline(always)]
+pub const fn const_align_up(value: usize, align: Alignment) -> Option<usize> {
+    match value.checked_add(align.as_usize() - 1) {
+        Some(v) => Some(v & align.mask()),
+        None => None,
+    }
+}
-- 
2.53.0

