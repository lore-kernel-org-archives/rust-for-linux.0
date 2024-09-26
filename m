Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB529175B1
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 05:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727326838; cv=fail; b=opxHrG/XqLaMTNMtF13qqo+lbUoDvBezKdm6ehP8dSpPqtpbLhNrIQ2dMJ64WicAYcr9hBYYpth2WL0dr2CD18VkEXKhyPPIAgYdudIfRs6lp6/+rap3BQFqagsvYRqqbAKxMJ0xa+ryLj4EzovJy3fk600m30UsxN5VSWyNWuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727326838; c=relaxed/simple;
	bh=EKKwt/Ja7RAGgj6MqtVTAjolmsnXCkkdMFfqf5fLJ6Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LISjTM2EYXoPMg+8KiVWmJLtYFx6OLgE1y+ART4Wk0Td6snmyClFZi37KcycjgDZ70rBDMM8QUXfq0RTWDmUTxwItivBJKxaRzah+iDNfS2K+h9vH/7wW8EuiDMDsa5eAm891z7L9fQykhRAi/F9YaNe5BWegrUeq8yGzB8QDTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=HwgoILy9; arc=fail smtp.client-ip=40.107.20.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="HwgoILy9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLuJJTP/cEy2gwBKiy3ynyJL8oUe4xMMPZwyBk+hBtYl+HxCicYttKj2zPrHKSFBw5G2kpPBfL+BBCFmmOe6rzthoOu4ffzoWY8YyLNpHgyGXI36DHVugcf8u62CY7gw4FzBoMagZJNTCEFcMypjxANgggSENA5hRfwO8PSwPp9Dfl6XOXCVfke744hUpDdHeYLYPRMhFSuW8VQbEcKowjUvGbcUB8FmBMhN5Y1ZzKFhlKGyBBo+FbnzhfmFaF+Jo+aJsCN39IePxTbEbqLNy8yeh7dy9HglLyenl/2vWr3hY8bppG4386QAikuojPHHD6xh70WteWifdlw97e0qAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nybEebVZ5B+2KW/H99lZKPz9Em/p0eoVyUa1IbWoy4A=;
 b=UNrRlZStI2jiLQn3yHNejqak0SgldqvkeUlsrUml2bxksYj9AMs+aY6hK/MQUptjOD9koaQaUMkChoFQ9G8Rm4xT6tu4VtzmyN5FPqwZLawrvKk/RxqE8JcBldtcWLtt1T+o5427c8jYgS4/jBfFSXiJcrqu/F8zrJud59zKjEM4XDMP/O6MqbUtHY6SrFTeGZas74TEV3hZqUH2LILG6qfFdmDbJZi84Yxp0VN2SIISSyqlbM8rr/fp2kB25bvi4xApYtRD960x/TKnWIkGer08ysRwpxrA4pNHQA69u7clXCCICr8q++MV7Gdv7QHE7O9LAtGyEsStQQ3S2WHygQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nybEebVZ5B+2KW/H99lZKPz9Em/p0eoVyUa1IbWoy4A=;
 b=HwgoILy9CKVUocmvRlyQzh8Zm8qzjwL8LUi/+bmldAxOtbBSgBHU0FDwbJrDgKADKlxgg+JXvAoAvvyWMvaHYxPcguy7PdAI5hofSIT17f65sdBQcgLBUu1r2bUhZ7sEtcOSKS/Bju+60BqKxNykHDCGTWWg/lJs8+FVOfSeIVSeaydAn3Yz3bPf1I73THKQ4vFVldixdicvXZeJA/3SWr0q+5agNtKbaHX+KfnsM9WYQXFU8wlKsva7q6Qzxj2OFqHTQhcNM9mXXU3Zzf/D598ho6Yc3uS3sfWriMhqCgN6E0ORQjs9xtQ/fflyYJYK74SDJhAa9hjSj6lxQRMNmw==
