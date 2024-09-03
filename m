Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C921A42DB
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Sep 2024 11:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725363357; cv=none; b=kvRxdXsIQ/SxQWXp+o2z9pbqnZbxpM5UC0USvJMXLeKjPW/dl/TyIVwtcLuFgEFaPATrI+E+/js+vhvZZwpVYW2GxNOwOcYcNtMtmKNtfbELSdedDC7AHwxdIbq2Rr3k3/ylCCtXki7UEgJQGYocqOpJtVRMqrdTBT8To4oybB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725363357; c=relaxed/simple;
	bh=bT4RGC2/CI90zsMbK3CXEI/uSpQdMQIiJJS3i73fW+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFz9VbDk8xwVgiQFv9QfzN+1k7QC8U2Odx1bfAYhlis3XmL4BFthMIBQZAfKFbtRXqxIJXbDo2hEyovK6lRcW6Dr+/2dThDS3BXK/7hyOYcqFxaxRLHgAmHSQQxpSD8Wp1P3biAa8zPfFmIR2eU/+y7kJdaQpc43kx8ASwo5KBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TOHqjb7E; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TOHqjb7E"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42bb72a5e0bso45885315e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Sep 2024 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725363354; x=1725968154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEfBb5av8BFTOtupO7uTtvSgIG4RHj+5V1mUmY2oDqg=;
        b=TOHqjb7EGUzXr7ryAcjsxPmAL7Tb7uKEpUJb7qJA/tgZn/URRKaUzFyDKpRkRNXEhi
         mqNsESbDFPgObUo/6ZmflEIkgdBXpMeMowOISK6iukvTNclTskdv8Ygcrs6vrbJ0XhAX
         ExuRrS0fYQXB7nxwBjXyXvA+4Z6yVDf5nz4yuYx6rrF9H4rwvjXzOcsT73nqs7pMgXQ3
         u2IKfk42qVvwdncaOoGlHRcWtTWjUIuxQ1s+qod4elBVOvWgpGIuNBwEQDWqso4XGS61
         QDmqC0a4dcpPeEWLcq9H/qAIXMynKvsQ/zGPlur/yxow2TNMtzC8FCO6oohvUZa3etaD
         +8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725363354; x=1725968154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IEfBb5av8BFTOtupO7uTtvSgIG4RHj+5V1mUmY2oDqg=;
        b=bfqfIBWmvGE8vr8L7Z0i3K8OQfk02LmuQeK7S7URQIaKgm1IUzQ9xOXoh7iGfCwquf
         6O77nGX0HqWB7HLpRzRIT3TMFIn6VFg5DZsS2xRBUEZeInUhcdtaMZR+syHd9W6yzDgI
         5S/rAls+vw6YIDBX15FLLkzvwB0Ii8z/5e5PY42a0ntoundqXWgAd9QkeLpCfhMyMPS/
         DjTBlxFScGD2WmiCGqYWOULeyCTGnD4y1AEMVyJM30ScN7hZPiDCg8svyDkJePcU5O36
         iRfh794xH/XFru/bjNs0UtQWpHWsoB6zqFIdu0HJL/o42XIee+KawE9JQqQ+30H6P+j5
         1nLg==
X-Forwarded-Encrypted: i=1; AJvYcCXbPu4YrYPmYk8EM7Y/Z+uEBB3z0m/32pjR4yVbcF/5MiK+3kO10734eacNHkmSVPqSh/oKsgEoz9luRNLLxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQnR5Z1NEo19EPzJYarE0GC+VKZDP2AHsaIl4NSvb13moCjuM9
	3WSruEMDCqUtSA1WxnK43WYtQsRf5mf+5HrFJ2wSauF2PwR5MsJPDKdnJ4bFlpk3SjxcdAGUTDX
	WEjICdQ5ro9gXP7KkF8MYpqkl5DPhPbIzVBBA
X-Google-Smtp-Source: AGHT+IF9EQsoYXne6eLFgLTZXI3J+dUe2SLFltUotHmh01fE8kD9sVslO84tO3FvbvFkH2w8hwfuP0jI+0CAeaHMDUg=
X-Received: by 2002:adf:9bde:0:b0:374:bd05:a074 with SMTP id
 ffacd0b85a97d-374bd05a0cemr5743763f8f.12.1725363353295; Tue, 03 Sep 2024
 04:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902165535.1101978-1-ojeda@kernel.org>
In-Reply-To: <20240902165535.1101978-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 3 Sep 2024 13:35:41 +0200
Message-ID: <CAH5fLghEz-6HtcpD5N8qXHZt8AK-8DUXHKXbHgs0YQ-pTJrTtg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] `RUSTC_VERSION` and re-config/re-build support on
 compiler change
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	rust-for-linux@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 6:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> This series mainly adds support for `CONFIG_RUSTC_VERSION` (which is need=
ed for
> other upcoming series) as well as support for rebuilding the kernel when =
the
> Rust compiler version text changes, plus other secondary improvements.
>
> v1: https://lore.kernel.org/rust-for-linux/20240808221138.873750-1-ojeda@=
kernel.org/
> v2:
>
>   - Dropped patch #2 "kbuild: rust: make command for `RUSTC_VERSION_TEXT`=
 closer
>     to the `CC` one" (Masahiro, Bj=C3=B6rn).
>
>     In other words, now the `RUSTC_VERSION_TEXT` command is kept as it
>     was, without `LC_ALL=3D1` nor `| head -n1`.
>
>   - Replaced `macros` crate dependency with a comment in the code that `f=
ixdep`
>     will find, since we can do it for that one, unlike `core` (Masahiro,
>     Nicolas).
>
>   - Added patch (here #5) to add a warning when the Rust compiler used to=
 build
>     the kernel differs from the one used to build an out-of-tree module, =
like
>     the C side does (Nicolas).
>
>     If the patch is not wanted, then it can be skipped without much loss,=
 since
>     anyway Rust will fail to compile in that case. However, it would be n=
ice to
>     have to prevent potentially unexpected situations and to clarify the =
errors
>     that `rustc` would emit later. See the commit message for more detail=
s.
>
>   - Rewrapped comment to stay under 80 lines (Nicolas).
>
>   - Picked up a couple tags that could more or less be reasonably taken g=
iven
>     the changes to v2. Re-runs of tests welcome!
>
> Miguel Ojeda (6):
>   kbuild: rust: add `CONFIG_RUSTC_VERSION`
>   kbuild: rust: re-run Kconfig if the version text changes
>   kbuild: rust: rebuild if the version text changes
>   kbuild: rust: replace proc macros dependency on `core.o` with the
>     version text
>   kbuild: rust: warn if the out-of-tree compiler differs from the kernel
>     one
>   docs: rust: include other expressions in conditional compilation
>     section

I re-ran the same tests as for v1.

Tested-by: Alice Ryhl <aliceryhl@google.com>
