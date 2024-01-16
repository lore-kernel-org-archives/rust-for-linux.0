Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B7611CBB
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yBghd1ef"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-467d87c90b7so1846350137.2
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jan 2024 00:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705395243; x=1706000043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSe0xl80WoYZGlheDO98rnbQ/0gAOx+xc6dsmMxomEU=;
        b=yBghd1efsQXy5+Qq1VflRK6uHQ+IfCY5bdDUZQJb/G3CbrxuUdiXShXrknAlIHwZ4s
         KxnYRy8kRQ6EWvY3jfKJnMaWy3267/mEHcNhb0eACONMgSQHFe0p3gZhgM8qhbHajv0u
         I3Eq+iIhLAGLSVpf3C8EjmNEjMTOz6ZaD0k7ne9R8dvlfk8j56RzRn/yNFdshNXctfRk
         uwNq9C0V9FGgy64oPr3o+G3E13ZfOkews5KoGRyATJ+fRS8ai24BuIvda87crFzcPCNw
         sNuhaxo8hwi21TrBtq5oMqxEG0/UM4aCp/CR07GK539ee8GRwFxjGw2i59Y9nr30FEEx
         cZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705395243; x=1706000043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSe0xl80WoYZGlheDO98rnbQ/0gAOx+xc6dsmMxomEU=;
        b=qM5l7NLGwH9sObeu+4RALi5b3SlmgsskcwZWTYm5HkxqRLD09jPUcWL9EQrpUM+e7g
         tDF6cjok2ynzL/a2CWLawSvD5v4+nSE+SARF8KdEdNQXKCEVFeYF9Yz96Pl6CCN0oO/P
         utZ3vP9bUaQR73hU1EurCTXGxoUmuaBXKiYBqEf9lfOJH4dYx2+1ik+LFHJxprKkMqSO
         E4r5mIB+xH3omh4Pp0oz6qjm88Up1R40rxj1maWPGI8URZDubDjAh7ZkoojYSROXd3CK
         yMeaJx4pr1cKXYCx0Q8tZUJ9yESmSvMRT1EBrMGBctz80nbGvfC0pLnurK4DO4Lthwl1
         SH1A==
X-Gm-Message-State: AOJu0Yy5Pl7qPtwjLwh2XG7OKde3wru+BvXyKYF8FeqrwWRJOo8docVn
	Sbz1aUOuULtd2uO2mnO6JWensS6erBVU5xPdnYwjBOM80JCs
X-Google-Smtp-Source: AGHT+IFZRxCErl3phJT1rHsRbILR7FJv1gjj6wTGP8huxvuC5EYS4XbkbECffNnrpBXXLolRYmQanoIgJTZTfXoonzI=
X-Received: by 2002:a05:6102:804:b0:469:63f3:17d8 with SMTP id
 g4-20020a056102080400b0046963f317d8mr1534494vsb.57.1705395243610; Tue, 16 Jan
 2024 00:54:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116022823.64058-1-antoniohickey99@gmail.com> <CANeycqpk77REoVvmdM-Lbb=rW0kyW7kNFfj_wRYto9G+qzaAmA@mail.gmail.com>
In-Reply-To: <CANeycqpk77REoVvmdM-Lbb=rW0kyW7kNFfj_wRYto9G+qzaAmA@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 16 Jan 2024 09:53:52 +0100
Message-ID: <CAH5fLgjdNbZRzHopyLP7ssrvfDK-tFFjhGv2aQe86brQWDJK+Q@mail.gmail.com>
Subject: Re: [PATCH] rust: task: add `as_raw()` to `Task`
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Antonio Hickey <antoniohickey99@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 16, 2024 at 8:29=E2=80=AFAM Wedson Almeida Filho <wedsonaf@gmai=
l.com> wrote:
>
> On Mon, 15 Jan 2024 at 23:29, Antonio Hickey <antoniohickey99@gmail.com> =
wrote:
> > +    /// Returns a raw pointer to the underlying C task struct.
> > +    pub fn as_raw(&self) -> *mut bindings::task_struct {
> > +        self.0.get()
> > +    }
> > +
>
> Note that the wrapped `bindings::task_struct` in `Task` was
> `pub(crate)`, but you're making `as_raw` fully public.
>
> We don't want  modules to use the definitions in `bindings` (only
> subsystems). So I'd suggest limiting `as_raw` to `pub(crate)`.

I don't agree that this policy should be so tight as to prevent
conversions to/from raw pointers from being public. I need some such
conversions in Rust Binder to interface with binderfs.

Alice
