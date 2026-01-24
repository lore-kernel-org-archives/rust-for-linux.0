Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9D826ED56;
	Sat, 24 Jan 2026 23:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769296729; cv=fail; b=POUhDZ1MJdyKLr+nJ90ZNcfg/bHDEj0tyY28X3PB8RJVBrhPpF9atoUMWdPG2VTJTem3d1Rfs7t/XlNeUR8PhwA+r9z1nNwhJHXIHRsDbAecdUbwqlG1FU1uVQx/kbQj9t/Djuj5iSR6XyGLpKQ21FyD3p/mHhCvKRA78dQhS1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769296729; c=relaxed/simple;
	bh=bxVIjqQq2a/yyTQ40CBy/xSUhxThKdXU6aKykhM/cgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uf2jEk93Qplc+vGoywT0JRBnJN+g15JM4fbFHTJBpkX2MTH2YtnLUgYBpjMVWjtJ6U0fva9/EolEeBUTb77WUT31TG+3PzNlp2sfwtXeuZALSunVw/Lgdjxmo+YtiOq1hRlT+m1jrXCcw5t2pEqC2soAHmEgXIy6hdlpw7hOiNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hItbk7ym; arc=fail smtp.client-ip=52.101.43.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hItbk7ym"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTmDZP1yYKcjccJsHiizP14atj7wvxBN/NMUVrFH1svOXDsaUUdMgjVzKJ32Z63GDfRcy/TT5oTGHZyg/U16IY61ousZ9WEzZp0+Xkp06FEtf6EnWE6gI9y9IeHkc+2dqCZ+XnUxMvwokEjTW8shp2xPB+Z9Cjq7/AJy4ykOYZPpIIhaM9U5+MiDa+wbeHZ9jspiS/yKK7UDLUDf7XfnP1+q+MkZcy/kdmBf9R+7WhQTT23vGtivDBqgdTNEEXx55OA8CuK5/NsVka2e3PKU1EYbH1f6UlP+FT9t5lMyfmDhN3Hg42lLcj8qc3hhG6P8gwPtOR+AGfXs7tV849C2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XwDFuw43jEVEUDVl2NZ4heYkvbXkc38y2yaJ5bk3eo=;
 b=xK7n6oeszOvUdoXSs1exspSvEuZYrIcHKgpR9EXixjhNYeGYUPSkDdkiZvJwz/MKNiFxe0No4c9xwQ1ZH/DarC6IG8WG4cXbH+HRJBN1m2XzKArWvG0OxRj8bEoOnw875ul2oV/y7Unk0PpeYXyRMcHJcqXZQ7BMlUW+pTQoi8m+HYTtNEFRM52zzO6cZSJQGl/rVdXB1pZYpdm8QxUdOveFuZvC1sjwQzMVgOT+iI+D1TxsywtckqqHyVESu2NyKKYcBMlESgrXRxUf846jcaxBUdizsLURvmadK6iu/xlIMjHp6DCJJAE5XtgiZOPwqTQ5Skdlv0vxS6fQePSWBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XwDFuw43jEVEUDVl2NZ4heYkvbXkc38y2yaJ5bk3eo=;
 b=hItbk7ymbG3/I4aB1iT6rXknsiiCvYRcjlfHda8NLsQJOsDqqzIgdVokCOuPNRKlmdzmR/jObkQQj76gRRZ93/0adqnvfng9Ox8mK2fvm8Z4zPjPeJIS91niDDDvYyETW62VRp5bjrVfmKPOCs8pGAMN8HiP+/p6hoxWsC2kdcbFvWaqd8xs4cDinzAwdqiYenqSfxGsg9dGh6LonL9/TqApArMUN+Gi6JM4tU9MmvMgufM/HBz/zZwWC5L6LmgywPc5aYw4MjxC2pMyLhnbZmRUEmbU+VA5tln17DUr0Glrj+f5qoMWTcPK6rt8CpJME+4E4/GnVvdUY4NWWso+Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB5734.namprd12.prod.outlook.com (2603:10b6:510:1e1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.14; Sat, 24 Jan 2026 23:18:39 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 23:18:39 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v1 3/5] gpu: nova-core: use checked arithmetic in frombytes_at helper
