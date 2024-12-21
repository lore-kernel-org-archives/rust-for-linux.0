Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021131.outbound.protection.outlook.com [52.101.95.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C582F44;
	Sat, 21 Dec 2024 18:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734805881; cv=fail; b=G4SAUdoiHipvY3AeQ/QIu8GMNrG59ZHaxIqOcL2qCyUri5n61IIW69FCcBIMNTN5dh1p4E5p82mx9R1PYpcoKmC6DSgyjikf5g9xLo2y4G4Pj4emeqQEMspSYjXaaWpemC/iRbcTYxJfh9WohHe/vc568Aqm8e1ttgYNuS6zXIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734805881; c=relaxed/simple;
	bh=ZlXcJqDWWSz2GYf+EexlK+X6o+IB8bUkoVOgBh2MEMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=It03fcmC4xvUwYVjlIvzmzeU2+Iktd176e8cpxxrYxvUEzbLFRvufiJmOut1fu9xEFvP6H0FfqFNIk8E0jM58vkTXQe5tfW80/t5n8PoRM9FiiNm6L1esNOHd1mPiJ7c9i+RhhT7jbGit+GXgnsV/R1xnufm3P3QH0aL/o7N99s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DAZove2k; arc=fail smtp.client-ip=52.101.95.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DAZove2k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rehJ6sM3D21ekvUsauswBUKAKCUSBQ2ay+73iKC2S90x2oAuW/4Dk+/eCjDBFgHuR7mIZoPfGdP+x7P9LqITeU2FVRDWXtQYWwBgLovsr3JoleOSHvVvZKFxUw5KF6yHxuiBDG1DqInceluDPrDcRXu5EEMJtBTyafuKj6vrSO8PR/veeEuziAMv9jr+FsA6x86RqZUSskfqKxKnEUessa397mNq3Ozv2lH71p9D+G3xNqmN34xXOLA4bDhjybK392mNSLjsAVJytgDk9Lqx7TqR9/+A8FAsUiH+GfcM9XoF2b90L3CnwOWf27xWix3dPRPE3RcWf2mO6Upz8Ui7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEoybBGZG+U6njwF+aRxpsEKhGTV+VR94fklZaDCFtc=;
 b=qckvIT3XqCOo18uDZ2k8X15oH3u7euIqFjPks+U8dKOJZJaVr+ai8opaWmx3+EJonsEYl5U89bkw424GIElyb1Ns1j4j5ubm2+Uxjyh9o6mud5fMzb9vxwM9NmHlIAtyqq7/UfYXfNZAIGpEcS3eCbKMRSR4fqUPtakjpUguETyOnzk+eFgoNvgoincu0gRr/8C+L+Epsto5CpGdIEhI+ZM5rE4frgNnmJWX56dkvbORuToqSs0a0+9tZgqzwBjPUR0xlLyp7JGRhEt4AkJ1CJXV0YZHBjBI9ELEaAsamzQcKajiP4seV1cm4FBMuYMf6A1NRjy19p3qTypCSv0U7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEoybBGZG+U6njwF+aRxpsEKhGTV+VR94fklZaDCFtc=;
 b=DAZove2k9ceS+AlTzZJuxxYEAecbMrPy2SSeBzXCkFc7+mJ4X1ywfTW4dMO7QAyBm/WfYUlsVVmMngFgpzDHRQXZQFj2N28b3alwjehEXiwYeJPFD5ZvZQJ8cv7errNdCWsLBpCe8mXbjY9+1U3cxF1MhsPnddCe2Dbr/Me4Z+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO7P265MB7439.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:41b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Sat, 21 Dec
 2024 18:31:12 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%3]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 18:31:12 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Alex Mantel <alexmantel93@mailbox.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] rust: convert `Arc` to use `Refcount`
