Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013011.outbound.protection.outlook.com [52.101.67.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE742E336D
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 05:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741152900; cv=fail; b=MGZon/4F9Svgt4nV3CjxIPAjdpra1k9rN9GozuOIfMnCBRbid8Q/Yv1rNHvIZEkXLAD62rpddQl/LP+zVMpnEab7aOk9BJNPpFUVQcjy8BFC5lkYvpeN2VtoF4PEHdp1orw1jT9MITbUvUfJUunFLbJ6r9MmehZ6iuq0ToIQegA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741152900; c=relaxed/simple;
	bh=Zi480JXEhj8YZEZSglkBXzrAUHr96GOclLZNsL7EXWQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gOI9boysZo/a5FjS/gApn9BIVSIbKXHjHct8DlH2oY+xkT6XfJf+GKyBwenWT2/e+77G+eGaN6lTUz0RjJnIAPaL8Cu9rH3O88ZjTGup3Q2qldPOjxoha3d8YbA2uq/n+4tBK1o6bb2iYSW2geMyMBoUNQ5hr9W9UtWAoPrg8Ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=vNxrsa3Y; arc=fail smtp.client-ip=52.101.67.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="vNxrsa3Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGfJKS9FHKVfqnUoQgMO0/opKF0kdAYU88KVUWUjV70ES0lflnYMInPqraS88kptd9aV5yk3UIc/Ue0THp1NIvMfQ/bjrg7v7GndLIzpYmTS8na9ra2zwcFez1WElNbPP52Vd7mhLaP5JpW1vjG2bhFTA0eJItCK/Z76sZhI48cgWRYNeTDgR1dnO4rkp4OlJd7UuteCAQv5M2q8KpBN1frWvGBGb1xa6znQm8clVdbuLaev1GxbY/g9Oo5w/YNnqGhZApR/75lJjjzMyWTPA10+XBZaz59Bf1I3lfsKlH9S4iaQqwvT8n/3yByPd1U5SXSvtMKT0VXdFal2b95R2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kaxJ2T0AD4Mu5qw6jkJiKctWX5TKN2XgZf9cQzDbGY=;
 b=qtPkwrAjtTPv+lru3kPVqUmfYLS04yOrEOGIvlQURYXvcBE5py0RpUgY23OjNcza64pwV9McRTrc3UX3IsRNE5EugEZEiEm4JptpCTGyglFV2JJrw9aJIROslGD0RKzVgGEG5ZFsEyf0Q3qnXZ7xjWuQhV8bfsHv/gaWqW4vNCpppWhxyF/gAA+MtrgxDyxxhMA8CddOJS12RHFHKCT/vRPUbM5icHqM7c1gGkCzphKCF9zUGolTAAkdMLxEYX+XNTrFXsfWTZ3p+eDUQnEehfw8cB7/tYap9IZL7RUC0kxz/9w2MlATJc8Mf/F6X+wEN3uMaZNQNR7LuHToBpI2hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kaxJ2T0AD4Mu5qw6jkJiKctWX5TKN2XgZf9cQzDbGY=;
 b=vNxrsa3Y+xcius0ouyBypK13kTu6XMYeudSBy7PogzpeWtN0G+BkBzzumBRU23gOWWEYbqSW+SQZKoMknkbcZ5X/IuFU3Rl3XwvB2vi4NufMkXjFwdYDK+QAdYlWCSwQrrIRqCKA/5VQpSkxPOZ4NqehuRr2Mh+nyE1DD8C1AAouI4GT6tJDoFfkZPTMdxTQr66ai26hXkHdxTUWB/sMzP6dwrrbnIh9ggVvpw5fCm3k4Nf+KQOuaQHnfYdtRaNKLkOV6b9rlMNWUl8mk8zRHoIxMJNYrexbv5ZCRP3MwPumlrJj9Jvw4UTc2K35wonKvJzMqMoKqhVPNjFGPjgdwA==
Received: from CWLP123CA0032.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:58::20)
 by DU0PR10MB7025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 05:34:53 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:401:58:cafe::2b) by CWLP123CA0032.outlook.office365.com
 (2603:10a6:401:58::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 05:34:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 05:34:52 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 5 Mar
 2025 06:34:48 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Wed, 5 Mar 2025 06:34:47 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>,
	<daniel.almeida@collabora.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v3 1/2] rust: types: `Opaque` doc: Add some intra doc linkage
