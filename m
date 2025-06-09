Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7083597B
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Jun 2025 22:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749508605; cv=fail; b=d2ZAnX1sCbeoX4nYh/+PAQWapOTCjyzyGjgEpsKK0Zr2Fet1hRZ+/voItHdeeIYvupDupkOzZxuTXpT+JskG1hyTWET3Q2n83jhPRYkRV78qN9TZ0KvjFALh0CunO2/Yetd4DqQONUgSxjoGMOLo9EwbVpe9kQCt8s+6bA+R4zA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749508605; c=relaxed/simple;
	bh=dFmYF0eqeao4H0ldOygQKQoTuomXj1ezvHLco60lkbs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uoVoLEM6TmJtlWVD7odGW2BisQ7i07WGzHLsOBiJs2LhN9z+qO1t1e0hKs5Yscp3o5358/P16uG3k/2HO78Ig0+5m/csO4j8yDjtR/ipvwQztKByeULZbui9dHNVfSgX+QDmSYO+iQzrwVb58wuyTB31aHV8QjffUP/4IQ0tKko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U0SRcwJ+; arc=fail smtp.client-ip=40.107.94.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U0SRcwJ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDdYTOqUClBwTrMWipNbFyB2rtVZjW96lmeUdawI7sVtlPYQeO0+gYZxTWKe8YHJNPJ1Wp6NaqwLYCxT1O9kEtSp+CzalsjwYewB3xaht7W8tvLyH7u6ZBc9I5LGFid54UvY7GIHBElvRWqIXCuROWUwihrr3HITzh55//Lns1aPeLOKDjzhabpBOY6OhzKrurlE+SzsXzrar9cwM4C7RX0bXAgO0RRFQPj59sKIkAbd8sBybVFpCUkzgDo075eMO95d+fieDYFWiHmTlXQv6M/+w6O+5bcK5Kl6judaT8+7Y+ZDD2ErA0J+PXq4lsW+8iJTr783Bo8llg8DaPVzYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oh1aV5mikjiNcgv3vEr1Y2Z7/Biql9tASWPyd7SuVzQ=;
 b=C/i7rwbbzKy19kchecJe/9mKoQBrh+CZR0fXawybvC83iUEGXZT/ic/vHXqaM0osaJA+t/KH8djrXDojz30gT/bNEMcGev9bRDrRDCml3E9X6sTbwyUpMLB1eDd/Je31fJhSc/hmuPiX0iAygmpo0GWD0iJaWsFN1NFDNTUtGbjhPnVBB0aUqiDrW+h5wtzBEJOuzDQUTNl70bzRxkt+OjMqHAhfSbJTJNRyY1rIyI9iicwIId72A1iWeQ7q7p56pyET7e6Yz0seSF2iXL3hRSIs0Xmjhlu5U/qUVhhJHGhxTMSI1Wy2wKKnO0ueLrE0YHZzqwt4/FKQm60ShmV7Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oh1aV5mikjiNcgv3vEr1Y2Z7/Biql9tASWPyd7SuVzQ=;
 b=U0SRcwJ+bdmptKB/OmGxR8EaQyh571/gBLTmx7Vc+V77zgaHXvLCQ/lUMmMfroz4kIjOp8rB972F6x2cbQq4FAMQxsam8Mw1mYSqoJdRaHFqf3tPhxtvtlgxa8Z2nBxVHOKxdhAukeTcGmNnetD9+33nV6jy/GhtnvelKUU+4YO5Rqyy8HY5VRgOXrWGLYFcNt8ESiiX+//uTe/EBd5F4RYKDHPUUJCpnmpC1DH4CyFKyXBw5th6F+TXDotEb6vZxTfwfNgdBHqRTYFxzCoxaBnIAT46+D+lKsavxZaUPYy2smgiT7p7pZfbCUpEXhA4ECCrOE2HkR+9X1vltwZ6FQ==
Received: from BN0PR07CA0016.namprd07.prod.outlook.com (2603:10b6:408:141::21)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Mon, 9 Jun
 2025 22:36:39 +0000
Received: from BL6PEPF0001AB4C.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::bd) by BN0PR07CA0016.outlook.office365.com
 (2603:10b6:408:141::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 22:36:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB4C.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 22:36:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Jun 2025
 15:36:20 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 9 Jun
 2025 15:36:19 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v3] rust: introduce sfile macro for succinct code tracing
