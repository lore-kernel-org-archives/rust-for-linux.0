Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1B83191D6;
	Sat, 31 Jan 2026 00:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820985; cv=fail; b=iRBJw/mq+k8jCf+g8MMbq/C35G+QTPzxvYAe8CQnntqG9BolttDTScwm3Gr9nDDsw+Se3LoTT06Txk8ZK7hXBaIKEJnjUp+7BWc7ywN1F4NM4e2eG3f84yl+ThebtSuAbVSl1k/GGEYQeiDzXsucLUwYlEQzVtbZiS5P6fHZnWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820985; c=relaxed/simple;
	bh=/tr47fRr3aE602gmwYYndZwsHpHG+E60Mh4AhlMl+Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WtqSoAcVCnOsJQ3sCgxqcxCXspVHLRccmBDirglsC+YgWf63+EpV1M0TQ9sH6cNIhRYMTTRAm13pBN9WWsY3+WiS7RmXPX4aqxqgsw8AYo+Eo19KvalrMrcAhSAO/aWHKK20rnemL0WvsEj69AhQuhfDE9nldBjZhtvxJ5wcwxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ca7+ryKU; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ca7+ryKU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzOJJRgNgdXdFg8EKMZrBlWcdbhfDHZO3Pw9uFjYPD52672/45V3lLr98ekc5a6ox1grCkGtX3IiL9Qbv7PzcJBCNZVgJ2YkIPCl/K515TH5LvSWsscQIhgEtjoi3vmIGNRJHjIbGQDTnYjn4CqFb1hQRHkT1rDpjjcdXy2qkUsyh0gMPPSmMgqadUEA4FLjk6ri9yRssnYO/b3ZUFNvnMJ5y6inY+XdCHdHbqf56Jg78t6WIVK7fuHIZhW4ay/4hckV8iveK2oIq8BS1rrP6nXej9V3jOjtOmOe4mXO4j4xGyGLWnYrEPXS/nX9/OyW9483LKn5vTiWvL1Oq+UBXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGtEBOnkFVerP8y816PzbmDqYjE+PQfc9wxukkKUgrw=;
 b=rvHkk9x3qP/ZaimoP34rF4VihFAFuH0GUeF1W8bAvsus+ltCUh3nb1eSH5p/IbI8bDgA/7uudYpTkHGA43DOKPmfwBai7wbamsMFBsxT3XNyrlxJDY3H/3Xkd4DGDAkRmGI0iyxGpT45ObrlS+zw7jBQ0Lrer8xF/HcWCD3GzUwKIt4R8xVHvp2Vt8m7gkrMvs1lzSR3RvEIQcjwOWrsY06Z6iANq/RsErjEwWMAPVj8dvY0xnL/PSdPw828OYOFQhE750lZjoCkx2gByFbekDmhtGrTQU1SmnZgI8buBbA+bTNWib2YOEh7lWjL64YqPb+dxka6W2goyUYcMAcfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGtEBOnkFVerP8y816PzbmDqYjE+PQfc9wxukkKUgrw=;
 b=Ca7+ryKUjuoQwn60NJl0eSEX6/otDKo4vhhSrok4uvxtnfWxvaVKzEEhzajVjTqET7nUOGKuTr/VxGedtcUDeQGfhq6vLs85kgeGY2QQoa5ylnDVWQKWJSxBoQKvGooz88ZgT7wa4SxhB4VGdZuHJ8S9neHSbpcBXlI/dtuI5cwCv4sEJ/pUUKbqWuk0CgbBgRy3siKDTlCvkuL+gqigy29C+WW8WXSXV6UDzRrd5i9QhiJJkg9+f4XUcUxxGqLWYMUPLxKmvG0w72Pn3KE6oJFkOtkaWpsu+Z76MlJQ6fwCuQkZ5Ey7fOWsYkemDk1cRE4/jq5ZYJw02ldyAsDjGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Sat, 31 Jan
 2026 00:56:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9564.007; Sat, 31 Jan 2026
 00:56:13 +0000
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
Subject: [PATCH v2 03/30] gpu: nova-core: Hopper/Blackwell: basic GPU identification
Date: Fri, 30 Jan 2026 16:55:37 -0800
Message-ID: <20260131005604.454172-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260131005604.454172-1-jhubbard@nvidia.com>
References: <20260131005604.454172-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 445f04f6-3bee-4454-5d7e-08de606387d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tM/iuLF5/i+GqNtzHVydOfT2QTk8px1OPG8MoEDDFg0ppJvMOAs0ur9nhTLz?=
 =?us-ascii?Q?virxdB835n40NkPCNTjp9Iln2MOVWShxTqKTPQEfNJiXV049XcFMmtfOi7Jb?=
 =?us-ascii?Q?gJFHdqK4wraU+X742YV+JVcq68dRHCqTH/ev88wXQ5UmMX1nv1Z1ZwOEx/Ua?=
 =?us-ascii?Q?5Zhn+UOqoxijw9oo1It1X9u/ubttxjwZyQ8qpxP+eTBJZAQ5oS8H98zezxlk?=
 =?us-ascii?Q?rwerP2GqgU0K1r17sipD3dXJyzPN+V9sZdfFdnlGQR9Gu2m6PHiyTNkZ9HCs?=
 =?us-ascii?Q?VYeqv4CHgBqMmwvezpt/NtN1k11B6OlX8DeQ0he4GSJaPtqKTQ7+rW6cap+G?=
 =?us-ascii?Q?umhltdCWmJtxhFb6HL7xV8s8x8S6xiOfRklnUUTh7kMWxttTk5YP8+OR5t//?=
 =?us-ascii?Q?UglbvT2zC6vFajT+XEqTvQv1dht/T1qwUSKtSygNVPyV/vkwrql+R+P0pRZ0?=
 =?us-ascii?Q?tLECWz0spMhC0gowaSVMFj2SDiOz+2H/ezIK/pnlGSmvH+NaGXeZxgkoFrys?=
 =?us-ascii?Q?SH2LXWP40r838anA9VGJCbz2E8WpGadKxOGSL+CgHgSe87uUPYBoAmhNistC?=
 =?us-ascii?Q?2E9WpE7tHJSzxMkZEG8jf6lJfLpzowDVhUMljK4Syu1DMtOeTz+wcN3Sr3o7?=
 =?us-ascii?Q?LsQ0q0UjA+ODeecR0EnkVNSv5bmo2Aopec8XDSoVMXRPSgOwOvwt95K7J4Ud?=
 =?us-ascii?Q?krGW8f3ogh/RcCulojM/hmIiI2v5z76CUy5WV43ihgbgxOgeU0bAbj65EuJx?=
 =?us-ascii?Q?HFzcd8RW57pP6eBDvpuAwRZP3mMANpNSjZF++SEOhYzhJEa6b76SWiqEXwbf?=
 =?us-ascii?Q?1wf4CLPSeKfTwtE3sE4MHuSoeIPRa+CEoTtBDVTgfh1lE3j0Ghvi+ZLSyflK?=
 =?us-ascii?Q?Ns4WaCNk4AmPlk6hW7qd6I4x8uRio1CHFrANvamecW8yI1FqDTkaDXG0LtsF?=
 =?us-ascii?Q?+q91jlquVQ4lJhmhgcG0rqEdD1StiCR5mTTyotzPRtYVAlD3L5eLAZwfQQgM?=
 =?us-ascii?Q?tVwNegaPoKl45z1TeSz0Q0wBJga2LIH+OGw+Lw+FdjVu15hEBepczKYnCZ8T?=
 =?us-ascii?Q?H3Zojo8WDaelAbDYIfw47Hesmalzfa3k31zpDSsB8hKeLaG52op9Qx3ML+Ou?=
 =?us-ascii?Q?WDjl22tHH7m9N92dQD3ZolvwVfQ6xSFSI19gUEN9q0KszGwl8+2pRmN7DXcl?=
 =?us-ascii?Q?Ad7z4gejbDULxU5T3QON+MfRD6DMqDGrO1oRWZJKN1pYPSncrWqC84fNVtWY?=
 =?us-ascii?Q?BK7hoAqPO3BKZpBBakS7u+Uha0IHfARqFVf+e1A71APHxRiKgvt9ZklFviY/?=
 =?us-ascii?Q?lJZTisdkGfBX7037zAhF21NkbxtWVH2rVvuV7qfGW26XRH9ccvYqddEX51JY?=
 =?us-ascii?Q?H4PEOil6pPCOUKP8QIaDSKBfxknduFOmghb4rtUP4Bu6oJdO3ch5IlXPEJcR?=
 =?us-ascii?Q?xEM11c8Y8EeIzZZBLtHLhflPtK7soV3Lr+uMbjkVUK/pvWS/4RCH06G1Okh/?=
 =?us-ascii?Q?B5xcGLE75injFjx4o9uAVmydCwV2Vnei1Rz5tYAT1z7FqhGm5tyyNoob135K?=
 =?us-ascii?Q?adIPxTN7XHVkwS0B6dU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NkWumt4psvUyYk69y7IplpqVLBIZa3eTDdroq/qgsRp5NIaQCQjk4qL4Wt0A?=
 =?us-ascii?Q?Xrz4Ni2po2+8OgF3DQdoxuci05+6GhW9oxZagjqIqDCt17ZYnEAoJxiWchGj?=
 =?us-ascii?Q?QMLGGEin/gRLqihKq8VzuqyZGsP4jpX5Q3jA+q/w5QL8S+BXWeawU9NKUsfI?=
 =?us-ascii?Q?aHwkgJpG2dDKuMtj6CZAyAbbDWta+//nZ88NR9aCi2Ot8giL2WFdG44CVMr/?=
 =?us-ascii?Q?L63wRv4ghkIRjAgaYe4nJvZVqkk43PBW9RX+H9Kk7vZzbrARuOt8yGN4sO4U?=
 =?us-ascii?Q?A7J+7eFboSVbcyjaVMbvTYo8uZRK6Q1jNLM61RIoSayt06fgmfYj7EjdoXyf?=
 =?us-ascii?Q?kS2JPm2NjalwSRzjie73YC2pnGrdoTmbZvviVj7/Ns9bR4Lzkebq71AUwakg?=
 =?us-ascii?Q?uxEi5L4AYCAdQT6iiE5+lo/tt8T5GFWdrOm0BpzSjvn18ZjOBWQyQvVAY2SY?=
 =?us-ascii?Q?AjW70XBfbjHAhjS/ISZwhOZLz4pBHQXDcXIxOOXf54qgn6LeRcdY+1GiTmlr?=
 =?us-ascii?Q?OEEdpbhZRew9vjhCrRaJcEsCrYRhHL5Bd2TABkNiOirFpmdBSmhcZrsNiGX2?=
 =?us-ascii?Q?B9sgbLXOfHC/5XGtmChQvaFfdb8R+dD6NHWo7ElMOD838h+COxd8o1oMqjlf?=
 =?us-ascii?Q?E4kfSfgAlNq07L6Vo8mJb3mq8YwsYCInKqFpCIMkW2Us12UAPHa1BvncbQqV?=
 =?us-ascii?Q?NkFwA/0rysvD0E9jfeowULla7xM0ApHpdtUA/vbrj33t++Z0H/A+LqHOEns8?=
 =?us-ascii?Q?ygUjvG35ll/FsEfTCGM0F+t/SeG1V7s6q7tv5S9eXG8bFUcwFV1FvWwBBOF8?=
 =?us-ascii?Q?dZuaqD4SBEoj8evV3PtSrQpcS3QtMwAYTG3Ijxm19kjGGv1P03e83iNSR9Vn?=
 =?us-ascii?Q?nOLumCMO7ptBlNCU/k3DEsKfxuS0yYEGoFk9hsZ3oLzCy/jKaspe7Ij6ETfQ?=
 =?us-ascii?Q?IpmjiR0pPIJb17Ktl9G5foL6uvL1AORk8vEFb29hkDjwnpcRtzY66DZiniyB?=
 =?us-ascii?Q?O6VFssz/cldJsg8XkozjSHXolDjckP5CxtSngAO8mp7EsZ+qF1zyz0qKaLp+?=
 =?us-ascii?Q?o5lc7MjZUo/dFPyM9sern4XYaQjWSm4YK523fcsbS5cfIdwiPqOf/eJKJgYI?=
 =?us-ascii?Q?YDGv6qrXB+e+tkY5w+dwq0DhdDZYdIdsXCRIINc5+TSgedVQXkFcS4o0zDlv?=
 =?us-ascii?Q?6cHd7MVvO+6CnTRFHu/IrG2gfWAUbKbpi3mOfZqITq2Ga9z6YymJFssfWBh8?=
 =?us-ascii?Q?C1YUDFjzK0KoVSAdej24xqraBHvzNn6wC3GpJ7uJXGiGJt2UfD4fR59nUlR8?=
 =?us-ascii?Q?m6RtwvxjIxopMVhupH2JZXeoLtscTpgQbGw21dfNZao66+/KuGYsOGFBAbL7?=
 =?us-ascii?Q?RhCjA88CBF4NHbd4/jpwAzZdSBOLgPO3esJ5u4xZMVrBATX+v5dKnhnu0ESM?=
 =?us-ascii?Q?tbXtW97XDhglge3kFGWZw5j777wnRnQ55t1jJa8khjzFENsCYNpkYcwsMGkc?=
 =?us-ascii?Q?Sf4PhI9VcBMC/SAdkyxkubwwfkQDI3g+tWjqJzZan1IcB1dQH6dRVkWp7/PR?=
 =?us-ascii?Q?sosJSPPw7DdXTlGdqIdGfmlAW6GDPV2/XOTGTMjhhSFEFCvQZah6PEMKHrzT?=
 =?us-ascii?Q?k69FUM4MyHT8NkqijeU3GJWDR3beIjBR2v1++2rkXJcDyNeSMhv8qXIC9pZ1?=
 =?us-ascii?Q?r3chEJYWyB/m6s/dVZySBBxRqchJBGVfCCgQ3qvDndS86X6odAu/DtVkaHb/?=
 =?us-ascii?Q?Wjf199h6aw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445f04f6-3bee-4454-5d7e-08de606387d2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2026 00:56:13.2704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WVxtJZ7U3bDdhfKkThfLWo6p3n2nSClcbGbZm6vZABvE06TAPLD3YTlaTIE5X3H/DnGUxTINAXvehJJqFkI1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945

