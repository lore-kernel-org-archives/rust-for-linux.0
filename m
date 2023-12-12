Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aHzAsDdN"
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F46F11F
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 01:40:44 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3b9df0a6560so3616398b6e.2
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 01:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702374044; x=1702978844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBPastpn1RC87z2hLEiZW6KtB1XJZ0fz+MiJEWfk6hU=;
        b=aHzAsDdNxgosCtPLlh4A7a7Pd9lK10j1bcD+5midrPZFIulAaKCBBM021VmiWWJf1i
         DsXaPooqliJv2rn2gA4pNTYl0sJNEnr55neuH4Eeocp/bsL4EBhtSBHxXz0Dd4KUF0Zb
         fCKDXSyN19/TSQv49O60rsk+wvvtWOJ8WO6ZM7QhxThLt4v8ArGuiNFD0U1fffaIhYXW
         PmZNAtebFqfh54fio1652/DkUAHp8JF7iFRzxlP//DN2g6E7r8R/4PwB20dgjFRcAGSf
         j1AS0Ha70elH1dxAxO+KwYRJ1P0nSQoZ3N92BPl0a9yDoIkHwNuk5RhCfs+8E3E1cWbj
         /ZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702374044; x=1702978844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBPastpn1RC87z2hLEiZW6KtB1XJZ0fz+MiJEWfk6hU=;
        b=jyUAQXbkSFt2yWt1WxWaIYVOAjsWjbcaDUt8Jp16vB5wAS4DJpsGb+MSBCxqWLsZlV
         Y0Cc/ppLZOd/qENCumDDqilU4Q/Ye/5LVEIroIP2juBp3SaWQ+KN0DouRWECozRlgAy1
         UvZhv2nXI1/Q6xeRQ9dRM0aX7bfrLe9Y0eLig32BRM6JTSVanJ6aCUcfmSHGcMWTpGAh
         mgeN0isGvJamElhKTTz89qUESF6eZhsU9OdBkfoHY+3AttSqNJKl3S0u4IHgQ6zVqt8v
         phH82bowWSYt/NoSVjgLxDuYXAdzGTK8a+IVZwOuHsHfx8d2uznZtayLC+c8A3HsK/aL
         QBhQ==
X-Gm-Message-State: AOJu0YxxAUIj9tcg43BuoBRwMaJSmG4ejqLpsCYRZjcaXpRNxgoikaDr
	n3EaQ5YPDBsWN+daWF/OuIsQ7SXJyryKv+X/gftwdA==
X-Google-Smtp-Source: AGHT+IHTSiZ6LzgVymhn5KubTf+HT5hUzMz3vldIiaU9GfA+4GJncv76WqjD73+5ZSklO9GCgIaWXZcxpODcXU0Y6u8=
X-Received: by 2002:a05:6808:130a:b0:3b8:7a9d:af5b with SMTP id
 y10-20020a056808130a00b003b87a9daf5bmr6387114oiv.35.1702374043714; Tue, 12
 Dec 2023 01:40:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZXZjoOrO5q7no4or@boqun-archlinux> <20231211153429.4161511-1-aliceryhl@google.com>
 <ZXdIbEqSCTO62BHE@boqun-archlinux>
In-Reply-To: <ZXdIbEqSCTO62BHE@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 12 Dec 2023 10:40:32 +0100
Message-ID: <CAH5fLghbOA6s1d8GFz3JwcqDtzq+VbM3dc3M=enF0UHQN_Nt5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] rust: cred: add Rust abstraction for `struct cred`
To: Boqun Feng <boqun.feng@gmail.com>
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, arve@android.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, brauner@kernel.org, 
	cmllamas@google.com, dan.j.williams@intel.com, dxu@dxuuu.xyz, 
	gary@garyguo.net, gregkh@linuxfoundation.org, joel@joelfernandes.org, 
	keescook@chromium.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maco@android.com, ojeda@kernel.org, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, surenb@google.com, 
	tglx@linutronix.de, tkjos@android.com, viro@zeniv.linux.org.uk, 
	wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 6:35=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
> On Mon, Dec 11, 2023 at 03:34:29PM +0000, Alice Ryhl wrote:
> > The safety comment explains what the signature means. I think that
> > should be enough.
> >
>
> For someone who has a good understanding of Rust lifetime (and the
> elision), yes. But I'm wondering whether all the people feel the same
> way.

The safety comment doesn't require understanding of lifetime elision
to be understood: "The signature of this function ensures that the
caller will only access the returned credential while the file is
still valid."

Yes, if you don't know the syntax for lifetimes, you'll have to trust
me that this is what the signature means. But I think that's the case
either way. I don't think it needs to be changed.

Alice