Date: Sat, 21 Dec 2024 18:29:45 +0000
Message-ID: <20241221183024.3929500-3-gary@garyguo.net>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241221183024.3929500-1-gary@garyguo.net>
References: <20241221183024.3929500-1-gary@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0063.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::27) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO7P265MB7439:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6f14dc-bb1c-4603-5e56-08dd21eda5b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/83O2L/U9H3WypUoEmwfnvmGFTL5b2oUb7y7Ce1FGpebgIcL5Ecmbaj8qW43?=
 =?us-ascii?Q?hiQoNY46YRnelEohDZddgpbMUbJxFJ35r+lOW+B2Gb58Uf155CzkXbPyzIAO?=
 =?us-ascii?Q?u4PjyB85Os8vABmumR/5DEu6P5JGNVFhK2uMoWa+WdWrMJ60py3AYZXhcGmf?=
 =?us-ascii?Q?tvO9y6cvO4lfUiiJFKjGYzPQfjdMEVY8UwvVyuRH79hXzfFv//re5jhUpml4?=
 =?us-ascii?Q?oe1CnBUJ+to/UOwNYG0w1sTLfqJrz0SI/7NqwcrosfV8tLs1g5mtfwbbmO00?=
 =?us-ascii?Q?LURyXrml8xyTIvh20MG83IPhKUzcnuA3SGQdPGnoH9conHH+HJC+V0HvOiF4?=
 =?us-ascii?Q?s2RJUJ5WzlfISDvO3o6nBIHMlPJOVMxLAi8mlsTNLVtSYuqdIE1tfEtVWRWq?=
 =?us-ascii?Q?qBRK0DjB5lho1LbhBVTVxCU6tZCwX/xZ0o2ljNfolv5VMsBsuc8DNp+zdMid?=
 =?us-ascii?Q?W/8zRJYLLHakD9kYU5lT9TvFgYC+BqOkyPMpEwGn/irkYh62DakdtkrErkIB?=
 =?us-ascii?Q?2f2XEqYKdMIvt1qaR0SneN7Xse9DzZ/U84105VUcFyTXgOGZA+PfRClOHI/C?=
 =?us-ascii?Q?MdGdB7Bcv4r7XytsxG92NRNXKE4VhlVvwgAC+GpK3K3agM2+KNJ5OG7rtnHz?=
 =?us-ascii?Q?LVXwUuw//gpuaQJgPq4LYUMzCI26dXXzB+AT51XNvmow784rJ5SNNqn8sjEj?=
 =?us-ascii?Q?Rkcffcp2L/mqrFBwCit/CN1KZdCnGNHGNhiM3GwALOcdFnfA1ijnBmJjQFfN?=
 =?us-ascii?Q?VdqLu9GZHM9jOcdwAhKTvCKHvTtqUNG6YORb9sp4u8aKl6kyng6ftVHimI4s?=
 =?us-ascii?Q?1Zm5ssSZx5Qxy1P6GbE0ayHVsgLeV2XfxsCweO+N1eoPWFLx41mh0sPEMX5z?=
 =?us-ascii?Q?nB0wk3KaSD9g7k5kD2VnJgpP74vkCqMI82fMSY1Pxx9j2A22fMfNAnWjPED5?=
 =?us-ascii?Q?oMZRiyXNA1NVqgdz9Bd/x7R3MMdk+uoqfkr3KFsptjg+tK2Vra9lfmG0Gpn6?=
 =?us-ascii?Q?daPid/PHSF/WZyXIprvn1+TYkSbO4BVtIM/2gxArKyDPDJ4pCOBEsIpFyY/b?=
 =?us-ascii?Q?yLxi3OMcrSfNCP9XuVjGd5uQCR4aAmKfiR7pb9HKeQZb1ArGGPqhX51hneBW?=
 =?us-ascii?Q?Q7rcSDPPFGZ1s6bV4lzILv08CWiLJ471ES9i+Flx5bPd4t44wu2ji3A8zUqG?=
 =?us-ascii?Q?qzAx/wWjbrgSp+viZnSOf+gQJsbRL50MBTnq/eUHLoxCohYh2UM/GUb91njR?=
 =?us-ascii?Q?WV6JknV+ot7Eub+MjH8fcmHSZm/5bRpFvh4i88MV3ywz4K3g2fCoUXswR5/o?=
 =?us-ascii?Q?Yz+hhny3CexkdWsIUUOrhqcN88J2iGia1yPupICYfFrvnmsjZtEo8PQE6cLR?=
 =?us-ascii?Q?Sk5yfwt5cHpYH03++Tzg5ZfadBfc7mx7pbwmzO57IB3SIPbe/bk6XiV4yWNt?=
 =?us-ascii?Q?zqVGXaoNFWo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qWdJB053xt6umbTdf5SmsOOg184nscyp/XIz4fAKWfn/XhMF3WLi5Fg+2kuQ?=
 =?us-ascii?Q?1bJUI6A+L/NRISEtgRW58eNY7Xq9gn49I5VJ1iigZYdL2WQ6qmexVpfV5I6t?=
 =?us-ascii?Q?8l5DQTGjRWvye8v0p4VSyzGSepnwPaSL5WjWt+CvNpZsQtjETwD6/QQhLJhW?=
 =?us-ascii?Q?DjNAcUgOFiihMrdGzaVwGcVWYovZzSUrDl8JZ9lF2fIQhKxO+jVEhTp26mYY?=
 =?us-ascii?Q?crFNCrlz9ny0DHLBVZ+Tfyxv5+KxYUXmrEW9WBomLLOjvqSmPyymyVhMVkK3?=
 =?us-ascii?Q?2yd2fZCGWm3iUhJhCGM9fSRy/sCyGCabSYEjv+hRSYJC9BXyD+ICTwhFlHiv?=
 =?us-ascii?Q?rfXw4xJE4vqt+plF/bFsjISHghEs4WiqUVB7Hj49phIr2CjKkr8e1G5Vf/t8?=
 =?us-ascii?Q?SHm5ufd6LTqmtfCNul+758mP1q6D6jcKzjzRUsgoty866xDfJUZRkNISsdhZ?=
 =?us-ascii?Q?DBU/gYfaYZkUyvdMmIN7GoKOHDKPwazA/LkNU5FtCa2QYzBp8U/5YdT9Py8d?=
 =?us-ascii?Q?OOK4Tic+NL2CNiVTgVWlLS9Aufa3Zdo+my3JnQH8LMBmA3jUkWAtN1EEhv0P?=
 =?us-ascii?Q?k+aMQANyxQ3AnfUe5js2Dc7BkVrZozaOXvEcgfzzfu9DUVWCiqoUBi+b09PS?=
 =?us-ascii?Q?f5aBVZ3j7gfOneZDc2PZNW0K/L6Ox/QUm+jxXyMvva3m+8upNdRUgxl/4G2E?=
 =?us-ascii?Q?huaItnASU+Jvg8AGeccTuwTr4Dt1Du7suD8IuQeLXbsRdooelwcICE7tD4lb?=
 =?us-ascii?Q?SK335qThN/uofn17m7UPU+Acr4QK7e2f6ISRQB6OSo0Bos83Yl2IoFvRi6Eg?=
 =?us-ascii?Q?zYG8jujop/4E0ajQa1paHExyemw0JfmkBcpeb7Te2OQjubegpO07XlgmcnHL?=
 =?us-ascii?Q?njtyaxUZ8/GjFD0lrSUwQ5ThwJXx0mNU9nnBw1z+RxpCiFT+ZThoYm5bud4D?=
 =?us-ascii?Q?vmtdzrd4jGGFBCqJnvAYyEl1mUREjwXchINJQFsgleQhT6AGlvBYnV6H3RWa?=
 =?us-ascii?Q?61C0iSiNbJBWNB8pRlbFe1hyOiTMZ5vKGHYYwoPqTuC266yv9oktL9ukZADj?=
 =?us-ascii?Q?mATTBOY3c/8uyyeum0cASai21hIdDib+LIszAd3FN1JrNmYbC7/6VxFf9p5w?=
 =?us-ascii?Q?VnrDYLzB/uToWQNKl/Ai8cA8ZXnTiYMZy2CIYPqf870evo0OgOdR18RfMsyo?=
 =?us-ascii?Q?YGYLIX5wIkOmPVjo5d1+vLiNI9wWGVYF2ZZf+KjUtdj/uti10yeMQjumojRe?=
 =?us-ascii?Q?LjlRob8pECi5CNiHbHi+dygngs+bEpOFPlbPD0H/I5S6uUrMUK+uYqeonuPQ?=
 =?us-ascii?Q?upOMnmUrbJROjdD3XyOxBVyu3YLtSc5KxwnGYGEweCWDl81ZU+FtCCAe4F1G?=
 =?us-ascii?Q?dVhsMLvItBOu/ucv0FkFCbh4O5/cfzOmRp1+Jb0MFxYPPeeuQOMIDIKnVl9I?=
 =?us-ascii?Q?cnyZCFEjXDCJCU+i+RyemRxrxthwurhcRussIYTVF+7qoY6fAFy5CAFIW+0N?=
 =?us-ascii?Q?yt5DHrgSBqoYd9O/nLyjzbPe/V2vUpXMDUbyZBTwXZ8zWMeVEjYbm91Az+wa?=
 =?us-ascii?Q?xZ5kPE8/ABC4cNQwyw+cJbhC6+/RZoH+rxVqOWmAmttbOFZoB8R/+HXUkmoC?=
 =?us-ascii?Q?VQ=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6f14dc-bb1c-4603-5e56-08dd21eda5b5
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 18:31:12.8757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OM6yGsFNi3DRxabfH4kDC9INUa6YF1HoYR+C02Zzk8dmJ+gDk2JVWAwoFix1TsLWZGGrcjL9VrAK7OOv5pi0lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7439

