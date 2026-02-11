Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E8E173;
	Wed, 11 Feb 2026 00:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770768300; cv=fail; b=PAj74XC0jfez7B0w61KjaqTF9sSiPuZDsCJHXzFhR8+tWXm04QXs+20QqHFe+nMM1iitWYcGKEFWhbxT7KkwintC6XOlKmz8x0oXubs48euxaHbnvGseQHZmElabQTxaJxDOPWGE77ew6B8FKONj1yacb9eO4NtaYssHYl3Pcv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770768300; c=relaxed/simple;
	bh=06MIw+OqNrNcfJVzOelTkoW0dji57CJ7hTH1VRqt5gM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=O530o757xAlIdO080r1QVI/L0KqMpYJb1lLRGP/QDdoB/u/fdgifLRPl3Wc0KeiMn0ZARWLSy6kWDJ/fJzJTRTBcnFDNwCuh3PfsTsTkPdfiempNPncAOfDf+Yas6lcHrIpV7luyVyFHvv1f+Unb+ZcUQx7srB2WAIHzwknwdag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L6n0Oxn6; arc=fail smtp.client-ip=40.107.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L6n0Oxn6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptsJve+U5vU6j8RTKOr+ZxhVXcpNqEXfqMWmKENW9zEJJ4GUgjhEjn+yKykaA7VmJMaPZGt1raV1mlqCPiaDHWpCfSzhc+IPxWfEbEgMDxkYfwLhCN2avm/ffdCnQZLZayQ4r/tWuycZCG420Aam66SNP9ueI2Eo31e9//0y9rmYD1857YeVga/lNV0cyS79Dgh6gnfziwGR/r/zhF1SFxPbOnYbhU8cqZSXPo4nF02eQHJfFOgfH8SkZBhinSURScHfsll/9ZNciE4CoC1W6hPUdSmeI/pQOD4gE4/lvGgc573nlT/6BKb+ppucqeBnlk45haMyJEIY9CO93PuiYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ys14R/9R1Z3+dwvKdsVyMrfL05tgDvDQn4uuqb21xcc=;
 b=Bqra/PgJwQm1FALNyTApD/2+5uN504eAoQLxMefAaHWNUYApr8ZqA0YP7MWbA5B7tRteCU3EKIErld4kiZYWP2Z40fNL5trTiEf3TEId24a6VQ4g5QoxCjHyhQbV7LFa1/pWXkaHmc/TfBIPRF851+Dwnu4xAh0mz0Yr2i9LYzGH2wr5RoDDCm8oHeuNAF2aco/rTwu7z8T22gj0w8Jt/emjGVtPCs4U6sSN1Z0fot/KXnc6Zhr80ip/Hsm0yBoXLvI/VOaUPaJcS/Hb9AgeJjpiWI5t4WtCBVJrnR0buAWNKFeFPWzJnMArqNsPwuyNGASNb248juRLa/X0L0PJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ys14R/9R1Z3+dwvKdsVyMrfL05tgDvDQn4uuqb21xcc=;
 b=L6n0Oxn6FNm61KAJqSbUjVvoFrkNhz59aG0/he0qdA55Tv1fbEI/l8DSmQV6lKrRPxLg3sB41hfcnMPvpPDN1YcJCqJbbTagsmLHASCu3rNlCOS49z/rMutfmd59kCaR83AG1N7UXydm6PG1huNPR8KNiF39Atcg5ckstObDnbpJpxIr6D3cItHqP3VGYjgLrhlwew9QkL70IsK/mpLr+zZjasni/XIvf+Dj8g7rH+5Q8ykEZqWAeo57/8J/2BZPlRUkLL1SWnQJsuCp71J4GxTbuFKoYv+vrdNacUc8WPQOUn/bGLdSx615gIv2d6GH+zu687dTNMAyiHbPLztKEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB8588.namprd12.prod.outlook.com (2603:10b6:208:44f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 11 Feb
 2026 00:04:55 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9611.006; Wed, 11 Feb 2026
 00:04:53 +0000
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
	John Hubbard <jhubbard@nvidia.com>,
	Maneet Singh <mmaneetsingh@nvidia.com>
Subject: [PATCH 0/2] gpu: nova-core: use GSP RPC sequence numbers properly
Date: Tue, 10 Feb 2026 16:04:49 -0800
Message-ID: <20260211000451.192109-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: d8078762-999c-46cc-435e-08de69012ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FFHGy7mYOLWlrA3QEpvJPmjsYWFAAfGjckolPJxAgm1Ii1w7dVyFGT+ocd94?=
 =?us-ascii?Q?sqS0u8pxuaS4gRsn1hHqs7qtFju6ixrzzqHmH2jcS2vMVAJanlv6yZv08f0B?=
 =?us-ascii?Q?J94oncSHqv2axGaQO915rUK3ZSWKnubjD3Vw+5VKh3E7fqlAYKuLWupa5XJi?=
 =?us-ascii?Q?zAcpnFjvfRUDKDJO7bcPoeUPT/YFWk31uqyzz8iH+EX7IfsUTfmdGd66bQvH?=
 =?us-ascii?Q?8gDbHljDaZvsRgkP88WN+9nsgljheT2A5S3QzhoB3lMqU92XKB1FdSNTngqo?=
 =?us-ascii?Q?11wfJED3MvQD9gq6RgvVzB31E3KMbejRefpz/zzTWwF94bgHHxoQ3Xh23Q/Y?=
 =?us-ascii?Q?qfsLJmiLaxvmU390NUAegZlLtJHTu7M6zlVk/0Ne5K46qkVFHrs0bZVkrUSv?=
 =?us-ascii?Q?ZihnEwVu29uOmrRYV3l6NXQKG69W7C31hBz0EQkUtv6a6qEgRKaRIzsAUyld?=
 =?us-ascii?Q?DzxvlWJXaeZB2N9JI/V+3+tWXe1rhJkRZJQgPdxoOxMl0lvik3FAyK+WdpJ8?=
 =?us-ascii?Q?OHXCDG1kXmsmoh1dNvrtHQ5AAbn4r4J9kSS5p7Ee9ZOYsiBsqwCPAHaJsGYa?=
 =?us-ascii?Q?svRK/DWTlSD/xdsQV+88rrVhd1MGVMAnyQDKIH7TfQl/ge1Z4G7ofg03HbDn?=
 =?us-ascii?Q?LvJU1eYTs1vsleiiIeyxrfbGfNJvLyyUbTWAHeQg/rSxZO/MPDMiNDNKWQhN?=
 =?us-ascii?Q?FoeldiPNBTDedf6Di67gzqEXWu4ecqSLdGLyH8PYYT/1lAdFmUycGT3QtyZx?=
 =?us-ascii?Q?mNbe3ZMYlhNQgFmw0th8rGkcGDPI3y8+IrYPNHaS4RM8HRbSY7JG5pa/KHO2?=
 =?us-ascii?Q?//okRYZvPeefavSRNdPAWZj2vzpmk8EDkPtXgT5y4DdIjZgHxvXY6FZIgZb2?=
 =?us-ascii?Q?V0GcnYBJaEARMxVtALXoIGP6uJJ5v+yjCWkfLD606w4XyAh4mjlSJ+RSpY9s?=
 =?us-ascii?Q?4GSdU3GHsr96S5opLogdTjJOdC7HV5kVf4WHgqIyl98esfwxvVVjVDRPqUfu?=
 =?us-ascii?Q?WA6mBfAMO9PBqd3C/1IEETcuFzv7l6yQ9BukQ4/QKYX1zXV6eIXRhMPG5o4G?=
 =?us-ascii?Q?ECWD+BxSilWtTGcksv/gUd6gytuwhNk9KxtG0U1SCo1lodBgTrGEL7mx2P8w?=
 =?us-ascii?Q?I4Am0wvuCw61Xk5puVRddKj/fsFTwCILkbXlkN8DbkQYJo2ZfKTFVFsNCa8N?=
 =?us-ascii?Q?GMPOAZBavTTfhXjpQOz0hlAQBOqYI4tm8my+wFlXtvZRA5CUrIdb+UY3/NUR?=
 =?us-ascii?Q?dT05EibC2YaRRN7SoQurRrm4cRrEYtITlHdNZLy+cFuU5FDvI6SqZS/XW36I?=
 =?us-ascii?Q?1nWIbH2vydpl+N8kR1eFq174Oq2OhZ2njwVGYEZFj/TwkZnLTN3swF/QOv7e?=
 =?us-ascii?Q?JwcJKW7huDPoeXmvombuInde+Rdv4eGIq38yS8kwifqRDHUshh0ConSUVLcK?=
 =?us-ascii?Q?x5T8ScTDeh13MRmdH05HwT6S9zW5KFYUiWtlvsYGVg8BTvNs/ErYjojgzTru?=
 =?us-ascii?Q?sd9E6n/t3KUGtd7njgDnXSY5Jnq51SsEvuSQ+ed3l/shme7OHgOcg2V+np21?=
 =?us-ascii?Q?2QoppDzRg/Wym9UZV10=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/TTkv/dKJWzYvPcXSlBaGEDqE9oEc0lqku7mp3DNH9S/alEAPRRyziAdi8YU?=
 =?us-ascii?Q?k8bguNs8S2nTCn4m5F5LoJGRXdGoPkSFeqWxxtf1IstEzcd7uGp5bM+pYHCX?=
 =?us-ascii?Q?9w823lrE4rmpMBN8QlRDRto8WLyrK9lYK0r19iwyXGJlwgpaPnIPV9rG4sI/?=
 =?us-ascii?Q?cSjK6ehw0YFl/fbH4Nek7CYK9K8ED6lSTD++cpO5BuT3l+YWM1K24VPE1MTd?=
 =?us-ascii?Q?aqE8ikxzXdaxmJiP/leqoE0D/P+KlLANcCSdG4rlf/YAKGXKlwkym+gExZJz?=
 =?us-ascii?Q?XJvi5MvbxAL9QOj9aN3+5+a7YjmQ6qd1bhVG3GbKVJc+X1dYtCxTxe1L9Pkw?=
 =?us-ascii?Q?xYBTefyFJMmd8FmBfkmPmXSkwbYhjBPSLvFZ/q3ZkoTsGIDVOBj+SPLU2yzn?=
 =?us-ascii?Q?H3m/XnMfUmNux+lDPo2rZBS7Se8JKj5i/YJZMSFFsYArvxb+f41mr/B4+TWK?=
 =?us-ascii?Q?7E0EPOQKJOXlzn3Vdb51awkOP6HZX+5UXmsRPDHJS28xzpNYVxoL5/LwPUkU?=
 =?us-ascii?Q?TCiVefNzrijBuW78RIw5HVe9iREMt6SeN/uGn2GS5v6Y5azs0wNb/0R4oMwr?=
 =?us-ascii?Q?dTz/hSQ2qLPvYKCQ/E5DLSJiMU0u9Jk3ASJsj158qKRMQObbevsKqBF70w17?=
 =?us-ascii?Q?+QJKHNI65MiehgFwV5/ZgDeCbhweeL1tpBdNp9ZoYyMDpXIYj5wdCKgmmpZn?=
 =?us-ascii?Q?V3Yezefhw+fhUwHY+1t5XFygEs6nCzf9UNAZb2PcNUHlOg4g+pXihd3aswhX?=
 =?us-ascii?Q?AUcak2axJeUAAsJVnfiprBs8/9QeB6DO99Cvt9qn2AZfnc4JXnrx/vvJ0uyz?=
 =?us-ascii?Q?gMs3nuKr4vN51FuV9BLhmZH7PsZwMMZUlAZsaLzp8XdnrHKNJLbL1/z8vnRg?=
 =?us-ascii?Q?msR5GvUWbRgO+cGbN9+OEwQ7OFf6dJA4gzT9labdEtOjxGIxmesQj9c0YB3n?=
 =?us-ascii?Q?Nl3s+RI/YlOJaM/+SfTEo9+uQHqX05tKV1NSDxSDhwqHV2XdkGJ11Ixb+Loy?=
 =?us-ascii?Q?/UgBxAJwzyShbRUR+iZ91KJpSWZ0odbYqn97a00zAMzMHHLIV6Mv/7OwCkQz?=
 =?us-ascii?Q?RUcb9ur5cqVh/6GsATimwKjKkXsOTk2L2aUhtJu34WdkYkslFcarq9DuuCsl?=
 =?us-ascii?Q?dyYmppKjfCT4QeFROYfe2WtitN3vY20Myite7TePVVCoSh8KAn4F5OX0q2i/?=
 =?us-ascii?Q?3pJDdQmnao44AiqJy3pTmA77cK0QduzjM7WYhNXDTfqnckM0oEhVhaXhuwKR?=
 =?us-ascii?Q?YUHY13pvaWyOj8JDTeWF+a1rwck6BL0FgD0QXAe4kfOiAJrE0YE9cUXTUy+L?=
 =?us-ascii?Q?cikM4SQYg+okXuYabDovEfDZzgXqSsXK56g/X1rupf9ZP0U/Pm5sDs35CJqy?=
 =?us-ascii?Q?adoWK2Wi4aAEhlrMC5A7luMvB3w3KR58Ia4zG2HKNx1FQMkg+5TRGp9tOm4D?=
 =?us-ascii?Q?YD6u78RPmKuIU44hqARVVEvoytlc+gkL/TXM9ib9qg2XyTiNeOLteVglSx5f?=
 =?us-ascii?Q?1Q8nirthOpqJS3rcMWSA7JJOhAMM4pv3iSCBCM/trRzNscvHQP2Dbhs5/h7g?=
 =?us-ascii?Q?y7tR7gikgdKbaPmC+/w9vpDD9nGU/9wl/t/iSUVUC8CTQ+PnvHqkJV5X7/lM?=
 =?us-ascii?Q?6F3pH9NRvDMWYA/W3Yw/H8Mhlyy2tpcim4DmMOWQ47/onp8EgcugxshUERzv?=
 =?us-ascii?Q?R1EkOadeS0qz9tW0G+4vt6u9m+Br1ZxClOIrHhFl5CCxj9ZSN73BMUQhMFSF?=
 =?us-ascii?Q?v8KYMfNW2Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8078762-999c-46cc-435e-08de69012ec9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 00:04:53.6098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q13YxOwklkfzMymnXVDIbxuKhA841dX7NUGfbGT60obZM+ICRKhlNuoJ5jrPyKfdx2y4yIEchD2yZv0U7UO+0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8588

There are two sequence number fields per GSP RPC message: an outer
transport-level seqNum in the GSP_MSG_QUEUE_ELEMENT header, and an
inner rpc.sequence in the rpc_message_header_v. Nova was leaving the
inner field at zero for all sends and had no way to tell async events
apart from command responses on the receive side.

This led to really confusing log messages and code as well.

Patch 1 fixes the wire-level sequence numbers to match Open RM.
Patch 2 updates the debug logging to show the message classification.

This is "GSP future friendly", in that it is written with GSP seq number
handling plans in mind. I'm including Maneet Singh to help poke holes in
that claim.

Example output:

  GSP RPC: async send: seq# 0, function=GSP_SET_SYSTEM_INFO, length=0x3f0
  GSP RPC: async send: seq# 1, function=SET_REGISTRY, length=0xc5
  GSP RPC: async received: seq# 0, function=LOCKDOWN_NOTICE, length=0x51
  GSP RPC: async received: seq# 17, function=INIT_DONE, length=0x50
  GSP RPC: send: seq# 2, function=GET_GSP_STATIC_INFO, length=0x6c8
  GSP RPC: response received: seq# 2, function=GET_GSP_STATIC_INFO, length=0x6c8

With the inner rpc.sequence now set correctly, GSP echoes back the
CPU's sequence number in command responses, so the response seq#
matches the send seq#.

This is based on the Feb 5, 2026 linux-next: commit 9845cf73f7db ("Add
linux-next specific files for 20260205").

Also, this should be applied on top of Eliot Courtney's command queue
ring buffer fix series [1]. Without it, I was seeing slice bounds panics
in driver_read_area().

And finally, because I expect this to go in likely after Blackwell (or
not?), I've based it on that. So putting all that together, there is
a branch with [1] and Blackwell and this series, here for convenience:

  https://github.com/johnhubbard/linux/tree/nova-core-gsp-rpc-seq-numbers-v0


[1] https://lore.kernel.org/r/20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com

Cc: Maneet Singh <mmaneetsingh@nvidia.com>

John Hubbard (2):
  gpu: nova-core: fix GSP RPC send sequence numbers to match Open RM
  gpu: nova-core: improve GSP RPC debug logging with message
    classification

 drivers/gpu/nova-core/gsp/boot.rs     |  6 +-
 drivers/gpu/nova-core/gsp/cmdq.rs     | 84 +++++++++++++++++++++------
 drivers/gpu/nova-core/gsp/commands.rs |  2 +
 drivers/gpu/nova-core/gsp/fw.rs       | 35 +++++++++--
 4 files changed, 104 insertions(+), 23 deletions(-)


base-commit: 6738f143db92177013a500fbea5edd771c173bf9
-- 
2.53.0

