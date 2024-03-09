Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0AB7FB;
	Sun, 10 Mar 2024 00:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710028852; cv=none; b=jAGIaonZ2bSw9/RxXsL58PZ0nRoWw4qSwRhqX1ujulCu5cf2pz80IH6iLd4hTvSav4Qs43kht8okM7idlwme3ojHdSu49CMbaotnc1L4/T1ewgpk/HJ+OzCzKPMvSVwaj5EeEN1veyBR+1q6Cur7PQSwk7xMZCXOlFQn8xlZDvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710028852; c=relaxed/simple;
	bh=RML27DRyyiUn16dcY0QviyV+2LquzNnHlQBCh1NpsME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SnQlIs6mZWcM+TccHLVvc/F6drs4TUqYx6K0V6AAMLmCEQTzCvxwrezwuWKnblFXzWDEhnX6wFdKufVU6GAHayv5/6jLxVFBFQ3xqK6AxETZNpZzrzAD6w6ck8fxTmo1UCXMH8a63NaHmyfr7CE6H2VQ1DgHWWH0Vq1dOy0ZNDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=hPQrlViw; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="hPQrlViw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=owQxCJEawx2+vFGH2MvhneRl/3VXioY6Xx4zdNssWVI=; b=hPQrlViwgjeltw5K2REh5r6mm3
	VRAXzq2Yw1mynUF1ku1hmePQl3/l2bbgJlwxuttOmJ74giN7PQ6IH3FS+tva0EgpJJJqRIlXjOL6X
	BRkJtxxOzV25xPnLp6MLnvOKMWUjxSxrhN33Uk65JIaYVfsNiwM4AuPb1FEJ1FRtkTLvLQVl68vxT
	dOmUuABMS5l3k0eip82dxB7YMarrvnKMaqdP3WbaxDZR73GkvWXscpPwf3yJF8ZFLF4zLrdNTfrfk
	Hs17nX6+dbx67kLJKQrOwn8JHtKUJngATm1OUdeIVXEoS/VsHyJPBano2Oajhdg7zLWDgotRBn4cG
	E88jC9BQ==;
Received: from [186.230.26.74] (helo=morissey..)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1rj6c3-008KqR-V5; Sun, 10 Mar 2024 01:00:24 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Asahi Lina <lina@asahilina.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthew Wilcox <willy@infradead.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v8 1/2] rust: types: add FOREIGN_ALIGN to ForeignOwnable
Date: Sat,  9 Mar 2024 20:57:51 -0300
Message-ID: <20240309235927.168915-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240309235927.168915-2-mcanal@igalia.com>
References: <20240309235927.168915-2-mcanal@igalia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are cases where we need to check the alignment of the pointers
returned by `into_foreign`. Currently, this is not possible to be done
at build time. Therefore, add a property to the trait ForeignOwnable,
which specifies the alignment of the pointers returned by
`into_foreign`.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/arc.rs | 2 ++
 rust/kernel/types.rs    | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 7d4c4bf58388..da5c8cc325b6 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -274,6 +274,8 @@ pub fn ptr_eq(this: &Self, other: &Self) -> bool {
 }

 impl<T: 'static> ForeignOwnable for Arc<T> {
+    const FOREIGN_ALIGN: usize = core::mem::align_of::<ArcInner<T>>();
+
     type Borrowed<'a> = ArcBorrow<'a, T>;

     fn into_foreign(self) -> *const core::ffi::c_void {
diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index aa77bad9bce4..76cd4226dd35 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -20,6 +20,9 @@
 /// This trait is meant to be used in cases when Rust objects are stored in C objects and
 /// eventually "freed" back to Rust.
 pub trait ForeignOwnable: Sized {
+    /// The alignment of pointers returned by `into_foreign`.
+    const FOREIGN_ALIGN: usize;
+
     /// Type of values borrowed between calls to [`ForeignOwnable::into_foreign`] and
     /// [`ForeignOwnable::from_foreign`].
     type Borrowed<'a>;
@@ -68,6 +71,8 @@ unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Option<Self> {
 }

 impl<T: 'static> ForeignOwnable for Box<T> {
+    const FOREIGN_ALIGN: usize = core::mem::align_of::<T>();
+
     type Borrowed<'a> = &'a T;

     fn into_foreign(self) -> *const core::ffi::c_void {
@@ -90,6 +95,8 @@ unsafe fn from_foreign(ptr: *const core::ffi::c_void) -> Self {
 }

 impl ForeignOwnable for () {
+    const FOREIGN_ALIGN: usize = core::mem::align_of::<()>();
+
     type Borrowed<'a> = ();

     fn into_foreign(self) -> *const core::ffi::c_void {
--
2.43.0

