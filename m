Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44BE2C0303
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Jul 2025 09:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965249; cv=none; b=bZGxFFRGhTyXViFDGv9o3o6MR8AL3lL2wUAqyId+my45WjgxZgHHU0ULz6uIWzM1DPXMR+2ZhGAHLYqL/x7o4ajjOLVy0CdN+uCAzGjAvn7oXvSv6M956YNcOVSsGJbSZUTGFENjKA8z5UGMLOZeFD0f+80qNQHV2qsqYDZYZ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965249; c=relaxed/simple;
	bh=oKiHS2QwaWhx4aHXHXDOqQrhGwenflpYapHEQjYl9NI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8mfPAGlcUSG6uEFyvl+XnkTSuWIIannAgT5Dd8gjvOpkw09ECQUY1v8++e/2YkxQGVc9h3zZp122+LoA82Y2zOsFNEDckyihz9aTc5dDKzoXyK34zS3MSGGjLVG2RLnyT+WPS1a5zRKGSgKiqj181j5NElUZWTbMXACJSjroqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gJ9jXdKh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gJ9jXdKh"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3081842f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Jul 2025 02:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751965246; x=1752570046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fAlswa67s9tCEEp5OLnodGYtTI7dff1nxXHYTx812U=;
        b=gJ9jXdKh5WG6e7d5KcZPLktAYs0ucRt1vPhfHTCOk/uSoxBXN0id2poSTvaT5cct+W
         baN7kdxTYAt7GZDTtCqy+P4buTVHC0hjnC/85FS38Kh9fYKX4FMuRfe/12FZ8S575Sty
         wp8iKmy/TthEN+csuMw25vTggEVqqN47eNk0pCgnE1FBO+9UGtU0SzAjpHYDef469CMY
         wRVk/KzOf2PtytfnWPeBkL68Q4Y3vcuYO0RsBXgoF6aFEtspmOppF7KnS0dSQEYri0yw
         3mlER1EzULUyGxNm2y+QUfoN4Dt1I/UJpW9uhrto3kRts44pUmsIf5zm0HZ3hBtnooZ1
         3/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751965246; x=1752570046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fAlswa67s9tCEEp5OLnodGYtTI7dff1nxXHYTx812U=;
        b=jaLz3xXWtTSSFFajAJIDhoVxGsXu2THHcyBIxOzwS+EDDPo8GX1o/7KS66WUl8/8MT
         Ov+/ZXt4ZDJqlohkb6RuUzQ3UUqmIU2smnRc6GSpjchDBfP81O/+G/Za8k0DrkWPQy5d
         TqIxMkxkfRcuwXlkMZC3tnrS1XAAYVp7ubqQlY7zoRfxiz6REVnlcdoa0r3Pzqj+QGt1
         ncyUljrhFMXmqxcYDqPb32f9HKEXo0ca/msmYcVUhGJ2AODXBJ2aD3vVnE8g8uqNCz7X
         nMDIosXvWMeEkTBeBtWkC3s/wgtyxvdBL5nFW0T62u01ycLtWwjcXoWItLtGHtcgy99e
         CnSg==
X-Forwarded-Encrypted: i=1; AJvYcCXNgWaWMtA9FEjlg9oYYDzMikHAdxQRpelRu6hlnhh34yk1oeUpLIxNvyXkujJm7C9xPLK2AxjYalKJWrr23A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Slhfhp1l54EVUCSZr+Ni8VGmaawh/D95Gsomi3TXLRYqGnNs
	ngPdLJIXFF5qDKXVG+gUJuC+rfk+kL7QRvmoXqOuhys/0sDh0r+akGVwpvhAiuwgx3X83JZn71g
	Aw/m2fGXcKy/3OZUTS3RcXjL9j8E0ozDXmggT7V3/
X-Gm-Gg: ASbGncv4OekMwE39DFimdXg/y3SO6hVjfjJTGjncoZNtI+8DPr15AQ+DQWqH3yen+4B
	BeU6fQ2OsUJFU93ikCu5BYbvM3bGK+rY/khZYiJY7tuEU6khy/gB+7KnY75WipjqQ3AZXLMXYMV
	8mawSZZMfMk+3kHy6IjNPRYhsl3UrzC7q43BqT3g3TA0wSGJfBb/kjGPoI8zoSryddCSUU0A0t
X-Google-Smtp-Source: AGHT+IH5ZMoI2SoH4Y+a/fAF+bc85q9nK8PHUbdQ9aUoJUXw0mepkCi34+aNRnk2VfCKiIbsEaGEwLKTb04V6G/hB4I=
X-Received: by 2002:adf:e185:0:b0:3a6:e1bb:a083 with SMTP id
 ffacd0b85a97d-3b49701ca8dmr12897112f8f.25.1751965242575; Tue, 08 Jul 2025
 02:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
 <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org> <miAy8nyEfpbNOEEKc8GGbUJCVpgjOlfffFKuSdwzwiFTR_Q-U3oUWKShLk_Qed5HHKwUEK-f_UA6nJbhrubQdw==@protonmail.internalid>
 <CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com> <87cyaboypx.fsf@kernel.org>
In-Reply-To: <87cyaboypx.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Jul 2025 11:00:30 +0200
X-Gm-Features: Ac12FXyPWMUr7E_ukuI-GyjKR418XEws8Yf2arU_DB6yQ4eyibRsSxTLgENy7jE
Message-ID: <CAH5fLgj6mfkvnOCO=EQSz9pyN5OFRF3z3yGfyZHkLzqxjsPJ7A@mail.gmail.com>
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 10:48=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Mon, Jul 7, 2025 at 3:32=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Introduce the `SetOnce` type, a container that can only be written onc=
e.
> >> The container uses an internal atomic to synchronize writes to the int=
ernal
> >> value.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > LGTM:
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> >> +impl<T> Drop for SetOnce<T> {
> >> +    fn drop(&mut self) {
> >> +        if self.init.load(Acquire) =3D=3D 2 {
> >> +            // SAFETY: By the type invariants of `Self`, `self.init =
=3D=3D 2` means that `self.value`
> >> +            // contains a valid value. We have exclusive access, as w=
e hold a `mut` reference to
> >> +            // `self`.
> >> +            unsafe { drop_in_place(self.value.get()) };
> >
> > This load does not need to be Acquire. It can be a Relaxed load or
> > even an unsynchronized one since the access is exclusive.
>
> Right, that is actually very cool. My rationale was that if a reference
> has been shared to another thread of execution, we would need to
> synchronize here to see a possible initialization from that other
> thread. But I guess it is impossible to end the lifetime of a reference
> without doing a synchronization somewhere else.

Yup, a mutable reference generally implies synchronization.

Alice
