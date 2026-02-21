Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011019.outbound.protection.outlook.com [52.101.52.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC13332C33E;
	Sat, 21 Feb 2026 02:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639822; cv=fail; b=JjH6wFy3uadKpAYwvGFcRGXsZ9XkBx1sIfR3XPRKXea84RGnnMXq3mZg9u4+SKw4kgWvyqN/TTR8SRQf7Xef/pvnwvRpusRfidTRfn7cu+rrGCRCt+C3T2rYOCKQurR+5nCcGGDLTBzPajVzdxBga20SmLAuzfi/XhGaHkrG4HE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639822; c=relaxed/simple;
	bh=HWd9IwpCrUXqR7dfS2u14hBdjEAYZCLH0SiUYJGxns4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=arS1aHBH6qukwM+OEG65pIgPa5j1rEBlPFC083nEWcV9+rq1kM4u54jq8ilQX3HSSyikXvbKEBzc1/KSPgIVicW9kUj2f/aOEOjbXm17XtPowYZ6OD4JaKGPKV1oqAAJ5syGuoRDqQJ8nZnagVTjje4gicYYt3TdJvoHu1Gh1m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Uo5DNBqb; arc=fail smtp.client-ip=52.101.52.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uo5DNBqb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOvJYZ0JfztsWTj13raxxGktGu+sEnstJc41aXpwKnDPArt5s0ZWEwZfJObC/4SYb53/dxO0g/Egop6VW8mX31lb+bRF1hg8NK9Buq7GDO3phf/fMS8k5WafIXNUfldYjIsJDCQnN/MR8tn9x/dS2JyInpOGpredlALtNTsH1ilu8vlFuGQ1T+NLEUSvNrF2ZcNTJKMc72GeDl59+hmeWIxFs44bAjIPYVsAdkTcS8lJmIhg2PLCVDzP5zTw/+7A/caI7euMDKHA8vXIp4i09l0QB2gvKBKgS1ohGrl8/bS34EyAn1ktltL9q9rcnMCHbUNzcuGmMKGAkwKtsdnLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TD20Yi9ZNK5oTd2CkE+fdOZg0waIS/6zSDxO5l2iLnE=;
 b=E8p/KEbqTYipLqyMJiadtqC0J4sXcepy1hwdUb4rsJ9TeW4J1wq+YDx8B7imeZXydjHWNLDYPq5SgJHjrFTupYAfngbXM7bUlfMpJYC9+gviwYScyz1fpTtzgT/2CYdjXUDjhz82TpbvhfMD4zaVgcsmiPoISBO2tviA0WgzFHJQTdj2G7N5VSMMuL+fl3/9w2/CEt+xUN+IW/eQZRwW+bLhal4usxygZfeebP2Yqag4ogz967bBifpt2sClQ+r/YOi1x4/kzqXm4asXrn156haB33kX8YAw02bBPSpgZb1N3a1K9FiyrkuqH+YlB8XZoAxM+SXyUIV1Uf1c2GTefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TD20Yi9ZNK5oTd2CkE+fdOZg0waIS/6zSDxO5l2iLnE=;
 b=Uo5DNBqb+p+l+1FUqXU5pzjaeb6HydOJEotHmI2EVCl8Ah+5X4PkCja4ZTvYJ+8rZSC8YD5ky+adfgD9FXzdW6YRN8Ys3IlHkEhPO2LboPbbN7WikfJuWlcmxDs+JpK4WYhnHq3s31ZQlprIMILOGAkMKZp5Xl+dfk5uBXZ+UduD6znuH/YUQ1Px5RdNGk+J7pLi/ZupHhfqsjhpONTdb3kU9QzqURjgjJA+M4LncmO84rj1t96iZw7o3w4ySy0qUvvmRO6p+ck5gPs6+2U8UZn5OA1iA/S8nVaklGyc5khi5MiUDIw9GNI3U3Uob5goeUnFyj0EtEQijiwrAVQDFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Sat, 21 Feb 2026 02:10:10 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:10 +0000
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
Subject: [PATCH v5 13/38] gpu: nova-core: factor out an elf_str() function
Date: Fri, 20 Feb 2026 18:09:27 -0800
Message-ID: <20260221020952.412352-14-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 52fd5ce8-f451-49b8-53af-08de70ee576b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kL/r0Eu84BNfsHzOn8goyW+2ybRq04oqknLjXKohIncy7nwGrRqUV0lNuNdC?=
 =?us-ascii?Q?yp9fB33SXDtH74Lz7ljUXgddMpgSh8aqv6oGXYO7J5eGCqlcHva0SveK7NWL?=
 =?us-ascii?Q?bWXJF/FOKtFgvPcKI7GYvV+cUB1Dio9NpLWTPLqlM9iGJHn+KI/xJ/y77BpP?=
 =?us-ascii?Q?vW11zjAImi6wqDDu0adUsO2DD2CArKOeht41Eq/iAdJ8zJpi2QpQYjKuDXIG?=
 =?us-ascii?Q?SZVa4ThtDtnjQFD1Z9rQ4Sayw+Jt8cbiESdxkkPtD0UZcB95bOk5qbKGD5pa?=
 =?us-ascii?Q?mV4HBorAqqbVH4kFgeYrdAMMbY0VJe0FUWz8pM8dRd7BYyXXS1TYhgYQJmhb?=
 =?us-ascii?Q?oNWc8SdH6axTIqO2v0zt/WwWLpvOV3eE83+G3vxKmHHz0owEFJQ1zNZo5tbe?=
 =?us-ascii?Q?WJRJYod5hmMhX7wj6y6KhSE0xG5iYgJ6Eevw+jhdqxbmoqLvoOxENSZ5LG4R?=
 =?us-ascii?Q?TqHOR//DtyVyWG9NsAQQSJDdtmgVq95eue1MXRcje1/+KL5Dy2XFS6pcQyzH?=
 =?us-ascii?Q?bLqewEuF4q/JUlbztrjLeBukpZvi9HNZfCeimVkUv9/1w7ZeUx593LC9qBwU?=
 =?us-ascii?Q?Ts+AmoAHOo9Jn9HGVIOfVUupN/lfSoyjI1vMkDbfTD7UMNi5M196jVAaYWLk?=
 =?us-ascii?Q?pKEm9K8jOyolFCQ5aK+v9TvK05D0ZDkkqTyUAWhuK5LP9SOJ19vVomzQw3or?=
 =?us-ascii?Q?pYHvbNl5m9svubPX/+u9yydEdA2N3LK04X2lLt4hJX8nqqjoz4WYc8ro1Xaz?=
 =?us-ascii?Q?F3Lzjtyk5VVzSGotykTkcMN0dHgWcNZpqTGvcxAESuOoeYoLP4GIPEK4qDQ4?=
 =?us-ascii?Q?fcx/AInISWTPb9Pr3AlFDrDtBruhrevi9xx92ZigBp2PpauPFT4p5+SppmOx?=
 =?us-ascii?Q?0u2Qyb31zanU/BnfJwtS5m09+tt3p4/ST1E4K7S1rradQqFO3ePEVX6IY1m9?=
 =?us-ascii?Q?LKSIsSYXxeb02qT9KUZhVH1hpLwVALz1H69vBbm4v5OIzvfx+t77OSV3YmsJ?=
 =?us-ascii?Q?jm9x5gd3gP+ooe//BXoimlLAGEKPaFmcF2Z0iaWlXFma7UT9As7K4qHA0N/H?=
 =?us-ascii?Q?uc8WMCmCm2Kg4gavK25LJglm8M6AUYTDrkKA3NBE72tS+V6tPIcg8tC4dtCS?=
 =?us-ascii?Q?dYtywNIn2JK6TXgC5Tey2ErIsaFiHw/9KqCPMP1wqCbgxuQSwsPbPQb6Xbp2?=
 =?us-ascii?Q?diREbR6yINNLY9+AM9FrAxFjAv0NMvGx69g67Wb8HhocXYmThjGWBKD5Pa/0?=
 =?us-ascii?Q?dGeZAT1tDM8VKXLRRnfWxTYv64iLgKaSjWnjA9636B9sv00x/ziUvQDSNAVH?=
 =?us-ascii?Q?Z9gtCaGTMAIA5dhNFrHbhuePlUzuxQ7w7cg1KoNBTJm9xYjPe2IGicQ+0q55?=
 =?us-ascii?Q?z8xJDRU21MalLBl3TJ6OQL/RikFMgz8pdR9Ah7OJ+T4d9XggZBhBBnFA6zpp?=
 =?us-ascii?Q?GamYfVHywaAql/ndSkhXZ5TItMPRojWjP9jwjD1EDMBu7gLG0m3M+gY6EjhR?=
 =?us-ascii?Q?+I3OL6EBSn41thWuGY21nIua6AFJKK6ga3R+4z046xAdsX8WJwyVKq/e6xCY?=
 =?us-ascii?Q?5feDb8F3va8zg1B5GO0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rfxAc4V9GLrb9W74OGJmgoWcR2JwsOYj0G/saAjoQPXcXAMinnKpzSPbi00H?=
 =?us-ascii?Q?TmMrUeyVcQ7C2qKefqHiIiUbIuvWba6G9p8XEV0LjUegddCQKAD2GR4PEYOR?=
 =?us-ascii?Q?DL/Ev7nQiK/2WaV6fB9SNC4Y9IySPaA2mmOPu17d8NRT+t0KOcErCjzEPp7e?=
 =?us-ascii?Q?0Q926ZBHGKDe2Jls2UiFiRgipgXUqsOlu1pEaEMbahnAkmMmiTA0ffPZw+jx?=
 =?us-ascii?Q?pPTL+bNxEBuEn8JMpzGZB8z+Hh/pcMvS7inrITiggSCozF9gHGA9sREnkZD6?=
 =?us-ascii?Q?ZkzX1v5h3oZYjW6B58KmfiimNOd4DZ3wG3k3L9Kg5lHBBeNwd5uezTZYhNbf?=
 =?us-ascii?Q?mmyMnnUMAzgnB7w71/uL6XqYmvjrQg8r8D6Obs49eScb85RAgOvK79tQYwdl?=
 =?us-ascii?Q?QVYNAYFqHNhvCP3Ci9/r9jIEt1fqJbQsllfo05aRALo3I4fj6yEojDpKlnqB?=
 =?us-ascii?Q?bQg7tAby+JyrH9BGlkaRhaGdFVo7QPfvJxmpLH6C/mE9TmnOnQCQFgZUgPN4?=
 =?us-ascii?Q?Bm3548wf7b92mlDzJ4XTCfIluKgMM4QqvVvJ687Lmlf+qeVtS7J0WiGqmNsl?=
 =?us-ascii?Q?yRMQMlkq6MxY01EdmDmUHBwFK1YpdiPvZyrhIbBp/AE+7vAVoa9VZs0MBPua?=
 =?us-ascii?Q?ZwZbBgjCtx5MXuCGHKIEhGTxjc6ZoVCQyMymiEb/KPHuBHuL5Zx4xlXIxkf6?=
 =?us-ascii?Q?/J2zBh8om0nwMZSU5lDndC9G9cOqFJD1M0ET4MlNCrC+rRI8ad55JEzEhqpE?=
 =?us-ascii?Q?UJinRFYi2Dz85WwRpcpZawskJ6Yrx+HI/rGIiMZaF7j3G0JWTydIZ8Mlswxg?=
 =?us-ascii?Q?A0B4XFQhzfKYtqYZrmISD0+KP8y1JbTGeut+eyUmT/0w0Vucb6FMssQ1WZQV?=
 =?us-ascii?Q?ut/EaNlry5o90egZ8cXeIDH0/DIIjh4J9DGmMdxfKCxhOT0tXLqYVv7i5P5T?=
 =?us-ascii?Q?Tt6pGUBXWpjYH0SYreSvp/BbKd//dA76rnfK5znm4M/7yevpHWGVsYL4uU9v?=
 =?us-ascii?Q?7smjfRP/iyOhhjIzPDJfpOVRHK+rILU20z3hbjGXAYEOdWtHXpo1NpfMVg/s?=
 =?us-ascii?Q?szBwHuouAF8GiJyeCTZWAS04294Z0otp5rTsEL1/Ojgp9+r/uBsoY1VZB1ja?=
 =?us-ascii?Q?9M/Np13vFnWc/M4o5CpoRHtkhc3bHSJjnBsweDQySOGC5oO05dhQ5gVNgAd4?=
 =?us-ascii?Q?CCIkRgXt0Lh3vN8IUNfDNDpI+jSv6Ie3MBgq1RV5fmUwXacJRrJtb6O9rrJ/?=
 =?us-ascii?Q?PR+nCXx8/mS716otWuwOoQDDTkkO3aeAJrXrPuNxBrwpIhqPKIdEaC018Hbx?=
 =?us-ascii?Q?peTLSglOb2hp3bPOOevfJCf9FMY0CW5tYShcVsCHEc0z7e/lvKlEd5uxPR1f?=
 =?us-ascii?Q?1NXfidXjNVJQXuT1Dt8elMq/ZI9zqp/zGLqKQmLtfUccMCu2bqih84WXd6sr?=
 =?us-ascii?Q?9vW6EmjJmrIg8L6+Qv+FT3ssrFeoipvdRpn26jWXxlSCoSxVd6WAEwuYHhsE?=
 =?us-ascii?Q?vJArpKo6l7Wadx8Iz3r1gZsy5sMu2EYTjA+c2HOBXz2/AmzkRdEZ3wE72PHR?=
 =?us-ascii?Q?PWaiZj9/PvPVFvQp0s6N8dO+ZN+TiJWczGFisptPFW85yD9mG9Klz6mcaKec?=
 =?us-ascii?Q?6lr36R5KFJDTMHb9GQoWdEYWcn6/J8erp/A3kocNME9Xgh/7a5Q8pmzP41tc?=
 =?us-ascii?Q?M6VjdZWYf1NuuJKllX9zUIbSg1S0Gtmke93M/PSSjFsl4/vwiK3LkQPws+Je?=
 =?us-ascii?Q?zYGhtVyzLw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fd5ce8-f451-49b8-53af-08de70ee576b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:10.5874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vU2NW+W9mdZg5ShKphkBoVJjvl6bK3sKwU6O97CE+llFbOc8BgV6xwei1hht3ryYvYyNzEi+R80AUOIGty93aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106

Factor out a chunk of complexity into a new subroutine. This is an
incremental step in adding ELF32 support to the existing ELF64 section
support, for handling GPU firmware.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 40 ++++++++++++-------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index a0201ac8ccb4..72cefc3142ea 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -464,6 +464,13 @@ unsafe impl FromBytes for Elf64Hdr {}
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64SHdr {}
 
+    /// Returns a NULL-terminated string from the ELF image at `offset`.
+    fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
+        let idx = usize::try_from(offset).ok()?;
+        let bytes = elf.get(idx..)?;
+        CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
+    }
+
     /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
     pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
         let hdr = &elf