Date: Mon, 9 Jun 2025 17:36:06 -0500
Message-ID: <20250609223606.2897030-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4C:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d8a663-a5f2-4bbd-bb6f-08dda7a6197e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2CzZCmis60LPDEBiVFAT6RVVnjSFOckDbDo6Ybx3UPOJ1ihtPVuXGssQqsS1?=
 =?us-ascii?Q?hXvqb/gzuPCCPLSZxgtPUvnkb1U5ven/QZNvf2Pj1J0KRjCZ3m+JMH1MHZ6q?=
 =?us-ascii?Q?MpRiop/WDK8E5c/9Q0EnKv5uhHb5rH7je2wmxPx2kCqwTFHEyF4RI72LF4Xe?=
 =?us-ascii?Q?91G+Z9roMlRkp/oIpl5Wzh1CibFJhaRh76pBFkE4qKcB6vGAooqATFtHaMOZ?=
 =?us-ascii?Q?SjrzK6GHDrJ5hhB86AK4x9EEHz7OERPom3r36ryp32d9vdaKG52Fkx3ZEO3m?=
 =?us-ascii?Q?gx5aAhN8Ep29DcnQNXeNDXE19PNw2YfMoLYmD9yhKvVk+EimTGsGFH30aCdP?=
 =?us-ascii?Q?7TI2+Qvh2/UmASeOYnQO4GNXKqBNhuB+gSnJDMXo+1UR1a9e78LUxWTf+8nk?=
 =?us-ascii?Q?z6i9YKKdZ6QDRvY3np3Um9tNHcZqq6Thv7GdKkEDqHcezwdeb3yYF2zjMRDH?=
 =?us-ascii?Q?qtk85Rnl3g6R6VUcMA5Vgh9EfHYXrlPrqfEOeFDKZRLVNJrcFe8dj40lxo+t?=
 =?us-ascii?Q?LoVFxuZEF6jSQpWyWI3bFEM32xWwtJw5LSxM2M85tSzH5X6PaHPQRmaZzfyD?=
 =?us-ascii?Q?/tsiKIV4yBFD1R8PcQkSMESfiif5ObqvUfwn2LSQ2/+2dWm9uvUOgB+aMzbY?=
 =?us-ascii?Q?5dqdqPlFpI44K+stQVlJY1W2AulbHTJIkA1p/PzXqEbNlTgDED5hApbW5h0c?=
 =?us-ascii?Q?EnPvAmkt51ZsG0v0a8OL50lIJAQ4vsSY6GWtaInkfWcm63S+/hVTOv05JX8q?=
 =?us-ascii?Q?q2B7/gwQI0yD96MakT5PjNKFIMQm0M7zDSUU+YDn0E/bkobkatpSUavCtnkT?=
 =?us-ascii?Q?wk3dVVuNM4ZasS5gh997TUVRQ/Ht7fNMnJ7l7jB7hv4nESVRCW06Fn7lwWrZ?=
 =?us-ascii?Q?bDnHyT4KA+FGV5JjuEEoeOe42iEsOLeO8xmQfeESfl7l+dWrIIHd4amZAuQz?=
 =?us-ascii?Q?M4fOVHvZXffyouVRI6twLF5sWa0enerxsEU/PhdmuSWxlZCc7VSQ9Fi8Xwfi?=
 =?us-ascii?Q?WO/u6Ysmkk5czyJ8EG06+qO99/RT7kST3W4yniPCO1Jupenudk3DfD+ER89I?=
 =?us-ascii?Q?d+nSfmiCrRhUf5hmNHYJU6uZeCABg7L1lXRfMIbF/za9wHnR3mzy+CAmLADv?=
 =?us-ascii?Q?q3I/Qf6NEC6cF8pKNyoXWPuiHsZSiOa9TquTXz+3vVeoSo/g9jre6NUDfQHE?=
 =?us-ascii?Q?lWUVv6JrlAcgg4O4+Sb3MdLEq2hS1xPhPkaN9jShmU9DEiZfoBRmJ5384oDB?=
 =?us-ascii?Q?3kWdIRPe6RigwRLmjI3Skg+ncG4Y3Esm/S2WUkHJFqzEG0T7rfJWmOw6y/Vp?=
 =?us-ascii?Q?MRIbyuVQE5A5BSSOvnoEQ/M5EpPm3MG0FkVEuZLnMOiqkvI0YlQuJOTKJGog?=
 =?us-ascii?Q?rULFuNfzGp6TeG1Mmy9QKrMX9K1OLNoSL4KlzZPa7rxbKpGyopCP4laiTH4H?=
 =?us-ascii?Q?naYEwGThXY/9F88cOhSbX1pocqZVnANzVpykOHxoKpWE+sV9FmJFSl7uLSrA?=
 =?us-ascii?Q?mg8NvnTLZFms/j0O2fdhi6wPB3eWptm4U8YH?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 22:36:38.9182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d8a663-a5f2-4bbd-bb6f-08dda7a6197e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779

