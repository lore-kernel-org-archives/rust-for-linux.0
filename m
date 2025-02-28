Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE7F270EC9
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740762402; cv=none; b=M3Jf/1FneIWySMh7uAEFEVe9n3mjfIthbxPo+zttSn115GaImNbmX9OheLfPigi80FSBq/WiWN9lFj4YCSZSfdnyUXSLi1TKRP2+LEyBlu3P5x2t4CdkrRnYfWYJUgtJMI6/lyI7GqKCV9brLCYRa7b8oPJsNPF79pHfWdzym1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740762402; c=relaxed/simple;
	bh=LqJp79I0SHXn+9V1u2EorjeF8j76dBe151E56tdKop8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNYNTilnoVLiTtu2SEOpujxcJ4gCVj1u+DJY/6DdHPhtdOkh5HnKfrptKfGzeovSvwpGrhE1fpz876C1e0Dj85sVGnkOX/DlLcw73WhAJTMszWjbsqyQvMZ4iX4MJ4PKDvVSMjxnRebR81E5/wp+qMH6VUj08L/MyKycwROl080=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=N2cJHHC2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="N2cJHHC2"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f406e9f80so1965397f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Feb 2025 09:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1740762398; x=1741367198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6qlfwUD5FmpL5nB2hYAi8mBfOK4uG+dWSAYbDiUuBI=;
        b=N2cJHHC2auvPVki7p3n9w7zEb1fPwmpjYxYtLo4Tbl8pjY04ibkjnpKoKgWnjibB7+
         SHjKK27CTFkUpui4f1uvSpz0Rz9cjGqOlRL57gWdnWqSyLx/AyEnYSXmo0K8+JEqUMdT
         pB40D/HTvpEmJ9s+e7kHcVhY/ynoL/sF0CSiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740762398; x=1741367198;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6qlfwUD5FmpL5nB2hYAi8mBfOK4uG+dWSAYbDiUuBI=;
        b=pWhT1kbvLYE03nCMvg7R9RBGbwVedr1bERvBu42mgEAA7gZVRx5Ur9zp0GQZnALdMw
         yEId+s/PFm6ggQ1l4N7h2Dcf7fhHGvdBaZKyrW2XSB822eeGJ5sE27SO/uTIQTSlEYJv
         m3xuKfOdRFjEfVsD53qT+oXRK/UNAz7L/2AGKWsN7HytYDa/TJnAhTH6KeqhTXIJcdTj
         c03ThsFG5kMQ3yPnifarQ1GLHK0chlezEqTKrE+SijKIw9AHG6896OGOQclaX6fANtqu
         zmdecCTkVsh+c2QDf94o0EULrfThJ5ZOdlakKFhctiABWcBGaQMhxDqrDVhyIB4RiaU4
         gOLA==
X-Forwarded-Encrypted: i=1; AJvYcCVw+mVPGHTJzUqkS48R5q/tmfYu0567FG8AtQ5RHwSL5/YFkibKmAjqWWlrltdw2pVJP2YybxRuF5b1AVooEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBtZaebo6hVHDmWx6J7YijCCGHRXSMPBnopFnRo29oFqLX9MiE
	9k8sZS1Qx775MJGpO7/cRSqluN3Av9UT89530IrK+1hM0ErLSNkhnPgHXhyIjRU=
X-Gm-Gg: ASbGncvgdQ8MhBMqwJbPHyMi3t0afiy3inSwatxFvPd3V/b0NrnYCJYUbcez61lroqm
	T0W0wP9Ln7co31WsfMQGxX8FjHQ9rbY9zw+iAgaTK1a2suVv2F3XoPFdZMMB09lHildA4DRfkkP
	ITtosVzb6p45nD6yDUYZc/cb7qMygxyk39FYK4gekCrpGDIpemxW7AoBEnOY71im74HMhgqWTwP
	ZhHG8xUIXUGLmdx1J+NaShDwnNUGAJbj1Zjnt2T561srX6q/Ki1H4Ucz3u8HWTtv5NE5T4IEIlX
	yh5c6K8vywJgaLylV+KYCWKUI+gks9JE2Fo73w==
