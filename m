Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013071.outbound.protection.outlook.com [40.93.196.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C590342C80;
	Fri,  6 Feb 2026 04:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351722; cv=fail; b=bq9K9gC2ev5HDIyxVSxRe2kAUbqSIVMNk+thJDFFGt+tyS9/e2zZ+NkAp8Q5phqIVolimwln3DZha3vvfzhY7XpsCjJh0Y7t3b+RbxAaTOSaLim8IS2sTahja4eyKcTB5zz0+3EZ1T5r+hQiW8iFc+ErnMFRgjFgD5VIXGs65jE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351722; c=relaxed/simple;
	bh=iDcvWyj/tNiMRqGPGJLj2R51WC22XYSB1ByPSjwSdc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fefNK1ctsX6YarhvuLL0ic6VwYiCTHbZL2HbKdN8gnrPwqO++FVKdJmP8pqWGLEjA4nq4IQwotlcvlADzYKZDDQ5HOa9Msn2x6hZtIXAAT4nV6B5Uue+J5QYNHkkY9Qg0x7CKlpvfPyybiIjPXrgERcIZ55q3DbR96MHiPzBNuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SGWtT/AW; arc=fail smtp.client-ip=40.93.196.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SGWtT/AW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHC9BgAqy5wD0XpTzwqK5kDl24aZDzIb3GribLiNKX6fwRFqiIX3xPQQPZppAK9C5kT4EElvKmX9hun6ge5okRtpKQjQsDlfLxC3yBtG8xYoNweRyPzXMwveAWVdv0uljEyt/EhLoshybLE5L8dmKGckjwT10/VhrG/xGnAEdvm/gOnuf5WtRPB0n0uCGp9safoGHXVswzSdpIZorVwDf1DRuuYTo6KH4J3S2PQXaALyDO7AGdZJ73dJV+64fWcAXsaeuJAYOp3Px+eDSOumdc5CN4nOKH3goi/RFBRj/TclULzOtD+UhZhf8iQ4QhKejg7QnJx4WkqwDxqL9GbdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYPzLsA4hJhMKtvcvhmn/6F36CZsV9VbF6HwQR0u0zw=;
 b=FQgXGBbPvyN3En81jedC8lEyaW0rv5T3THmuXN2lJrPnTYD9YVgXI+YuADly6eU2fA/wOZGD3/H1JsRHazFtlrUZIKsny9Z4O6TNl86K8S8GW57sn8rW25y38s0oE2PLxVI8DAeVQsecOuUL+bHe9i0kOciprtvqA2eWzBCKE+jTJMvOexGnsF5RWbGtjf0ryBh93SNgCpwF4DJJEkivWcHta1EXoUTTDmuoLl4btduJQE3GYIyZZpqbER/zYuvr5nBf718+KtJSMsHVd0Mf86hemRZXJCkLBN/K9azka8dGyyL5FX+zE/iKVg80npcI+99Zhb8Du77P4JYysLg80Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYPzLsA4hJhMKtvcvhmn/6F36CZsV9VbF6HwQR0u0zw=;
 b=SGWtT/AWgz5UsV2Cc6fvCdlm9TUuwOZ/WA30A21pnBzuNQN50zM+WVfIVBhJpRvWRhiY08I/gHpgcgAq1/J9/l8nSm0mYc8M2qxrL4ObDoZ2iw3Npx3fHo/UeSJoxar2nj9Dpwtt195djzj2aGvEjSJrZsxnyxPANr/RsYt8L3EbgOUxwWETXc80REU7UHCoDM9ufBYlTb4XZLEo1d6g94m5l1H340aDEJdxREFEACbFw+b8RGAoBCIm8cDU7CnOZz7mlVsNTPg9J54RkyvulT6xxDKjTf0qFKxs2gj7cNeFlnLB7WuJlj23ubUOWbEptE1mNitZxHUSorOBPJlMkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 04:21:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:59 +0000
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
Subject: [PATCH v3 25/30] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
Date: Thu,  5 Feb 2026 20:21:18 -0800
Message-ID: <20260206042123.303281-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:a03:333::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6b0d3a-8de0-49d7-b017-08de65374526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PVM+xMujVjSLuA8WBYm9/zq8OiTBViIv7fKtWzJSxCS7HEUvNGQJm3ibM6fV?=
 =?us-ascii?Q?WpJKB4Ecn690BKSL/c+tK697vsG/2pa2ABZ2iDG8O0jogAPSMw78bqk+GhYB?=
 =?us-ascii?Q?ivqgLjEEifu/Hoadi8NJ5a+ZQ2sl75X+7nS8N56T6si3qI9gSQsesIzhWgWm?=
 =?us-ascii?Q?I1spYFHN5zYoFx6UcgbYnofWbH/Xu2EW5UyCyNd5FbJLxt41rwYiYmXeWPjy?=
 =?us-ascii?Q?0bzb0T5+lBt/OJ/p4qh1JbFqjHIj2h4FdWJ8ajjcobbqv7nlwNhWOm5yaAS5?=
 =?us-ascii?Q?GWySL5cJ1ErYiWK17d62rUarslp+FhTQCdlxuAs7Xo8cVQ6Gdri+4x8kAWaN?=
 =?us-ascii?Q?4kZl+HezrHUDFSTIZkTqcVVhyLywzY2Kt4HaSvwD2oj1+T8zf7BI+L/jROV2?=
 =?us-ascii?Q?OFS3De2PezlyI7lU2soDHKZj7LfiI9IM5yuX2rDlZdkLhcg9Q0ZXnZXXl/Nd?=
 =?us-ascii?Q?ZsFUrjZRCYPSj7JgQT0FeeFp+AGYuPEeR0N3sTeHU/uKDVlWR+SCONWjj7Pm?=
 =?us-ascii?Q?QxCq/MtVY/ajX3CE4WL3rF9Gay10/SYic2F+pbahJmu/rQUnxlcB4U9qgHM/?=
 =?us-ascii?Q?uFUMUcIE4z6V88FvTZNE1G5Oa9IQiVoGFo8a2cGL/zQHCN038IlirBZqQapc?=
 =?us-ascii?Q?8EL+65eZ5JOq3vlF6rJH42YWDilqLX5YJtsQyN96Xa39Wv81V3EUTTxBUkU3?=
 =?us-ascii?Q?tE4ruKZoTW32KzqhdYjzx/wQY+Ta5LtyQ601i5begjAdRkQM4JERPv/lYJg7?=
 =?us-ascii?Q?REWXYtKwle7xAyQ9DyP4oRTenXr8TCYdePEMMDcuRCiJubY9xXKiKVeasIfk?=
 =?us-ascii?Q?myDuX2fnZq+1+h1/gJLYy7R+aZ+dVdFcUSYyUfg5+y6hqaFiXnt6v1ebFOWQ?=
 =?us-ascii?Q?aVyNf7QWR6an2DfOThP0KPQ2p8zt3zCP7knuxtFyHRCgekdDbNbig+AWCMXM?=
 =?us-ascii?Q?aB02WwidSsZoTJTwzFdHgtNX5DtZbwC3+TOQq3tqTTJ6DPGI1iL0vosm8u9J?=
 =?us-ascii?Q?4a+xo2cfTpANPP4rLkjYcqS6PRAll/T0t3FtyyrydGgeGDgD6GbH98Wwx8zz?=
 =?us-ascii?Q?AfQbeKHplF/CfOU1VHHRf55Hyujjf4MmCELUjtjHnu4gfTlNtdfGXnRXhPep?=
 =?us-ascii?Q?MZTwrwVOX21W2wdPO+coNZikul7kfaw75VDsHFWof+3rstR9g6cctG6BOQXL?=
 =?us-ascii?Q?YxqNFNrC7/UyWijSWGaVq1KUUauxOgqy4BVxFfNdThl8jiP7DWDbXZLYYguD?=
 =?us-ascii?Q?R15u1+wB2Af/ib/qmMAdjy0pKgW0ecCVlXNsm1+s9Iu5OVo3mrE3OHoqOmXo?=
 =?us-ascii?Q?ZhsjZ8PO+YuN2zH20a3jeUVHkibMwHA002HPCZLAEMgnwtaLKuOQ8U4qKRJK?=
 =?us-ascii?Q?C0FLLgVd/lTVgJlCz7VFuiqubib5tOESsb4gVHcyKC6nJaclZS+G0oXJ43QT?=
 =?us-ascii?Q?o32wRPsy14ohyre2/2Z2isEpJ6zA6qlEmZbchhhhT2r3a0ZExk5K/5NsFjvA?=
 =?us-ascii?Q?wc5sSLt7a+6MpWF1GynrVHncAIvzfNbaUx2eCrbfQuu51IEbvfKwtOo+3OIx?=
 =?us-ascii?Q?uuLqD6IxaYb6HYkGcB4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iyKRmLXJ2A2JIpvblleZQhmXfjCE5YwO0WrUKACxDqtMfU07bh438/lFfxtz?=
 =?us-ascii?Q?QpLORDpNJLadlHMSzghKRbOECWKaeK0FGhI/3MIcl573pRHUauRnJNS7OLo4?=
 =?us-ascii?Q?UsT/ojZOZZF+mg/h9DiByeyfI4AV5gIALmZljfMrNMNNWrZpVra+WkcqB2TJ?=
 =?us-ascii?Q?VSQqEuUOwGdoBN2wBwz3/3+omreg8LviESzfLk9DJid8fhoCArCx6XNwAYif?=
 =?us-ascii?Q?RxhU88XvSMwxB1DE5+rsde21o/D50n4Y5pI6mjYIccy9IBEBJVLOJ/M1Xmpc?=
 =?us-ascii?Q?O0OvRRlcj5MIjyKghAyt41Yqz7VJEAAG8L7boxFa93Nb61ZwICAixghnaxdI?=
 =?us-ascii?Q?Em+7kwIVWmmwcGI7an8ttjhMZ3ZiIRmt50KvzsYKpySTmvkyKkm7CjJ9Xm5y?=
 =?us-ascii?Q?RRWU0q/XkB+sxnGGfMYidvKv3simPSbkEvc4oKCp/p20iqrJoSmmf8GIFgzu?=
 =?us-ascii?Q?oyYXuLU4AslzjAOZ3DnNVFbEIfRtKaddhvSMVOYPOYhENljnSwUsnXmv97oU?=
 =?us-ascii?Q?EbURKTjFGx44J3NEwaGahUglGLZidTHiBt7Vy7D6T4fMorEiCdlvZFfW4pgL?=
 =?us-ascii?Q?/oexp59cnjN9vptNr6eFay9TU+RcEafAfs1sK2BAfPacXrfkILtLMgGHS5cg?=
 =?us-ascii?Q?2HR21xVGf5ypC01CB2HBbn65ejn+sgwefR05ZgDaA9M3+HsfFr1Ce01Oo8V7?=
 =?us-ascii?Q?Pe8OXRX0lvH6TFniN/RGtxW11GU8S+G5RxeelqOReswwkXlGfgaPwUMrCZq4?=
 =?us-ascii?Q?VgwhQOlS/xVt2rFMKVRG6rqoRjVRO+bYzncbdNgA1oAKYkxBCi1nbHUKyozd?=
 =?us-ascii?Q?F8gY0NroRzRUesCK/SS5ZxWIDXQ7yjNaCUj05eLRijCxb42BmrbsGD8v7u90?=
 =?us-ascii?Q?ZbCREVpCmQBPv9AeHCuV1qvVwN9qNA+gCwQIoHZ+/gSf68cj8J6Q6AmFFIqy?=
 =?us-ascii?Q?UwJFhqpLzwja2kDnYZiyBbgtlwNd4FmK4/7KSYiK148/K7y2nVT3VLinHTDx?=
 =?us-ascii?Q?xUbAdDie75GBAEwT7NtZVVIEtRoat6PpL3YOTOc3qc4dnbKcm6Reuc6kAw2E?=
 =?us-ascii?Q?sP4+0coq8XuEJ+O38yu8/J632GCqWl6pPkJkCYdw2dafTXhi1CZbJvYjymok?=
 =?us-ascii?Q?PnSR/dwmpRkfUFpdbXUHjGG1wkJTDGgbBHm0Pwx3TBkGZZvtJY3wD9fqKVHk?=
 =?us-ascii?Q?OjbkTwZaSVmMl7qRtPX8TWBep+c0onNWfG+cIx13y4jFEa2hgRidCv59Yf+K?=
 =?us-ascii?Q?OKvJH/QN4h3n2c5dK5RtVxpJQ2QOR4GzubBFyHtkegO9krM0svZ7AALfNhL7?=
 =?us-ascii?Q?MGTFPRB04r1fhWRiM7xzu4x5yXGYLs0KmmG/BCzMra8+fz81wJXgfJMjZ7g4?=
 =?us-ascii?Q?6rbAF2FiVnVKMn7kzkQx6OV4ta4cl5XiTFR0ySqxPVjrbquz9CFO3VWaMosx?=
 =?us-ascii?Q?BKRbKgc6RsrY4I/wlh5Ymum5h8d5Ku4VTjiiTZImCjFz/ZIuJWq6oyaTDm3c?=
 =?us-ascii?Q?IaeSYJlgdtRqkgmxt+ZkKCG/dMDKRxxjB2E9SukW894F4r1A6PxOi+FVt2Y2?=
 =?us-ascii?Q?ancSjt117BwZmUAcwWbTsFmaXnIsozQduXoKX5p3aemoK1UeAwYM0e94yWbp?=
 =?us-ascii?Q?DjySXrct3BR/hgYYLemhEU+5U6yketKW5UkO8mY8Yi/Gqr7mez11niT69pfs?=
 =?us-ascii?Q?qYaYpmXaobY1as7THdnMm7C5aCJP306YHs8bOp7bU6Ww6mfPhbueViZaOVqd?=
 =?us-ascii?Q?WswS2WIcdg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6b0d3a-8de0-49d7-b017-08de65374526
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:59.2251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VWg+Ez6S6ItIEOcXCtbfdKo5rtGFNwmDmeXyJHFHyczOfBaRhPFs9D1eS6KhGfvqD/rrKl5b3b1FOe/nekZWPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

Hopper, Blackwell and later GPUs require a larger heap for WPR2.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 55 ++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 086153edfa86..0d1d9eecd77c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -49,21 +49,41 @@ enum GspFwHeapParams {}
 /// Minimum required alignment for the GSP heap.
 const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new::<{ 1 << 20 }>();
 
+// These constants override the generated bindings for architecture-specific heap sizing.
+//
+// 14MB for Hopper/Blackwell+.
+const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u64 = 14 * SZ_1M as u64;
+// 142MB client alloc for ~188MB total.
+const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100: u64 = 142 * SZ_1M as u64;
+// Blackwell-specific minimum heap size (88 + 12 + 70 = 170MB)
+const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_BLACKWELL: u64 = 170;
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
+        if crate::fb::hal::fb_hal(chipset)
+            .non_wpr_heap_size()
+            .is_some()
+        {
+            GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
+        } else {
+            u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X)
+        }
     }
 
     /// Returns the amount of heap memory required to support a single channel allocation.
