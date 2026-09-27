Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE35C3D3481
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513809; cv=none; b=D+12vMVfXngoefLNhVj1ArJbZcxJoeTRqvYnw0Edukom24ExO9uxVjeiNbDrJo5H39hPY4Dq5gvOwfQgvAf+EHttGBjvl6BAWdZr1dZbt+PcMwC9ZZJKSJs3+6XlsK2tvpMF1ZCi2qiRg2Xn5Wjctng6M16QO+xR5nZAaT8G7bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513809; c=relaxed/simple;
	bh=dKd4+7EnKpFMFYe2LCIAG5n59ix93189Fkv7abpiocs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ib8ZfgVO2b2RUm3M6ckrekGTQ1ef++4lVxxoGs30uzexBCxjPFigQtSjTowMGzvaRK2Z8oGIIRjt4ZYnMx4iIL9FzkOPmNL1LInaBIrh4eWGLzchEmVu6VRGhwP9RhZh57p7aYKTqQj73R2/z2BpK7MQyFVuSQvT1fLxt5+BMRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=P47kjJ4q; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="P47kjJ4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1790513804; x=1790773004;
	bh=0C/VJILCGODXhC18EPbLbe6Gxnf4xM30XZKg5cGrgEk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=P47kjJ4qENgiOPXEGE9Nk4iYehLcg9ri8Y4Irc1G8Gz3FhyBcXAw3cQkdWCC9AyrU
	 nSfl26UXaZjLMlRgZzOnoF10lOyXYsnKMOUUJKtqnl48BqjiyBuHhbNzQjJLSsYbvc
	 wBESKXQ7K3iQlifJAQ+XSxOSjdCqy04B0KexSMbouwCpSWppZagnqOHk3m9Hd3/iVF
	 +CpRd9DRBPYu2Ei1ms2JaK8XrODKN6Ua7dsewAcv5k19TgD12yVslZyV2ln4DGVdT1
	 RVYRWAJpn/5JsFzOp9sV8zR4UTNUC4LpOgJePa9pFxaPj/4f8QyoKbSbooF/CjhTmq
	 bKrzBQqzGI61g==
Date: Sun, 27 Sep 2026 12:56:36 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH 1/4] rust_binder: add transaction buffer tracepoints
Message-ID: <20260927125622.676342-2-sagartaunk@proton.me>
In-Reply-To: <20260927125622.676342-1-sagartaunk@proton.me>
References: <20260927125622.676342-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: a1901bf9903ce86468c110a2c65bf5e370e36656
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add `binder_transaction_alloc_buf`, `binder_transaction_buffer_release`,
and `binder_transaction_failed_buffer_release`, mirroring C Binder's
`binder_buffer_class` events of the same names and following
android's fork for the function signatures.

Link: https://github.com/Rust-for-Linux/linux/issues/1226
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Sagar Taunk <sagartaunk@proton.me>
---
 drivers/android/binder/rust_binder_events.h | 42 +++++++++++++++++++++
 drivers/android/binder/trace.rs             | 37 ++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/android/binder/rust_binder_events.h b/drivers/android/=
binder/rust_binder_events.h
index 1a446787c8b3..045ab77aa44b 100644
--- a/drivers/android/binder/rust_binder_events.h
+++ b/drivers/android/binder/rust_binder_events.h
@@ -177,6 +177,48 @@ TRACE_EVENT(binder_return,
 =09=09=09  "unknown")
 );
