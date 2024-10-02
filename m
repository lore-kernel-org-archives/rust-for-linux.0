Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2047.outbound.protection.outlook.com [40.107.103.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCED214A8B
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Oct 2024 05:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727845403; cv=fail; b=dHW8HLFM8THjlQs+YaQ5rpTxHRt+hxpHCCxowQAxUCmFDJz4zxSAaDu0N5MIDWkVW275JMWk5bIb9fgTGcI2qj0BwFAmFSfIfrjJ7H62FAvj890X/M+I3dARX4iMarMitZrhUJrXwrYBFUogAdTXfcCR5ZVk57du9+qgTVjiLOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727845403; c=relaxed/simple;
	bh=qx97/QpbHuVfoLUCfSozw4BYa2AcYvkGbvAb2/HnGF8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AlAFEtuNd09/I5Juy85jD9ztDJ37TMUAZGvNJHf/H7+KISEum8L/mNmZOYcg/qugvdjk/5qe8Mh8lxuaz4Dgov15TkugNR2TYcQ6AGP3/5O5AFH1nO23rZgGhfhj8Oio3IZQXwFZmSkmzU0Teeu3uE1fdb0ZMyINtjVBSPfpKsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=gODx1/GP; arc=fail smtp.client-ip=40.107.103.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="gODx1/GP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o1qBSkVMDUKGrQYY4YSqcSaVbFPU3PldpBBt2LRrfJnXW2ggg39Cz++1BIc709j+N8rmeg/9YL7zjXmUTtjN8wmNDV5/pDs09W6D6KpNj3HaStrLS07BBnNRr7C+8foNDxITBHjLtz8KuGs16wkAvj0js+b+AkZmU4BEH3txzAqnxl9AQL1AB2hNh0FIeygEJG85qlYbqRGKkBtthy+iISz64IPo1UiY7zGFLR9zkCGZMEWEPmVPsgybWIy59nankQHR/I5X0C7P3q0+a62aMIadXiTpEryfbBF900oP4DpIL2+DdeqHa6Mehs+7nsz7nvBaOf2jpjKxYhZZ0rmY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FX+L79fg4m28QRb9bDrJrbEiXhb3nI5SrK2zB89uXDk=;
 b=v6vZXVZpR4qyH6C+eijttvA0dPdN6Lhu/NpDfU5uUYTBkjFARhsfY4TRvPOc1Yc7MNzwuwskQ8SphnSxgs+um7Dpf6KEV4/Uh2dE/6GOYQljG+sYvY0MXlshQYdFh3iejTI58qbnV3ccktwipNGknGZVb+9DIhlnuuR4On/0FBaFHegj5QNrxRkKfl840pe7lO+tOEY+GZCAsfWPfcR1yBV4kF+06wLwB/uOEaabA1F8J0k7P8iCJVVIYhivqGP3W/4DZBM/bP5RvVE5tsimeQfxTzMt1PG0WQeU9B+Zc6vC1QdQR7h0+mgKnzDi8X1GuxYR8ainCbOE/IzMZuExcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 139.15.153.206) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=de.bosch.com; dmarc=temperror action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FX+L79fg4m28QRb9bDrJrbEiXhb3nI5SrK2zB89uXDk=;
 b=gODx1/GPRzVo1S4NbqFermiLgS7yj5DBZRxgecThXmis/P2NiRZ9UbYV23OpNW/Xcmvok+M327/Hbrz7MW+A1hnfT7BWtQbGTA9FrtLWk38oA5tl/2qekhPpgIVwW8PenUnKrlsTMtECuDucPbRhQYavzRrMNiqFVNC6wbZzL7HN8Sb7gNgTzpcfVPoPi1jVsAToVbnQGpXdEv/AVO8JnbY3aF+Yak3vMCEv3nvl/9zKkdum7/Lt2L6jbB936C24Je0aPqo38Mmv9gb1AbNN7VJTE3tGrfkvihf4Gfj8NT5A3ODlXvj7JJ2ioIhJ0caPTP9TATKgIPoHVC46iOUCkg==
