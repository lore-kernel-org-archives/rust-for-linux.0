Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4B8329C60;
	Tue, 10 Feb 2026 02:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770691605; cv=fail; b=Ydx2hph5h29JFRrz8FcLU2SX5wOj/9Ks9LD61ObRnrhmC0tkc2SroNsMoIFQY/sT1iJ0UpqcEOQlB6mRsY5HriPnZREJ4iN46P5bOnF/kumhT5UF4R08T68qjNoNKqNpODT8QWhiPrkt9H9NXeHMb7S9T0khYyRSfZS3nMzFm+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770691605; c=relaxed/simple;
	bh=kzDdnMwFBI32cTJHeUxP3+EfvoMsPv681U+8WqJYt5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qWnfZPNEHr4UiYfDlqphYr3gi7RKs7zZ9N2eeNhiNKWAmhoZuRpEamO0xUSwPr62EQ1FKfb4CqCY1KvF4FwJs/W4QMeLuVd6N/Ee7fMVHWxL5CXpPqRfLd+7FeZu1TuYOFeyPFJFR0vDtIQnjzArfQ8KMNe8E+XfdXs6AQLBSxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jJUxUjMz; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jJUxUjMz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiaNX4iaRQd7CYMn7lMZhjvPlIj7ySegpOuKsExccu5t7tdLivgibO6uQFnCNpW+iHup2PtwM7zu7+kJt0Vwxi+pF59fp1qf0YfN6gPVGEiW1orUR/ZStszC/NGxsFukco1nLTRoWpLepqQl3dHPgujVVSclK/TUr45VELlsT0ohl9X3hx5SoCElUWyQSKVHrrTLa36S0FdEeWlmi1rl/8MEUntllfIp+/4qV5PO9xX6SrQ+hN6y7vxQuJMoRficLixrSG6Y7GhWpBUghXapWi3N+FPdQCslR7g1R1gE5VxqwnsNkf/sJ+VD81b8nu9FwsmYJkeuU2ngcvWzDzqnvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZYt+mVu1GtTlN87amtPgdMvEKZT/e2yLHRshNHrVp4=;
 b=biQZxEkkS9Rt9AaIYPHDlYPcrZZX3tAxZfefwu2U6yruN7vDiSI9Bj0fFZzW3LJrn3pdhcfx1UDxHX99/vKLZLU5BmaH7uAvxqd2w1/5xgJYtvmi/hKcmu/IOMT2vzeEHpfRMWbeeF81dkrj9Bzgq/6q5lK3ZOzt/9tgtE15ijGcjeDo8UWvVHswA/IcvF/iORFYML+M8URySq1bPRt+ZShTKd6D1klyg4bsz7x0O90YBoIp/YQfj1RA1cVwYAVlBbNTH/5rT08YMo4Wo+u30oskWGhJYiTGCYNzEc8nXV+AZ2AzHwWl0Ob+Aqnx2NJnX3+97ZVvZcv+xXYC557aQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZYt+mVu1GtTlN87amtPgdMvEKZT/e2yLHRshNHrVp4=;
 b=jJUxUjMzOEwxG30wQsGBqgk6Nh/HUyWoCReParoV/KrrbKgNKV0KJyhBj7O8Bizb3Zycd68kvh5Up78/pFR5whpqlZ6P+mym+V1noP40I0Sea27pc2MYY9WnokW5YK5K3B1HIzuy5BemHOYpXkpzYcYZgq/LgGaY+MQSgsSMPd1HGkXIXgyJkg50aZxaoavKPuzGRZ77rSmtO9TBmYuQe1Oukt036W0t41M9fW4+x4qaMH5WQQjNMcho/1TYwZ74VWHsnjCdQkWw/vq8bGodG9rZ2V+2+niYspcvD1k/9JVmf2d5Z3oK490m+xjFD/s69xJExkBxhqLvGvvDgUSHxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 02:46:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:46:29 +0000
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
Subject: [PATCH v4 21/33] gpu: nova-core: Hopper/Blackwell: add FSP message structures
Date: Mon,  9 Feb 2026 18:45:48 -0800
Message-ID: <20260210024601.593248-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210024601.593248-1-jhubbard@nvidia.com>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d8c07c-326c-403e-1255-08de684e975e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kbNzmQI/Tvc/g1xKK3EUgPvZjCTOM8ibkvWFHAFLlTyEAbGLrWknH7sZdBjT?=
 =?us-ascii?Q?QJh2MSCEOhSIbY51KcbxoHxEPbgScKr3kxDLpQ5gfgm4EtOZRFKn2C8HVYF+?=
 =?us-ascii?Q?AHO3wgnNnU2B+vOgNCBp1/P3WwQYXjyToLg0trlCFh2JBTKBGFJlhSU5bQYQ?=
 =?us-ascii?Q?PrNNkrJlvea0lR79kYxGBk4tN1lGT/3C0VPTXS9bJZ7+WjUN8Uyk0LzdSdX7?=
 =?us-ascii?Q?NCmqz1dylktxxXWrEMOV5/KGXpqzOR/JhmKvnU39fTHqSEiN35QiT1RX5Rwg?=
 =?us-ascii?Q?/q6BLAIYTNyltNK4TtPKoiB91PuiAvzd+nCAgov2XDMl2selVJ7/+QJYx3fL?=
 =?us-ascii?Q?XEOwPJDUwv7IGpa/Vbc/EMUHb2LAJYO8KfD7JBVh4N3/2uENLlqVvB5CA0xl?=
 =?us-ascii?Q?mlzn4tRTWwd87i9Xr7t0tmlRsXBxn30OSSEXMYn/rONceaSeO5bSYl4vsMnn?=
 =?us-ascii?Q?Hn1GRjoaHADbPlvMsXrdbBZ7v+XxooQlM1Bnzl6ipbzfkDp62F3WoxykDSO2?=
 =?us-ascii?Q?sOAq+dBj8G2yV7WRL8UA8yEVv1Hz6d+Y/jr9MhfDzsM9xcLZvCGeHu5G0ua8?=
 =?us-ascii?Q?woDXBpzjlQdmVsI9eyskTRm/p0MD3QPeaNJMlS3Jcjs2mUzd/y28ttDz4HVC?=
 =?us-ascii?Q?Tf+Xn2u9FyT5cKscxYnIpIbgp2rKNTIQad7oN/5Mop7MYeOJ3h9k245XwKAO?=
 =?us-ascii?Q?ykXGA4Gca3fkt9Rs1rPngbDQZ6/ZXl2Czce1OSvolhLFbLxkC/rQxYCKl7LB?=
 =?us-ascii?Q?BcPzndjxiVlnirD/LqqlB3ph7h242oOQmcRIrMSZKv06hWbtb7P6J6x0pzqA?=
 =?us-ascii?Q?tESQFP25GN3mJywSaot9aWSixVm4CCWu7fbC+EmtYja8pxVvrsq3coUUBwMI?=
 =?us-ascii?Q?Pt0fsslDdpPvHz0/LnalQMlVNfO6oUf5llGqAaTVJBNLZc7r7njuNwz7EZjH?=
 =?us-ascii?Q?Pv+kIo1oRKorDRYXRBN2dGSrb1UmzZvmn8tFKlcJUB/v93oltN5Zu03AsLMa?=
 =?us-ascii?Q?zGUNqQyQfLkKRUtKCm17jrzRjJ0pGbsJ9Ny3wBtmIYkoXRh6chp7NrHumZMe?=
 =?us-ascii?Q?X54C+qnR4egcuFQiEhJIB28THsBzjRs6Da/lq34uXCY/mxMZ9sLhC0uehfke?=
 =?us-ascii?Q?wpLH2Bkhwf7PXCF2b2BZfTlRQL1DheBPLi21RjxHJYPqh+7YGNfbjlTb+KTy?=
 =?us-ascii?Q?xcXYefpjhAwGhIsQczecLpy30c+8KaCtNt084Qw04BsiKaZBqwW3fgN5FMAk?=
 =?us-ascii?Q?Zdh4y9Ph7d8BgH5owRNdUEyERBE9c5JY/3SsVGZOfftR39cJqgJML+2K1Blw?=
 =?us-ascii?Q?fX2CZt6YZTjvbvI9jajuK5H7Qa4Fspyx0+quw8FJxRC7tu6K5vTFDx4CZh1l?=
 =?us-ascii?Q?xaT4LZQ7vryUTUh2rqi4sITo1bcn7f9hupw8ggPIIoN/rsAqO/XJ8V9UU/Ev?=
 =?us-ascii?Q?Go9nJAkmURk9FQ5LuvDNHgMSsVcyz0Ggzf6usRHMokJxsptnmDrLMGFi2SFT?=
 =?us-ascii?Q?9x3IkQPhUvVJuzdrZ2yO3juKxz4BF4nSRqHALQfrBNlSOCbp48VNyS88wlW4?=
 =?us-ascii?Q?Dsvzc13eqrcEZuZ0WtM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ARBdl5yNnz61g7mlNVaifKi5njONOMzlpuSO24TrNAJME591/GKzYc1uoitX?=
 =?us-ascii?Q?unuhy0TTr2t/mV0xTAokcIEmp6QwPm7YI0J3A6fg1/ojzzqnAYUZV7y/2xo8?=
 =?us-ascii?Q?TypHz10gl+1qB6gF0Q8bRySxE0BGih+p09UUul7ciuuq2u3aj3PzzMFuOLCL?=
 =?us-ascii?Q?SQaGgTl1I4RIzIpC16nco95gPb2zzH7svP2+Xv9kLfYSONpFkaXjaO4idEV3?=
 =?us-ascii?Q?v73pLgMlBJIAeMmtO2wU8ryYyasZMwQrpURbGSMixp+k0G57NbDC/N9QiMBj?=
 =?us-ascii?Q?DnKBZiqx2HV/cPQlrRXcyqZeumfp+DlJpp20KYrmEEKvJR8vCuHQBkm2+VTz?=
 =?us-ascii?Q?kzCGJHmQuQu+5+0dJpw90yMOQBFCG2yRgEtxTlyPESV5qB4IlblFYBxghuOd?=
 =?us-ascii?Q?VQvSIgcI/q5dmlEQNKLpjcWnVXEb4ClaHeOJx1ZQWFA0R6PUXCxw+731R99h?=
 =?us-ascii?Q?vaNQtbahPDLA6CEngUx4X6EWkXxbUocN4xr8qIPY3GotjQKe3RXGKqQkuVfE?=
 =?us-ascii?Q?DZya4L2IMwaH4gPew7CFEJmYeM4EqqQBKiGNv71CXmUUyZCsOQu/ZK+Tmj8I?=
 =?us-ascii?Q?PusjbNwVs1dy1xzHPUUkeUYhFHWsiG06Z8Bopq9lw13fRVt+4sAwddL/QE1i?=
 =?us-ascii?Q?XqFdzpS5xkbpJQ3WYs1w1O1kzQRINDgZYleuXTHDe346gXYTmVusRwYYo5bj?=
 =?us-ascii?Q?5wwWpv2N078pq5Te226OJBz1eeNT4FQMdCV9ARQmKS3jVmFl6DElZAXSZW6t?=
 =?us-ascii?Q?ohUy0EJ0SVCPMpXgORjTfB2fK6/XVaFfTQn1sV7FlvkBSKag7yeAyaqJlAXo?=
 =?us-ascii?Q?lvSp6elKVEC1pTYbDJLqJ09oTQJzLSE42arTexfLVQeJs0rqilX9OhcoypU2?=
 =?us-ascii?Q?jkyPAycSBU3ilAeKyamCNBk1mZzSf6dbRZL30pBHBQQmkaB4i0Vd9v3yirmM?=
 =?us-ascii?Q?79TXVx40S+7O7LseZCx0wmsPs7tXztZHl0g1Sj1FhpuIe04NUSd7a/5Zioir?=
 =?us-ascii?Q?DYvUahwcLnh7QP6/v7gB5hEYY1fR9yFKxsnDQkk2/pSuPXTznYKtokA3ks8y?=
 =?us-ascii?Q?44kPRrl+un1dqQVeWKDc2Su5FkYLHlAqzXhkzpuOe5cFudYWrSBWO3nYpngu?=
 =?us-ascii?Q?Bcd6MfjpxTEJ/ziDdGYTBD7+7fcMfy7F6s7JXvOi17929zv87i3WypglOhFN?=
 =?us-ascii?Q?JikvLxyYyL4HfHJhouLEtB9yOeNpe9NT0YAXEs+IpmCUP/IqeUN1EVh4PNR1?=
 =?us-ascii?Q?hn7/v6oVDV+1791xRnjttpWlQ4Af5r/nZ4lCm+RIRjTBjmJE1bDcxsNSZQw5?=
 =?us-ascii?Q?Kdp0OlviAJ2lvCD+s4LAQOZkaP+bPr8kL8Q7/3BbvGhohiCWmMSwqG72J+Qj?=
 =?us-ascii?Q?TzMcsYWIfX/YCvy/onEHAX/VhuqtSrJs/EZ4dJDK/QsZRQtUpwouLHbRyN0/?=
 =?us-ascii?Q?+AH7iX9KN9WBYqloI0SRkjHHgV5QWsi4bmRFV2JY5amytjsO4kPH8SYN2rtb?=
 =?us-ascii?Q?X+L0tOtYjCRROhN8adSproVm8lOxpPi0aXSpvwTejzs4C8H41hT+pPAJIDGz?=
 =?us-ascii?Q?iJvUw+gr0es+tf6o3Ph7k8jnS2gMBm/IPT6JnW/b3vkLHTc+bSvas2sk4UzG?=
 =?us-ascii?Q?vHaKIkO5PvJ9oiciQ96mN7n12KpyUXRFdLtVQotTdr4xam4y30tTpuBy/3be?=
 =?us-ascii?Q?cOWakJNet9CJfq8TrGfPL7/GJfL1Qm4TIj/ZCWx+k6V29//L9Z/K13vFMPpz?=
 =?us-ascii?Q?wfU9F6gqfQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d8c07c-326c-403e-1255-08de684e975e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:46:29.1236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1TzbkgVwWaG10sKRwYGH75YjaOJVfWSCEIf8Nqr9+QrQOso7PSPT8tGaUb/MPs3F4aOcm46GZMj19/JH7vNgKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204