X-Google-Smtp-Source: AGHT+IEHSdLntqA4vJ+k4vNL6cpNL9OkNh+/n1fHS6Zb4QIdLy5PGjtmFk+o+TY+g7KnCy/4qXM9Cg==
X-Received: by 2002:a05:6000:4027:b0:38d:bccf:f342 with SMTP id ffacd0b85a97d-390eca5b1c2mr3470538f8f.43.1740762398130;
        Fri, 28 Feb 2025 09:06:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6cd8sm5684867f8f.44.2025.02.28.09.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 09:06:37 -0800 (PST)
Date: Fri, 28 Feb 2025 18:06:35 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 5/5] panic_qr: use new #[export] macro
Message-ID: <Z8HtG8fMSfdewkep@phenom.ffwll.local>
Mail-Followup-To: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-5-569cc7e8926c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228-export-macro-v2-5-569cc7e8926c@google.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Fri, Feb 28, 2025 at 12:39:34PM +0000, Alice Ryhl wrote:
> This validates at compile time that the signatures match what is in the
> header file. It highlights one annoyance with the compile-time check,
> which is that it can only be used with functions marked unsafe.
> 
> If the function is not unsafe, then this error is emitted:
> 
> error[E0308]: `if` and `else` have incompatible types
>    --> <linux>/drivers/gpu/drm/drm_panic_qr.rs:987:19
>     |
> 986 | #[export]
>     | --------- expected because of this
> 987 | pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
>     |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected unsafe fn, found safe fn
>     |
>     = note: expected fn item `unsafe extern "C" fn(_, _) -> _ {kernel::bindings::drm_panic_qr_max_data_size}`
>                found fn item `extern "C" fn(_, _) -> _ {drm_panic_qr_max_data_size}`
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I guess makes most sense to land this all through a rust tree, for that:

Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

The rust macro magic definitely flies above my head, so no revivew from
me.

Cheers, Sima

> ---
>  drivers/gpu/drm/drm_panic.c     |  5 -----
>  drivers/gpu/drm/drm_panic_qr.rs | 15 +++++++++++----
>  include/drm/drm_panic.h         |  7 +++++++
>  rust/bindings/bindings_helper.h |  4 ++++
>  4 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f128d345b16d..dee5301dd729 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -486,11 +486,6 @@ static void drm_panic_qr_exit(void)
>  	stream.workspace = NULL;
>  }
>  
> -extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> -
> -extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
> -				u8 *tmp, size_t tmp_size);
> -
>  static int drm_panic_get_qr_code_url(u8 **qr_image)
>  {
>  	struct kmsg_dump_iter iter;
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index bcf248f69252..d055655aa0cd 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -27,7 +27,10 @@
>  //! * <https://github.com/bjguillot/qr>
>  
>  use core::cmp;
> -use kernel::str::CStr;
> +use kernel::{
> +    prelude::*,
> +    str::CStr,
> +};
>  
>  #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
>  struct Version(usize);
> @@ -929,7 +932,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>  /// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
>  ///
>  /// They must remain valid for the duration of the function call.
> -#[no_mangle]
> +#[export]
>  pub unsafe extern "C" fn drm_panic_qr_generate(
>      url: *const kernel::ffi::c_char,
>      data: *mut u8,
> @@ -980,8 +983,12 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>  /// * If `url_len` > 0, remove the 2 segments header/length and also count the
>  ///   conversion to numeric segments.
>  /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
> -#[no_mangle]
> -pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
> +///
> +/// # Safety
> +///
> +/// Always safe to call.
> +#[export]
> +pub unsafe extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
>      #[expect(clippy::manual_range_contains)]
>      if version < 1 || version > 40 {
>          return 0;
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> index f4e1fa9ae607..2a1536e0229a 100644
> --- a/include/drm/drm_panic.h
> +++ b/include/drm/drm_panic.h
> @@ -163,4 +163,11 @@ static inline void drm_panic_unlock(struct drm_device *dev, unsigned long flags)
>  
>  #endif
>  
> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> +
> +extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
> +				u8 *tmp, size_t tmp_size);
> +#endif
> +
>  #endif /* __DRM_PANIC_H__ */
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 55354e4dec14..5345aa93fb8a 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -36,6 +36,10 @@
>  #include <linux/workqueue.h>
>  #include <trace/events/rust_sample.h>
>  
> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +#include <drm/drm_panic.h>
> +#endif
> +
>  /* `bindgen` gets confused at certain things. */
>  const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
>  const size_t RUST_CONST_HELPER_PAGE_SIZE = PAGE_SIZE;
> 
> -- 
> 2.48.1.711.g2feabab25a-goog
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
