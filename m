Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD203326D6B;
	Sat, 21 Feb 2026 02:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639809; cv=fail; b=EroY1zkOo/GW/whwKsBzC4AGS8iAPeJqXqnaWjfckyynsfAEqgpukXEflLQeD9a8cpT8H1zZvCznhqPfNolCzAYzdyuOji2rQtYJysLa7It8t+085GNXukVz4T53pVfvWDog+8dfniYR4IAJt+igh2nPzY6ybXXhMzKvV/i5gw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639809; c=relaxed/simple;
	bh=tnigXvJ3W0jVSpQhXYF6gIi6qp0sxGb2r51RLLHMN+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZTq1mDVte7samcMEdweXRPyumk7oXrbTG5zFmSbpymnf5VBRozrHmmz3TFlQvGFJok62jLNY3PSa6D1y0+eSo/gb3QYb3ZEYM+fW/EGO0gIhzmf1GdCDjbwNP7JY2IiKnZZ/7ky7j+UkBMKYQjlkVLXzgIb4TI0hIapcxKVfwzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K3O6n86y; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K3O6n86y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2guvyf3jjMo81yp/glG4vhF7JYsFDrQ+sNvStGBjGZYUGbbaKRyphxueQbbZabgEKtKn1aMgr03BfCa+3X1VKHUHHpwmRL1aw18Uf821L3j+zGflqzNSPbL3X5tMleSnSMY17EABsI3ZaWws+D/fHxp8Z18plB37lmMc6Xc06A8b+4ZmMiGB2xvzQmXyRHT1CTwhLvmp/bS9OIwQBCQ5BAKRBN+qm5RAsks1XRWMA6R6zSIFVocSqvQf/SwPOGeV9gjmLry8Xq7n4lX1N4GQ2ZVzY+5cwRab3MwPU+VoWjBA56eLVbpjIP9twA8g1WCYA/Dcot0ssP+XSEMmB2yRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUjpL7dC4xWvaMrYxH/J/ntiDRfa+EsuMKx0QjPBfZc=;
 b=ad0WbcOSCKRQFJwZbu2DHsFoPHutGo8b7i9uxLuf1SMDEwfdyjP/o8scns9VP0OVpgBe+z5JfOWaJuChSfvVoFTOEdGCIsFRT3YarNqrAPDZyGH6b9He/eXC6LWLZTQOWYoIHs1XXAydOnydHPgcvpBZ193fq+trqH2XVqH3/E9uSiZEqIldJ1mu6aHMCYe+btpXFooi1AG3BgDtYZXlIB4I1fDWZ+QU97WEsrTmXOqgCHjxpYs8ahHx53mBloPbdjQbyFwUbWCMV/mN5vQdXLB14slIjyIhudIhfqD5fpPObgz1Ua9vYgnY6/ColfJl8QobCbWBa+PeVzQcNmyS2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUjpL7dC4xWvaMrYxH/J/ntiDRfa+EsuMKx0QjPBfZc=;
 b=K3O6n86yAW6owt27dCrgS95yEYvpZclCOfDY2ii6bJJTRd0JAaQyM/8P7iZ1ll4uI2xyamBEJ/l8q9lvazSKXJseqNiW0hbfxArY6rx76DzT1BRBrYb5Jx09tIMH3juDhN3NjWXGiWtWI6VkUuPhOag66TajAvKa7Cdbbxv9ngeT5Sr806bYj8djn6EktHIu2sAYHfFwK1nbjbuewg+Jb/dRv48yRiKYEbzgkt844kxeTuEmuMxSJmn0oG2S2bDiKDObhrioRtRHNB7QRBsn+zbzF/nSdzwVs1lP1TYPbmdFpDuKBGIRieSfHwuOqmJEoUjH38hEbvv+3E1jpmLrDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:09:58 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:09:58 +0000
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
Subject: [PATCH v5 03/38] gpu: nova-core: print FB sizes, along with ranges
Date: Fri, 20 Feb 2026 18:09:17 -0800
Message-ID: <20260221020952.412352-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 92aa983d-4a6f-4e42-f5ec-08de70ee501e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2xpHI5m+uMQ146j1P9/ySDM3lEsIk/D57oN5e9PM63oolgr/Api2ud0ykWNF?=
 =?us-ascii?Q?oZ+lO6DIDXK06dNg6IEzUyKGcc3ck+SGhWuUuZrp8nLgrqwTqsoZ8aTrnIxm?=
 =?us-ascii?Q?0QnmB90Jf9WCyQX2Mwb2jKYqdcyzKD/4fUw9Gn9HrLjHtgJYzBYnulw4I0xu?=
 =?us-ascii?Q?1aW1UI+kueGSsVzJpscCKN5/oYVVnBWV3k5KG9qGOLOcgb0EqvV0WOAEZdsR?=
 =?us-ascii?Q?FCPrZvIsX3KoreZYX16JO1UzvUolivyHgIEN7NgGSdK0wzBiDyoQExr15/Hr?=
 =?us-ascii?Q?6q/GPomYjCYEA9LvETiqPccns7jfK38HxchNCYNp9EmqNVAVDDBlNegtimmd?=
 =?us-ascii?Q?T87Fngd7EH8FLZndgzLq9pI/YpNsxqZh1TODuPDrsm/WeRbhwH5If3OQmIVN?=
 =?us-ascii?Q?7nuwdi1HF4t2IiFakDlxxstWg/RmSCgQqQ5W91tQmqCxBcSqSNGshpR6JwCf?=
 =?us-ascii?Q?auIFuMzpfG1NNiU3RtqPH9Zg4OAgx2x11SPZUvfRvko27ZXH3GwcyufZ2P1J?=
 =?us-ascii?Q?YKbZZc+CRJ69HVzjPWK+mZQrFlDbzDADLuZhAsD8wZYS2BYnw1pe0RDZ2j7/?=
 =?us-ascii?Q?+lGaJEmdFCxp6vn1Kc/ByrMg/TIU/lIxQYSkSwJ/ORBNjWG8QqlNSzXxLCV0?=
 =?us-ascii?Q?evEoCgdTZnvWm4WBOfEd+L8g7zgs0hd5yQHFuuByqxNs2JWIFddroKjgGYtY?=
 =?us-ascii?Q?bUx0/ZoAFstEdU+xhBsKoVH8X8mk9ZGFT+PM3WH6x8VcXzFFpMpudUQhldIa?=
 =?us-ascii?Q?GUa7OQKjUKST9iFp/7LDxiPF9VT3Kw1C+8Q7qUdVCT1bOb5cJ5YGIlTQTeHv?=
 =?us-ascii?Q?klYDaGjNMfYIPCiwHKV4/pVdbKeFDCfvsk1NoJCwPq8HKVcaxJrshMUU6ALD?=
 =?us-ascii?Q?cT7cQJ3LSlSFWwjl+nvTwV+NPKA/dKRKJ1+wOlV8cDOYvx4PhhpUtVcLh6Ja?=
 =?us-ascii?Q?a8oY6kcCAu6qzRUHHhMJg8caZgZn/X4sanfGZA6S+tdgl7890TsGhwV5mxgC?=
 =?us-ascii?Q?BgvHLeHa331s0fAwj2xW68VlVBnCsTk+CQlwHz64NJgva/79pYH+nJJjgfSb?=
 =?us-ascii?Q?ia1qPDGigVPQCMjxJwWRjTqe/ek3ynwEir8O7OgR2e/vd5k2U8xWNvP0wJJZ?=
 =?us-ascii?Q?iA2Q95FAbSY199Yb8BfX5DjqjkgNE75HLTWxm+ZUPpwvOQk3I/B6yw7uA2h3?=
 =?us-ascii?Q?kgdrFt0yGj0c0UVlYeBxdT3nFdoESvtm75kBAUGTGKLlUMNeTmExZi+Xbd8p?=
 =?us-ascii?Q?OgGBkIaOZ9quVcYobhBjSd+7EzeZcFkbfHN625yhLpPocK9Y4ZdN8nzPPDAm?=
 =?us-ascii?Q?EsSBaTSHotMPDugPg8wzl8pkiJNADqgG527JgBUOjn8PyvzkKjaQplBAkEjq?=
 =?us-ascii?Q?rxRbbaC7y7kuCbdTM9tLabHFmicpVYo1nFXsaea9ywKC8sa3eraACcZxPJrW?=
 =?us-ascii?Q?RVFY8HkfTTn/tbuGJwIS4Z+ePCSw0B5mzUP2XzGAeLbBJHnrskqqKlzhzgs5?=
 =?us-ascii?Q?MnovZhb9ngUJWoCEBuSXrspT6tUbG9Jbn52uTW1cSOnPJUzMXRofNaC3X+PS?=
 =?us-ascii?Q?AlLY8ayq9ZqupBJG44Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fsqMvjt2mxGhB6rIEsjXc+Q6BMNZ2wC4RcvVzKpN+Wtu9gpXWfAMmfaPsve0?=
 =?us-ascii?Q?OovryaIt9nxD2byiWT3m8XJ1Rldwtc2lJdijttizWVytJuC0U8EhwKF/FhNq?=
 =?us-ascii?Q?GMLw/HITlDkQaGjk6CJ2NSMLsFwB3PHobLo1XsSFUciKX7pi0FUTRQFKi0EO?=
 =?us-ascii?Q?Gd6mhCvAhZtoHruaC3G7PGcU7sz4vscMuvOBtS+MEWzpogjTbViy7ahrDmbm?=
 =?us-ascii?Q?qpJRfLK7a8s3DFCYYPrBoCrkN26K3pUv0Zf//zY5LMURhWhL6lOURAyzVKs7?=
 =?us-ascii?Q?sTub2SPtbetYE7PBUIKJH1dTF0e4DxfL82NdvG+/TUrDH1ZZzHbC5jNeo8qa?=
 =?us-ascii?Q?6gJcee0+/G06osKYTVWxE+R9QTDzleuXyZB5/G7vS/YPovcTOF1WYWKyrEn8?=
 =?us-ascii?Q?gO7SguS0TktGhRsiqWrzQ6UAw4Lx4O61npaCeRE925O5ZKqINexEIWgsqPPn?=
 =?us-ascii?Q?dYZz4sSumaHFBzBavg18HIZFjOAIUpEytQ6Tmn2KeWibFnDG99ZINYgkq0Ch?=
 =?us-ascii?Q?oLim+BDTyVYZ4h64OAWMGFDYGN+RJ5hdSfCr60/taBrj/Zrr2m29gBX+2s+7?=
 =?us-ascii?Q?ZbAAwxsPaT5YIZGim1H8AmnGBKZxHToGV6Lb8Jhk7/ZrjnvKEMGFPJNCAZkI?=
 =?us-ascii?Q?HVk7R31GDzkJdsebXLyiMmaL0KteIOZtPcay3evEN450dvuHZgPzpPKx6itb?=
 =?us-ascii?Q?+xYTostAb0dPH7wkxDNeP8JPRQteQaM+ngwzjuo5YRofMOvX6U6n+JP4ybVN?=
 =?us-ascii?Q?j1Juib9OilDH1DZdaVaKVgZTWq8rLUmriyqzbqDz2ppC/H4JDPYzBeV62VVy?=
 =?us-ascii?Q?/Q5VFIOlWqj4dgTyDRdm3bRL3KmeNBjLzWgxBrkSz1hCYhJdv6n56qPqwTlC?=
 =?us-ascii?Q?4p9L+1xs6CJXkK9TJmoPeBqiPhyVBnApNl13zJlLPaW4mO+Ja46TdkdCn7r1?=
 =?us-ascii?Q?x1X3PBZSDDc1J2MehTH9YA4xenlVb5u1+jGn+cgeh8AGgUqOK9gOzQVD/L+p?=
 =?us-ascii?Q?VHDut1EUXiplbaoVDxBsXBrMM4IJ6L4iVtKDOxadUptkCtZisbZOQ4ZOW2gu?=
 =?us-ascii?Q?7mnnEl0MTgkWeWrz08V293nJ/OhQaOwCPDLM5Pt1XuwwQFWX9hNzAOh0EHEt?=
 =?us-ascii?Q?gx2sZjKnCVla1/JSKdyrS3w40aQFmxufsLaljHm/Ft6IPR2Scb5fPuKtYLu7?=
 =?us-ascii?Q?RYyYmK5dSz1TCTZ6qpEwZi07FZEWxahUDgReZh4HNM+B7nQxW/UUr0DPny6R?=
 =?us-ascii?Q?XpzcyqJCxnUMH+IFeObrfuFNMTmnkz5c2Ohsg8XbgYT4t84A/8qQkcKiOSKj?=
 =?us-ascii?Q?EIx+6iJwWiLTARSNW9aWWtfh7PfjAEHUMWfxxk+6A2U1c9JcVP9efA0CCRsc?=
 =?us-ascii?Q?Q5Sn+E5nuGEFQYZ48DICMTGaWEmdIrIyu9nacoITerAHR+3uOHeesGeM0TCL?=
 =?us-ascii?Q?h/SmvkfCxyHsVPQ+kPvhmiCOFHIHvYBICzk3/sieah8N1HLIgJubf7HOzChH?=
 =?us-ascii?Q?Y3RjKxpLCOU68o2XLN/kiCpXZtRbQh68Mll2eKxJzQevVrPuNy3ni6dwsIF+?=
 =?us-ascii?Q?UfKoi2bUMU0kwiNvooLq8reN6lITSTRvkzg9I6zGoKJwNhZGVOuWLkXLCFL7?=
 =?us-ascii?Q?2ABSE2lVYV1IleLYvZkGfxe9pKlDd1elxcVKxxy6St7gMYbEmw7wg/QzFlpc?=
 =?us-ascii?Q?R+NMmvR0efq8kW4pYq8+bYT7v8/QcNe7DK4Up0cjgo2SNxR8EU19yWUp5YJn?=
 =?us-ascii?Q?uleCM30siQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92aa983d-4a6f-4e42-f5ec-08de70ee501e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:09:58.3016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBCs/B4tCDTa66ybNkNV3EJ/VbhyEzf9l1o5zyQhtjnsyKRcj9yGREyA6vppZzaO/E+sZGL01gmlZ6hxQ1EjPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

