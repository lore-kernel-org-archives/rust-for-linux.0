Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CB033D6CD;
	Sat, 31 Jan 2026 00:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820999; cv=fail; b=kwK2xysatU0Zeg/e5wtwCl0gzh4CocapStcI6jhS9vg8DhEuH6fWidBRz4G6H5oVKN4uk01A6JkAlZY+RAYB2YWXrbKG9wSrmVnF13aOLGV/3T9hqITeTjgn7G75jFF4ILakUhEQ87jSzwAGVyrLmism3RaKG3cjWAlQAIVRIAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820999; c=relaxed/simple;
	bh=KQuslSnWDAYuvMUmofRVb6v7nWmAoHZ+IlbH/nU/jog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=adN4awg3TgcWiofyDd2Xm0oK0b+aeoUs8jJIQoVAc9ZkvGUgybmER7k7GXSJVOmCEFG3aVDAk48MjVwb/14vkMHH2L4F8onTOjOV6yxB8gmll5SZGwcW2h6q/qPHhnWksfxBW2Pb63HC7mDCYiVMaogZBQl6OyW6bo3BcveyeKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YnKeCfPN; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YnKeCfPN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2Z/SJ6340L8cMPMciLPol4y2IdH0iHliEcgFeBII7K65qBjJr/3gSa9fbN1iBLgpK4SSqi8trX8bzyeoMbjHfvkio7pRRwoqBpgkqbiKlGqJNz+Z2NcM/VjXBciGQUO4RhGDQAJT7xOAgo1oeWWVSF/YAt1QXfyX0++EVDSRpJbAsdvr2AbUrvH5LN8Ec0r9k5spNSoiFSNBD+CYRupgclSKrRVbDgqV9KnqTWi+WJQS6ZXkB0GX3a5OY2gkLO2zBHrEi047um6VKj0ShqagTy6pnUaM22PRSQ8ZSF5q0G0Z4s+2S5pQmvX8U/tMyj0vi6yyT528gD4OiSb3vBTFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9PBcVZbEC+w5n1GV6YTO/dp2b6Nylw9OWKDnwjjFFY=;
 b=pqZ4y1BLbKI/fZsSxFArlV+vw+L82WSARG+NIsxz9aVVu9/U9ufRLmP6U9PLNDnqh2nBKYmJkVPVA9xI5Fi5Dnrdi8hEGCtVJCRcG9d4hH9XUPdT6slec/3qSz/f1G1INJ+ON0e85sVajAdqYlsU6FWmBUs06o7wwV5y/XupBJPnfNuT8NecnDLxteufCcniqAtINbJMz5iv4mr7tmUpgjs7RuaGsG85FIurtKCRKToH3l2tZXqAgAfddeTha9hbQNMhjQkwi44iCpfl+K2hZ8IYSVXbEthx6ho307d8WJFuys2K5f2/oD1og5sYNkKD9ANmnBJNRXz7wxA3/fQBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9PBcVZbEC+w5n1GV6YTO/dp2b6Nylw9OWKDnwjjFFY=;
 b=YnKeCfPNAg7pxVCBz4fB8iLdisVsFGXlRq8qZXwxezvFsH3WEikPA2lBpOIaujc61HJJqXlK2sRLsDsA4J1o5k2HKC1k2f1mPtAA3Acvmcnu+16N4WCLGU2+yQsv/1kqrjGyWDsYkhgTAwM9R00Y4LS78uTagYQtwWbpc2BE5nEOoZ/kOqeSeXNoB1tZ1c3EDQxlcUzaHFwZhMWz4h7K+wQF7mAYXoJFEDll0XxUio5Pae2BfFJKe/nQntAedG/3U+gv51/5iOFF0JoRpW9ndiW5iZfcJn8T38eS7cSkzlDkkgDZY0wszil3nCmIWG/uCdoCzJOcut9i2JWpgYyuDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:28 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:28 +0000
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
Subject: [PATCH v2 15/30] gpu: nova-core: Hopper/Blackwell: add FSP falcon engine stub
Date: Fri, 30 Jan 2026 16:55:49 -0800
Message-ID: <20260131005604.454172-16-jhubbard@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 62b46710-bf4e-4bfd-b3bc-08de606390b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0j7QRaNI7lajHhK+uDKfHu5hp5wflvB0AsH/oMKf/bMESTLdK1DwWwyShZ1J?=
 =?us-ascii?Q?YWIx9KuR2hezPkdhG0gz4NgRPGv5lN/MU+rIGprRzg39zhCgJhZO6cSKDAUp?=
 =?us-ascii?Q?11GOv74bF3cPoh99M7V2xmFp7OeymtECauYqeEiE6wGyKQFDgS9X+4wENqAz?=
 =?us-ascii?Q?O9JUI6Cr1cOyiGurGw5eWfavhz/g+xdU/hYJ3JD4OmO2INs8DwN9hjxvaO6o?=
 =?us-ascii?Q?fOALHJ+13cye855Nk9SM8rM25oLXLI4Y88Pfm7NIVfcqeuCwMAV00jZJvZLx?=
 =?us-ascii?Q?h4zKIDDAOMT7R9csEP5ZSUoLnwPSY0baZswIiImIMvP6XzJ9euDaRAgkU4c+?=
 =?us-ascii?Q?iQn2TxrsSIyx+qsO66W7YgqlOpEMYf/FxhtxA9PYf8Rka6rz/Qu21C3+xN/U?=
 =?us-ascii?Q?Obuz6U2SunQYsmHh+4/DeWRS/sW6gLVPJgiqamCxz+N54Fy7r6i7CH58rKdL?=
 =?us-ascii?Q?7/9lmxZHoffxU0puHoZZrw4wLuGnAXXsmvtggilaPnSWs2wnZ4nXgKGcDEP9?=
 =?us-ascii?Q?3b9uaE1wC8mAjZguT2X+Q53OYOh6ZsyK6cjIlWxQhG+oNulLCO2dH2hlmD84?=
 =?us-ascii?Q?wu/t90TEU2NAz9vOFYX2Ec9WDIrcRnJHbBuJKmmJltWQGYv+WzNgWTSwHfZJ?=
 =?us-ascii?Q?T2G8365jUfZ5tlyNbuF47NiMGvLx/fVRSE/Q05cWXKr/VYwMhdnakllzCnri?=
 =?us-ascii?Q?PwReJCRFprjhwNhC2/kyqKmTq7qOUp5D6Qvow8mCH/oGHpIXEOxCo1GJJwJ2?=
 =?us-ascii?Q?ouRE4dgdoTBYRK6AwNYjDZ0jlS589Yek4EnBt8K2457ANDnUW4e6nq5PKsnU?=
 =?us-ascii?Q?A3yoIantqHwmgNflxXvCd+yNwgUPIVDecNq68wAYUsBpEI7zf6srqyf121oI?=
 =?us-ascii?Q?c6DhORmx7GVFf0GKDUz1zG9jb0LIPfX45FK7VHYesOM/7u2kT1VF2Othy2Ed?=
 =?us-ascii?Q?Wz9n4SMKM+nAd03Frq2S1zYNWa8iShtSU4YNaxka8j7IfztXHT15kBJ3p0Xw?=
 =?us-ascii?Q?oXZVN4dDqVdLgrWKMamZau+MmpqGzjoY3QZnrX/CdTq9bSrSmiuxiPh0Alwy?=
 =?us-ascii?Q?S+6Et5Sirf0+U/tHowrhvBtdRn8Iaaq9jTHZVwLZgkc0UNK0ssMRwFSs2uwO?=
 =?us-ascii?Q?GWWgTbS7PL+SzRFT3FNzyg/v23rHIT0rABs05XYde55WpvqI9ZFegUBgPAvo?=
 =?us-ascii?Q?ercj0JvwJ2j4rje2dDgkaRfNEeU08ReWvg+Psg8deLPjz3YBEkb/aFXN1NCR?=
 =?us-ascii?Q?47bt0pQHJK2NewosGadUcb8ACWdeEdnilPvtaG0ozP9OWQXFg8gpFhU+0k3o?=
 =?us-ascii?Q?cf1M3NCvJzNvfQyrzzdVTth9KLoSOrWw73EWSybE7qEHq6nxYoKXLc47k3fy?=
 =?us-ascii?Q?nuzoioA9XjraI+rWvZ4mCJw0EVfuArO8aANN/+09x/zBZLkE2/ne+uAIbism?=
 =?us-ascii?Q?x4DoxE3UJXtLIXnZMybjhH7jGNbN5w8b3hYSYwBYKaAAPIujBp/DG/Xiogq7?=
 =?us-ascii?Q?Rrvr5p2sT3B/vGHpTOZyKUsY7rDjT6dBTNDwfAbYx+NOpQBwUt3tspDqeOz4?=
 =?us-ascii?Q?hvFyrTEP0tkSIJKaLfI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uT2ce33pc/IkVvKtOQU9Do1kDhZgwbnUwVPducnSmEHI4qaQ2mCBDXUOuLL5?=
 =?us-ascii?Q?tNvzyw9wqucHQlImG4Sbvw+oD6l+qCg325/55VKtfazcR7fp+mOL5mxWgVsI?=
 =?us-ascii?Q?VJW2aqFmYKi6hveQqdNMvBy1K/0id/LzNxMJHqbdTZhYQ/4GK6ce/jW32ht8?=
 =?us-ascii?Q?ovRgTLCcOR0BSYVmTdqVP+Q6Z49l/oRN4rkND1GljWy5T+lbV0kEXQKn/CfE?=
 =?us-ascii?Q?eoOy9wtJgcLC4A8rDL9gXnjig0A8VwVsq+x+eCevkUDDwV/ouObmcuYtK1sP?=
 =?us-ascii?Q?sdGbiuurZ9ZtSxLFapshjEj1N2VTXdTyWIQJIvYzF0hltaa1HAjQ1pDbqcdK?=
 =?us-ascii?Q?GXyt6NNG08OuCUJAd+9qZIKuqZlC4sJNG2RmGyUxodDZpR9VeMLa3n6SuY9x?=
 =?us-ascii?Q?BIg+XfF+aSM6xeefJH5MhyQ+8bRF+byYVaTHkMFkGNY7qBIATTdTO9Y0YrE3?=
 =?us-ascii?Q?SbTXOMQmsSZAlEZ9c7ma5h5GF/dutie6vam0btkEVQZsO5uFekjI9vtzyc61?=
 =?us-ascii?Q?s0gbdNIATtp5sBAnO/CuA+tgPOfHqVyRHLdOJW/TAU9ua4/ggo3y4eu4DQQv?=
 =?us-ascii?Q?+WopFegyJcCuegvennXDtyyf/HhFhAlEKglZe+art42WCVFnD31gOk41143K?=
 =?us-ascii?Q?aLtAZiWiC2N6Y+C5XXRQN6bHYMfOGSvUi2xt71cTzFCQuC+woL52RAGw+Bpt?=
 =?us-ascii?Q?cS5W2DT21ah3CA7cvF9JygsrLl7MUXA59LvsXrY4f2Tv1viLpDYI0elYpyox?=
 =?us-ascii?Q?Gdkij3t72Jy1/DDJkFlxZPCMZ4GgtJfxw+EHr9rwMIfCAwRIMB52Pt+gjwB1?=
 =?us-ascii?Q?mUyi2vrLI3l3TY9DNnbM+oH0sn4iVHFAr8m3U/1gLa1PNgdvj2NXNU2jaJSi?=
 =?us-ascii?Q?fKK2K3W97wI3AJTEiArPz+Eg9e9dUi7npLA9QiARj0N+KYOSCFTGlxbr00uF?=
 =?us-ascii?Q?G+LyM3Z33iUsJVZ8cfNoBb/fjBC3kVqrwR+rV7G2WoUqgPUbWU+Yyc7TAWlM?=
 =?us-ascii?Q?HCaTE359S3ozrw4E3d36SD1slQsP/ApZ5oM4sPkLaZtNA+XTwGDwVqpLVKWD?=
 =?us-ascii?Q?6DtZxQFkFlNn4DLsmAVr97P/qCmXpk4Jke0+iIqBngdHnWNSBjxAGH4ZsNM1?=
 =?us-ascii?Q?Cbc3AE68+EaK3sva/HAaKzDkjq1xPnnXgFFb6AJlwob9a8PML6hJaIb20sH0?=
 =?us-ascii?Q?PK1u8uD09qFKq6hcOC43zajJMSvZwZRxF+qkm5thWaqD6XhmmiJ0Lqv0tnLR?=
 =?us-ascii?Q?H1p4KmxGdoEXEYzBPhouYoZkYcpjm2cx5iNhemdFrEsvT3ye9w4PVoKmjDDz?=
 =?us-ascii?Q?06l7gK/lrXVPck6WBe48LOPgELfDpF4Z45QUSGPND2dwJoQ7DrF84BEs3Bqd?=
 =?us-ascii?Q?4F6MULdQdSkDGYiKaH9J3QKRdjOP20V1yDDrB9r/lYTlvLevDb8vK5Tfx/en?=
 =?us-ascii?Q?oyVaN6C8x30cKPuu6jZoteGly/dIvPMT0WjNoPhNw59mhmGlYQR3Tvb3J0Hj?=
 =?us-ascii?Q?PEFQIHaR877bSglwMZHJfrsDe4VhoGJBTBDlxShOyAaqM74HEr3BJOKKsy9k?=
 =?us-ascii?Q?cGkWCrlrimmu5vu5cMznbNxEYo5s45GnqOxmmgGu7TYvCZInn1UoyJGzpceO?=
 =?us-ascii?Q?ZDN+ppTpUczD83xqHfqeMpwRFqfSjW9XQhOVH6mcXg/mzJbLwV4r54L9RYuW?=
 =?us-ascii?Q?pat6kaBB3vpCh+718Ki2aN9M3Y7ZXPdPE4aDSWxV/wA/gBHPStD01IhnJ2V/?=
 =?us-ascii?Q?jRpfTGyPpQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b46710-bf4e-4bfd-b3bc-08de606390b1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:28.0902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zce8D2D8Bg8gzlMSx39O7+nj9wJk4k8T5r6+0damOgddmVA98CMZNqgUpS0YB9alIXAVvWpg15vscyWvfWW5OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Add the FSP (Firmware System Processor) falcon engine type that will
