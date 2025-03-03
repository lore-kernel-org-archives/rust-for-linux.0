Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4FC1F3D53
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 11:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999685; cv=none; b=E/WmFZ+asrR2R48EZuJBbzh1tgHnKHCyGKsPcHP5CSXLbh/yh19kZnhHC0pxfJbLX1GPYQt/ehS2uwHRTO3FVTRPTftpNHf3pVd4jkvMH4R14yXGUPxfaAXA0E4KTXTIFXl/GwtMI0jazAP3yO/FQaRbsqTXFR1MR6rIeJ6AxW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999685; c=relaxed/simple;
	bh=mmzLVm8v4VdXeOGo9WH7rraWiP4WmEJOkii2GPoEvw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+OlKlpTbcjcNG8my0HMQoFeGYQJc7jfui1zHEaIbqg0xTnASv/3VcwAZKhGku7ZUSlTI50mZUNy5DXt6DPoP9WmrzAtYrHGPn4vh2n2OtwQV4wKNze+P5plGSh8nIjUn1UAmjvdiUy0Ozr5p9oGEZbFY5UuE3bWJcX09oYo7QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qewhm9M6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qewhm9M6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740999682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BtCwBcye9CTrtDuhJsGiK+EHrAB7P75qFAGVXb42+Gc=;
	b=Qewhm9M6UYRGLao1jCy9k+ZaWKrdoKUGrh9QjrfX/CBU0YboBqPJNW1OQweyA1M0fINPSa
	nJ10ZiVVvdMq8n7o64hswRCC9Geij3oB49pF1VOw+V0FqVq6DOfnvkFWb7NpFnEFqXctcy
	FOu8iiCqiNmuCl2RjNBOTvkwiuCWBIM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-4XFQipDiOPmne8FRTa-9bw-1; Mon, 03 Mar 2025 06:01:18 -0500
X-MC-Unique: 4XFQipDiOPmne8FRTa-9bw-1
X-Mimecast-MFC-AGG-ID: 4XFQipDiOPmne8FRTa-9bw_1740999678
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-438e180821aso22975875e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 03:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740999677; x=1741604477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BtCwBcye9CTrtDuhJsGiK+EHrAB7P75qFAGVXb42+Gc=;
        b=P53Uj0VREi5PM2FOSUQpwdKWfOdFndhQifl9kcW5hSHPxCyX9MXWeEHBlATUCOYKHn
         wllU7g+CXS1XvSxud8Yq7ByXHMox3lcWaJQIWOLfsJfPCWobGFUWPw/y5yKGDWqM65ag
         ft583J+8fJhMseJJPgxGPKzOCYgiRRaIdj/IVnYtlmPmm9aLe/DHSEJRwG59K/NfP7d3
         WHD000XEf7fNDW7RhsMfch4atPn9xuGzUPr7w1jki9Fj/usbketMQKO2xhvg/u3w5fCN
         wonUj6zM08UalhkCincCcyRGIVB0GaWIegifMRz2aW9a5+PwK3JoCVoze3hb/zIPmDYi
         jxAA==
X-Forwarded-Encrypted: i=1; AJvYcCXrKsk3vlON2hI/oVlX1KqkEd6+L7GeTeH2Z3ahbaKs+JqYMfsY+RvIssCHiINFpiLwP7IfXK9Q1XpcLvL8Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxybyR9hGBmMr/wHq7VOE0pCSf9nFfUHkPmDjAlp2CNSaTJO3KV
	O7Swra/h1vVGz32itLBvfCSCV+rPncV6ZKRJZJygBZ6WZemjMGTk/4/kFtNMjIzAFmvSJ5KLxZH
	jsJY3APBlS61f6D9JW/5PlRF6azbVg6BZFO1KziBw7S4Mp9hVmyRwnn9fAM8EhF4K
X-Gm-Gg: ASbGncu+NAgLQHVswd3Wbt3H2uwdKUncBOf74aDlFFb1Gm84ALQ18lRdItZ4wxmzpC9
	fSJnxzdpFuP7ZHvyuyN0eClRC7EyRIEdn1FkSNofVqseSAgy717ckt7hV80eicb9W/oF0fFvyGP
	g2hDIzCAraKp154YUu9D0beS8fDwVglYhZrc0kPyCHMFLt5RogBlmS56vRFGrwUXoO/trilf4li
	Vc8AjD+4nd/fUR+glsQ045ILIbRTHQ/GuG5gRectZryXpSVaziEW/hMFBmFWfWuibc4RBtOqzHr
	ODgGoPx1hNStu7YryMba7gnrRPD7hL1lyS5dYv2IN45h3LulYKb1hOA=
X-Received: by 2002:a05:600c:4f10:b0:439:96b2:e9b with SMTP id 5b1f17b1804b1-43ba66e1e26mr99724995e9.9.1740999677526;
        Mon, 03 Mar 2025 03:01:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6f+Z9mG7hrRn65eukLG1T0PhbqLEnUNclLy0PNQV7Wtv++uSsmKJt4PLYypBMANEATE/SJg==
