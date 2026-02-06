Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B094B30BB8D;
	Fri,  6 Feb 2026 21:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412347; cv=none; b=GYbIjmlQljq0t+HkavkOgF+xubZaheukmbKKwikMQPF3mtrbIyq+mOZERKV+XY49Wu2mpthR3Cp0Tq0FxxJGCHbPM4KCn5IfXIYcPPbp/esYL5voJx3lLDRvgv1cLOg0RUd5S0n9srYtQ0iWrJUZBqs/UEbf2fOgm3J3Er7SxxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412347; c=relaxed/simple;
	bh=hPUvMpxg3yU6YJ5+chgN6zUpPTceUM2JTPt9rO+kJpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NhtAsUFy/b0m98cAn31CLEwiosYpw5AJMaK1liLqNYYG6ix+gaYsqkUqSsh94ZaI+g56SlUCliPq5C33aO6u+7ht4Zh8Pfj0gKyhykpxgUoa5YwGNK23Ttb0Rgct48O+InedexQ6jPUGLBep59RCAxHkCPHjh5xFdWdG+80z3fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bE2lwnoT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bE2lwnoT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7CFC116C6;
	Fri,  6 Feb 2026 21:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770412347;
	bh=hPUvMpxg3yU6YJ5+chgN6zUpPTceUM2JTPt9rO+kJpw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bE2lwnoTbUhX6wRjb9J+cLBcsVr5Jv5E5IbPpP5LHrrkAc3M9EkTMS6jB/oQpYagy
	 YW2PB1LY+7am5q+4DhB0AuNgSvbaxVQwZAGKTGVftSGBt0gHlJLYZyuqzch5Tgxs7M
	 YaLqwJekVNxJi2Ugs/FuuDtJfNi1JizIPESSS39whpoJXwRPo8P/xZpUVdHtnn2FZb
	 Nhog1+pxGIwx7ps3QbBat5j0m+nInoyzc/TCm4Nk3dStvUeuJ/4XHHmdeIRbaQnSWm
	 UtEVJsG+AKVuG5q68oMhic3BrmvqiPXgs4WS8so8WGbFaMmQ6VfT4c+LNdM70YDA8x
	 3JHAi6obCEqNg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 06 Feb 2026 22:10:51 +0100
Subject: [PATCH v2 05/11] rust: xarray: use `xas_load` instead of `xa_load`
 in `Guard::load`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-xarray-entry-send-v2-5-91c41673fd30@kernel.org>
References: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
In-Reply-To: <20260206-xarray-entry-send-v2-0-91c41673fd30@kernel.org>
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
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBphljlPuwNO4ue3fT31Waz1i4XhwL+yr2R/wlfG
 z2Vk0o95fWJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaYZY5QAKCRDhuBo+eShj
 dwFgEADGYbdE3AJj4qJmyXhExgAWxEZVRa0PBezxw0lLQ3YNuSBS4sxStLzhx/kxcGOxx+p2tYn
 IYi/BOCeUrZXx2NpOKuSSNE+THWW3FXR1Z95QQumYY/aYmIjLUwpGO8MMxS+rtgMrCaE8nZ2pPI
 5AYF8cw8Txef2zi5Cc6ugLnlHlYwSBOUm5uYQm8DcrbxLftoHirfdz4Ku8ar2FnmKCwAx2r/O/C
 wkNn9Y9N6q2zBzdMXNqLyK96tb1mGO3oX/eiY1eM3+prUfrYMaL/+lT4utWZnxN7ygFlpTY3dj3
 OIcAJWPllgGwoORsgGZz+vXaz6um0G7PD8VP04tUP7M4y0r7ujgc9ndcWfEhnV/u4DRKliix4Qf
 dHbK8iN7aszFO4to8BhY69mvUCf+ewQ6qVdG8TcLI3HeuvV4YPqxZyQrStpMDw1MXz7I2DOMBO7
 jDE3s+DtInSr/DbxUAakU+uOjEBw/tJZYFyKN5EEK31lbHTSMsqzBe7SbPP7Ss1S5mskwzvz1uj
 RzuzsmJALis/JfpgSJDha6AY97Oxmf1vwcZbEGrUAeOQIndg//9njSu/1m7cNZrkhncaW9OTRlP
 oUWYzmGq+Hz1ZyP7XM6nGGoO0jVKz2PLMRrIgd3PuxtvF6uANoiClQHHaPXFhrEfnhhxCRN3M3p
 f/4hPVU3lzkg8cA==
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


