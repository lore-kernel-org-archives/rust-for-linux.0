Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93CA350A05;
	Sat,  4 Apr 2026 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775338202; cv=fail; b=c9kx1lDtyekXf1Gp72pwOrbr0JqYPpnUh3zb0c/cR3d0/zBOWVpp8ZnL7zlKNv5SuyNGlmrqih2tt2YrBhU+CLkJpCiyBdDSFSqkdBbbv7APZ7311zMDsOjQaERF2Ur1cvWaLwWc1mJswCxTXA8Ow//XUewJ2oJNir64A8VNlwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775338202; c=relaxed/simple;
	bh=+ChEuWfelaBG0I3QQX95gO/Z8edhMIlGlEla+659Bng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tAeIEGDct+74yen2ElQdV7oDeKwxf0TlAaN9nYg1RKXJgXuil32n/ZVIBZd2fVm3+I+pgskJo0MnLKSXvcptJ3BpMHUU42zMW5jP5FVZTNpzfO9Z8OoGrGW6TfEATCJW5kfGaMhLlIofXeDhJE4dInM5A33KXubaY5Wxe+BwiW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=U02kAkD0; arc=fail smtp.client-ip=52.101.52.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="U02kAkD0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9ZGsYdCJzXTE0t0E5m7zWuPlc0a5kIlCgk6KDbmmrsY3IzhcZKpNjEDenATaS9+/cgwQyeJ6iVUnvBE4m94XatDkthZb6Vvvj1Tm/V8QSZNXLlA9MCXcqmK0m27tdUS5zKAHIDzXr0pWohf9QyDDna99++9w7NbcHyFQIoWBm22wUkBKjLzOLan/Ks6vP4/kFLPEF5H2oDIZlIzsziH2Oei18s+71KJ2KMjR2WQkvRlE6P0/G6PbeIumi+dFv37F//KBILle5JmdAz9LnmBmilOmLLWMpY9TAhsQAKZeRbMJyoYANw1Zoz88Ifq2riURQqwebMh6W05KX5ebPXGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16jHOQ7/xQ8njOPl4Nnj4G16TFXkdm0MJEuDqrcGB6c=;
 b=wFp4pbu0CLkssuSOLO2XyHAM8WclldkciKNFWKcNYLMAa2FsUZqFV/3gM72ns4yfQpYuDyjPReSHcI3+EUHlbxtWsfDlH1Z0jylxZcEcFoTE7N0wyjIEwWxsL5pC9o8QciobQxOGLW//JlH++eCapdoaSAx/kT3xuZHcU0TXeICvaxNp6XHqipD2qeqZOp/JwmaHDq7irpqR2ZfnG8ClIM4K0DPhblr/joj+wnm9N9LWd9fyx/1i00vp2swoleoPSBREs/4TlDd7P9Jkd2UbePKF37Np+f/Tr7iBO3SfziS9k9GIh0+ADD3vx3y0y2MedTa7gx3FlN5OkQr62VbGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16jHOQ7/xQ8njOPl4Nnj4G16TFXkdm0MJEuDqrcGB6c=;
 b=U02kAkD0nq3X20rVvXbsMtIFeUoiYeGDlZe7kLR1GpYQ8IhzdKyOYoLmyRzy9ExyzzPIVD45OjE4VMxPwjvd9AJ9Q248EQ8fFU4/LZFMag3uLw7iZ1d+bVPUS7wjsXcSryvBvkyXwTe7Zu+0ApbCiNHegHEQXfOkqMX7+UEvlmioHQ45NNVk5iooalo0eu82d6IladwpwZiHh4FGcilX/gFHJwdUuo+glIC2QAoCzV1rHlwtI6Vpr374T9XeOVuws7BgZJrzM3QPbqnLS6vtrZvGdgWQDEMnbCEUR3yeDVBah4LKQC5d7n2cNv1cTx30rT65apkKxYWcUrrPFiLT5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4399.namprd12.prod.outlook.com (2603:10b6:806:98::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.8; Sat, 4 Apr 2026 21:28:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 21:28:38 +0000
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
Subject: [PATCH v2 3/3] rust: ptr: allow clippy::incompatible_msrv for slice_ptr_len
Date: Sat,  4 Apr 2026 14:28:31 -0700
Message-ID: <20260404212831.78971-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404212831.78971-1-jhubbard@nvidia.com>
References: <20260404212831.78971-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4399:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f4f1900-2574-42ff-3a5b-08de9291225c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Gn4/usg53iVhQELMQ6OcArZUq7WZ6EgLhlO1VllAZhvCO5tAYo80Dei53nUznyHqzBI4BqRZWQQcrR7cbByJPg4zUAUJVhvWe1x+SvorWmehUh09iBwy6wQfyIPdcdg1EU2RKAaqRK6ZV3WXQgNQITy1Y1CWASMmbHoDV+2S0ir9FbfzMDLVhQfhrFxTgCXLB6lawmlKEkl5e6gQrJwqhJfLC28dSODsOOoxKk7Fq0lc28YNppZKD8xO5uu9ZrlnpbY9SQDPzKocPnto6JmUwXGvj0g1zt4LwqrPmjISf+XHjLp1C2czgCu/JD7KYl59dlPfSF2P+yGAYBpOyAog8bPNByPvHh7fqlMAu6XB2YAxFHQhF+OvB1GADMoIT+JIhQUDA0YMvBmIRkrj/ZSNBpX/ZhH2WhfeS5IK0IObOOHIuQgmYOoKIBplDziADJHeLvFNHbGin9ftffQbyE2netZa13CsnSo/9Wlp64/LHNTGd6BchchGExoC432MtNE+nVpMFDCKHjU9nvfLtGgWvTCIM9lJV4RS2px72q0l0nrQqB4ebfOzf4l6p6k4FyMiPaXOS6cZW9RcdVCqMwM6u5S9VnfK4rgk2+cPq2H6zBDW9P7rMT1GHBT5LgN/BgjHeqvXgG0/bw9YZExWRGHWJQk1BfSLohXiSD5D0rSHOr6ofzwLA2YwcRBZagdJBWBMB8BMEWy9iV6eqaMXS7YkJziTqeXbw4M/mjAPFTS33nI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wsIgOLbbaTXnQWEl5bAHkNO/YO8hqN7e9IlHnE+XWR94DqnOKJVd+Lvvdj/B?=
 =?us-ascii?Q?wW2J0n1RoLxKLqsErzmVO8/g2N8HnGsHbP9ZKc6KASaL2//HudCMA4t8Vz0W?=
 =?us-ascii?Q?l5xQGCZIx7gCztaRCPjomopqDjRfK8lonkD3Ww1lSeFAoB/dn1O4iWn7syar?=
 =?us-ascii?Q?5b+beHwYgyQJ7JnPsqZRehdL0VJHjbmaIg4Hdr9sOfkWHgd2kuzxHgIT5Foe?=
 =?us-ascii?Q?/62rT7+Yg5bf8jHbIaGJ8ZDg77KwRtj/FNmxIJVwoTZQuu2G/4T2VuLywtrM?=
 =?us-ascii?Q?tgT/+jpC6rWzl+jP3luUf2Kna+XPBWv101xKbVOzEa0p1/rDnWn5Jlyg9Ngl?=
 =?us-ascii?Q?Fo317Y58wEsISDeLzj0hwLkvjaLfE2KJ4mHIRo4bbF/K5WOKxdcStBokwMVN?=
 =?us-ascii?Q?EHcNIwO5RoGbDYzjJL7cIebN0Gwgcw1SEOdvjafakPBiVE22v/gQbBSGIpY2?=
 =?us-ascii?Q?x/yV3fg21ERbZpMmKamgu4g3QZzMDL880/OyCbhvNhkAaXGlMAZsoB19VM8g?=
 =?us-ascii?Q?YT3Ul14WJua5T+Is155N2Z+nppxO+VfwfZgYYdGbgCzVkrFfzBOFM1K1MjV7?=
 =?us-ascii?Q?81/eVJHvyvPrLiBbsjSQ6V5wQrM/09G2/Pr1/sDvjzP5dmpc6dUUS7Awmu1i?=
 =?us-ascii?Q?bkZMtGs5nHKBZJM9B1IJ2wPDLfBujvSx/dJxqf/xezq7tvKcZu616/C7qVqT?=
 =?us-ascii?Q?ZOnZsuInUgvIpTpBYRBhXDnWRFd/GkTcQXFuXV8F6DilsWFoffsPNzhwYsUo?=
 =?us-ascii?Q?SjNzuadLsMcLaGRb3d5PrfOLnC1kF/qmHmy8STJJ2fD6vv3JEKbuC+7eXVmM?=
 =?us-ascii?Q?xWGs/HJRy76U2IDy/qpaExWTZ3P5StiFo1SlffzPPFU8dWidqaWxAvMeujzw?=
 =?us-ascii?Q?DvXOpo11WKyQzGl/kZqOUgCwNn+t1PRyetB6PVZNA9f1SHZayDpMeFHgqZRh?=
 =?us-ascii?Q?Pib4XFBmN/JG4rgOpTj/xi4DdQoCTDDpxMapeyoGaMC9SBlOl9fs2t6Zmy7b?=
 =?us-ascii?Q?3366kJBaGoahEb8g1DyCuEaeOp7TjFhey3hx1tUVAMyFJGc/V0zuYwjJ7f+b?=
 =?us-ascii?Q?NNaEbNjH7J14ptZkXQ/WtbyNfecFM9m2RKUOjtnMd7ehoM+TwOiK6IexrBLi?=
 =?us-ascii?Q?1sEiJF3a9zaNnFifsWwQ/iVEsVH1nmpyiVQNcjU82ElAHsLIV3xq+Es4enrF?=
 =?us-ascii?Q?9Oc+uUjrVwAEjGekUKFdauvg4Xotl+JtqH/QeGArIksnovB28pLV4rhN31L3?=
 =?us-ascii?Q?bGVa9LdcwzoyuUPYP3ZGGpCwmScJO+7u6X74qR0dggjZ9Hsl+inDQqHeOxrJ?=
 =?us-ascii?Q?fco/3dOqZ2IItg55ILxg8SwhVFcUBIhA9qyPNVOCjuE5PlUAesuMYBvFj0Rg?=
 =?us-ascii?Q?Pcv2zNmnJy1c4DNOsSg7PlxfbcPolJdfTBxZxWFxqyJ6ET+SZzntYMHbfxL+?=
 =?us-ascii?Q?vwlc29RTtb8MOlVKe7J5uQ2aDxVgBhzZeUPwMOx8Bu3Hjwk9E4+itTlLoqBZ?=
 =?us-ascii?Q?F1l+U5TwVJMnkjG7O3gSmMlZuewc3GObTY1VCNTt3jobz2jqaUDXcdfG2l3d?=
 =?us-ascii?Q?ZQr2d2ifX0eFIjODvXNWPscZLIm2g2vuo0sxzt6et4VVvIQ+YtUWL/Cs/ma5?=
 =?us-ascii?Q?45g3QCAX7RGs9jMCg85npma7Q7xrBfLwPoeFIhAW8rvyJwLKRQIit8IelqlV?=
 =?us-ascii?Q?yDnzOVrSe0fl8Bo5PT0chwHvvAQhgH34VZ/vs/m39lBgf8IkhmS7G6oQco7Q?=
 =?us-ascii?Q?z+SLmsF/fQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f4f1900-2574-42ff-3a5b-08de9291225c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 21:28:37.8866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3plqZ2sksCdhcrXw+xqWeM9o0roR9bRBQfZSK3eNl0+qftvaFZnPbAvYRFy8gRm/Msi1aExbl3Qnq1m8anjFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4399

Clippy reports four warnings when building with CLIPPY=1:

  warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
    --> rust/kernel/ptr/projection.rs:79:26
     |
  79 |         if self >= slice.len() {
     |                          ^^^^^

  warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
    --> rust/kernel/ptr/projection.rs:95:29
     |
  95 |         if self.end > slice.len() {
     |                             ^^^^^

  warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
     --> rust/kernel/ptr/projection.rs:121:28
      |
  121 |         (self.start..slice.len()).get(slice)
      |                            ^^^^^

  warning: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this item is stable since `1.79.0`
     --> rust/kernel/ptr.rs:253:11
      |
  253 |         p.len() * size_of::<T>()
      |           ^^^^^

These are false positives. The <*mut [T]>::len() and <*const [T]>::len()
methods are available because the kernel enables #![feature(slice_ptr_len)]
in lib.rs. Clippy does not account for feature gates when checking MSRV
compatibility.

Silence these false positive via #[allow(clippy::incompatible_msrv)].

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 rust/kernel/ptr.rs            | 1 +
 rust/kernel/ptr/projection.rs | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index bdc2d79ff669..7482653ef160 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -248,6 +248,7 @@ fn size(_: *const Self) -> usize {
 }
 
 impl<T> KnownSize for [T] {
+    #[allow(clippy::incompatible_msrv)]
     #[inline(always)]
     fn size(p: *const Self) -> usize {
         p.len() * size_of::<T>()
diff --git a/rust/kernel/ptr/projection.rs b/rust/kernel/ptr/projection.rs
index 140ea8e21617..7d1c878b3116 100644
--- a/rust/kernel/ptr/projection.rs
+++ b/rust/kernel/ptr/projection.rs
@@ -74,6 +74,7 @@ fn index(self, slice: *mut T) -> *mut Self::Output {
 unsafe impl<T> ProjectIndex<[T]> for usize {
     type Output = T;
 
+    #[allow(clippy::incompatible_msrv)]
     #[inline(always)]
     fn get(self, slice: *mut [T]) -> Option<*mut T> {
         if self >= slice.len() {
@@ -89,6 +90,7 @@ fn get(self, slice: *mut [T]) -> Option<*mut T> {
 unsafe impl<T> ProjectIndex<[T]> for core::ops::Range<usize> {
     type Output = [T];
 
+    #[allow(clippy::incompatible_msrv)]
     #[inline(always)]
     fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
         let new_len = self.end.checked_sub(self.start)?;
@@ -116,6 +118,7 @@ fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
 unsafe impl<T> ProjectIndex<[T]> for core::ops::RangeFrom<usize> {
     type Output = [T];
 
+    #[allow(clippy::incompatible_msrv)]
     #[inline(always)]
     fn get(self, slice: *mut [T]) -> Option<*mut [T]> {
         (self.start..slice.len()).get(slice)
-- 
2.53.0

