Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF9286AF
	for <rust-for-linux@vger.kernel.org>; Sat, 10 Feb 2024 07:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707551548; cv=none; b=VDRPv2JDlM+G9lJsSDAjo0PvwWif1MNN9JaHHJmsNG9aridoDhaPadVXGaFpGvjVPkkva5kUDsEKAFILpvKfLwOFVJtwEOrgf+OepxfEdpZZK2c/HbR+VkknOA7AwFjbAH6+G8UhjB5ghkzy5NjooVO+Gia70Jk/vmNY6QMimuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707551548; c=relaxed/simple;
	bh=gZo8nudx91n7QmkKsXW07rSEvmw1YmQIFCRQ9PVoTH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qa7oIBUFDObSNQbwiRY/V1nvqpogerLjUiOLubIE4pmXumG3HNCbLUEGDg0m33vuL6HX+4IR0CXmO8tEdyOmz/Pyc/+epYBCiTASevkyOLooFL7kndBfR3556NZpNIqS1fC0lHyvwtZ/tI7MCatGVwsDHwmesA4MxPRuxBvJqnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=p4Hz46jY; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="p4Hz46jY"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc74435c428so1667432276.2
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 23:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707551546; x=1708156346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g4QBN1/rGV7VTiFr0/5TgIubmQLI1xDKrfOY+r3ugk=;
        b=p4Hz46jYpc+qRjV8GuJEwQaP4mM/nrHF0nqpHQAa4LELGQa9otfR+sukLDTAkeU0n5
         aDHF4dZxbCh1GcYaW76hyT+S2OLWO2bYkKrFL6QKQMg8z16uBbmxlcStO/25b8sAn3sI
         8DGybrgoPJslvavZbaNOJ3UnxDb5GO3XfurPTZBbHRjH0UDjfs/Zeub34NyX09bYHfx3
         EJLVH2Po0vOBxf7771d71MLR97JST5rhWB7M6gE7CgTpr/N5UiZOu3Xr517spBbyIZcL
         aZ27AfmdPhudqB0glav8lp5pjiMgKR34ZnRK3VvGhtQUxSNagjJVzpyBD7AZvsE8IhgE
         L3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707551546; x=1708156346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g4QBN1/rGV7VTiFr0/5TgIubmQLI1xDKrfOY+r3ugk=;
        b=UMehODrAY3JWEIVr8cT3HwXTxQvarTTebv5Nc4gI6AlUYia4D7Cz5sll/P/tmNKYOG
         C3i/bXgvM583AWTvyCWskNIX2kLUR7LFhwV09AmbQ5nPOhCLlAip0jLPsiM8mEtWMcJT
         Ra73/N8mH5PHExV+au0qAcHL0jnpU1eoDs1mxf6RCB6dCGIlLdJCKB/lNDvf58JPrbsH
         WH5SdsBOx0uQIqxfd2zErh/AHidOt9FUhmkmTP21BgyUZJItQitFP23axTfXN0mY3Tbv
         9tFrtydWZNQR0G2/oGsMPS3hzhLTL4RzIJfp12Xf9cvPmsA6qMidvrZs2Nqs3ixI+EUv
         JIkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQTlOls/QgZOvMdZEB2db/LGCv/5cBb9h08RIr8pTtbAFp5PFefERJxrIE2UZBWC7ITU0yeJqkrmrvssL6Z004XBgF2/BxqV57otGfvww=
X-Gm-Message-State: AOJu0Yw3P7/o2UxCYfHqDNQTuhLnMRIO/oACeqBhDxvI1qvHH4G0K4TI
	qqqkOnZnkE6uzu/CsryGOhr49ojxHczA3d5q+0K6qlDwfMqUngmU7MltoblLjJL10wY8RwdFq6R
	A0QfenZ43WtP6nAbupzo/CFjWOOksHOn97zqjXg==
X-Google-Smtp-Source: AGHT+IEUiIzOiHLRzdgkH99+QuE32ywhnMdkTVC8NBgzI5fk5Ybz9uul1p9W6i4OO6rbzEw6xjwAViPCw8z3mDUGJlk=
X-Received: by 2002:a25:28d:0:b0:dc6:d87e:77d1 with SMTP id
 135-20020a25028d000000b00dc6d87e77d1mr1096217ybc.43.1707551545768; Fri, 09
 Feb 2024 23:52:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209-alice-file-v5-0-a37886783025@google.com> <20240209-alice-file-v5-9-a37886783025@google.com>
In-Reply-To: <20240209-alice-file-v5-9-a37886783025@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 10 Feb 2024 01:52:14 -0600
Message-ID: <CALNs47sV5QSgRkrFmazYvcKjY_TC2gP0oeg1TiT6YozBoTT-+w@mail.gmail.com>
Subject: Re: [PATCH v5 9/9] rust: file: add abstraction for `poll_table`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Peter Zijlstra <peterz@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Kees Cook <keescook@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 5:22=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> The existing `CondVar` abstraction is a wrapper around
> `wait_queue_head`, but it does not support all use-cases of the C
> `wait_queue_head` type. To be specific, a `CondVar` cannot be registered
> with a `struct poll_table`. This limitation has the advantage that you
> do not need to call `synchronize_rcu` when destroying a `CondVar`.
>
> However, we need the ability to register a `poll_table` with a
> `wait_queue_head` in Rust Binder. To enable this, introduce a type
> called `PollCondVar`, which is like `CondVar` except that you can
> register a `poll_table`. We also introduce `PollTable`, which is a safe
> wrapper around `poll_table` that is intended to be used with
> `PollCondVar`.
>
> The destructor of `PollCondVar` unconditionally calls `synchronize_rcu`
> to ensure that the removal of epoll waiters has fully completed before
> the `wait_queue_head` is destroyed.
>
> That said, `synchronize_rcu` is rather expensive and is not needed in
> all cases: If we have never registered a `poll_table` with the
> `wait_queue_head`, then we don't need to call `synchronize_rcu`. (And
> this is a common case in Binder - not all processes use Binder with
> epoll.) The current implementation does not account for this, but if we
> find that it is necessary to improve this, a future patch could store a
> boolean next to the `wait_queue_head` to keep track of whether a
> `poll_table` has ever been registered.
>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

One nit below

Reviewed-by: Trevor Gross <tmgross@umich.edu>

> +/// Creates a [`PollCondVar`] initialiser with the given name and a newl=
y-created lock class.
> +#[macro_export]
> +macro_rules! new_poll_condvar {
> +    ($($name:literal)?) =3D> {
> +        $crate::sync::poll::PollCondVar::new($crate::optional_name!($($n=
ame)?), $crate::static_lock_class!())
> +    };
> +}

Length > 100, this could wrap:

    macro_rules! new_poll_condvar {
        ($($name:literal)?) =3D> {
            $crate::sync::poll::PollCondVar::new(
                $crate::optional_name!($($name)?), $crate::static_lock_clas=
s!()
            )
        };
    }
