Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C6833B6EF;
	Fri,  6 Feb 2026 04:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351704; cv=fail; b=KguI0bptaRAnfvyeCTP2E6oaQ0LS1bZfRZBb3okAfWHeyirYw4XcjbywcsbX4pUgvKxE/BkBpQAKjo8dllhTHGKYS4f1dSltVmPBjMITdClHdKa+bZMgQbZWoGsZbg0n6lWN2qwvEnhDmJ65NdgJ04pU0t+hiDBfP3NMcXldDfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351704; c=relaxed/simple;
	bh=CXr57zBO28GpZ1Q4UdpiRdgwKvDLzIU5tsKy2N0QzZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TKcEEHo80Q3OiLT4IaY4XwsPU2m6KTnFRGE25bnRuRLvhnnD4rIZnqZzhEuZC1Y94XR5w1OupOhOh8gBo3v+jPfhOlBS74fsHPDl074Glof5vb+ggfQt+3BDr+m9istCOSRQoNna+goE8lrmNxBp6jtYlfV4aK5rvKoYNVfLkIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FkwzOSwr; arc=fail smtp.client-ip=52.101.61.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FkwzOSwr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbtJBMRtJ4p/dWWRqTgVUN7iVvD/oVE86p53SHbuPJwZAcAHT0GuWdeOKqGQJcyMaJEz50xe4+MRPrFDXr1yuRH0/65rqq4fvxrlZq8r1+Ed4EhdQ3aeuh5m+VW28zpivqi65v0Cip1CbvOeV5GsazTRy4xs99mSvGRaZOFnVsr/C3deX2iuIl+0k/Rda9RNS1/vXq1nsser6SJPZBNw9+sUor6w1xR8DiXCa90vNYyQpixYRL9lTENUkuzc8MF5dkdAxEbYZRHw5suzSzseAXCFqgKXuf9K91B/HaHaeSFP/jFr7Y/xt3ib2X/oamCyXzE4paey722GPeXJexmUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWW2qX2qVKWz6Vd0/0rq/GpAxAHmJdzAS+Dvt+ESIUA=;
 b=Gnbs7pa+TdZ1Lr39Ge4o6tQ5SYiMcJ0raccEfIrkDhRwDOk+HUrEpvZFoY6wt4cuhC92Ctnji9XT5qih9W0yDfeaBcHP1SL2oYg497kEEEAh8jSrY36ICimq7JCxtj6+UT8KnVoJSZjTkyEkQPZXOyYf24wIfxpSoK6AcBbq+IWi1pa/wO3kyLGUQ3NgmHB0H3eqZHrPnoD1q2cMsMqItAdxwfBwKmhn3SCD/hu5QsMsMdt5BNzkP23ReG+UuarWKi1F+XSs1rjWsRtLNpRKPY1qKVPV8UU/Fwb4NSMPYneZJ8Ruy0R5X1ZeLNB1KOGX2lBFdCh5EhoYwOBMeXIzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fWW2qX2qVKWz6Vd0/0rq/GpAxAHmJdzAS+Dvt+ESIUA=;
 b=FkwzOSwrAVhszqJ5MG8iOfyxra9YS3+rtblcczEddYHh+HvGme/TrkxyvEPyG2H9dyepwoOkrOWdvdz6BJQW2FE2GaLeXJ4fo4UKf+8v+MnzJi9S4LqX61kc+Fu+G1zKd6kTrXg58duqpJj/osC9Iv4Pbox6eBEfb13JRjE6oiYtDDQr5QtLhJ/t+t3jHkT2eMsAkGXVdXuyKEGuK//72ufzm7s6RHboleYrJhCl8dKSYnoIut1kkKPr8k+kpUP1lq0DnPMw1hfKxP0DiKvqaP2BYd9IRZe/FmXhEP1h7eYERBo5CVW6XesKh01T9CNjOoByxlVNR+1lux5yPTXe+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 04:21:41 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:41 +0000
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
Subject: [PATCH v3 11/30] gpu: nova-core: don't assume 64-bit firmware images
Date: Thu,  5 Feb 2026 20:21:04 -0800
Message-ID: <20260206042123.303281-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f376ca-55f7-475c-abcc-08de65373a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KzG31XaKhg3/YLj0x0M2/lho9dVoOyfgbZbLGYtTy8qRKyfEhgPnYW+9L64l?=
 =?us-ascii?Q?07BkkydRJiCiqDfbdUhAM+L4G4zBAw2Vspvq1oLhdLtpc2zfuBXpsFv9L1XW?=
 =?us-ascii?Q?y6vp8Pj7Pmpw2Okc3QziXo4OkzjiWQ32fxbKn15vEUHMy0Z2zQgHSh38m8Wm?=
 =?us-ascii?Q?TpmM1hYyds0Bpop0qHWcZgJJMoqsz7Er2+CKsjqtsKLofhWv4TdSbBrP5g2N?=
 =?us-ascii?Q?cEiaSEF/jzxzRLhzQ7gZpLcQyXg5B4Y3KrrCMpT3onbzNkVTNtcdM5vZVnlB?=
 =?us-ascii?Q?YpYpDsDdUvC+RAozRjWIDDWyPjRQIsPcZBW0yhnXADP565Py/8+3vbK9op6t?=
 =?us-ascii?Q?uNCQ3g8FreZZkOE60y83zAO9MW1E8gP6ql1E0IH46gJ93MFGFIkOctcXLwTb?=
 =?us-ascii?Q?rOQ4hQD2ReaQihqKgfQU/kGsNA5RpXJbnhna4BWay/ifcyhwuJ7nW8HOCl6E?=
 =?us-ascii?Q?DvOI7iZattnJnJL9HyM2zJF2LdejQ4IjnbNw8840E6L+wwQClS/Y+ypCseYO?=
 =?us-ascii?Q?Ad3/+S3vuM7DIprz/mxF8FCMICNLtaze3LsQAsMhP7iUJj95xQPaPEC2IV0j?=
 =?us-ascii?Q?VbktKnz9vdYyz9Obcf9ln2MQc10j4aCsD46DWA4SFEiBYYw1SXSpT+GFhLYU?=
 =?us-ascii?Q?Iopaypb/5n/QGu73jIxsH2CedU5AVBqqrhyESvAM8RVAcYpaIwHi6EjiRj/x?=
 =?us-ascii?Q?EO8QJiONCT3CcUU5dp+8Ik6hlpQQoa2QDJJoxjz8gBzRRr2SWmLstb0XsVyB?=
 =?us-ascii?Q?bRjaqlsNMMkxMIoHBzPosKXAhvkWgsxD3MmVftzVu1H/P5TAxm5RKhMUF7/Y?=
 =?us-ascii?Q?FIcLqED15qcuS74yXrzTe9BYjjH8nWE6Ta+oiZbMOlvHeiGgB3Y9E55Q6EmK?=
 =?us-ascii?Q?9fXzagAHc2E4iyVfKg2UeyyZUqpER+S/7Sqetk8fhcKYwt/z5k9D0Y9un1ZV?=
 =?us-ascii?Q?uouwvVmD/FyNU0QTzl3vDTdy5uEEMNtSuFIlvVHV7L4au/UxugGif8FcYc+a?=
 =?us-ascii?Q?P/3rcsK72nc9e7pYp18MtnDQ/5I2C8b6ZyWvOzCDcnOQAx7qCQqqa2qbexDW?=
 =?us-ascii?Q?IS+V8Ia52LYql9MNujcRQATvENUSU/2y2Q7Uy/m+u8HuV6QbKl3dwTYYVDDs?=
 =?us-ascii?Q?iSWJICY1lzp0VRaehkvlYanFYRLIVWC5WPuorXtItEVz+BTKg8w6bqtEo9cN?=
 =?us-ascii?Q?MgAesMABvQCAYutDHXBP57oaGl/jHvj/5kJb64OHufNyzIPvhn50+Qn/LtJa?=
 =?us-ascii?Q?HjK+1Qd6tP2kradyYrz+9RU6G7vWUSy9/A+gBFGeKQBVFObCKDBHrnbzhUWV?=
 =?us-ascii?Q?MQtk8wHfdAEN4oYu808Bz5Z1gXyFFgsEtY2t2QUsXSGhhbdKhq48zCQNEQtb?=
 =?us-ascii?Q?OVHxOCoyyckkX1ekyBghMLmo7mc4LQTvxXyAjrZU+q036bqJkAd7VoDH0zPM?=
 =?us-ascii?Q?nWtsU7KPupCqXREwRhl5jm7EpofeNSDzviAXgZjjkbBGKTuJ6+8ElLpHzqyP?=
 =?us-ascii?Q?M67sa7Zqe/ZZ2Tr+0fOAHlzx21V1GvU4NEvsI+9hUGBiapo9Z//YOC9w2PNN?=
 =?us-ascii?Q?0IaYVgCajqQTOqfUlTM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ghpTFOUs3i6tcrQ8o0NZ+Nvp6aYX4q8wcPHI00o5ONvffKhxmA1cPpCyNsxj?=
 =?us-ascii?Q?b1kV2S9dfMP9d7JFzeQ7LfymkkQtFnLGWTpbTuB5t97scigKmpOGktc4TvV/?=
 =?us-ascii?Q?ylQogOY/3zsBccrY1xP7RR4qKaMseFQsiY2n1IB2MoNzz8te4pTqrdEk4xvC?=
 =?us-ascii?Q?L1uQOR3R9S6kokU9Nze6VYrGhYnGySLoFBV24UrOw9wibD5zS6K+6Eksc0CA?=
 =?us-ascii?Q?m+rB6n4qgoxB5XggNSyZLPiZSqaFYZ4cclSbBro4+cTkOD+YovFRm9QuFmQG?=
 =?us-ascii?Q?aQbNIs8bVeruNRfW2fVTfyMUDV5wl1F+R8i+vH5k403dAzy+UQvlk9M/X/gQ?=
 =?us-ascii?Q?xzXFk1lVQ5rOoc9TsMBpIX3MzjlPXZjunB1RwyYP/0f/oiKd6+WkILgWEzTJ?=
 =?us-ascii?Q?XHE6Afe9W4kG7xP02C0jLtDFmmmqOX3XqoGBiRFRSKXEq6esU7rELOlAnrVO?=
 =?us-ascii?Q?u5/I+UZ6LJTe47/ZJ1EUpGYJzQl0C0N2+brwUiKsdZrzKNdSMnTGibu9fsyO?=
 =?us-ascii?Q?tmFiH/o+paiBAnlRZCdiPlGVNLk4z9O4xkBh+/tEDKdrkIPW1W6ysVLQXqW3?=
 =?us-ascii?Q?YkqArECGNlDPcwCfi0+b7HxpycFOXUO5l0qJ1jcx38WJbiKN9/r2dFkS7CML?=
 =?us-ascii?Q?CwwJq1y+UyMdxKhWj9HSnwTIXISV/f9VnkjxPRvh0BnkyRLid7ND8PtYsGIy?=
 =?us-ascii?Q?cnPzwLYizFEduS1RDNMGutnDkGxWsGnlaAWxnw/6Nikh5j57Rnsk0f+N3quh?=
 =?us-ascii?Q?T/qya3cr+yAoBih1l7aK6EDQu4IVGOvxap799tOGXnl7hZi6I251VZzJgmED?=
 =?us-ascii?Q?djwh4jqjKRYi0yeCe9bqKE7jYntE8Xy7G4hQKDJI9Q6hqEXiGkpekZFmnYbp?=
 =?us-ascii?Q?XVtPDMaG0jGzXMB/whMAG6A03Azhrla7x5//Xiz0wVEEjYzyr752N1F9KVav?=
 =?us-ascii?Q?yjrydR8OUr882qZSsD71C/ydRWsNzLs9uY5hTkRlkP4U9xfPUy0MZ3+j3yDI?=
 =?us-ascii?Q?FRr5pJaMwkjCXpjJL1Mh+9xYyId6Hkc/g8mGgXTouCPyu1efJTkGRj/8C3Fq?=
 =?us-ascii?Q?ZN+QGytj4x/NYMbWAqZ/ygX2spOmAOb6cNg3T50PPwIbHBzlSTE6gN1sZcIe?=
 =?us-ascii?Q?F7hhF5mJlfsrVaMQjr716UCwqr8GIUf8YD6RXXsJG1skmRylsLjP9Mhrg3s0?=
 =?us-ascii?Q?LtvibExKdTgBgEa6NYhnAmMHcW8QQrGF4h2nGdIyezQWfTmBnk7p1YO8TZkF?=
 =?us-ascii?Q?EnxAQkm9be15Tr43ZwGLkgPhWtEQoHGELp1RmgVP3hJDfEsGzQygvFpB4v53?=
 =?us-ascii?Q?JgdlqUDQqA8PIoW+SWQubwoE88U6i1wL1A2EHl4Jty+fl/V00TbjjZZfxEBJ?=
 =?us-ascii?Q?iImzOZ7SM01BZFp0wnvAROYc4PhrMi/JIaNSsgEAHNDFp+zu+aaaJtNO0CjR?=
 =?us-ascii?Q?Y2/YIJhR2R5ZoGr3rsfC1KvddYCAaccuAmD+bNMoMh3Fi44FfKE+XGDV785s?=
 =?us-ascii?Q?PFDsY4IbfVcZWi5NgAd8odwdM0dkLIIL5CmNy4Cv6KInXJMLC5vLQ5P88pmV?=
 =?us-ascii?Q?NhgX1VG9PWjYU4iFZtfure17SHQp08bw0RL/lTx6E725KWPI/2Ek/LUvkGhm?=
 =?us-ascii?Q?YorcDw1FTcpg2Y7aiXhvFqu7m66IOSmI70uaM3JMqDZeMCCl/+nf7oTrfent?=
 =?us-ascii?Q?wj8IjKw1Ss7SyoiyOMhUIlgJPKJHAxgQtxa8mrS+dQOA5+6sDf8NqcObGVoS?=
 =?us-ascii?Q?lBbz6hfDiA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f376ca-55f7-475c-abcc-08de65373a29
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:40.9089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGDmNnZG+C0aBRfgYSR75mXMmCJ/2hCBgX7yerdVG338h/ycysR9je2pNCNDgR1x9eNleYMx7lVb5qB7QfZ9hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

