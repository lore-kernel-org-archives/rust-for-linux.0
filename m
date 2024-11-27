Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2140442C
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 00:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732668792; cv=none; b=PvK7FTBxLOOTX5vXAbeugHLSMm5MfZ5hoDfo2wwhqFMru6ZQAfMp7FJIDbgSNKNyNDQysiQh6KQzgm17ShTS/knfkyKs5YAehneeIPPj4eDkdq2+mJUrBB1DImeojPwIhh0TsVZ6xuxqTT42P/72Y0Wclhm3PN74jqO2VE9Cd/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732668792; c=relaxed/simple;
	bh=jegF/j+wcMoWZXlKClwURXem21lyg9bl/Xf5QuB0RYI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WyNrfnyX7igemCVmeaj0A71GnAaJ4Yjm0WEFOXSvKe/Y8D/xkwqbvUs1S5Oi3SElaLtrUa3GaM+p0L55Bq7ZOX3SpLMsZ+bthT18lzLFcj2Wf1OK7mJVL+61cZbfdB+ROOFQ45PrBG5PIj8afiKRGHk/M3stBYzGaCshXtip0Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandragore.io; spf=pass smtp.mailfrom=mandragore.io; dkim=pass (2048-bit key) header.d=mandragore.io header.i=@mandragore.io header.b=LhZha+YE; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandragore.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandragore.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandragore.io header.i=@mandragore.io header.b="LhZha+YE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandragore.io;
	s=protonmail3; t=1732668775; x=1732927975;
	bh=ET+DLrFGabf12ooPE/DjewPJPx8210bmowbuBg9nVD0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=LhZha+YEdLSzpFqFvW5B4y+qdSpmr1Au+qcVHmqCIJnXFHdNWJ9HIrulOPa5BF/y6
	 AD6gzE/0LWpsxgnGb/A0qKKXmXnTAemTVeb2nQktYXPRWSK1Ig48zknCZ1D1doYEsg
	 /ZB11UQ4mWPIMQmxtC9EEHt4IfgFpqcD1cW4fwVlygwg50siGj7aETBg4LBZERGtO9
	 d1u/C5b4btT5HOC13VRJ5HGkT5K/OSdbmOtrIHTyqpX9MZzmShNSizz9lGCJLRcsTn
	 fINObxYk6B12C5sqbQ1LPT8HkYjoRxE3hNEL4trZDrWODgiJXebwft2bhivkvShv1A
	 jNaC8vLlvEUWg==
Date: Wed, 27 Nov 2024 00:52:49 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, Konstantin Andrikopoulos <kernel@mandragore.io>, Vangelis Mamalakis <mamalakis@google.com>
Subject: [PATCH] rust: add safety comment in workqueue traits
Message-ID: <20241127005204.713495-1-kernel@mandragore.io>
Feedback-ID: 125704292:user:proton
X-Pm-Message-ID: 5b643b8b8abe6ca6aa0f35c3d8b164c72b140748
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add missing safety comments for the implementation of the unsafe traits
WorkItemPointer and RawWorkItem for Arc<T> in workqueue.rs

Link: https://github.com/Rust-for-Linux/linux/issues/351.

Signed-off-by: Konstantin Andrikopoulos <kernel@mandragore.io>
Co-developed-by: Vangelis Mamalakis <mamalakis@google.com>
Signed-off-by: Vangelis Mamalakis <mamalakis@google.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/workqueue.rs | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 4d1d2062f6eb..fd3e97192ed8 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -519,7 +519,15 @@ unsafe fn raw_get_work(ptr: *mut Self) -> *mut $crate:=
:workqueue::Work<$work_typ
     impl{T} HasWork<Self> for ClosureWork<T> { self.work }
 }
=20
-// SAFETY: TODO.
+// SAFETY: The `__enqueue` implementation in RawWorkItem uses a `work_stru=
ct` initialized with the
+// `run` method of this trait as the function pointer because:
+//   - `__enqueue` gets the `work_struct` from the `Work` field, using `T:=
:raw_get_work`.
+//   - The only safe way to create a `Work` object is through `Work::new`.
+//   - `Work::new` makes sure that `T::Pointer::run` is passed to `init_wo=
rk_with_key`.
+//   - Finally `Work` and `RawWorkItem` guarantee that the correct `Work` =
field
+//     will be used because of the ID const generic bound. This makes sure=
 that `T::raw_get_work`
+//     uses the correct offset for the `Work` field, and `Work::new` picks=
 the correct
+//     implementation of `WorkItemPointer` for `Arc<T>`.
 unsafe impl<T, const ID: u64> WorkItemPointer<ID> for Arc<T>
 where
     T: WorkItem<ID, Pointer =3D Self>,
@@ -537,7 +545,13 @@ unsafe impl<T, const ID: u64> WorkItemPointer<ID> for =
Arc<T>
     }
 }
=20
-// SAFETY: TODO.
+// SAFETY: The `work_struct` raw pointer is guaranteed to be valid for the=
 duration of the call to
+// the closure because we get it from an `Arc`, which means that the ref c=
ount will be at least 1,
+// and we don't drop the `Arc` ourselves. If `queue_work_on` returns true,=
 it is further guaranteed
+// to be valid until a call to the function pointer in `work_struct` becau=
se we leak the memory it
+// points to, and only reclaim it if the closure returns false, or in `Wor=
kItemPointer::run`, which
+// is what the function pointer in the `work_struct` must be pointing to, =
according to the safety
+// requirements of `WorkItemPointer`.
 unsafe impl<T, const ID: u64> RawWorkItem<ID> for Arc<T>
 where
     T: WorkItem<ID, Pointer =3D Self>,
--=20
2.47.1


