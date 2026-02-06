Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD66340280;
	Fri,  6 Feb 2026 04:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770351717; cv=fail; b=PrfHI6EJ7cVyA03lnWKabW+ENZLMvwaVuQSwCaGfv/eEE1m1w56yUxZg0BzP+u/yPbJMfsG/jrIvDAfu4jNA5QIadStwBrPLmnQQNQsyro7kgrBqPA7eOWhdpQOR9X4d3TztDnoDfxR9PT64ZOecKhexmVWQbsRniRzAublZWno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770351717; c=relaxed/simple;
	bh=PQyI8PmAjz+Wqo9IYyfk/TbvrwK1JIUmlmu4ypDCV8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GjfcL7zjy/8u5mBiq2pEoXdSnI6rc38Tn6rUqZqlDCACEVZtc+fgbH7sv06fQimPLazG4TcZ2v7pXoNK3Ojlg4dBt+Lv7TDj4Z8k/lkwHu6nro8tJneg//nKhyhO6PBMuAA/OhOFQNZ+U0p3luulHVvZVZbvaSmpW9+GHmVJHEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WTeKetqW; arc=fail smtp.client-ip=40.107.200.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WTeKetqW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dD/6oEYCxwIQRMQ6J7f9nnQkW7LMyaqF1FxwyJed8sbcwviTjQgFZNfhxkVzo4c1EnLnuytZkWb6UckSBF3Q7wsdfbgeQzjgGwi1ORTeFRaEAf3sSks1J1WegWFcSLg2/6SxyfR61GMt1EP7tWAhv/vi4SpZC5gjfB2ksoGAwlxOMSKUHjBNilWcydoXuGq1Qr68+FohxP71UyJenjem49tyvba9ShkDaKgyDKRN/aKpPlpS+HY5MKN3wjHPDIFobG5eljqrLWekzHzcu/vCP628A1V/QR4SOZDbSIm9xeHDDP0nqbz9qH0A15pNCuFmWJaWnVJXZf7HCBGQP5A1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nm/ZZD1a6bMQWOfTXIvbd+o/PvMk3IZGsIWFzXRQr9k=;
 b=IRL33DRdtxUzH/AFiJ8CXpU0ZLsATEGwsi5tgE9eIRqeT4V9tqceiKyvLQQ8IAvNGiIpFzIVRr5FQnJ1WMO/S7SXKhU4qfBErPzZSG+QikY5RCpEGYKLaRXJSNs5eeS6jLo8pThrCHW2+tLLY5p/tCQ8s7+Foo0QXT7Er1FoesTCqYwWeNZNY3N/RNKDL/TqyPUohWzlbkP6rAkH54cI8lvt72hQ0iIvouzZIYqtNrNOYWj3hIca5rEDkGmKnDUtdhwJJJMSA/CcCvQJe+cSHZCAyq/7zmz44+4jO9T1gNv/t40ffuILFqC+8zLpKkNn14cdAy+pnrT0BCTyR2q0+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nm/ZZD1a6bMQWOfTXIvbd+o/PvMk3IZGsIWFzXRQr9k=;
 b=WTeKetqW0TWd7WrZ8OFpyIPpCMexzO4n+PfUx2UZHiDZwXRBxQpSOEvQvQ/uD1KiDV1zpowpNUf1LchWJBNNPDeTI3UN49J0T7k4cPUEtKPMuN+E0Blo4A4Hzww8umaLxwbMBWT+t0wiM5Q2/UYRvzTqaXH6XuJPYLq/dLnjxz2BHnSGus78flBlxxHU0+6H2u9V3kdC1G0x6Q3DMsH1xZGS60IKNAtgLk4i8R21nDmWeL6Jgs7Q0NNWPpVA1k3eiYojm4YSYEYkfvwF+MJnedq2YN1Wt2yOnDJaWDzgMnsvvvxovAOUY1tPihUjA33MN+L+4qJHDjJNFd5uYJYDtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 04:21:54 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:21:54 +0000
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
Subject: [PATCH v3 21/30] gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
Date: Thu,  5 Feb 2026 20:21:14 -0800
Message-ID: <20260206042123.303281-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206042123.303281-1-jhubbard@nvidia.com>
References: <20260206042123.303281-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: c9bf287b-2354-46f3-8aa5-08de653741f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aqPCXnqvTinjP5GI4z+9UErXh2oci7oG9/kWLsUasVTLiNzLcEhSvL/NNxk/?=
 =?us-ascii?Q?uQ8sGoJgxDD4j1Pcg9CDUR+oMBxgjR7KI4frtH2m2vUePSGeDDTPIvoMC1PJ?=
 =?us-ascii?Q?+zO8u+O1W2Nr0vPErNu2ayHBMOiA+NSdIPDCmpZfpIXJtGwHxshnfMRiDYK5?=
 =?us-ascii?Q?odTYqZKiMLRo3xOP7bXxtODTEJDaj09nzUAh1G9W/6NZfuBopxLvLkH0hm9r?=
 =?us-ascii?Q?oYbSQmOCB/kyPOpfdUAgh+2AlSHPgIQ0KJHAzhRV6my+fZb5IXz5t1GfGoxH?=
 =?us-ascii?Q?/t5hChqi3yvXjeoOej7BazjMVYahETrsORvij1xckg+vjBtWwJr9t/jKfJay?=
 =?us-ascii?Q?X/dhAuvWkNockc5SxvU1wTUIQEVrTLwPNAWywJcbb5yAXOBHpe2vys/OEZIv?=
 =?us-ascii?Q?naQ8YVy7cM5HFEnMVFq8me5Sy1crdsYy5bRJ4aIhrkS56fEIC5WxZDIqZtq6?=
 =?us-ascii?Q?w3SRdYLGmjIknmY1eif1610E+54FNekmUkHeAk/BNlnLOHIGR3ccEQf8aW0N?=
 =?us-ascii?Q?UHMFufta2xJrGg9HQISqv//DdPLXZQKt+34r7rhvjWlHj67szItXoPu6XdO1?=
 =?us-ascii?Q?bRyt14AlGXUwxby8562qJFhVZN+FY+mE80tW3xb88nsSZbRG4OuYBiOBvj1f?=
 =?us-ascii?Q?vfgIo74vxo0C8hQLJTkYPRjQCrA/NI/WY83fDSiabHbXq588EYW+KtWh+u2h?=
 =?us-ascii?Q?LWrgj4BYmzh+V7sD82oahfMkYYSonDPf0G1IvmdPR8F4XJNlWHYPfmNYJE39?=
 =?us-ascii?Q?9A7joSMUO1B6JjmkFFCirt3u99QsJ5bkDXff7aREis0dLO52r6XClW6vpyhT?=
 =?us-ascii?Q?pIF0aqgpGIZTBn5uq3ga4mJHzzb3UM+Sip9qjE/LRX5awtVA2mtXRKPU5r/R?=
 =?us-ascii?Q?rOjdvP1bYAZjvRt4zkR81k0Zw7xoDA8vFrYn2iYN0epmummq5tx97rbdQlhx?=
 =?us-ascii?Q?79eCyZFO4qDPupwdbE5AKbc0QlAG/JKt15Os85i2u/CWH5BDjMg6bU3i7fFm?=
 =?us-ascii?Q?qq/lcwBIRGl2eEj3MwuM0d9Ay3Pr3YAZHNsdSkTccicsI2kdvqZUGHEudwLI?=
 =?us-ascii?Q?qKsr9mtfKtKwZHowqRBOXlzp/1k7GL9o2n8rMVoawiFhpF3BRiSeMOLUr10i?=
 =?us-ascii?Q?DRbqmPL6oNoP6khOW7/aPaqFWm+SsUKH1Lh7d2aubBflpT5vPYidfz6WtMbC?=
 =?us-ascii?Q?N2//MlrvVxmLW68wyu4wGaBwmlktGH3+ex2GxdjdcMZA2uM16EihEdDBSMdD?=
 =?us-ascii?Q?KQNH5CJFwDP/I5SLvWL8oTrXo8vqEbRweQsScQO1BeQdG2OZuwmb36sjgy6W?=
 =?us-ascii?Q?TGQL5toVFuKVSv7/4Ao6aoFk9bVCLbf3Swo5YwdLFgAa4xujzVHt83D1VVV/?=
 =?us-ascii?Q?+tRm9xkKAj8+wsJVxXPKJ3DsdvARrVRBgqcwf/8dwWdPKFvHTSUS8SJXmJru?=
 =?us-ascii?Q?0u3p6brfmin8SkM+fyid/xtTtX8Cmtfl1zzhmAFiGprTVasrNUUZG7fOEajM?=
 =?us-ascii?Q?m0WP2twAyUxHyXq3suK2mh1fWPqkENrddcbyFI1l81w1gOpVWMfzac4XdOS6?=
 =?us-ascii?Q?VpJh11wI0hoyO638XnA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1LPymVFZyH8SDtx274OTHI02CYrHXPpaLs5Br+XNrT+24U2550KgxWS0TG8S?=
 =?us-ascii?Q?cIGJyjLoEGW2KsY9U3hUkCMIA1aYf6Xt3Pjx1SUsi1V/HtVJsy9S11mjFv8J?=
 =?us-ascii?Q?dKkzhqHTnlGVSeNKo/qbAxggZppDSdP/QIPwwkyOzrazRXR+6/oB8MBNyQve?=
 =?us-ascii?Q?lFzDH1BFxsRYrctp2A1rOI3S1F6PsU8oLp7FU82eEnOtpHYkOj3UFxSsOPMO?=
 =?us-ascii?Q?MFMpbItR2k4c6l/mux/va6DraEeyZmCoJUDuyPJQR8iaky0FQ9l2+Jvvxuev?=
 =?us-ascii?Q?gghPtfIEu49RPVhOhaXTCyyKOWA6dY7av3XBycN9DwkSZiT2IsE2TaxucYzW?=
 =?us-ascii?Q?WqDAmJFlUWuyn25idOnP/T/bN51tvmht/NmQPBk/ZqaRVFFrvhqv5J2U3smY?=
 =?us-ascii?Q?9c5Z04KPWthTu4lhqdYK4ZFsB9hWQqbyLOcJRk4n1p9AJzupOPngbAl0P8QQ?=
 =?us-ascii?Q?MzdH1YowptipFYKEsm5V/eVJL1F71Kx+3zPTAqeDj1yq3ax4AAkjzza3QPJb?=
 =?us-ascii?Q?W+bv5LJ6iCwDyzEHVntOlBBEBgfcUeG7c9heBtVyNHVq/bmAdZta7heUGtYe?=
 =?us-ascii?Q?qSNAG8a7ZeJeuh7pQSaQ7vai1o7oUSmf+cYUrTCgytkBHaO6j+YO1UkYRM1o?=
 =?us-ascii?Q?ujFdcB2xFFrR5756CTWZk6+BboS2MVnMFfRu4Af6LZ5Ef6wxho1txcQm5aPK?=
 =?us-ascii?Q?MN3Pjtk2RWDSA3D5gaIrtteqn/RVqTC/yywIltxQyO21qPYacp+XPFya3Gi+?=
 =?us-ascii?Q?dNvz3LoMKqnc5iqZRjQVfEX0vq4geVWnq9FRIq4GgQ2v2lS5DXSQxvLhf6Zq?=
 =?us-ascii?Q?4Y0x8pyLrR6yxZe1MxPs4DMote7IA7rPe50xiQXZg256AjFiNnWp5jXZkHDF?=
 =?us-ascii?Q?ya4ew5XZ+Zd0T5+r7iyBdyTXeqizXB7zLzJHrl8TeDgGeb/2kMnLhhIaOYn/?=
 =?us-ascii?Q?lw21xkqTm6IjHkYGLny1kUU4U/V+lOrReYitjPbYa4FQ+ApFN9G9egIA6I0m?=
 =?us-ascii?Q?zF5sx0SS+wH75lhZdUuSG45/h06piauLHlO0CzjeNfPetUVh1xrtZUTmSV4a?=
 =?us-ascii?Q?/HuXg8boP0AIQpYl6aQsJBnaSACOnS8S1nvnQWkCURh9O+aKy4+JGn+NGdWj?=
 =?us-ascii?Q?5W+j6+QukLvIknOJe1uCoGl6zzc9om1JYMI2j/SCSpfgkwOxh4AtOya9Q3od?=
 =?us-ascii?Q?r1aJrxLZgPVwzZLDLBtIpb2YzTBERroKZuDJyyI9gaYDWFWUNdJzfdASWlzy?=
 =?us-ascii?Q?58wD5+dxUXvqHXNZWOA7+cNeKf3e9jrVPyHbKRsRh+m5OxN/E4HkDDlzF7tG?=
 =?us-ascii?Q?Sk6liplUIvPkq0hj7bsxdZ/knLcE9o1EuoHOYU9h+/jylOb5uzpABBYdIlrO?=
 =?us-ascii?Q?l2PJQ19ynhA0Fn/GYm9qcP0PsPoaeSva6eMcx395bih7k+P8oph6q4VD8JDW?=
 =?us-ascii?Q?tgOfr3R616CArI0AIQIfiLiPXtoUjS63bdA5zHu+xxFx/R1N0wkUJwtrSiq/?=
 =?us-ascii?Q?TIBgqT5xO7juMEQa/FYjA7K4xh6oYGUl1Hjjcjuk8TBBuCyWSfbSW03wT5Eb?=
 =?us-ascii?Q?irVCeLhNkT1XfMk36G3ixM6UMaFEGyvX7QcSVd/iZxXRMyphX4HU8Cbn/j5G?=
 =?us-ascii?Q?clDuNakFd3OqBSLzRpeDYYKYfMY4dOd2nwsSvExwY6KDW2grW8/f9b+/qf3B?=
 =?us-ascii?Q?VFEyilZO22vi8Tz5ss+Lm0UFoNey9tzAZRCTxaqILtQV+FGsU3e+LQ1baVdm?=
 =?us-ascii?Q?I6GM9bZBKQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9bf287b-2354-46f3-8aa5-08de653741f6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 04:21:53.8995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2FBix4outFcL9qDbHwDSfQiWjUY5ck8kno2pMr1+RpTglL+yNceCM1Ft4Yj5bGbBvSAKr+Ei3dUpqsWfhZT6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468

