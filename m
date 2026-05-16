Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE937286425
	for <rust-for-linux@vger.kernel.org>; Sat, 16 May 2026 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778937676; cv=none; b=g/dCq2lpPVUdXMV5H2kiBsx66IkjdZeUoAmRaf/oTaxWt3uFTzMQjbwKZbi5R4Wghw5Lk68KwqVl6RQqk1e0402NIWZwOwtoaJXEG0yRO/3rCaZe9beTsCz+p27kFvQm6KNgRAxLt8eL+4PrBmjtQxKNeFDglbtd8HHXxHEhC3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778937676; c=relaxed/simple;
	bh=w3m99AMue8acTn+COBzzVXpdS93KjFM+oyZP0T7P8lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T53PwgAN5uJB4WvAr6y8feOO63nf2S12hhdFoeI033wLJ4mb8V8LpP3GbhCZ65eZnhXrqzBBdtUbB+ErbkQG1/YiNxcWQfyBSORsk9xDc+jhjoxQ9/+nq/FwuQaQ8o+AiIssFM+kdi9scZpZvUayEbpzBn1j3C/7qKpZmNQhr98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nK3Ec8mk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nK3Ec8mk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B304FC19425;
	Sat, 16 May 2026 13:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778937675;
	bh=w3m99AMue8acTn+COBzzVXpdS93KjFM+oyZP0T7P8lU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nK3Ec8mkwxn0XykUrYCaXBVc30rKOExivJzrH819LToqOCXUl4ouli3ak5R0C4E1G
	 9l0SOxHKzcyyMCuxTgn3izndyqSpbCoKHSKf0DYJVM8+71B36ux+Mp8yECz4nvAKBP
	 hHRJkEWoys3p2UZ/hmrHWnP/UtjZp7HL1jmrEHOk=
Date: Sat, 16 May 2026 15:21:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Benno Lossin <lossin@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Untrusted Data API
Message-ID: <2026051610-flint-compound-810f@gregkh>
References: <20250814124424.516191-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814124424.516191-1-lossin@kernel.org>

On Thu, Aug 14, 2025 at 02:44:12PM +0200, Benno Lossin wrote:
> I didn't have too much time to spend on this API, so this is mostly a
> resend of v3. There are some changes in the last commit, updating to the
> latest version of Alice's iov_iter patche series [1] & rebasing on top
> of v6.17-rc1.
> 
> I think we should just merge the first two patches this cycle in order
> to get the initial, bare-bones API into the kernel and have people
> experiment with it. The validation logic in the third patch still needs
> some work and I'd need to find some time to work on that (no idea when I
> find it though).
> 
> I also think that field projections are necessary to make `Untrusted`
> reasonably useful, but I'm open to adding a stop gap solution in the
> meantime. There has been some movement at upstream rust on field
> projections. I submitted a project goal for 2025H2 [2] and it most
> likely will be accpeted. I also opened a tracking issue [3] for the
> language experiment that will drive the design of the feature.

Ok, I finally carved out a bit of time for this, and moved the user
data pointer rust bindings over to use untrusted, which looks like this:

---
 rust/kernel/uaccess.rs | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 5f6c4d7a1a51..d0d04b37e77d 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -14,6 +14,7 @@
     prelude::*,
     ptr::KnownSize,
     transmute::{AsBytes, FromBytes},
+    validate::Untrusted,
 };
 use core::mem::{size_of, MaybeUninit};
 
