Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F0019F130
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jan 2025 06:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736230916; cv=fail; b=mKKWK2pS1VEfXfHv147mxwIbiJVL5s8NdwfqSXXnwc3BdEAI8mhs1AZzmYiZuPHqjj+uGYkwWKJspK7NhAiOx/FBoL5IJ+bNRhW3UgqyzwqfzSAAX4BnhLHZTxDRmEgtDtxJs8JBqYE7S5hsXP11yi4H8bJvh+ij02JQYZ5LvMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736230916; c=relaxed/simple;
	bh=5FmweqJKeY5FBG0bc2v3f8GT16muvKj4GLDHF3ZstJQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OYjBUB89Ljpmocmj77kKAEea0g+7I1Y0UgRemW69FqlSipF/6v3J3Ix7C6WkBona81i/H/nipT6knZQIvUvynPqfzlyJZ5ngksjyI/7NxS+kCR/K+eB3q0RKzGgQ0+vE60Ks9qGHXqJx/LihMGYt6Csa4vNHdEgoseemsdX2lUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=O3d1ENjT; arc=fail smtp.client-ip=40.107.21.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="O3d1ENjT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTGd3Hevkrh8IinM0j8Wv7Gs3zrMZuUv0gR2LMH9rxUFeVuPsjLTUxTEz0A75XTD8XWsvUMZwcFEfothUUYSgKMODRTxVp6TBS5xZ2w21ecvtnZ8BadIKoNCvA4/gfVxpQguj+cSUTDIoazCI2qnOkHQTWOvaUvFuL7P9WHXJIxyN4AIKtAVoD1AZw9XcB4n6Q7UiDEf+jzZTJVLdBS7XGX1QOwB87er/yP30fnDP4deekdirQ1NBfAHHqMetpOKIhVfZu1jqeZhiPYl2aZ0SsLjf/sbIU8N16eRA+XsYkRgbc9NqMknRX9UAqZhdWczfBG8DS5e/UYoL9YOQNoHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlnRCHRBplCektAan4WDOOnXBYF653Jq4vWhv36VWm8=;
 b=dQfz8CZiwpKEKVuWZbIxU8MAX4ffTvi/TaXvASQXhjv30kBPH+GoTmGdEBtEwO8DkHH555MUoHsaFkMg0cIv4N3H8k/Ykq7qxcT7Y0wEHIaAUcQye3kkqUWEoYF5bPxZT+o1nHG1c5Bmg5DA+g6jUAVnwKHRLf9h1kE7Xk9jQ9WXhBI0A4VS05fgpIqgu4YFQcIFR5zgH1YKS8XBIqnwIRANjKxlpaKDctE3LvG16XYqvVJvTZ1LJ3GyUtDNz9f9nvzQ1yTWDEGRfQHijlm9goNQmBdyf3NuTaIoEpWRjxFsUSS6IpHEg8ZDhAWm3L3+pyFf01gVpGxMEJkYopG+/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlnRCHRBplCektAan4WDOOnXBYF653Jq4vWhv36VWm8=;
 b=O3d1ENjTBP8sekbeVYLhMhk0SuD+nYvcqx/02sNoN55bi2Mimm2Lv/iL/LO03NUpe369aa6SqOCPY1l/0jtCcyB5nxddUcUwrUOGhQU04ClMphgsRi1TmqyirPEBWrKDO2xARckUENeJsWBPn7L83b3a5LGBz3oatlJCBOU+kmQe9gheLHabrt9uQlFJhdxILvxwDvdUU5TzZ8SUg2S+O0Qmm67ClM6GvkmZMs5o9udqyfhCPP0q4OT6SMlcRlGjaloniHshZ7ImUxmdaqeXPXOCc/OlWROHV6YFnUUOzFRtiFxl5Jpc9sczHBLnJPX3N7N/D9e/yQH2EqIgdLiU7Q==