Received: from DUZPR01CA0208.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::6) by AS2PR10MB6566.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:55d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Wed, 2 Oct
 2024 05:03:17 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::29) by DUZPR01CA0208.outlook.office365.com
 (2603:10a6:10:4b6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16 via Frontend
 Transport; Wed, 2 Oct 2024 05:03:17 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 139.15.153.206) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=de.bosch.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of de.bosch.com: DNS Timeout)
Received: from eop.bosch-org.com (139.15.153.206) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Wed, 2 Oct 2024 05:03:16 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 2 Oct
 2024 07:03:08 +0200
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2001.de.bosch.com (10.139.217.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 07:03:08 +0200
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>, Miguel Ojeda <ojeda@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>, Nell Shamrell-Harrington
	<nells@linux.microsoft.com>
Subject: [PATCH v2] rust: types: extend `Opaque` documentation
Date: Wed, 2 Oct 2024 07:03:01 +0200
Message-ID: <20241002050301.1927545-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.46.2
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|AS2PR10MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e415d9-a920-4161-1d06-08dce29f86b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?52K+wWRu5tTNcv7kYrJlHxC+Qn+q/btkG80F+ELV4Y6T4pK31si62w8P+30j?=
 =?us-ascii?Q?VIQfrsbE4bYTQgcO6p10mzP0syvdVHvTFeWTTB46+HCBRdbrm2NqhEz97n3h?=
 =?us-ascii?Q?rO56mUjvOTEZx5tOloK/Gn4ag44ruoXj8e1qQ0B4uBh0JT21x7HlP/QCfpkG?=
 =?us-ascii?Q?nNC3CQBSBt+GdtxtKWtX/m1ng4Lob4KRiG7l9w2kq7Et/EWs0NxauoOJ3hRc?=
 =?us-ascii?Q?/DuDDEN+elb4yqwy4XDW28Rtqkbgxr30BsENST3KcvN2A21SxnSEDhx17lp2?=
 =?us-ascii?Q?FQo79T3/d+9OSrj+nOwFd4IQmuKuHDVfcUVQ2yh9C+0bBnmxdGqRxt9gU+Zu?=
 =?us-ascii?Q?J3Mll6DrQ1vCq5YA1UiJ5Bqd8FGY2HeznjmSnBUX/z+sUpgcIaNi3dyuo8/d?=
 =?us-ascii?Q?Y9f9hEaUxHYYZLwypgAxM0e3UbPUBl0mjWbB1RuL65v377CDTBHOA9jbpzts?=
 =?us-ascii?Q?7Ca6kpDV0cvLMhXhAjw2bBKkhvvnFEtCBhPWtYVcTg5MRc8E0zqUJwjsL6Q5?=
 =?us-ascii?Q?QSGR6tLGI3vwj/OodPOZzuc8g7pr5pfxCSuuMgiFni3KPIkUiAJJbdqZQ51R?=
 =?us-ascii?Q?Phwz7qyJfJxrcC+IQGOfGrUaRTXEklBVRWLNWToJDaf3uj9BPlov/UVCGonf?=
 =?us-ascii?Q?gXGUsuRu/OYAR5NB3aqc+TeZyU6W4jhQsuB0eJGcDJ7wKZ64oWUgu1oV3F2w?=
 =?us-ascii?Q?FlN9ZKeGe0bnyhpLtKbke9kxLZc3Y4sDpdZm8C9wNt8pGueLeGx/kU0c1v1E?=
 =?us-ascii?Q?U3LOlamvw0tOa8iAmJQg55iqJWJTd+7rWyOq7teImd3khlM1PMs49sMBDO3a?=
 =?us-ascii?Q?ILzY10rq2N9bO1KLziLRkuNMbKK2JxcLDg8mD5FXWJhtgtM2d9vHf2f7dheG?=
 =?us-ascii?Q?SuId2PDSixr6BWnEQY7IemQsUZnUMcUGRjR6cUz3lzulc0GDcvKOzZPQI/MA?=
 =?us-ascii?Q?+30mp+fIyFzm+bl3Vt2kQuCRAKC37K0eqXYnLrGcGArgpVp8iL1mquX2LBxd?=
 =?us-ascii?Q?Aq6ONkc2quuDwynhi9414DsbnaiTJ0D+gpNzLye+h3QDjg9+xBk7bqCIS33+?=
 =?us-ascii?Q?S0MDvhoxxZIykq7aI6rKMMPRugHht2YV9GTC5T2h9sPyjszmJW90fbw+CFT7?=
 =?us-ascii?Q?20zepeXS+24Tg0WLTC0KOk2E4pz5WJwIwnqhd4nc1QwnyRSMfoLnzqYb6Rt1?=
 =?us-ascii?Q?dje7Vg1C039V/hB3+LpwOf8Q3oS/LFmsQKIFGe+jiHKOjK/F3ZyWOHMyEUZN?=
 =?us-ascii?Q?LsnFxI1XkcEnlw3RnTwl99OuWYpw4fdnIn73TPUJwHaau0dZ5b4+tV9iVeJm?=
 =?us-ascii?Q?KiPEXfIRqF44ds7NuShtjwRX?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 05:03:16.6327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e415d9-a920-4161-1d06-08dce29f86b2
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6566

Update the `Opaque` documentation and add an example as proposed by
Miguel Ojeda in [1]. The documentation update is mainly taken from
Benno Lossin's description [2].

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>
Cc: Nell Shamrell-Harrington <nells@linux.microsoft.com>
Link :https://rust-for-linux.zulipchat.com/#narrow/stream/291565-Help/topic/What.20to.20work.20on.20next.3F/near/467478085 [1]
Link: https://rust-for-linux.zulipchat.com/#narrow/stream/291565-Help/topic/What.20to.20work.20on.20next.3F/near/470498289 [2]
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---

Changes in v2: Correct typos and formatting. Drop non-camel-case.
               Add SAFETY comment.

 rust/kernel/types.rs | 45 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 10e3b1a999f4c..5e96f2c46f9fd 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -290,7 +290,50 @@ fn drop(&mut self) {
 
 /// Stores an opaque value.
 ///
-/// This is meant to be used with FFI objects that are never interpreted by Rust code.
+/// `Opaque<T>` is meant to be used with FFI objects that are never interpreted by Rust code.
+///
+/// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
+/// It gets rid of all the usual assumptions that Rust has for a value:
+///
+/// * The value is allowed to be uninitialized (for example have invalid bit patterns: `3` for a `bool`).
+/// * The value is allowed to be mutated, when a `&Opaque<T>` exists on the Rust side.
+/// * No uniqueness for mutable references: it is fine to have multiple &mut `Opaque<T>` point to the same value.
+/// * The value is not allowed to be shared with other threads (i.e. it is `!Sync`).
+///
+/// This has to be used for all values that the C side has access to, because it can't be ensured
+/// that the C side is adhering to the usual constraints that Rust needs.
+///
+/// Using `Opaque<T>` allows to continue to use references on the Rust side even for values shared with C.
+///
+/// # Examples
+///
+/// ```rust
+/// # #![allow(unreachable_pub, clippy::disallowed_names)]
+/// use kernel::types::Opaque;
+/// # // Emulate a C struct binding which is from C, maybe uninitialized or not, only the C side knows.
+/// # mod bindings {
+/// #     pub struct Foo {pub val: u8}
+/// # }
+///
+/// // `foo.val` is assumed to be handled on the C side, so we use `Opaque` to wrap it.
+/// pub struct Foo {
+///     foo: Opaque<bindings::Foo>,
+/// }
+///
+/// impl Foo {
+///     pub fn get_val(&self) -> u8 {
+///         let ptr = Opaque::get(&self.foo);
+///
+///         // SAFETY: Self is valid from C side
+///         unsafe { (*ptr).val }
+///     }
+/// }
+///
+/// // Create an instance of `Foo` with the `Opaque` wrapper.
+/// let foo = Foo { foo: Opaque::new(bindings::Foo {val: 0xdb}) };
+///
+/// assert_eq!(foo.get_val(), 0xdb);
+/// ```
 #[repr(transparent)]
 pub struct Opaque<T> {
     value: UnsafeCell<MaybeUninit<T>>,
-- 
2.46.2

