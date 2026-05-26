Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207683A7F5F
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798859; cv=none; b=SfLYHDwwyPLdLBfuVG3WgArpBZ27P5XaKsiFZlT1GbwvaoB+/ZeNTruNSxtaZCxHzYC+vBB8YPpLspIK9dDdfoQQCM/M/XZdS+EwVQD8aGIiq5OJfLlasVjjnwvy49hPhY+wGW4mwNLQmJyW772BFX02IOruUk5LcIW6CZfSNFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798859; c=relaxed/simple;
	bh=kHlD8EU+FTMAF9RpGYxt9bc/Ad5QVTJ0KlPWmxkVVZ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u4oOXhE/j2VdBeQf1P/YDT9jwvXQm3ny3TcPHGwAtbc3bLlgFW8jh/QGXeoPppUULAPHzAFWkUygTUQxFDsC+i417QcjOqnI3qrN01WlNqFViMHifpaJWeYsuMXjPtRR3qn59g1iTi7l73Ym+JWDht25ru4pHPmf8cK+y1xdYeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P+ccZ2+O; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P+ccZ2+O"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6889b2a4afcso194519a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 05:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779798856; x=1780403656; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfiCqAbC3mHSZdRdId7XcXIA/99dh6S8TBdimsyKO+w=;
        b=P+ccZ2+OG0O1aETzurLSh57zRZ7t1PK6myRV2Oc/wen/HLjuc1mCM9k1weyp+mJahp
         uVymqQpjPY01m3hpix8XFojwfHItfDE/WENO2Pz9QYu846exyv/LgpiFbD3ymYthxrEt
         MN3W8+OGPSx3rqTMHoCmAx9F2b9lrS8UbafU1KDEfRn6jk/bzIoq1ARyhSxLrp+fOLar
         CCeY1hK6CFCH8fgFdhP8sCVQdjQ01gz2HE0uv5zE6QAQYhjytAVdfSMtuWH2W6Fctz+z
         BDtVtnI/p3to8AJy7Weh4ebfHYnJeEc1+V+ehAmzLi+kbCzr+2wIzyrQvoPj2ttweI1Q
         iGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798856; x=1780403656;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfiCqAbC3mHSZdRdId7XcXIA/99dh6S8TBdimsyKO+w=;
        b=ZaEBqSiLpPK6p9r6t+Of24kmX8MkqfI9goLoA59qrw8Givj2slkMcVWWrNByQOIpT5
         xEkl4uZlubwX7N51gUwBS1HYKXFmSjT8C2h0gv5S6F7DIgXBceDks4qGaH1dMViZZ1aG
         9Lz3r7HVDhbIkL1QtRZi9fPT7hGfiCznTGsfaDUzBn2DJMcsv99Ht/4NKD+ChVjWimru
         DO+0hMEQESuWYxp6h5nVcIkXKC+qgivlRMr7UlCZZhRKcTo/4zmjVaXZbGBG97OHnuTy
         ywekZxyuNf6/DTmp+334FI/fC9i76kOxFuWjIg174F/kvBmfruGLMLfcP9uke0Fc4KFN
         h++w==
X-Forwarded-Encrypted: i=1; AFNElJ9UjCH3TfdF7zR5pa6TiMQdTOIcHoQY/ZJPd9o1QAwQcrtzhZjAC6x5FP/3lQcZw4sQTXJubzYbySpFjHOsZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM64XdVV93n4jPNMSMUTDJ4nhhYhB4tsO745EL5+hrxpALE/qV
	8LElJD7BvszOvBKjzfuTAnbt2YaB7Kw9sCQ2BkZ4NPDfal+7oibtRYArwSuwhF6pbx0Ryt+UavS
	6KBDOxOSboQBddgzwzg==
