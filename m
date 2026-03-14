Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011059.outbound.protection.outlook.com [52.101.57.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280AC2517A5;
	Sat, 14 Mar 2026 01:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773450417; cv=fail; b=dVhA32GBqgFu3eaL1u4V86lhFIFI1DCrMyvSCYeLYj2HbdMA/P1PgamiGpFd5oN7aergh7cW2Qfak9W56bQRqwacoElfSd8OxvYNWdgSeswFH3ZXkhpMvQcKk/R+wAL1XmmZGjdtWCi2NOFhtR1VnrBk1xFAh4iSbxICcs6TC+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773450417; c=relaxed/simple;
	bh=8se6tM1SnAQB4KBKef+i0ndmBW3rc5y+8v/P03v7LLM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XEaDjWQUzDHg9dbYinX42EojeypRVIGsbcNRR0IMRcezLzLnmFat1ZJx6iFRi2rXgUX1TS9N4oqdplzT8G+Wx7D575SzRYX9QbuMcZrD0mlCgclodScDBqnQIBJGvALzkMQHuNlX/l7PKrOlx3jgendcqivGwMlHdxIqdzeQ7MA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L+fvQPrA; arc=fail smtp.client-ip=52.101.57.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L+fvQPrA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r51qDny8Lz0vtE9yKW/3bzqcP2FigS8+2gIq73Bxh2ZH516IU2Pt7LBm/3Nbss58KcWTxlyRm58mLKjq+UWjFd2iJQ913zPbYOyaw3Wp2OJXYyh1wnuNxrQghvG8UPypamtp0TGSIadiEPJ47BkUkM9MgUjOjUW5SjjxzjCBGxbTjCLtYx6/pcMnbWNBIAv1VESnaI4kZ+hUA88NHWR9inA7bqkzSI1zY1ux6EETYkiwvAxrT4EhyjsMTUKNXrsXWlUcsFu3TyhWKcqD48nQ9yG4NhmsLvaFy7b+GVW32QvLNd9r66dNXXZIjJ1hZ8BDupdsZSiu5YbOTGMkpkKRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plts2w1j13B/V544+z+lhv+EUY6uBSOLs+JhOcBxnMM=;
 b=DRxhphWkaconNh27Vuie7CNnKUkWy8t4JwnU7FZ3va/VnEaqy9dmde4SegDIKvPB3t+fS1nWz9SBpQYNxo88zZrHD9rTq9oxSe3ayY1xSfQ0eFlxhBgqWSaODS0aIIrvhDVUd8r4QqT3tp4N9hULk0VlKsnbsoLzdH5JItR1pTVs+O4MiRU/R6cRJO3+m6nf39acXm2HSAyqeug99CmNxadcyw2/SJ0sUBijyR3w8IOMNFymKzL/9xGnCqsM2LIXvQKI6SOnW9JhgqRYir0Ap5E9zwzqr6AAHQcrDvpbCqATpng6QQDGXs4fu5ribHf62VG/jq+UF+MFf9KJgh0aOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plts2w1j13B/V544+z+lhv+EUY6uBSOLs+JhOcBxnMM=;
 b=L+fvQPrA5tmXo90HCzKz1CFwjMk+jedkPu8IbxCk0XIWNr7p5Vok4mzRLoATLTHlanZZSKcbnObTdIWwiKT7j8KgK0ZmP/tw/IAnZOy9wA4O/b+brbURg/KihBFPtT2sGsFtoFSDzWtUe1Ip8hcx3BRhPNd9wxFnj8RmR69puB3M7xKL7CFs1xhIRSpgqqfagh3iMBubg9ySNwESGpGyFJrSXN1mYIXmB1mSnVMFz1V+pNZS9IpAtMmoKkopC7l2nQ+4/68Pn81npBL4tfNDChjqJ+qzEAbp/+HjN4xvfwS9NvPdAnf69NLXFvWbhlzwQ8txnyriHGvYqEkP5IOqag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Sat, 14 Mar
 2026 01:06:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9723.000; Sat, 14 Mar 2026
 01:06:51 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 14 Mar 2026 10:06:16 +0900
Subject: [PATCH v9 06/10] rust: io: use generic read/write accessors for
 primitive accesses
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-register-v9-6-86805b2f7e9d@nvidia.com>
References: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
In-Reply-To: <20260314-register-v9-0-86805b2f7e9d@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0071.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e362c3-83bd-4f90-1b0c-08de8165f9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2ag4lAl9I4fCgka5M7o5eHR2lu8pO5MB7qDt+NByd+p7XsPB5N4uflA/u9jGmpNtVde2mrMOvM+cmvj0ezEnbJWIy0HmBny/Xi4sHS3LmESpbANedqoKp2g/h1wXK+nqqz/N69RWcll00V7sfJQwVX/PF2vUZoeBFKJ9qwxIhTvp0EaOV9TRPU0F3z5ZkiW7Lo8vcJqpuBmMRBTjrygF4poZgTwfxsKcNWUGZpaDg4/zT0UvBDIsx3RV0nTk71TlwY0grf5xHCffjyy8wmzp2AS39PO8KMhf9qRNY79IvbW/lcAhMuzwZH42C9Lt8fbk+DzBoaESSV/or80AxyEwlNLCUFIx++9QG6v208mdOUHV5M0mAMZeJ2oocfMG0KUNUpfsKtabJv6lpVGaGqSBo2G/Y1RMCEQcp1L7XzZCJ0RZD3NybTEokv0A2yl3qC658mbVF4EkowavHlb6tC73Ntt/+iaz4CrnqK47SIKJ14HwIqKlmJGgRGyzKAl2V7O94/E/mO1D85ynSVh/r2ZkUczRNo6El5zBSVm/C15AJpUpp3f+AJiG78+Cc2fRMs0vJ9+h9Qo2t/Ngs0PlyuMwi3StKbB/7MQY7mOsIAA6Mg3voHOuWcRB269WknurxL90HStZh//6pEqgCsIM0f8rzPaU4DXW3fI5g6t/6z/aZKgSXh6k032gi20O/q6twBdpv80rIKTE1VAVjuq7ppXe8H9P61EYCH7aubuDXqQEuRuu4lj7f1+eWWerX69FhgshRfiafMWZ4zSVVa1A6MGBmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFA5Z0dXVzltbDVHNURCcWY0VkI4YW5qenAxOVJkWEd0VkRyc1E3U1NJeWRk?=
 =?utf-8?B?Zk9oZ2p3d0pUOU9EQnkwTlliQWljSk1DR1F6MVlvN2RaZ3pub04vbUlKeVls?=
 =?utf-8?B?OVlPbUdZOGNrMFpSYTNzb0NtOXdybWx5eStKOXdPMGVVd0MvUGFKY2RmUXRB?=
 =?utf-8?B?TjJTbElta2N4dVk1ZUc2VWJqZ1YrNkFtUU9uSXFoaDRiK1d6MlRabUp4V29S?=
 =?utf-8?B?Z2l0WWFoclMxRzNnMG5VemgxcHdmRGROR3gycFJ2anRKT2luS1NrVnRuMXVE?=
 =?utf-8?B?TWViOU5RdDRxSS9IOXoyTDRDZSsyejEyVyt2YjloQ0RmUC9kTlgyemxiREhN?=
 =?utf-8?B?WDNNN0t5RHBNWW9Sb1BaU3lSeGdhTlgyeE0vMlZnUlVFQmVITE5RTk41anR0?=
 =?utf-8?B?Wkp3V0hhZzlQVVdNcTlNRHVkTndwR1JpRCtmMHpVeTNQeDdzN3c5dVNTT2Nh?=
 =?utf-8?B?Q1BYK0lVU0lyTmJ3VXJwZW8zdFV2eXB5RWFzalBRRFdYMTQ3WWY4L0drWUlT?=
 =?utf-8?B?WmpYeVI3amRjR2x0c1dMNEdqRU5XV0JrcUsvTU96MTdyOVB6VTVnVnpiWllP?=
 =?utf-8?B?YnpPdDVSTFI4M3dtTUM2dWRFN0JLTlQvZ0NoS2FjNkx6V0k1VVlmU0FtR0N4?=
 =?utf-8?B?MDVzZjIrK21IWXFPbW5pcDNJY3k4NEdrbnlBOVNFT0NoVGE4dng1bWo0Y1Zt?=
 =?utf-8?B?M1ZSUXZGbUJUTWczS3pVTGRhQmJOZTNaZ3gzczlndVdUZnc3R1R6QlNDNWJk?=
 =?utf-8?B?ZHg2ODlvaGw1TnNkU3AxdEF0L0YvODlwVXJVang3NWIvTDlqN2dORVVZeUhz?=
 =?utf-8?B?ai9wZ3NuYzFtVGxxeG9UMVpKSXlpd2pSMmh1MHhsL2JqWitTd0IzUk16d1BJ?=
 =?utf-8?B?TWQ5QkZzUW9ha1JtNDhOaDkxWG4zR1Q0T3pROTRuWXZLbnc1aVc1N0YvTFNP?=
 =?utf-8?B?M2RhSDFGUlBhLzhvdGJVaVI4WkF2b01lMDVkSFF2VisyUDZrT0NZWXlneUVO?=
 =?utf-8?B?T0w1VDNLeUErazY5VmpBSlBBWTFLdkVkNWdtUTZJZFV1TGNJVUZEZUdxS1Fx?=
 =?utf-8?B?dXhSSWlmSEVxclc4eHZBbVh3bVhlM1ZiK2VyeUdNZXZQbWp5aEVIWU9hV1U0?=
 =?utf-8?B?eVovTXFTNUpXY2svWVczdGllSStEaVdYL2lWTUdGQ1V4SS9xaWdwNlVmT1VK?=
 =?utf-8?B?WHd4OE5HTU5Ea1hjR0hKSURnYUhqN2RINjhXT0RueTZ4bGdDRFBxUlB0TE9O?=
 =?utf-8?B?VDNsY1J3dE83ZXdVbWQvYWpIZW5Ec1p0aEZ5M2xsckk0bG1RdnZTMUExaEhq?=
 =?utf-8?B?RktybmQrbWtJam82eWFpMU5hSEw4cW16TnljYTlmdVlBNVBubmxCeTZuMlVL?=
 =?utf-8?B?UlNqYXNrVXg0bWRFaFJYWENtZTJLakxRdDhIamVhUTBMVXBYMzJMaTZ0MGha?=
 =?utf-8?B?TXdSTS9NK2FuYnh5OU5rTGxOT2YxaWV2WWFGWmRuRjlOOEJydXJ6aVRZNDFJ?=
 =?utf-8?B?RklRUmtNRXFvelRIUXF4dHZvcFNkSWc5M1dURmNlSjBtWGZZcGFCSmhwNHJ2?=
 =?utf-8?B?Y09SYVIxbWduVUtwSEE3OCtIVUh3REZvUDZ3UHZOcFVydkRVWGtSRkJWRkJr?=
 =?utf-8?B?Z1c5Sk5xYWpLdEZaTENlWitQeFFZVmRiTkJkM2tlTmNETi9NUXJUbzNyblFv?=
 =?utf-8?B?Z0lrTWZIc3lkSFN2cHNOR1BOb2c4RklMUmxKaUkxSnFWTkpoSFFicC9uSVV0?=
 =?utf-8?B?R3ZpckNjS0svLzl0eWVFWWlyQUxlUkZmMlFNYm8rN21uOGRnT2NaY2lZTExW?=
 =?utf-8?B?aStySitZbDlOQkxBNmVlaFZXRG5HbnRqd3p5aU51YjZabEZrK0dTelhEaUtK?=
 =?utf-8?B?VGkzOG1ndXpiOENDNEh6MWpNbS8ydGVPNEpndVByeHNjK2Qza1RucWxaaUlz?=
 =?utf-8?B?MDNNWEE4bzB2d0cvSzhvOEc1M2EzN3N0UU9hUUIwdXI1R1p4dDc4RTBMNXRs?=
 =?utf-8?B?TGpRM1ZCV3c5cUlqUU5NbytCcU4vUjNHTklPbnBZUGkzVlBNYUZzWUh2RytB?=
 =?utf-8?B?RDgwc3lrR2xCeEE0Uk5GVHl4TVVhMGkwcHJCOGgrNjdpZWd0elk5TG82TTRO?=
 =?utf-8?B?Y0FVbHFCd3JCZ2l3bFpBUHZEOHFvKzNLM1YvVkhyaG1VZVpjbTlKTW9maFlC?=
 =?utf-8?B?KzVUVUNvc3AxNFlhMXRWUHNLNHJFSUx4eENEWUhZRFFoV05YYTRBSHY3SUlu?=
 =?utf-8?B?dTBCQTJndXZwMkQwSG9ZeVBnOFdZNENHWm9QQXFRTi9iMXhiUk1RZVJsY0NR?=
 =?utf-8?B?YUpTMVl3eVdmWlZoaXdHS2oxZkdiK09uY2F6MlFJWDAyemRkRUp5ZVg5Q3Fr?=
 =?utf-8?Q?PxNViNL4SE1peyZoLr+GDxtUAJWbvYKjVslxCKdyDEa+r?=
X-MS-Exchange-AntiSpam-MessageData-1: Hx9E79Et+zQW9g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e362c3-83bd-4f90-1b0c-08de8165f9b1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 01:06:51.7231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CjHsWLaeKReVANOml1HAtHNTkPPLy55Q+NUjR9TAnxTEw7PeiJAohU8MHq7I0rXL4X6ufAm+hja8MS6n7H7Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033

By providing the required `IoLoc` implementations on `usize`, we can
leverage the generic accessors and reduce the number of unsafe blocks in
the module.

This also allows us to directly call the generic `read/write/update`
methods with primitive types, so add examples illustrating this.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io.rs | 218 +++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 150 insertions(+), 68 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index e7e32f921efb..c9d43b1372ab 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -197,6 +197,26 @@ pub trait IoLoc<T> {
     fn offset(self) -> usize;
 }
 
+/// Implements [`IoLoc<$ty>`] for [`usize`], allowing to use `usize` as a parameter of
+/// [`Io::read`] and [`Io::write`].
+macro_rules! impl_usize_ioloc {
+    ($($ty:ty),*) => {
+        $(
+            impl IoLoc<$ty> for usize {
+                type IoType = $ty;
+
+                #[inline(always)]
+                fn offset(self) -> usize {
+                    self
+                }
+            }
+        )*
+    }
+}
+
+// Provide the ability to read any primitive type from a [`usize`].
+impl_usize_ioloc!(u8, u16, u32, u64);
+
 /// Types implementing this trait (e.g. MMIO BARs or PCI config regions)
 /// can perform I/O operations on regions of memory.
 ///
@@ -241,10 +261,7 @@ fn try_read8(&self, offset: usize) -> Result<u8>
     where
         Self: IoCapable<u8>,
     {
-        let address = self.io_addr::<u8>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 16-bit read with runtime bounds check.
@@ -253,10 +270,7 @@ fn try_read16(&self, offset: usize) -> Result<u16>
     where
         Self: IoCapable<u16>,
     {
-        let address = self.io_addr::<u16>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 32-bit read with runtime bounds check.
@@ -265,10 +279,7 @@ fn try_read32(&self, offset: usize) -> Result<u32>
     where
         Self: IoCapable<u32>,
     {
-        let address = self.io_addr::<u32>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 64-bit read with runtime bounds check.
@@ -277,10 +288,7 @@ fn try_read64(&self, offset: usize) -> Result<u64>
     where
         Self: IoCapable<u64>,
     {
-        let address = self.io_addr::<u64>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        Ok(unsafe { self.io_read(address) })
+        self.try_read(offset)
     }
 
     /// Fallible 8-bit write with runtime bounds check.
@@ -289,11 +297,7 @@ fn try_write8(&self, value: u8, offset: usize) -> Result
     where
         Self: IoCapable<u8>,
     {
-        let address = self.io_addr::<u8>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset, value)
     }
 
     /// Fallible 16-bit write with runtime bounds check.
@@ -302,11 +306,7 @@ fn try_write16(&self, value: u16, offset: usize) -> Result
     where
         Self: IoCapable<u16>,
     {
-        let address = self.io_addr::<u16>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset, value)
     }
 
     /// Fallible 32-bit write with runtime bounds check.
@@ -315,11 +315,7 @@ fn try_write32(&self, value: u32, offset: usize) -> Result
     where
         Self: IoCapable<u32>,
     {
-        let address = self.io_addr::<u32>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset, value)
     }
 
     /// Fallible 64-bit write with runtime bounds check.
@@ -328,11 +324,7 @@ fn try_write64(&self, value: u64, offset: usize) -> Result
     where
         Self: IoCapable<u64>,
     {
-        let address = self.io_addr::<u64>(offset)?;
-
-        // SAFETY: `address` has been validated by `io_addr`.
-        unsafe { self.io_write(value, address) };
-        Ok(())
+        self.try_write(offset, value)
     }
 
     /// Infallible 8-bit read with compile-time bounds check.
@@ -341,10 +333,7 @@ fn read8(&self, offset: usize) -> u8
     where
         Self: IoKnownSize + IoCapable<u8>,
     {
-        let address = self.io_addr_assert::<u8>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 16-bit read with compile-time bounds check.
@@ -353,10 +342,7 @@ fn read16(&self, offset: usize) -> u16
     where
         Self: IoKnownSize + IoCapable<u16>,
     {
-        let address = self.io_addr_assert::<u16>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 32-bit read with compile-time bounds check.
@@ -365,10 +351,7 @@ fn read32(&self, offset: usize) -> u32
     where
         Self: IoKnownSize + IoCapable<u32>,
     {
-        let address = self.io_addr_assert::<u32>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 64-bit read with compile-time bounds check.
@@ -377,10 +360,7 @@ fn read64(&self, offset: usize) -> u64
     where
         Self: IoKnownSize + IoCapable<u64>,
     {
-        let address = self.io_addr_assert::<u64>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_read(address) }
+        self.read(offset)
     }
 
     /// Infallible 8-bit write with compile-time bounds check.
@@ -389,10 +369,7 @@ fn write8(&self, value: u8, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u8>,
     {
-        let address = self.io_addr_assert::<u8>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset, value)
     }
 
     /// Infallible 16-bit write with compile-time bounds check.
@@ -401,10 +378,7 @@ fn write16(&self, value: u16, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u16>,
     {
-        let address = self.io_addr_assert::<u16>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset, value)
     }
 
     /// Infallible 32-bit write with compile-time bounds check.
@@ -413,10 +387,7 @@ fn write32(&self, value: u32, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u32>,
     {
-        let address = self.io_addr_assert::<u32>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset, value)
     }
 
     /// Infallible 64-bit write with compile-time bounds check.
@@ -425,13 +396,31 @@ fn write64(&self, value: u64, offset: usize)
     where
         Self: IoKnownSize + IoCapable<u64>,
     {
-        let address = self.io_addr_assert::<u64>(offset);
-
-        // SAFETY: `address` has been validated by `io_addr_assert`.
-        unsafe { self.io_write(value, address) }
+        self.write(offset, value)
     }
 
     /// Generic fallible read with runtime bounds check.
+    ///
+    /// # Examples
+    ///
+    /// Read a primitive type from an I/O address:
+    ///
+    /// ```no_run
+    /// use kernel::io::{
+    ///     Io,
+    ///     Mmio,
+    /// };
+    ///
+    /// fn do_reads(io: &Mmio) -> Result {
+    ///     // 32-bit read from address `0x10`.
+    ///     let v: u32 = io.try_read(0x10)?;
+    ///
+    ///     // 8-bit read from address `0xfff`.
+    ///     let v: u8 = io.try_read(0xfff)?;
+    ///
+    ///     Ok(())
+    /// }
+    /// ```
     #[inline(always)]
     fn try_read<T, L>(&self, location: L) -> Result<T>
     where
@@ -445,6 +434,27 @@ fn try_read<T, L>(&self, location: L) -> Result<T>
     }
 
     /// Generic fallible write with runtime bounds check.
+    ///
+    /// # Examples
+    ///
+    /// Write a primitive type to an I/O address:
+    ///
+    /// ```no_run
+    /// use kernel::io::{
+    ///     Io,
+    ///     Mmio,
+    /// };
+    ///
+    /// fn do_writes(io: &Mmio) -> Result {
+    ///     // 32-bit write of value `1` at address `0x10`.
+    ///     io.try_write(0x10, 1u32)?;
+    ///
+    ///     // 8-bit write of value `0xff` at address `0xfff`.
+    ///     io.try_write(0xfff, 0xffu8)?;
+    ///
+    ///     Ok(())
+    /// }
+    /// ```
     #[inline(always)]
     fn try_write<T, L>(&self, location: L, value: T) -> Result
     where
@@ -464,6 +474,23 @@ fn try_write<T, L>(&self, location: L, value: T) -> Result
     ///
     /// Note: this does not perform any synchronization. The caller is responsible for ensuring
     /// exclusive access if required.
+    ///
+    /// # Examples
+    ///
+    /// Read the u32 value at address `0x10`, increment it, and store the updated value back:
+    ///
+    /// ```no_run
+    /// use kernel::io::{
+    ///     Io,
+    ///     Mmio,
+    /// };
+    ///
+    /// fn do_update(io: &Mmio<0x1000>) -> Result {
+    ///     io.try_update(0x10, |v: u32| {
+    ///         v + 1
+    ///     })
+    /// }
+    /// ```
     #[inline(always)]
     fn try_update<T, L, F>(&self, location: L, f: F) -> Result
     where
@@ -484,6 +511,25 @@ fn try_update<T, L, F>(&self, location: L, f: F) -> Result
     }
 
     /// Generic infallible read with compile-time bounds check.
+    ///
+    /// # Examples
+    ///
+    /// Read a primitive type from an I/O address:
+    ///
+    /// ```no_run
+    /// use kernel::io::{
+    ///     Io,
+    ///     Mmio,
+    /// };
+    ///
+    /// fn do_reads(io: &Mmio<0x1000>) {
+    ///     // 32-bit read from address `0x10`.
+    ///     let v: u32 = io.read(0x10);
+    ///
+    ///     // 8-bit read from the top of the I/O space.
+    ///     let v: u8 = io.read(0xfff);
+    /// }
+    /// ```
     #[inline(always)]
     fn read<T, L>(&self, location: L) -> T
     where
@@ -497,6 +543,25 @@ fn read<T, L>(&self, location: L) -> T
     }
 
     /// Generic infallible write with compile-time bounds check.
