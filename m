Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40964155A2F
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 05:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741152902; cv=fail; b=M6vHcYPI5YpVVYFms+4R8PtRSQ4gkrXZvSDHWZHEEH7O/S4XDyHxRT712ztpRz+lRK1/OVKkJ2oSURmWPbbLGT3a9R4LKE1rqnJMTT/mWfuYjIt0jOdVjnjG8bXF59XgUPHqqC77Gu59nEHWpbJJ3pPYxERbq7gZsTZmNJP1NQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741152902; c=relaxed/simple;
	bh=KYFvxuqo3MDQQu4/yKmMr49VHYERetRYoHOtWA40qds=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ITdt5mlsJSrumf3jnn6PFIFETMzkgRmXG4IBu42xgFvMUVxc1Z+EkyygvgTnCOjjbXTcJAj11a6PRGoC8pl2rnRMvt3zsMYKq7CrILjUf52GHCbP4RooKVeBAJ/Uqh5LOvU3De8zCsjBMEvI7hTDGfUgfSdpU2JKLLW5UbwL7mQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=bvIVzokl; arc=fail smtp.client-ip=40.107.20.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="bvIVzokl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPi+JoSsuVFf73FLlPbfup62W6WJWcbIe2bjZBR3kISXRQm6Rzjr/ctvxsRYm0E10Kd+klYeF7LFb6E0m1VfrFtcsTTJji4j4Q1tuzwIB2Zh/VV3/nfd0NdCCpBHY3+iEdYKguhox2TM4UBjU7e8BzxijrxRV11mERD+l8iHMP/eP76I2CSPNtpUk67X5St3kNMQdR41EfGPsZOzAIDwuyPZI3800mQOTQJtYHvkePg4TjSKWGxT0/vTzKUAbs8j/Dybx5jgu8yywmRJoPCy+DAfaNTnxGiGelsT1+9egoPPDt4f6lmciVyOwG9n+q2l4s6EzbN+eBZerr2XO8YaQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKYMVcPOss/HU1UHSHnRRcGzTgOzPAfVSOIpXkBZaHs=;
 b=ebZ9uaCnVFyrCAby2//7nd3mT75SZ1bR1S3rUlh9YL2hJxDfz+JacFjq9V+9pZETW39CpZDl4L3CUs9m0antHpUHIJkPPh00TWT4/oz894aJ7ms6pEENh93AJyFapoLcXR7yi2NUZB+fXcUQCnNk82g+vtbRdvJ/3oiH39zvtCUMN3PHoUJlEyX/r2HsFCHGOuraxJbpk+Qa0F/6ESzryg8QK3IGr2UyISKi887DCP12EsFHt1Uor1FAUpuvzLoQdYAUXC3vMMweyPLYJdpWYoArEMkd1KSjIAMSEEc6rar34yWdi8IcQRJhoVVQZ970OG0fMZZS6i9qpPUpyvhj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKYMVcPOss/HU1UHSHnRRcGzTgOzPAfVSOIpXkBZaHs=;
 b=bvIVzoklQeD2wpRcKXPfRQlHsYIIveCrGC8jltGXMOSDEVE3f9MmCFBEkxm8h07zpzah3US//6BA150ztKzSrwalV00LbIQDwkgtfoq0AiZ9ODo3lrwqU1TAYGbkTEMnmOCe4Fs2SilUPci4r0pycKra9frs0EKnW3oeeUZSkJFxic5DN7KGEyy2nTuDibJW8DPZPPdjuDcqtN3hrVeNf5RHSlW2wy4jGRLkXfWc1R4fG0impbVM93oCeqrtRfMK9jNqV3DBfvWwlgkPmGPiWk2MGFw+8lPyoQVrl9BjFYsduZKRE4+lfG/R/iuatLvY6V/vEWpX01sxJRjpY6kN4Q==
