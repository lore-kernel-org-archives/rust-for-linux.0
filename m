Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B303EE1F6;
	Tue,  9 Jun 2026 08:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994314; cv=none; b=hXH2YAWbU+dxBrKV8v5rSUMB4XNwbmhnnLEpmZncpqzlxsHwzAubFautWBdHIGbEwgQ5nKwfUiM5W3E0773VeOngxvat7ar1rm7+tQ9HeqFLHuI+WPPRiIUZoDLE9vKp0aIDjOQueG5NM2Cx9Ss1dwOkHlsKdUiC3/Khv1r/hN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994314; c=relaxed/simple;
	bh=5ynO1uxBNJ2d/a0RNmptNwx/Fo5ic/DH5Xxzv80f1B8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cte2cToR+anlh1o9et+tEDCJQcYO4AKQYddEQ/nkHQt6eO9LhDfLmYDGHgyMNf/T68JNfgjAFXPM3/Vvq2MGEutZrvy8DfhWTt+hOAhwA21gLtKEzQwkIKIhHCvuwKbiLc1pSafrxpLogD/X3ERolg+8m2u/mJMK7xE9TF8Kz9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gvDMxOC8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gvDMxOC8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABACE1F00898;
	Tue,  9 Jun 2026 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994312;
	bh=PQXVqtwbaiH3RdANsHmD5OpcmoL/HseiMLAA07zsWGo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=gvDMxOC8kImibkCM1GWRK1A+k/GFOPcuZueCAaoaJBtkqW2kOAiEn1EJAenzt/4Gt
	 4W+lHKG9U7eoNfU9WWrHX8FJoR9tb40MGpxutjMpmtTKc9BPx/3CGvDmN3RozS51cW
	 QoCS9ZHdJMj+8X4pbfuDDI8iz/cuKJD5onBI45SY3xEA79Pk/GJV2QqXwk6KTGhoMR
	 ZGbJrNMlrEFj6oguklZQQqNBbf4cTZviIR2ybBK7caod/lSR5O1wMtjkwqfudX8ZyS
	 1XkFMXvFBorG8OIJyLzFqw8Pl931gCL6RQeklEprPKTd4LgpD+WSKBynFQ5tRu4fY3
	 Eg3HXaI2LdqBQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Tamir Duberstein <tamird@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Harry
 Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, Daniel Gomez
 <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 03/11] rust: xarray: add `XArrayState`
In-Reply-To: <178067251345.96312.12627213045914595867.b4-review@b4>
References: <20260604-xarray-entry-send-v4-0-965f6028790e@kernel.org>
 <20260604-xarray-entry-send-v4-3-965f6028790e@kernel.org>
 <178067251345.96312.12627213045914595867.b4-review@b4>
Date: Tue, 09 Jun 2026 10:38:13 +0200
Message-ID: <87ldcoglca.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Tamir Duberstein <tamird@kernel.org> writes:

> On Thu, 04 Jun 2026 21:58:09 +0200, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>> Add `XArrayState` as internal state for XArray iteration and entry
>> operations. This struct wraps the C `xa_state` structure and holds a
>> reference to a `Guard` to ensure exclusive access to the XArray for the
>> lifetime of the state object.
>> 
>> The `XAS_RESTART` constant is also exposed through the bindings helper
>> to properly initialize the `xa_node` field.
>> 
>> The struct and its constructor are marked with `#[expect(dead_code)]` as
>> there are no users yet. We will remove this annotation in a later patch.
>
> The review of this patch in v3 requested the next patch be absorbed into
> it.

I must have missed that.

