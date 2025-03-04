Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051201FECD9
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Mar 2025 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084629; cv=none; b=hzGOgyBkjUjIvFDARpcLqpRh3yod1o1qEGC7cPk5inSI0FAtrEY9bMCptRZVBARZ064wHPv2yosCDHHvB4+CTwHKFoNS0JtYZq9B8im+3vPL5dKvnQVpZ6/t6Gv0xJch/Gdlot4ZJbHeMV8QfEhF4VIUQNzda/Z9nup5A/UWm3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084629; c=relaxed/simple;
	bh=Ph7Z/eQgdHPhRHi/cGs92I8dsrsvDBOdjLTZ5ObY0Xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dko0v6JEZiCyHwUH9g0lHMYWuYXKqqD4F89ZNoDBG0DaDF+3gnQscxpv/eeVuF1XRMXqHT/oyVFLmWmVZRWeyhNW1TkCD/q1jBa1yiSwo1b/er+0sS5LDzeK+r3hK3lmqxxOl0z6swpL4Jn+Nri+lPGtw11QyRNy0K4uL/zjIRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cOZ/Q1ss; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cOZ/Q1ss"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390df942558so4256471f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Mar 2025 02:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741084624; x=1741689424; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnfoXHWbkxpn8CLKu2E2rVl/Oeya0FmkAvYXgZjUPXs=;
        b=cOZ/Q1ssJvP5NH+A/AgBtKieSCXSv2M4jeXGyim7rZDJ+kGJc7dYtK/M1Ea9C6q504
         4Lwmha3jPiwBJmA6hC5GXBZLs3MeNdqZK5R4c73qdghfsmwYZZVWtmHzrtzDK4f2EfyY
         hDFSb6gQs+xT19BeqAs1FXsa+NGhKhnWroL+RU6FQm8Kb/LlQu545FKNUX9WuTX/7pe5
         H5UtU2kfvvP61ZNlhIVGqpKOigycvecGOKQR3XBBKGgHMaFfxThmp5xSBiu0GMNn6N7S
         ++N7tC4Rlbhg6UGIHiR2x6yRMe0J544C5kHxEVgcLelRG0uQGLw0gYy2osXiGFl8pd7b
         gr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084624; x=1741689424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnfoXHWbkxpn8CLKu2E2rVl/Oeya0FmkAvYXgZjUPXs=;
        b=daTto1FC5b05Gj91YKpM6QP0Wr7tai1sDpZUKIdEm5TAIgO3AOua60WuDuyxo7Ymp1
         SCC6v2NpToCNuPVuuoUM8Gtc/6RRPmdOWVVybF1G7J5NR6Reniqf+80YkJUUGzVFYV7j
         kXzpkHohRnJrVI2pl/3opq0jJWDEneGIzhH3DadXqGonh2INNYUm0LZz79mZs9FTMvwv
         85JxnNbeviDqxeFV6PMz6xG9pPifR8Ed9BUT+uornDsEcK3KRnCAFRHwGI2IYkQ+nLpP
         Rt4Pu7uYKBke1ElUP2ytnf5rY38ZazaZb3loU18Im+HdpeCAeEWJLenFqZtHQKPCVE2C
         97ig==
X-Forwarded-Encrypted: i=1; AJvYcCXjroK5DIO+W7omFm9y7lVxLwOtBAXiewJ2b/WmKCJ79tIlwffoOCPN5uv9DGdjaojGurrpPiQObMy8pDs/Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiCAOAcnmOrnlvqVAnrj33Gm2x+lI0wPYUBNtElHGZJNmzxuff
	cBP+AuWWB+mr1FPHNFPSkIJsOGvlWIsWBMt+qWpSTqGTIMgkw+4ePRwG/7lIywhE9xPKMjpl4Ka
	YBNTtknUylKu8KRlXAtFziZ9vIk6q3MtbTV+u
X-Gm-Gg: ASbGncsKWjj6QeytY4f++VntD+nXE+kyjL7d6WVGePUNLq8haZZEVRCQR1Os1ubICvN
	8vXQRNSLZfhAo21hLDsUVk/ktY0K1Q+dThSCEeex2OoRXrk2Yu2y7SaW3Kef5ERW4d0kHYHZ19B
	NOHP8ZIx/QGh+TRq6Lgth6YQqyp1xIbjWfFs3sN/2MaUrbXaqqLNlntJI=
X-Google-Smtp-Source: AGHT+IHnZGopTu14rJhQmFHdcWS/CmtUr7Vq5gBSfsQMqLY+ddlQ2k7+IHh8qMlJWxhe9a/q9UgVjpEYak7y23CaNeo=
X-Received: by 2002:a05:6000:1786:b0:391:1213:9479 with SMTP id
 ffacd0b85a97d-3911213986fmr4342313f8f.51.1741084624201; Tue, 04 Mar 2025
 02:37:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-inline-securityctx-v1-1-fb7b9b641fdf@google.com> <CAHC9VhSo3aGsJVd=a3MTeakgU66oTN86oh5sZE8P4ghSk8Rx2g@mail.gmail.com>
In-Reply-To: <CAHC9VhSo3aGsJVd=a3MTeakgU66oTN86oh5sZE8P4ghSk8Rx2g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 4 Mar 2025 11:36:51 +0100
X-Gm-Features: AQ5f1Jr6vlrRiPYv8T2mmkPxNCUjz2IzWb_BB5bszisP39eJSBbTg3T7YfzmtPY
Message-ID: <CAH5fLgi6ZFBqtyUuGPbdST-tEzHJ=Wp1khDxQhO_h+bZiFVj8g@mail.gmail.com>
Subject: Re: [PATCH] lsm: rust: mark SecurityCtx methods inline
To: Paul Moore <paul@paul-moore.com>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 11:55=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Mon, Mar 3, 2025 at 10:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > I'm seeing Binder generating calls to methods on SecurityCtx such as
> > from_secid and drop without inlining. Since these methods are really
> > simple wrappers around C functions, mark the methods to inline to avoid
> > generating these useless small functions.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/security.rs | 5 +++++
> >  1 file changed, 5 insertions(+)
>
> While this isn't specific to your patch, Casey's comment about "free"
> vs "release" is something to keep in mind when working on the LSM
> bindings; what happens inside the individual LSMs for a given LSM hook
> can vary quite a bit.
>
> I also saw a similar Rust patch where a commenter suggested using
> "impersonal facts" in the commit description and I believe that is a
> good idea here as well.
>
> Beyond those nitpicks, this looks okay to me based on my *extremely*
> limited Rust knowledge.  With the minor requested changes in place,
> would you prefer me to take this via the LSM tree, or would you prefer
> it to go up to Linus via a more Rust-y tree?

It would be great if you could take it, thanks!

Regarding the other patch for "Credential", is your tree also the
correct place for that? It's a bit unclear to me which tree maintains
credentials.

Alice