For convenience of the reader: now you can directly see the sizes of
each range. It is surprising just how much this helps.

Sample output (using an Ampere GA104):

NovaCore 0000:e1:00.0: FbLayout {
    fb: 0x0..0x3ff800000 (16376 MiB),
    vga_workspace: 0x3ff700000..0x3ff800000 (1 MiB),
    frts: 0x3ff600000..0x3ff700000 (1 MiB),
    boot: 0x3ff5fa000..0x3ff600000 (24 KiB),
    elf: 0x3fb960000..0x3ff5f9000 (60 MiB),
    wpr2_heap: 0x3f3900000..0x3fb900000 (128 MiB),
    wpr2: 0x3f3800000..0x3ff700000 (191 MiB),
    heap: 0x3f3700000..0x3f3800000 (1 MiB),
    vf_partition_count: 0x0,
}

Cc: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs | 83 +++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index c62abcaed547..6fb804c118c6 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -1,9 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use core::ops::Range;
+use core::ops::{
+    Deref,
+    Range, //
+};
 
 use kernel::{
     device,
+    fmt,
     prelude::*,
     ptr::{
         Alignable,
@@ -94,26 +98,71 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+pub(crate) struct FbRange(Range<u64>);
+
+impl From<Range<u64>> for FbRange {
+    fn from(range: Range<u64>) -> Self {
+        Self(range)
+    }
+}
+
+impl Deref for FbRange {
+    type Target = Range<u64>;
+
+    fn deref(&self) -> &Self::Target {
+        &self.0
+    }
+}
+
+impl fmt::Debug for FbRange {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        // Use alternate format ({:#?}) to include size, compact format ({:?}) for just the range.
+        if f.alternate() {
+            let size = self.0.end - self.0.start;
+
+            if size < usize_as_u64(SZ_1M) {
+                let size_kib = size / usize_as_u64(SZ_1K);
+                f.write_fmt(fmt!(
+                    "{:#x}..{:#x} ({} KiB)",
+                    self.0.start,
+                    self.0.end,
+                    size_kib
+                ))
+            } else {
+                let size_mib = size / usize_as_u64(SZ_1M);
+                f.write_fmt(fmt!(
+                    "{:#x}..{:#x} ({} MiB)",
+                    self.0.start,
+                    self.0.end,
+                    size_mib
+                ))
+            }
+        } else {
+            f.write_fmt(fmt!("{:#x}..{:#x}", self.0.start, self.0.end))
+        }
+    }
+}
+
 /// Layout of the GPU framebuffer memory.
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
-    pub(crate) fb: Range<u64>,
+    pub(crate) fb: FbRange,
     /// VGA workspace, small area of reserved memory at the end of the framebuffer.
-    pub(crate) vga_workspace: Range<u64>,
+    pub(crate) vga_workspace: FbRange,
     /// FRTS range.
-    pub(crate) frts: Range<u64>,
+    pub(crate) frts: FbRange,
     /// Memory area containing the GSP bootloader image.
-    pub(crate) boot: Range<u64>,
+    pub(crate) boot: FbRange,
     /// Memory area containing the GSP firmware image.
-    pub(crate) elf: Range<u64>,
+    pub(crate) elf: FbRange,
     /// WPR2 heap.
-    pub(crate) wpr2_heap: Range<u64>,
+    pub(crate) wpr2_heap: FbRange,
     /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
-    pub(crate) wpr2: Range<u64>,
-    pub(crate) heap: Range<u64>,
+    pub(crate) wpr2: FbRange,
+    pub(crate) heap: FbRange,
     pub(crate) vf_partition_count: u8,
 }
 
