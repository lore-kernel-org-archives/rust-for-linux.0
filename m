Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8897915B971
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Feb 2026 00:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771028415; cv=pass; b=JDLyCPnSNlMre7qHykJZ//vg5rIzT/uCSHVaJAJivzn35Ywa5NpS8ilQr7xvNTybKmHo6zD4jukeptdFyO5YEY3umXKVI0rwlx4w6qLz75Joj9Eu2MJI7LXypSqeDr1xnoU3DSY1+yoDafYsgxXJpVbIVUKDd576DFI1D6Wxlsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771028415; c=relaxed/simple;
	bh=8FEFz/m0WnUYbPlHlZIic2DUEE8dhI8xUoGnl35edh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SyEvhJn0o9cFm+RFY7gApDg06tzZA5mrWtSECmY5V6blcP6WoovP72KKT3BJw3QcH1u3mMExlAmo8yvpYjKg4zMw68iByeNXSNkj0HE7MDS95tBeDR9gCtITMtoPc8CLuZPEEZSV/7Rk592e1MGohQtG3yyFb9VP/Ls9oam+Dec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c3gx3EjB; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c3gx3EjB"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4359a316d89so1159161f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 16:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771028412; cv=none;
        d=google.com; s=arc-20240605;
        b=gVE/tcpOeh1E7bSybkLJ++9l5axmHpkk/qFaun3gH+x0CfI0wvLcyiUFqi/QhSGYG6
         p4WxUhnD3clWbPbEpyNlrLm/esqHH40+VDCS7qcwL4IaM7t6J4kruVEcGxnud2D+1mli
         cOijPtJrD5uT+BnR827Cvv9Wa4r2lslwYpTtt/wRc3osni+j8jNQPuAf9j4ifTQyw2OW
         t6ita2PNHT3oc4XqY2C0yFVdZ/gFa071f1JVwM8v6e2yRhnntsVLEofBc3+DhnqFruJV
         M+ZapW2yxpz+l+druH8X7g2Q3sWskMbddQqigKZa4IdBfmebp7q4/5ta4c0lne07HcE3
         Y3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8FEFz/m0WnUYbPlHlZIic2DUEE8dhI8xUoGnl35edh4=;
        fh=rlJuiBFjjdR91L3iJfe3aZHdsry+A1PfsWN0lJKVp+8=;
        b=aIdbDHanrIVbOgF72K+eJ4K9wEqXh7TXK6hXQiLAlyRS4zwPoHmCJr/elnH7yZLaJJ
         MgX9ZDlm3/Af4lFO3sh3CLlSFkETYc5osEFj2gA6HUBSkxooEIEfsSx1YdTTL257CMed
         d/zZL+scwEWQfu84T120a2zkXaBNAtgetSmMKk8xeG7Xz/zaGTKkDTuZcZnSIc9HMcoV
         guHViupQ7wFD5ZtfLIOksNyp2krNAIZMvUVNw70S5jQHEh53IenmfZtS/X+WnufafZpE
         702BY7SzqGxCVQzHKh3/iyslAqpXR9MYDHVTj3n0zaZjDCif+Bvqkp1O/asqxa9TDCn3
         9XGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771028412; x=1771633212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FEFz/m0WnUYbPlHlZIic2DUEE8dhI8xUoGnl35edh4=;
        b=c3gx3EjBe4YquK9/X/Z9s+1rMXOoOKpFiJpfhuHzoOGRV5I9bNj/QlURNxTcBysEGD
         Ui0i+z9TGFZfsl0v4rh2vrJ7A8r/9YcjoSgVZ54e7Tp4LnNp6Z10doVJXQCJtjegvObI
         7H1GTjGTL7F1uhWrknNavKQkhMD8jalNGKLMujg+g6IT9rG2hfu498o1cu3A+nYw5AmM
         GfSGKenMmZ2mrF73i7jPBNHrGvd9duT9JBAfOPmxtpHlwfy7pRbUxwUDGy6qpCIfP55J
         /FUrZxjCraJTe2fOadN4YRk4wgVczs2qEP8S/d+OZtUTiPm37z5vM2ZK/yrKDFgiCcoj
         Ontw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771028412; x=1771633212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8FEFz/m0WnUYbPlHlZIic2DUEE8dhI8xUoGnl35edh4=;
        b=An1nSmUi/YiwaxqEJwBPxqTUOxOqrf0gfthNAKEAlKm0xeFGOKvkgJEtfTihRrWW6a
         TYyf7dAxAme6vLF8bIwU3l3a+GcjW2so9BhuYJV7sc5RNQws8sbTVlEyc5VjXUkG3oA2
         2ZOTbKrZMRIUMo6AoT236r6KzO/5Euead+pSm7H5LJznoTeZCNQH++9MqwCavh0PvCyD
         2k9d25PRmWXePBpt44ZGgIANjUfidXJubotI5UsoJb/tF5/vWzCq6H0LWeDJjtd0/jAQ
         3h05UNmRrMF91BWXu4IvbRLNPyfmF0f6F00j/PNJ7Nc8MEDET9e47sNOuKEpXtFnjpOV
         6ROQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsDom8lQpux+JucgIKVug+/D1Ghrxxur8UqroA/TJGro683AZvNJOKbMq+8zSRkItox8UmetV6avXrdSwzKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLNh9Pyp5UvrLdymhAKZmHxFopJNJodnZJp/JkEwGatWOvNmYD
	PcE5BxmTU6yhTbjIQ1qPgmEgC3sCNYWTVt5+EoYN2Pk4ca4bUos6fvfSA5q8jpEdJPihvcq3WXY
	dxFKUjKxGimOVPA0KvIx3x2nJ0w1jHz0qwuS9X8Nw
