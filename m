Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013016.outbound.protection.outlook.com [40.93.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D238329E65;
	Sat, 21 Feb 2026 02:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639870; cv=fail; b=O4WzTW+jppqhWEAVK9ZAsULhMHXjZ3HZn3Qk+qVwSYpN6MFNUQYAxZbVam54PZPc2oAeBNN7CHWcLwfjrENMVvrM938Jx2D0b4YenSaOS4q17qAfymlt5vhYOeJ/apXz6sQ4/V+wr7aqNKUCecDZVgs7lO3MpwirgZ4AsilsyxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639870; c=relaxed/simple;
	bh=wEwqEx4y49Edxjaaiv/4uoJbWSgfV+tliRn/0n9y5wg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XUFm9wJaYVprikCPkfNppzNF0VLHThPUXfBRDxRjTCZlu4/jWFbQuIAK6zmxURgv07AvIGANn3rhERKADjTa+bjxLuPCj0OPXHdRQ+37J8BVZ1W7h4CpU/4tu7htImPuPxdf/sb9huTVzMEj0G36dTRxqU2VFG4dOUmvD9JQ1mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lBehClYL; arc=fail smtp.client-ip=40.93.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lBehClYL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+z1vUwsbOcZ6/dYnVqwKI+4HF2KvKLmgWV2OcnIax6E51/Mql4AnrstKWpdu8jDsHBV34AD74Q4ZwIt4CsCKAluaQ9FAyzI/ykOCL/18tsL8tMTZ6Kp8YsaJCY9iA/SYI2bmN4mMtLOdxPI/fTAd75QVwuuw6lpnQjVQ04MwYecfoexPzmzwYEDAFEltviIPc2Kpj9eB5ZaqZt0iDedn0qsfzTxkMDpxqny8MJcmII4Ub/CraEnimrHPxclf4ZJHcl1T7NBf1xVFx8XtF2G6xXT+zVA1lIivZnRiR7m6D666o8R09Yn9z0RqFgrxAl7wyXnhcmjOagtU1Cq2tic8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1e0gzITEGIhDYTzH8X6XQarnWqgYgVERza3tDxcAns=;
 b=TA7wX28QJHWNjvrVagkhiuQkrtkNsA+b8zuMhhGUZfbJiYmnQeG84IKZ1nOzNlxdKQvoGEbTzqYmnQfyefYjPjNQ4cRAoQrvgm4KFqVxPbEe2s/Dc26iVaT66JPekq2NsbL5RsE+qiMq87GE0dUNwFGEhS4RHNoAXcngD+Sjz6vgaSTfRT9dxzz0dkfvgJtVmFf469T8YoHW0OC1sLY3iV1S6liqSpTvHyNKFI2sBkKy4C/xLcLxm8N5h/D7Ps3TsJeyxi1QEDTC9MxJt0Va/qfglr93MGrk3TAyMzfMmcQt25MEE4TvGD5y0ZwR49+YafQz83D4nGdmIrEJ1a2Mcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1e0gzITEGIhDYTzH8X6XQarnWqgYgVERza3tDxcAns=;
 b=lBehClYLqRE9kwdP97FKpIVERLFSCJPi7N/ir0ApM2o1c0KyYHeTNPGLjP78qTV8EGtjePw4uTv8OKpYxTUtyy8Z5qoGmmX6cv/vSifH1GwnjHhEHAYVfAVMHaMnC0nc/GqRYZDxL+MA0enP/AqdzVT9YoichXJicZrpPaf3dvM6PQrDOrpZ1VpjymIoNTgiYhabFhHbrj6NfYKEvDyvjUzv8F8TidIObF6VnVW+Gr1xiP5z5HbrS8ZDZSewsIMFeO0rifCgBZ68IZp4Q2L8mMWsUl9vPgxOECq+t1xNH0mR4jxogAHjRLsyZYDB5T3NLDyY5ZuNtBLDFAQ9Tl3ZAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA1PR12MB6996.namprd12.prod.outlook.com (2603:10b6:806:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Sat, 21 Feb
 2026 02:10:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:10:22 +0000
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
Subject: [PATCH v5 23/38] gpu: nova-core: add MCTP/NVDM protocol types for firmware communication
Date: Fri, 20 Feb 2026 18:09:37 -0800
Message-ID: <20260221020952.412352-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA1PR12MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: f73ca7ac-c1ff-4c78-3ed6-08de70ee5e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IKxg+wVPpBUEOCROZ7//hiNJfhXdmnXyaQ2mPBx9uH2RxqSAwWfBa/IXbxkZ?=
 =?us-ascii?Q?hGgy76Q+SaHNpNpGii02hb3ikQjSi0bYV0JKvRIIxYZcetk0lcnNbqHTT1Ls?=
 =?us-ascii?Q?T8k0mk0KG9Y9CUoKr7UGpvpoGYE9K0JrdzAV1NxPOVyoMJ4LoaSjuP0qzufP?=
 =?us-ascii?Q?dIivauMBR9njRTq7W4peQWlSAIrhnKkkrJa7Bht1pe6U2FzQcB27OnqfaVv9?=
 =?us-ascii?Q?yAS4f0+S3X/D/LKqHxO58kDx8A2D6W9GMiZKY/tqddQv63Q76YAqCrw1z0AZ?=
 =?us-ascii?Q?lZLyUGLh5bMM3bdHk5eXBApa+rb+K+GfGw7If8Z4WLKrBJ6gP+5EVxn1C0O8?=
 =?us-ascii?Q?JzCnwX5bkoKG77o5hD9atv3iQdMeKa1kcEhGIGUyJmK6hYaD2xUd4GnE5Ujz?=
 =?us-ascii?Q?/cI4YDvdDhbL8YcFfzdfpU/kY/QqR14dIqmte90UWewykWfaWbyfc0qKdomR?=
 =?us-ascii?Q?XPVIrvAYSJ3yk7Q8BK2kiXqkVRaf+QZGVwMy/8YNjbWVMGb4ckYIQG2MnFZI?=
 =?us-ascii?Q?VYmFuFoSkO13K+6odePMyvilXzrcfNxNgEGuWuIqElan8gd6ugBvYHh5x8Pm?=
 =?us-ascii?Q?sbAXfLLlrSL8vhFMWCwTVqfROybj9zx6ibTV7Ayh3//y6FNPGy/Fgcy6NdHM?=
 =?us-ascii?Q?blAmxSOFanzqN6kepHru/qZyeJiTVaRFs9eCvIK0OSwrAE9gprc/mU50ntDs?=
 =?us-ascii?Q?2XOwnfPnRdKJdU8XFgePRbXqD5XDn1uQJePduk/QAwG7vxtz35lb5K0k/Ls0?=
 =?us-ascii?Q?dVKeo4TDI+3tAWyH58XIdxm2mqaFc09AkvY2vRTdCDhEVD7Bp6mE6xz5fjeO?=
 =?us-ascii?Q?PsDM5niUzPvZxMmnwmqKLUyGIBnixoJVCIEzHTV34zg3Q7rqivyBsJl48JwV?=
 =?us-ascii?Q?XYV+IbfGL8OAglxyOgHyI8NfCbOjUvdeZqXsZx5BcOnuDTY3KlJsk/mTo/1g?=
 =?us-ascii?Q?nOe84Izqp8+kkmoCqasm3uDDB5oez9PFJlPSekFi2HMt0qjTYkryzmKQA/gv?=
 =?us-ascii?Q?QPMg3FWS1OIBbYR//miGDUfJpFT4Wq17u6MwNMrhM0E5ViPPNFFET/z1Qmql?=
 =?us-ascii?Q?WN/Uikqm0gJCpCEWRwag9VSaJxGMt0ODU5nkF9JrdFbA9cVZLbqvpuiDgNAq?=
 =?us-ascii?Q?SLgPs0x8MeEnKt734vHddbZuEcme4K1/qQaH07eFfdoqN0DwLIXW67o8Drhr?=
 =?us-ascii?Q?M8Fvwn5fSbalMMIpCPVAl1AubrZGbGOOuI788tUvuTEF0r9VAMPYcnu7CV+w?=
 =?us-ascii?Q?p389VqJ0YcDFo+8NLkRuXnp0lb+UE0Yryv6YCf9/14uTFc9yzbKnGdYS92kC?=
 =?us-ascii?Q?bTs0DH7/c1R5r6YoC71hxcrBEQWehreLTnZhiZJTGHG7TBjRFfhbCyEKsKjV?=
 =?us-ascii?Q?qVEYZI6cdKMJaKqWTp3ySQICb0GQaKZRNkXcm8/34ThUhfPNlufTuJpJaDD6?=
 =?us-ascii?Q?tmv9kVbgA6JPVOLOhTZVTmhD/tRyXo3OmuFtD65U15LtTRq3AUooJPurA+g/?=
 =?us-ascii?Q?S2fOVJskRWdBKm/JyLo+x0sOv3ZH22/tcQyLnT7u6tYCUQphty0QisGLRZaG?=
 =?us-ascii?Q?W5d0TMtY9Iwdmrm1xKQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iQSBjuEI7/+RaLCwlwRGLCbOR6sMDqzHHl6qG2eQLUlgKNVLYCiccl4IZsUv?=
 =?us-ascii?Q?VZSeDi6ksh2fI+Xu4QhjZPitmXYdUYIATNZA4oPO/1QW8ryq5rlBYOZHh7Az?=
 =?us-ascii?Q?jSi3swOPNKqsy6Zqrrz3htGDRCQkcCrXttUqGxwCJP1wZLYCkzFWdt7FKkj9?=
 =?us-ascii?Q?XRlXzUq6yTOlyiqPULVNVRu4iXz/j38eI6yaeWnEaCz3aGWOTH4pQciJpJGj?=
 =?us-ascii?Q?tM+ABnaUlwHaYWwFVx0aP0X74+EDiTkx3TsDAdP1AZCg43R4fEfjkaoYTmSY?=
 =?us-ascii?Q?IafZaA6A7gzjLhNn9N6eQM/qXD4L69BLzMHZpd87dM0LQ2oJA30vruR/8aNj?=
 =?us-ascii?Q?C0zySasmvV1sMBlHpN/SnCabv8KunsjOebLQNhbps6t7Ta5Icx9n3PRJPwRL?=
 =?us-ascii?Q?VyBtLVLnv4Pq8AL+08caT7KANysdlgQXp72EUSFfYeCzLOlsut1MENEXhTMD?=
 =?us-ascii?Q?3caBIgDcZIPTVgwHtW89e3t1l+euWsgGkdlF+sisO97FkVOWB85d2186hYOH?=
 =?us-ascii?Q?ixYRZ3cGd9+EuqCcS3oPDQ+uMXEIiJ9PQ2kSxQ6Z2VP6hLQeeUo+qCMCWKB2?=
 =?us-ascii?Q?QzDRLo6eMpbtN7SPKtW6vDmrsY1MCU74mYiBTeOdHFE38hKzBxzkYe9gO7h+?=
 =?us-ascii?Q?fN7QqXF0L7/EO6yUoEDbjaJrr3WCiJsTZ6FExw/26ZacM127GrSUdw7UQ8F6?=
 =?us-ascii?Q?bjjBVUudrIMgJ1txtad/tK01GDpL7vtj8KbtAlNXeoo2j0qfP9sO49QiJxZp?=
 =?us-ascii?Q?H2S2ZKz1hd072FiYZV4vQdsH11ZNCyPZkANl+2jVQXg9USUOSsvSVlB7oYTM?=
 =?us-ascii?Q?JLn9959nfjDgcytD9ceYP46tQF1CfyP20jh3c5khBSNrMzgyuEAzRCgENk3K?=
 =?us-ascii?Q?rApN6TtnN0Zf8RmMUrgQuJh+Nqw7Kjg1dgw/3MvQ01npIGvGer2OS/uC+yvv?=
 =?us-ascii?Q?nN9k2r1/LX0WcxLJtUv0ARSs680iFg3gXDQM2Lqf15CK3cCvH8YhRf+cAvT0?=
 =?us-ascii?Q?M7kdT8PfHkB9GWhzOiNwVyDDAWlkm5AcXSJj6H87IUy9t6wQZq3GnjnmPeej?=
 =?us-ascii?Q?UeOE5n+rrKNK3HjicYVyvKVVRz/JfjFe4ayYZ8EvQe4mXEUaaff8xAglb7wy?=
 =?us-ascii?Q?jvCqnSP6Lo9mS1ctDi4d2fnjuiHDXXxroYpMnYoRKQ1a0oD5EXc41XUZkr+K?=
 =?us-ascii?Q?GrVFwOjB4aev45bk74iEsDndBbCpbS03tH+Wp3VQzAtTAkIllnuD8SDmbhNh?=
 =?us-ascii?Q?0LlE8PMa2ONfbvdoxe/wPcE6ft76HVqgvNt80ToJbhuLPtC+80v9yddzUJMr?=
 =?us-ascii?Q?8bTE+uAQsAsqzAcdBLLYwDfY2BOP0lbpQ/16XCaN2WkOsldTb0gSRgW8k7MB?=
 =?us-ascii?Q?QtslEMFJSJgwMhCCTVlUg8qYwmx9eV36qs4R9oPpoOvAXGe4lPMk6lcn8czk?=
 =?us-ascii?Q?uBlzE1lCSyPaCwmnw3La3vFBkjREkjRmh1UGvAwCtmqOQc9iHSWQDrIfwn7P?=
 =?us-ascii?Q?gsR4HzNFnqGLitaWfAyBzMVcPSEVQIIxjaG71rFmBc/779BWEtsKxz/EeA2Q?=
 =?us-ascii?Q?59kLl+igunf8C7RXw8Yt91v26yqxpEkoX1y1UrgC5lgP5GHRJpmzfCo2z7uX?=
 =?us-ascii?Q?AAJP0HWNWHUI7xDagkSorBVV3pO8mAazwiPnPGJ64/x7zNPpnmPItOKuaMlC?=
 =?us-ascii?Q?VHob/gmWkrXoDpC2LalSOKmyP2Qhi1OA95x3SfkA8IBEf86RIaG3Y3wuCVki?=
 =?us-ascii?Q?26LFFjexDQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73ca7ac-c1ff-4c78-3ed6-08de70ee5e67
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:22.6642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFda1+//uBzWis1gPEmBINIadi5Bjld7bx/fUMRSzS34am8iExRIzvhranO3XkKtlxtP6UZBJWTu7o5GRp3wJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6996

Add the MCTP (Management Component Transport Protocol) and NVDM (NVIDIA
Device Management) wire-format types used for communication between the
kernel driver and GPU firmware processors.

This includes typed MCTP transport headers, NVDM message headers, and
NVDM message type identifiers. Both the FSP boot path and the upcoming
GSP RPC message queue share this protocol layer.

Cc: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/mctp.rs      | 107 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 2 files changed, 108 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mctp.rs

diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
new file mode 100644
index 000000000000..0dafc31b230c
--- /dev/null
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! MCTP/NVDM protocol types for NVIDIA GPU firmware communication.
+//!
+//! MCTP (Management Component Transport Protocol) carries NVDM (NVIDIA
+//! Device Management) messages between the kernel driver and GPU firmware
+//! processors such as FSP and GSP.
+
+#![expect(dead_code)]
+
+/// NVDM message type identifiers carried over MCTP.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(u32)]
+pub(crate) enum NvdmType {
+    /// Chain of Trust boot message.
+    Cot = 0x14,
+    /// FSP command response.
+    FspResponse = 0x15,
+}
+
+/// MCTP transport header for NVIDIA firmware messages.
+///
+/// Bit layout: `[31] SOM | [30] EOM | [29:28] SEQ | [23:16] SEID`.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct MctpHeader(u32);
+
+impl MctpHeader {
+    const SOM_SHIFT: u32 = 31;
+    const EOM_SHIFT: u32 = 30;
+
+    /// Build a single-packet MCTP header (SOM=1, EOM=1, SEQ=0, SEID=0).
+    pub(crate) const fn single_packet() -> Self {
+        Self((1 << Self::SOM_SHIFT) | (1 << Self::EOM_SHIFT))
+    }
+
+    /// Return the raw packed u32.
+    pub(crate) const fn raw(self) -> u32 {
+        self.0
+    }
+
+    /// Check if this is a complete single-packet message (SOM=1 and EOM=1).
+    pub(crate) const fn is_single_packet(self) -> bool {
+        let som = (self.0 >> Self::SOM_SHIFT) & 1;
+        let eom = (self.0 >> Self::EOM_SHIFT) & 1;
+        som == 1 && eom == 1
+    }
+}
+
+impl From<u32> for MctpHeader {
+    fn from(raw: u32) -> Self {
+        Self(raw)
+    }
+}
+
+/// MCTP message type for PCI vendor-defined messages.
+const MSG_TYPE_VENDOR_PCI: u32 = 0x7e;
+
+/// NVIDIA PCI vendor ID.
+const VENDOR_ID_NV: u32 = 0x10de;
+
+/// NVIDIA Vendor-Defined Message (NVDM) header over MCTP.
+///
+/// Bit layout: `[6:0] msg_type | [23:8] vendor_id | [31:24] nvdm_type`.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct NvdmHeader(u32);
+
+impl NvdmHeader {
+    const MSG_TYPE_MASK: u32 = 0x7f;
+    const VENDOR_ID_SHIFT: u32 = 8;
+    const VENDOR_ID_MASK: u32 = 0xffff;
+    const TYPE_SHIFT: u32 = 24;
+    const TYPE_MASK: u32 = 0xff;
+
+    /// Build an NVDM header for the given message type.
+    pub(crate) const fn new(nvdm_type: NvdmType) -> Self {
+        Self(
+            MSG_TYPE_VENDOR_PCI
+                | (VENDOR_ID_NV << Self::VENDOR_ID_SHIFT)
+                | ((nvdm_type as u32) << Self::TYPE_SHIFT),
+        )
+    }
+
+    /// Return the raw packed u32.
+    pub(crate) const fn raw(self) -> u32 {
+        self.0
+    }
+
+    /// Extract the NVDM type field as a raw value.
+    pub(crate) const fn nvdm_type_raw(self) -> u32 {
+        (self.0 >> Self::TYPE_SHIFT) & Self::TYPE_MASK
+    }
+
+    /// Validate this header against the expected NVIDIA NVDM format and type.
+    pub(crate) const fn validate(self, expected_type: NvdmType) -> bool {
+        let msg_type = self.0 & Self::MSG_TYPE_MASK;
+        let vendor_id = (self.0 >> Self::VENDOR_ID_SHIFT) & Self::VENDOR_ID_MASK;
+        msg_type == MSG_TYPE_VENDOR_PCI
+            && vendor_id == VENDOR_ID_NV
+            && self.nvdm_type_raw() == expected_type as u32
+    }
+}
+
+impl From<u32> for NvdmHeader {
+    fn from(raw: u32) -> Self {
+        Self(raw)
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..7350c2069bcc 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,6 +13,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod mctp;
 mod num;
 mod regs;
 mod sbuffer;
-- 
2.53.0