@@ -125,7 +174,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
         let fb = {
             let fb_size = hal.vidmem_size(bar);
 
-            0..fb_size
+            FbRange(0..fb_size)
         };
 
         let vga_workspace = {
@@ -152,7 +201,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 }
             };
 
-            vga_base..fb.end
+            FbRange(vga_base..fb.end)
         };
 
         let frts = {
@@ -160,7 +209,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
-            frts_base..frts_base + FRTS_SIZE
+            FbRange(frts_base..frts_base + FRTS_SIZE)
         };
 
         let boot = {
@@ -168,7 +217,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let bootloader_size = u64::from_safe_cast(gsp_fw.bootloader.ucode.size());
             let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
 
-            bootloader_base..bootloader_base + bootloader_size
+            FbRange(bootloader_base..bootloader_base + bootloader_size)
         };
 
         let elf = {
@@ -176,7 +225,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let elf_size = u64::from_safe_cast(gsp_fw.size);
             let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
 
-            elf_addr..elf_addr + elf_size
+            FbRange(elf_addr..elf_addr + elf_size)
         };
 
         let wpr2_heap = {
@@ -185,7 +234,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
                 gsp::LibosParams::from_chipset(chipset).wpr_heap_size(chipset, fb.end);
             let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
 
-            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+            FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN))
         };
 
         let wpr2 = {
@@ -193,13 +242,13 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             let wpr2_addr = (wpr2_heap.start - u64::from_safe_cast(size_of::<gsp::GspFwWprMeta>()))
                 .align_down(WPR2_DOWN_ALIGN);
 
-            wpr2_addr..frts.end
+            FbRange(wpr2_addr..frts.end)
         };
 
         let heap = {
             const HEAP_SIZE: u64 = usize_as_u64(SZ_1M);
 
-            wpr2.start - HEAP_SIZE..wpr2.start
+            FbRange(wpr2.start - HEAP_SIZE..wpr2.start)
         };
 
         Ok(Self {
-- 
2.53.0

