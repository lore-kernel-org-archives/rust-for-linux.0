Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE6F65A
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 00:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705537899; cv=none; b=I8GIRnkdeEERdiiA8HScloGsZ0TJrUwDmIVgo4zGDJ+9JSbhK7/GJ8lcnuKWZFsq9opMhSPnxOIOpO1YrMcsx1OXycEhyOvB6jwAk4hCsxCMNolUtlC4i9Lowg36oyvyvw7mxmYfufE6EKx/mepUqqIEP+1W4HB06Y2VufAugbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705537899; c=relaxed/simple;
	bh=HHHN+21b1s5ZsZlwFfsA33inEbYD5JArBhhzvCwxMs8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=iRjGoKdhGXZ7UC8g6q8hdZMZPIjIqST7QB7SldUZNIbANY0Z5w8Wlm1h3a2/mWtqtACpQugPzG2YJeZogAcH4t13EojUhjVIeXeW9NW8XKHZYWzSWdvJpemP/1NpvXLJtEBDoHoh8SQB5vG/p9cY2EsWCFsKPLzzKgKptJeVK/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=UQO9N6PS; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="UQO9N6PS"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc256e97e0aso37042276.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jan 2024 16:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705537895; x=1706142695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMCjVbbEOX7lRW66KzLOgIpoqKdWLZHzBrkMjFZb0Aw=;
        b=UQO9N6PS+ZFBa8mNGVgKWtS3lKJrLUbT9gC2zXEfTnKSl2nZ7nv30gPvvF7LSbRTVw
         hYCDME+QyndX+EP3vkyFfYGJcqJ9cx2J6oM2m5cb7xg3BICFVTRUaJkL8RUvsBixgUce
         nHq3Fn2L2XVFdfyn2SZrZysVeyqgMB+eY8gSuBN9r45s7HCAZf9ZhX72RiQCZfJMu+XL
         ptr++YshhE6rAtXuw0Mnbs/vRpDF0nUwnz/1xTwxjvT0md45eNE/OcZAABC/xiX7IMn1
         xTbQo67L/YUVvToo/HCZQiChsg00H4duTNVKTvmlrUWoXpibnGFMSUbIUkx47zcpvS3p
         tDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705537895; x=1706142695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMCjVbbEOX7lRW66KzLOgIpoqKdWLZHzBrkMjFZb0Aw=;
        b=FufmGKr+doMlJ26Ngr+NgXYek60IGxCQwag7yPc4tuWYO9XJhsXy11vJn24VYfcwWC
         Pu+/oTu+n6+JJunxxQKitUuM51ib06hm8NlL9cWjsij4PxTc4HWc7sjv0ToZ1BNAi7GZ
         VGsWyuG7cvjfrPyUHUx/SxucaGYb4e6aEbB+y8SHM46D2YQXX1Ab2SZsT9WKpvIomFpk
         LtbmcZWTn6rSfu9oo5ywLjXmsp2nEJOPREy2ue07jLs6WMk5rgqTRq49gDV5ZwJwtXI0
         4jqH8ivQI+3HDRvv3+eW8tte6xdbouq1hLnJkPuVD4DFIM2RPx95xApsLUGwDZt3uiCt
         pLzQ==
X-Gm-Message-State: AOJu0YzWobmet77kKo7AOZz09tl0Jlg6vgUJcsu8ZR1kuJqiQbgYvVln
	eK+scqWdDliRZUhFSLMMHm73vVlijUPRMxZmy8S+cI6qMz+p9Y1OAc4fq2BmZvRZZY6kvSvQEjq
	jXe6YJn5Cstmn4gteelvgVGhqb2wlhZKnXtvDyw==
X-Google-Smtp-Source: AGHT+IFXAWJujkNhfsG1Z48yZUPTeX3COlLwUJNjKT7WOkOYn+1ZVbAZuNOBpx7XPhvfh1bqCcUaTGZ4it3QtQrPQV0=
X-Received: by 2002:a81:6d09:0:b0:5ed:90e1:8bf4 with SMTP id
 i9-20020a816d09000000b005ed90e18bf4mr56966ywc.47.1705537895688; Wed, 17 Jan
 2024 16:31:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116160141.165951-1-kernel@valentinobst.de> <20240116160141.165951-3-kernel@valentinobst.de>
In-Reply-To: <20240116160141.165951-3-kernel@valentinobst.de>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 17 Jan 2024 19:31:24 -0500
Message-ID: <CALNs47vgfs+cFhYsTZU_RE5WxFZ4euMAhuKESJE6m7PFy0JTzQ@mail.gmail.com>
Subject: Re: [PATCH 02/13] rust: error: move unsafe block into function call
To: Valentin Obst <kernel@valentinobst.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 11:05=E2=80=AFAM Valentin Obst <kernel@valentinobst=
.de> wrote:
>
> The `from_err_ptr` function is safe. There is no need for the call to it
> to be inside the unsafe block.
>
> Signed-off-by: Valentin Obst <kernel@valentinobst.de>
> ---
>  rust/kernel/error.rs | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index 4f0c1edd63b7..6f6676bc0eb9 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -265,12 +265,7 @@ pub fn to_result(err: core::ffi::c_int) -> Result {
>  ///     index: u32,
>  /// ) -> Result<*mut core::ffi::c_void> {
>  ///     // SAFETY: FFI call.
> -///     unsafe {
> -///         from_err_ptr(bindings::devm_platform_ioremap_resource(
> -///             pdev.to_ptr(),
> -///             index,
> -///         ))
> -///     }
> +///     from_err_ptr(unsafe { bindings::devm_platform_ioremap_resource(p=
dev.to_ptr(), index) })
>  /// }
>  /// ```
>  // TODO: Remove `dead_code` marker once an in-kernel client is available=
.
> --
> 2.43.0
>
>

If you're up for it, that safety comment could also be improved. Something =
like

    // SAFETY: `pdev` points to a valid platform device

But that is noncritical.

Reviewed-by: Trevor Gross <tmgross@umich.edu>
