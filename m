Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RraM5P2D"
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A161612B
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Dec 2023 05:50:27 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-7c500dcdd7dso1439506241.1
        for <rust-for-linux@vger.kernel.org>; Wed, 06 Dec 2023 05:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701870626; x=1702475426; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1BAIjik9oTj09NNiSlzlo6ZrWVwsHGjHjL12aXAbcU=;
        b=RraM5P2DnwZdpgz+znpFwoBQhT3z1f9JHV29x93o6fW93U2z5SaSU9Y+Mi7VxkEEaf
         5FnRIS/EgS9ciRvrYKCeuz/2Un6tt3dBEGQYA/NC6V6628OR2Q79HlK90xoz0vW1Bg0u
         PqSiT6vYZzxUJqfbyehWQKyWNDqP09NRRGhEiPl9/nGavy9zu0nqzRF2AL6+ijctxXPI
         vg9dk0QroWL7PcmlYQUxIwWQO6bFEdrukD7Jst9ikxhSPjatnGAIixsIKVyIygMLJMCT
         yc0tyRkSo8rztc24I4RxfCQz2dgiAjGxGvssquhD1HFiUJ2zecH4XpFUlz7CP90qj9bq
         d4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870626; x=1702475426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1BAIjik9oTj09NNiSlzlo6ZrWVwsHGjHjL12aXAbcU=;
        b=J0/LS29+PtNLxMrbDSLqhwG246+QIV1tcDrFBOA3/HRYXJmGPxwgcvmoLy9k9DgZfM
         nKqul786saFNI6hjTp/n9QAqVrz3lp4PD7R31ug7byvzxrdV3dDsgQGm3hue03Lgds84
         5tUIsWA/hkAuZBD8bSxG0OcQVoV4KwFTxGyso321WqH+sAjOEQTvmaG/QEWXDxQdX3uj
         G9p+dyRa2ELB3Y6peOWFUcovL9JPtBVki4YxTSzfOGvbmu3ryXXTjlWu2ihnaCiRY99F
         enXGIeYYz/bu0Ia5sN8qapEQLUCeLoemdzv6FllJYymhzmbZ5KPKyVHI6k9lHRw5whOh
         +kwg==
X-Gm-Message-State: AOJu0YxpwOULFAgrlVrgAWozZOqiMzVfnB4gJAAnz5uoPm3QI0VQ8sYz
	nwwPS+mTSF5odyXo32wTlLO1Io2rdGrBJNKu+XV6lg==
X-Google-Smtp-Source: AGHT+IFCHoT3X5T8cHfrBHVSfTA7dsZwWY82Djuo29t0Svrr6ZOibGhfeCDgYY98HIowh3TZA6jdedhUpLZiicw/vuY=
X-Received: by 2002:a05:6102:512c:b0:464:53e4:fec3 with SMTP id
 bm44-20020a056102512c00b0046453e4fec3mr417945vsb.22.1701870626607; Wed, 06
 Dec 2023 05:50:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206-alice-file-v2-0-af617c0d9d94@google.com>
 <20231206-alice-file-v2-5-af617c0d9d94@google.com> <20231206123402.GE30174@noisy.programming.kicks-ass.net>
 <CAH5fLgh+0G85Acf4-zqr_9COB5DUtt6ifVpZP-9V06hjJgd_jQ@mail.gmail.com> <20231206134041.GG30174@noisy.programming.kicks-ass.net>
In-Reply-To: <20231206134041.GG30174@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 6 Dec 2023 14:50:15 +0100
Message-ID: <CAH5fLghoyZHynwN7DK84sJERtDbuo_SbSty-0T8_xo2Dhj9Msw@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] rust: file: add `Kuid` wrapper
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Kees Cook <keescook@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 2:40=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
> > I can reimplement these specific functions as inline Rust functions,
>
> That would be good, but how are you going to do that without duplicating
> the horror that is struct task_struct ?

That shouldn't be an issue. The bindgen tool takes care of generating
a Rust version of struct task_struct for us at build time. The only
thing it can't handle is inline functions and #defines.

I'll respond to the other things later. But thank you for the thorough
explanation!

Alice
