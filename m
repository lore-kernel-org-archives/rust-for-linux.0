Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013045.outbound.protection.outlook.com [52.101.67.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A751AF0DC
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 05:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739944545; cv=fail; b=MiMruEMFSDQ2rFUBw15SaDCU+V9s7FGXA3HGmxBkgqvhhmFmGHhvSiWeI1q/4xv1pNV3WrUhVpP3CD9G6wcXkjpCzJn9gQDnru3gjHqf62WJs+inEvR2Y6yUiW/yEu5nc7Vhhk992j8aerkmZ7uzfcZ179wL+uUXMGThZ8wtghI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739944545; c=relaxed/simple;
	bh=6O7sa86ZG4CXRMfd6tvurM43bzfLAkMKMBi7nl/+5+8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oWwsMmosm7RyETHdgsSQSu5tWAvHHIgwsj1xsU5f6NV/1aCTo7vot+oCiY0PIMUlDKJMppXXOXQ3wRNL2CpU/feJ3UHtUZPGfYoMIc4MQZaXFfM4bR/yasf/4U5uuecT+VPEsbaSPHP8OG3mUcWWXUEcuyEPij2UQcNZXqVGQNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=EHrmcuvk; arc=fail smtp.client-ip=52.101.67.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="EHrmcuvk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IX6naT9Vrc38YkBzyjPcwW8qrG5kOmz3fAXa6E1qPcRAW/RiAB3j4UdlZeNv/zOv57qshGlqvUHhnfCuh3fsRWXRKrpVOLojlg4dh3wISZElsa3fu2lps+6+YvzFLt5lgPZlCnVXcXQrEGsJLVtHK+vCis49J3Zd60r4YzqU4GCnIJA72xEaxf25KLfbv0GcwG9cCH25DxBzGVW4ggLH2NYGxZe9CI9+Vwg/iIjRDEkQfoxQ223BOCp7eV5CiWwpHI7nySthmiDDXYIk8LLJ0xWfHQ6SKrkeqVuWhIeJV5Wm911mdF/L9vFoRM1/4dPs61Izy8JP/jota357lxMyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=favkuZfdrC4iNe4Bczkz5775H7zFlbWagVteHJ/Y1Ds=;
 b=EZGDX8M1hxvpXbu2gFSg98rAEOyN2UD/W1E5Zr/MDuZA92CTFZrKniIPXU6UjWgrU2J5LO3E4W5PpwKAtfzi01phaXQRqdKE7LF8Rs4C/ldj/SkG7FLueVdWwKeTQvV++c+LyVdg/6yJcEVOfMmN0WTHlPFIRcvekhgBnktHpu2UZvinV9TZNSwrKH9cs7xB7d7wJSjSwhbWDYh32DwuQg/aXEi1V6U6JgHW55yO5V3s9pCfV+e+kLN7IdTMllwyjS65AcvM3dd43oi8fohbMbvpHy897jHn3avmUsifd6RlBXPZZvErBuRuGEG1jNiSGtJQuoFwwrve46e/YGd3Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=favkuZfdrC4iNe4Bczkz5775H7zFlbWagVteHJ/Y1Ds=;
 b=EHrmcuvkA0wEGFyk2NDKyP5Nuf0B8CD82Ml8xWcHInuE4KcyyhAGMA6HqV1UGH0q36dp6bn0Yw0HN9HCDfRoicB9QeKDlvixyjdpEIROO5akK6LIiTicdacyJMON08cTr7VA98qBV5j2cAvUwm21hUIet1ApiV8Ih/IURdkHETUzATd/OaUykmXgA34t1z17ohhUmkGybqrRs9MuTuf7uIJVGj8blqMqt5PxvAD7eQ4za/tfh5BDJoBxrNewNEFAHrpduTUJmje+28ejRTHXLRP85YnsNc6hWUp1SIPZQ8Bo7ExeedbeB3RZJqnCVsJNidalo2oDuIoGDMn2Pn2yrg==
Received: from DUZP191CA0037.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::9) by
 DU0PR10MB6202.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ea::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.9; Wed, 19 Feb 2025 05:55:37 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::60) by DUZP191CA0037.outlook.office365.com
 (2603:10a6:10:4f8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Wed,
 19 Feb 2025 05:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Wed, 19 Feb 2025 05:55:37 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 19 Feb
 2025 06:55:29 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Wed, 19 Feb 2025 06:55:29 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>,
	<daniel.almeida@collabora.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v2 1/2] rust: types: `Opaque` doc: Add some intra doc linkage