X-Gm-Gg: AZuq6aLAA9jnf7lSq/s28Ok8IJmJoGBvpqVo+SuPqxvhl58IDXqZO9pKhZbgZPolUXL
	fsQyGjFytm6xkOpMwwrJTZcryeIYxAO3dFUxqt1FJy0vtmHw8WYKnj8YC8D3SfzdukZ3rdI0/gP
	Cjd7ZuYxfjvfbHPyt2Cn3OEGSzxOgkamZU5zw99KKx7yJt8Uklc/fChd0kDbuyMQbofl1Xpus+G
	BcniO8at29iB0lgpZIq0AWO/qzRUTihLUK5EQVKJHqpx7hAM2EFahu3E9LkQBNAVpzXru5fwqEI
	6AJ7OV0FnzxE3vR2g1r4fpjtnI135DLKi35a9w==
X-Received: by 2002:a05:6000:2303:b0:437:6bda:d97e with SMTP id
 ffacd0b85a97d-4379791c117mr6291279f8f.39.1771028412188; Fri, 13 Feb 2026
 16:20:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213-rust-binder-ps-v1-1-6b90f83c0b4d@google.com> <fed9bf3d5d9681e1003536be6cd99088@garyguo.net>
In-Reply-To: <fed9bf3d5d9681e1003536be6cd99088@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 14 Feb 2026 01:20:00 +0100
X-Gm-Features: AaiRm53hJmmwerWZ9r0FCNXei4zFGE1D0MF8UTqq8R50HrtPNrtidkYY6jPLcx0
Message-ID: <CAH5fLgh7BsgJFAdayERCqP7D3688XQpj9DcfJrZci0kamPUNWA@mail.gmail.com>
Subject: Re: [PATCH] rust_binder: avoid name mangling for get_work[_local]
To: gary@garyguo.net
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 14, 2026 at 12:52=E2=80=AFAM <gary@garyguo.net> wrote:
>
> (Sorry Alice, resending as I didn't hit "Reply All". I was travelling
> and not on my usual email setup).
>
> On 2026-02-13 11:37, Alice Ryhl wrote:
> > Currently ps -A shows processes waiting on schedule() in functions with
> > names such as do_epoll_wait, wait_woken, and the impeccably named
> > _RNvMs2_NtCs8QPsHWIn21X_16rust_binder_main6threadNtB5_6Thread8get_work.
> >
> > To improve how ps output looks, give explicit non-mangled names to the
> > functions where Rust Binder calls schedule(), since these are the most
> > likely places to show up on ps output.
> >
> > The name of rust_binder_waitlcl is truncated instead of using _local
> > suffix because rust_binder_wait_local is sufficiently long that ps
> > shows
> > unaligned output.
> >
> > Suggested-by: Matthew Maurer <mmaurer@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> I don't think this the direction that we should head for. It's not
> feasible to
> do this for all users that can possibly call `schedule()`. In edition
> 2024
> forwards, `export_name` is also an unsafe attribute and it will become
> tedious to
> justify all usages.
>
> I think if the function names are demangled, it won't be too bad?

This is mostly meant as a temporary fix. Ideally ps can demangle them.

(Though even demangled, they are still too long for ps -A output as it
is right now.)

Alice
