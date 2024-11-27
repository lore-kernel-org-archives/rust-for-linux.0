Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8C91FCFD9
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Nov 2024 15:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732720073; cv=none; b=K0nPjFZaa+BUwzvPSB8KYwXwXGG7Q1M0yF4Goms1phPJ1eq7P64pZztvejfOZqt+l0HAdM6DWlp7I3cNHAN2rld1L5/Z11XAcAdIr86u62cRNo9Uao4V/63dFztU5vrgOTlW27MuSx8ZTQ3WAkZTsBSBuDw2B5Vbl0n/3sKmsYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732720073; c=relaxed/simple;
	bh=WCYhdDDuNrR4Q21FGWIwzybj14YfaSemI8ISiNSkotk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gyU9N4cOQZihLp7ua5rI+h8Jq9M+14nV7+8lQVZ8NbL+sl9TB1d6S87Wp78+437Z0m9F+5HgkGOtd3vzuCTyJgkYIDuxz2cOaBBlpLzcUR+E4DRoLarXKi4gAn88IcFqaCwpIBAlv4EaIGDgq2ieSECJ3yp58lj0I4kd2j/Vvuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandragore.io; spf=pass smtp.mailfrom=mandragore.io; dkim=pass (2048-bit key) header.d=mandragore.io header.i=@mandragore.io header.b=KJHS+sGb; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandragore.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandragore.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandragore.io header.i=@mandragore.io header.b="KJHS+sGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandragore.io;
	s=protonmail3; t=1732720061; x=1732979261;
	bh=DAwX+jnpr0nKHKXOog4hr/g5RtrDNCtN/OB0jiDyFa0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=KJHS+sGb4xDCYwvSM6hqMhTdCduFgGoLLHkGMw1f7Mkv35QcoX5qcHV3OqjTTSUpp
	 1ep2u8n/IkoLNxwThp7oXmmUahyXeIxAIhX9benIhULgzHwUL3dmb9g5NbEx8smuRi
	 Oi/Eoss0+IQgAktmAPUMC0yD/n/sm1YpU45R616LtricXPMrnXJhwphQFgMkrIZgLE
	 FdMDd0ErRXfObf/QOMTURC63CqbQD1yelfWAk1ds4831WD2Hyj/PY4zvwIGl1gxF0N
	 9k+rYxFwPnYFbdcdFIvuU+aUYIabumJT4PHWK2oj+HoNfPcGqv+pQyr9Unhe5fgcwb
	 GpUNYGJ9v3bkw==
Date: Wed, 27 Nov 2024 15:07:38 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, Tejun Heo <tj@kernel.org>, Konstantin Andrikopoulos <kernel@mandragore.io>, Vangelis Mamalakis <mamalakis@google.com>
Subject: [PATCH v2] rust: add safety comment in workqueue traits
Message-ID: <20241127150643.789033-1-kernel@mandragore.io>
Feedback-ID: 125704292:user:proton
X-Pm-Message-ID: 392b1cb239dce4351c1ac62aa968ef9249effa45
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
Co-developed-by: Vangelis Mamalakis <mamalakis@google.com>
Signed-off-by: Vangelis Mamalakis <mamalakis@google.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Konstantin Andrikopoulos <kernel@mandragore.io>
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


