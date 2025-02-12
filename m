Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012045.outbound.protection.outlook.com [52.101.66.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF361FECB3
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Feb 2025 07:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739345146; cv=fail; b=ZMk+jh13DLXLSXcwENxhojkDFz8wAk7P6RAo638VA8QAPMl9r0GN57tXBpNcXIl/x4zxutiYs+fTbVd4vDOhwKTjy3aecLLO5EvoGEPayzp3bn8su4/HcRJBtabj/2O2K2kCK3dRm6PwJLxrPqKmyNjeCtph3OinCsBbncyhOqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739345146; c=relaxed/simple;
	bh=23wBHyatui3dzycwrNikMNHrorRBHaikrodt9QgOy8o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pwzvCdpI2m4PuX7EPZyEasr0o3TENtbf2nmjvIShZ6w3SKNOYzJd34VY/D4P1zBGjwACz0ccKBbgNrS+a73R3afoUTIbWQ0V1pAPbdPMPFFFQQMimyQKzm4mSY85U/1/5/vxuro9vg1/SkROfg6mZ+/Q7vk05hsuu9AI9Cql/hU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=psDwLjhq; arc=fail smtp.client-ip=52.101.66.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="psDwLjhq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gWM1rV2dhX2lGD+SFY67Hq/ar32PDetRXzNdNU2s6MUsEx4mep83pnmQCpntdDXoVYyyOWRNV5BdElkLPsKhcl6BQAPH47TQQwLGJ/i41v4VxJwFkTY3Ep0rCJ6PuIBbTAHYzcW83ZiNRrjHY2irGXPZKdrfYx9BUhM5LXOncJDLTIOD4g+dvJRI7cu3adiCHUxuUcVEmvt6HI1XWCvlmOB39neNlIynAik+3C+0wRs8TazzKsHnJVbekxsdhWNEPFg3CXgiDekvPHr6csbMmVeHJKQxX81a6J4yNyg/Zc5XGEPWLomrCsJEks3qwTRedgx6JruOwrCjOBRqij1Xhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x61Y+gVhWl3fasDwYFkXRG3pgsTE1C8cTMSLGELaOfE=;
 b=S782HW6d1YJ6qWwwzq7C+E96+1gVrpR9D3o2RLTaRck+ZKTeozINw84j9UhxZ4DoEMNgvYGlhhzi8nK30aFWbnUkYAIbVqCZRZq+hAv29DxBI1OB1bRwjsCn5bhoapY7YQ8zPvvH4CD36QgGbx8NByjx2kig7+UchK+j3CRiVuHeuqSJR3lMoPJ5+H/creBZjDjbhd+PKaCKvmByJYX57BgEU0basIvSWN7aEtwFhrnwudxuiBnK0nuwNSejA0xGc34W4HdipvO/EQ3BGawCY5N3hUnvawnu4BLlraVTUed/+yob/wAiJAZl9HP6Obi0DjoOgfvySLIQ7reN4W5+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x61Y+gVhWl3fasDwYFkXRG3pgsTE1C8cTMSLGELaOfE=;
 b=psDwLjhqgUofvgpQ3vd+usaaICtFly375KF/RZjJ2GMlB34zih7xPAG6/Hfs+5E+eiDrP0PxHgsd7HLgE6OCKUB8FRVXWB3qXkqKg4Voi7BMZEv5T+ltLxSfC8Dy1copU4Tvif9G88OctxiVd2lYmM6J1B4ouvBvdnFLSe8BEyMBqXdzCeNSSURs/2Y+xQSk6vlj9nhv5TkoZ8WVSADjf/uGwmBeQiLR0AyXy2/kekHGhUgcWSrTgbglC8oPNkbqVQaI4EpJHKl9t89NQ2KYioWwnwfHp2nxWtjb7JzGGR9Vks3NtHcC3Dn0VZxXm6ep1/nwPQpWYVs31Bip2c0jhg==
Received: from PAZP264CA0233.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:238::22)
 by DB8PR10MB3561.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Wed, 12 Feb
 2025 07:25:38 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:102:238:cafe::ab) by PAZP264CA0233.outlook.office365.com
 (2603:10a6:102:238::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13 via Frontend Transport; Wed,
 12 Feb 2025 07:25:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Wed, 12 Feb 2025 07:25:38 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 12 Feb
 2025 08:25:17 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2001.de.bosch.com (10.139.217.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Wed, 12 Feb 2025 08:25:16 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>,
	<daniel.almeida@collabora.com>
Subject: [PATCH] rust: types: extend `Opaque` documentation
Date: Wed, 12 Feb 2025 08:25:09 +0100
Message-ID: <20250212072509.1765360-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004C:EE_|DB8PR10MB3561:EE_
X-MS-Office365-Filtering-Correlation-Id: 187b06f3-356b-42de-d976-08dd4b3672af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?StHzq5B0vQdW7EQejdI+stmAiEOutelDhmGEwsFSz0QgSVZ3+xEaADldpFQK?=
 =?us-ascii?Q?pcTxT8ugj3/QuIMevvHPPaVecj+4s4l4oYpx21P9IZWPrhF1R3EAyAZTJoE8?=
 =?us-ascii?Q?nGpzoCzx3aVy8VIZGida1dVv/eTY32NrsLmn3zWDwRrllGKierOM1b+dm5Rb?=
 =?us-ascii?Q?H0DZNhCkCkZkI15J84UbJ1WBnBN2kAvoK69SvGvqzCNETeOrNMAXupxXHmTS?=
 =?us-ascii?Q?zP36ED1RsheuA6XEWP8xx3jV9vAuJl65+WkJJa0XacEzju//9uWJCFn3k67k?=
 =?us-ascii?Q?FBmrS2dlo4nVSlYf98RctvuXpuivTYAkxEuV17mDI9pofzvWnG4CCEO9PZcl?=
 =?us-ascii?Q?PQAeOTHGyivEY+LFbLeMxkhPL5ovhOgBWq7Z/gPuXq2ke9ud/mZYAFTilF91?=
 =?us-ascii?Q?se9JLb0/A66oxw9tSV2HePf2aI4JPogffhqIiDbHyyLlKyH0mBkLfgib5oCe?=
 =?us-ascii?Q?rYImq3UYRCSmY7FAzKLDvyar44Qp56vbAPgL+60CKbOZZK4FRNp7K7tWYwZl?=
 =?us-ascii?Q?FRJ6IDlNKmXeNLgAgVjR1wmE+FiJjFSDeplcB4rnR7GrwqRY16br4tTA6jkl?=
 =?us-ascii?Q?gYuObDPdL2wfbC0ibauPx48ihmjqIEEOGi+yQ/0fFsKGPq2HbW5PdMNG2EUX?=
 =?us-ascii?Q?Dlgz95sLPJXJBG/Sjhl4+w8g1FHYnP3WoPwMpDQSkVZz6Lwvo3B3/6A8vgDw?=
 =?us-ascii?Q?shBQ6WflcSXidJmraMvxXji5cks+a1rjnjF47E0hecVehYYY0XUx8R+/Sx1j?=
 =?us-ascii?Q?6xKvGU6UlZjT/SMLd9JXaPDJ7VN6y2KrwUztnpLou8W8zgFtdvEiAhIohxvr?=
 =?us-ascii?Q?fygxLPTf6GCNnsKZ7pkJ0ZueX03UnCn0uofzcJEa8TudAyCpfjfJl2B8L1az?=
 =?us-ascii?Q?2aNH3APZWbITRx5pf5bZ3rq8tsVjW6A44fxmqDWh3SJtnYWfO0hz5MYZfo7w?=
 =?us-ascii?Q?cf4iwFnKmo6j0HKgiVlkysEpf5xf02jPxPAMsAOeNdQCLjw3EK4uUBrj6LBJ?=
 =?us-ascii?Q?ne3LQExzVOsjpzFBYprmSn/x4oBFOKsNmpGcAYwEtKJ2uAvimjT64xkEEnct?=
 =?us-ascii?Q?lqg6cA+GdkY7iKwHwfNp6FgCMiIdNlLrH1+pTYxaSEjV+/f7xK/zjBopONS3?=
 =?us-ascii?Q?VBn7227SWMXDZjGr+b1F5s0wq/yYI9xKb1s7MXDJ/Hqa0RhFZGDNmMYYHVTE?=
 =?us-ascii?Q?UfTlCzsGLlIkiB1dhh66I81LHir+m7tOgR8K0HDPtGSGkxtacuOJQGZ3IDu2?=
 =?us-ascii?Q?zXbvnWcprlTObkbD+DxnOp9fl/xusw1txQYhgMGLHPOuE+V54fCDrkhM0rnQ?=
 =?us-ascii?Q?IgffLES6exNw/zq+umRZ3rDLSBKxhY7YPNeN4XNKnQt1kgMWsENJVcO9mDhJ?=
 =?us-ascii?Q?+GzNAnynAy0FZYlGD83vML73F37O28BRxmhicxPXYu2hTrZhkFsh+A0hV2eE?=
 =?us-ascii?Q?AE8EyVAzWHS1u7Egj2qAVEb4lvtnqi+aCUS9fkSMtTCtWWguEWlqY/VDhmv7?=
 =?us-ascii?Q?RvQX+aUCTcbQDbs=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 07:25:38.0297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 187b06f3-356b-42de-d976-08dd4b3672af
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3561

In the discussion [1] some `Opaque` documentation updates have
been proposed. Add them.

While at it, add some intra doc linkage `[...]`.

Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
Link: https://lore.kernel.org/rust-for-linux/F8AB1160-F8CF-412F-8B88-4C79D65B53A1@collabora.com/ [1]
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 Dropped the RFC, now.

 If it helps reviewing I can share a screenhot of the resulting rendered
 output, e.g. on Zulip, as well.

 rust/kernel/types.rs | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index c3dc798221dbc..c7c9cf40e7b5d 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -271,22 +271,27 @@ fn drop(&mut self) {
 
 /// Stores an opaque value.
 ///
-/// `Opaque<T>` is meant to be used with FFI objects that are never interpreted by Rust code.
+/// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
 ///
 /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
-/// It gets rid of all the usual assumptions that Rust has for a value:
-///
-/// * The value is allowed to be uninitialized (for example have invalid bit patterns: `3` for a
-///   [`bool`]).
-/// * The value is allowed to be mutated, when a `&Opaque<T>` exists on the Rust side.
+/// This is useful for C structs that are not fully initialized (yet) or might change their
+/// content from C side at runtime. [`Opaque<T>`] gets rid of all the usual assumptions that
+/// Rust has for a value of type `T`:
+///
+/// * `T` is allowed to be uninitialized or invalid (for example have invalid bit patterns:
+///   `3` for a [`bool`]). By dereferencing a raw pointer to `T` you are unsafely asserting
+///    that `T` is valid *right now*.
+/// * `T` is allowed to be mutated, when a `&Opaque<T>` exists on the Rust side.
 /// * No uniqueness for mutable references: it is fine to have multiple `&mut Opaque<T>` point to
 ///   the same value.
-/// * The value is not allowed to be shared with other threads (i.e. it is `!Sync`).
+/// * `T` is not allowed to be shared with other threads (i.e. it is `!Sync`).
+/// * The destructor of [`Opaque<T>`] does *not* run the destructor of `T`, as `T` may
+///   be uninitialized, as described above.
 ///
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