Received: from DU2PR04CA0332.eurprd04.prod.outlook.com (2603:10a6:10:2b4::20)
 by VI1PR10MB3552.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:134::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.29; Thu, 26 Sep
 2024 05:00:26 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::2) by DU2PR04CA0332.outlook.office365.com
 (2603:10a6:10:2b4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.16 via Frontend
 Transport; Thu, 26 Sep 2024 05:00:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.15 via Frontend Transport; Thu, 26 Sep 2024 05:00:26 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 26 Sep
 2024 07:00:22 +0200
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 07:00:22 +0200
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>, Miguel Ojeda <ojeda@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>, Nell Shamrell-Harrington
	<nells@linux.microsoft.com>
Subject: [PATCH] rust: types: extend `Opaque` documentation
Date: Thu, 26 Sep 2024 07:00:15 +0200
Message-ID: <20240926050015.3216641-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.28.0
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B97:EE_|VI1PR10MB3552:EE_
X-MS-Office365-Filtering-Correlation-Id: f6a6174c-c57e-4719-fcac-08dcdde822c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s+F3humuDhQuxukl+JsCm64RsWAOqESvjHEuq9YlfwgUAzWCPdESP5zsTCrU?=
 =?us-ascii?Q?8BLyd4NxhrOf6eQk4vwM/BJy0Hb0bvKS9b16UUFxmZLqsUk298ohtuzWAF9t?=
 =?us-ascii?Q?kDIOqKj59vUPPYt9TbWy3a4Oz84FrZcP3yJYhlXpjGkHoEnEit7P2O5bKeoE?=
 =?us-ascii?Q?97+t+x3bZ9JgPpBhrXBz5iA29XuaioX4YLh7DftEzYU1QaFf2TnumKzb+5g6?=
 =?us-ascii?Q?QAi6PJO8ePJ0cXwe5arFdSxwW1VJmxv9JeAhSgZ48QJ/cYA1Qu8cJmvTk1+d?=
 =?us-ascii?Q?Ou1HmKRce/ZabPzXxUEdfQunANv54sDb0ksKB//HSf/GDnLo3dZIB9vsTHGt?=
 =?us-ascii?Q?7iFTmnS00qEgmxYiSxKy0voR/Dn6y/yOIfXtgbtH+rQooP4NLZNUhUj1gEwd?=
 =?us-ascii?Q?35BKvEy73QDz1Q4lF6Z1Ub91A10GPisouQJ6cDNufLA8cGRpwui4h/FmdUFK?=
 =?us-ascii?Q?SoAtTogNki1Wfne+sNM2Wr5wtuFy6fzdv4u2TTcgc+T6gGl/1xtRDTqTOdCG?=
 =?us-ascii?Q?EzK7HdF+qqoskzzq9Ku90OugPLciU1J90YT2FVKkHATqSHqmeaqTDXRCPJcw?=
 =?us-ascii?Q?BRAvvjbWiDQ6QBdobgL0euYWz6KNW08pK9kJAPV8dCc4EpCfTZjaT0Yk6bxq?=
 =?us-ascii?Q?g6Uu8cCC1G5N/vX+hrQd+p5VMrlmUErhuTorJ5tzLnqg598GKJ1gGur1e7Ev?=
 =?us-ascii?Q?j8TMg/VD9VFFjZOG1rgBs985F5BbnPdJnTHOcEkWbCwSNZqZO457fCG07m45?=
 =?us-ascii?Q?IsamBSgObglBfZ0oYr9BIHLXiisdfoRJNEQMwrfzowixhJpx555OJOnQNKno?=
 =?us-ascii?Q?14xfdQQISs523wPZmWOdS7tEZAfcUgSTFJ5Aopcsi8WTdvLEylXxWAra+kIS?=
 =?us-ascii?Q?DnHpd042YvX6DEtmzDK7kzOTN7d7oDTZJ7Iuye7MrGtJCKkBCaMld2u0XSa7?=
 =?us-ascii?Q?Wpm9awt1cAieGqCeMHAPY0V6fwxHxs0eO7B3XPcduPN2A5cu4oyrglsYyBIw?=
 =?us-ascii?Q?FQB3M2SR79kp5cWdf2hPpoDIFrqSzGWAp4ULvSrPLLX3NmvYQ0nXXcAVs2PC?=
 =?us-ascii?Q?wzILGZCvOwpj+bh+faWEq+BUfgpgCrQPjSLym6X6Uvh+UL1ft2RbZAO44PpS?=
 =?us-ascii?Q?65dFFf5MjNK/pNrnz4rdqo6RlaQb2PxvyKndOaFbBpGW62RChxeMh2haYLAX?=
 =?us-ascii?Q?UlCA1ZluQx2gJ7aHMw2RR6LMofaFkRTBG9jeqAt2ZhDhZISd9alr4Z3VhvMQ?=
 =?us-ascii?Q?jU4E13cmWZyoOE3f2bJSSeCMMNw7p+OamfU0+9mY7V7yS+O7zG0yvQEqVs5j?=
 =?us-ascii?Q?c5T4lbFQn8x3XwnTChjAr2R8P8RgFgVHBMcTundUsreFQhzSDIWxr29XH8E4?=
 =?us-ascii?Q?0943nXDXwF2hyy6beRlQwp39sSWe?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 05:00:26.4447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a6174c-c57e-4719-fcac-08dcdde822c6
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3552

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
 rust/kernel/types.rs | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 10e3b1a999f4c..3d9b5cadbf060 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -290,7 +290,48 @@ fn drop(&mut self) {
 
 /// Stores an opaque value.
 ///
-/// This is meant to be used with FFI objects that are never interpreted by Rust code.
+/// `Opaque<T>` is meant to be used with FFI objects that are never interpreted by Rust code.
+///
+/// It is used to wrap structs from the C side, like for example `Opaque<bindings::mutex>`.
+/// It gets rid of all the usual assumptions that Rust has for a value:
+/// * the value is allowed to be uninitialized (for example have invalid bit patters: `3` for a `bool`)
+/// * the value is allowed to be mutated, when a `&Opaque<T>` exists on the rust side
+/// * no uniqueness for mutable references: it is fine to have multiple &mut `Opaque<T>` point to the same value
+/// * the value is not allowed to be shared with other threads (ie it is `!Sync`)
+///
+/// This has to be used for all values that the C side has access to, because it can't be ensured
+/// that the C side is adhering to the usual constraints that Rust needs.
+/// Using `Opaque<T>` allows to continue to use references on the Rust side even for values shared with C.
+///
+/// # Examples
+///
+/// ```rust
+/// # #![allow(unreachable_pub, clippy::disallowed_names)]
+/// use kernel::types::Opaque;
+/// # // Emulate a C struct binding which is from C, maybe uninitialized or not, only the C side knows.
+/// # mod bindings {
+/// #     #![allow(non_camel_case_types)]
+/// #     pub struct foo {pub val: u8}
+/// # }
+///
+/// // `foo.val` is assumed to be be handled on the C side, so we use `Opaque` to wrap it.
+/// pub struct Foo {
+///     foo: Opaque<bindings::foo>,
+/// }
+///
+/// impl Foo {
+///     pub fn get_val(&self) -> u8 {
+///         let ptr = Opaque::get(&self.foo);
+///
+///         unsafe { (*ptr).val }
+///     }
+/// }
+///
+/// // Create an instance of `Foo` with the `Opaque` wrapper.
+/// let foo = Foo { foo: Opaque::new(bindings::foo {val: 0xdb}) };
+///
+/// assert_eq!(foo.get_val(), 0xdb);
+/// ```
 #[repr(transparent)]
 pub struct Opaque<T> {
     value: UnsafeCell<MaybeUninit<T>>,
-- 
2.28.0