@@ -171,7 +172,7 @@ pub fn new(ptr: UserPtr, length: usize) -> Self {
     /// Reads the entirety of the user slice, appending it to the end of the provided buffer.
     ///
     /// Fails with [`EFAULT`] if the read happens on a bad address.
-    pub fn read_all<A: Allocator>(self, buf: &mut Vec<u8, A>, flags: Flags) -> Result {
+    pub fn read_all<A: Allocator>(self, buf: &mut Vec<Untrusted<u8>, A>, flags: Flags) -> Result {
         self.reader().read_all(buf, flags)
     }
 
@@ -262,7 +263,7 @@ pub fn is_empty(&self) -> bool {
     /// # Guarantees
     ///
     /// After a successful call to this method, all bytes in `out` are initialized.
-    pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
+    pub fn read_raw(&mut self, out: &mut [MaybeUninit<Untrusted<u8>>]) -> Result {
         let len = out.len();
         let out_ptr = out.as_mut_ptr().cast::<c_void>();
         if len > self.length {
@@ -283,10 +284,10 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
     ///
     /// Fails with [`EFAULT`] if the read happens on a bad address, or if the read goes out of
     /// bounds of this [`UserSliceReader`]. This call may modify `out` even if it returns an error.
-    pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
+    pub fn read_slice(&mut self, out: &mut [Untrusted<u8>]) -> Result {
         // SAFETY: The types are compatible and `read_raw` doesn't write uninitialized bytes to
         // `out`.
-        let out = unsafe { &mut *(core::ptr::from_mut(out) as *mut [MaybeUninit<u8>]) };
+        let out = unsafe { &mut *(core::ptr::from_mut(out) as *mut [MaybeUninit<Untrusted<u8>>]) };
         self.read_raw(out)
     }
 
@@ -296,7 +297,7 @@ pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
     /// truncates the read to the boundaries of `self` and `out`.
     ///
     /// On success, returns the number of bytes read.
-    pub fn read_slice_partial(&mut self, out: &mut [u8], offset: usize) -> Result<usize> {
+    pub fn read_slice_partial(&mut self, out: &mut [Untrusted<u8>], offset: usize) -> Result<usize> {
         let end = offset.saturating_add(self.len()).min(out.len());
 
         let Some(dst) = out.get_mut(offset..end) else {
@@ -315,7 +316,7 @@ pub fn read_slice_partial(&mut self, out: &mut [u8], offset: usize) -> Result<us
     /// This is equivalent to C's `simple_write_to_buffer()`.
     ///
     /// On success, returns the number of bytes read.
-    pub fn read_slice_file(&mut self, out: &mut [u8], offset: &mut file::Offset) -> Result<usize> {
+    pub fn read_slice_file(&mut self, out: &mut [Untrusted<u8>], offset: &mut file::Offset) -> Result<usize> {
         if offset.is_negative() {
             return Err(EINVAL);
         }
@@ -367,7 +368,7 @@ pub fn read<T: FromBytes>(&mut self) -> Result<T> {
     /// Reads the entirety of the user slice, appending it to the end of the provided buffer.
     ///
     /// Fails with [`EFAULT`] if the read happens on a bad address.
-    pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> Result {
+    pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<Untrusted<u8>, A>, flags: Flags) -> Result {
         let len = self.length;
         buf.reserve(len, flags)?;
 
-- 
2.54.0


Now, this obviously blows up the build as everywhere we are attempting
to read from userspace data, the buffers are marked "untrusted".
Ideally this would be simple to just go and make all readers implement a
Validate trait, BUT we have fun things like the debugfs bindings that
attempt to do automatic conversions of any type being read from userspace:

impl<T: FromStr + Unpin> Reader for Mutex<T> {
    fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
        let mut buf = [0u8; 128];
        if reader.len() > buf.len() {
            return Err(EINVAL);
        }
        let n = reader.len();
        reader.read_slice(&mut buf[..n])?;

        let s = core::str::from_utf8(&buf[..n]).map_err(|_| EINVAL)?;
        let val = s.trim().parse::<T>().map_err(|_| EINVAL)?;
        *self.lock() = val;
        Ok(())
    }
}

So, converting the data to the "correct" type is a fine idea, but then we
really want to make the data in that type as "Untrusted", right?  But how?
Force the caller to make the type definition as untrusted?  Something else?

I thought about a "blind" movement from untrusted->validated in the buffer
here, but that feels to circumvent the real idea that the data coming from
userspace is "untrusted" and must be checked before acted on.

I have run into the wall of my rust knowledge here, am I missing something
simple?

Also, the one user of this trait so far in the SPDM patchset:
	https://lore.kernel.org/r/20260211032935.2705841-1-alistair.francis@wdc.com
is doing just "this is a C structure, so all is good" type of validation:

impl Validate<&mut Unvalidated<KVec<u8>>> for &mut ChallengeRsp {
    type Err = Error;

    fn validate(unvalidated: &mut Unvalidated<KVec<u8>>) -> Result<Self, Self::Err> {
        let raw = unvalidated.raw_mut();
        if raw.len() < mem::size_of::<ChallengeRsp>() {
            return Err(EINVAL);
        }

        let ptr = raw.as_mut_ptr();
        // CAST: `ChallengeRsp` only contains integers and has `repr(C)`.
        let ptr = ptr.cast::<ChallengeRsp>();
        // SAFETY: `ptr` came from a reference and the cast above is valid.
        let rsp: &mut ChallengeRsp = unsafe { &mut *ptr };

        // rsp.opaque_data_len = rsp.opaque_data_len.to_le();

        Ok(rsp)
    }
}

Which really defeats the purpose, or at least calls it out as IMPLEMENT
SOMETHING REAL HERE as just claiming the data is fine doesn't feel right to me.


thanks,

greg k-h
