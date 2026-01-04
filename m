Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E836284665
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 02:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767493793; cv=none; b=sbCUjuTyZcewyP6MUJN6iJyhNUyDN4ZX1nDVV12AmvzyKMtChajczAMzv/iAIYoxg7wD9hVLGjHXoJ217K6RZx7Nmlr62/yidXty0AUYBa/qKTTG/ZBxxUilQkl4aMHiarA3+GYtWmbOODcUWoTf8aNJjBC1EZNCdAMH7ORIIHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767493793; c=relaxed/simple;
	bh=P+PY7OymFb/4N9KP/lPDwhjGpPFBU+3pNPlDxFn26VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKOQo1UOSLqm/OiPLSrYWlgWSkM408aOFDuYLM59/lwq8EKktC8mpKgQRCAPimscxJwVV2v1//2DPLb6o2R/1DZi1KW0hPNUxg79Df0B/SRGlgJPYxh5lZkhV5vuwOZJMnCDomjM5tepL6CIQYaOyltfiLIVMv1nqEYVjrfvV/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvnXBvWV; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvnXBvWV"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37ce27af365so112546491fa.0
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 18:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767493786; x=1768098586; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zETYNPHIFMkBIdZl2aEi7jhtGoaurx1nMtILAMqUgkk=;
        b=YvnXBvWVLwnx1+vlD/gL81JguU8zhSBJygXKVNwQMKQvs18Oh8kfzfSyUCJTU+yjRT
         693InVHfuQOkOe3b3dPQ30Pbn7Lb+3A+uwPRazcuQgrD28Ja7rvJ/vqOwpVdc9RtWk3u
         XtBlcvoA0wdxiv6Ec3KM2m1bVCrZyd3wBtO4TVGeLiCGJFozZBc0vneRwRiNpYivoFjb
         rmC8aFVdGcSfDaWIgjPUbC8Tqi5JJX7VhGRN+oxUg+D83V8rD09VNTMH/8ljBu0Aeonn
         1tU4FlUwiOhCHmvbMX7OIWM3B7Usqn1z5nDTBlLNfo0GUwEFYVKtqpMl6txLYEIBAbim
         ikjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767493786; x=1768098586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zETYNPHIFMkBIdZl2aEi7jhtGoaurx1nMtILAMqUgkk=;
        b=UwFEBHn33DfKLwGEBkmXJDkKk3i5dCuf9D2Yr4ClbuD4WhYouht0ZtlFk5KObmnB25
         VzYDIIqELUzOf3EwskSuxLj41JKyNlkfmq0hLZilkS9qgd9gyzUl9ZF0Fy4xHf5jNUxR
         UEgQo6/9JCCvb+9eFN+BqmffycbD/iCwQs3FLYOXwhKFT7V+OlyYyoU7Huc6wIWIDgS2
         ei/AQMfRMtLlFdbER9ljwx/wPmMYEm0fOMmZIH6QZiJpnvKiJjxO02fBSXS/vbYEcieh
         W4h8abOM5udx9GYad9iyA7sKrBFsgx+xhxQ9wNiWU9sw9OWFy18LW50fzsfP7HKh6o2/
         pLqQ==
X-Forwarded-Encrypted: i=1; AJvYcCViOtjyjAmGHVBgIWnRItW50pdyrZ6fJYB7XIiBj6MLKJVzBWlxLUZG9HwlLwLnD9PcaBWpVp2yAedRJgSW4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YziTeH9wNVv9avB6D2BPFaC79VgSou7lFLkDd/ct0mm1H29+Y9l
	zUJ6niw49huW3EMB/gwNikXjZlb8oxbMZSOX+mlcQNIJW6pbR2LW8MtkZ+v1NqZKYJfFfskc+jU
	Jzjg5Wg5hUoGrBkfxVwSRL+fBFRplX6Q=
X-Gm-Gg: AY/fxX6bzWzzDXoyjVQsbwVj0HLHCIWDgLNuFLGtBYRDTo7kW6GEWNzx1/0X5WveY2w
	CYbICc2o4VqdGH4QriUToJpoS5uo+hSKNoAT6+s7I2/EmQooNXwitnnvX2QHKDIV3YkZInlR4jd
	icclomHG/a/pdIeo/YHDc2NFbSO+VJ3hf08AudLjCCtnZVpnkVeFz+0iZXVO9SfPrW3moM5v2HZ
	QBrcdn+zvSIXQEykJV9GmusuWOolzsfQhWIkzrfXBLmZMXHJXPC/orfUAwya5nJV4P7RGQe0OGR
	jmqgSUOvfiK5eOdYW1ZJwe3Y6IS6/XdWyBva6YcP3oCxqKOT6HSx4oM1LS9s6pYzn+VOySjBwg/
	nM6HVXHA9GrleZxvBZHscRIgHqD7XVvvikDKtbG+/oA==
X-Google-Smtp-Source: AGHT+IEkeF149vCKkv131U29TT7uWwUvDBTWyqILbhkq8xrmcL3uGcHe6zXBC00ZBwP4ptWq6LmgDctKC/u+p834rdw=
X-Received: by 2002:a05:651c:a0a:b0:382:8844:2080 with SMTP id
 38308e7fff4ca-382884420e0mr60448961fa.25.1767493786271; Sat, 03 Jan 2026
 18:29:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-vfs-v1-1-18e3d327cbd7@gmail.com>
In-Reply-To: <20251222-cstr-vfs-v1-1-18e3d327cbd7@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 3 Jan 2026 21:29:10 -0500
X-Gm-Features: AQt7F2qv5FlJRZgMoO2uW18PvkkkOZyVxcSR3j5bBanFQJE8sULbQYbFPqIB6Qg
Message-ID: <CAJ-ks9kDy2_A+Zt4jO_h-=yzDjN024e1pmDy4kBrr5jsbJxvtQ@mail.gmail.com>
Subject: Re: [PATCH] rust: seq_file: replace `kernel::c_str!` with C-Strings
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 7:19=E2=80=AFAM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/seq_file.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/seq_file.rs b/rust/kernel/seq_file.rs
> index 855e533813a6..518265558d66 100644
> --- a/rust/kernel/seq_file.rs
> +++ b/rust/kernel/seq_file.rs
> @@ -4,7 +4,7 @@
>  //!
>  //! C header: [`include/linux/seq_file.h`](srctree/include/linux/seq_fil=
e.h)
>
> -use crate::{bindings, c_str, fmt, str::CStrExt as _, types::NotThreadSaf=
e, types::Opaque};
> +use crate::{bindings, fmt, str::CStrExt as _, types::NotThreadSafe, type=
s::Opaque};
>
>  /// A utility for generating the contents of a seq file.
>  #[repr(transparent)]
> @@ -36,7 +36,7 @@ pub fn call_printf(&self, args: fmt::Arguments<'_>) {
>          unsafe {
>              bindings::seq_printf(
>                  self.inner.get(),
> -                c_str!("%pA").as_char_ptr(),
> +                c"%pA".as_char_ptr(),
>                  core::ptr::from_ref(&args).cast::<crate::ffi::c_void>(),
>              );
>          }
>
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-vfs-55ca2ceca0a4
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>

@Christian could you please have a look?

Cheers.
Tamir