Introduce the sfile (short file) macro that returns the stem of
the current source file filename.

Rust provides a file!() macro that is similar to C's __FILE__ predefined
macro.  Unlike __FILE__, however, file!() returns a full path, which is
klunky when used for debug traces such as

	pr_info!("{}:{}\n", file!(), line!());

sfile!() can be used in situations instead, to provide a more compact
print.  For example, if file!() returns "rust/kernel/print.rs", sfile!()
returns just "print".

The macro avoids str::rfind() because currently, that function is not
const.  The compiler emits a call to memrchr, even when called on string
literals.  Instead, the macro implements its own versions of rfind(),
allowing the compiler to generate the slice at compile time.

The macro also uses some unsafe functions in order to avoid indexing
into a str, which is necessary to fully support const contexts.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/print.rs | 66 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 9783d960a97a..5b0c36481e95 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -423,3 +423,69 @@ macro_rules! pr_cont (
         $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
     )
 );
+/// Returns the index of the last occurrence of `needle` in `haystack`, or zero.
+///
+/// Identical to [`str::rfind()`], but unlike that function, this one is const.
+/// That is, the compiler can inline it when called with a string literal.
+#[inline]
+pub const fn rfind_const(haystack: &str, needle: char) -> Option<usize> {
+    let bytes = haystack.as_bytes();
+    let mut i = haystack.len();
+    while i > 0 {
+        i -= 1;
+        if bytes[i] == needle as u8 {
+            return Some(i);
+        }
+    }
+    None
+}
+
+/// Returns just the base filename of the current file.
+///
+/// This differs from the built-in [`file!()`] macro, which returns the full
+/// path of the current file.
+///
+/// Using the base filename gives you more succinct logging prints.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::sfile
+/// pr_err!("{}:{}\n", sfile!(), line!());
+/// ```
+#[macro_export]
+macro_rules! sfile {
+    () => {{
+        use kernel::print::rfind_const;
+
+        const FILE: &str = file!();
+
+        // [`.as_bytes()`] does not support non-ASCII filenames
+        assert!(FILE.is_ascii());
+
+        let start = match rfind_const(FILE, '/') {
+            Some(slash) => slash + 1,
+            None => 0,
+        };
+        let end = match rfind_const(FILE, '.') {
+            Some(dot) => dot,
+            None => FILE.len(),
+        };
+
+        // The following code the equivalent of &FILE[start..start+len],
+        // except that it allows for const contexts.  For example,
+        //   const SFILE: &'static str = sfile!();
+
+        let base_ptr: *const u8 = FILE.as_ptr();
+
+        // SAFETY: We know that `start` is <= the length of FILE, because FILE
+        // never ends in a slash.
+        let ptr: *const u8 = unsafe { base_ptr.add(start) };
+        // SAFETY: We also know that `end` < the length of FILE.
+        // If `end` < `start`, this will generate a compiler error.
+        let slice = unsafe { core::slice::from_raw_parts(ptr, end - start) };
+        // SAFETY: We know that the slice is valid UTF-8, because we checked
+        // that FILE is ASCII (via is_ascii() above).
+        unsafe { core::str::from_utf8_unchecked(slice) }
+    }};
+}

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
prerequisite-patch-id: 4bfda16a333b9f00a139050b7c6875922961a15d
-- 
2.43.0