+    ///
+    /// # Examples
+    ///
+    /// Write a primitive type to an I/O address:
+    ///
+    /// ```no_run
+    /// use kernel::io::{
+    ///     Io,
+    ///     Mmio,
+    /// };
+    ///
+    /// fn do_writes(io: &Mmio<0x1000>) {
+    ///     // 32-bit write of value `1` at address `0x10`.
+    ///     io.write(0x10, 1u32);
+    ///
+    ///     // 8-bit write of value `0xff` at the top of the I/O space.
+    ///     io.write(0xfff, 0xffu8);
+    /// }
+    /// ```
     #[inline(always)]
     fn write<T, L>(&self, location: L, value: T)
     where
@@ -514,6 +579,23 @@ fn write<T, L>(&self, location: L, value: T)
     ///
     /// Note: this does not perform any synchronization. The caller is responsible for ensuring
     /// exclusive access if required.
+    ///
+    /// # Examples
+    ///
+    /// Read the u32 value at address `0x10`, increment it, and store the updated value back:
+    ///
+    /// ```no_run
+    /// use kernel::io::{
+    ///     Io,
+    ///     Mmio,
+    /// };
+    ///
+    /// fn do_update(io: &Mmio<0x1000>) {
+    ///     io.update(0x10, |v: u32| {
+    ///         v + 1
+    ///     })
+    /// }
+    /// ```
     #[inline(always)]
     fn update<T, L, F>(&self, location: L, f: F)
     where

-- 
2.53.0