>
>>
>>
>> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>> index d54942aeb201..6d0d4905004a 100644
>> --- a/rust/kernel/xarray.rs
>> +++ b/rust/kernel/xarray.rs
>> @@ -299,6 +302,67 @@ pub fn store(
>> [ ... skip 17 lines ... ]
>> +impl<'a, T: ForeignOwnable> GuardRef for &mut Guard<'a, T> {
>> +    type Value = T;
>> +    fn xa_ptr(&self) -> *mut bindings::xarray {
>> +        self.xa.xa.get()
>> +    }
>> +}
>
> I'm having a hard time understanding the need for this trait, and it is
> not described in the commit message at all. How is this different than
> using Deref? `&mut T` has a blanket `Deref<Target = T>` impl.

I needed `XArrayState` to be generic over `&Guard<'a, T>` and `&mut
Guard<'a, T>` with ability to obtain the raw xarray pointer through the
guard, and ability to name `T`. I did not consider just using `Deref`,
but we can do that. The bounds on the impl block become a bit more
complicated, but I guess that is fine. Here is a diff (against head of series):

diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index cbb16368c2ca..f5a499c23778 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -551,27 +551,6 @@ pub fn insert_entry<'b>(
     }
 }
 
-/// A reference to a [`Guard`], either shared or mutable, that exposes the
-/// underlying xarray pointer and the value type stored in the array.
-pub(crate) trait GuardRef {
-    type Value: ForeignOwnable;
-    fn xa_ptr(&self) -> *mut bindings::xarray;
-}
-
-impl<'a, T: ForeignOwnable> GuardRef for &Guard<'a, T> {
-    type Value = T;
-    fn xa_ptr(&self) -> *mut bindings::xarray {
-        self.xa.xa.get()
-    }
-}
-
-impl<'a, T: ForeignOwnable> GuardRef for &mut Guard<'a, T> {
-    type Value = T;
-    fn xa_ptr(&self) -> *mut bindings::xarray {
-        self.xa.xa.get()
-    }
-}
-
 /// Internal state for XArray iteration and entry operations.
 ///
 /// `R` is the borrow held on the guard: either `&Guard` for read-only callers
@@ -582,12 +561,12 @@ fn xa_ptr(&self) -> *mut bindings::xarray {
 ///
 /// - `state` is always a valid `bindings::xa_state`.
 /// - `state.xa` aliases the xarray reachable through `guard`.
-pub(crate) struct XArrayState<R: GuardRef> {
+pub(crate) struct XArrayState<R> {
     guard: R,
     state: bindings::xa_state,
 }
 
-impl<R: GuardRef> Drop for XArrayState<R> {
+impl<R> Drop for XArrayState<R> {
     fn drop(&mut self) {
         free_xa_alloc(&mut self.state);
     }
@@ -611,9 +590,13 @@ fn free_xa_alloc(state: &mut bindings::xa_state) {
     }
 }
 
-impl<R: GuardRef> XArrayState<R> {
+impl<'a, R, T> XArrayState<R>
+where
+    T: ForeignOwnable + 'a,
+    R: core::ops::Deref<Target = Guard<'a, T>>
+{
     fn new(guard: R, index: usize) -> Self {
-        let xa_ptr = guard.xa_ptr();
+        let xa_ptr = guard.xa.xa.get();
         // INVARIANT: `state` is initialized to a valid `xa_state` whose `xa` field aliases the
         // xarray reachable through `guard`.
         Self {
@@ -656,10 +639,10 @@ fn status(&self) -> Result {
 
     fn insert(
         &mut self,
-        value: R::Value,
+        value: T,
         mut preload: Option<&mut XArraySheaf<'_>>,
-    ) -> Result<*mut c_void, StoreError<R::Value>> {
-        let new = R::Value::into_foreign(value).cast();
+    ) -> Result<*mut c_void, StoreError<T>> {
+        let new = T::into_foreign(value).cast();
 
         loop {
             // SAFETY: `self.state` is a valid `xa_state` by the type invariant. By the same
@@ -686,7 +669,7 @@ fn insert(
         .map_err(|error| {
             // SAFETY: `new` came from `R::Value::into_foreign` and `xas_store` does not take
             // ownership of the value on error.
-            let value = unsafe { R::Value::from_foreign(new) };
+            let value = unsafe { T::from_foreign(new) };
             StoreError { value, error }
         })
     }
---


Best regards,
Andreas Hindborg


