Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010028.outbound.protection.outlook.com [40.93.198.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49F839020E;
	Thu, 12 Mar 2026 04:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773289182; cv=fail; b=mKSi7/Nd73ufKXuEWqIydOScY9ewZJrujpIX4KVM+oIRULh0EZmnwNetlLrFAiZCLJK5194CdQOVU8wtVQ4UwKjB82t5fIU438dOQ60nLhrqbQ5cFDrz+pfpOJBb1QohfYLzY8/9gGHq9/VG71C+Ys6Qr9CWrgiH49KA2NBEvWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773289182; c=relaxed/simple;
	bh=kEDIj2X14C9IHgutanr2BS6wV7XY0Kkbb0TmHuJ2oOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qaUvs7IyHUjMaDUG+RSaVrQY6IguoKho0HhOmAlXloC9RkgBKflbfxtqKr+e/uBsiXVNL3NSORdBpw4lbjaWX6Z9h67lUKkKOzd6U1cQT2ur3tIu5UPjv8jhnbMWCTFlauHtoqiM4fu1BrUfgbFTdTLu3Jbk9OeT6xBS/4sZhXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z0aGKf4W; arc=fail smtp.client-ip=40.93.198.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z0aGKf4W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRlBIscW/wvuFAgXqZtWgCMxrCWo38SyOBEPBoVCC+KszdIAmL2Xd7bZUTJJEWq2IeiF1f6qXJ3r20dOCYAdkEqPQSNBoxvsB5DPG08IQXNQtKJNbltHr4bX4mE4R40gun5vACF5Vcsbx2RmOEbteCgCntP/gUpknbQbYIby3wdXfj9dsZ6BIPtYI0IVGaeKTJ0L0vleT/6mJLCoW706ORTHvKgG42X1UEF7eTzwGKFPNjhbCcVsrI/wWIbTjzHU/dELHbh8L+3zkc/iRPrfavBv3Z2FU0HR9IVaXLFi8CeQNCv5OlRpApRjdNGdKxrUw8RmiEDG/n8R6eh+woSzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/345pMkEw2nGJVsn73osg75sdb3GAqkCfbTo2n45pVc=;
 b=OPZZQAV3qrsdsyiIOlhjHQhNDROv6PKUH39znY2mx0qDacMafbU7pql7IuPt7kyXWmFLJoFCwnPGKyZVnr/PyuAwzLA+p02xX4pMJ2wVX3I0I8rEMS5vI0DUB+0/bw22OXWfFLs2utzY6MIpZBpUGmuX4XRiqw8bVRai8kqPUdcFBLD5WFgneDKQ3AwHBFYPCBUhyKh9/v1xEfK7WI2947+6dwvdWujIAMICpHh6ThRMhlsZEEgCTo5IyXwiwrfl+ohhm0EhGyy7aPXBa+Sfe6Ef3Jxuqz8fjxJPOhgG+5TtvNSnT+AlRCGjdUbCU8d9jHAQQlfY0fJ+VnQApMlVbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/345pMkEw2nGJVsn73osg75sdb3GAqkCfbTo2n45pVc=;
 b=Z0aGKf4WBCje56Y8aZFH+/8yIKjQumXJDY43pOexRD08zvV31+6+M0NPLD8pYNV8bE6uPGqHSeRmbpYYm1firOrQRF6DlzWkr5LMEeTVnZPWOi2s+0esUwf8+02xFGlpReqL0TZ6s7A1TRmhcLHUOllTL/1d0zwALvMg2owtpqkvDAqqElnJY68XHIg1rIX30LiuhMQ9tQUH3TRmPvGdSME2FGqEFoFusPAe4aBotFdD+tOvX/0S5cuPtkh5TASRWypytKd8Z5kRrt/V+6G762X0FQgtwdHYI0FQrvGE4UXRjmvzn1oyC3rn8ukP6GQxl6DfYWZXbv11Ug5lQV5O+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB7409.namprd12.prod.outlook.com (2603:10b6:806:29c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 04:19:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 04:19:37 +0000
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
Subject: [PATCH v2 1/1] rust: cpufreq: suppress clippy::double_parens in Policy doctest
Date: Wed, 11 Mar 2026 21:19:34 -0700
Message-ID: <20260312041934.362840-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312041934.362840-1-jhubbard@nvidia.com>
References: <20260312041934.362840-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: ec8fa57f-0b87-4860-edd5-08de7fee92ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	HhkIV3T7rN8uPmNpjnLH6wqZ/TTXJ260+dZm5ZFYvhOcJCV8fD6osIt/dq2EhdLQYoUaZQ09YXDn8SkT/fb3G1dKD4Jk4LgTXdKMCCKjN5zOkbPLtUcu2jtW2KaLXSuCfOvs6FUvb48I25FryDx7isN4oDxdxCLJ22xtuJ5WPB+QT62PSv+4ZnpGASFWESx5ZJ3gfS615Kza9kNW04Ea8NXetiKhTG+GsC6NNyW+08Ihm3xUx/dtFJ8c5jSczdcSq+o+3Y1tMAjQSvmwJFKdfHJHJ4e1VBTTDhjFfwqCZW/HqM5lfcCdtP5QNcd4eV5AJ2SVmd6VKGDOyTlOyGHfl7huxtqEfQ0TUoY1OZIg1Xsy7Q4xHGP7APxnrbHIxe7cpDc3/kYSbCyvKpFpmBjLcSNd5E9q1irxjpsLUZZT04YwyD5pKkJHorXP40OIkuUDK1Li87VLnnwLB0OyzkbVUlKNGPZKQ7+jt/CvKDpRnZx1LQ16NDbGocY371ncCpZn1Odkp8eHYPR2vk1Ig7TvgVr69m/eM4mHLw0dF/DnWluqNA8fAC8TNBGJnhXDpvyqk6qLolI3OiFW8L9pO4Z8lTO57aIAyHv4E9W6HLe6YiSt82HqoD+bqoSwRCeVOQrBIp/Vb1DS+KdZL9dnZhVO4OfBfoDur2yf8TVBoWWFxwfEnK6eQvDyNnurEbwuYat6DcGCgfhp10El+JFSBBTwAKKxr1a4L9lsypQn04aAsEs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mzO4E6mekgOkgv9bNGKYmcVtyH8yHiYwuc7funN0lE2BLiXKm8v/qc5+8o6I?=
 =?us-ascii?Q?glVSqwYpC7H3GRugu8x179DXR20MSbQlZwIzw7oVK+CL3oRCxlIqFT5xzoBC?=
 =?us-ascii?Q?dpvJ+ithDUIPBaSwN6tMr8/YM0wnact/0MGt0YeZZBzP7S+Bl4vcqCOqnfdk?=
 =?us-ascii?Q?f1bM7+Fv6SHIbww4W5aEbAgMEzuZ5z7VmPcwYrJwIfHRqbYbzsjLgavVFOZK?=
 =?us-ascii?Q?GZrc8mNRPGDogjFH0529cQLDMdVqNCYWroupdPy5ALN1E+HNAqKcaEgy/Nq1?=
 =?us-ascii?Q?oxEPXhzLz9k78QjCwF6aV7iOLETdP83Fx6Q6NRkhjRtKrJYWjpZJ4tq5WdX0?=
 =?us-ascii?Q?wzbgPikjdiUDqe2Vy2wTcMRXoiE1PG38NL+wKaKd06K3S10scVElZMRr5q/K?=
 =?us-ascii?Q?PY63TYFkF9DuRj+qt5r/cQPM4iply7VqQtK9GbMAm8jmgkBPH/pSe40s2HIR?=
 =?us-ascii?Q?FohhDO2nhZZdP4E+idUh4gBsYC95rpIAuNr4xSvQWtFTb+1xaLlq8wL0uJqD?=
 =?us-ascii?Q?Isq8q5t7OY0Z1YNxvBwkXO7Sp10SVuUV7wpYqr/maZaWeJXTaEHCPEW80qzv?=
 =?us-ascii?Q?Wox2taAQpIDYYIof2MN1L6Fs4//EsmcrWAVZ9hDvsBP5Ny+WGPINpamoyfNL?=
 =?us-ascii?Q?JIwBNupaAZb50mHLDYGVcnqgLGO79Z66c/PRQu/RXtAyu3PqGnDmpW2TpYcn?=
 =?us-ascii?Q?IFFpbzA/rDhdtGZdyrajWI9ItOfKscOXFdOPBj1xVkC9DgHtxRErOJlU/6d0?=
 =?us-ascii?Q?fWF1DTE1LFXyoswKYngizZUSBFDA6xdgYDlCh6cJyql0HsOyAucdneuhC8Y+?=
 =?us-ascii?Q?Q42yNipfnYDvvYLI4ZPdNQ7bdsghkfH1YRlBtSzIxKOrY3tDP6mTm5kFMrXY?=
 =?us-ascii?Q?oN+bv2rr4H7nQmkaOd88KppaOUQ/480nSdcVi672k2xOJSZcbD65wzsulDRB?=
 =?us-ascii?Q?8xr6VUF5A60WJMpqk7sbWkRwF1yCXyoHRV5dKVCXZ5xLij06bdG05l4m0/po?=
 =?us-ascii?Q?KChffccNe7FDhELvB96tUYgVXHQ6kb3jcobGTYXEgbooUhiH6CO5R6ZI43zP?=
 =?us-ascii?Q?NfclrUWhkPwFC/cMcxe0uHh3Bc61wkpD93aCy2yKpwQB9pXDaUEECffjwKo8?=
 =?us-ascii?Q?THymP6MI2UKtJCaeN/x05ERS7rb/zbK55cFdWWiJZB1Gs/g/+rIcQntJIb5W?=
 =?us-ascii?Q?FA3dBOmdD+OXm5kjChhJpApF/BK53G3nIfJyeviIl8lKQWUZYIqiiVBnczuR?=
 =?us-ascii?Q?xXXr5FM4QU8Xa5Zczj9PqMgKhtmXN5IxS7TF5CoJeg4P8aXJ9Qg2Tq1Rjv0A?=
 =?us-ascii?Q?O/AH04e/8M8wHeMQLAxN5OJVerr5ZBsLmBba8cTpRFDXZaIv+SAYj47jT78b?=
 =?us-ascii?Q?aigCvyTsem7p9f/Wn0/rB7fvUN6iC4yd7l+nqSd6g9kwKTd5ErdiwJn/OftT?=
 =?us-ascii?Q?bmxnlJSFmcx7a+tHcRJvuBdHdjoXBUINd268l7aowD9YN61CQM61SaQhuzAc?=
 =?us-ascii?Q?WJMDIZpmPMEEQj7k2URhZqFv3xEpffc3DZCBZf8YxP1316WPDtCbncUoscCP?=
 =?us-ascii?Q?UhKL3aJvhN79v74qlQFLi+e1Mx191oph7Wh1VhC96uWfLJl0G5T4Tx4FBLeD?=
 =?us-ascii?Q?1QGdEV3rSa/xGfqCEvSuW2mQBvtA07u8mETC5MJexFfZh04twXUT7gY7dmu7?=
 =?us-ascii?Q?KQXx0XzH+FNfZx1PjHVDIkvpPuVabwam42jp06scsFyqmKJb33G2zuyNyto9?=
 =?us-ascii?Q?LT/19LeY8w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec8fa57f-0b87-4860-edd5-08de7fee92ed
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 04:19:37.8892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blFXVVavlP8Vf/Ln7lue7yyxcPGQz607epggf/Y6TFOP6B3ZzRj1IH1ZSyeh/tWuFJ6iUXbKkRL6+ntMw388KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7409

The kernel fmt! proc macro wraps each format argument as &(arg). Passing
a tuple such as (a, b) produces &((a, b)) after expansion. Clippy flags
that as double_parens, but it is a false positive fixed in Clippy 1.92
(rust-lang/rust-clippy#15939).

Suppress the warning on the affected doctest function with a reason
attribute so it can be removed once the minimum toolchain moves
past 1.92.

Suggested-by: Gary Guo <gary@garyguo.net>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/cpufreq.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 76faa1ac8501..52fe061fc85e 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -401,6 +401,7 @@ pub fn to_table(mut self) -> Result<TableBox> {
 /// ```
 /// use kernel::cpufreq::{DEFAULT_TRANSITION_LATENCY_NS, Policy};
 ///
+/// #[allow(clippy::double_parens, reason = "false positive before 1.92")]
 /// fn update_policy(policy: &mut Policy) {
 ///     policy
 ///         .set_dvfs_possible_from_any_cpu(true)
-- 
2.53.0

