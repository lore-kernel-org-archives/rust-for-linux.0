Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l4JG/aro"
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD5ABF
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 08:11:55 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so14917a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 08:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702311114; x=1702915914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ac5CXHbB9EVvU7FGXILRzOHBDMiYKvXAj6dgYe06Vw=;
        b=l4JG/aroTPRdsLxosnbjTUSqs+hICWyAfxo9wjlxE/0Mao7Jbpt9ecD3aCC9sgPYzx
         IppMCf6+YIgJ7V3MOxgwaIhzw6IbTZQxg5qkJt2n3vZsAjk2dPl+CIf7IFJRxQrjkaZw
         qEL7Mr32I2w8sYTL+bnIuBmx5HMfrP4vHUrcnAtZn+gsy1w+gy2mGXGsjMsvw0PSInZx
         vWytJfTpXPdodie4LA6OkXQTHHg5SFTGPFJD1WBF7Hkxtp4f6IEscCrFNEPRMi90LoiN
         PrFvvRLAxWZSm/jE0idiAxRtxBt2/vShz/lA5orlSQlxbY7FpzFq7ndmah2s5OJiTtzR
         4LLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311114; x=1702915914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ac5CXHbB9EVvU7FGXILRzOHBDMiYKvXAj6dgYe06Vw=;
        b=v+ZxXWU7grqQwiVMxhX+Gjac2SzEJTAHitWFbTeqa7ulQEJNFZYhphyDOpm638LfHV
         XWx1VXU7qj8zHLDaPgeADFBIamiq+QOioDYxidrc4uiZaD6aIlemYjppFYEO1Fj63LdT
         Nx5MRCMjFsj+yUlKssGBIod0wxpkb7HaBmkc+G7nx9dAVMWEManTjIGZvLgQ7oTlinrx
         t0SxoJFuZmARZAY80wYuOb7OQFQApbrqFphQ2bYqyt0YbZL1OWU9gOb9pXIEWmqgHqQe
         ZmPteo/3MC/XOgbbL5Xz04wXscs+9LlLNCTHYpAk8gPKkDhSw4760Of9LWB5s3uI7MLe
         kYtw==
X-Gm-Message-State: AOJu0YyGhmpHIahythQ7wrzCWHgKKtMLLsT6RRderCeJ6A2edBY1GPlM
	aX9RK4autylgrIQyBqIffuDomDSJh/jDrtpqhNtIJg==
X-Google-Smtp-Source: AGHT+IFuGBJJrq+tVIvYyNR8QMM6gpxijJhMVkgf/4HC8SE1EFAy0QM1Zmzrl9//BuLZVZQqFldq140ye6hdah7svII=
X-Received: by 2002:a50:ccde:0:b0:54c:384b:e423 with SMTP id
 b30-20020a50ccde000000b0054c384be423mr206505edj.5.1702311113654; Mon, 11 Dec
 2023 08:11:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211150753.293883-1-mmaurer@google.com> <CANiq72nrCThY3mtHRMncRFDsu8XUmdb=W4WBs5Ua6oNugkDZhA@mail.gmail.com>
In-Reply-To: <CANiq72nrCThY3mtHRMncRFDsu8XUmdb=W4WBs5Ua6oNugkDZhA@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 11 Dec 2023 08:11:40 -0800
Message-ID: <CAGSQo03EPpPFy9ppE7wjv_NG8P_pRqLN21TvoMnYzA=+Z_gCnw@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: rust: Patchable function Rust compat
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 7:36=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Dec 11, 2023 at 4:08=E2=80=AFPM Matthew Maurer <mmaurer@google.co=
m> wrote:
> >
> > +       def_bool $(rs-option,-Zpatchable-function-entry=3D16,16)
>
> We don't have `rs-option` in mainline yet -- missing dependency? We
> will likely eventually need it, but currently we only support a single
> Rust version anyway, so we could add it (and the flag check itself)
> when we upgrade (especially if it is going to be supported soon).
Sorry, I just realized this was only in a local patch. I hadn't sent
it previously because,
as you pointed out, we currently only support one compiler revision.

I was taking this approach because Android's compilers can have patches
backported onto them when needed, so our 1.73.0 could have this flag
and make use
of it.
>
>
> Speaking of which, I can't find the flag in upstream Rust (i.e.
> outside the LLVM submodule), and I couldn't find a PR adding it. Could
> you please add a `Link:` tag to the tracking issue / PR / ... if it is
> submitted / when it is submitted? Or am I very confused?
I haven't uploaded it yet. I'm hoping to send it up later today. I can
wait until it's
uploaded for a v2 of the patch series so I can link to it directly.
>
> Cheers,
> Miguel

If I don't get the PR for `-Zpatchable-function-entry` done in a
timely fashion, I'll send
up an alternate version of this patch that just makes it depend on
!RUST, as this can
currently cause random runtime failures if features which assume
patchable entry are
used with Rust.

Re: Martin's comments (unfortunately they aren't on the same email so
I can't reply inline)
would you like me to file an issue against the R4L repository about
this before sending a v2?
I thought that repository was just for staging/discussion, and this
didn't seem likely to need it.