-    fn client_alloc_size() -> u64 {
-        u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
-            .align_up(GSP_HEAP_ALIGNMENT)
-            .unwrap_or(u64::MAX)
+    fn client_alloc_size(chipset: Chipset) -> u64 {
+        if crate::fb::hal::fb_hal(chipset)
+            .non_wpr_heap_size()
+            .is_some()
+        {
+            GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE_GH100
+        } else {
+            u64::from(bindings::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
+        }
+        .align_up(GSP_HEAP_ALIGNMENT)
+        .unwrap_or(u64::MAX)
     }
 
     /// Returns the amount of memory to reserve for management purposes for a framebuffer of size
@@ -106,12 +126,25 @@ impl LibosParams {
                 * num::usize_as_u64(SZ_1M),
     };
 
+    /// Hopper/Blackwell+ GPUs need a larger minimum heap size than the bindings specify.
+    /// The r570 bindings set LIBOS3_BAREMETAL_MIN_MB to 88MB, but Hopper/Blackwell+ actually
+    /// requires 170MB (88 + 12 + 70).
+    const LIBOS_BLACKWELL: LibosParams = LibosParams {
+        carveout_size: num::u32_as_u64(bindings::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL),
+        allowed_heap_size: GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB_BLACKWELL
+            * num::usize_as_u64(SZ_1M)
+            ..num::u32_as_u64(bindings::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB)
+                * num::usize_as_u64(SZ_1M),
+    };
+
     /// Returns the libos parameters corresponding to `chipset`.
     pub(crate) fn from_chipset(chipset: Chipset) -> &'static LibosParams {
         if chipset < Chipset::GA102 {
             &Self::LIBOS2
-        } else {
+        } else if chipset < Chipset::GH100 {
             &Self::LIBOS3
+        } else {
+            &Self::LIBOS_BLACKWELL
         }
     }
 
@@ -124,7 +157,7 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
             // RM boot working memory,
             .saturating_add(GspFwHeapParams::base_rm_size(chipset))
             // One RM client,
-            .saturating_add(GspFwHeapParams::client_alloc_size())
+            .saturating_add(GspFwHeapParams::client_alloc_size(chipset))
             // Overhead for memory management.
             .saturating_add(GspFwHeapParams::management_overhead(fb_size))
             // Clamp to the supported heap sizes.
-- 
2.53.0