Add ElfHeader and ElfSectionHeader traits to abstract out differences
between ELF32 and ELF64. Implement these for ELF64.

This is in preparation for upcoming ELF32 section support, and for
auto-selecting ELF32 or ELF64.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 99 ++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 72cefc3142ea..6ed76a7e15f1 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -453,17 +453,60 @@ mod elf {
         transmute::FromBytes, //
     };
 
-    /// Newtype to provide a [`FromBytes`] implementation.
+    /// Trait to abstract over ELF header differences (32-bit vs 64-bit).
+    trait ElfHeader: FromBytes {
+        fn shnum(&self) -> u16;
+        fn shoff(&self) -> u64;
+        fn shstrndx(&self) -> u16;
+    }
+
+    /// Trait to abstract over ELF section header differences (32-bit vs 64-bit).
+    trait ElfSectionHeader: FromBytes {
+        fn name(&self) -> u32;
+        fn offset(&self) -> u64;
+        fn size(&self) -> u64;
+    }
+
+    /// Newtype to provide [`FromBytes`] and [`ElfHeader`] implementations.
     #[repr(transparent)]
     struct Elf64Hdr(bindings::elf64_hdr);
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64Hdr {}
 
+    impl ElfHeader for Elf64Hdr {
+        fn shnum(&self) -> u16 {
+            self.0.e_shnum
+        }
+
+        fn shoff(&self) -> u64 {
+            self.0.e_shoff
+        }
+
+        fn shstrndx(&self) -> u16 {
+            self.0.e_shstrndx
+        }
+    }
+
+    /// Newtype to provide [`FromBytes`] and [`ElfSectionHeader`] implementations.
     #[repr(transparent)]
     struct Elf64SHdr(bindings::elf64_shdr);
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64SHdr {}
 