X-Received: by 2002:a05:600c:4f10:b0:439:96b2:e9b with SMTP id 5b1f17b1804b1-43ba66e1e26mr99724395e9.9.1740999676982;
        Mon, 03 Mar 2025 03:01:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc596eb90sm17756925e9.17.2025.03.03.03.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 03:01:16 -0800 (PST)
Message-ID: <cdefec43-c290-4460-a1f3-7eecf38aa77b@redhat.com>
Date: Mon, 3 Mar 2025 12:01:11 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] panic_qr: use new #[export] macro
To: Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
 <20250303-export-macro-v3-5-41fbad85a27f@google.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250303-export-macro-v3-5-41fbad85a27f@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y-o9ZCMwxaofuNVDOtgE9eqoksKYghvaN7a2DwgjdDE_1740999678
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/03/2025 09:45, Alice Ryhl wrote:
> This validates at compile time that the signatures match what is in the
> header file. It highlights one annoyance with the compile-time check,
> which is that it can only be used with functions marked unsafe.
> 
> If the function is not unsafe, then this error is emitted:
> 
> error[E0308]: `if` and `else` have incompatible types
>     --> <linux>/drivers/gpu/drm/drm_panic_qr.rs:987:19
>      |
> 986 | #[export]
>      | --------- expected because of this
> 987 | pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
>      |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^ expected unsafe fn, found safe fn
>      |
>      = note: expected fn item `unsafe extern "C" fn(_, _) -> _ {kernel::bindings::drm_panic_qr_max_data_size}`
>                 found fn item `extern "C" fn(_, _) -> _ {drm_panic_qr_max_data_size}`
> 
> The signature declarations are moved to a header file so it can be
> included in the Rust bindings helper, and the extern keyword is removed
> as it is unnecessary.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>
> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>   drivers/gpu/drm/drm_panic.c     |  5 -----
>   drivers/gpu/drm/drm_panic_qr.rs | 15 +++++++++++----
>   include/drm/drm_panic.h         |  7 +++++++
>   rust/bindings/bindings_helper.h |  5 +++++
>   4 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f128d345b16d..dee5301dd729 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -486,11 +486,6 @@ static void drm_panic_qr_exit(void)
>   	stream.workspace = NULL;
>   }
>   
> -extern size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> -
> -extern u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
> -				u8 *tmp, size_t tmp_size);
> -
>   static int drm_panic_get_qr_code_url(u8 **qr_image)
>   {
>   	struct kmsg_dump_iter iter;
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index bcf248f69252..906943b02beb 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -27,7 +27,10 @@
>   //! * <https://github.com/bjguillot/qr>
>   
>   use core::cmp;
> -use kernel::str::CStr;
> +use kernel::{
> +    prelude::*,
> +    str::CStr,
> +};
>   
>   #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
>   struct Version(usize);
> @@ -929,7 +932,7 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// * `tmp` must be valid for reading and writing for `tmp_size` bytes.
>   ///
>   /// They must remain valid for the duration of the function call.
> -#[no_mangle]
> +#[export]
>   pub unsafe extern "C" fn drm_panic_qr_generate(
>       url: *const kernel::ffi::c_char,
>       data: *mut u8,
> @@ -980,8 +983,12 @@ fn draw_all(&mut self, data: impl Iterator<Item = u8>) {
>   /// * If `url_len` > 0, remove the 2 segments header/length and also count the
>   ///   conversion to numeric segments.
>   /// * If `url_len` = 0, only removes 3 bytes for 1 binary segment.
> -#[no_mangle]
> -pub extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
> +///
> +/// # Safety
> +///
> +/// Always safe to call.
> +#[export] // required to be unsafe due to this annotation
> +pub unsafe extern "C" fn drm_panic_qr_max_data_size(version: u8, url_len: usize) -> usize {
>       #[expect(clippy::manual_range_contains)]
>       if version < 1 || version > 40 {
>           return 0;
> diff --git a/include/drm/drm_panic.h b/include/drm/drm_panic.h
> index f4e1fa9ae607..ff78d00c3da5 100644
> --- a/include/drm/drm_panic.h
> +++ b/include/drm/drm_panic.h
> @@ -163,4 +163,11 @@ static inline void drm_panic_unlock(struct drm_device *dev, unsigned long flags)
>   
>   #endif
>   
> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +size_t drm_panic_qr_max_data_size(u8 version, size_t url_len);
> +
> +u8 drm_panic_qr_generate(const char *url, u8 *data, size_t data_len, size_t data_size,
> +			 u8 *tmp, size_t tmp_size);
> +#endif
> +
>   #endif /* __DRM_PANIC_H__ */
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 55354e4dec14..607e90a682ca 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -36,6 +36,11 @@
>   #include <linux/workqueue.h>
>   #include <trace/events/rust_sample.h>
>   
> +#if defined(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +// Used by #[export] in drivers/gpu/drm/drm_panic_qr.rs
> +#include <drm/drm_panic.h>
> +#endif
> +
>   /* `bindgen` gets confused at certain things. */
>   const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
>   const size_t RUST_CONST_HELPER_PAGE_SIZE = PAGE_SIZE;
> 

