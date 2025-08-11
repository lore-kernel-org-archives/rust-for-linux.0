Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9582D8788
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754895258; cv=none; b=ehfF9wyAPGG50rNLcXu5+c3jp71xJ+PM6F02leCUbPJCmw37RT41sobTK7gFgIMtlRAMlc/COp0VEYTqXhuQhGBmf1wBO5LgjLDwQ/EjKgxEtCCE40xv+BuDq6AUqqYiSejfG4Z/HbxsK7YV/m4SE2tXxopK9zrKfAW61DTEAuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754895258; c=relaxed/simple;
	bh=IMF7oxhWWht5Rfg97jPniIkxBcIiuZXkIEqgJK9FhhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGWr2t9CZVURwUlyeCyExbO2lZPcteGcEG3oCbsEduBU6+/MVEyImp8m05s8evdYZwg5aH5GGm3TKhhWBV4sW6oSXaNXU8Fn8e7A6XZHvxCps9OU2NDm0F9eJgsMU5fA9O9oma8+SFSX6nZQAie2Q3XJNGTRUahrv62Mj4uqqnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i5/clQyt; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i5/clQyt"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b7961cf660so3277366f8f.1
        for <rust-for-linux@vger.kernel.org>; Sun, 10 Aug 2025 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754895255; x=1755500055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMF7oxhWWht5Rfg97jPniIkxBcIiuZXkIEqgJK9FhhA=;
        b=i5/clQytAI6aNJ5lAru6FytsDdA1kj8Wj70cqEiMNDyFMW/BSxl2PwfEVO5I93EPeN
         vicnNtheqhW/40qANqgrfzgf0pt6b5uyYYagDM1VuKpnPjJ39GyS8MvwCbpG0fd/IS/6
         TUXCT+N5alEKrgzrHsQs+tW8ANbicIO/BUWXB9kLxhRT74ijwOmIM8HO5cNWpeITV2Gh
         lnL/2h2kqbEIagf9qs9S4ysnD9G5vPfJRfeWGt+bWs0bv0yaWEK1torbz2ihz61Cj1KX
         SzuG95k+vo+ZyCtyUWPk4SAhQJ+IEZijGY8xG5bWb4aOOwVhlmYskSb3gm1XmFPY1qJq
         z2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754895255; x=1755500055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMF7oxhWWht5Rfg97jPniIkxBcIiuZXkIEqgJK9FhhA=;
        b=Wk3bwwajIqkiXGOVQ4dYUkIv8tGNvVQudr81+0QYHcNf6N39Gha9Bz7khIwHEhnliY
         DckuSk0y3FUre80V5gESl1hgzAl2W+Gtcry/LwmgNgD4l597yjr5ftnCuLghsqT26STI
         8EO7hSQTmiwxuMfRfonuZceXnrNYTVpDWS9hRYip3akTnOMIq4TB/x05/eu00Iq9TVmZ
         EX2WmCLPb0DI6i2501n5Hvk8rabIp8C40T7aCPqMkX6qGqfIphuylZ74cQEKz8mlJqbw
         +aNkrlJrIrl3Rviwanp139Oa90LpQGYaZhjqKI398AWAmZ6JGAxI/Hy+lPLpLJioN7Sl
         MFNw==
X-Forwarded-Encrypted: i=1; AJvYcCX0syktaKBjCbKmMjlq4ZCfIvq4sG69WhsCrlCrLVMuhfu0svuRrTieGFiAqvREigevudEvNc4D8Np1DxX1Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5NrtsFwY72d9aH5jZss4PlKqskGaSp9A9caXWukUdU0368Oom
	oZrP00+scPqMJgbAcGsMTVVYKKhFOpHSgbDNS/6tvXT6+bco8fICMshAIsdqedbLVMcBfSauDhv
	KB34Nsx1U8Gp840vI0KQWJcSJiqc/Ac56c6TrL/vN