Date: Wed, 5 Mar 2025 06:34:37 +0100
Message-ID: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79B:EE_|DU0PR10MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: dc808ccf-378e-4dbb-5266-08dd5ba77455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SuzkZBLASX7DB/sf6RCNRsSbx48mNvcPopVPihCBsT4A+4eYqyWpUWC+fCSI?=
 =?us-ascii?Q?/a3Irp5oCc+u2rg6sXCLutMxT/f/+2ngtJSTHmG87EiFyflkdgkaucy8aEun?=
 =?us-ascii?Q?9050ZQDn8eHQ8JWoC2yYN6GH2TpEIknX/hq0Og/EcYxRswSJ4o9Zzs40KGwg?=
 =?us-ascii?Q?4e44p6WmcdDI0fA5snK8onG0SuQFoxxcNGqqTu8s8UCaq7ZCR8dEInR8tyTR?=
 =?us-ascii?Q?cCihMmtcBM/4TdcIwEdvPOuq8SD1BR9I9jx+7H/05ul5PCanmtQCiMAM2QzC?=
 =?us-ascii?Q?6mm7taFuj8llTdhBcVOtrWooEseguu1ycCf4VHZgdVjn56sJsN+uRVTbPSij?=
 =?us-ascii?Q?bPGn4teGOhyIhjHbI4dPlGEDzkgISZN4mlEH2CcBHz5wHRI23n5q83P2cFKB?=
 =?us-ascii?Q?JGe+MgyIM9IYOqbkev/w3QDBHOBWrwS6+rYFYFuSL28DKvoTTe2j2krtbHKm?=
 =?us-ascii?Q?Oyqyl1kn370OCiHUckskaRzIO+k1hvW0C9U3iDxZbmCOp2xLBSZmRQcRGCeS?=
 =?us-ascii?Q?QrQgXL9JIJpXtET7HLg1Fo/p1F+s2HNENNg8T4dulYU5d5ahH2aX4Rgq65PX?=
 =?us-ascii?Q?pKzfSCRtpG0cXZPC4w8/zRZA72yV2q2YadcP18BGJY+dyXdyeJAFxKmLmtiC?=
 =?us-ascii?Q?wY+m3Dm8tZm/+FaK/pywdJ3jzLsvpFkJ1KCYeDCIiLu1lrDpKU5WZ9Q5Fu5t?=
 =?us-ascii?Q?l+Q8vEXUraBvH2g6hfYbInV8L2WBCedLLXqmgmEM2kwudLK3uGHN7KlQCty9?=
 =?us-ascii?Q?Ev5ANBcgCFpizq8eqUpCLi1lt3v1SFzj+JIQcEM59ibg+I2wo9gbxlWkxxXa?=
 =?us-ascii?Q?FrBCODi2/dFbkKE++xRA7mptHL793/5WnVwc78TdhenDa8qcalIrOePH2yJV?=
 =?us-ascii?Q?xRXuEK3ZEQJiRJ5MAHryJBY8iDi6eIHXUBgg/B6XS2W+HhP66qYsl1zVhvFM?=
 =?us-ascii?Q?rvgdKuzJUl8DozE61H0w7Y24ZFbpptlvl+MPEPSvZShFxKAjWEGWPS+kluSo?=
 =?us-ascii?Q?bb8XQIHbeJEloAP6B7aqsBm/6O420F5zLmUNrZ0hvs/4f7cxXaSZ+vdGuZMd?=
 =?us-ascii?Q?6Go7DcNHom4WDAzPAHdud3ikYyVTZr0jjhB1gRxbWW1V/Ru63OmnHvH/GtKo?=
 =?us-ascii?Q?rywCkRkZ+qsDD9q3L6u4eXOxuFAerPTToyMCa2J0V1BaLXI3C2jv/if4IzMN?=
 =?us-ascii?Q?qdYDrAt/SC2n8jvFzPzL+do5PW+QNFc/Y6qtC08ldvOMTKhlsnvtQUW65zmD?=
 =?us-ascii?Q?63QhX5cWb9KSfPZgQ7+nt1CiU3JEyo6G4gNGheB+11+T2o3Jvedo5m6jbsf4?=
 =?us-ascii?Q?2/Yo4vSyZOSnutx0RIS2WrO/58ngthz7sSAuv/uBc/nt4NGJbJ23CUspHfyc?=
 =?us-ascii?Q?Lu9RZ4Et9F8xOuPZwMF43nRwUlZxQJKuWeCYNo8yc7as697B9I1HQoQBVTcp?=
 =?us-ascii?Q?v15wdnHyM/eI2l3qHKVzZ+e4WvZZ+t9EXdEYyOk1rP/HLWzqslV5pocT3CR1?=
 =?us-ascii?Q?EyIzuSUCeF0KBhY=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 05:34:52.5268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc808ccf-378e-4dbb-5266-08dd5ba77455
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7025

Add some missing intra doc linkage `[...]`.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---

Changes in v3: Move the non-linkage artifact to patch 2/2.

 rust/kernel/types.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index c3dc798221dbc..af30e9c0ebccb 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -271,7 +271,7 @@ fn drop(&mut self) {
 
 /// Stores an opaque value.
 ///
-/// `Opaque<T>` is meant to be used with FFI objects that are never interpreted by Rust code.
+/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
 ///
 /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
 /// It gets rid of all the usual assumptions that Rust has for a value:
@@ -286,7 +286,7 @@ fn drop(&mut self) {
 /// This has to be used for all values that the C side has access to, because it can't be ensured
 /// that the C side is adhering to the usual constraints that Rust needs.
 ///
-/// Using `Opaque<T>` allows to continue to use references on the Rust side even for values shared
+/// Using [`Opaque<T>`] allows to continue to use references on the Rust side even for values shared
 /// with C.
 ///
 /// # Examples
-- 
2.48.0

