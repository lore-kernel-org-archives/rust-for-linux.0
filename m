Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011066.outbound.protection.outlook.com [40.107.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2837D2980A8;
	Sat, 11 Apr 2026 02:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775875290; cv=fail; b=s/hzDXx2eoMpu0gOjW7Ya60ZLNSw2jdpo9AsfvBuZN8FNScCTx5OIOHM5D/nG6zTsjckdG4HQHSinoH1guxdJXjax41afFKlW/KL5OQFEJHa6RAZJqd/tqmAtZJGvDRXOkBgO1LkVdP9jDKQr8pfmtajuPx0I8e4JmjQsVD1+oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775875290; c=relaxed/simple;
	bh=p0PS25zabj/bq4C5tIIX2U1aVXEscon7qY9nYct2SrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DNUbC7wAixh+At0Y6n+AW9fCY1Wl4ZbNTQMcUe5Z9C1jSaBetG9G6xfmYTUwuB/MtKvUxJZz1ggmqq1P01JmohUUEcbniAOI+LybJpTSyN6NnFScoiV3as/tJstUnq9RUm6TRIYhkf6fp/G30S7ap4pVNxobZMF5x3ta+oSYF7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rt4+CO4r; arc=fail smtp.client-ip=40.107.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rt4+CO4r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJ42VuuDu65SUKEIxGtfVbZVNG6zBbahhMaIRk5dbg72pljjZYC/5J3FYXpBjbnsAvD5Cu5Z0betOf5l/no7Lw4oAqMwj/3XMX/XTY64NKxy4COBOTygJX9kCYEf1ep0PC76VD+J0j39DVkp3F31qSXoOWbQg56PotyfiZqCacYIFkHXA54ClAzDTEkQP6upS/dRr3oJ8eEQAy7ruUYRnbBI+CUxwCvicyZ518w8qu+U0iJw1dQsr6yQFt1y6gjAD3F6RS4bAOPZY1lnVXncfxUIfj6m8zu/sOawHQAJWy1+L7XE/XZrtVOMSQBmAc3vHKq9qUOJLbPJjO3g+O1nBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6oNjrBL4+Denvc/CvrCeGZS8/cpdlSthnL4I0VkrpE=;
 b=NwpLI2j7hVbI2rZjpcm/TSvM8FojQTegGbsxIqer1v3ndVZFsjxLeZzLLkWa2C4b/2PdIcUI5KspcBZ1wwrdPgLYslt2x8GuQr/uL0AqBcytojiqpe5tfEG1KJH8G48h/ntcr1F21BG5ZI/lfwZNYyqtEL478VTQuz+jDlbsIpd5twJFzvoDW6P9pkg/WQdF+GuLhou3pMl5yqtCbhKZIvpi6x2YMn7GxghwpCHcF1V+HQBN7prHuq8G8ms4KrQJN+i5Csyw+WQYxqJIIWG3AmbRLxyqcjmSrAjGVWW4EJzRpPq3u0/MJ4zaP+PBI2l3RWYPVLEy2XRdYxp2ZtYDzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6oNjrBL4+Denvc/CvrCeGZS8/cpdlSthnL4I0VkrpE=;
 b=rt4+CO4rjmlhr18sWGQ+sZdULyfa/GXGfmJHs6I7mAfbPn4h4kXoMxfZpofUZS45CZ3u0ZDMEa0sf6wngbdAB7yY7FTWLlgrbogNHj+M7EfbG2cj9+wV5BkLG8+FsjB5B2wa/3D6rvrkDUCIzxIZLgI00XzhIX0qirjqRlYJUPLLD2qZQjLrgxNsUFiz5NMHERZb0kafJkHxUb5f+SRD+PEGKYW0TaBP39gNPvTfcdaZyidSIJOzj1rshAiin3/rqhtoKHhaqaAMoF0nsnB7xPwCcv1AgZXD0O8jhWw5E+yzQ/eLUjJA3Rh8z9bUdQ8TretRGmAt3ScjfGmIx6xXMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH0PR12MB8775.namprd12.prod.outlook.com (2603:10b6:510:28e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Sat, 11 Apr
 2026 02:41:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 11 Apr 2026
 02:41:23 +0000
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
Subject: [PATCH v6 2/2] gpu: nova-core: add task for device address type wrappers
Date: Fri, 10 Apr 2026 19:41:18 -0700
Message-ID: <20260411024118.471294-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411024118.471294-1-jhubbard@nvidia.com>
References: <20260411024118.471294-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::35) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH0PR12MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: a07c539d-4587-486f-1e67-08de9773d22b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	d4o+zHh9nTd6k4GQNPtlQPF69Nxkcyfir+Jnrx+o06RYFuhqwyOgcLioadez7knF+slimXd7lsa7vnLBAD4O2xT7lsmpwO5aXY5PbwCwqBbPOpUl1+USBaW8CIdVktr1zZyYURw12xTHv1Hg23qHSbD/uU3yTd9odhiI+pq5p5pjjdS8/UasNpaB5cJ8/4UWvnJ0h26aW/1awmE7gis9kVJoooLChOcsJPKndsxXr1GN1WggxyWIWWvmtZE99TTizami+2etB55iQUpuAwlUCJpv0+VuNiZlLkvaRDoIOsZBXWn50U9+rPzTx0LGNJ5QkWoh/wUZP67EWw5KK8BTSqR0DyqNNHerodFScmHmIldlx8g9io0CGHlfruT0PzvZhVSZxuhg8XZ4f8jhmZvtnIhnChhtrQ+usrvWs7uucpHbLnVnE4mA8vKNtGt6FVnMYXCmgS2KET6yRwqOP1mRREIP8p4t87hYOXz+F0+ZPlPQSFhY2jJHpLXFSdAycH7T7EMhVxVhept4g1jFe2bvJRtVmwVRJK9fvrJeaxSnuTolaydtQCiGIuwBoVhxMbi+Y7q68vJQKobpR203b2+k37WgJRIrGFw+nIBOiNjMuTBHnxWAhv61sBS6Gxx44uULiPUN9nOLF1q3I3alpkzUYIaiO37nGgL/gwCoCTUzp3pMCRYSdViSlWTUTFD1Ll/CBXrq0yJRdIJeSBqkvzWgLKKz/0sqgutJnR8QG5kcYFI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K8r3PNFsgSimpCAxE6buzLpuyIcbMhtwvBstF7Zml21dSuVCbnc3XvqLizjx?=
 =?us-ascii?Q?mL+BvcmIM9CgTST9EcVf+GqZBbpIREmCVDoY0+gHQXGEAUhhui/bf8GUL4sE?=
 =?us-ascii?Q?wGPpcmtMjX3OllSLDPRyedO4I9pqbTfvENtH42oWZ3zoonNTOxudLnYBVBcJ?=
 =?us-ascii?Q?l+WJd2jy9AbKxDbJF89473rMY5CjmUtG6QTyl68MyjK+78opW0aaAySDruHi?=
 =?us-ascii?Q?ajkzOJSrW12uWnALO+2xActXRn5Y7WQjkv6nxdlytMTfKfHFvEY8MvXld4WI?=
 =?us-ascii?Q?J8kQ5vx2VdmjZJqva0XgJpLoLr92ved2rIc2Ym3UHNX55tAm06m4hv31Im1W?=
 =?us-ascii?Q?bRd0Ox4EgapYvZhSffumiujbTjeD+jD9icyuTOv2KCstNtqrisxi32bdBXq9?=
 =?us-ascii?Q?v9y93H677TcTMLhzMJmdLMtytT1M2b8Kx7anFWvlJfyIY51O9C+/HCp8iW4B?=
 =?us-ascii?Q?BuVTldbU/WGoQEhCw9m6WGIMx5QxndPUJ6gC9d0wcnXZhq1csD9xZ32qpjqG?=
 =?us-ascii?Q?ntiQwI4u03WnOqJT/gclb1nlEteHiduD5rSfA3V5PQU5mRlOT95u6OEF21jo?=
 =?us-ascii?Q?35ne5d4EWnAorHXDSLuewnq/G3D7xDI7pyQvc9fc0FcpZjodLnYNqVfSmmsp?=
 =?us-ascii?Q?Kf+lp3upb/ex817/Dc+9GGJNKx/zxsTnDjBFtq+3rIvI61ZxP5Jmc/VGUEsA?=
 =?us-ascii?Q?GBCN/H1fKBBn7B85zg93ys6VzetzKSc4/C1gPvHvmqVw0bpUG+iNVucAPljM?=
 =?us-ascii?Q?G1dWbQS/pwOfyHwKcaqSSO+iotNgIB3L4P0Z8+4HEs35QjkmhW8RqP5qhp78?=
 =?us-ascii?Q?TKp+rAgGJYTyELIodMUbIKeciyArVRFpYDTF+wCDwcSgQFDTPlaw8lr5BC9B?=
 =?us-ascii?Q?/D8pq7CLKMpTnirhZNnMCxoXY0ztmiZRzBUvFJgIDqAxIKRVTXLyv0V0haLZ?=
 =?us-ascii?Q?zhAJkc3XXeQ0ZTVXvqiWF4hRSGSEtlqPi52S0nMzh66pmXKq8+7Loo+wfuTp?=
 =?us-ascii?Q?M2Iv2zHDznKa/WY8U2Nv6tk93TYGxoUBsG45gKYlEl2I/FpB5cYGQXaSKQgf?=
 =?us-ascii?Q?r5IdKedXUfdDV749WuhURwPY9NFNJ4e/hI9oxl8XZE5i5ShvjfL5v6/HN6mp?=
 =?us-ascii?Q?UHLLjfkwlvg+hwpzTaO6BeRCknPcYviCTaHojTO/x+ydl0ui3gi0g3rG5Q2e?=
 =?us-ascii?Q?q3uBmJ8hFfOGxLVI3z/aLIxCBc7RsXqu6bqeIMSAqFFt3bOyquNzC3Ac2asV?=
 =?us-ascii?Q?jg4uynUabWUG5y7YUsp9jsUMPVAXm50fQP1wXFIJxRClHggdS6jGcQrTbxru?=
 =?us-ascii?Q?L/rL6mfsdUkO1YX5DpT3S7qmt/cbjAa9/g2U0uM2xvjdTLG8pUpoLzcmXGoP?=
 =?us-ascii?Q?K+oQSQg46QXLiUSszk8xtYXEw0zOSx22Ymk+ce2lMOEjzBjB5ytVWKTjYPeA?=
 =?us-ascii?Q?42r40HQUTCv7/dQusAWySBojpdihQQRonNvV5RITQsNAR6Zjw6F4gs/AIhot?=
 =?us-ascii?Q?q5px9EmnOUdIeZoe2YXkChiAwVJPh617P+lZ2y0mDRRJGKmqYQrfQ4OcZA3q?=
 =?us-ascii?Q?+wnwHYtUOpsmALhquiPU5SPsKtmXxqZTC4myj258YpVsufBCj4eBiVifiGs4?=
 =?us-ascii?Q?/TQCquH9G4bbbKJA/IMv3qNueepnBnzfk6prSIjCbhwVpi3Qr37w+CXi8PGO?=
 =?us-ascii?Q?K9T8ZiOR6Lath9u1G3XIE9nhQgBNpBpLF8TTolTSOs2tBNs8CDF6yqxQC1ot?=
 =?us-ascii?Q?MIo3pexowQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07c539d-4587-486f-1e67-08de9773d22b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 02:41:23.7775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+WWyYiHEooM/xFA+ieh8wqUL1aYIWOcQZiOM42Nst8TYg7e9PL+QL1I6U6EpMNSYqFAJqx9otCTjjFTHO8OvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8775

Add a todo.rst entry for creating newtype wrappers around integer types
for device addresses and sizes, with a marker trait that generic DRM
APIs can use as a bound.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index d5130b2b08fb..595a94e9ee2e 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -88,6 +88,20 @@ SR-IOV [1] is work in progress.
 | Complexity: Beginner
 | Link: https://lore.kernel.org/all/20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com/ [1]
 
+Device address type wrappers
+----------------------------
+
+The ``SizeConstants`` trait provides ``SZ_*`` constants as associated constants
+on ``u32``, ``u64``, and ``usize``. Device-centric APIs such as GPU VM
+management and buddy allocators could benefit from newtype wrappers around these
+integer types to represent device addresses and sizes. A separate marker trait
+could then serve as a generic bound for those wrappers.
+
+| Complexity: Intermediate
+| Link: https://lore.kernel.org/all/DHJJJNP5T5FZ.2HWBMOEEKH9ZR@kernel.org/
+| Contact: Danilo Krummrich
+
+
 GPU (general)
 =============
 
-- 
2.53.0