=20
+
+TRACE_EVENT(binder_transaction_alloc_buf,
+=09TP_PROTO(int debug_id, size_t data_size, size_t offsets_size, size_t ex=
tra_buffers_size),
+=09TP_ARGS(debug_id, data_size, offsets_size, extra_buffers_size),
+=09TP_STRUCT__entry(
+=09=09__field(int, debug_id)
+=09=09__field(size_t, data_size)
+=09=09__field(size_t, offsets_size)
+=09=09__field(size_t, extra_buffers_size)
+=09),
+=09TP_fast_assign(
+=09=09__entry->debug_id =3D debug_id;
+=09=09__entry->data_size =3D data_size;
+=09=09__entry->offsets_size =3D offsets_size;
+=09=09__entry->extra_buffers_size =3D extra_buffers_size;
+=09),
+=09TP_printk("transaction=3D%d data_size=3D%zd offsets_size=3D%zd extra_bu=
ffers_size=3D%zd",
+=09=09  __entry->debug_id, __entry->data_size, __entry->offsets_size,
+=09=09  __entry->extra_buffers_size)
+);
+
+DECLARE_EVENT_CLASS(binder_buffer_release_class,
+=09TP_PROTO(int debug_id),
+=09TP_ARGS(debug_id),
+=09TP_STRUCT__entry(
+=09=09__field(int, debug_id)
+=09),
+=09TP_fast_assign(
+=09=09__entry->debug_id =3D debug_id;
+=09),
+=09TP_printk("transaction=3D%d", __entry->debug_id)
+);
+
+#define DEFINE_RBINDER_FUNCTION_BUFFER_EVENT(name)=09\
+DEFINE_EVENT(binder_buffer_release_class, name,=09\
+=09TP_PROTO(int debug_id), \
+=09TP_ARGS(debug_id))
+
+DEFINE_RBINDER_FUNCTION_BUFFER_EVENT(binder_transaction_buffer_release);
+DEFINE_RBINDER_FUNCTION_BUFFER_EVENT(binder_transaction_failed_buffer_rele=
ase);
+DEFINE_RBINDER_FUNCTION_BUFFER_EVENT(binder_transaction_update_buffer_rele=
ase);
+
 #endif /* _RUST_BINDER_TRACE_H */
=20
 /* This part must be outside protection */
diff --git a/drivers/android/binder/trace.rs b/drivers/android/binder/trace=
.rs
index 06aabb3cc2f1..de2894bcb368 100644
--- a/drivers/android/binder/trace.rs
+++ b/drivers/android/binder/trace.rs
@@ -24,6 +24,11 @@
     unsafe fn binder_transaction_fd_recv(t_debug_id: c_int, fd: c_int, off=
set: usize);
     unsafe fn binder_command(cmd: u32);
     unsafe fn binder_return(ret: u32);
+    unsafe fn binder_transaction_alloc_buf(
+        debug_id: c_int,data_size: usize, offset_size: usize, extra_buffer=
s_size: usize);
+    unsafe fn binder_transaction_buffer_release(debug_id: c_int);
+    unsafe fn binder_transaction_failed_buffer_release(debug_id: c_int);
+    unsafe fn binder_transaction_update_buffer_release(debug_id: c_int);
 }
=20
 #[inline]
@@ -105,3 +110,35 @@ pub(crate) fn trace_return(ret: u32) {
     // SAFETY: This function is always safe to call.
     unsafe { binder_return(ret) }
 }
+#[inline]
+pub(crate) fn trace_transaction_alloc_buf(
+    debug_id: usize,
+    data_size: usize,
+    offset_size: usize,
+    extra_buffers_size: usize,
+) {
+    // SAFETY: The `data` pointer is valid.
+    unsafe {
+        binder_transaction_alloc_buf(
+            debug_id as c_int,
+            data_size,
+            offset_size,
+            extra_buffers_size,
+        )
+    }
+}
+#[inline]
+pub(crate) fn trace_transaction_buffer_release(debug_id: usize) {
+    // SAFETY: This function is always safe to call.
+    unsafe { binder_transaction_buffer_release(debug_id as c_int) }
+}
+#[inline]
+pub(crate) fn trace_transaction_failed_buffer_release(debug_id: usize) {
+    // SAFETY: This function is always safe to call.
+    unsafe { binder_transaction_failed_buffer_release(debug_id as c_int) }
+}
+#[inline]
+pub(crate) fn trace_transaction_update_buffer_release(debug_id: usize) {
+    // SAFETY: This function is always safe to call.
+    unsafe { binder_transaction_update_buffer_release(debug_id as c_int) }
+}
--=20
2.55.0