Date: Wed, 19 Feb 2025 06:55:15 +0100
Message-ID: <20250219055516.359454-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0F:EE_|DU0PR10MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e363d7-f18e-4059-8068-08dd50aa08ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?osXbPXOoY/ANth+YsEmG8jzX4HmaKKNhV2bSR5cu1BS6c9laQRVt4xGR8Yzz?=
 =?us-ascii?Q?vY9QfEPHrF7GKlEiFXAhTYmUU+ienqQNSckeh9wNUGNegz/Lg4M6VcsTBXPN?=
 =?us-ascii?Q?cBB4VCYxDjDCjEWHzWKySkKagq+bUxPrlp2sz5qtcfLisJD38XdgLwTvFLml?=
 =?us-ascii?Q?R6OZ2KAO6oHt8OxzUygvYkdlzxN/65duzYamwvyWM8+gQyM9NGMeQ7RbyZIG?=
 =?us-ascii?Q?Wnxivo8XPn02rMqrrgr6v8WMcWYeRNHQHIY3yUMMR01L/k91DFFYUDdGx9aU?=
 =?us-ascii?Q?XPjeEOwUQTELQAVtfhQPrGm8KfyfL9GV9x2gWycAuO7g4TldStrr6B0/kP4Q?=
 =?us-ascii?Q?bUh7zh5CqN0Sh5XHsJp7ITPBcOCGlqblRT7HN9xQtd5W5m7gdL5nkLFQD2Fi?=
 =?us-ascii?Q?rgdXaSV/hlSqA/k/TcfqWsvr0Sc4z7vZchw2AQqTOpYhKsylV2NUwkESqyVl?=
 =?us-ascii?Q?rZwgeMn8ChELo9UpEMErNyCp9UTv6hCiMSBaz3hi22UDwpKZnaC3UYf7g7bb?=
 =?us-ascii?Q?bGzG/MFAPL8SUuG7rC0VocdVG9fIa6qVP8v0eALa4tbZfB+biDhOjABlP/s6?=
 =?us-ascii?Q?vYcGU4MDuKEfDvvdUHsoKOFzfJbQRiGskMVI9ak9E2L1gt/pfIyezJUIelDO?=
 =?us-ascii?Q?S9LctQpIGYIvEN+OWO+MuCnz89iZdnkVtnT08efX0eji1BUQZJdL8p3CUzTt?=
 =?us-ascii?Q?ED8JUx/mMhsOtDRu0H3f+s1d7HEKrithlwQW+k5dPr55w/W4XcsMEj5VbtyN?=
 =?us-ascii?Q?AxOFu4kZbZnZiRg8f6WHWGsUYF2TqCFJhkaSy7bSuDhCb0aR8mKfJHf6QF38?=
 =?us-ascii?Q?Vxdu2vxHT3g3GLTHVdfr+rFEuR1nFvsmYxwqnUw3w4kGAlzk81PC3hMODbRE?=
 =?us-ascii?Q?0tj2gRZibSMixsnUr0rEAc8ltgku+SKQcy0jbquAmG72lcZbu7OUCStsoBSM?=
 =?us-ascii?Q?bdQ4weFDehDkboq2NZUQ4j1WbtUVPtfwjeAj5Xpp5FdBPx+Vfm8EeOZAo8Wv?=
 =?us-ascii?Q?YjH2i8KRhhdVieMlUijsH7Dl4/AmHshugSZikVfYbd94fZHf06b4W0o3UME6?=
 =?us-ascii?Q?7RpmUm+L06Qi4OMouZ40OxfKxD6BiQtjQ2ARHfeITDblhKbMkaMo6mYPlTtw?=
 =?us-ascii?Q?t0k3zB4Sd7uRleA2MRtp14kG8eVNmCUnN/F/2swzCEfQ5TdGM33HA+RAFLLs?=
 =?us-ascii?Q?K2fQD/iN7ia8Gdr3aT1GexJl/Mg2C/ZhoGvF8Rwozi64xOuTCUw+bVoSC1oO?=
 =?us-ascii?Q?KPN5TLjMYwuWztMZPU1pb1gupTBj+IMo/7JRIk4zfTu03GB2orSWCrNHn2nB?=
 =?us-ascii?Q?POxLpZC0tJg7LqBTNqr3AwkJBxlh9tlf6nO3E2IjnXI++VNmkYXYDIfJVfU2?=
 =?us-ascii?Q?YPi2UQBTrUg2bf8bJ9QPibEJUDrzs5WTEjmW95iDHygfn7PNAxT04UsWuaqV?=
 =?us-ascii?Q?gyK3oO2KhFDZnxAsY0aPyw+rSAXaI3T3mpbIjvEzGZRRQnTBmX2kixY9gpo0?=
 =?us-ascii?Q?pT+FLFCPmlScY/M=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 05:55:37.6643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e363d7-f18e-4059-8068-08dd50aa08ba
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6202

Add some missing intra doc linkage `[...]`.

Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
Changes in v2:
  * Split out this change into this extra patch (Miguel)

 rust/kernel/types.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index c3dc798221dbc..8ed802444c594 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -271,10 +271,10 @@ fn drop(&mut self) {
 
 /// Stores an opaque value.
 ///
-/// `Opaque<T>` is meant to be used with FFI objects that are never interpreted by Rust code.
+/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
 ///
 /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
-/// It gets rid of all the usual assumptions that Rust has for a value:
+/// It gets rid of all the usual assumptions that Rust has for a value of type `T`:
 ///
 /// * The value is allowed to be uninitialized (for example have invalid bit patterns: `3` for a
 ///   [`bool`]).
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

