Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DEA37C0F1;
	Mon,  9 Feb 2026 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647945; cv=none; b=A5LI3r93SVtrEqBrobnN9V5004vyWsn5aY2iEJgl735qAtz/JKKI/nNP9r2pyN/968OY0nfCSPN+uFUD7PIYUXwChbNWaSiSdNOUmWvwCVAE9a+XZTuu+p9OYInfawTXT8rMT6dXxLMhvuyVoNrnu4beDk/za2zTUgyRx8T1xO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647945; c=relaxed/simple;
	bh=hPUvMpxg3yU6YJ5+chgN6zUpPTceUM2JTPt9rO+kJpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtBM7TGNMo0TBFmLlFO32fg86FTH6Eivl9b5mdGLAJQyUT4pMCbFngQIGf8aBxXlMxj9KKZNadRSFzkVYt85rsCZ4mjCLfs4AZZ2eUtp1Jyp85kfYpW3KDvmK+JPhOqXwGL6JcfoXE6tM3hGER4UPCA1vJgLEQNUt0VWjnn83U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L35vImqr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L35vImqr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB47C19425;
	Mon,  9 Feb 2026 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647944;
	bh=hPUvMpxg3yU6YJ5+chgN6zUpPTceUM2JTPt9rO+kJpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L35vImqrNtEsIYbz0XKnuOtX8nsW6acGFOYBDJpFKeRNY3s71iAPwhas4hXmvRsrm
	 fUnTzOwPUKWy6mwIjyYM/GJQBfrTw8BDvOwTg81cXK0bGCqTABDXYCCJabUz4snejs
	 8GfEBKTGa6Sh5jhmRiaoXuMq99uN0npnM7jXIDgyLIBbWOrBWVcqbmjyZDsU2HgDSK
	 LuNrHzoUs49Q2KsmGe0CgFE/4MNezLeEDQ6RTZYed6e1anXBiSXLDBp3ErhxT3vzR5
	 ydLTbir9G2edTPnS2FdVabJ7jHVRJxu6mU7FSgVDHyDkdLnOd1gTxQhAAwQNtphl2Y
	 AhCUwBfJpHNaw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 09 Feb 2026 15:38:10 +0100
Subject: [PATCH v3 05/12] rust: xarray: use `xas_load` instead of `xa_load`
 in `Guard::load`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-xarray-entry-send-v3-5-f777c65b8ae2@kernel.org>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
In-Reply-To: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Roman Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2487; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=hPUvMpxg3yU6YJ5+chgN6zUpPTceUM2JTPt9rO+kJpw=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpifFZFhygcsP92+CC/iGZ/yyaRbPPG+QQI1WSU
 gLT911IMLiJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYnxWQAKCRDhuBo+eShj
 d2zRD/oDbAVgfgHXeRmBddcqnK4VqTy56UmL/gr82qWgR5P3fipSqmnmxnrSoE8pQBBd/bAtADt
 YgaB/4g53dINi8fCUbJ4Q3sXtImvJjn7pPenPU977QBqf3rla5HIyXEzQedjtj04MLFpMnUz9ed
 eHZ9/pe3NbZAc47xhNeoeAJrrkhOKQOBYrbHrHJ1kKb0iIwOziicEBVzZ9SE1EireZ+ENGlUjKf
 nI4uJ1SEEWrU0qvSmttePZZr0ffv1oVUeBcCHEOtI0oy6Mz9sMj4uEgkE5ixhKkItsC7Ebz3ssG
 o6JjPUs29vsmYOBHA2taOsswLKU924EXfw/QadLhFCHa+pFITxKYj2eTK899mShqfNunqF8GYyv
 W0TkAZLFRRcKnTwbrSTsCzpqzRaNDprv8tvbSX74iFI62a7WHiLg/Vj+V2LYsWQdHu/bbDfrFzs
 Bgb0IdWmYdRK28yQs9D5W3WpMIrAbqAQO5JHsGsKgeDovzaiiDpJYnhF+Ko1KyiQVYRe0CpJ8EZ
 Z2drb8mSKhfEd+W6NirmXEYLkbACwoDeaW3Vya0XG61wvEwtY6OxMk/pR6FTxPhbOhUfCJQAb4G
 EOx/PgNbFCu/GhsxYIwmyZpG0ZmDUsH/7CLINow74TjDXV43F7xjeUmaTOHEi828iBdO1Yi280u
 1O2mVrr2mtqx/Fg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Replace the call to `xa_load` with `xas_load` in `Guard::load`. The
`xa_load` function takes the RCU lock internally, which we do not need,
since the `Guard` already holds an exclusive lock on the `XArray`. The
`xas_load` function operates on `xa_state` and assumes the required locks
are already held.

This change also removes the `#[expect(dead_code)]` annotation from
`XArrayState` and its constructor, as they are now in use.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/xarray.rs | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index d1246ec114898..eadddafb180ec 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -215,10 +215,8 @@ fn load<F, U>(&self, index: usize, f: F) -> Option<U>
     where
         F: FnOnce(NonNull<c_void>) -> U,
     {
-        // SAFETY: `self.xa.xa` is always valid by the type invariant.
-        let ptr = unsafe { bindings::xa_load(self.xa.xa.get(), index) };
-        let ptr = NonNull::new(ptr.cast())?;
-        Some(f(ptr))
+        let mut state = XArrayState::new(self, index);
+        Some(f(state.load()?))
     }
 
     /// Checks if the XArray contains an element at the specified index.
@@ -327,7 +325,6 @@ pub fn store(
 /// # Invariants
 ///
 /// - `state` is always a valid `bindings::xa_state`.
-#[expect(dead_code)]
 pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
     /// Holds a reference to the lock guard to ensure the lock is not dropped
     /// while `Self` is live.
@@ -336,7 +333,6 @@ pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
 }
 
 impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
-    #[expect(dead_code)]
     fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
         let ptr = access.xa.xa.get();
         // INVARIANT: We initialize `self.state` to a valid value below.
@@ -356,6 +352,13 @@ fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
             },
         }
     }
+
+    fn load(&mut self) -> Option<NonNull<c_void>> {
+        // SAFETY: `state.state` is always valid by the type invariant of
+        // `XArrayState and we hold the xarray lock`.
+        let ptr = unsafe { bindings::xas_load(&raw mut self.state) };
+        NonNull::new(ptr.cast())
+    }
 }
 
 // SAFETY: `XArray<T>` has no shared mutable state so it is `Send` iff `T` is `Send`.

-- 
2.51.2


