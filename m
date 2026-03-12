Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010042.outbound.protection.outlook.com [52.101.85.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF9A386556;
	Thu, 12 Mar 2026 03:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285318; cv=fail; b=nJAjHYOWAPjaPpkLCKtPt5xxxEpTA7/sJ/Au8gsTBQpUtANeqkQStSW7e4JpeN5j1pE2nN9gJ99r4d4EK5AdiNIW4Uw+M8Es91OyKNhy3TjjRs4sdUoRLKS8miIKgo8glKsdr4gWO8BaKlIcw2fvLsxhWqj0xhC2ysviBXl5RTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285318; c=relaxed/simple;
	bh=Yk5V8FUsXpVgkgWbpkBqH4UNTTqxVU1rJXV5jkVwc0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tt4FSy80ngcHfr3UIdsQfmGGfiVrGBzA3T3c9DuO6bNyA0/Ro6ESlAajr9j0wOKGMvpwPdyXchgDpo1Uu2kIVMriPo4WpEiRFCZFfKMyDlhfGneHtzNeP4NI1673Po9g9bISZVCNuaVn5z7z+pY2Z72HfllPSh74Nv5M3/0iras=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H8vKVq5P; arc=fail smtp.client-ip=52.101.85.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H8vKVq5P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkHHCRUBgyYcrSO7ns6KNzt+oX0ldrzq80/C3jAI8aSfk4aTSPE70YHPbTGv5RLmn/92jnaXZJFU1JBBrWXcvA/IsEQCIX4TLYW22kwg1ZT4ATrEpHlcnOzGWAFjrxHAgp2ri5glSNi+5Aj2FITvjnMINr9klr2rtLpqv1o9xkIJ0zFB4fG/7KrIgI8T6vQABJDaA4RIbQGNHNbZw/hp+ulbqIWpW7KRBOpN41AgHszIoMzeU1y2NE4+kp6YrJ77jR3cTOZe0NGMnryt1dqA8O7eVf098f0FWGW6Xf25iyHxmcgPUqyxz8EprxfwCQDeGLDGKc1fZ/K0P0PGFUOPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHI0PebKKtLUBjEUbDNlWdEkYipXWVOmL5mhicvHWBY=;
 b=mVHziVPeGmFMJMcLgpjry+LL3hmzwRlbh0dNLCGst/15xVjvTteVKIccsrvG/P8XKsVigbdjrg6qIAdzs0aPa5QGY/nycUdYPuqzC5hO5YCNDwr6jHY03f8BJFYuh/x5zEIVSaLNX+9a7ZUTjHStBR6aJ0X5/tEhsnel007rDG+zXDC2ggV2fltNtYom0T4oIebxbD1WEiX8AddaWDWAFoSzixolMuQKvB+57vMPrM2bb54n/t8VtOSACVpoj/78bJ9m65kwR2Wm+o3aewn4l1m+L1v/ZsajM4V5v+QAsMJBIRqsK/neFqD4VuiT3ExSAXFiKjvafaEtZxaOGgU3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHI0PebKKtLUBjEUbDNlWdEkYipXWVOmL5mhicvHWBY=;
 b=H8vKVq5PqNmB5zOHGmCdUEUrCXTTQZroghtp3Md8jOakLg7abu0bD5oZDcxkyxawf6vSIFva4LWq6FBz/RXc5PZGNskXlyVGd5IaofLweeiH2/dhv35Kwm1aTY9coz5bJ/WMAJAOsHaXHOAgWLclKNkK2Fzwf4tWWWoTzE171m+tTDtqJL6nSkTCjvQcxU8ocQiKahOEcIVQONiDvOdNBdGRLei9AvRW5+Z2XllTgxG8kUa10XlSzCx4aINI45qIfLbxXLmzc3roLtmqZacw4SaGHihldlQ0G50Ylv6PYhIFlClpcyk+VA15SVtI6ZPZkBbzEC9sidC/WToaWx6YcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY8PR12MB7563.namprd12.prod.outlook.com (2603:10b6:930:96::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.4; Thu, 12 Mar 2026 03:15:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 03:15:12 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 2/3] rust: ptr: add Alignment::from_u64() for DeviceSize constants
Date: Wed, 11 Mar 2026 20:15:06 -0700
Message-ID: <20260312031507.216709-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312031507.216709-1-jhubbard@nvidia.com>
References: <20260312031507.216709-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY8PR12MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2d8d8c-031e-4e50-a7d5-08de7fe592e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ajuI9Drn27yJBiw1bVEmccLEzdKBm3axz6E9m5XAjVVtDGKq+2Ww3cr8ZF7BaPIupC+5pqb14MszZ27HopzR5EzLzYZ33VmkaED7SmffxszyayUHXWSUYt2q/7LLINAHV8KXHmWtjE47uggbg/NprFlcijXEzH4elM5Ffkw4gGLD/F2o1V8Nf4ZIrOfG1v77NMfOHZHrQFw1Mmg5z2KKLkHxKmR/GYSHIWcMlBo+J/1dNx4t4aE587UyX7zMXAUaKiPEJCcPe+MoDZekRC+yAikHye2+vQZvV5FyRzge9bbdXkYRgfW88FmNKUoOwRiodeKCSjnnrsT6U0KEsaONHC7+TVvOENn7aytTHgcZ+SbYbQZwUYhxgR5A/tNNwZmaubhN6AyR9nFbygxolnkPBhxTtJLb/iU11Pb054ErgzdGu3K9Z9aYWH/AYv8/0Kxatx6DpyfMwsZC04WXnPHck+gH48+yUa6gLQkF18OJd8y/ad6OjKk9hJkEZG6Q79XWDqPsfUQHMZQeXCZQwUxx8oijnCJa/N1s5tzq7wXZYadgqGfFYo6zqqBpk8bxQCFdH353+oYZ43PWelWiFx/sPPKYvVY8TFpjZHRjdi/09mDo1mA5w/0Wt9jShZ7r7BJPPuNEhvdid9T7Ttw/jv825wubrD2ijyPOk2rBz7zb5w4GdIxKhEQm7SLukmqeJ3Mpde0ReMfTy+sYwQ+UmpcTxMi3KGJUDmfMTX1InS93cRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1lbxZtwQjaFoJXYtzkaCQ3XVj379gz8SYcdtR6VfeKfrYnSUlfNzR396gag9?=
 =?us-ascii?Q?VT4D8MN9j1K8kfpi2hmCbIf+q1zl7h8v9221gZqKPH3Q4qcNSqqPsa8UMBgN?=
 =?us-ascii?Q?zNK97kWAru1I3j/8Ha02zXJa8f2wRiMXfyzN7vG1k+khCLGMHTs+2E+7yt70?=
 =?us-ascii?Q?KH6zRAzhWWBECu/K2s+cybF/n67igaLd6zAejwgp9hBwqgMTUVFWI4OBFcK3?=
 =?us-ascii?Q?p3/b0q/6TbBXc9SbQ8D+wv+/7GTQhn7Xp6BLFxjD9MBVoRJRLIxiff843tHX?=
 =?us-ascii?Q?9c5ZMMnzjevoohx/LDXmIsNXfGNJiBV2sVpdSS2eIj38qJ6taeAfkvC/ANvJ?=
 =?us-ascii?Q?5Fdt+6M8tmA1EUIigGp8OClVx7JvMM3EW8TxUqtwyiS130hc4skC4RNkbc0I?=
 =?us-ascii?Q?YievHDIwBOA7L+YzdEQMxe9W/Vzd/LN3/T1v+beSU6NTfxdVCLNvPxPvPUru?=
 =?us-ascii?Q?Gug0qJMmYnFAVL6y28iMUiO5eWrDxZ7s9fWPgxWJ+v2y1iv66IJvjpzA1YJ/?=
 =?us-ascii?Q?re3vo2BSof4EOfHfrHTOSwh21I0dM2jzl+fp94XGqsB3RxG5X0X5AjV+Erw1?=
 =?us-ascii?Q?gS7KEg9pQDXxnEYBeXc0aV1m0Q7asGscISW/OdhkdEP02JOxyp1iy/E7Krb7?=
 =?us-ascii?Q?/UXQSYNj+SvkHusDPkXs/c0VdVfAVcLv2eCeti23IQZgBI/CHs17r7V3ECKH?=
 =?us-ascii?Q?isT0AKA7beU4KjWisMUzK0YcxRg6hHqKevBLrJx47BJB/CE2k/aoeDYSih1L?=
 =?us-ascii?Q?OEFwkfTJZbTht0PDXldZLVybJnUrWFK9s4afNQkaPFrYJE1iILeex4sQBmY0?=
 =?us-ascii?Q?FxLrxsvqlq/6prVcCVZ5kPjR06hm+m5qKtUTffdebaE03tKfPGR5aDfzh4QF?=
 =?us-ascii?Q?I6iUGEpOuJb29cS9SGIzi6D3wgKyPO8sEFJYvo7j0pab8QiHchV6MfDHh/n5?=
 =?us-ascii?Q?jZvRRwzUFKRSYY3dYv0dLEkeYQnUMiaSt3gjPO0z0QLsFMmX6ifyozH6537z?=
 =?us-ascii?Q?q2L8ZUyNnN5Y0soymDmZmFWMq7XMJDMgwusu/97DGxuZHzJqlhK6OF0TvSNx?=
 =?us-ascii?Q?54grDcfS0A4PH2MW4SQU3rnkUKhePXzKh4US0D82QVKr6S95DW59DfI6yMV6?=
 =?us-ascii?Q?iLXpcjBP37N+7Bf6Q3j+6zCVhZ1nOEpgiicBxGkQSD+2UdOwZM3q6BwH2vme?=
 =?us-ascii?Q?1MATNWvyoZa1hRw3Kzb5N98rS8qQwJ+gfVfymoVzwNoCsdi1u7JCQsEdTa4t?=
 =?us-ascii?Q?pIk4zdSOQncmnc7WZZeiR3VGmeoBjgTXutmz1fMJO6YC9Kz4OFYCkJtYrMX+?=
 =?us-ascii?Q?Dor2uLQDJqD1TipqB9Z4FujBXF1EJ1KzwMOJrM6roP6h4UD9NvvHcR3gkcRy?=
 =?us-ascii?Q?0/p9X+5/nMwyR8B3pmxY7hpTyE/JNiPd74rrMzaQegE3TkWDoRHaCm3buL1m?=
 =?us-ascii?Q?3M/GR/7KCrIwzLGCo++46pkp+e6fUXn9xB5ETCIoW4TWwy/FQOoX4vvSrYU8?=
 =?us-ascii?Q?vk6PVcNtKErkQ1eq8NbCXUac9Q1cLtH9CrcFXkIvdU7a0zko/OFa6dfon1mm?=
 =?us-ascii?Q?ctHMn6GrnZ0Xskn42O12tVGYi3ZBbBvBUcGNquC0SWxu7MWg8Wq7ZewLopWT?=
 =?us-ascii?Q?lc4ldxjefubLkOGmsU6PvQvr0kwEOhbYg8bF/NFZESE9dSm3I7zk5It0rP5w?=
 =?us-ascii?Q?2xSkW3OS5cUow2OBOJ2JxWOmz44G2JjGJV7Z7PhjgnggCNvnt69xxuKzI66Z?=
 =?us-ascii?Q?SD3Kwy4iTA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2d8d8c-031e-4e50-a7d5-08de7fe592e9
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 03:15:12.3658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: diXe+5envG+I9lF32Ql/WlzvieyJlz/dfnqZTajgSIkaEJUPCkvJmlLob5cabem0w2DxfztLjPHa7IVDUXWT0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7563

Alignment::new() takes a const usize, which means callers that work
with DeviceSize constants still need to import the usize SZ_*
variants. Add from_u64() so callers can write
Alignment::from_u64(u64::SZ_128K) and stay entirely in the
DeviceSize world.

Both asserts evaluate at compile time in const context, so there is
no runtime cost.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/ptr.rs | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 5b6a382637fe..b06f6b404a46 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -76,6 +76,41 @@ pub const fn new_checked(align: usize) -> Option<Self> {
         }
     }
 
