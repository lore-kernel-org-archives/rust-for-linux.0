Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB2A9463
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 05:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737524854; cv=fail; b=lrDmJ/VpikbNCBowGAX+U00jV8BJiUyYfABnif5M6DDpEBicCHb///hfrRWLmbcpIgrJWiXmmgU3eiPN1IR+fwy/YyKG6Wb2KW0Ma1cH1ZQJh5WaS4qUSaJDac/i5FBEPatUOEGSFQMLlOD0oZ9WzFNhH/FxlO0af9C28MIWW28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737524854; c=relaxed/simple;
	bh=ndgHMXqwovtY8LJzVZPLK0NhqEM0ncW8GueqW3QLAyQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uEdeXVtdwtqBcALI9SniF1lSKRvsse0+Vy4QMJ51KPIj85xC7Gztvlsd4jYuk4qmUuojgkaowc9zxDBJ7fucWVta2mjpKHLxJjS60zib7Qif4IJ5aSuMsEffu1UrI1BLJCeR7W6tNLhSgSdvTUxh7VXk+N/e2s4XEtVnABQt9HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=MPU6fdxf; arc=fail smtp.client-ip=40.107.21.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="MPU6fdxf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cgu89zCAu1KFqQcxrT+AZHUaXGbF+fwbD3fSxtr7QSQmiT57eqV/dm+9CXCm4isK2x/JAKnQFv4yDWfZMl8g04ZYX3hWQSN18tKrmwmNuC0Cjrq8VKaXZSS112nIMzFNA0PyHfqSCQo/xYu6OwilnJMq/pXtEHDqpVSoF7KlIwaVHmd6TCWUW4M12XQbz9tL6KWqfbCWkBi2AytKYF6Wa7II/+LaEtcwWjS47t1hEcsXu54MTvKcvPEdV4Mi/41J6fTwjApx+G/pt4FlATDg4QYxGuh8Z3WLutS0VVRom30UwHo/k3hkTkQjenj1nWAKZtmp9pqhWJETWLDckaannw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNqjs9X2hg6geoiHtVm+9n26DzMo3mMJqi9sO17KzHc=;
 b=i04PvPudHPgDi1eDcQhW7Qx0iT3ld6TCjAzDDZ86G/Ih5Ab+FwfIy0fLweQSGq7k9493LHt3a/mng0DI3MiNLA/ILEhdRiO/7imZ1o9FCWazavG5YO2Z7JerU2BwLeVRfoAbl8wvcnLIu+L5mfjtusyo4RyJBgBwtaK9ua2dnIL/+o4fKZbIJGq8oumjb+Gm2LcZzPlRSZ2OYNLODy1L1lXS918odYkkIjviICoz2Won4puTZs893mvULETtnItZgr3ZXfrBNsGnpHPrR+sBH79Q92BCUaAjbDi9mR5A6khKmxWzxXDAdHO7RPYYzzJt3bNgpFl9QoO/6pp+KBXyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNqjs9X2hg6geoiHtVm+9n26DzMo3mMJqi9sO17KzHc=;
 b=MPU6fdxfmYtBY6QXLwc4RoB3EIuX2jFSVHimeoOnpdT6fxKN/aVjdZtv0JabN+vIAi39xZl9sB+BdnAPh2FV99PPSbGjNAQkLEyHMOUMnEodtq5Gj3Gq7kHXz24D0DR1WxDEO/mAzZ68a8hwNZgtGv5GG34VbislRjGhLWhVHqbYJX/W6RiA7u9zVsohIehmkKlobzPX6oYpxpkomfoR1ZE5qibH1FL9leTt7uG8q6JFR/ciFy7ftYMzpaqZMYPiT10fasva6jZOFrXLl40kH58nekMUROwApIdaGGXXFVWg5Bqnif3WMdTwEFzgpVuJGJpCYuBdiLpcLLwSZwPYtA==
