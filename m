Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF9B40B376;
	Fri,  5 Jun 2026 10:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780657002; cv=none; b=G145QRhti103vvoA5pSf5qhAo8MTxZhi32/YW4NMVmyBt/E9PAJngQWDF5JDuoY0ikkpQXey2aT/38Glj/LcS4BU4Pf0eGV8kldDorafKzt0RX2ad0IHous/yVf4F7W+WbpvhxU9TQbmEfKDPMYdYWCuSTxYPgYO0zR6LuJ2VOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780657002; c=relaxed/simple;
	bh=+3VVbIsHViof554tMhYg+UM69PNfRqrXukqw9svsYnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fGl+v36YF0i46cyk9HYwETNqkkw+8PB2OTd0y/T8jVrwzoShOiYHGdstc4LqOFYsfuohC+bxpXBNhPEvrQfAmL2WXRaqpfq8vM6Ur49zYJ9dPdTFOijmyY/95dDNPAWOZoOpoeYLJNihPB217kdCW8779JrIHRyAN17XfCekQE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPtFR45Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPtFR45Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC9A1F00893;
	Fri,  5 Jun 2026 10:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780657001;
	bh=m1vrsCWez3KirdGgBnyUYRcCksAbydsH8OpW/bG7Bfk=;
	h=From:Date:Subject:To:Cc;
	b=ZPtFR45QxN5HDrB6gmglwtx1QWkM923sg+oW7HTR94P/I5dxvVBocoo8yfClZ+cE9
	 DomZLeed362TUoA/09MpBFRnvO+gyv+XlqI20x96w4BHrM0izoq8K+EEtqKb/92iEK
	 mY+rBR59HLVj2St+uqZBjkWwm+rM1DP/34JAZUHTVorTOXeACCU42ec1pEE7avIpS0
	 SClqbKmZXZag81JrI3ljRZfDeoEPTYDUVjoipyOGSy52eKkjZJBLtWDQPmLzjyHN6Q
	 QtyIBoPSo5wDH49OBjTba8a06pyUNY6WOmZbMtn9etBp18mIr9NtdfJbX7Mp0DZuKS
	 TXsj2qJfjZzBQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 12:56:31 +0200
Subject: [PATCH v2] rust: alloc: allow different error types in
 `KBox::pin_slice`
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-pin-slice-init-v2-1-b197e84040ba@kernel.org>
X-B4-Tracking: v=1; b=H4sIAF6rImoC/3WMywrDIBBFfyXMulNUJI+u+h8hi2rHZGjQoEFag
 v9em32X517OOSBRZEpwaw6IlDlx8BXUpQG7PPxMyM/KoIRqhZIaN/aYVrb18Lwj9eSG1lnRmQG
 qtEVy/D6D41R54bSH+Dn7Wf7Wv6ksUaIwstPOGNlrfX9R9LReQ5xhKqV8AYxwaqOtAAAA
X-Change-ID: 20260214-pin-slice-init-e8ef96fc07b9
To: Danilo Krummrich <dakr@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3120; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=+3VVbIsHViof554tMhYg+UM69PNfRqrXukqw9svsYnA=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIqtguvur9V5S0QGaD1jnOjo5ftsHFO1rztIaF
 OSE5C5+vkyJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiKrYAAKCRD6UCkIqsW9
 0MRoD/97KxVFIEx94MUo+ui7s6st+WJsU7J86wNKxJpiMyoZ7aPyr4wGdXwtNt5WNW9zHfDG9bL
 H+qjv8Hxk7OmeF2g3/iBvOKyWSAwJVY63uCl+XTgvUUU+qOpHij0Hhs837tOcKO0IzB1qBvAp0t
 Fl8bRpyeN++nTJMxcDR4MOZzTgGchCnz/SRIlHVwfKBUfSxdELvAQNuPmnmdPX3EdsOlQr1wpuW
 hq5xz3t56wXeHMVG0vEc0TS2nkE8Ub7UC3mrXrY/oQR7TxtdtUufnxfHKWwkMsMbuyFsgOtrJIl
 +fldpzDKSfPorDR8HBPRTLOoy4mJCgr8wrTAmmVzf7zmHbVUQOMi5ePKY/0q4hAzfoo+e3/H0Ts
 6NDNKyrgghcAuVCM/46pc25NOuqGeXgZd6m5BM9JC64K19d814aogFK93ekdr8246JsKAQQQDKx
 +1optiSFwWkTowpx8AeHNJ8v6Bf1nsIMszb9h9WdIO93iKWjvDxfxRy7fpJgR/IpBUVEnnnumnt
 XelV6+oOmRIK2cYLld56aAaP2Fw0OihafTKVUrICNRp3sL0FiODG9clswuM2FKImFpRwaOe6xKa
 tQUgS2S7FM9nthnuGlIRzfbS0+k7mNGo6MU6mRD9E2Pb7xaW+8pOeguaIzY9wI4LVplbE6J1l5z
 Q8HYPzHZuAQ42SA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Previously, `KBox::pin_slice` required the initializer error type to match
the return error type via `E: From<AllocError>`. This prevented using
infallible initializers like `new_mutex!` inside `pin_slice`, because
`Infallible` does not implement `From<AllocError>`.

Introduce a separate type parameter `E2` for the initializer error type
and require `E: From<AllocError>` and `E: From<E2>` instead. This allows
the initializer to return a different error type that can be converted
into the final error type, enabling use of infallible pin initializers
in fallible allocation contexts.

Co-developed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Use `E: From<E2>` (and keep `E: From<AllocError>`) instead of `Into<E>`
  bounds, which allows the body to use `?` instead of explicit `match`
  blocks (Danilo).
- Add Benno's Co-developed-by and Signed-off-by tags (Benno).
- Link to v1: https://msgid.link/20260214-pin-slice-init-v1-1-0b174fbb1844@kernel.org

To: Danilo Krummrich <dakr@kernel.org>
To: Lorenzo Stoakes <ljs@kernel.org>
To: Vlastimil Babka <vbabka@kernel.org>
To: "Liam R. Howlett" <liam@infradead.org>
To: Uladzislau Rezki <urezki@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 rust/kernel/alloc/kbox.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
index bd6da02c7ab8..c2e89e523eae 100644
--- a/rust/kernel/alloc/kbox.rs
+++ b/rust/kernel/alloc/kbox.rs
@@ -298,7 +298,7 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T, A>>, AllocError>
     /// }
     ///
     /// // Allocate a boxed slice of 10 `Example`s.
-    /// let s = KBox::pin_slice(
+    /// let s = KBox::pin_slice::<_, _, Error, _>(
     ///     | _i | Example::new(),
     ///     10,
     ///     GFP_KERNEL
@@ -308,15 +308,16 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T, A>>, AllocError>
     /// assert_eq!(s[3].d.lock().a, 20);
     /// # Ok::<(), Error>(())
     /// ```
-    pub fn pin_slice<Func, Item, E>(
+    pub fn pin_slice<Func, Item, E, E2>(
         mut init: Func,
         len: usize,
         flags: Flags,
     ) -> Result<Pin<Box<[T], A>>, E>
     where
         Func: FnMut(usize) -> Item,
-        Item: PinInit<T, E>,
+        Item: PinInit<T, E2>,
         E: From<AllocError>,
+        E: From<E2>,
     {
         let mut buffer = super::Vec::<T, A>::with_capacity(len, flags)?;
         for i in 0..len {

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260214-pin-slice-init-e8ef96fc07b9

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


