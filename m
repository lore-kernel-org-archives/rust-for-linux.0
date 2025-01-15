Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013042.outbound.protection.outlook.com [40.107.159.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DFA22F3AF
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 06:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736922416; cv=fail; b=BbxVlEW/einjwUt2S066AmEVl4pjcUHUw06rdPmsYt3UgcMSDDkixgCq+BiHUvJEM0DGFTrMUtBmeVKqT/PUTeuBStCDRNAq9tZeLqF6+lYnA0H0fT0LIQ30iA2PMUMgb+tf+pfWHNehOvubBnlVqOLLFZxctC/THE9MiSFa3sU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736922416; c=relaxed/simple;
	bh=WaoFR2K6a9pEAyJNoDDPBeywIWlp3JTIVbZuR+Umrtg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LUPGzmTkm48LKxgYmfNkw37Pk7xET/dHvAIufxmxIrGoz94G52Xk1gcFyDAOBXIu4jyvxHE6ajgQ/X90KyGt4QuNBb1picx9niL4Bq3SS49yV2GM6hK6lhrAm8HJYEihRvtQSlWmfinhrD4Kl0X7E4LdbhSxqvBEyAw7d4B0FBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=Fk/yRdzQ; arc=fail smtp.client-ip=40.107.159.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Fk/yRdzQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYPBAEAWDuRN1GUpHx9ub0IO9poEE6J7UOUlbi0GzYkt8PWbRLl+HLRESGAwmSUv4T2wzv2DcOifbhyFKMkvdLtLbn5x4aRDxfmqZFtkJAiiCTVXrbrQitkdCFOwPm6ffessnCwV7yuO3J1BqQetQUp7M0AMMxHZT/VWPwCmHEryhojoLeD9xxyM4/JsOohNNQKEgmUzngSRXPdn1hgdUcr1s/NGKNhEGQmavuClTeIirjPp3oe9xH0cLqut5kXPORxohsEK1vNjSf2CCmcfgoCKH0l793BiWIC+PLQ/p98qdGrN++2l747Xjgq0OzZqlpGnliI/e6WBPTQfIfcZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyL4K5zS944oIa65KU/njtdpbUN1khXWI3o+WYW7qXA=;
 b=rldI/PZVvnZHlfq3DNVYfmwhu+TfzbIT6XOIUAHCKEiziGShdThOgHghBPpR/h9NCywzcY/DEmGXfl/FyAIgclWOZ1HQ5b83mkD64c3h2zB6ZIMarzgH4vTFZCFEdsdK/5uEmUSw6uWWx9xLtJ8jDs9izXCzHZvujKouw1nzP8OsDQxpNC/swfNB7fZHGTruNE4Q9L924cnJkj+6xk45Qn5NPeJPLAqJqz8rYAonBlNplslyM9CYu44NcXJei8jVcw/YWFFpU+dWc++hiyI3SI+bSNuSN2AV8U1O9+1FMPO8ae//qyEfeXF3kVhsJ4PEprlfpw9hKxgYfTEBoe2Brw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyL4K5zS944oIa65KU/njtdpbUN1khXWI3o+WYW7qXA=;
 b=Fk/yRdzQtbFYd49hEzIINLWkgQRWwxVwiBaDw/5VxTmz2m+xq1JSjuCnNMHLdi2JI/LVXO5ySy8VK3y8BijQKIUPrHJFCocnFG95qKUf5mECHmu/EL9y9QmFhz+KcbnMJjV8EoWt0x6JQk5OgjdyjSaPwxHu6JD6yuxuEDrEdFV4joDTbfxMmF2GsZEMEMJg9vjB7Kax7oFwI2CitvMY/VcjshHPeJ9829QEv7Og55+W6UmbhFtPJHi5/Vtpw5cFl6gk2wdgT+klVuA/Pbt6uDoVAwTs4Omgui26xyrzHrC18Gbf2CvgN/Qgib0M/EIa1+ovFKDImRmxybHZ/5RquQ==
Received: from DU7P195CA0013.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::8) by
 DB4PR10MB6918.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Wed, 15 Jan 2025 06:26:49 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::30) by DU7P195CA0013.outlook.office365.com
 (2603:10a6:10:54d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Wed,
 15 Jan 2025 06:26:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.11 via Frontend Transport; Wed, 15 Jan 2025 06:26:49 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 15 Jan
 2025 07:26:38 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Wed, 15 Jan 2025 07:26:38 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>, <daniel@sedlak.dev>,
	<aliceryhl@google.com>
Subject: [PATCH v2] rust: error: Extend the Result documentation
Date: Wed, 15 Jan 2025 07:26:26 +0100
Message-ID: <20250115062626.1971211-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9F:EE_|DB4PR10MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: a9984a07-7ef1-4796-8f4e-08dd352d97c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rvvKTHDA9YOqDY1nw76AtgcUiLrLWDjH4hMzWc9GdbVRd4uYUCXOKrPWV+I3?=
 =?us-ascii?Q?/wGX3o5qS2GU6TMWr2mZKoMl5BrWiVxbme1X74nfJSNtmm4AjGEzzFuPweCS?=
 =?us-ascii?Q?SuDQ5I2TfWnhWZtUhtuzlcNXrydbViqaMAgU8+uka8DWHqiiBXf7BqPMxBLU?=
 =?us-ascii?Q?Hc+zygg7bY4VVXPJUnA0OqEtkIUgPNOR8jHg8G0rQs7kzUjrWutMx+05lNP5?=
 =?us-ascii?Q?cpawJgp9rOi+Ta9Z8/YvSf27hD1Ru28ZNTxS91oVvjQ7SUpcCP8VRyX/fgT6?=
 =?us-ascii?Q?FqdsAGQI2EMoBXNoIXx/f3aiJWu77fWoMCNjnOk0NYFtiBRwljePT/eKoIZg?=
 =?us-ascii?Q?BeoDs+m5S7oxclSTZI6fpkz+4bNjyLWhCqRji0/8VXY2YHL/sYrNSWbNp4gH?=
 =?us-ascii?Q?UONP+1Yomsut5Xu5lOsZxZxHUGgsGPSFnhfs4XECE0t2X54Xbum7r+9M6scO?=
 =?us-ascii?Q?j8bsadfm22PiXUe3fhBrGTiotD8Etq2C84K7meUhtDMBDk8y6WyfzK53j3WE?=
 =?us-ascii?Q?S/seFBJIyn2QO4rqfvrrouWTcsv7OJi3G649xZhHj4OhwFGtK8F+W3j5x7Fo?=
 =?us-ascii?Q?oAzXd7Qfe4427PF8Y2gwB3CbcYYXOgvdL5IWF22Ro5ZoH+SZYFaujUP4oaZY?=
 =?us-ascii?Q?4vtnTW5MxQnVgmGocWcI8gQzi9CvjhTvO4dL/OyIzgR++zjhQjltcR3dSF9T?=
 =?us-ascii?Q?jX8R9vBrcH7aZ0fUWktt27Nosy8buXMOWeulfacfrNnjtzA4MYFmGktyjGMN?=
 =?us-ascii?Q?uWFoutE12KpkH1TgqaWJErn/8iSB4lilGztUPnwNCWv7U3MUygfIbyNb0xyH?=
 =?us-ascii?Q?YI/uPlzzszYmGSUKgEMoNYL/js8AQDizOKp47qvS9tFhDLm2RHqe9l2U+lYn?=
 =?us-ascii?Q?L+43wUoLarQzF3Fb6xSiHFoBWyTJ07XrrbTvNMlg3DrFhtXTKIO+sr4zd/eH?=
 =?us-ascii?Q?NrAL4PR++ZNkyQwwNKSimO4KqslBY8NEJJHtwLvD/C+zz6QVbFe6ryTqac0n?=
 =?us-ascii?Q?lWB2n/iFlHeZMxCqmVVhd9JnHP3PKR76/svt1wsLsjsecdqOVA1yOTIj55iW?=
 =?us-ascii?Q?mfsfgPuXsIJNytCANYUC2jS84LoKCfuSOKeQUNkV2gHYU0G7LJbenOUc+Ex2?=
 =?us-ascii?Q?jJHJtX4j9v4WGTO2onnqNYDHyVt5uGa69Hc3Ds36CE1MIO2M+mthz+8EYqot?=
 =?us-ascii?Q?JhOnkCStdM3XMrTTql2+Psu92YtEH/n5TqQx7dlDKCKY2Q7yO6s96fUib9/D?=
 =?us-ascii?Q?50xejvm15Pb4a9jBo3zmD0IxuO0mfF4VkV/w4EoQMuJIBUkccPAXgtKgYYEU?=
 =?us-ascii?Q?5CkZlDylxy163XhDyiBnvExCcKnVYMRN3KHxD1BfJSJXlJmafvYJoHzPtn7c?=
 =?us-ascii?Q?gBU9sJBF1kb1y8Ea3SP3fOOE7rHk92KMAfdZgi2AsXUjusOxeiR4CuWBxg8A?=
 =?us-ascii?Q?JpLBfAEZUGk=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 06:26:49.1779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9984a07-7ef1-4796-8f4e-08dd352d97c7
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6918

Extend the Result documentation by some guidelines and examples how
to handle Result error cases gracefully. And how to not handle them.

While at it fix one missing `Result` link in the existing documentation.

Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD710v=hQO4xi+5E4xNALa6cA@mail.gmail.com/
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---

Changes in v2:
 * Improve the linkage (Daniel & Alice)
 * Reformat the examples, add if let, drop "automatically",
   call the example(), improve the formatting, etc (Miguel)

   @Miguel: I'm somehow unclear what you like to have linked with

   "By the way, it may make sense to link to the relevant chapter of
    the online book or similar somewhere in the explanation (on top of
    the Rust reference)."

   ?

 rust/kernel/error.rs | 118 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 0b01975c2286c..f7186606a3243 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -254,8 +254,124 @@ fn from(e: core::convert::Infallible) -> Error {
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
+/// # example();
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
+/// # example();
+/// ```
+///
+/// Instead of these verbose [`match`]/[`if let`] the [`?`]-operator or
+/// [`unwrap()`](Result::unwrap)/[`expect()`](Result::expect) can be used to
+/// handle the [`Result`] . However, in the kernel context, the usage of
+/// [`unwrap()`](Result::unwrap) or [`expect()`](Result::expect) has a side
+/// effect which is often not wanted: The [`panic`] called when using
+/// [`unwrap()`](Result::unwrap) or [`expect()`](Result::expect). While
+/// the console output from [`panic`] is nice and quite helpful for debugging the
+/// error, stopping the whole Linux system due to the kernel panic is often **not**
+/// desired:
+///
+/// ```
+/// fn example () -> Result {
+///     let mut numbers = KVec::new();
+///     numbers.push(72, GFP_KERNEL).expect("Error pushing 72");  // Panics the system in case of an error
+///     numbers.push(108, GFP_KERNEL).expect("Error pushing 108"); // Panics the system in case of an error
+///     numbers.push(200, GFP_KERNEL).expect("Error pushing 200"); // Panics the system in case of an error
+///     Ok(())
+/// }
+/// # example();
+/// ```
+///
+/// In consequence, using the [`?`]-operator is often the best choice to handle
+/// [`Result`] in a non-verbose way as done in [samples/rust/rust_minimal.rs]:
+///
+/// ```
+/// fn example () -> Result {
+///     let mut numbers = KVec::new();
+///     numbers.push(72, GFP_KERNEL)?;
+///     numbers.push(108, GFP_KERNEL)?;
+///     numbers.push(200, GFP_KERNEL)?;
+///     Ok(())
+/// }
+/// # example();
+/// ```
+/// Depending on the use case using [`unwrap_or()`](Result::unwrap_or),
+/// [`unwrap_or_else()`](Result::unwrap_or_else) or
+/// [`unwrap_or_default()`](Result::unwrap_or_default) might be an alternative, as well.
+///
+/// [`?`]: https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator
+/// [`match`]: https://doc.rust-lang.org/reference/expressions/match-expr.html
+/// [`panic`]: https://docs.kernel.org/driver-api/basics.html#c.panic
+/// [`if let`]: https://doc.rust-lang.org/reference/expressions/if-expr.html#if-let-expressions
+/// [samples/rust/rust_minimal.rs]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/rust/rust_minimal.rs
 pub type Result<T = (), E = Error> = core::result::Result<T, E>;
 
 /// Converts an integer as returned by a C kernel function to an error if it's negative, and
-- 
2.48.0

