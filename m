Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48051AF0B0
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Oct 2024 13:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728997634; cv=none; b=D4wgfwqBw3Sd3qQZim3zjFu6WLzudX8SWc/MMfJ9yN3bexqdsd6DO5jnUh8t5IFjSTLbCuy3YOlCi3JrkQCPZSr6BSKpf1HxSGVb1JNpTOAvIyGkTrXjbrqjUuEIJfutQ1kCa/CFseGDby8aQu8JbwI69HKZqMAdsccLxYBf9Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728997634; c=relaxed/simple;
	bh=RAFtXXlMObqVzV2d+gmuJ5R6yL2BTETgZusCP73IhnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tf6n3g78ENivq2YOW9y2jF/YUtY/K3KP8xzKu632OncbzmHbz0NZhesXrRBPc9ErDNiXDQYRTIUXkmR040k5lA/OicyCfqkPIIidFJGSNjOUjg3ruCz/8+YKP0FxQBjh2sbtfm/uJXqcEwfZjUQv6t7qcknpxyhIM8Q7NqZ4AUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PacNLH21; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PacNLH21"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so51555925e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Oct 2024 06:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728997631; x=1729602431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=en9jFwXT2bDiA0LT5HaPdVoOH8lCOJ0LwIRdXejUMhk=;
        b=PacNLH21jg9EtiZ777S++jbmSnReEBX+Eiw0EER8eKcVl8dX6oUMoGhpc9ntPaPGFU
         tNvkF656WDjHebY888fAZtMmGNqdMgceAa5gF3ZhIACFWX5GCq8vNMiaKU9IkPlrOGLJ
         ndrO87HjcATCXrJUcfHRPQyfLTV0eQ5OwakKmvIBtp8n2/0mYEXMRGGTqtbJpBr5NKnm
         9k2qZbqjkoRIyPd+wvGYUdl4geJWuYnsn0nx/ttLZhLGTyTv5dfLIe91is0nM229KN23
         0G2J58/1gbKDOxqkswiSy5leEA4AQwoxlrIJEtujvkHd8cFcwP85SMWIyofNNKDJlf/c
         Qb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728997631; x=1729602431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=en9jFwXT2bDiA0LT5HaPdVoOH8lCOJ0LwIRdXejUMhk=;
        b=oVSHU52Z8C5zrd7XRtsf9iM7c2vOUZJHqYyuojstKSa95xx/sgReYy6qYAzHFa3Vg4
         +unI4MWViXu90P60EeMDtAmDrRlckfePiBvjesw4sHekOKS7ohwxYtdcAjyhIccQfdoF
         mnXRKzyrOuPJTUj8YgYSZ/ArhDr2euyOlmAq9cT8zJ6lrNrv3E/cNvFHDu2vNJZ0SF90
         9DgY6HGbzyl+Eh0iBpyp/ZBP3114zkNAGmUnwu9Gv63NhkPltaC0OUHsUyccUi75mrmu
         9aRn/inoNO/yxWz4JONXE06ixJEZSmlpVZxomcl9s5p1kSZA0Q6EduZXXJiEO02K2Jr5
         VmxA==
X-Forwarded-Encrypted: i=1; AJvYcCUClV0w4NQYkG8+xlbdtODcplrJLtsfIywlS0KabiB35Z1JYI9bURKK11033oxCFmYkOYbTln/IMQbcW4aLjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2j8e1NsAqDuTI60EF+xIIAzlTFx7BO/8PuV/3dwPfzaO1Jkb8
	kSu5lYrteaKW0W6tkLSpQy3XIMBNXYllvWAmWcDUFQSXPKuz8qH8bTQwfze7WMXvn2zD7URy9v7
	VQwXd/xaRQr96KFBIBnYpkZ8Q3CT8Lvt9IwpK
X-Google-Smtp-Source: AGHT+IF+ejFusSyTSFm0RCp9pxJc8mmToy5lXNSY48Rr+wd/q53EvtiwpWkYjw4u1eyqqetmcpQmCrujFgNR9X+o7To=
X-Received: by 2002:a05:600c:b8d:b0:42c:cd88:d0f4 with SMTP id
 5b1f17b1804b1-4314a379091mr4398285e9.22.1728997630948; Tue, 15 Oct 2024
 06:07:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011-tracepoint-v10-5-7fbde4d6b525@google.com>
 <202410151814.WmLlAkCq-lkp@intel.com> <CANiq72nn6zv9MOD2ifTXbWV3W1AgiXL=6zTX_-eGL5ggLj4fbw@mail.gmail.com>
In-Reply-To: <CANiq72nn6zv9MOD2ifTXbWV3W1AgiXL=6zTX_-eGL5ggLj4fbw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 15 Oct 2024 15:06:59 +0200
Message-ID: <CAH5fLghJrrq2nJu7S08bBg2sAjdibkZ4D14K9cqETafnr4CR4w@mail.gmail.com>
Subject: Re: [PATCH v10 5/5] rust: add arch_static_branch
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	oe-kbuild-all@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 2:11=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 15, 2024 at 1:06=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > >> /bin/sh: 1: cannot create rust/kernel/arch_static_branch_asm.rs: Dir=
ectory nonexistent
>
> This happens because we run `RSCPP` even when it is not a target. We
> can add the dependency conditionally:
>
> @@ -423,8 +425,10 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
>  $(obj)/kernel.o: private rustc_target_flags =3D --extern alloc \
>      --extern build_error --extern macros --extern bindings --extern uapi
>  $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/alloc.o $(obj)/build_error.=
o \
> -    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o \
> -       $(obj)/kernel/arch_static_branch_asm.rs FORCE
> +    $(obj)/libmacros.so $(obj)/bindings.o $(obj)/uapi.o FORCE
>         +$(call if_changed_rule,rustc_library)
> +ifneq ($(CONFIG_JUMP_LABEL),)
> +$(obj)/kernel.o: $(obj)/kernel/arch_static_branch_asm.rs
> +endif

Thank you. I was able to reproduce the error locally. It only happens
when CONFIG_JUMP_LABEL is disabled. I've verified that this fixes it.

Alice