+    /// Creates an [`Alignment`] from a [`u64`] value.
+    ///
+    /// This is useful when the alignment comes from a [`DeviceSize`] constant
+    /// rather than a [`usize`] literal.
+    ///
+    /// A build error is triggered if `align` is not a power of two, or if it
+    /// exceeds [`usize::MAX`].
+    ///
+    /// [`DeviceSize`]: crate::sizes::DeviceSize
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    /// use kernel::sizes::DeviceSize;
+    ///
+    /// let v = Alignment::from_u64(u64::SZ_128K);
+    /// assert_eq!(v.as_usize(), 0x0002_0000);
+    /// ```
+    #[inline(always)]
+    pub const fn from_u64(align: u64) -> Self {
+        assert!(
+            align.is_power_of_two(),
+            "Provided alignment is not a power of two."
+        );
+        assert!(
+            align <= usize::MAX as u64,
+            "Provided alignment exceeds usize::MAX."
+        );
+
+        // INVARIANT: `align` is a power of two.
+        // SAFETY: `align` is a power of two, fits in usize, and thus non-zero.
+        Self(unsafe { NonZero::new_unchecked(align as usize) })
+    }
+
     /// Returns the alignment of `T`.
     ///
     /// This is equivalent to [`align_of`], but with the return value provided as an [`Alignment`].
-- 
2.53.0

