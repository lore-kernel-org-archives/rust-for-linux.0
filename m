Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C564359A89;
	Sat,  4 Apr 2026 21:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775338203; cv=fail; b=Ch9sqSO9k47Hhk80yoevCl7TYHX1frwYUn8g79aNslOnMWemth9V8ckKDmjkb1mBM31PLKYmRzcZlLFli6gYCN/Rh7USyzoR+GtUMhAJ5rjoiASXt6fpMQ7CNzT/hWRCZ8bHRfpFxD4iG/QrEP/93FZ3/K9tdEmG5RWIyYrQdDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775338203; c=relaxed/simple;
	bh=8WBej2io7D1G8Obo5Lxszy8C+eM4n94QPutTjUHVSn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WncUIkqPnfSmxiJXcSB7asfC3DEglsDALG3S1yL8/Fqs9p891JZ3HVCVpoJlh1UnQRyLnLIl7jjkFDnsCAyLw0tKLFZj5OKkm1ZtlK+3GwTz+tQuIlb4D3jWMNa8lrJQ2LoZNk/xu11d84SWeJRFzSc7tdwTC1ylZ46Ulm8Z3So=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KZjinxTY; arc=fail smtp.client-ip=52.101.52.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KZjinxTY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/qujbtHcx0ur8NeqmF89cnNnV2GE6Ufpx/LlxKF1GbJQaTyg9kzgpG7U3AVRbPvud/KenycZyGjltGzNeFPs4HiWS9EpYgsQD1bZanvmq90Wa0G+19aCmKMA0RuamsVNeaJLAGi+OKITFwbz4ohQ47dUzUAXBgcTS7vEu/cIfJ/ids0bSsUcLgKCAW6mYuH2tZE4PPeLGgKuy5tmWgV3LW++LQEjcjESxadJll7tFH4DeFl9JimfyIN9rWy+AuGCnpwv4yvt6a/GMDWMmF00INYGhbpVwzka95w4G1cOxOwsHbPmOLQNqWGo8XehRN/z6sTYbJSDjbfjCAtiKVv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXzIRZr222Ct3YtZxMESPW0yUufqE3V47lS9GWjApRI=;
 b=Afo8a7sggYN32QDthAx1OGqujIDsNUUdY/7nBBii2lRZZsLLkV3q/IUxd9blpf68dBUxTwsYKYW6wadF4FuzFQ6Pp/RRzvM8UGGGbuooiC3/QQVjOToHz9UM5GF00Hxd47GczjboJz1kYtap7Y7syIuhV7wDJqBIJm9oTDK94HXpJVHKRFbrlCWE4qmYBSlA+9Ddf4rakD/7K7WSvUsUryhRkCpUizeoBowzotd5KXHZ5UgbOiL2Kr0Jaxq1HvTGUYp7wumdc9fngwRMkZ7E6ukvn67uMgvXo9OTDZbOYixYW7fHiBPg/FQlSF+UHdGaCoJVzYAnCPKSVOh5w/WaDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXzIRZr222Ct3YtZxMESPW0yUufqE3V47lS9GWjApRI=;
 b=KZjinxTYyVz8Sz7tOoX9TxPRsMEAyRv+ubPRzq8OPP/ee31o6ck+e6Y6Eeo8SPs6B+ZbjXN7ceUbyQmAGcNRNqJIP6ylIaG1vLt20f4SKDuodQsC9OoFiRv4+7UAs9ynji17PH8FgPLOYQRb4aoMfXfa6/51MwKY6mnE+f9zVh3vdCJUKRoxpxxRC8/SH7FEwlzbwzTLKY+QBNHYHjLNRpHjZuQh3LiSKVhysdVoJzMYQYxMfXNayZKABdISZ0QZJm+59LjTzvvgN0C4XxQ02Kz8zS4RhGBA3Yhrtkfk6+/1HbWJYvHQ4uX6lpMTXeP00H/xaQxakYP0M7V4Sxzhuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.8; Sat, 4 Apr 2026 21:28:35 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 21:28:35 +0000
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
Subject: [PATCH v2 1/3] gpu: nova-core: vbios: use from_le_bytes() for PCI ROM header parsing
Date: Sat,  4 Apr 2026 14:28:29 -0700
Message-ID: <20260404212831.78971-2-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404212831.78971-1-jhubbard@nvidia.com>
References: <20260404212831.78971-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: 033428a9-ab79-4be4-52be-08de92912095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zce/nzyHcgQbbrfkeil2FQ7FRWqgIzGDjJDl0OcBwFJBfjANOCg4gsOQkQ8lHKMQhLgnu/PKdNAKCcAcHt0gTTZS99nVTD9ouC2XZopmM0LxGezn5T7tw5i2LVlxQV5uZ3YqABUSC62Mug+of4bK2z0sJ3OIjfRFDY66nCoQOInc9qwtkysxF24fPLS1/1J9T3W0VdwCBlIlCXhV+WWtortWDLkZ2Tli4h4pAClPOiUUP/U2CTv+EQY1itprPXoxn/bO3VbtGA08eseVi5jqIFryx3OA7HFFBJCYQs4ZHTpKvyQ1tHykMMz89t0qIUYkXFMxXuLeLL0B8AOTa+HrbIto8M/5LpJruCuf0V4P0BhPJTkNYzzwe5g9Nb3W5lmDjCwx0tTaX5tOWtoR0I0lQGW2NBVYDhUnV7LHiYCBdS1cECp2jA3at7jr+nDc9YUPPCRWguYC6p3peamZNuyfJcoiZXdz+CikLKhwtohKLjUHh3/9mNHkuIhpFQLeV/kN4sVzj8M+D9xGbT4qdewOGi4wFkXkYmQzsOYFH+U1xw8z5r4eEY3U30d8LMUfRtS0LMCSnbdv4IYG3RFbdkeqLBh3Vg2GIblK24ZSqPAiwUB8B2wdY1ZzFOw6ZL2XUKZdMhSZi8o6bvlAqrrfvJhPyhq8lMUIgL+PjmjsMPTM1d4Hz0GVl9i8WD8BrFDRem494nH951hWE8paYyO9/HgTf/gSUjbmg9T8hUmWXjxHOU0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DvkbjlCw29oR77nH14hzWzltA/mdgigZJO1SLWbaEKUmES6A2nrkbN/PsxWz?=
 =?us-ascii?Q?hZl7/VJAEsGSDgdu05qm69TaJzrhPlWoNg+wBVlDE1nqhIPqqNA3YhD24fnz?=
 =?us-ascii?Q?Q19An3V5q3LA0vESuPWZsC48+HXCHnBnxbTTQ4INqVetxJIlyVDEL6kWV6fA?=
 =?us-ascii?Q?MJRvkFZTfYqMw3VOLeLFrCBm6PeC3lFcmV6rl8qcl+spYOIFpSFpLWaRZqrC?=
 =?us-ascii?Q?TvtpFQ1o/IakE9KC3xE/MGQQZxKxhIiU8GGF2K1rOPZpZbqdF8hUxIk7PCWo?=
 =?us-ascii?Q?7rNcvuDOVTvku9Lngz75q/G3aubXlT1Hf8alGkI+Hao03QkzclxnPcIZUwQP?=
 =?us-ascii?Q?XFBSy4pCdqWdlcow56Ct7fUwTJsRmy6L5ln57H9qEBL2xJTHTkp0qabV21qR?=
 =?us-ascii?Q?1DV+DjrHDFPIlPnPJJKTPBTu7nre3jxCOGs9hPPqcWALKhD7Hgt8aM8YqYmv?=
 =?us-ascii?Q?/EuAsPSH5yASDEOhni6EPB/zJxmjNja76TZr7mpgUGBk5gNAioA0S5JslC07?=
 =?us-ascii?Q?qnelWnQZ6jU4fy0zBz52/PkxB+IOJjv5jqgf243MCAGVQmujq1oWc52up5g+?=
 =?us-ascii?Q?QTtLvoHow39Jh7MeyCa4jTBfkENLId8dO6XNs2w8QPYIKa3djq5pxLmyGkhU?=
 =?us-ascii?Q?sWLX8vz1BoXZsX7TLPutBY9nE/MCrd3DXmSKz9O7Qx25isjbCuWHkvpuVdC7?=
 =?us-ascii?Q?j7EsaiyiUNbp12HVMPJSxy5N/J31nsLiFjV/NsoD0sm/r1rxn0TFpI+2BosF?=
 =?us-ascii?Q?3rdedZTz1q44IJ5X/JAD5xs7gUeHnfB7/BAWkqvTXQ6u3q495QRD7TcClG9d?=
 =?us-ascii?Q?s5IibNZl7VwcyxyQkgMZO18DFcMvkHatB8FuU8U2uL3hGtTWFaOFd6Z/5I7O?=
 =?us-ascii?Q?Z/OYgOn0z7TeZZ2xqJ+y9/HyREPz6T2GHjQ24N4uU5GE3KOyD3XnuiJVwzqt?=
 =?us-ascii?Q?PEKmFEeTo4LkExkU1tXtl5zqAWMOq7DchB8akm8ei/1jEaX9UmFvYm84pBjw?=
 =?us-ascii?Q?UtMRnjIWmupgdD9pGy55wU3OunjmwA+g3QUHLdQSLxoGBRDtS+Tde+kR+Z6v?=
 =?us-ascii?Q?p9Qk56WtvnJ6XpyaLSSDRdelcrLIlzpSxmAHwkxHZn0fXENk7DZprPujgspV?=
 =?us-ascii?Q?KGQFNkkD/PktXfbkJw1Yp+QuktPUNvtXpWlC/UBJJ18S3F0uSplZdfUPIgYJ?=
 =?us-ascii?Q?jWjOb2pEY/9/UrMUQwCMn6BZUOmxGKdnr1LdVQV9ZzW3+fXFtcz+egoGyHif?=
 =?us-ascii?Q?iSIEJRf2+ldahd3Xi2vkMESqF4kb2itJ7T6HA278n2snsqzyMMVWVHWfW14z?=
 =?us-ascii?Q?rBWZmkLjIy/fuI3wJLOMQCbnvpwO+DrHT+4usHf+NYUCHX1H0HuPPH1LqsYd?=
 =?us-ascii?Q?jMNX/Q+2CMfXjho8WbE1N4F+9ZURlVhNJyt3G7aoJu62D+Fh+1atsSdiupHa?=
 =?us-ascii?Q?w1Epu4AJDsmsyEe8X1LdLbLl/DJX/tKCi1NwCqJHPmmTfHv2AVk4oiGwu5DT?=
 =?us-ascii?Q?7RND0j37k+JXbquQzqbveZGZCAMEFJ4VECqhsGhOZ50eHFLuVLwt0RCaJjcW?=
 =?us-ascii?Q?jrykjndE6uAjZOWooLIix6BGSj1+O1ljDU4ra2MdVZJPMHU31aa2jkTeUXLP?=
 =?us-ascii?Q?Z+8wXT8y0kYToNayTy3SzuKS56ry9jXx6AiBqTdAYpLAK/eI8EHDFre736eo?=
 =?us-ascii?Q?fWVdjJ/FHJS/9z491+P5dV0Tusicmyd0c/qB79W6ZknpOZhFT2gcnk63zqPU?=
 =?us-ascii?Q?tNCybJkPaA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033428a9-ab79-4be4-52be-08de92912095
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 21:28:34.9458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XMEkofWYpMjk5dQbnV/58vUWgKSlvVF6o8KwLdIV6OkwaoiKg3EDNhTShZ90JE2aM7Bv3EJth8eY6vkueHMRsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399

Clippy fires two clippy::precedence warnings on the manual
byte-shifting expression:
  warning: operator precedence can trip the unwary
     --> drivers/gpu/nova-core/vbios.rs:511:17
      |
  511 | /                 u32::from(data[29]) << 24
  512 | |                     | u32::from(data[28]) << 16
  513 | |                     | u32::from(data[27]) << 8
      | |______________________________________________^

Clear the warnings by replacing manual byte-shifting with
u32::from_le_bytes(). Using from_le_bytes() is also a tiny code
improvement, because it uses less code and is clearer about the intent.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/vbios.rs | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 3e3fa5b72524..ebda28e596c5 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -507,12 +507,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
 
         if data.len() >= 30 {
             // Read size_of_block at offset 0x1A.
-            size_of_block = Some(
-                u32::from(data[29]) << 24
-                    | u32::from(data[28]) << 16
-                    | u32::from(data[27]) << 8
-                    | u32::from(data[26]),
-            );
+            size_of_block = Some(u32::from_le_bytes([data[26], data[27], data[28], data[29]]));
         }
 
         // For NBSI images, try to read the nbsiDataOffset at offset 0x16.
-- 
2.53.0