Add the data structures for FSP Chain of Trust communication. These
include the FMC signature container (hash, public key, signature) and
the NVDM payload structures for sending COT messages and receiving
responses.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 5476259d224c..7775f1b673c0 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -124,6 +124,82 @@ unsafe impl AsBytes for GspFmcBootParams {}
 // SAFETY: All bit patterns are valid for the primitive fields.
 unsafe impl FromBytes for GspFmcBootParams {}
 
+/// Size constraints for FSP security signatures.
+const FSP_HASH_SIZE: usize = 48; // SHA-384 hash
+const FSP_PKEY_SIZE: usize = 97; // Public key size for GB202 (not 384!)
+const FSP_SIG_SIZE: usize = 96; // Signature size for GB202 (not 384!)
+
+/// Structure to hold FMC signatures.
+#[derive(Debug, Clone, Copy)]
+pub(crate) struct FmcSignatures {
+    hash384: [u8; FSP_HASH_SIZE], // SHA-384 hash (48 bytes)
+    public_key: [u8; 384],        // RSA public key (384 bytes)
+    signature: [u8; 384],         // RSA signature (384 bytes)
+}
+
+impl Default for FmcSignatures {
+    fn default() -> Self {
+        Self {
+            hash384: [0u8; FSP_HASH_SIZE],
+            public_key: [0u8; 384],
+            signature: [0u8; 384],
+        }
+    }
+}
+
+/// FSP Command Response payload structure.
+/// NVDM_PAYLOAD_COMMAND_RESPONSE structure.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCommandResponse {
+    task_id: u32,
+    command_nvdm_type: u32,
+    error_code: u32,
+}
+
+/// NVDM (NVIDIA Device Management) COT (Chain of Trust) payload structure.
+/// This is the main message payload sent to FSP for Chain of Trust.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCot {
+    version: u16,               // offset 0x0, size 2
+    size: u16,                  // offset 0x2, size 2
+    gsp_fmc_sysmem_offset: u64, // offset 0x4, size 8
+    frts_sysmem_offset: u64,    // offset 0xC, size 8
+    frts_sysmem_size: u32,      // offset 0x14, size 4
+    frts_vidmem_offset: u64,    // offset 0x18, size 8
+    frts_vidmem_size: u32,      // offset 0x20, size 4
+    // Authentication related fields
+    hash384: [u8; FSP_HASH_SIZE],     // offset 0x24, size 48 (0x30)
+    public_key: [u8; FSP_PKEY_SIZE],  // offset 0x54, size 384 (0x180)
+    signature: [u8; FSP_SIG_SIZE],    // offset 0x1D4, size 384 (0x180)
+    gsp_boot_args_sysmem_offset: u64, // offset 0x354, size 8
+}
+
+/// Complete FSP message structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspMessage {
+    mctp_header: u32,
+    nvdm_header: u32,
+    cot: NvdmPayloadCot,
+}
+
+// SAFETY: FspMessage is a packed C struct with only integral fields.
+unsafe impl AsBytes for FspMessage {}
+
+/// Complete FSP response structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspResponse {
+    mctp_header: u32,
+    nvdm_header: u32,
+    response: NvdmPayloadCommandResponse,
+}
+
+// SAFETY: FspResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspResponse {}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 pub(crate) struct Fsp;
 
-- 
2.53.0

