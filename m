Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010035.outbound.protection.outlook.com [52.101.85.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998691E1C11;
	Thu,  8 Jan 2026 00:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767833898; cv=fail; b=j3AVGu51ZWEGvWMZhybHEc/OVwcUNGqEN1VjMFCOIPstiLmmWceJpyy5zRL0ALiP0Zt2bAROllu4lJNW5jZmMHStKqj3PxZsJNjFQ/7USLVD8baGo2/48YhrdXj3rePMFcPZg8VsmqpIP/eZ0B+1eJtcIxVAjbmjiAfekL6WpDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767833898; c=relaxed/simple;
	bh=bsZ/McYjlMFEzSfXdWfssAA92KtUf7zW3ofb1kZjH/s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=t0Aa26izi2P4ywstbbI7xuCsg7pLuWOGmuM0Cz/gQrrP6GlVpRDjks2P9LD3qgFTL3+tn7/2LycYSnkJm6acaC+z89jJpZfzilV6+5Y/SX//UXrV7aW4gxMJZ5T7Tw+RbgRdX8UJYY2cy14ow1R2YvQCc0/W2zc4biwbgEAtILs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r2sS22QV; arc=fail smtp.client-ip=52.101.85.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r2sS22QV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULWrGTsks7DpZl7zxIomxYUDHMAxEPo0HMlUjnQRx6Dt10WnO7v6/dWhu0UaCv3kvrfHHfZ2twqqIAlgGsf5/ACdMVM9vEYahumEUnDmEDy2zEay+Y0r8jMY9EPPtSzQP/4ofArnZdCiLLhyDITmYOWEM8+mpglGWB8K8LidKl+GKhHAraJLixaMRyzNTtgaYvHVEoMxFm4T1V0VikK/ayMv8ZkJ201WlUwvlbvJ3/kciVcx9IY4VWt5K6MAyfHEkHuhUgagqmjBGnG1by6wY40RNXXBgq7CUKXPOWHKEFxtAppQ7abQGgQclpVNyT7Sb8kZKd1bHsMSIQYSsAtJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6QECxnhlqUwBcuHU2RG9gaKFotparoeqvby4deekVY=;
 b=tDeyD7J7+6B248MKEVrslZqjM/DaItYzO+F4VKWhcf/gDn7lkN7Ux6mov0W/SkuQOS9mCgzZb8p/4oqadbWtTAvKgGD6kuPUH8pV+wEZypVha9Q9z/3VWL1DkYD7geYyh4s+95JixUH3sQLzZqB6WKfpxeDxW3ip9EEMy3J0gQRdbK9gnoxWRjODW0S1beQG3F6yq8wLevNXQd/io3Qs5LHrOY0IvyTTKR6bryuzu2e+ij3vtr+v+/iPyUD4W0FOrVE31e4bcA5uuvX/g5S7awdpKshiLxW8vmNk7SeIKCI8lxWBhVPrB+ZgMxluxOWL0g9SiBQ2HVp2WoiTKHYeWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6QECxnhlqUwBcuHU2RG9gaKFotparoeqvby4deekVY=;
 b=r2sS22QVMSwxaNK2TabwgRjKUIUKuXKt0UNZpnQgG/FO+EwwN8nAmLz90feyh458HCZ4e8rwR6uZCglAr6fnOsIgfb2QnlRR58f96y7fjjrO2pRjbJqP+MJNzOPpfM8rTnI1ZoKtNeFYHnPruSQ8tejp2xUn1iAiIqxzxTdnKMC1YdiF8CI28bIx5HNGZv4uCS9NfsFbBQBB5Q0W2R35LgUYGhMsZB7zASUT0Oarqb1TJ5jPPXu6gcotm3mhnISq+gIs1Us1BG2TDZHPCZYMLot3jhL0zwOccT6FjT+aMU7nkNVouhdcdrvMFBs5HtWaZBsEXybKd+YQheoOvQ9PWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Thu, 8 Jan
 2026 00:58:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 00:58:13 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
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
Subject: [PATCH 0/2] gpu: nova-core: gpu_name cleanup, PMU debug output cleanup
Date: Wed,  7 Jan 2026 16:58:09 -0800
Message-ID: <20260108005811.86014-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: 524a47ae-1865-4b78-e31e-08de4e50fff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7+TI1z87WerhvlSy2XMwTULABoqgtJKYsTWE7C79xCTAxh6G3X0Ty0VEnn9u?=
 =?us-ascii?Q?X8mLu3zYeTP4GSEP+nELAabS3VlnrnwpD1h1M7ueem+q2vVa59B9sNERQakO?=
 =?us-ascii?Q?y0/4MZgQfcxT0YTI9Tuip2O5khxR9wgDLHufXOYGq0G5ExuEIRbEVQT6X42k?=
 =?us-ascii?Q?Y+aXaf0Gzu5JipJpajPIwhlQ+pwYzA03AJMbGvWYJG95XoEJXYiQdv+WU1Wc?=
 =?us-ascii?Q?PRogAIdMzjphunYZNB6MV4peGjaLfp6OLJmu7njlUsfCDXBnRfAi5OxeSAE+?=
 =?us-ascii?Q?NGzEo7b95NGv1/lrQ5+2LilKYqPkf8YYeyQAPvFPftafD9sB6j+kyREn+VlE?=
 =?us-ascii?Q?yNNLgcNwh23JBSHYjE0YRA+0YpVhIf8cNNpVXy24WZW8OQJjCKGJUaUL+fyx?=
 =?us-ascii?Q?6z2f6GghMc2iFHk0ALYy4p6t1wKcWC0T6y/MF2A2fpR8CZLL8zkNkwd2bOU+?=
 =?us-ascii?Q?lKrV4dEHUjNBuiQhGbACwjKMdMzsMmJsWiAF1rkOpmR0AxGR0oZNz7GiL9o3?=
 =?us-ascii?Q?wEsTUNeU/t8HtYpODecnO11qG5g8ajwoMHy++XVc8uoVn7a1/vY6ir3q7gZz?=
 =?us-ascii?Q?sfN2R+qOm2IqQRa/7umoA2M99r3tllDr8QLAl2rE9ML26z2mjxrNwIBe1mEO?=
 =?us-ascii?Q?BAMp/kKKfYPo0t57+6czW+9RSO6Ic6P9HqcMBopYVnnbgPQjnWGtMtmqlaGW?=
 =?us-ascii?Q?05C/WYQBxTNjC7L9tS0Ms39LA+RIxo+1q6RNqN1fSY9JurSzqJZJnZtjxb8P?=
 =?us-ascii?Q?N08CUjsWU1z9icsJReLtd4o1JnXRyMIixZ3v37epwg+gxz0fPDOUK+s1cUMF?=
 =?us-ascii?Q?3cQgDOHflR8w2wlbTpkY4EnokiBsDAjCMgn5Lv6edcqS3+yJAXEs2xoll+x9?=
 =?us-ascii?Q?jGjAu4oMxI6nWJNHbHB6O4khO0ud2n1KZqQDi1Z9WLGg2iWvJfKyk858Hm6Z?=
 =?us-ascii?Q?wrd1HgtdWPB3ldKBt6zwiGow8qj0NE69O+n306NGSiuHBKh8YeSfQQIwy4Xt?=
 =?us-ascii?Q?9hZMCq+kzgZuvEdKXY7+uR4mSf54wxYsaKuxmFmUzz+fKtJieF0g7b0E+D5R?=
 =?us-ascii?Q?DVW5or1Dl+NPTgDZJM7LUkIi2rLKzRQRfwAmB4CYgyW2YFy5z5fFoZZMjoTy?=
 =?us-ascii?Q?2HtdDFfpjtaVD5YnqZdzd2ZQXijATfSfb8ELiBlmwwyg6vgFQpQfWZBM0gGj?=
 =?us-ascii?Q?dM2ygxE1efQy3BkMIMaNzbxBdaF0VH/XiI1nhxgtEKNT0T1Eky9ulmykJLuY?=
 =?us-ascii?Q?gAmPnXLtiVYo1o/mcngP2adi0MA0SDEQ2EQHA6kYcj7QJuX5u0rypQwMcW6I?=
 =?us-ascii?Q?5x/5CN8y/2NJV/TGp+4ezdFkJvp5PszRhGm0HYLB/iNv3nW9kgMtFhCgdkoL?=
 =?us-ascii?Q?KiIzsLpQBWDVfd8UcTCk09LkCh1scYey4paPAhljgFuciHY+uyPszl07Bt3b?=
 =?us-ascii?Q?XZY/uj6pg7NksiXn8ZtDCn6iIZlL6BXk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?76s6Uze2+/WNIA/FSXxC7R7McJGDShMsfPEW6JYA1lUXv4sAJPMIa4XNCTYA?=
 =?us-ascii?Q?SdogwjqZHG7vpoqvJolPz3VGvaq1DNHBUDtJSVX6a/9xWrTlEKok0usrZHdH?=
 =?us-ascii?Q?aRDxPZr81WYGzCFHc6M22RwlJjVl984HPmSoYg7wEWIZQ+KAcrf3s5rhCNBO?=
 =?us-ascii?Q?FsuHzKiOL7M2piByO/Nz48LXv4TXw9JeLVG8uIqwBh5riLdghTQgBPQ4pIkz?=
 =?us-ascii?Q?WO14apkIxI+h4j0ngCJtmIUJTyCzAahGxT8yVJmTNIhtiwyuVYPs1Nz6OiIV?=
 =?us-ascii?Q?w7ZgwrxaCGTWB/8Sx+xVBawAQ/eckLxj5uET8KuaPB24xisc9K63RzCW7XmV?=
 =?us-ascii?Q?Cth6cQexKGFfOSY9qy5TSYXOnQtvsAhnUMmouKHkYkKw69bMdIV10nf5YU97?=
 =?us-ascii?Q?BZu32ma0VnNIq74UaWZhYZZC5qXnHtE7BgyslzAuhn5RhUDBdwiMFXaaLh/Q?=
 =?us-ascii?Q?yQeio34NEX1AYwznTlzdggl6hDTpAEXVVPnvi22s121ZzaL6FrzF2i7fyI/X?=
 =?us-ascii?Q?1Z86WnAMUsOxJm0/F8Trif8ZBYV8CoABv9MIp2z8QA4KXVa2fu310IU6bh95?=
 =?us-ascii?Q?dKnW8tleifvS3NYZRI0aqnB6g1EwaUYwebTlXUuaUFHt2YISuN5AEc94n/mS?=
 =?us-ascii?Q?81m3wURtaSQ/rhV9GeihiG+cOX60YztKDSuVfGep5QUaJC+H6bQHckMTqH6Z?=
 =?us-ascii?Q?1kP8VyUvvHkc6PHg+hHIMJzWLo3pP12Z1teoOZ/tEAq4P43g63J0xYadj1Ef?=
 =?us-ascii?Q?VxGu0PZ8zIp4bMIrHVCohYhk0HoZr/bbHtUr8QrMoUjJckskmOhXDIdwaoQC?=
 =?us-ascii?Q?ikNQDtj3MdDDrTme0v6DKK7H9YWDcgq0n9QXh+nRQdyX5nkBw9wnf26lo6rw?=
 =?us-ascii?Q?QjKNaG8UUtD0xIWNjDFnQ5zjRRGd8JxL5Bi0/IxuKdAquj02H5wSN+AMbK9K?=
 =?us-ascii?Q?SJkjSco0KPWVy6R3gcGsRd50zhlKDyaMIN6ihzurW6UnRl8YPeo8KusRK4nj?=
 =?us-ascii?Q?m24sixJLbSlinIgDWFL4MfGwCGKkfOyhjRdSfPRaM1VDUPpOvluEGdH+4ZT8?=
 =?us-ascii?Q?airYjduyxnBaYxVvEJUPi7CzrScgJPNm0Ux3eSI6Dw4d9PxId55XHeZnhQ0u?=
 =?us-ascii?Q?pZPC2AhE45eGtL4zCWn9AwjJPqgBf6Hn3VLMY9QtBpTKSn1OabPeatnLPeoF?=
 =?us-ascii?Q?nMSaw5HU0BgWhzXGvfIGgDg0ywOhxFEIdMj3QbiwiFZAkVursY+KjRuQS30k?=
 =?us-ascii?Q?0vzPrsqmEI97+mXW9IsGvQrUDqcGJXuMiYhywuuw5WvpegD+X3QQWRzm5BM1?=
 =?us-ascii?Q?dGV2bC4JF7CPH0v3i8IQMUr98oxfAaOEnjvQJEzFVfFTvzANfGmOSCnTEw/P?=
 =?us-ascii?Q?k6QIRrbpXiwcajNwNbYNg3UOgZEfuSC7JdFog+KqtYo/49DZNJ0WRLZxNzgF?=
 =?us-ascii?Q?E6gxwWZqS3IXfOEp/LibM6G9LFFAhVuy852odC15yTGF2ymYg0PVGrWw4RTX?=
 =?us-ascii?Q?DhlAaJhLe7JbJ+rReBxJQDs97yTJKT5/HCXLGW1SlTHMxV+t7NRpy5JEiGfz?=
 =?us-ascii?Q?hyYRnVWe83YONlIuiaxwGlIcUeKCFwLjGkm/CSC+oLLM3NmLv7kt2DsAr8aa?=
 =?us-ascii?Q?dAvMvp6ee1cK1ewJwcEA2gXjuCj2voVuGGZWRwzMHdXYEPiCuN/IFZWZUO3B?=
 =?us-ascii?Q?eyEoTsYXF4fIrw0VUm0D598xddy7LBMUA110W1rHdP/w9eGdIHkLEbRtKhsG?=
 =?us-ascii?Q?U5Ts6PNlfg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524a47ae-1865-4b78-e31e-08de4e50fff2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 00:58:13.3550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd97Jr9MPP00mKEur6gTgeshIX62wPM12Xed4GJd/UPNWdJVxfGsITnfW5HrLrks3QoDGjWd1cs2Aw82D7uwGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7285

The first patch, for gpu_name, was suggested by Danilo Krummrich.

The second is from repeating looking at the dmesg output of nova-core
lately. This one PMU print item stands out as having a particular poor
signal to noise ratio, so deleting it.

John Hubbard (2):
  gpu: nova-core: preserve error information in gpu_name()
  gpu: nova-core: don't print raw PMU table entries

 drivers/gpu/nova-core/gsp/boot.rs     |  9 ++++-----
 drivers/gpu/nova-core/gsp/commands.rs | 28 +++++++++++++++++++++------
 drivers/gpu/nova-core/vbios.rs        |  5 -----
 3 files changed, 26 insertions(+), 16 deletions(-)


base-commit: 2d7b4a44fb768e1887e7e4cdd8b86817ccd9c3bf
--
2.52.0

