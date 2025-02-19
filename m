Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104AC1B87CC
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 05:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739944545; cv=fail; b=e41Z96bvDkCkiug5GiCBCM8auW+eIqbpIbPgEKANIl1DypwsZvB5SxhA+cNfdIdlVQPMamp6Mka4krkao4BuoIJll7G02edXOmRro+A1pAwTDFOURuL7EyIb6WNEbE/pO+i9R20Ga9l6Ltu7pkNL/jy8hTVsIjHXq6Etr8d+Gu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739944545; c=relaxed/simple;
	bh=BPv2CEULK91EiXjrlnNy6W5701O+ZCOeAYVZhpx4jvQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s65DiCURdOeIoZMN7YpJM1xO2+wLm94Q0sKHudRKnmSSrTrL3wz2wYefMVQOCbW474lD23Pi2mWCcilC/0+n7jzg6CjTAdAEbWeC+QjED/E6vJFuNX+BcPUjCISYKhWApihaYE5DRItiI0SWLCgjvAag0yPI4Ybk8cesXbo8ISs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=jZOcmD+8; arc=fail smtp.client-ip=52.101.66.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="jZOcmD+8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUX9jlWndKk8p6N8RAoSiCqKdQVce32U75Vfa9NiSnUOvvJYHw4GZBJ7Sv9kWYg4qIwyYBfZwsVzYxQpSGdXRjWnCuSFxp1gtMnQ3lomzTWK9FLssqp6llnWvIIGf8wofkI6ifeKxVTgJwd06EdTYVxYYukPx4fS5XXrNQR59vkV/7I0WyEL07bTRfCFMWJOIHn6iuumxKLrsfdF2GK8IePjH5lajjZW1tSOiVp41q7KMcid5RDmCQuJXb92v2iG12fcvOWRxsBWfvQbmJw806FAW1bnQXIvv4IHOkrSSuHtezAu5G7rjjyA/QpMUmgQ4uIiYcEAroLC/WfFVNSeXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1LMFmPR061yVut2I/56a/yr8cCze+XHIZPAUxtyW6A=;
 b=JOeNVuXuTndU+ZcRrlW06RzZJY0JCQ5aS1+DXLYdtL68Mcw/68PdmEB4mkBfQlOM/XTAxFdNBbgjRzOj63eDxbizqKpbCgJA+5VkAMEEfZOAZIO5mY9N976sHcgtU98ojdeF1yQ9V6Mu5xqICfDJkZ87QTmarxiJOlOXmHPixSA2dc58FVmB/knnLNhGzoOCD0N7suABlMU1Fx+vzlCvw7GarQX5Wxf5p5Ddb5YCpp14cYUboWSqzObxTZv2l5d2OCiC8tcKhw0nojbfHU2w50vjucJWlIdBN7dY+OAOy73nJvpihqv4cpQSU7sfF3DpD1T8jXCoCITSNZv/UikpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1LMFmPR061yVut2I/56a/yr8cCze+XHIZPAUxtyW6A=;
 b=jZOcmD+8xYyhSUfVHpGv4Sx08tC7YKjFX1nHNeisFSudqdDpQjaTE9eYZN+9ElkVwOGkrFD48/KnyHEwFvuocsCkGGyoeTn5VP5rdkmBKUZZdEhtzyYT0UOPnGFJiXtecXGg4FBPPn1olcByHfmcFyn7ndO+HgFoF91CbH93JVxhHo53g+T1tD1SSLZ6Xd7cLwEayQNXWnRplg/O3KnaJJ071DzJRieio1EyfcxAC+TfBeKFy3cFqG2TVVMGoURDUGJlL4ipfEYJzyfspSVZmVcsO1L6dOz3fT+PSwk8o1phN/SzN1AKUDJujBLgndCZMBGswMSzQ0mNuel/rH4odQ==
