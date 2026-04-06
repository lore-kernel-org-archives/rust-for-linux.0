Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D6F1A5BAE
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481690; cv=pass; b=KYlIQeDgwJNPtZGUuXnAVzKY/qzxz/JWYM+aB4UUEOS80MY8IESVRX98u4B+5zNb+znroiU0Wh98g5Z5UH5fQFkbN2QHV7rgjfMcwcs79OThn2w0MComppC6OKlRW5eZV5co/7Jx/cdmdFA5TFHkFzNXXA7U2fdvy8+AxVKqcE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481690; c=relaxed/simple;
	bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Od3Sl8y+EfuNZoKTasErAdkBA/FOiV3IxSZoya0HTYw0UtPDhFDnDOJ/KMSK5JO+qpeDC4G0zbRwLySXQIMPO4HNAJwUT1tkms9skAd8MNOZrbclNPVueDTd60sVUEm0ZefSgaGN8IM/gP55sNB/RUKKgjDdgbkngFkawaXWY0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3tAGxOy; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3tAGxOy"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-127337e3870so199849c88.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Apr 2026 06:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481689; cv=none;
        d=google.com; s=arc-20240605;
        b=SvX9POV+Vc5XP6/uCYX0EmUPtgUHs6QBjWYwxulYXMAulvwRZ0pw2Cy2XnCahrdYdc
         uGE41uhR4RJmAGFqStaD82mlVvZ0lQ1T64fCVGtRyPA+se7zSxt6vLudIP+uzk/Mo1Ui
         8Ab+SP+TAnV/D0amu930a4e56W5lqLTu2wwRiZAhKXVl1qfMOyE+qsC9U0kxYVI6xt+d
         7SLuuIvNEheecLVAKRv8JSdnn9A2i34m25+ZoXlHq4c7kcuCpKyTIfoPFP7DLcL9W3kO
         rNLgHF2jiHMrn0+YpL2wKZhJTEPxbz3TcNAjnMBQyJJ+/e8z8eddVWdvAqCIZF+jvTf8
         RcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        fh=4UujChn30pFa+h2sXw24S88hBIRIfXVdBgZZpby9c6A=;
        b=KV+4s5HRdfFlkT5ib6YByEUC4Pme48qSh4+bYY0mK+at4lnEeFrhcmFVE47GRYtNeN
         2Ap8bW8h/dVPnrWhjVk9uxh2j4/E+NSVcEn84rEeTCGFUgM654uZsfx57pTwN4Bm0r1t
         gD0XCRxyh/KWgmw/GTfwIrNP2aK6kXB9Ydsp2g+HfnMr8y/9ak+AlbiclVrSR6ydOP+G
         HuQZ3pOiShR1IWmgfdyHEC+5OyiQa1suX34DROK/jT2bL+T5GSo5OB8zjnd0CfXZb5Gr
         pVT7oUp799Jla4JDSjORxKjYVvYTiVe2gQpeE4wBXSX8CQjdchePqRt8hro/2m+FgLjy
         InXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775481689; x=1776086489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=q3tAGxOyAaMZ92oiBATu8FQ/6qRm0r9euxaNK8TPoIYKXv+sip60zW3/mf/067CojG
         I91sgXn7EWKEojoel0sfV0c2x47kc1MhplILMewUkwkZaBCCr0pwNk93ApwnYy0wO6yk
         wzk4NsK4gNw4WQ5HLxHU+akS5jt/VzZUPL7mw5Z8fzT8N/hLAXQzM5TXL+PsqtJbutvi
         8uYoJs3WHDvwOVOtXEYQeWWHvCxe1gwgZnfpVYwrKTEHNlI01LkDdq0Wvn9M2UetAjbD
         lUoBO1OKkgxrsLb7uoE6JiAt9LFTPTHQt2L5Jm/D7L6biFMlveXZMrm6ibprSlWxXpbe
         +9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481689; x=1776086489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=DVQXo88xr+AcH6o5cq/xA4Z8QD07obc3URuLEoJZDkwUYA2HSzFteSgJSnnWJWTUj3
         yrsVbhNr51hKJ8GIhWmAaIJqxdqvZv0wLtR3N6r+O0HIbD5TCrRgmPbCpM7Uw33JT3B1
         EW5Mfjs1Je5+hKla2VRyf/t2P6CyyNscZg99Z5/+NaywbUcFV9Yup/6p7aiepohFVDDV
         Ovb9Ed2r1xxRyK8VYHs7JndhBsSRK7EDHrtVaNGd1fyGxsgmuTLUnE8D5ZiifTatiRnj
         pblQjDgYIm5KjFXXJQVhKW5qw4b07qvRTUIMhgkEk4Zumo26kDciTxQQQ3vTBnqEfCTx
         LdeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4FLraGdt3bQeD+3lBqReblgAqU/XNbPcBtUd248FjJTvbbA44G62YmmrOsWJgbVSuTBwhpK3+SkKmaeVPyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+PUZQgRRKjXObhwHBMX289y/tJnRBK4pVw3BCFjCH9xVtFGYm
	erDwJhPQUpEFd2vQAu6z4+3SMzA21F0EAee3a9n9W8Bf6tHC/kDKiWXnFe/5HcjPVMLO5/+4SZI
	NJZo35dXMaS/pEEYcPUF+OnK9+mediws=
X-Gm-Gg: AeBDiesuWokvjUKffEcH6dIIUh3UDjnQ5iB4pMhOKTMw4Ak2DI2K4s3Efu1DP9JUJxO
	S8IHfi/QTX1NnGRw/VQa2p37NbEaF5Q3zuFM2Aju1/04IO5xoffsSCgiepUVg47oenKrgRj5ua0
	AyYoTgky4fh0v9kJbeiubxVupX9DnwfCs1qfRysJm7IVnjN3sLyoOF0pD5fZloM1Sri6/f1dgQN
	u1mfbWC+6whWWza3BjdAs/d10JXEueinBBhdgBfyGinITaiR43bQR5tI/1CfrhrY51M9jxAUJrQ
	YRojOS8KWO3frDdNslXHbRN82HuEX1JgA/OCl9AlTmEEusQuslfxws1KS65Tj1gZH9k+PbVm265
	YvGU5muXdEumJOiHmF+0wC4g=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr2965052eec.3.1775481688630; Mon, 06 Apr 2026
 06:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-34-ojeda@kernel.org>
 <177508434476.73816.11744805605122440072.b4-review@b4>
In-Reply-To: <177508434476.73816.11744805605122440072.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 15:21:15 +0200
X-Gm-Features: AQROBzA0LUfPYuEZWH9uKj1KexaW3DTNKfQ_If4tWD7xnq1YUXDcYUMRbV47V4E
Message-ID: <CANiq72=25GRao7NciojymdbZN_=f-U3hp2+2qBMjb4VCaOgR2w@mail.gmail.com>
Subject: Re: [PATCH 33/33] rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:02=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Might be good to retain some of this in a code comment.

Bah, I missed this note among the rest, sorry (I didn't reply to the
ones where the commit went away due to the changes in v2) -- I agree
it wouldn't hurt to remember why it is there, even if it is already in
the Git log.

I will probably add it for tomorrow, especially if I have to rebase.

Thanks!

Cheers,
Miguel
