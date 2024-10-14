Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911A1156C69
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 08:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894486; cv=none; b=Htd/VShpJJ+HvXQ1WpbDXKmZH/mnkWd9jlaJep52pQY75avOgwl8oPcKAkrKP6vY855SrOBl9Th3GwbHvRQo7DGcIiVMS9AEuTW3GEBfakpfsH2dhL8Ot5iuYgPFsXgIUUMuL5SxsaZj0IDUDrCni4cVO6HEk5g1G6jANfzLWTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894486; c=relaxed/simple;
	bh=4fZ/6m33GTNrbpNkrlKeyN/Jq7/li7hFF7obcIo4I7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUdju9pNaOhRY8o7EyR7kjNnlgmpmCpQcexjOqOv5DN366FjiXvJ/yEX84hZ31RI3hzOCj/3ZO47SF4m0ZuZ6OQtGeJOQJZzGblLFlxURaNhMxrvx4nf2rbjmj+meEqUWDKXfGSLHS5KdUGARzhDRg0H5+zGyrpLbCf4Uz3+2AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VzxziGyy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VzxziGyy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4311d972e3eso20795795e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 01:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728894483; x=1729499283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M24dNzd553xNHb5Y8IIcUeoG1f4DjGolZJ5waiH250E=;
        b=VzxziGyyjk7Kj6XZhJhr0Y0Ldyumoq+Re2p8sxwEG2LSXrebpiLXofwQxoqjiHp59M
         qdRaFTBHWpW/5XlcuFcnfscjUyIkcUDcJqgzu7dqvcA3m5esNmrPkI+ikp4iIGnZFnQh
         LFWciCIIF5t/bI6uFvQhL9js/UOjlMg2cZRXxD+0PI5SgsHp/xApHbVCUrN4TmS12Wvs
         XF78wT5yb4vWowI51GBMjVh+qw/gmkJKeuGj9NU1t1CAA1epxjOycnM+jMcFQFcQQESl
         zQmL0RRIGZXAWMyfclN0ENEKEphIWP1bnr5cTD+PNndSdIPoxifFYZhTXBX9dtv9SJvG
         o6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894483; x=1729499283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M24dNzd553xNHb5Y8IIcUeoG1f4DjGolZJ5waiH250E=;
        b=EK7kCpq1/O5KyGr0OIH2OZw7uSInjAJ/CO2TfH92Yar74NUJ0R5zbuUrmMaoxST6cD
         XCw2+lGg7X58GJK7peaZf2fjwwDHYM6lIdwsfj9CPOZKWlg5VmxSx7PL58NvnBHytqt4
         KsSo/5bMOko2JlbNMV1Lvnep8d9rI3C0ia/UT9UwG66666xDm5YurJWvdAUSmHN5T5BO
         ZV5FmY9vAcj2Np/nuxd7F1ipIfmc8UnT+uCibHMLn58Sy8Qx+gQe5//1lJpxBZRb0X7a
         H5Q4D4Tq/oCVaj+Y6xFVhDnDn7Eu4RaJ/5d98HW1TYEO2M7qbUq0SnP3htGlVNDaVHl2
         HLrg==
X-Forwarded-Encrypted: i=1; AJvYcCUfdrYcyAYMJKOaPZGT8KcNLHhYWGvQ0G8GiGbgGq3cC+aoUN3q1CXJYi8gPk2LDC6zxUZ2s0DKGsQIN31YCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxFy4dWwJp2vnfjbikUF5nHIeDqyX8PCmXYSYjZ37EE8xW7XVT
	hmAk0KNPHT3FXCjLVsHlKH512t1cGQoAoKnnw0MZPqvlS9VvqaQyRzacCuNZqGy8a35ToViReOQ
	71Ihf0vIsXuBv09bzAP4Q6aBbcbe6zDin+MHd
X-Google-Smtp-Source: AGHT+IFB8FFfnlqFKW+nSLnk8WRApZWwjOS9gnyongi0gtF4ICZpB2dBUY9HOCSQhExNJfIuKbhQl4ZLD9UDKKJLEjY=
X-Received: by 2002:adf:a1d7:0:b0:37d:4833:38fa with SMTP id
 ffacd0b85a97d-37d5ff2c01cmr4561294f8f.21.1728894482691; Mon, 14 Oct 2024
 01:28:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241012075312.16342-1-witcher@wiredspace.de> <20241012075312.16342-6-witcher@wiredspace.de>
In-Reply-To: <20241012075312.16342-6-witcher@wiredspace.de>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 14 Oct 2024 10:27:49 +0200
Message-ID: <CAH5fLgjU3bvDrOsvyxBcCuGOsmbuekrh0Ccy+La_MgHrMEncvQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/panic: allow verbose boolean for clarity
To: =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Jocelyn Falempe <jfalempe@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 12, 2024 at 9:53=E2=80=AFAM Thomas B=C3=B6hler <witcher@wiredsp=
ace.de> wrote:
>
> Clippy complains about a non-minimal boolean expression with
> `nonminimal_bool`:
>
>     error: this boolean expression can be simplified
>        --> drivers/gpu/drm/drm_panic_qr.rs:722:9
>         |
>     722 |         (x < 8 && y < 8) || (x < 8 && y >=3D end) || (x >=3D en=
d && y < 8)
>         |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>         |
>         =3D help: for further information visit https://rust-lang.github.=
io/rust-clippy/master/index.html#nonminimal_bool
>         =3D note: `-D clippy::nonminimal-bool` implied by `-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(clippy::nonminim=
al_bool)]`
>     help: try
>         |
>     722 |         !(x >=3D 8 || y >=3D 8 && y < end) || (x >=3D end && y =
< 8)
>         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     722 |         (y >=3D end || y < 8) && x < 8 || (x >=3D end && y < 8)
>         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> While this can be useful in a lot of cases, it isn't here because the
> line expresses clearly what the intention is. Simplifying the expression
> means losing clarity, so opt-out of this lint for the offending line.
>
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> Signed-off-by: Thomas B=C3=B6hler <witcher@wiredspace.de>
> ---
>  drivers/gpu/drm/drm_panic_qr.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_=
qr.rs
> index 58c46f366f76..226107c02679 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -719,7 +719,8 @@ fn draw_finders(&mut self) {
>
>      fn is_finder(&self, x: u8, y: u8) -> bool {
>          let end =3D self.width - 8;
> -        (x < 8 && y < 8) || (x < 8 && y >=3D end) || (x >=3D end && y < =
8)
> +        #[allow(clippy::nonminimal_bool)]
> +        return (x < 8 && y < 8) || (x < 8 && y >=3D end) || (x >=3D end =
&& y < 8);

Surely introducing a return statement causes another clippy error?

You can do this:

#[allow(clippy::nonminimal_bool)]
{
    (x < 8 && y < 8) || (x < 8 && y >=3D end) || (x >=3D end && y < 8)
}

or just put the allow on the function.

Alice
