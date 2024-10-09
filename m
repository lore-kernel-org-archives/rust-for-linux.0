Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CF117BB06
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Oct 2024 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728459446; cv=none; b=W+XdAJMVmL+d8emDuhd/Lj0Y6zL1rrKfM3HJ0tOblg50165/F9F5AvHvd1Xg2AD3g5feOQqLdknSp+mA40uaxc36sl2pB7jcwDwR7p8h5A4076cG3yaHt/PYIf7qMc1Wz8n0dV1NlHQEeq0FuL/clVQf3Ss7AFEFlc4ZyksvRVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728459446; c=relaxed/simple;
	bh=NRciqDxbOeYLYlKgWsmjwEJ3hvErOI/IWFjMOF/tnBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPSP8PLdKUWOC12ukgoQUsFjl863DQMXCcFFvrUOhxUBLqk1HXW/bROXRJmluO+j7ZhOzoX5Wezk5jtYtLbfBGlkCJs0XlWyQOyJtgpGCBEWPpgsvBRWF+q7DQeGRIUjhNJjuMZT8h9Lmu9euoa8UYiaTvJ9bNAwEooyDGYfB8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NjHRUw2t; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NjHRUw2t"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5398e7dda5fso6557486e87.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Oct 2024 00:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728459442; x=1729064242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XIMu8BtcEAG9k4wP7FAmgstPZbfLFYFnmsGtAA4kmI=;
        b=NjHRUw2tUGLhIAT2s4+48pKidw3Exj1l0KJGlHl1kgEyXl48qYb6q2+a6iR3fmCQnD
         xHUEWjmemvM+KkczuBAvigFbzhv5kR11qeMF+nsw6JnRftbDgWciahF4BApE/cHZvYiq
         6jl8G4Js8LaKOiM22Od4L2c+WnNvi/A0ncPr69yaYUa0FRoopdF+zf00X5/iyZuGOcag
         CVeXNMZyGeppTK8AVGUNt35uR+mmsdzYdPObqiVKvpqp1vNfBjaKLpzDMKZsiJWLkKo4
         7sXAzmjts1Dhln39Lw80zDxjnyYh1Uls4FF6XUZDZwRzsgeJCiz+bzipXqN+KET69ID4
         jzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728459442; x=1729064242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XIMu8BtcEAG9k4wP7FAmgstPZbfLFYFnmsGtAA4kmI=;
        b=AYDtgNXG7hGtPQId0wWKIYSAHFBK6DJLuPdA8TihfkTxReP+Aw4NYcvsqL0h0sZWY7
         oRw+R8YTBjbkZC9HGTBCbkgiQZ2Sx3dmMiKFas1ZAD862FSKtQN7inr8FUktn9vd6BSi
         pIoKoNKKrCTeX6B+1sXRVh6N772suFOvp2kAbHZtIywXNvcm9QAydZGjxr/rnvp5R1XJ
         NzH6uVw39VEDmYRY7jXT0rl/7eT2Lr8y/tQNmbdKiRXAwZ7AdkGRonj+PUxdd/10copF
         dmk8fxGmLDONYmdFoYYzYuL95wRhBvFkZxnYmc0uaLXaa4mTudHoRM2lPu0yFH+EE6gY
         MiRw==
X-Gm-Message-State: AOJu0Yzy+ubwDmuTyzd8E1dtKyNUGOwcYMHJVXm86DrCmiTavq5QReKy
	SutJvUjsIq9nHIkUItkEhdZnl5VQuGb6/aov2gYWVhLfTi29+sJ35YbKrgSOOUdduEdFGck5Gh3
	CIfIKClTunQSlwqLNgq4WKzkW42kjwKRkY2Z7
X-Google-Smtp-Source: AGHT+IF7AnezuX19GLgnBAVICGfaiqOh8j/T6OcVfA7CP8tJAOZTyYr1JcFc9km7DM4IrlH5UyFW7WayJLDzPjXaqVI=
X-Received: by 2002:a05:6512:b89:b0:539:a2e0:4e83 with SMTP id
 2adb3069b0e04-539c496f602mr774669e87.52.1728459442343; Wed, 09 Oct 2024
 00:37:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009014810.23279-1-christiansantoslima21@gmail.com>
In-Reply-To: <20241009014810.23279-1-christiansantoslima21@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Oct 2024 09:37:09 +0200
Message-ID: <CAH5fLgjJTjxo5oMeagUhV-tJoNZnWu3QWXhT4X3SYe42FpUgWA@mail.gmail.com>
Subject: Re: [PATCH] rust: transmute: Add implementation for FromBytes trait
To: Christian dos Santos de Lima <christiansantoslima21@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 3:48=E2=80=AFAM Christian dos Santos de Lima
<christiansantoslima21@gmail.com> wrote:
>
> Add implementation and documentation for FromBytes trait.
>
> Add new feature block in order to allow using ToBytes
> and bound to from_bytes_mut function.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1119
> Signed-off-by: Christian dos Santos de Lima <christiansantoslima21@gmail.=
com>
> ---
>  rust/kernel/lib.rs       |   2 +
>  rust/kernel/transmute.rs | 302 +++++++++++++++++++++++++++++++++++++--
>  2 files changed, 290 insertions(+), 14 deletions(-)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index dc37aef6a008..5215f5744e12 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -18,6 +18,8 @@
>  #![feature(lint_reasons)]
>  #![feature(new_uninit)]
>  #![feature(unsize)]
> +#![feature(portable_simd)]
> +#![feature(trivial_bounds)]

New unstable features must come with a good justification. Why are you
adding these? Why can't we avoid adding them? This information needs
to be in the commit message.

Alice