Received: from CWLP123CA0038.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:58::26)
 by AS2PR10MB7712.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:62d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 05:34:55 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:401:58:cafe::b9) by CWLP123CA0038.outlook.office365.com
 (2603:10a6:401:58::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 05:34:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Wed, 5 Mar 2025 05:34:55 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 5 Mar
 2025 06:34:48 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Wed, 5 Mar 2025 06:34:48 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>,
	<daniel.almeida@collabora.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
	<gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
	<aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: [PATCH v3 2/2] rust: types: `Opaque` doc: Add some destructor description
Date: Wed, 5 Mar 2025 06:34:38 +0100
Message-ID: <20250305053438.1532397-2-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
References: <20250305053438.1532397-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79B:EE_|AS2PR10MB7712:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef4fa48-3877-42f1-9006-08dd5ba775d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CAAqFUW099/Z2BX8gcQ3tqY6ulHQn/8D/bnV2JBFu+DQqt238ZVDwcNlWb4f?=
 =?us-ascii?Q?R4TUjQ7/F75Ik/+xsVBSiiTTosDlXRBsvLLAaMC0lq/VUmfVjzvlir+JVszN?=
 =?us-ascii?Q?exuFUad9XC4gvBTzRsSaVrBxYtWQr3YPdfbxSu5ApDIlBNGMCdwqqYWHY/xA?=
 =?us-ascii?Q?FItKcWeuheIlBc6XAFHHV+dKNJWRSAL8Nln1h0HKRebgPKCoLSAryM/5gJD6?=
 =?us-ascii?Q?A3/qZEoKINYDabZTRtEhUGMi2sqse754ROLTjc031IVLo8kWupEgivGNf93L?=
 =?us-ascii?Q?cItDfFphOHkd4RdEI36kKe7GAn9HVbOF1zjMHPVAK73jhufMcGTAijfExeUO?=
 =?us-ascii?Q?w9uBgD2RGyX2CD22qC7Ei8F9ajoK35anQ0Fk/5f00dpUc3zYAfMKcUY2pnMF?=
 =?us-ascii?Q?xVRcx1mTyLaS3Me1jpJZ9UKn+OPUbwDfT+QRNJfZmurIikUsbkcajyz9iVQ7?=
 =?us-ascii?Q?asurUrhAMrR2UBCmzcnjqPA+CM48YIBQTmQhE3sxO+JnzT/l1Rp9jmwUTP1G?=
 =?us-ascii?Q?t9oiWIUIDapL2B/3gsjG+AyF3u0s9VLb6rRVVt+h4J6sd3DPnG+/n6/k3Zh3?=
 =?us-ascii?Q?ZS1LdLoeSgILo0ixQT10yZJYBZAE+cJ7IpzlTmuiJedgwAvTb0mTIsf7gJ7/?=
 =?us-ascii?Q?3fcosA38lnlnUD8LJAWvGAnrEb1xudRJ71J6oxtBALDpdFA2tpUEftmdsSgb?=
 =?us-ascii?Q?rC3QaU7idVE2cLQ04DA7cD5pwoLnVa7OIJ4HDfP3MiD+wp0lYpFQe4sWthm5?=
 =?us-ascii?Q?PeaEEjJDIgs8gclYGar6ultMBd+Zl4Z0LhIkcv+HzFVSh01qODUVUtDQBOdd?=
 =?us-ascii?Q?DP77/FVs5JgAfrGKzlTgKqoZ/lI8+2NvF6ffH57b4iLSNzZjL62mZ7F2+s3b?=
 =?us-ascii?Q?erDWXpwQ1qzrMkcLVDkppb6YAFlvkD/UsOPqX5/izNKgRpiyBwY+PwdZ1RHq?=
 =?us-ascii?Q?7mJ3CAA68JinHGlKf6j5fAflyp1E3sSX7XsE9BZBd+Wc863ZoEvPhU3dj6w/?=
 =?us-ascii?Q?uc1sffn+DYjIOOirQq950Neodo0k603xDF6O74BoGeZrrDu+mdkp0H7igBNI?=
 =?us-ascii?Q?PvMD9vMLjhxIsujgPbHX51UEppM65/ERx3g3nQVpUa7oWcM6b2WH2KEhDpI7?=
 =?us-ascii?Q?O6YH3AyMtEJkj/y8dGEbGGy8Gp1Oe2aVmcEwP9Zcw2LyZ1uOnqfbYQ1wqV2O?=
 =?us-ascii?Q?l2Ylh51ILn63a8Kp6vX1UTyOSc46XmMIUlf+U/blQpogCOufmBTE/zplUVn3?=
 =?us-ascii?Q?cJNJRMIIKd5zOtIdH6ayoRSHL2HlJto6rR13YlRvFyo2P4Y98Fr3It8luSm8?=
 =?us-ascii?Q?gKtZC6ntiWj3FpJ75rLkOWZjAepWm6Ck0sChr5/3LeREH8PcPHfeYONZ9ekj?=
 =?us-ascii?Q?r/8bGNgsVczfcoumd2bk/x8aYpzvlggOtzsHivRQdmvY/utPyY+lgB8GmLFD?=
 =?us-ascii?Q?C659SFmYQ3tC+3OApIFk4y4EhKhMKX1pJ8GQL2yDVpEtIgFZx6oB8RhGWVyO?=
 =?us-ascii?Q?Y3eBESagujuG7E0=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 05:34:55.0580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef4fa48-3877-42f1-9006-08dd5ba775d7
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7712

In the discussion [1] some `Opaque` documentation updates have
been proposed. In that discussion it was clarified that `Opaque`
is intended to be used for (partial) uninitialized or changing C
structs. And which consequences this has for using raw pointers
or the destruction. Improve the `Opaque` documentation by adding
these conclusions from that discussion.

Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
Link: https://lore.kernel.org/rust-for-linux/F8AB1160-F8CF-412F-8B88-4C79D65B53A1@collabora.com/ [1]
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

---
Changes in v3:
   * Add the "terse" proposals.
   * Move the non-linkage artifact from patch 1/2 to here.

 rust/kernel/types.rs | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index af30e9c0ebccb..f370cdb48a648 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -271,17 +271,33 @@ fn drop(&mut self) {
 
 /// Stores an opaque value.
 ///
-/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
+/// [`Opaque<T>`] opts out of the following Rust language invariants for the contained `T`
+/// by using [`UnsafeCell`]:
 ///
-/// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
-/// It gets rid of all the usual assumptions that Rust has for a value:
+/// * Initialization invariant - the contained value is allowed to be uninitialized and
+///   contain invalid bit patterns.
+/// * Immutability invariant - [`Opaque<T>`] allows interior mutability.
+/// * Uniqueness invariant - [`Opaque<T>`] allows aliasing of shared references.
+///
+/// Further, [`Opaque<T>`] is `!Unpin` and will not run the drop method of the contained `T`
+/// when dropped.
 ///
-/// * The value is allowed to be uninitialized (for example have invalid bit patterns: `3` for a
-///   [`bool`]).
+/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
+/// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
+/// This is useful for C structs that are not fully initialized (yet) or might change their
+/// content from C side at runtime. [`Opaque<T>`] gets rid of all the usual assumptions that
+/// Rust has for a value of type `T`:
+///
+/// * The value is allowed to be uninitialized or invalid (for example have invalid bit patterns:
+///   `3` for a [`bool`]).
+/// * By dereferencing a raw pointer to the value you are unsafely asserting that the value is
+///   valid *right now*.
 /// * The value is allowed to be mutated, when a `&Opaque<T>` exists on the Rust side.
 /// * No uniqueness for mutable references: it is fine to have multiple `&mut Opaque<T>` point to
 ///   the same value.
 /// * The value is not allowed to be shared with other threads (i.e. it is `!Sync`).
+/// * The destructor of [`Opaque<T>`] does *not* run the destructor of `T`, as `T` may
+///   be uninitialized, as described above.
 ///
 /// This has to be used for all values that the C side has access to, because it can't be ensured
 /// that the C side is adhering to the usual constraints that Rust needs.
-- 
2.48.0

