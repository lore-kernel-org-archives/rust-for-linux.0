Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IFgbkwmi"
Received: from mail-lf1-x14a.google.com (mail-lf1-x14a.google.com [IPv6:2a00:1450:4864:20::14a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB6F11D
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 07:34:41 -0800 (PST)
Received: by mail-lf1-x14a.google.com with SMTP id 2adb3069b0e04-50d12eaf22bso2996499e87.3
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 07:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702308880; x=1702913680; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOZT5zqEHYky1Ps7K/Q4ciJTn5tJsl8dEphldkaSknY=;
        b=IFgbkwmi+XllibOQ9klKOZKnBHD1mYUtRzsWTeQ8ix0M6qqRMIR9oHy1FmkWo7vp/2
         /X0iHs91+FR9tCE+dYdopOSwBZbF1SUXNKSNmBFokuTBhehbDaw0LNbyEx7ETFp6XKcG
         iWAyHqif/1BMyblwqPlbh61ZNWRLU1VvXHRcKeddIsZzJBE9TGnnPBLOtOgYFDAEaq63
         SHpN9Qwi1kIVvVQtefuwx39ubreuRp4Eoy4wWrDwTjOetvjmsaan2C9edM+apecJebSh
         B/7D9z0wqsgES9TLt65guEhXc8ZBS10ebCX2JWwi8d0Ljy6GU+KBDWGEfp/fqNhnu/lj
         jphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702308880; x=1702913680;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOZT5zqEHYky1Ps7K/Q4ciJTn5tJsl8dEphldkaSknY=;
        b=QtuQDDozzgpnDxVF6wy6kayt0oNWv8MOcrIddvOg5PYejKVFQ46/KiNPwEkgO6kuNI
         NvB81JBBRJ7306VGZ44SM403wmQ1ktQRoE6lGwvcRv75KVCZ20wYXfxzvqrpfUJRBt8A
         MHT71HC7Uh7A+IoJDykDaso6IPSTMMDV4XQlO0f3/WeUXcRlHGkIPx0nWgGSIk6uHGt+
         2BoAR++FSCm9UiX2UPLibNvw04mc/Sm07Fl74cBLa4zFE1B1K4cKaM4RjAFc9IhMFKVF
         2EXwassBSMPdxQz3F/Qqi2TCd2FiIdP0K01ngBepahKO16LSc50GyVKnw2F/lZip3QkB
         zgjQ==
X-Gm-Message-State: AOJu0Yz+MvMDo/PuKutR+Bp4gRoMdXFX/lFPF42GHlg8OdIyYnrBm21e
	U6FUSVK9CKZQzc/tNwwzBpkHq2H0vViEcyo=
X-Google-Smtp-Source: AGHT+IHCOPlTjdNBqi3JUoYkiYaObiziNKxt5OpfQsN0bHdAP695dwHkr0Ehqcwzx9VVbzzEmXS4TnwSIMrRWbk=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6512:3d9f:b0:50d:1456:58fa with SMTP
 id k31-20020a0565123d9f00b0050d145658famr31682lfv.9.1702308880329; Mon, 11
 Dec 2023 07:34:40 -0800 (PST)
Date: Mon, 11 Dec 2023 15:34:37 +0000
In-Reply-To: <jtCKrRw-FNajNJOXOuI1sweeDxI8T_uYnJ7DxMuqnJc9sgWjS0zouT_XIS-KmPferL7lU51BwD6nu73jZtzzB0T17pDeQP0-sFGRQxdjnaA=@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <jtCKrRw-FNajNJOXOuI1sweeDxI8T_uYnJ7DxMuqnJc9sgWjS0zouT_XIS-KmPferL7lU51BwD6nu73jZtzzB0T17pDeQP0-sFGRQxdjnaA=@proton.me>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231211153437.4162587-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 5/7] rust: file: add `Kuid` wrapper
From: Alice Ryhl <aliceryhl@google.com>
To: benno.lossin@proton.me
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	arve@android.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	brauner@kernel.org, cmllamas@google.com, dan.j.williams@intel.com, 
	dxu@dxuuu.xyz, gary@garyguo.net, gregkh@linuxfoundation.org, 
	joel@joelfernandes.org, keescook@chromium.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, maco@android.com, ojeda@kernel.org, 
	peterz@infradead.org, rust-for-linux@vger.kernel.org, surenb@google.com, 
	tglx@linutronix.de, tkjos@android.com, viro@zeniv.linux.org.uk, 
	wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="utf-8"

Benno Lossin <benno.lossin@proton.me> writes:
> On 12/6/23 12:59, Alice Ryhl wrote:
> > +    /// Returns the given task's pid in the current pid namespace.
> > +    pub fn pid_in_current_ns(&self) -> Pid {
> > +        // SAFETY: Calling `task_active_pid_ns` with the current task is always safe.
> > +        let namespace = unsafe { bindings::task_active_pid_ns(bindings::get_current()) };
> 
> Why not create a safe wrapper for `bindings::get_current()`?
> This patch series has three occurrences of `get_current`, so I think it
> should be ok to add a wrapper.
> I would also prefer to move the call to `bindings::get_current()` out of
> the `unsafe` block.

See thread on patch 6.

> > +        // SAFETY: We know that `self.0.get()` is valid by the type invariant.
> 
> What about `namespace`?

I'll update the comment.

Alice