Hopper (GH100) and Blackwell identification, including ELF
.fwsignature_* items.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
 drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
 drivers/gpu/nova-core/firmware/gsp.rs | 17 +++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          | 22 ++++++++++++++++++++++
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 89babd5f9325..444c95fd4ece 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -76,7 +76,8 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
         TU102 | TU104 | TU106 | TU116 | TU117 => {
             KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 | GH100
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index aba0abd8ee00..71fa92d1b709 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -34,8 +34,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
         GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga102::GA102_HAL
-        }
+        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index beabae9a1189..a529a5f1c3ee 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -224,6 +224,23 @@ pub(crate) fn new<'a>(
                         Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_tu10x",
                         Architecture::Ampere => ".fwsignature_ga10x",
                         Architecture::Ada => ".fwsignature_ad10x",
+                        Architecture::Hopper => ".fwsignature_gh10x",
+                        Architecture::Blackwell => {
+                            // Distinguish between GB10x and GB20x series
+                            match chipset {
+                                // GB10x series: GB100, GB102
+                                Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
+                                // GB20x series: GB202, GB203, GB205, GB206, GB207
+                                Chipset::GB202
+                                | Chipset::GB203
+                                | Chipset::GB205
+                                | Chipset::GB206
+                                | Chipset::GB207 => ".fwsignature_gb20x",
+                                // It's not possible to get here with a non-Blackwell chipset, but
+                                // Rust doesn't know that.
+                                _ => return Err(ENOTSUPP),
+                            }
+                        }
                     };
 
                     elf::elf64_section(firmware.data(), sigs_section)
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9b042ef1a308..289785530ad7 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -83,12 +83,22 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
+    // Hopper
+    GH100 = 0x180,
     // Ada
     AD102 = 0x192,
     AD103 = 0x193,
     AD104 = 0x194,
     AD106 = 0x196,
     AD107 = 0x197,