With `Refcount` type created, `Arc` can use `Refcount` instead of
calling into FFI directly.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/sync/arc.rs | 64 ++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 39 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 9f0b04400e8e..34598ec1f977 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -8,7 +8,7 @@
 //! threads.
 //!
 //! It is different from the standard library's [`Arc`] in a few ways:
-//! 1. It is backed by the kernel's `refcount_t` type.
+//! 1. It is backed by the kernel's [`Refcount`] type.
 //! 2. It does not support weak references, which allows it to be half the size.
 //! 3. It saturates the reference count instead of aborting when it goes over a threshold.
 //! 4. It does not provide a `get_mut` method, so the ref counted object is pinned.
@@ -18,10 +18,10 @@
 
 use crate::{
     alloc::{AllocError, Flags, KBox},
-    bindings,
     init::{self, InPlaceInit, Init, PinInit},
+    sync::Refcount,
     try_init,
-    types::{ForeignOwnable, Opaque},
+    types::ForeignOwnable,
 };
 use core::{
     alloc::Layout,
@@ -141,7 +141,7 @@ pub struct Arc<T: ?Sized> {
 #[pin_data]
 #[repr(C)]
 struct ArcInner<T: ?Sized> {
-    refcount: Opaque<bindings::refcount_t>,
+    refcount: Refcount,
     data: T,
 }
 
@@ -153,7 +153,7 @@ impl<T: ?Sized> ArcInner<T> {
     /// `ptr` must have been returned by a previous call to [`Arc::into_raw`], and the `Arc` must
     /// not yet have been destroyed.
     unsafe fn container_of(ptr: *const T) -> NonNull<ArcInner<T>> {
-        let refcount_layout = Layout::new::<bindings::refcount_t>();
+        let refcount_layout = Layout::new::<Refcount>();
         // SAFETY: The caller guarantees that the pointer is valid.
         let val_layout = Layout::for_value(unsafe { &*ptr });
         // SAFETY: We're computing the layout of a real struct that existed when compiling this
@@ -203,8 +203,7 @@ impl<T> Arc<T> {
     pub fn new(contents: T, flags: Flags) -> Result<Self, AllocError> {
         // INVARIANT: The refcount is initialised to a non-zero value.
         let value = ArcInner {
-            // SAFETY: There are no safety requirements for this FFI call.
-            refcount: Opaque::new(unsafe { bindings::REFCOUNT_INIT(1) }),
+            refcount: Refcount::new(1),
             data: contents,
         };
 
@@ -285,7 +284,7 @@ pub fn ptr_eq(this: &Self, other: &Self) -> bool {
     /// use kernel::sync::{Arc, UniqueArc};
     ///
     /// let arc = Arc::new(42, GFP_KERNEL)?;
-    /// let unique_arc = arc.into_unique_or_drop();
+    /// let unique_arc = Arc::into_unique_or_drop(arc);
     ///
     /// // The above conversion should succeed since refcount of `arc` is 1.
     /// assert!(unique_arc.is_some());
@@ -301,35 +300,25 @@ pub fn ptr_eq(this: &Self, other: &Self) -> bool {
     /// let arc = Arc::new(42, GFP_KERNEL)?;
     /// let another = arc.clone();
     ///
-    /// let unique_arc = arc.into_unique_or_drop();
+    /// let unique_arc = Arc::into_unique_or_drop(arc);
     ///
     /// // The above conversion should fail since refcount of `arc` is >1.
     /// assert!(unique_arc.is_none());
     ///
     /// # Ok::<(), Error>(())
     /// ```
-    pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
+    pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T>>> {
         // We will manually manage the refcount in this method, so we disable the destructor.
-        let me = ManuallyDrop::new(self);
+        let this = ManuallyDrop::new(this);
         // SAFETY: We own a refcount, so the pointer is still valid.
-        let refcount = unsafe { me.ptr.as_ref() }.refcount.get();
+        let refcount = unsafe { &this.ptr.as_ref().refcount };
 
-        // If the refcount reaches a non-zero value, then we have destroyed this `Arc` and will
-        // return without further touching the `Arc`. If the refcount reaches zero, then there are
-        // no other arcs, and we can create a `UniqueArc`.
-        //
-        // SAFETY: We own a refcount, so the pointer is not dangling.
-        let is_zero = unsafe { bindings::refcount_dec_and_test(refcount) };
-        if is_zero {
-            // SAFETY: We have exclusive access to the arc, so we can perform unsynchronized
-            // accesses to the refcount.
-            unsafe { core::ptr::write(refcount, bindings::REFCOUNT_INIT(1)) };
-
-            // INVARIANT: We own the only refcount to this arc, so we may create a `UniqueArc`. We
-            // must pin the `UniqueArc` because the values was previously in an `Arc`, and they pin
-            // their values.
+        if !refcount.dec_not_one() {
+            // INVARIANT: If the refcount failed to decrement because it is 1, then we have the
+            // exclusive ownership, so we may create a `UniqueArc`. We must pin the `UniqueArc`
+            // because the values was previously in an `Arc`, and they pin their values.
             Some(Pin::from(UniqueArc {
-                inner: ManuallyDrop::into_inner(me),
+                inner: ManuallyDrop::into_inner(this),
             }))
         } else {
             None
@@ -380,10 +369,10 @@ fn as_ref(&self) -> &T {
 
 impl<T: ?Sized> Clone for Arc<T> {
     fn clone(&self) -> Self {
-        // INVARIANT: C `refcount_inc` saturates the refcount, so it cannot overflow to zero.
+        // INVARIANT: `Refcount` saturates the refcount, so it cannot overflow to zero.
         // SAFETY: By the type invariant, there is necessarily a reference to the object, so it is
         // safe to increment the refcount.
-        unsafe { bindings::refcount_inc(self.ptr.as_ref().refcount.get()) };
+        unsafe { self.ptr.as_ref().refcount.inc() };
 
         // SAFETY: We just incremented the refcount. This increment is now owned by the new `Arc`.
         unsafe { Self::from_inner(self.ptr) }
@@ -392,16 +381,14 @@ fn clone(&self) -> Self {
 
 impl<T: ?Sized> Drop for Arc<T> {
     fn drop(&mut self) {
-        // SAFETY: By the type invariant, there is necessarily a reference to the object. We cannot
-        // touch `refcount` after it's decremented to a non-zero value because another thread/CPU
-        // may concurrently decrement it to zero and free it. It is ok to have a raw pointer to
-        // freed/invalid memory as long as it is never dereferenced.
-        let refcount = unsafe { self.ptr.as_ref() }.refcount.get();
-
         // INVARIANT: If the refcount reaches zero, there are no other instances of `Arc`, and
         // this instance is being dropped, so the broken invariant is not observable.
-        // SAFETY: Also by the type invariant, we are allowed to decrement the refcount.
-        let is_zero = unsafe { bindings::refcount_dec_and_test(refcount) };
+        // SAFETY: By the type invariant, there is necessarily a reference to the object.
+        // NOTE: we cannot touch `refcount` after it's decremented to a non-zero value because
+        // another thread/CPU may concurrently decrement it to zero and free it. However it is okay
+        // to have a transient reference to decrement the refcount, see
+        // https://github.com/rust-lang/rust/issues/55005.
+        let is_zero = unsafe { self.ptr.as_ref().refcount.dec_and_test() };
         if is_zero {
             // The count reached zero, we must free the memory.
             //
@@ -650,8 +637,7 @@ pub fn new_uninit(flags: Flags) -> Result<UniqueArc<MaybeUninit<T>>, AllocError>
         // INVARIANT: The refcount is initialised to a non-zero value.
         let inner = KBox::try_init::<AllocError>(
             try_init!(ArcInner {
-                // SAFETY: There are no safety requirements for this FFI call.
-                refcount: Opaque::new(unsafe { bindings::REFCOUNT_INIT(1) }),
+                refcount: Refcount::new(1),
                 data <- init::uninit::<T, AllocError>(),
             }? AllocError),
             flags,
-- 
2.47.0

