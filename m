Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC342E3387;
	Wed,  3 Dec 2025 22:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800877; cv=none; b=XuXtnbRWQ/xB73uZV4yN38Cr4GahP11kaTL0PgpCVxvF5gcF/IPEWEnD7L2jC5rzszw2ZXzjyeXvT2EFh5mcVA5GoAbpjGzgj7FmAP0yS9y21RuXIy5Hbsu3KwcId2RzdSqN76l7T955+3teQkV8zfcpP6t8k+mQOWgpmlqI5C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800877; c=relaxed/simple;
	bh=r8fjJ/0sJNZXN0VhQA4fesjTQ4dU92nbou+EK9lKlUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lGfNYN4aq2+nmj1NzLc0VPIlj5F7Z41a6asIOjWDURWfUHLTIiYUBIa/A6TL+aS7ztJbPyz+p78IZyyj2SmaTmCd7bd2xjOORWjqe0ZVmqxEFVmcx6fIzT9SK4tljVZvDRoVnZG/aXa6PWZXpwcfzhSc7FOlok5R6hMXccPvIWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2IruBOq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2IruBOq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9A2C4CEF5;
	Wed,  3 Dec 2025 22:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764800876;
	bh=r8fjJ/0sJNZXN0VhQA4fesjTQ4dU92nbou+EK9lKlUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n2IruBOqnajoVd/lykfvDi4LKv7kv7WvRDzlkoz+u29dSGsqFaOhnZcnXsRN8+SXB
	 XPoRHqahlQ1ySBQBG6huGLB/V+4tR821BpoKBmp6RqNiizRsE2lk3vQmHciWI2/MEt
	 bIzXDiv0BwbNbN6VRiESRIZdXyOwquxdWDXiBQ8mlWeSkjuJAqlZCbhpm7iXD0we5r
	 LG6Ydph/sAaQ+zWeezSwLePe/orUydUpekWvWWMA8Frqn64lxfPybmlk9p12uih9dw
	 SQpuyW3+Im9f0VdjgKVVsRzOUOiwXTzgb0xI79L7kSOAS4Oo1GyghQy1uF3qeR4nwl
	 zKZysuQ/4Wa6A==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 03 Dec 2025 23:26:35 +0100
Subject: [PATCH 05/10] rust: xarray: use `xas_load` instead of `xa_load` in
 `Guard::load`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-xarray-entry-send-v1-5-9e5ffd5e3cf0@kernel.org>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=r8fjJ/0sJNZXN0VhQA4fesjTQ4dU92nbou+EK9lKlUs=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpMLkuKU3p0iqxIBnW8ULt0GY0mbkZX6Zf2liSI
 OQaLf7gLhKJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaTC5LgAKCRDhuBo+eShj
 d2egEACF9HiF/fncSnF3nAlEcDK8KdpoXEoYTRiUW5GNVtYCSEKjGOnXhsUe9f6dUuP4jhi2nyu
 aKxtVRmF7kJVvsCTrj7OnZmPUNps2Oes4Qph9ViKQxPTl8ykBoxGAme0apwOIJ32zRkx6xlNNk6
 bnn7oRoykBokq9OoQFEl8Qm0X99Guqt6v4RH9VAp3MXAlDY2qwW6EHtBAWoSb3Xvdf2NM7yf2C/
 UFeYu4Zj1vzIzXOo1gJ5acsgN64oqcSq34vqZXDZlP9LkYqiY8RxWMnAUtiXZR8p0F1bd7UepaJ
 /jvzaOLy0dpDalzFavn+9pQDLGHXa5F5qwzVWHbL2cpabP92I6CsPYL9AT9XzZSK87fkjRXOoco
 fwdaTqmPlvVaYZlysBwxTt2CNq3t7Zz9w4LnNmZDxk7OaeUwHj2zsgpT8+JsgeslGCrJfpYGJ3T
 iN58SN35VqM8mAK5oMs3oFmFXKr/sVxnGfTApulbEwKTzMK+nPdUV1Npomb6hbSn6AusK7K5LzP
 EB/zCQLRuCSWytP75d1YTk1FofpDl/bdWFv0t5C/NIaYRXlRCJEcVaZPJIjUqef7Asde+T0z0qB
 3uyEVmZnOFmtK9oD6p0Kf4W21EEEVQZWe+ii0F1vz8TLn5hjiQlA9N7dDdiR0s7cjlb4SQZA7vr
 WuXUJ0ryoue4/jw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Replace the call to `xa_load` with `xas_load` in `Guard::load`. The
`xa_load` function takes the XArray lock internally, which would cause
a double lock since the `Guard` already holds the lock. The `xas_load`
function operates on XArray state and assumes the lock is already held,
which is the correct API to use when holding a `Guard`.

This change also removes the `#[expect(dead_code)]` annotation from
`XArrayState` and its constructor, as they are now in use.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index f6e610b059625..0f69a523b72bf 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -215,8 +215,10 @@ fn load<F, U>(&self, index: usize, f: F) -> Option<U>
     where
         F: FnOnce(NonNull<c_void>) -> U,
     {
-        // SAFETY: `self.xa.xa` is always valid by the type invariant.
-        let ptr = unsafe { bindings::xa_load(self.xa.xa.get(), index) };
+        let mut state = XArrayState::new(self, index);
+        // SAFETY: `state.state` is always valid by the type invariant of
+        // `XArrayState`.
+        let ptr = unsafe { bindings::xas_load(&raw mut state.state) };
         let ptr = NonNull::new(ptr.cast())?;
         Some(f(ptr))
     }
@@ -327,7 +329,6 @@ pub fn store(
 /// # Invariants
 ///
 /// - `state` is always a valid `bindings::xa_state`.
-#[expect(dead_code)]
 pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
     /// Holds a reference to the lock guard to ensure the lock is not dropped
     /// while `Self` is live.
@@ -336,7 +337,6 @@ pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
 }
 
 impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
-    #[expect(dead_code)]
     fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
         let ptr = access.xa.xa.get();
         // INVARIANT: We initialize `self.state` to a valid value below.

-- 
2.51.2


