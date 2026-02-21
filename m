Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011055.outbound.protection.outlook.com [52.101.62.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C37832AACD;
	Sat, 21 Feb 2026 02:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771639870; cv=fail; b=TZw3VgaIz59QB9vYV9sPOQEN4sCyXcWlRxSRKNLXpcQ0EEhJ+OjKNkKCi6K2bVeDX3WP0mRkRd8Srzjqmws8bzUiWZvmTugB3y+ggU1p6aRPebpTvUIPMpOz3CFNdExATVyEFKx9XJc2y8XXqmIveEWU0ATzIxDaRI0uZwFC/aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771639870; c=relaxed/simple;
	bh=X8FDbgUB/DE/li9pRqU3WL+8q9N0/BklxGMH/y1D0NA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hit/Sd/NN/6n98ZBjLGBGi/kbC3O7ZRsxeK+obIL9M+6o6EKwWKSq2aZ+huibNCKMfadJkxHgq9B8U1OdLTekOhTZpjHtpWFwFXCDE9v3kAXnm+9E4FYN2Bkb+lplmE0ttrhjVnaOHdmugAPB/966RK0HNCiJBcaqO0rGhYOQ+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YkDweHyi; arc=fail smtp.client-ip=52.101.62.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YkDweHyi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcWBgq5tnBjrWbjwo7LRec5kftHhE0qHQY1LcWUXSuN2xG0UDVb1ogy3EsCi8sHHPisxeSMtCvqIgZOCYaT1Ro7cAlZvEWBeKo9MEV3QIo37xtHYliIk69TIv8icp9DcRHe0z+7kPVuS8fwhtwbVI4Jj5f9BQ+aHe1At5Ss1gWihJSMmw/zcDbmeX5lJvjKOtBKDv8YwRr0xwMianb2jI8LsuoBOU8o7n6vO/hJ0Bc85VtDOcEdIdewKhWo50XJFwtjm3bi/ZgISv/TeHQjfHL8SNxRqfJzYRCWGZyqhfyE/tP5WyvG55r99xP/P1/WDXyNlOX3MWax4lDfcW9PTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGrbTVD4hWmXFMy0ksrTgIQyTrjH2c3pELJht/hKJg4=;
 b=psq9/ydIa4WgMd0O/k8HCAYUioWwH8LUzerjHMPopuw/C6RtM3VYXKkmZrF3JA9dFptFM24B+ihDx+DkrB+Pe5Rj9ikExfL8fM0lnEdJTde2Fy6pj1QOgcIN6Ak5H9uSyeIenONbGdXThpR6QC44dc3QDZByuvmFCMJcNw8mJnUPs+c6UxU3+MNaoqoNyCiJ0lrpz1/+ratzelmlx6AIaqOA9Sdm3+Mf7zdnxuZpY+K6ifsPXnQTpXQXI5Gfk4uVxoHzLXYyJVmdwkjLEUOmoSpYXQupaKXFo8vUsk9ugYGEK+utScwx3peGsFE//yXFRp5a30Hv+KK6hBkWJc52CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGrbTVD4hWmXFMy0ksrTgIQyTrjH2c3pELJht/hKJg4=;
 b=YkDweHyieTtm38e9kgC1yavL94Ia+jISKGO+V+tsoyaFhp5W/F6TBHdCIzYk1vvybF/WklNbNnyv+sAZcOj4p328cWXvGbpCYcsJhcwdi6teHXBw+KHz6PGP8SvhUFYahxCcCw64v0BXf7VxsJMuVqYY1jm+gJ8a28Sl1BpvWBiXQ55ll1kwXiI4E+mYsSeCy6HqbyTA+Zj6E2fTBWnEjQElsAXiyr70vxT97bdpl31kKHivFfl4bTZuGMW+t+NxEJs/cid2QFfJXkRCImv7atIscTewjWmFjaR88J55WD10sCyF6X9Iybmzzgis7gBwhrO9XSeZZNt3J9PoJTF2JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7378.namprd12.prod.outlook.com (2603:10b6:510:20d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Sat, 21 Feb
 2026 02:11:05 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.017; Sat, 21 Feb 2026
 02:11:05 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
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
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v5 37/38] rust: sizes: add u64 variants of SZ_* constants
Date: Fri, 20 Feb 2026 18:09:51 -0800
Message-ID: <20260221020952.412352-38-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221020952.412352-1-jhubbard@nvidia.com>
References: <20260221020952.412352-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 36fa5eaf-c38b-4e66-5f31-08de70ee68dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xN8Nku8posi+WMElD6R+WvAr9/GtoFvqR3pXu/pmrOMRBCKUnJJMuf0NjoCO?=
 =?us-ascii?Q?2wxW3lDntjL8h+ksACV1S49sVn8Qky/gYJIcrcPCIP7gJNwhf4wq0ZCsNOh7?=
 =?us-ascii?Q?61dKiJ6odurpWJ2ISBEKTEp7B0ovJ9mHajnKtUeGsbk818yIbEqJhy2TH0Z1?=
 =?us-ascii?Q?pUwXjQerlR/LB7iR8Gtv79rBTNfTVEgdXJ3OHEJdP2aT2ODLaGmIokkVd35k?=
 =?us-ascii?Q?jXitPjrosCjjPO+Vn/OxsQMryzdsrhJLWxhGfMZUkWYOZbO/at3gdw2FBO7j?=
 =?us-ascii?Q?AYner8b36T3j9HAoe0ncf0JaNAAvCzvAMzmpch/RONgW1KvK5uy9K/5W4VtC?=
 =?us-ascii?Q?NZoaGxazz/Q5WwHn87oiZJsimJf2DctTmsizHFno7lAFteuEXlBo6wRpED5E?=
 =?us-ascii?Q?hhNQ3l4iAKlxyUdKvqt+Fd8nHVNwC89iziAhlTnxHbGGj55Tdo+LCvC9MWHR?=
 =?us-ascii?Q?nm3lTk89+Xas5G+li0yVErTGf1mXqZIoxf4p+U2OlUeLoENxYsz0E0KXIJok?=
 =?us-ascii?Q?V57PFcpEIXDaHnyNKl6dTOUSXe4hrnZ6GuU7FxSZ67kDmFn7OlaeqjpKtIai?=
 =?us-ascii?Q?e7VWbHEDMueKvPXU1HbOUMp77G3ABdlHmoUkudFSgFhDBjB0nw740Ec9aHLB?=
 =?us-ascii?Q?cKdHYcqnPN4HvMWfT/3D5TnaxC3dbqxRtvFkqcanqyZWpN2bVJepblC4Mc3E?=
 =?us-ascii?Q?pk7mOB8378LBcGIC2Ia+62yKviePZK/xn8aE5oWkcn4Hvy8//Msi2+mQx/MB?=
 =?us-ascii?Q?9yzhGRyCJtrlq1jZvq3DIibep1jz8WeViRf7OCtk6ZemLCftHmHz5nP0wbbo?=
 =?us-ascii?Q?DAUnnFiba1AK0myoUSS2XhJYN4rTlkKD/Qw9bY4+4d5TKh8RiAV9KMrKlcr6?=
 =?us-ascii?Q?FHbnJk1dkM6NnpvnjJl2elLzT/EFc+RxBPRaYyrd1cbk6657vyTdj1tymIjy?=
 =?us-ascii?Q?YYsAhfg768DzH0pj3LdqN04Zl6NWjwl1KCAvBzYMJ3T1Gw5A/IMWJpG3ycHk?=
 =?us-ascii?Q?XGZOGH5Zi0VjN3sQPWgS3+XeINI8ibM6HiyzIltZp3C8dZHScB9GW3AA19Ol?=
 =?us-ascii?Q?lKHM78TPHJbOdULkNZMAvZJTor7e4estFyZLyrm8iVe+e92vXjcdDutXUuYD?=
 =?us-ascii?Q?vUW1s8+0txRSenaeyAbQafQNTYvnfxuaNR99+OOMnlGGf3qqNm3WqZDnP4rd?=
 =?us-ascii?Q?AxPra0Sv5RinXRg3OVzuAxdqacXIJMhDdSAdKlEuNAc4sQtytOrJAhsYFF6f?=
 =?us-ascii?Q?FysXseKyxkyas74EIsCk2GpntvMJKGeXyzfVnXHDOwlcRaSrT3ORndYxf8rM?=
 =?us-ascii?Q?mDIlJ7hjEY2gynJ7iXLMDgiOi8GaY0KYeyVsZ4ynm1KSfpiyIM27lPbhijQ2?=
 =?us-ascii?Q?2lGLEFFjtjT3gi9L2+l6mG1AQmjWvVXt0e5a9qzp0bqeLOFWLSoJdRsBWAAs?=
 =?us-ascii?Q?0NoU3EK6BfrSF2wHXsoKUxPkUsRaHQrwagjG1k4ETgy/Yt3XTO+qi0OaKCQ+?=
 =?us-ascii?Q?CVzGsb7v4E8x2Ka1mbLwrxH8mqONWDLd0CUqL8cXSfdqy9/yT+qSOwcsQhDP?=
 =?us-ascii?Q?6wOmUfdCO45reUqUJvw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a74Qf0/uye1XhGxSWGwAwfRxVKKzR7eZrCJzXIinwIvtrIzssgj9kdUEcxBG?=
 =?us-ascii?Q?b7gq+3uanputzk1goAJnPMm/63YAlNfWU8R149dgzp2RWFDyOnuNcKl9ZVMd?=
 =?us-ascii?Q?MXFkViZbSTR+ZGrw4DjhklcemNwHQKHfkRTCLj5V8spHCLgvwvxTr8a0xt+V?=
 =?us-ascii?Q?m1VltLyYDBtxb+px59xwChaBGFlm75jHmEhUDa3t4T5xz5U5AJorbfnVqjCU?=
 =?us-ascii?Q?GXBz0lq9egTpQMa7bWkd3dJPPysv6w4O/NJTPMx9oSz2eoFMg0etwM8dCiZj?=
 =?us-ascii?Q?uIUtp4MafKaHyI8BTflWZkkZ239w0YxC5fk8HE6QAoBzWpBIwrW7kjsCrSfY?=
 =?us-ascii?Q?yQpy4GaP6UjtTE9BAcMlZ3nsnqNX4t0InLGC44qNQ9v9uw3FF7LzCb6N84Tp?=
 =?us-ascii?Q?bCKpulb6No+MU1tEkPln9KY/7wqjLdHcuJM7naISJW/Dou3es04R8TVw//n6?=
 =?us-ascii?Q?3a+QJm/s7/IN3AYtjlDffHdQUdoSCnf7mMUPZ28FuFLDKmo8rf/0m79td1rr?=
 =?us-ascii?Q?mHxGzBqsGDk2bb9qX+qSxrg+T86dhzWH688A0ckEQ8/9qzYPPW3Y8DVzDvgV?=
 =?us-ascii?Q?UWCqmfO0+wx6/xJWjWikLW4gb04who4jYqUcQ01tSIs7ijwpOed6BrHdgXV/?=
 =?us-ascii?Q?1WeT8ZalKTon7infyM/LfHUTo+7WlPLZjyXbSZvR+jPdCAkA5+DRDWG37z77?=
 =?us-ascii?Q?WvP6fdCu5SFsD16oxph7FZnfk+H/PsqBhtDeZMrNa7AoI/XZjgtY/GCj9+WK?=
 =?us-ascii?Q?PmxJXMA7ZYvn7eK2mhLcgQ/mSpHUMW2bumW4Qax07I7tC3/9iLddzMPuFsei?=
 =?us-ascii?Q?f3FSii8IoyLxok11JZbE3bHMrmQ/bfj/MMyxdqoy8xNJi6ModLf/BJt4Tyh+?=
 =?us-ascii?Q?hDP6aPM0XzqGLmc1Of1MgYuClz5rS6wc0K8fnCLdHJ97sQweRtg4d3n4NyuM?=
 =?us-ascii?Q?p2uycmW36kex8aqC6wMx3z7zyQQlA+xjtlurOy+t3pDrXr/QfJKAcSlotIBL?=
 =?us-ascii?Q?dZx5vpj4Gvk4Xdgnre3RsXbDcQRtPTU2xgcccmlazVTAbQyDs3689LRwBGgh?=
 =?us-ascii?Q?16M3jswwKIIT8+mstOjftloj8GSA9sXdLhTbT1QshZjlZcWyj2QbYZ2oD9mQ?=
 =?us-ascii?Q?X+cp0FZhfQw8HLRghnM1wIv+PO04zvVr/aD54YwqH3/2PbsZHk77E7++J5z8?=
 =?us-ascii?Q?m4liq00D/yeDXLqG5CA/7jJu1mrkaL2VY+AOb1k1MzMl9gdSiW/5M0JyD39Z?=
 =?us-ascii?Q?AM27Iv8DLOyV3Dmgyrzv8F8knrRodOlI8dMcAFU7VaMjpm+gzTkn6ozuW7In?=
 =?us-ascii?Q?pRKgnV3lCjD8pv7TbFVZoqHz831OMdY+e21BfqnkNjS+4kWToR5u6DO3J2+j?=
 =?us-ascii?Q?pkxvTzsDvop4dstdDb4JvVKRgWxGj8j3x2CVsJCjJ9r8+YPSUj/OyQ2p3k+6?=
 =?us-ascii?Q?uVdc/XIcwU6zhpAcEUh9yOXnaYSVnMqKlOuyqoZylAdILK5qwRAVTHrsDQET?=
 =?us-ascii?Q?4KOZnAFb8RgIOpfpMQmLpiCQly0mYz10jS0oKwK7sIeiVg1POH69nL0kC13v?=
 =?us-ascii?Q?MeLFN4E0Ab7g/uBrlwMGzJMYTdP9215kx1jUhNlwoxHDc/iiyyBBooiZwtQX?=
 =?us-ascii?Q?4CkU1SuC4FhvcTDR2uAXFJxTC3cj7ErG5cBktrGFTIdKiHNkHmCU+IplPOQK?=
 =?us-ascii?Q?HzxiCVaZWqVwos4p/ZymbLjDZL1EwvwZ0T7JNV7rqx5/Rkz8ChSzWl5qL7oJ?=
 =?us-ascii?Q?Y8uXrL+Cbw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fa5eaf-c38b-4e66-5f31-08de70ee68dc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2026 02:10:39.8458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMSw2EqiH9JFDsiiQEPbfqWqF9JHHID+6/GorZB4cr5ygzcE4f05ZKlbWlP05iPPmQ5NSjRqNF9AODAaQXRLEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7378

Drivers that operate on 64-bit address spaces (GPU framebuffer layouts,
DMA regions, etc.) frequently need these size constants as a u64 type.
Today this requires repeated usize-to-u64 conversion calls like
usize_as_u64(SZ_1M) or u64::from_safe_cast(SZ_1M), which adds
boilerplate without any safety benefit.

Add u64-typed constants (SZ_1K_U64 through SZ_2G_U64) alongside the
existing usize constants. Every value fits in u64 (actually, within a
u32 for that matter), so the as-cast is always lossless.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/sizes.rs | 51 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
index 661e680d9330..a11c134be64e 100644
--- a/rust/kernel/sizes.rs
+++ b/rust/kernel/sizes.rs
@@ -48,3 +48,54 @@
 pub const SZ_1G: usize = bindings::SZ_1G as usize;
 /// 0x80000000
 pub const SZ_2G: usize = bindings::SZ_2G as usize;
+
+// `u64` variants of the size constants. These are the same values as the
+// `usize` constants above, but typed as `u64` to avoid repeated conversion
+// boilerplate in code that operates on 64-bit address spaces.
+//
+// CAST: every SZ_* value below fits in u64, so `as u64` is always lossless.
+
+/// [`SZ_1K`] as a [`u64`].
+pub const SZ_1K_U64: u64 = SZ_1K as u64;
+/// [`SZ_2K`] as a [`u64`].
+pub const SZ_2K_U64: u64 = SZ_2K as u64;
+/// [`SZ_4K`] as a [`u64`].
+pub const SZ_4K_U64: u64 = SZ_4K as u64;
+/// [`SZ_8K`] as a [`u64`].
+pub const SZ_8K_U64: u64 = SZ_8K as u64;
+/// [`SZ_16K`] as a [`u64`].
+pub const SZ_16K_U64: u64 = SZ_16K as u64;
+/// [`SZ_32K`] as a [`u64`].
+pub const SZ_32K_U64: u64 = SZ_32K as u64;
+/// [`SZ_64K`] as a [`u64`].
+pub const SZ_64K_U64: u64 = SZ_64K as u64;
+/// [`SZ_128K`] as a [`u64`].
+pub const SZ_128K_U64: u64 = SZ_128K as u64;
+/// [`SZ_256K`] as a [`u64`].
+pub const SZ_256K_U64: u64 = SZ_256K as u64;
+/// [`SZ_512K`] as a [`u64`].
+pub const SZ_512K_U64: u64 = SZ_512K as u64;
+/// [`SZ_1M`] as a [`u64`].
+pub const SZ_1M_U64: u64 = SZ_1M as u64;
+/// [`SZ_2M`] as a [`u64`].
+pub const SZ_2M_U64: u64 = SZ_2M as u64;
+/// [`SZ_4M`] as a [`u64`].
+pub const SZ_4M_U64: u64 = SZ_4M as u64;
+/// [`SZ_8M`] as a [`u64`].
+pub const SZ_8M_U64: u64 = SZ_8M as u64;
+/// [`SZ_16M`] as a [`u64`].
+pub const SZ_16M_U64: u64 = SZ_16M as u64;
+/// [`SZ_32M`] as a [`u64`].
+pub const SZ_32M_U64: u64 = SZ_32M as u64;
+/// [`SZ_64M`] as a [`u64`].
+pub const SZ_64M_U64: u64 = SZ_64M as u64;
+/// [`SZ_128M`] as a [`u64`].
+pub const SZ_128M_U64: u64 = SZ_128M as u64;
+/// [`SZ_256M`] as a [`u64`].
+pub const SZ_256M_U64: u64 = SZ_256M as u64;
+/// [`SZ_512M`] as a [`u64`].
+pub const SZ_512M_U64: u64 = SZ_512M as u64;
+/// [`SZ_1G`] as a [`u64`].
+pub const SZ_1G_U64: u64 = SZ_1G as u64;
+/// [`SZ_2G`] as a [`u64`].
+pub const SZ_2G_U64: u64 = SZ_2G as u64;
-- 
2.53.0