Received: from AS4P192CA0017.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::12)
 by PA1PR10MB8391.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:44e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.14; Wed, 22 Jan
 2025 05:47:26 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::12) by AS4P192CA0017.outlook.office365.com
 (2603:10a6:20b:5e1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 05:47:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 05:47:26 +0000
Received: from FE-EXCAS2000.de.bosch.com (10.139.217.199) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 22 Jan
 2025 06:47:27 +0100
Received: from HI7-C-0001H.de.bosch.com (10.139.217.196) by
 FE-EXCAS2000.de.bosch.com (10.139.217.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Wed, 22 Jan 2025 06:47:26 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
To: <rust-for-linux@vger.kernel.org>
CC: <dirk.behme@de.bosch.com>, <ojeda@kernel.org>, <daniel@sedlak.dev>,
	<aliceryhl@google.com>
Subject: [PATCH v4] rust: error: Extend the Result documentation
Date: Wed, 22 Jan 2025 06:47:19 +0100
Message-ID: <20250122054719.595878-1-dirk.behme@de.bosch.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|PA1PR10MB8391:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1b91bc-f045-4d24-75cc-08dd3aa84081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dFjBjbOXjqaFvQVuU08H0RJUaEbLWl+Tp5xTd9diuuy5WHvnNgDnLZjXYZ0Z?=
 =?us-ascii?Q?MPvRfvVHnh3ug/MDTUrpmglIdv0p8oAyYZgsVEOwWW+Yseh9C1JxwHjIsS2+?=
 =?us-ascii?Q?iwHbK3U12ZP0YRjwR0nffIc1t2nfAwHQsgfbrr2vt5z0585iRL47GFd3I8b4?=
 =?us-ascii?Q?rfP7dRYaznovZP411kaeNO64MzwStTbw4RMvd0LE+H6DJ2oBqcXlhfd2A/wV?=
 =?us-ascii?Q?eIiXKqASXRQWLyBQRS/ej30XA7RXmcvSqT5wp05pduomXim2s42H5mJlHPO7?=
 =?us-ascii?Q?RwuH0I8UXld6Vlvya/AEhYrF8OlcmrpAJDo1O8uhbMxbfdKf7np/nz2nBTx1?=
 =?us-ascii?Q?Ken18GvX9oNdfpgmxS3JbbsKvYFzC3eZ9PnOP4M4BZT0V7byYE8y2b8CgzIb?=
 =?us-ascii?Q?mO/CWwieiHApfaT94zv9PsDr4o5sOYf0z7zBEgW4RckN3ESD/BxlgtF2gc8x?=
 =?us-ascii?Q?oesvroHzW1l2EflvyJvihbsEd01UCJKs6+5xwWY+91boalVqF9+mBbs6hvO5?=
 =?us-ascii?Q?riKdhhbg4BXf67oaks4eX5RxGF2ezaAtU3XTPN5uV1p2Ad6uzLoVeO/Gp6B/?=
 =?us-ascii?Q?KLtKif0oSh/nPRJ3z90aYwEVQfGkNs0kjzS8Tnr6rQEjsNNI8yjxwk5RWbjz?=
 =?us-ascii?Q?qlnJmKhtKo/5vrWKFBs+BKfNkwxcM0Fr1cJ1Df6ai3P/OIJtn+cQUBPYCeU8?=
 =?us-ascii?Q?i8rVL0I9AD6FZwVxekrcrRQMdcRsLkKFPMVd0SZx3/uvVhcGr8fUCo/MSoAd?=
 =?us-ascii?Q?dMH0q8pADsSWGP9RKx02Lch8J8Dk3LnnkG3mpIklnKh+qiXDmm+oFOzvoZO8?=
 =?us-ascii?Q?kRFjlIlZ733QHE1g8D+EDyeWr0X6nAziN2ETOXUN8jmMw0jZJOZQFkPXdtwk?=
 =?us-ascii?Q?3uTO3okAp+OTJfWebL+1TL0ZXFyCkWY+rqg0WNPmMmsN3lD2+NFUZw/xdECc?=
 =?us-ascii?Q?5giHqlpv0NmOmcehCiiMyRHa/WTml4/l1HNPIPeHi43s5WtqO99SF1qgGcZA?=
 =?us-ascii?Q?rSQaB29wl+BfXZ8o6vJqHaQol1r/h8OrO9xzAe7OjsjSapeY5qkEp13bwQ5b?=
 =?us-ascii?Q?ypCyebVyFRfMPDO7TeI7stfSwxCEa/CEXy4m9ln5c2WvW1Hz1ni88dJwKVwn?=
 =?us-ascii?Q?NMASnhPQGmfOAPcwUF3LSbnc8OphaQk9lvhq8vROaxKeO9Ft0M+VW3AfYjA9?=
 =?us-ascii?Q?J9tZVIgQllk2r5zaiqjGEgxJ1LElza0guO0lhXzvjpe+bMv7TmRFAGWB6YBL?=
 =?us-ascii?Q?cqpkP/XGjKBs6HmySKDzphqxCwacfv9FOGNrapN5ChtxUkfwW9xCqA1jjPxI?=
 =?us-ascii?Q?TyMEl8KR6po1wCUjfPsEeXqSj88ozKBzln81BdT+Zd6Butk4HxDQ1pOzbD0A?=
 =?us-ascii?Q?4H9mzne8uBY1/Yq/0w0n1m2aZDOmiib75vJzJNNDSqCgEvGai0uzSvRQJTg+?=
 =?us-ascii?Q?lKYtR5vrFBY=3D?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 05:47:26.6996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1b91bc-f045-4d24-75cc-08dd3aa84081
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8391

Extend the Result documentation by some guidelines and examples how
to handle Result error cases gracefully. And how to not handle them.

While at it fix one missing `Result` link in the existing documentation.

Link: https://lore.kernel.org/rust-for-linux/CANiq72keOdXy0LFKk9SzYWwSjiD710v=hQO4xi+5E4xNALa6cA@mail.gmail.com/
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---

Changes in v4:
 * Drop the expect() example and put the slightly rephrased
   unwrap()/expect() description below the ?-operator example
   (Alice & Miguel)

Changes in v3:
 * Slight rephrase regarding panic() vs BUG(), whitespace and
   newline fixes, use srctree/ syntax, add Rust reference link
   for Result(), evaluate the result of the examples etc. (Miguel)

Changes in v2:
 * Improve the linkage (Daniel & Alice)
 * Reformat the examples, add if let, drop "automatically",
   call the example(), improve the formatting, etc (Miguel)

 rust/kernel/error.rs | 113 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 112 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 0b01975c2286c..b4e59feb17a7f 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -254,8 +254,119 @@ fn from(e: core::convert::Infallible) -> Error {
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
+/// Instead of these verbose [`match`]/[`if let`] the [`?`]-operator can
+/// be used to handle the [`Result`]. Using the [`?`]-operator is often
+/// the best choice to handle [`Result`] in a non-verbose way as done in
+/// [samples/rust/rust_minimal.rs]:
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
+/// Another possibility is to call [`unwrap()`](Result::unwrap) or
+/// [`expect()`](Result::expect). However, use of these functions is
+/// *heavily discouraged* in the kernel because they trigger a Rust
+/// [`panic`] if an error happens, which may destabilize the system or
+/// entirely break it as a result -- just like the C [`BUG()`] macro.
+/// Please see the documentation for the C macro [`BUG()`] for guidance
+/// on when to use these functions. Alternatively, depending on the use
+/// case, using [`unwrap_or()`](Result::unwrap_or),
+/// [`unwrap_or_else()`](Result::unwrap_or_else),
+/// [`unwrap_or_default()`](Result::unwrap_or_default) or
+/// [`unwrap_unchecked()`](Result::unwrap_unchecked) might be an option, as well.
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