Received: from DU7P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::31)
 by DUZPR10MB8125.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.9; Tue, 7 Jan
 2025 06:21:43 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::6b) by DU7P251CA0016.outlook.office365.com
 (2603:10a6:10:551::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.18 via Frontend Transport; Tue,
 7 Jan 2025 06:21:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.11 via Frontend Transport; Tue, 7 Jan 2025 06:21:43 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 7 Jan
 2025 07:21:42 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Tue, 7 Jan 2025 07:21:42 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>
Subject: [PATCH] rust: error: Extend the Result documentation
Date: Tue, 7 Jan 2025 07:21:34 +0100
Message-ID: <20250107062134.2981602-2-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20250107062134.2981602-1-dirk.behme@de.bosch.com>
References: <20250107062134.2981602-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F0:EE_|DUZPR10MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: 36e2a951-fce3-4fd5-5297-08dd2ee38e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4SAAjQjCI11MfPH7q81jD5aXLtwX1hAdJzVVpEnSa2P6CaC+5UXJRKQ8fxud?=
 =?us-ascii?Q?0VIcw/UuoMpTFNJBaEGv+l238bzhCWtu7GzXnpGbLtF6O2gZ5t/4wKw+rpAG?=
 =?us-ascii?Q?fIul8Oz+kceg4bMl04iL/4/Z8NG0STGWFAQ4YdbpDCoG1thCx/uxB5Oo0wj6?=
 =?us-ascii?Q?JaLbKbCjUD+0fMJM7qZ6lNQQx+XtMy9lSi0gSVzDghSB50RrS75CVk9AE8iQ?=
 =?us-ascii?Q?OvSfOZ8I87zBezxQ2+LxbpFxt+GCl2n49Kqhotqax+ZKa7jW+chs+NTQPRp/?=
 =?us-ascii?Q?oj3/WhA8NnztK/hhuhOKMEzP6pYWP2oHy1dEiJyUAkfIA9x9lx2c9TF5JyU5?=
 =?us-ascii?Q?1kLM1DUZoQfXuSGDpX/iM+3mjunPsDGnYFRcQxwGLZQ+vET54jONvZpQX5Pt?=
 =?us-ascii?Q?shqI98cQkiTI4b8TPmRw3o5SDptYCWHLtbGmJYytYsI+6cWz343f3cByfw4r?=
 =?us-ascii?Q?N/g15F+MyICwHyWiwVu1TEYnj9S2osEB57ynQ5cLR2ETWisNWLVo8Ni+jxbh?=
 =?us-ascii?Q?kLzKXCKGDzNd1rOll2WM2Vk7+5YGVTogEfsignF+RsbyfhSSGsjfFowhm3XU?=
 =?us-ascii?Q?wZ844QGyLCD7lnX1hxWDOKF+ZBPI8n5R5YJIEL1C8MWbwMtOjv9v/mcIz6Qs?=
 =?us-ascii?Q?ISG4gEu3sHsiyBVcTxXGCd4tAaYyTc/pscT8OeMeJQLAA4ZUXgpxJoTeqmrE?=
 =?us-ascii?Q?aBYmRv5YtkKbr5OYfMtWbYRd8TjvGQO8Y1Yz4bnGw5c91aBZ79gGS5ip/VIO?=
 =?us-ascii?Q?uBuV+xPmeCaXxvjcU+6OnE5rKh/OYBvBWR2WllXRjnIHmEil3Hbn5Ja3qYrL?=
 =?us-ascii?Q?fw6ITLUaHEawSdiW6+0RQOrxA8ksiuR/HP+rxYwX6ik6aayhkmVe+CfyyAmI?=
 =?us-ascii?Q?aCDEyGaRmhzNbLpP83Cx4sJh/ImdCE1xSaiF9kWxkzFx8iTXjOGq4PEoY107?=
 =?us-ascii?Q?AKKTkN2lgbzHSdY2Yd+9UMM2VSCkDofYbwi1l7/P3ziJjHnWBvI132FwZTEZ?=
 =?us-ascii?Q?jpQDVmIQ0KzuO0cYeTk2NLwNuMH0RcA0vpryRCyWlNRzurfY9TrV0f6EfpbX?=
 =?us-ascii?Q?Ji046/pu/+DolBYSrUsAR+Nwmf6glgRz9AAnsR81oOEGQ6kflCWixEMMQ/kZ?=
 =?us-ascii?Q?tYjMewvnqB0t54cGQSV8nj/Uc9nkF5Fh92XHE61FYP6nP1QkEKWCr3QutU0w?=
 =?us-ascii?Q?E9cpQkr130tiXO76z5431mjsHxJm8bbYohd5+XOcQPlRTSse6CNOypoLhNjz?=
 =?us-ascii?Q?wo3BzAkMVU0s1fST4fH2D17LgjATj5PbOEgItZq5hu7nECTvbyzAkx4VaHTg?=
 =?us-ascii?Q?MvL1U/ln1yHz2uxG6d9WJj1Gw7Y819aV8xrwqP9FG5aVJoMu2oWroya6uGTH?=
 =?us-ascii?Q?RzwIzKZka8k/KEDfCwPp8ATmFN5PqYnxqNX+9sdgHn/r8wMfu9O5j9SaGeFV?=
 =?us-ascii?Q?M9ZMuJXmDbA=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 06:21:43.1560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36e2a951-fce3-4fd5-5297-08dd2ee38e12
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8125

Extend the Result documentation by some guidelines and examples how
to handle Result error cases gracefully. And how to not handle them.

Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD710v=hQO4xi+5E4xNALa6cA@mail.gmail.com/
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 rust/kernel/error.rs | 66 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 0b01975c2286c..456487d4a8ed8 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -256,6 +256,72 @@ fn from(e: core::convert::Infallible) -> Error {
 /// Note that even if a function does not return anything when it succeeds,
 /// it should still be modeled as returning a `Result` rather than
 /// just an [`Error`].
+///
+/// Calling a function that returns [`Result`] needs the caller to handle
+/// the returned [`Result`].
+///
+/// This can be done "manually" by using [`match`](https://doc.rust-lang.org/reference/expressions/match-expr.html)
+/// Using [`match`](https://doc.rust-lang.org/reference/expressions/match-expr.html) to decode
+/// the [`Result`] is similar to C where all the return value decoding and the
+/// error handling is done explicitly by writing handling code for each
+/// error to cover. Using [`match`](https://doc.rust-lang.org/reference/expressions/match-expr.html)
+/// the error and success handling can be implemented in all detail as required.
+/// For example (inspired by [samples/rust/rust_minimal.rs](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/rust/rust_minimal.rs)):
+/// ```
+/// fn example () -> Result {
+///     let mut numbers = KVec::new();
+///     match numbers.push(72, GFP_KERNEL) {
+///         Err(e) => {pr_err!("Error pushing 72: {:?}", e); return Err(e.into());},
+///         Ok(()) => (), // Do nothing, continue
+///     }
+///     match numbers.push(108, GFP_KERNEL){
+///         Err(e) => {pr_err!("Error pushing 108: {:?}", e); return Err(e.into());},
+///         Ok(()) => (), // Do nothing, continue
+///     }
+///     match numbers.push(200, GFP_KERNEL){
+///         Err(e) => {pr_err!("Error pushing 200: {:?}", e); return Err(e.into());},
+///         Ok(()) => (), // Do nothing, continue
+///     }
+///     Ok(())
+/// }
+/// ```
+/// Instead of the verbose [`match`](https://doc.rust-lang.org/reference/expressions/match-expr.html)
+/// the [`?`](https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator)-operator
+/// or [`unwrap()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.unwrap)/
+/// [`expect()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.expect)
+/// can be used to handle the [`Result`] "automatically". However, in the kernel
+/// context, the usage of [`unwrap()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.unwrap) or
+/// [`expect()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.expect) has a side effect which is often
+/// not wanted: The [`panic`](https://docs.kernel.org/driver-api/basics.html#c.panic) called when using
+/// [`unwrap()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.unwrap) or
+/// [`expect()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.expect). While the
+/// console output from [`panic`](https://docs.kernel.org/driver-api/basics.html#c.panic) is
+/// nice and quite helpful for debugging the error, stopping the whole Linux system due to the kernel
+/// panic is often **not** desired:
+/// ```
+/// fn example () -> Result {
+///     let mut numbers = KVec::new();
+///     numbers.push(72, GFP_KERNEL).expect("Error pushing 72"); // Panics the system in case of an error
+///     numbers.push(108, GFP_KERNEL).expect("Error pushing 108"); // Panics the system in case of an error
+///     numbers.push(200, GFP_KERNEL).expect("Error pushing 200"); // Panics the system in case of an error
+///     Ok(())
+/// }
+/// ```
+/// Instead [`unwrap_or()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.unwrap_or),
+/// [`unwrap_or_else()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.unwrap_or_else) or
+/// [`unwrap_or_default()`](https://doc.rust-lang.org/std/result/enum.Result.html#method.unwrap_or_default)
+/// can be used. But in consequence, using the [`?`](https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator)-operator
+/// is often the best choice to handle [`Result`] in a non-verbose way as done in
+/// [samples/rust/rust_minimal.rs](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/rust/rust_minimal.rs)):
+/// ```
+/// fn example () -> Result {
+///     let mut numbers = KVec::new();
+///     numbers.push(72, GFP_KERNEL)?;
+///     numbers.push(108, GFP_KERNEL)?;
+///     numbers.push(200, GFP_KERNEL)?;
+///     Ok(())
+/// }
+/// ```
 pub type Result<T = (), E = Error> = core::result::Result<T, E>;
 
 /// Converts an integer as returned by a C kernel function to an error if it's negative, and
-- 
2.46.2

