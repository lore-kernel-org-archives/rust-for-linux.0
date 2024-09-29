Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F362C1A2
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Sep 2024 04:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727584435; cv=none; b=lfCwQrUSpqFQw27WVIaMsGehlfYn5XZx7C5X0BfLo4s2SbLuzpH658If+hTBJzsVGKwxeSjuuQlFp3G2bOrC9bFfgt4QRV+cSATE6obVQI6ZyVWgnbdDe50Nf5ju9Bti8C8IZnhdTqDoiWXjip07FfnYXdY3YM3xb1GM1YVLlN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727584435; c=relaxed/simple;
	bh=ACdDOapy307eX83VoYT35p6yFmufcMowrIriJWNRkuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQGSQitnuDjlTcZ4Esd38IPpWhhckkRNEjuGAtXLv6vya8GcabsgoDs19VWNt1uV/m2kXU5acaPHafw2+NfYGrlmscqfZYvmIsBOdJZp62SDPYeSFHavvSs9RfxyQ4VyJFQV4tIzNHudP28CT9N3/4zNbocbfWy4f6CLnQ42Y5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=E0cyAM3N; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="E0cyAM3N"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6dbc5db8a31so25568537b3.1
        for <rust-for-linux@vger.kernel.org>; Sat, 28 Sep 2024 21:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1727584416; x=1728189216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crMih/hO2yN7TpUZlSd9hsKUsXMFO0eCIYsluTrMHvg=;
        b=E0cyAM3NXXktHCSD1nR+BTwNwE0AvjqnlK7+FsrorYhlGwusZVz6+ixxGAfy88mxxL
         kwttfTL8YwD0gbUZzAq5xiLRPqRO3+nIcPYTUxRhk+cwQzpsXn6K9rSP1J5mIer4wu9w
         kQsLNYJyKnWtlPArE4mgEvW4s6OL/T59egbaKedCj5btPudITQmMuBrJE+rOae9s8uJX
         6Qxxn7ykjRQvONmQD/vcslnujIxjF75IdQScNW51vSdXTqkJZlc+toB0O/+KkHT7XIGp
         DAgTYp5zqN0WB4HgIexCNHaI4n8MC+JBafyV5RmhynMFcAZqyp3oQ4HqWgy2U3aBHqP8
         RulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727584416; x=1728189216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crMih/hO2yN7TpUZlSd9hsKUsXMFO0eCIYsluTrMHvg=;
        b=R4x4iI3KT0SEZ7IxxSNEi16afHk8Y951NYWNFlmjuijQ6lc1NKDMZ+dMJdGH8zq8Ka
         8K5zvQ7w/C+N/etp5jn38w+KJpat8WbVRfS+Ji9+lHWd62oH4Xy1Fgr6hAThK9M1/+uQ
         Su2WWxaaZpFGMQ1VYKzACwyPdyHnJOaA8exLk93vx9cZyaYn2u5opDTaN/eQ+JJGQpJA
         tw9mEpCzqvnRxgPgKCKW9OWlscb/dJkyGz42Vbc6CYunKD6HU9oyb54PxYgeiJuB85ak
         QYZeKMwV3tS+W4eH6M7UqRFmbkQSHsWS1oLHHd96D+VN2fIsCSCbGr7ZTD7xaapViP3n
         tMjg==
X-Forwarded-Encrypted: i=1; AJvYcCWytQLuveuW4hOdQ+SAxDDYFx4V1ePftaStLuYVhR7B3ll1Kj0ZyXiR/7C7u0TO9lCBoo8p4YO7fl9Lh9Og+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhknDrJzjU4i4jMFEK0KmNd4XVzG956j66964XKRSKCTpbG0IS
	AuQC9WL43AyW99+Isdz45rRJ0uPKX/ygKpa60Jv7zQj0MqLOFfABE1LMVmpfsg/Ez18oAExWOIC
	a1SXAgdXwsU5pYfqFJ99FF0LECOzGKc5WPrtRvQ==
X-Google-Smtp-Source: AGHT+IFTzOwIWznLgsvN4UDZ43A97KAtmUIMJ7FDriGjQqSZbDChpH70YRjNmpxoRB1v+fFdhx7P3G/OtX/gEQL2QBw=
X-Received: by 2002:a05:690c:c07:b0:6d6:afe9:d818 with SMTP id
 00721157ae682-6e22eda1e00mr78513967b3.6.1727584416245; Sat, 28 Sep 2024
 21:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240904204347.168520-1-ojeda@kernel.org> <20240904204347.168520-5-ojeda@kernel.org>
In-Reply-To: <20240904204347.168520-5-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 29 Sep 2024 00:33:25 -0400
Message-ID: <CALNs47udN4_Gr2KHDapwWAmY=ixoJN+-9apAShVT7qFcKdK23Q@mail.gmail.com>
Subject: Re: [PATCH 04/19] rust: enable `clippy::undocumented_unsafe_blocks` lint
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 4:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Checking that we are not missing any `// SAFETY` comments in our `unsafe`
> blocks is something we have wanted to do for a long time, as well as
> cleaning up the remaining cases that were not documented [1].
>
> Back when Rust for Linux started, this was something that could have
> been done via a script, like Rust's `tidy`. Soon after, in Rust 1.58.0,
> Clippy implemented the `undocumented_unsafe_blocks` lint [2].
>
> Even though the lint has a few false positives, e.g. in some cases where
> attributes appear between the comment and the `unsafe` block [3], there
> are workarounds and the lint seems quite usable already.
>
> Thus enable the lint now.
>
> We still have a few cases to clean up, so just allow those for the moment
> by writing a `TODO` comment -- some of those may be good candidates for
> new contributors.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/351 [1]
> Link: https://rust-lang.github.io/rust-clippy/master/#/undocumented_unsaf=
e_blocks [2]
> Link: https://github.com/rust-lang/rust-clippy/issues/13189 [3]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

> @@ -277,6 +279,8 @@ pub(crate) fn from_err_ptr<T>(ptr: *mut T) -> Result<=
*mut T> {
>      if unsafe { bindings::IS_ERR(const_ptr) } {
>          // SAFETY: The FFI function does not deref the pointer.
>          let err =3D unsafe { bindings::PTR_ERR(const_ptr) };
> +
> +        #[allow(clippy::unnecessary_cast)]
>          // CAST: If `IS_ERR()` returns `true`,
>          // then `PTR_ERR()` is guaranteed to return a
>          // negative value greater-or-equal to `-bindings::MAX_ERRNO`,
> @@ -286,7 +290,6 @@ pub(crate) fn from_err_ptr<T>(ptr: *mut T) -> Result<=
*mut T> {
>          //
>          // SAFETY: `IS_ERR()` ensures `err` is a
>          // negative value greater-or-equal to `-bindings::MAX_ERRNO`.
> -        #[allow(clippy::unnecessary_cast)]
>          return Err(unsafe { Error::from_errno_unchecked(err as core::ffi=
::c_int) });
>      }

There are a couple places where the attributes move like this - did
this come from an older clippy version? clippy used to warn about this
but accepts it by default since [1]. (Still works of course, I just
think it looks nicer to have the attributes next to their statements).

Either way:

Reviewed-by: Trevor Gross <tmgross@umich.edu>

[1]: https://github.com/rust-lang/rust-clippy/pull/11170
