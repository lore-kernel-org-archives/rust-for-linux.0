Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2044.outbound.protection.outlook.com [40.107.21.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E2F4D5AB
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jan 2025 05:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737352150; cv=fail; b=ptdfUg8v2aa3l6HhN262Y7wMOM5faf/7FUsehSaaVj0NsDpQdvKBZYNG2rb8lHMYTCNLXkWHHNKje/nzIEPkKu0EpdkgAfPo/l+44wGKMfyzeZJbue/9Go2HkdJEojncym3UBawTo9YvJH98BZINj+auSts4jt8hGk5ZWuVywRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737352150; c=relaxed/simple;
	bh=rw6zv/1xC15uUf1WkhPFXIsUIcmWteYBVxmTCY1x0lA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jsQBPyA1JNte7HmdGDptDEv0DLXMMiVFJsUAr6IQsaWyrwC3DGwbD4HdsffvsV/fvGLRRF/Yj6BOkG5m2W1002XJCqxYnr4VNuJ6JaPjTK8DqKdov0ARccFu2wpayM9yZ5pI5+nY/PGXlzvKsgkM+uoriIncNMC4jCrafhvFFU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=dJVS9zCy; arc=fail smtp.client-ip=40.107.21.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="dJVS9zCy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnUIcDI+mCduNqiJrRiECGYAK1O9plH4Bq3fHqpAqpIIRjiyjlkkBneV2iDQQMLTokA78dQMrhEQgkPiXrjvbrH3x/JDV+xmFpugOWB0bU6nAlDqe9Y6KNN+9PcCnF+oEPBOFtJJCenUryg1JtD8udfsL4/mY0jTSpZav9femh25r4trYIJ8ae0uZQDq55jtWmERmVOQL6K2gZ65SQi0iCi4VixmTZNyF0NZ/8OEBWsvS6VzwGtzb6SNuhnQuhCNXKozN/33Q/5325gJOxuL2L8yNlqzQs6ABUjkGngLZzA/Yr+WGvDTaJhgIortIVxejjyJwp/f+Z1NgDCEEnX/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUH5iMhMLdHR45HWwW1MwS6EotLAdEfoOOFVAUQOR9I=;
 b=C6LkXNVL3pnDXSF/CVoVL8Rx96+2MCx4A6inMTS4yjRloINUPQx1bq0r0/sHowC2z8MfAspDMYEJInoB38l6fg2WMUTerpG4iLGZ/40DKnP3a+4qZ7GNKWiju0gJpr7y0RpfwTFvm/HEGKhkg1IJyRaiB7KAXFTV2SPSPmjVlpC4wYhqAqHKg4A551MeN6A+V3ldxFY6YsQ/dBwldzILKBI7oarCSSAewTgZjJDnZQvi6MXzOUHoA4TM0QLNd2vPHe02K9Gks4L16/civ6GpzIJqRRVkLvidLR/2XLZu0CUy+3oVleSUWx3zlJu0Gno7Y7qUR5u+uH3d/Fudvui/Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUH5iMhMLdHR45HWwW1MwS6EotLAdEfoOOFVAUQOR9I=;
 b=dJVS9zCySCJi8sxOJAEakBrVh1hjJeiCspyMHwT2VHi4zd/FUq1OhOaTRyw396QPq8V/RLs0ODbLQX8avH6noglvhC6E6A6Gpt2eo7O2YJ74VBYDbsLnB+oIVlCslSukATchH0ETtL3BKjbjfJt/Dgjz+JuiisHH0lUjkiSSHhy8JNjljp5S7DV7a9upNhlLm92l3R4WE+jQNZH6n/uMjnUog2FU0dCfPKSDt1gmlTEpee+0Pa4LHam+btnFBKGDbeJ0scYp2hA1/nDBM9/cHlt+TfN4oPAu7qAy+y8SycL5u9Uyqh0PEUrZHfDoXVsbtHnrG2OpIQ0tBYOWtUkzKg==
Received: from AM6P194CA0049.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::26)
 by PA1PR10MB8895.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:442::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.13; Mon, 20 Jan
 2025 05:49:01 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:209:84:cafe::e3) by AM6P194CA0049.outlook.office365.com
 (2603:10a6:209:84::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.20 via Frontend Transport; Mon,
 20 Jan 2025 05:49:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 05:49:01 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 20 Jan
 2025 06:49:01 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 SI-EXCAS2000.de.bosch.com (10.139.217.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Mon, 20 Jan 2025 06:49:00 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>, <daniel@sedlak.dev>,
	<aliceryhl@google.com>
Subject: [PATCH v3] rust: error: Extend the Result documentation
Date: Mon, 20 Jan 2025 06:48:46 +0100
Message-ID: <20250120054846.3880395-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79A:EE_|PA1PR10MB8895:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8c5621-7945-4f29-f5db-08dd39162410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ec1Ouj1mkwDm6ZO81HIKCKwuDUQ7Wnhm4R55BVhJpv53euM1Wh1zSePID/YB?=
 =?us-ascii?Q?dNz7gfcKDVqfJGXrqYh6HMocSCvebxA55ASOR20uJv/QdJ/hz4xwd4zeJAOA?=
 =?us-ascii?Q?u/UZi+z0t0m3v8GWsYQvn/3xbc/E1odBcLrxW3Ssd/st/YPqBwk19YmTNWOv?=
 =?us-ascii?Q?q8TZirdEXBeoDbKzwgsrQz+DrVzxNMcXeXdVIhjQyrdbW/b/PyHjVL7BY60S?=
 =?us-ascii?Q?8yor8ri+r0fMYPzCC/DkTe5tOMg5jLvQIGVvYAzU2TY3tSU2jBAp3DS+2i9G?=
 =?us-ascii?Q?/GM/SL8pPW9GEbQJIoEzVWSseq0Pks3lgmlF8psUTX8l9EMQgx8EXwHGjKTZ?=
 =?us-ascii?Q?mLMxKNoTPnQLdlPx7DRdjqHeZRIOdeYh70v3I/TlDhW8e9fDBSJLCM8ozEeh?=
 =?us-ascii?Q?x77PggGd8yZoQsVxhgfhYN5QbQxtscKV+oqql3ZVvdKYG2Tbzo1vtL38+MIe?=
 =?us-ascii?Q?V9S17/BP8M+d1xqCsvgnikMp0MZ1z5pzX6Q8szL5giVag4xtDwDL6qfAsEP2?=
 =?us-ascii?Q?3HT8LHrMKpPfxeIiJfwrBA0CWuIWJOLA/FWHh+OuvLlC9lJaQ1GpV0jnGZzX?=
 =?us-ascii?Q?y0zqEwrcAebPmL9E4KkzxB8ZXdgDSyp7qa16XeTSRRrPN96eP0S1rZX70x4c?=
 =?us-ascii?Q?6H6eUWoEHe/qyRkSqhtOkMZARIqKYRUkEc4CzGF36xY36HsayZrakDT4OUi4?=
 =?us-ascii?Q?o5+dBV9VlPawa3n3YMB4dIyCXNfxetjy7ukulYVq5oQ8FJr055UbLQg6I7+i?=
 =?us-ascii?Q?FiZOQf379cPi6saVIUsMBCqco0UAK1sr8eniMbnSPuN/tARe+pq21lE2yMs/?=
 =?us-ascii?Q?VGKY6eQn2YbA5x0zB4QMoRda4xyB+Fkm8axNN35S/k9TjNnXJA5zsbAAf2ND?=
 =?us-ascii?Q?PQHLOlPEjfcB8oAnSXXGe4tU0tG8YY/zkT8tW8o6V9vppkj/kPyW60nNQjAM?=
 =?us-ascii?Q?er35mKy3RPj+2kdezmF4JTH56+rEdoh8+WGAgI84qL582snwkujk/s+Bxo35?=
 =?us-ascii?Q?Z1rGj40gL+8ywdqNC3ls0Z3vY2jekJf6zixqRDOjxlawraFGaO3ixZHdSDRO?=
 =?us-ascii?Q?s33StLXZlh3wFb0TzX2ZU6MYVHDePJV+An4eHSP0iawiJst7Ct7VHpxD+FqY?=
 =?us-ascii?Q?1BEdhrAIk/RRS71FrRHbZIr2kbgqL0VHvXZrehJ3F3/VGmOjd19TMocYMp51?=
 =?us-ascii?Q?qGNkqZxah+s7WfvWO+Q2KllfTHtdzdNa2mh4RdjT2dar2cSLkvlzSaLC2Qt5?=
 =?us-ascii?Q?t4JWzLUSgNbs7uXnWyVL8+Dri004kA0iydfBklpLTSPcvnSCiITFyy7c2D+g?=
 =?us-ascii?Q?AL+FX1aIOTomQ6NoY1GGw/Q0+0H8HoHapYFUCEFDGKthkWyLnwJMFYH+6WWt?=
 =?us-ascii?Q?SSv0Qv5UHWNGPy+RfwJwj49y1WMvzXw4tdW8idxPBgSexwraXSa5mKFcrWwE?=
 =?us-ascii?Q?SecK5cAKbQq3WqFuvAiPK2GL4FmVZuWw?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 05:49:01.3008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8c5621-7945-4f29-f5db-08dd39162410
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8895

Extend the Result documentation by some guidelines and examples how
to handle Result error cases gracefully. And how to not handle them.

While at it fix one missing `Result` link in the existing documentation.

Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD710v=hQO4xi+5E4xNALa6cA@mail.gmail.com/
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---

Changes in v3:
 * Slight rephrase regarding panic() vs BUG(), whitespace and
   newline fixes, use srctree/ syntax, add Rust reference link
   for Result(), evaluate the result of the examples etc. (Miguel)

Changes in v2:
 * Improve the linkage (Daniel & Alice)
 * Reformat the examples, add if let, drop "automatically",
   call the example(), improve the formatting, etc (Miguel)

 rust/kernel/error.rs | 127 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 0b01975c2286c..cb5b5fbfd3266 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -254,8 +254,133 @@ fn from(e: core::convert::Infallible) -> Error {
 /// [`Error`] as its error type.
 ///
 /// Note that even if a function does not return anything when it succeeds,
-/// it should still be modeled as returning a `Result` rather than
+/// it should still be modeled as returning a [`Result`] rather than
 /// just an [`Error`].
+///
+/// Calling a function that returns [`Result`] needs the caller to handle
+/// the returned [`Result`].
+///
+/// This can be done "manually" by using [`match`]. Using [`match`] to decode
+/// the [`Result`] is similar to C where all the return value decoding and the
+/// error handling is done explicitly by writing handling code for each
+/// error to cover. Using [`match`] the error and success handling can be
+/// implemented in all detail as required. For example (inspired by
+/// [samples/rust/rust_minimal.rs]):
+///
+/// ```
+/// fn example() -> Result {
+///     let mut numbers = KVec::new();
+///
+///     match numbers.push(72, GFP_KERNEL) {
+///         Err(e) => {
+///             pr_err!("Error pushing 72: {e:?}");
+///             return Err(e.into());
+///         }
+///         // Do nothing, continue.
+///         Ok(()) => (),
+///     }
+///
+///     match numbers.push(108, GFP_KERNEL) {
+///         Err(e) => {
+///             pr_err!("Error pushing 108: {e:?}");
+///             return Err(e.into());
+///         }
+///         // Do nothing, continue.
+///         Ok(()) => (),
+///     }
+///
+///     match numbers.push(200, GFP_KERNEL) {
+///         Err(e) => {
+///             pr_err!("Error pushing 200: {e:?}");
+///             return Err(e.into());
+///         }
+///         // Do nothing, continue.
+///         Ok(()) => (),
+///     }
+///
+///     Ok(())
+/// }
+/// # example()?;
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// An alternative to be more concise is the [`if let`] syntax:
+///
+/// ```
+/// fn example() -> Result {
+///     let mut numbers = KVec::new();
+///
+///     if let Err(e) = numbers.push(72, GFP_KERNEL) {
+///         pr_err!("Error pushing 72: {e:?}");
+///         return Err(e.into());
+///     }
+///
+///     if let Err(e) = numbers.push(108, GFP_KERNEL) {
+///         pr_err!("Error pushing 108: {e:?}");
+///         return Err(e.into());
+///     }
+///
+///     if let Err(e) = numbers.push(200, GFP_KERNEL) {
+///         pr_err!("Error pushing 200: {e:?}");
+///         return Err(e.into());
+///     }
+///
+///     Ok(())
+/// }
+/// # example()?;
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// Instead of these verbose [`match`]/[`if let`] the [`?`]-operator or
+/// [`unwrap()`](Result::unwrap)/[`expect()`](Result::expect) can be used to
+/// handle the [`Result`]. However, in the kernel context, the usage of
+/// [`unwrap()`](Result::unwrap) or [`expect()`](Result::expect) has a side
+/// effect which is often not wanted: They trigger a Rust [`panic`], which
+/// may destabilize a system or entirely break it as a result -- just like
+/// the C [`BUG()`] macro. These methods should be *avoided* unless one has a
+/// very good reason:
+///
+/// ```
+/// fn example() -> Result {
+///     let mut numbers = KVec::new();
+///     // Each of the following `expect()` calls may panic.
+///     numbers.push(72, GFP_KERNEL).expect("Error pushing 72");
+///     numbers.push(108, GFP_KERNEL).expect("Error pushing 108");
+///     numbers.push(200, GFP_KERNEL).expect("Error pushing 200");
+///     Ok(())
+/// }
+/// # example()?;
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// In consequence, using the [`?`]-operator is often the best choice to handle
+/// [`Result`] in a non-verbose way as done in [samples/rust/rust_minimal.rs]:
+///
+/// ```
+/// fn example() -> Result {
+///     let mut numbers = KVec::new();
+///     numbers.push(72, GFP_KERNEL)?;
+///     numbers.push(108, GFP_KERNEL)?;
+///     numbers.push(200, GFP_KERNEL)?;
+///     Ok(())
+/// }
+/// # example()?;
+/// # Ok::<(), Error>(())
+/// ```
+///
+/// Depending on the use case using [`unwrap_or()`](Result::unwrap_or),
+/// [`unwrap_or_else()`](Result::unwrap_or_else),
+/// [`unwrap_or_default()`](Result::unwrap_or_default) or
+/// [`unwrap_unchecked()`](Result::unwrap_unchecked) might be an alternative, as well.
+///
+/// For even more details see the [Rust documentation].
+///
+/// [samples/rust/rust_minimal.rs]: srctreetree/samples/rust/rust_minimal.rs
+/// [`?`]: https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator
+/// [`match`]: https://doc.rust-lang.org/reference/expressions/match-expr.html
+/// [`BUG()`]: https://docs.kernel.org/process/deprecated.html#bug-and-bug-on
+/// [`if let`]: https://doc.rust-lang.org/reference/expressions/if-expr.html#if-let-expressions
+/// [Rust documentation]: https://doc.rust-lang.org/book/ch09-02-recoverable-errors-with-result.html
 pub type Result<T = (), E = Error> = core::result::Result<T, E>;
 
 /// Converts an integer as returned by a C kernel function to an error if it's negative, and
-- 
2.48.0