Add extract_fmc_signatures_static() to parse cryptographic signatures
from FMC ELF firmware sections. This extracts the SHA-384 hash, RSA
public key, and signature needed for Chain of Trust verification.

Also exposes the elf_section() helper from firmware.rs for use by FSP.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  4 +-
 drivers/gpu/nova-core/fsp.rs      | 81 +++++++++++++++++++++++++++++--
 2 files changed, 80 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 9a9b969aaf79..e9101a08511f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -27,6 +27,8 @@
     },
 };
 
+pub(crate) use elf::elf_section;
+
 pub(crate) mod booter;
 pub(crate) mod fsp;
 pub(crate) mod fwsec;
@@ -607,7 +609,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
     }
 
     /// Automatically detects ELF32 vs ELF64 based on the ELF header.
-    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
         // Check ELF magic.
         if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
             return None;
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 8d49d844a372..45c9d9720587 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -140,10 +140,10 @@ unsafe impl AsBytes for GspFmcBootParams {}
 // SAFETY: All bit patterns are valid for the primitive fields.
 unsafe impl FromBytes for GspFmcBootParams {}
 
-/// Size constraints for FSP security signatures.
-const FSP_HASH_SIZE: usize = 48; // SHA-384 hash (12 x u32)
-const FSP_PKEY_SIZE: usize = 97; // Public key size for GB202 (not 384!)
-const FSP_SIG_SIZE: usize = 96; // Signature size for GB202 (not 384!)
+/// Size constraints for FSP security signatures (in bytes).
+const FSP_HASH_SIZE: usize = 48; // SHA-384 hash ([u32; 12])
+const FSP_PKEY_SIZE: usize = 384; // RSA public key ([u32; 96])
+const FSP_SIG_SIZE: usize = 384; // RSA signature ([u32; 96])
 
 /// Structure to hold FMC signatures.
 #[derive(Debug, Clone, Copy)]