+    impl ElfSectionHeader for Elf64SHdr {
+        fn name(&self) -> u32 {
+            self.0.sh_name
+        }
+
+        fn offset(&self) -> u64 {
+            self.0.sh_offset
+        }
+
+        fn size(&self) -> u64 {
+            self.0.sh_size
+        }
+    }
+
     /// Returns a NULL-terminated string from the ELF image at `offset`.
     fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         let idx = usize::try_from(offset).ok()?;
@@ -471,47 +514,49 @@ fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
         CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
     }
 
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
-        let hdr = &elf
-            .get(0..size_of::<bindings::elf64_hdr>())
-            .and_then(Elf64Hdr::from_bytes)?
-            .0;
+    fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
+    where
+        H: ElfHeader,
+        S: ElfSectionHeader,
+    {
+        let hdr = H::from_bytes(elf.get(0..size_of::<H>())?)?;
 
-        // Get all the section headers.
-        let mut shdr = {
-            let shdr_num = usize::from(hdr.e_shnum);
-            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
-            let shdr_end = shdr_num
-                .checked_mul(size_of::<Elf64SHdr>())
-                .and_then(|v| v.checked_add(shdr_start))?;
+        let shdr_num = usize::from(hdr.shnum());
+        let shdr_start = usize::try_from(hdr.shoff()).ok()?;
+        let shdr_end = shdr_num
+            .checked_mul(size_of::<S>())
+            .and_then(|v| v.checked_add(shdr_start))?;
 
-            elf.get(shdr_start..shdr_end)
-                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
-        };
+        // Get all the section headers as an iterator over byte chunks.
+        let shdr_bytes = elf.get(shdr_start..shdr_end)?;
+        let mut shdr_iter = shdr_bytes.chunks_exact(size_of::<S>());
 
         // Get the strings table.
-        let strhdr = shdr
+        let strhdr = shdr_iter
             .clone()
-            .nth(usize::from(hdr.e_shstrndx))
-            .and_then(Elf64SHdr::from_bytes)?;
+            .nth(usize::from(hdr.shstrndx()))
+            .and_then(S::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
-        shdr.find_map(|sh| {
-            let hdr = Elf64SHdr::from_bytes(sh)?;
-            let name_offset = strhdr.0.sh_offset.checked_add(u64::from(hdr.0.sh_name))?;
+        shdr_iter.find_map(|sh_bytes| {
+            let sh = S::from_bytes(sh_bytes)?;
+            let name_offset = strhdr.offset().checked_add(u64::from(sh.name()))?;
             let section_name = elf_str(elf, name_offset)?;
 
             if section_name != name {
                 return None;
             }
 
-            let start = usize::try_from(hdr.0.sh_offset).ok()?;
-            let end = usize::try_from(hdr.0.sh_size)
+            let start = usize::try_from(sh.offset()).ok()?;
+            let end = usize::try_from(sh.size())
                 .ok()
-                .and_then(|sh_size| start.checked_add(sh_size))?;
-
+                .and_then(|sz| start.checked_add(sz))?;
             elf.get(start..end)
         })
     }
+
+    /// Extract the section with name `name` from the ELF64 image `elf`.
+    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
+    }
 }
-- 
2.53.0