@@ -490,32 +497,15 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a
             .and_then(Elf64SHdr::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
-        shdr.find(|&sh| {
-            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
-                return false;
-            };
-
-            let Some(name_idx) = strhdr
-                .0
-                .sh_offset
-                .checked_add(u64::from(hdr.0.sh_name))
-                .and_then(|idx| usize::try_from(idx).ok())
-            else {
-                return false;
-            };
-
-            // Get the start of the name.
-            elf.get(name_idx..)
-                .and_then(|nstr| CStr::from_bytes_until_nul(nstr).ok())
-                // Convert into str.
-                .and_then(|c_str| c_str.to_str().ok())
-                // Check that the name matches.
-                .map(|str| str == name)
-                .unwrap_or(false)
-        })
-        // Return the slice containing the section.
-        .and_then(|sh| {
+        shdr.find_map(|sh| {
             let hdr = Elf64SHdr::from_bytes(sh)?;
+            let name_offset = strhdr.0.sh_offset.checked_add(u64::from(hdr.0.sh_name))?;
+            let section_name = elf_str(elf, name_offset)?;
+
+            if section_name != name {
+                return None;
+            }
+
             let start = usize::try_from(hdr.0.sh_offset).ok()?;
             let end = usize::try_from(hdr.0.sh_size)
                 .ok()
-- 
2.53.0