@@ -257,4 +257,77 @@ pub(crate) fn wait_secure_boot(
         })
         .map(|_| ())
     }
+
+    /// Extract FMC firmware signatures for Chain of Trust verification.
+    ///
+    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
+    /// Returns signatures in a heap-allocated structure to prevent stack overflow.
+    pub(crate) fn extract_fmc_signatures_static(
+        dev: &device::Device<device::Bound>,
+        fmc_fw_data: &[u8],
+    ) -> Result<KBox<FmcSignatures>> {
+        // Extract hash section (SHA-384)
+        let hash_section = crate::firmware::elf_section(fmc_fw_data, "hash")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'hash' section\n"))?;
+
+        // Extract public key section (RSA public key)
+        let pkey_section = crate::firmware::elf_section(fmc_fw_data, "publickey")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'publickey' section\n"))?;
+
+        // Extract signature section (RSA signature)
+        let sig_section = crate::firmware::elf_section(fmc_fw_data, "signature")
+            .ok_or(EINVAL)
+            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'signature' section\n"))?;
+
+        // Validate section sizes - hash must be exactly 48 bytes
+        if hash_section.len() != FSP_HASH_SIZE {
+            dev_err!(
+                dev,
+                "FMC hash section size {} != expected {}\n",
+                hash_section.len(),
+                FSP_HASH_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        // Public key and signature can be smaller than the fixed array sizes.
+        if pkey_section.len() > FSP_PKEY_SIZE {
+            dev_err!(
+                dev,
+                "FMC publickey section size {} > maximum {}\n",
+                pkey_section.len(),
+                FSP_PKEY_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        if sig_section.len() > FSP_SIG_SIZE {
+            dev_err!(
+                dev,
+                "FMC signature section size {} > maximum {}\n",
+                sig_section.len(),
+                FSP_SIG_SIZE
+            );
+            return Err(EINVAL);
+        }
+
+        // Allocate signature structure on heap to avoid stack overflow
+        let mut signatures = KBox::new(FmcSignatures::default(), GFP_KERNEL)?;
+
+        // Copy hash section directly as bytes (48 bytes exactly)
+        signatures
+            .hash384
+            .as_bytes_mut()
+            .copy_from_slice(hash_section);
+
+        // Copy public key section (up to 384 bytes, zero-padded)
+        signatures.public_key.as_bytes_mut()[..pkey_section.len()].copy_from_slice(pkey_section);
+
+        // Copy signature section (up to 384 bytes, zero-padded)
+        signatures.signature.as_bytes_mut()[..sig_section.len()].copy_from_slice(sig_section);
+
+        Ok(signatures)
+    }
 }
-- 
2.53.0