+    // Blackwell
+    GB100 = 0x1a0,
+    GB102 = 0x1a2,
+    GB202 = 0x1b2,
+    GB203 = 0x1b3,
+    GB205 = 0x1b5,
+    GB206 = 0x1b6,
+    GB207 = 0x1b7,
 });
 
 impl Chipset {
@@ -100,9 +110,17 @@ pub(crate) fn arch(&self) -> Architecture {
             Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
+            Self::GH100 => Architecture::Hopper,
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
+            Self::GB100
+            | Self::GB102
+            | Self::GB202
+            | Self::GB203
+            | Self::GB205
+            | Self::GB206
+            | Self::GB207 => Architecture::Blackwell,
         }
     }
 }
@@ -132,7 +150,9 @@ pub(crate) enum Architecture {
     #[default]
     Turing = 0x16,
     Ampere = 0x17,
+    Hopper = 0x18,
     Ada = 0x19,
+    Blackwell = 0x1b,
 }
 
 impl TryFrom<u8> for Architecture {
@@ -142,7 +162,9 @@ fn try_from(value: u8) -> Result<Self> {
         match value {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
+            0x18 => Ok(Self::Hopper),
             0x19 => Ok(Self::Ada),
+            0x1b => Ok(Self::Blackwell),
             _ => Err(ENODEV),
         }
     }
-- 
2.52.0