Received: from DUZPR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::11) by DB9PR10MB5836.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:393::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.12; Wed, 19 Feb
 2025 05:55:37 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:46b:cafe::94) by DUZPR01CA0024.outlook.office365.com
 (2603:10a6:10:46b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.17 via Frontend Transport; Wed,
 19 Feb 2025 05:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Wed, 19 Feb 2025 05:55:37 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 19 Feb
 2025 06:55:30 +0100
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
Subject: [PATCH v2 2/2] rust: types: `Opaque` doc: Add some destructor description
Date: Wed, 19 Feb 2025 06:55:16 +0100
Message-ID: <20250219055516.359454-2-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250219055516.359454-1-dirk.behme@de.bosch.com>
References: <20250219055516.359454-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D13:EE_|DB9PR10MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: 38069ad5-b1e5-4b53-52d0-08dd50aa08c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9QGQkAInHuf4qcb6XBE81oH3l1e9z91QjBJGBrHPVJLl8Whc0MIpfWK2qDrc?=
 =?us-ascii?Q?6ObVznutcQgcs1uYN75++bDbad4K1v6hC4eqjXCxNR3+PgqJx4kc+lrdiILy?=
 =?us-ascii?Q?FYMQR8fkmwCmEM1/mX2CBN2k6fX8xB9us+KBT17PvZyrFX5EFnGhXNaqsmFU?=
 =?us-ascii?Q?jijZ2p8clhiYSguJvKqREDF1L1BJE059Mo/OtUuqkWAh/p3eW36633yC/bPK?=
 =?us-ascii?Q?9Nc5aVvm+6p5pGFOYOYmBSBU6hOfUHoCB75SO5ciCuRI9pzi4fIvCTqZ5xEY?=
 =?us-ascii?Q?8drhONfew8rCM8mqke8JaTcyUxVx+ht9MztWm3p3+TAxSBL7n1sY9YoRE6ZB?=
 =?us-ascii?Q?Qwes5GQs4mHQiDrwm1ZUDhvYa1iLAq2BKBOatKiVQ6jBU4OBd6wqiZ7u0/2q?=
 =?us-ascii?Q?SwSIh1ealRq3vdnKbFHirlmFTyikGnfSg1xTafVxEZRFJQH6+ZqGO1/HpmQB?=
 =?us-ascii?Q?BjZojdM2yGDVn/JgbawkBENDz70ESADMUZRVU2hrJpQvRIQyNJXAX97y572l?=
 =?us-ascii?Q?LP7mawj6OmgqsmbCuiPC7xcyQebt2OTpczI1GXI36d8/wspMLAs6HGGQfrVM?=
 =?us-ascii?Q?8NIkcyyPYKds5DUbV4qf9/3OpNE4DU0lcjEFOZzjF1akXiOWmsBa90xz3fWn?=
 =?us-ascii?Q?2n7QsonYYgeJ2yuGPEuQswz+iuzinMGk7/u0pXY8LtPhyGo9g2hKj/TVhHJq?=
 =?us-ascii?Q?GLXtPsZdorAL5buuO+YccrNQMgkxfSbhZCOnV/GB0RIJYAWtvPhD6dYznHuc?=
 =?us-ascii?Q?TjM7ZmozCxx7fEYMAMJO75wsqtCyICYFl/c10EIe08CGJ6oE7ueIZ4R5+NFN?=
 =?us-ascii?Q?wSjHqJ32VQ1BLgxo3DqfIpq8z2hZKEFsOvWzhndqrrw9COtJsnA9Iwg6N4T5?=
 =?us-ascii?Q?ZoiG8jMHO0uUUhVsvkqPbZbFUih727HlHKwqpZpOMOTdTP3LZdfTaEx8OXvu?=
 =?us-ascii?Q?lqVUvSb3SCn6JBe9aAVFrpgmRqlrmVo38gCEwmoNpUOqN1Lf1uy4hEOSTBPT?=
 =?us-ascii?Q?I5pwnkZzYRAVSuNe5oE75TjbTIlhyjRGKv8YceZm+4F9GwkjgPfkeWwd2OlX?=
 =?us-ascii?Q?MCUAjIMmx4vvJgNHkm7ijqslb6LKgkTuEEMilZ4uGxz+emPThmG2OQ/9GTsX?=
 =?us-ascii?Q?r3I5wbakrLoz/5eR6azxmPL6fg5W+ndJDTBInhYpIOKIHaI3WnkDcjick1Hy?=
 =?us-ascii?Q?fbRyEjfAZIVLJ5yxiveUpPaDAg2t2NIyUMTxzANlHmbZ2ubPidhHRTy1mk0A?=
 =?us-ascii?Q?CzHQUJXnMEZlQFsG/8pUPMTzxiJITmPdxPfcpRFRf8UZYNbKSJw/YFQCOUOx?=
 =?us-ascii?Q?GjpfJXCJGRjrdgyjBw6jsw/9rf/pgrr+SJHH3cxACX+zJWLmIn06wTAU+GFC?=
 =?us-ascii?Q?bQvrSqY+SeLka3cyYCkhap/TKbpcS93UATgeaDNE7uhoN6qg+q04/Dy9Ar0y?=
 =?us-ascii?Q?/tzxSSf2I8ywe8EV2Tq4N/arTCqnOL304bolTyapV2y4nHTemL//J0yJHO+r?=
 =?us-ascii?Q?C/jA2PwGJ5oAzW0=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 05:55:37.7287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38069ad5-b1e5-4b53-52d0-08dd50aa08c4
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5836

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
Changes in v2:
 * Split patch into two (Miguel)
 * Improve commit message and subject (Miguel)

 rust/kernel/types.rs | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 8ed802444c594..08ff4949d2a61 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -274,14 +274,20 @@ fn drop(&mut self) {
 /// [`Opaque<T>`] is meant to be used with FFI objects that are never interpreted by Rust code.
 ///
 /// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
-/// It gets rid of all the usual assumptions that Rust has for a value of type `T`:
-///
-/// * The value is allowed to be uninitialized (for example have invalid bit patterns: `3` for a
-///   [`bool`]).
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