handle secure boot and Chain of Trust operations on Hopper and Blackwell
architectures.

The FSP falcon replaces SEC2's role in the boot sequence for these newer
architectures. This initial stub just defines the falcon type and its
base address.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     |  1 +
 drivers/gpu/nova-core/falcon/fsp.rs | 31 +++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 drivers/gpu/nova-core/falcon/fsp.rs

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37bfee1d0949..a0cfb4442df1 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -33,6 +33,7 @@
     regs::macros::RegisterBase, //
 };
 
+pub(crate) mod fsp;
 pub(crate) mod gsp;
 mod hal;
 pub(crate) mod sec2;
diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
new file mode 100644
index 000000000000..cc3fc3cf2f6a
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FSP (Firmware System Processor) falcon engine for Hopper/Blackwell GPUs.
+//!
+//! The FSP falcon handles secure boot and Chain of Trust operations
+//! on Hopper and Blackwell architectures, replacing SEC2's role.
+
+use crate::{
+    falcon::{
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs::macros::RegisterBase,
+};
+
+/// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
+pub(crate) struct Fsp(());
+
+impl RegisterBase<PFalconBase> for Fsp {
+    // FSP falcon base address for Blackwell
+    const BASE: usize = 0x8f2000;
+}
+
+impl RegisterBase<PFalcon2Base> for Fsp {
+    const BASE: usize = 0x8f3000;
+}
+
+impl FalconEngine for Fsp {
+    const ID: Self = Fsp(());
+}
-- 
2.52.0