X-Received: from edvr19.prod.google.com ([2002:a05:6402:193:b0:67c:7140:727f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:249b:b0:66e:bb0d:23e1 with SMTP id 4fb4d7f45d1cf-6889c4777ddmr8567978a12.13.1779798856239;
 Tue, 26 May 2026 05:34:16 -0700 (PDT)
Date: Tue, 26 May 2026 12:34:15 +0000
In-Reply-To: <20260522-binder-strict-provenance-v1-3-3d6e9406e864@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org> <20260522-binder-strict-provenance-v1-3-3d6e9406e864@kernel.org>
Message-ID: <ahWTR_kKAySW1259@google.com>
Subject: Re: [PATCH 3/6] rust: binder: enable `clippy::ptr_as_ptr` lint
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 22, 2026 at 07:12:48PM +0200, Tamir Duberstein wrote:
> In Rust 1.51.0, Clippy introduced the `ptr_as_ptr` lint [1]:
> 
> > Though `as` casts between raw pointers are not terrible,
> > `pointer::cast` is safer because it cannot accidentally change pointer
> > mutability or cast the pointer to other types like `usize`.
> 
> Apply the required changes and enable the lint in the Binder Rust driver
> -- no functional change intended.
> 
> Link: https://rust-lang.github.io/rust-clippy/master/index.html#ptr_as_ptr [1]
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  drivers/android/binder/page_range.rs       | 6 +++---
>  drivers/android/binder/rust_binder_main.rs | 7 +------
>  2 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
> index e54a90e62402..927b0802e80d 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -571,7 +571,7 @@ pub(crate) unsafe fn read<T: FromBytes>(&self, offset: usize) -> Result<T> {
>          unsafe {
>              self.iterate(offset, size_of::<T>(), |page, offset, to_copy| {
>                  // SAFETY: The sum of `offset` and `to_copy` is bounded by the size of T.
> -                let obj_ptr = (out.as_mut_ptr() as *mut u8).add(out_offset);
> +                let obj_ptr = out.as_mut_ptr().cast::<u8>().add(out_offset);
>                  // SAFETY: The pointer points is in-bounds of the `out` variable, so it is valid.
>                  page.read_raw(obj_ptr, offset, to_copy)?;
>                  out_offset += to_copy;
> @@ -593,7 +593,7 @@ pub(crate) unsafe fn write<T: ?Sized>(&self, offset: usize, obj: &T) -> Result {
>          unsafe {
>              self.iterate(offset, size_of_val(obj), |page, offset, to_copy| {
>                  // SAFETY: The sum of `offset` and `to_copy` is bounded by the size of T.
> -                let obj_ptr = (obj as *const T as *const u8).add(obj_offset);
> +                let obj_ptr = (obj as *const T).cast::<u8>().add(obj_offset);
>                  // SAFETY: We have a reference to the object, so the pointer is valid.
>                  page.write_raw(obj_ptr, offset, to_copy)?;
>                  obj_offset += to_copy;
> @@ -712,7 +712,7 @@ fn drop(self: Pin<&mut Self>) {
>  
>      {
>          // CAST: The `list_head` field is first in `PageInfo`.
> -        let info = item as *mut PageInfo;
> +        let info = item.cast::<PageInfo>();
>          // SAFETY: The `range` field of `PageInfo` is immutable.
>          range_ptr = unsafe { (*info).range };
>          // SAFETY: The `range` outlives its `PageInfo` values.
> diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
> index d487638266e3..fa28697982d3 100644
> --- a/drivers/android/binder/rust_binder_main.rs
> +++ b/drivers/android/binder/rust_binder_main.rs
> @@ -6,12 +6,7 @@
>  
>  #![crate_name = "rust_binder"]
>  #![recursion_limit = "256"]
> -#![allow(
> -    clippy::as_underscore,
> -    clippy::ref_as_ptr,
> -    clippy::ptr_as_ptr,
> -    clippy::cast_lossless
> -)]
> +#![allow(clippy::as_underscore, clippy::ref_as_ptr, clippy::cast_lossless)]
>  
>  use kernel::{
>      bindings::{self, seq_file},
> 
> -- 
> 2.54.0
> 