X-Gm-Gg: ASbGncsJV1lhVzi3XktRLo5MBVK5kM3H+4Y93NNcBbdIvrSH3EetvI9frqhPvMGc4+h
	2+2ZLQ5muRvUz83YGDJrQA49JK0LBfhkdTEfhyTrGvCcHb3sdiYwlEYgGFqz1Zq+lKgGO5QKql2
	db+ugoGjMRaO+nI0zm6ptjsxYgJRLw8PY+Uufryosvr0gqYr4S1jOW9jb/VbmuA1H4/ax6wKuqa
	QH9v8xjcdICWdsUJx0=
X-Google-Smtp-Source: AGHT+IE/b40zkpS05GhNxK8XjZNGAut87hJOzbsMuY++YS8Jo6CClprJ6Pmx87Y6WX+z9WagLq8WqZGJ4Jcedzh3yJU=
X-Received: by 2002:a05:6000:1ac5:b0:3b7:9715:75f1 with SMTP id
 ffacd0b85a97d-3b900b735c9mr8726917f8f.36.1754895254840; Sun, 10 Aug 2025
 23:54:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721-irq-bound-device-v1-1-4fb2af418a63@google.com>
 <DCBBFAC5-A4B4-41BA-8732-32FA96EDE28E@collabora.com> <CAH5fLghRi-QAqGdxOhPPdp6bMyGSuDifnxMFBn3a3NWzN4G4vQ@mail.gmail.com>
 <0303C763-76CC-456D-AB76-215DF253560C@collabora.com>
In-Reply-To: <0303C763-76CC-456D-AB76-215DF253560C@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Aug 2025 08:54:02 +0200
X-Gm-Features: Ac12FXzMwuxocaFnrrcDOWSm5kfQ5RQ2kLadCTdi78EU3qPMWKi0IrhJ_Ix6Rug
Message-ID: <CAH5fLghPz3UF-yKVt5x3JrMZ8f-mgT2gysRhJG8TK2kmF1ejGw@mail.gmail.com>
Subject: Re: [PATCH] rust: irq: add &Device<Bound> argument to irq callbacks
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Dirk Behme <dirk.behme@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 2:49=E2=80=AFAM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
>
>
> > On 21 Jul 2025, at 16:33, Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > On Mon, Jul 21, 2025 at 9:14=E2=80=AFPM Daniel Almeida
> > <daniel.almeida@collabora.com> wrote:
> >>
> >> Alice,
> >>
> >>> On 21 Jul 2025, at 11:38, Alice Ryhl <aliceryhl@google.com> wrote:
> >>>
> >>> When working with a bus device, many operations are only possible whi=
le
> >>> the device is still bound. The &Device<Bound> type represents a proof=
 in
> >>> the type system that you are in a scope where the device is guarantee=
d
> >>> to still be bound. Since we deregister irq callbacks when unbinding a
> >>> device, if an irq callback is running, that implies that the device h=
as
> >>> not yet been unbound.
> >>>
> >>> To allow drivers to take advantage of that, add an additional argumen=
t
> >>> to irq callbacks.
> >>>
> >>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >>> ---
> >>> This patch is a follow-up to Daniel's irq series [1] that adds a
> >>> &Device<Bound> argument to all irq callbacks. This allows you to use
> >>> operations that are only safe on a bound device inside an irq callbac=
k.
> >>>
> >>> The patch is otherwise based on top of driver-core-next.
> >>>
> >>> [1]: https://lore.kernel.org/r/20250715-topics-tyr-request_irq2-v7-0-=
d469c0f37c07@collabora.com
> >>
> >> I am having a hard time applying this locally.
> >
> > Your irq series currently doesn't apply cleanly on top of
> > driver-core-next and requires resolving a minor conflict. You can find
> > the commits here:
> > https://github.com/Darksonn/linux/commits/sent/20250721-irq-bound-devic=
e-c9fdbfdd8cd9-v1/
>
> Ah, we=E2=80=99ve already discussed this, it seems.

My suggestion is that you pull the tag I shared and cherry-pick it from the=
re.

Alice