Date: Sat, 24 Jan 2026 18:18:28 -0500
Message-Id: <20260124231830.3088323-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260124231830.3088323-1-joelagnelf@nvidia.com>
References: <20260124231830.3088323-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::40) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: d2beeb5f-baec-4eb2-cc0a-08de5b9ee82b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HmM19nHZ2eTE1OoEAYXWoE9ouCs/wT4+cUZBEqA7fq2jrCpUNRGb6IDp6/Zd?=
 =?us-ascii?Q?wGcK0yPALMmDckch/WqZq7X/B1EfhlveGB/CJladertbCEOAVdq1iTDE3fkG?=
 =?us-ascii?Q?0dLiYTt+kE5YDDMrHbl/VVyFxCr+2urqRhLeJ67IphyeBY+SaFXC0adps/+Q?=
 =?us-ascii?Q?0Obe5i7OqnedR5AjWwELlbbHcdkuUSh3TasUAH8BYwctIMoMropc2SbCTPme?=
 =?us-ascii?Q?sUmRBwWCQV1jkeRik/50ZNSban3jkRlVNsFWJTkPU4NXiYag9GHbnNbeo9sB?=
 =?us-ascii?Q?W9IGFjyDApzIBEEK1W1hqBWe/6g55wCnC7ttovZh23fA3tK6nXVloWfVqf1t?=
 =?us-ascii?Q?+JoKJ+Wau1LkVsu5UiA66bf3Um22ethRjPnAxYND/4A3rYuulZ7cZwFIF0RD?=
 =?us-ascii?Q?mGBxTxlJko+BiQVHqm1IhBc4j7T5LMqzPuoobCVwbp2OMzTNG502WeU4f6EC?=
 =?us-ascii?Q?DWsIdjEfGFU/rPtu6QWdLY/nAR9qn414WpHS6EViFmG4dOyTIuo53pp6EcOR?=
 =?us-ascii?Q?EjzURhtD2hkviXfmrzh9yJXfdz/CBHeroC5K4Ctkny6N1otLWEqlhVgBos0O?=
 =?us-ascii?Q?5EzO/lRZZyb327qYvjH7inuPTp8SAjdDaNBdPersySzwABTASXm765beDRGQ?=
 =?us-ascii?Q?uJ7UGPX6VHylpIbQG09jk05SsewaF4fYCcAurHXIXMxPeoAbCpET87jvcyvo?=
 =?us-ascii?Q?n/XPG1pdFxp0Vt452m4mcJWlHbKOneEqIVCdCVyzIcWvayHH6qYgCDgIO58Z?=
 =?us-ascii?Q?gG89+YrQIu+QxoCpLwIffdcH+DduvGguEKZ+9L2SO/rJVDy/+S+kynVFuofW?=
 =?us-ascii?Q?+eAGq79n21aHbqYtnHnWHcm0ZO270tweCO4FtU/qFHnRI17ZVfZ5jA6nIkIP?=
 =?us-ascii?Q?YLsQgV5ZoRRumWWjYQMUONuV9CVNRjmrd/+PiyeljWhYFyYxpwgNBcaJ/oQ2?=
 =?us-ascii?Q?VlKNFku4i/R8CBLdNPTzGnjiwHUSOqOFy7/tInW5jQ2zd16ps4PtS48SHV7U?=
 =?us-ascii?Q?/RvCTpYNp22tCb4jBqHWXDW74jjLUJtTGSCJRDTzpK8cqU4aJUyabWWH21At?=
 =?us-ascii?Q?1lX56v8muGAEVY3F2t5hZc7N+z034DpqoYuBJ2JrLR/Zzp/tnD0LVgTmCo7s?=
 =?us-ascii?Q?V0XwD3eKRNLBGyYrwsFyZNZo3F/xSYnEO2QTKTWTOuc5wvtqPovO99RUYh5A?=
 =?us-ascii?Q?gY1viDPSk1n0oZljY3dvI+HvUzrXpSNDFXC0I+fnY6IjEAbb3UEZrwME670K?=
 =?us-ascii?Q?el31TM6Q7It7usV2H00JYjafUMQkvWz/Usf9Kdo98dnlmvz8JihXHxtpvdda?=
 =?us-ascii?Q?+uCinNZ6OkVcqLe0bC+1ww5PzLPHKq1cT333LyJyfFzjLAIJYbkH2H95J9XM?=
 =?us-ascii?Q?0NgORRLrXbu27ftMsWUIHWk/n1D+IgealvZqCTnCwILbw2A9jYKjdr8DrybT?=
 =?us-ascii?Q?j7WE1dgSnjBmEjpfxDYK2C3NbRdCAtP88Xe6oYwdaVz7RSqeUeQWN9hwocP7?=
 =?us-ascii?Q?tG6WmkogV+Z3TlHDpkyj/6WKA3OpnlH762bVbvPIG5NT7zljzFeNxB5t26Eq?=
 =?us-ascii?Q?O7OqsLl7ZJ+FLTY1ENA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FTWvug7YrtKQg1liXwmIYU6NNd9loB/cpW1K5xSssrpRIgZ6ORj670lichLV?=
 =?us-ascii?Q?LGItX1qFta6j1kz0SobgL1AF/vWTi9b12brP+mEVS3aPjE7Wq1OIM3LOBEAX?=
 =?us-ascii?Q?E+DrmbliambRLF2oagkv8IniswrlThKTvgBHjQt4PIVi5byDWrV2lsACGiX6?=
 =?us-ascii?Q?yWQGP6zmjyIBplC9sl67YnnLLQdaCty2yHda1ORWM3CGG5flxSSQJznZuLnS?=
 =?us-ascii?Q?eirW6J8Al+BcyCq814spL2r+Y6YckbM+1HKCtQLSIu63+sxkqIlEFNgLNtGi?=
 =?us-ascii?Q?ItPQOJlswxGvQ4fO0mwmBFOD8J/jyiGyr+lMzYxd0B5/Pyxl/hzegXqqIp+S?=
 =?us-ascii?Q?Xpoaw7JMApE7j6w4QhliBEseWPh3jwgJB9TgT5jACuW9kw8HKWK+v1QQIc9X?=
 =?us-ascii?Q?jtlgQJLKjc0t2SG/qzDyM6yF3g+29m5WKwVaCvoE0dUIeGF0kfxhDkHo2ks7?=
 =?us-ascii?Q?K5nzfSbSSsjDOo/btCXi1+ter1UOxWqyvJMO8dwvNsYnE/qZs6K6Z4lFC7XB?=
 =?us-ascii?Q?Da2XJxFPcCySg9KaR2ZbIUOLrwGYvsbAJZ1BNN9a1q+XjbcY2T9iG6ohfxbg?=
 =?us-ascii?Q?touqUvgi7ED3eC0PdG0UJeSx1+VTNz1WVSDyWPW5fMG/ZmNHHOkji7HhhqYH?=
 =?us-ascii?Q?L3mCU8zUWaT+fdUDt/EzDC/I0vtCw1zpbG7MH5I6GLl7g+T2fUYh/tyWiRJC?=
 =?us-ascii?Q?dnL3e/ZIAmo99FtPbJ1r4srRAnNyd1td1dnghY+usmj8I0qgHrHEY4zU8kx5?=
 =?us-ascii?Q?pKLRDYFrM6xgEjYlNykBnR6ZO9/oci56XuJlsg9FD9BczsJN0yMX8n9LlKks?=
 =?us-ascii?Q?4ZNvKSk5NdM8EESk3AAhJoGHrQCVqp0GqNRWweioWYREVQx0IQQGc/PRtJAF?=
 =?us-ascii?Q?ZqSwslR3y1rdDfHwLCw7+dU/6Q/c+cHeVmIY8G35uze91rmgu21tuB3W161+?=
 =?us-ascii?Q?XeZPHqQH9gU+1ZY8vALoDOKwjmoWkx5ew/p183Ogh3/ln5S8aulQWAkT7k3E?=
 =?us-ascii?Q?BkyvBtGsKSyom2Po1SAG7OP31CWt+NXuguBNQCOB0e4QHiNXlxnAFAKYzwbz?=
 =?us-ascii?Q?lk0hh1w67rlJD3eFtczF/LstdEShq+a5aOoqnomtFrD9FF267J7RkDjzEmC1?=
 =?us-ascii?Q?gTSQJVXARmK+Fby75KtwbPrHTrvhftw9RkvIDkwa+NPV9wiECOVM9FEJ41M4?=
 =?us-ascii?Q?KVb5hXcXdbfEDSfh0eXlxC53H5D/o218xNk4saXi/7alKBvPrthlPZ0xKncj?=
 =?us-ascii?Q?0Jdfzqucx/raQ98c8noahx0EcgntAWvhEFWEW5q5sUzacZwxkfSkMTySyol4?=
 =?us-ascii?Q?mW8cfsh4+hGMfUtD1U/VT4vDmsHcHb4K3XgckkJhb8xD81BCNexAJSmbvhvW?=
 =?us-ascii?Q?2UiLqKBeMxMMeZ/j3MEtaWYIDWVj7XdzbhRdwYwZi4htRLECModoxu8AYNvI?=
 =?us-ascii?Q?mgjwLD6BUoGmfROpGmDLYOuxh7uX1Ot4DHAuc5dUWbX8lkqoKYFhH2PMwigN?=
 =?us-ascii?Q?ubjmt7UarSjX5TX9DCpOVMAJeh/pH5DHc9RGUnoLAy6CF8/Vobngu/I7qvwR?=
 =?us-ascii?Q?DA88dD7ifqX4dDHS3BXjCPBUVdofYA80awVD9LaTEwiPKujoU/AD/U+jxtf5?=
 =?us-ascii?Q?IeYugpWxs5b0UwVXBluxosweqP2lbwBvC92AoLfY+J+eAKxCByaUuvZ9hr5D?=
 =?us-ascii?Q?4x2aZG89SJU9hohldtZrm23WKeafsJ8DSK2vSciIGNsPpTaSFamahu0p92ef?=
 =?us-ascii?Q?bU/RVD9J3g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2beeb5f-baec-4eb2-cc0a-08de5b9ee82b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 23:18:39.2266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkZGMUEkofocIYkouJ5JDkiBMCE1tSTcbP42FhyV8GBuPP2EWSiliYStGqA4qEhS/dLuEG52hdrXQ16jJaTIrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5734

Use checked_add() when computing the end offset in the frombytes_at()
helper function. This function is called with firmware-provided offsets.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index f5ad619dc055..1e2b2efe838f 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -43,8 +43,9 @@
 /// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
 /// `offset` in `slice`.
 fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S> {
+    let end = offset.checked_add(size_of::<S>()).ok_or(EINVAL)?;
     slice
-        .get(offset..offset + size_of::<S>())
+        .get(offset..end)
         .and_then(S::from_bytes_copy)
         .ok_or(EINVAL)
 }
-- 
2.34.1

