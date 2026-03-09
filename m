Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010061.outbound.protection.outlook.com [40.93.198.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFE83DA7D2;
	Mon,  9 Mar 2026 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069286; cv=fail; b=PnXx7lTsP6sIBF60Vjn5ZJNWYRntscasu4yR2nppgEPyfxyNka0ncq3UzYWW6G6d0zB+ZKRkXg/nZJiRCANVF7OGZLrwNaQQ32pdELiDWKzld/xxRgIZl8ztMYMy0DTtTaZTdWNKJVAYPeHqc1BrD5yP7HcjiVYQWQyf6BczGXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069286; c=relaxed/simple;
	bh=0BjgrF6bkB+OVqzBIQhnrAvYjKQpkCmh4w4YvmD2gto=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gu6dD877Lkkw9pjWgdY84qqRAXLMoJSTz9xC+OmlE2s2pIfq/r7M091Tp0uWyMMTPwIE03jXndrOt6bu4sd1JapdUWsumRBEiJqlmCF+9RdwG9mYSSxkvMDh+ih5CXHPxIoEzmo9D7yWF5TSZWpqw0VhT86IcaWveIzFv1Ve1aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TeFC4zYx; arc=fail smtp.client-ip=40.93.198.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TeFC4zYx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u27M0QclgNeVS9+bWHo/VPLnRpPeNxtrhGZ1rDlbLU6Isl8MN4CcDdkEWN0NWdztV8S4uIkqL1JWJuQk+MKPVGd79XejNhJYvjW2QBZe9dLiTTzzT36sksGncMEMJZ/+nP9OFh5SQBW+9eNnex+iR/InMCR4BaeMOKL6jJl0aK+JAahhWiXQ5HLhIjyWwovwQO2U74297qfy4nlIIfdVMraTV+aeogZ6A/qMyJGV1sRq+g4iJG4xjWKau4oyw5xqxTUdddFVtdW3V43Su2quTbtw7wnn6UILtKt4vkdjPE3ZsjPHgjqPboErc8en3jlO1HKZaZXDa0jBPMH5F/F0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5M9UYNc3SrS+Pmr8CpCBE2BqFPQDxrsmj77dU3U8lMc=;
 b=C1+7dn70+oojPxcdSzgWf5yZdZQE57xNx742k2eBLxnIZ83G2n1pDK9KEnK/BUofFu+aGL8tk/kPG6RoG/mK1eufAqP2hRj4d6hy3UoDzL0J5pEqHcHNDeegLw6FNxcPc/k+hh1UyjIQMiFIO//aYpmkh38Uz7/7lozPcS2oLtZnIOgXrarRSMiBPGvtiUjxKIp9eBJbgGaTqKv3IWla1jJn2VUHiRxRVvYUEwNdv5oUHBwjUGVk3ewaYfTGi6oWzXGsp/BHQVugDhp8il0lkqn5M+aEVMEihwQ5X0LoktSJo/Hgdp+QCwQE0azjUS/6bDcPmfvsN4vxKOqiWEHrjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5M9UYNc3SrS+Pmr8CpCBE2BqFPQDxrsmj77dU3U8lMc=;
 b=TeFC4zYxZlvqt3PE5c+8bBEeRigIt96GqXQskO++QNIOmRR3U+JkOYr9X8idE55zzWXVOn/n5QnvNNH+9ECa+FP65pBbwhr9RB0Na49ZXjVVqtK+xP2Q2itAAnM4bpXJM6b1IgAXAbbO6w9ux1Qew+miVxVmmt35nUrct7foAdmPachwVWLOniZSQ2QBfttub/IRNmBrL0xJUwUBBDGfXPEH74Ind7Ms4gEtxLYAiEhYfMqD6C94Zj8pEyrBnr+M81QX4tas7tvVh3BIKdZhbO1ikBxpW3fch4Jp+PYIeV1EZcespf1345C4k8Dx2QThJ9CLgoyAHsdhlyDK3mMq0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6131.namprd12.prod.outlook.com (2603:10b6:930:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 15:14:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 15:14:40 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Mar 2026 00:14:04 +0900
Subject: [PATCH v8 07/10] rust: io: introduce `IntoIoVal` trait and
 single-argument `write_val`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-register-v8-7-424f80dd43bc@nvidia.com>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: 431a1447-6698-4e29-62f8-08de7dee95ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info:
	cXNuAX9AU+6aIfuscLNp0C7FRHxA0tab5gn2eJuwb/0ptiyndqtuMRi/DWuEGAOS8OlDH/sojhD8SOxBkcs9k5qhNABBhV5ayk2M3+NXC/Sbb0LuSmPcbH/xDg4QM6HmaU8JsN7bjBid04oz3HnRAi/U01oU2CtZeOCrTO7JM884FketmLoCz1+OxiVapMVe+DrkklSagGbl8fz/klYj0KRAI30Vs0kPWW8utPTO+TAcQgmDIsnrrVeq9SOjRlSKWiIAU5iNXdr18oMyrTzKD9XZz5LO2oEmjI8YxBEbepI572MxqXdf+FDnrqt5HTJFY2FxtQGabJwXdqw1ImjB32e5d4yyjK9ZgjwL4Adrhi63VLz6AtU70uU29H/lo88YeNqocziMVg5tYmtAztPzLyKxv1TWbhRfm6L7GamkLea35jbsOTcG5Fp7P+EHM3Kmpd/dHrAxoPVogjOsudNqi6aj4yS0zza2qZ0oenGi/HbeuePUY9W2casOi4QxpCJiBU6Tuj0qQouESCxEI1gn+E+fQqnVQtEyNYlSi4V05jJV3DQZJa61LnY1w+EZkURB0R94M/zNiCIBSLXXC6yAk5fICPYpzrkAVU15DsPta++lyP2RF3foa4RC5fu/34J1p9WcO4tXEn7JvNWWZFICTNpX5BWwl7mZ0kw7aezK8jLMh/Rfd+ISKt5pCv/XfoJhaeVTJ8ufXIVoFyGYJyKNLKZeKRFfuhk6p7z9uswUWPj8aNFe50Kq3470foHkkPGJDsvNQFD6aI04AyIgiNpqXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WWJBN2NvelhVV0R4ZUlrRS9vcEVhaVpMZ0VRK2dhQUJaZ29ST2JYekRNTWpM?=
 =?utf-8?B?U3NBdTE4ZjNHUm83MEZCZUR3NEtUcEFqOFV2cmxub2c2Q1NZcnJvTmJmSlFn?=
 =?utf-8?B?NnFHWjN0UnRvOXdtdzRBbGZyNlFKOHc5NVNxc3JOTVRISWpVRm04ejUzalRn?=
 =?utf-8?B?WTVURER6Z2ZmWkcwcXd0enU0K2JLVWlIU292UHJQVTNwb0hraDgweVFtUmpQ?=
 =?utf-8?B?bVZ1N0ZpZmh5dHZtdU1WR3dlOXBjYk5nY1JTMkpiR25uRVNxbVNhNjlLSCto?=
 =?utf-8?B?QmhSZDZoMUNidjFZQlRpNVJXcmJNNS9tUTFheHk3ZkhEWGRPNmFFS2p2K0xV?=
 =?utf-8?B?amY5NU9xTDBWSlhkMUI4blFLTFFoLzBPdVRJaVRpenRIWTYwUXBkQVFYT3N5?=
 =?utf-8?B?bmdsVHFVdHZQbmlOY0pJNnZOaDRTZWtMZ1VwMVU3UHNKOSswSE5YejI1VkY2?=
 =?utf-8?B?eUowVk04MDNycUV2SFFnZHlSamNORnRudjE0QjJvMkplcHN5QmRjNER2bVh4?=
 =?utf-8?B?R0NRSFJVU2pFNm9MV2FQRXRnclFnVHhUeDhTdWlZS2N4KzdRVVQ1NFZISGU2?=
 =?utf-8?B?Zk91Tnc2OWZOa0l6Wm5HcUMvMm1OM3NRMnBNVUpqSUliYk80Qkp6cXdmRGZQ?=
 =?utf-8?B?UjVCeTl6TWplTVQzYmtJeFVGcHlsbTlXWVgvYlE0cEhRVFo1eEJHQ3N2Wmdu?=
 =?utf-8?B?a0tWSTkxeldwOHhKOXJrNHRxOXpYQjc1RWxUVmNsOHBNRG1OL2ROUC8vSyt5?=
 =?utf-8?B?VFNsSjRKSXdiOTVWR1lNSjhTakRNUC94KzVuR0daRERoZ29IdVlwa0xvSzQ4?=
 =?utf-8?B?NmdRZVpwcFFSUUpPaFc0UkdmREpESXQ2c3pYOXh6YU9DNHBOUGltZjJhZTFK?=
 =?utf-8?B?aGNNN1NIcklPRzZqd3I5aU02YVp2cEdDYlhaZG1MVWJZRkRTMTdHWXdHNFJO?=
 =?utf-8?B?Q254Y3RKeG1xcTB6MHd5SEp5T1QxazdWb2h0ejcyOVlKL3hqRHNvbndNQnV3?=
 =?utf-8?B?a2RnSTZWNnQ5Ym4rV3ExbURvUGY5UGo4YlRsL1B0YTY4cXkwWjlKczdwdUlh?=
 =?utf-8?B?aTlsRlFBck42WGROTUlMUDg5aCs0ZkNpcElHOXNSQ1lkeHNERDI2UE83T1NO?=
 =?utf-8?B?YkNlMkJYYytiaG5PVko3YWI0Z0pDeDlEL3BNL0hlNmtKcStTYUNxL2E0SkxO?=
 =?utf-8?B?bloxOWVnWlREcUNkUU15bnhtUTh4OG5Kd3c1TU93RGQ5cXlaSWN4Wjk0Z3pI?=
 =?utf-8?B?cFI0U25HTys1OFBWaG1DQjJqWmRJSStmYk1CSGVBYUNnUWNXZGNBY3VMamZM?=
 =?utf-8?B?MXpkVGYwblBVVDZETG5FV3JGVTlQWjM0N3hkUkwySks2RmpnRGJsNS9HRyth?=
 =?utf-8?B?TjZHOFJZT2R5RXRvUVhyVWlqL2R2ejJnVjZqV01YNFZFVzV4c0tqRGtEVU5I?=
 =?utf-8?B?d3MvbndlMkFib2ROTG42Vzh1TGZSZFBtd3Ztb3YycTVJcnlXRUo2OVRtUUdV?=
 =?utf-8?B?R0QrSjF5WjR0aFFEZDdqQm9sWHJRTVRybnBIRzF2UGhmd2VCUElRRndkMmhz?=
 =?utf-8?B?RnllV3FuS211N2syNC9lSFY3MlR2bmZsQzM2eXkwU1V5Y3JFUUx2aDJON2RT?=
 =?utf-8?B?OWlTZmVqOE1VMGNWRGxKWEdtYUcxZXIyMDRXdXh1Ylp2TldWb2Q1Qmlmc25l?=
 =?utf-8?B?SmZ2V29OTjVvT09jZnpPY25KTERvSVgxdWZTMmxHOU0xNFB1eW5XQzJaZUI0?=
 =?utf-8?B?a25PNlVaN1A1aSs1Q2FjL2V0eDl4K0FtbkNyRUlYR3FXYlR4NVJoZyswNVFP?=
 =?utf-8?B?YjE4dXdEMW1zSWJyNGplaWczNnVJUklHRmdqRGdHenhVZm5xRndOQnkwVVUy?=
 =?utf-8?B?ZDNUM1pvbFVvaGlTcGZDOUhIcUd0aFlkUjVqTkZ6MWJuUUJHS0lWQ1ppOEt3?=
 =?utf-8?B?dUM2R0xVY0ZRVDBCMGdOQkVXNWg1aGhYSy9adkZaRzBGTlVVK0F5TmNXTjF3?=
 =?utf-8?B?dldwQkgwazZaaldzNmFESHo4M0xyTWRUVXpmK2d1dEM1SGtqR3BVdjEzaG1j?=
 =?utf-8?B?eUhCVnhpb0ZrejFsbnB3cWJDRTFFRGkwZWFUSFRFWWI3OE9QREhKVjgycHZu?=
 =?utf-8?B?ZHp1dnJjRFVYdTQ2V1N1VkM2Q3MxcTc4KzFXanVEQXNqd29WQ1N1ekp3ZU84?=
 =?utf-8?B?bzgrMHo0Y3FFYzN5L0VnL2d1d0JqMExwYkoycEYyeWNRSlhEeXJwZCswenoz?=
 =?utf-8?B?endnaHV2bG9XTUZhckZRUjJLYjJnNkJKZUg3R1o0Qk9MbkF2ZGdlUis4QVRM?=
 =?utf-8?B?OExTWit0YjdVMUQzQU9neFVZd3Y2QkExdEZFbEczUlE2bEhUcDdKaklOcjMy?=
 =?utf-8?Q?awA/I5Wv3+F/eG4nf2c6oFPOb1HFXpN1dt4BmDykBe6nj?=
X-MS-Exchange-AntiSpam-MessageData-1: c6sbDidJSylFMA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431a1447-6698-4e29-62f8-08de7dee95ef
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:14:40.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10eTFVK3Q+2h+eHELaYczCArKrqZC8OU7jOjDxIcTkKJCtcf/+oqZahlgm+UxjhG77SRBKBRgXGGe7rif8sulw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6131

Some I/O types, like fixed address registers, carry their location
alongside their values. For these types, the regular `Io::write` method
can lead into repeating the location information twice: once to provide
the location itself, another time to build the value.

Add a new `Io::write_val` convenience method that takes a single
argument implementing `IntoIoVal`, a trait that decomposes implementors
into a `(location, value)` tuple. This allows write operations on fixed
offset registers to be done while specifying their name only once.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index ed6fab001a39..09a0fe06f201 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -216,6 +216,22 @@ fn offset(&self) -> usize {
 // Provide the ability to read any primitive type from a [`usize`].
 impl_usize_ioloc!(u8, u16, u32, u64);
 
+/// Trait implemented by items that contain both an I/O location and a value to assign to it.
+///
+/// Implementors can be used with [`Io::write_val`].
+pub trait IntoIoVal<T, L: IoLoc<T>> {
+    /// Consumes `self` and returns a `(location, value)` tuple describing a valid I/O write
+    /// operation.
+    fn into_io_val(self) -> (L, T);
+}
+
+/// `(location, value)` tuples can be used as [`IntoIoVal`]s.
+impl<T, L: IoLoc<T>> IntoIoVal<T, L> for (L, T) {
+    fn into_io_val(self) -> (L, T) {
+        self
+    }
+}
+
 /// Types implementing this trait (e.g. MMIO BARs or PCI config regions)
 /// can perform I/O operations on regions of memory.
 ///
@@ -463,6 +479,32 @@ fn try_write<T, L>(&self, location: L, value: T) -> Result
         Ok(())
     }
 
+    /// Generic fallible write of value bearing its location, with runtime bounds check.
+    ///
+    /// # Examples
+    ///
+    /// Tuples carrying a location and a value can be used with this method:
+    ///
+    /// ```no_run
+    /// use kernel::io::{Io, Mmio};
+    ///
+    /// fn do_writes(io: &Mmio) -> Result {
+    ///     // 32-bit write of value `1` at address `0x10`.
+    ///     io.try_write_val((0x10, 1u32))
+    /// }
+    /// ```
+    #[inline(always)]
+    fn try_write_val<T, L, V>(&self, value: V) -> Result
+    where
+        L: IoLoc<T>,
+        V: IntoIoVal<T, L>,
+        Self: IoCapable<L::IoType>,
+    {
+        let (location, value) = value.into_io_val();
+
+        self.try_write(location, value)
+    }
+
     /// Generic fallible update with runtime bounds check.
     ///
     /// Caution: this does not perform any synchronization. Race conditions can occur in case of
@@ -559,6 +601,32 @@ fn write<T, L>(&self, location: L, value: T)
         unsafe { self.io_write(io_value, address) }
     }
 
+    /// Generic infallible write of value bearing its location, with compile-time bounds check.
+    ///
+    /// # Examples
+    ///
+    /// Tuples carrying a location and a value can be used with this method:
+    ///
+    /// ```no_run
+    /// use kernel::io::{Io, Mmio};
+    ///
+    /// fn do_writes(io: &Mmio) {
+    ///     // 32-bit write of value `1` at address `0x10`.
+    ///     io.write_val((0x10, 1u32));
+    /// }
+    /// ```
+    #[inline(always)]
+    fn write_val<T, L, V>(&self, value: V)
+    where
+        L: IoLoc<T>,
+        V: IntoIoVal<T, L>,
+        Self: IoKnownSize + IoCapable<L::IoType>,
+    {
+        let (location, value) = value.into_io_val();
+
+        self.write(location, value)
+    }
+
     /// Generic infallible update with compile-time bounds check.
     ///
     /// Caution: this does not perform any synchronization. Race conditions can occur in case of

-- 
2.53.0

