Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A071EB36
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727258436; cv=none; b=goTRHf2GJv5c/NdDG6feshScPrUTOXAoVH9W1I/3a5f84tde4nB7tZHDZoT2C8+rhX0cjvBNQn+ybgpT+CPjLlxlpzEkAG3/bTC7JmCWMQbsWNUJfi6S/dPXgFODvwl2IB39tVJk0dlmNmrPgiAyN1wI/7y7Sy+YfpqH7i4eUkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727258436; c=relaxed/simple;
	bh=pJ2juEFqj+48bXu5zvFqiWfX3lEeexWtmQCXqHMpLug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m8GRwB/AolRQPvMtc4RBJymZeFAdOdtNNuFnR6I0gcx8wPBHIXmPJTf3Y2Y/Fe343i56B+W7YDv69qj2wpC7IUQfQPKKi4ELb/Bq1mpQjtLkZxJc07g2Es4aW2OFlLMSPCBnTbeH1M12nKxo3ppz69tfs8DhNC0MSOM+pvMixZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t52S434D; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t52S434D"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374c4c6cb29so6431552f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Sep 2024 03:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727258432; x=1727863232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzoOml1YCYEgfJn8QSXq3DVawdpDp//KSF0cYbIea6E=;
        b=t52S434DrvkJwkwV68afVW0pd8X3KR2cdzGxROMi4PLduMUO0wZSY30LxjfDsWxtVu
         4fDblR8UCpnjfrnIxdbszv0romy2eP1sBuAwGa4HXZ07zaQj0EbqArcFLrsUAPuKr2SO
         IeEpoFxVwpAxDJfXzisOgwj+WR3xG41ejGjeiksd7QEZg28E4o2PVfHM8W317bbn3wEY
         ruZXQdNuuo/jdsI+Docat2WKYxaBOORKD7TqXyJU7ylJFVk43K/eDXtR6Ea2trhjR7ag
         vHlRAAXfSIl0ToOoZCsARF+nKaBTg5sBa0DQySqGJLhnoN8ROjjFehO64jJOo3cGp/OA
         DzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258432; x=1727863232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzoOml1YCYEgfJn8QSXq3DVawdpDp//KSF0cYbIea6E=;
        b=GhD91rho0HKthhsy+QVleZf/o+/ktfBnhxzknpFqwo2MHPo9Zc8EbySnFRMvev3Aqe
         i1gkTeZS4nPeIOo0csAwbuwfdOQcTO0pLVvjgZnHUut0ylYDKQJi7bMN4iQxLH738Iah
         BwBfM2QUVfOnEt21UWmKgeinufAXGd48DuMq6d0QVsTeeisfoBMr/5eT/0/nQHgWBO55
         4YenfbBdIPjOwNzRY38VUASP0b9NJxNHa5qZv1Z6zBLgmtaPFScK4HSsRK6QgRrvjX9m
         2EAaW9HeR30mvi8rvCaB8Uye0GwvKDbiWIWtJYOlPPAw0/Z+XdrG8sNwqRbEwucOCE5i
         FkuA==
X-Forwarded-Encrypted: i=1; AJvYcCWd4sqwrsfRfCiKtv6kM6yGeCFAQMgshclD21Qe0kdJ4oxp0yS7L1z+8DljY8lhAnvJkFLUiyXYd6PR1qLtfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym/XmqfOf1o9IK2bybjK4CnKTAupu3nHf4qz4LR7uHQUPiEN6E
	/16uOLnRxHck6i5YsmJO+KHpcYBI/WrDejr1rTxOfUbvSUyoikJBbTpxesLFULtTrkYPHcxL79x
	bBGFFqTFooLe+XqDoB09cEPqm4GnUBrBKd2Qm
X-Google-Smtp-Source: AGHT+IGKx3uL22uVQI6NHByefGqy6iXJLA73m1W8DO6NEIobANtIbLRvc5jJ2Ew/h8x1OdttDYdjCDqwhHlO027Qz2g=
X-Received: by 2002:a5d:5547:0:b0:371:8dd3:27c8 with SMTP id
 ffacd0b85a97d-37cc246a5cemr1937135f8f.23.1727258432326; Wed, 25 Sep 2024
 03:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com> <CANiq72mv5E0PvZRW5eAEvqvqj74PH01hcRhLWTouB4z32jTeSA@mail.gmail.com>
 <CANiq72myZL4_poCMuNFevtpYYc0V0embjSuKb7y=C+m3vVA_8g@mail.gmail.com> <CAH5fLgheG47LdgJGX6grHXL6h08tsSM1DACRkkzQk_1U8VAOxQ@mail.gmail.com>
In-Reply-To: <CAH5fLgheG47LdgJGX6grHXL6h08tsSM1DACRkkzQk_1U8VAOxQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 25 Sep 2024 12:00:19 +0200
Message-ID: <CAH5fLgj7E03DKBcptgmZ8SLgco=Qs4puO=O6=v9=-3SSuqJyUQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Rust KASAN Support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, andreyknvl@gmail.com, ojeda@kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, dvyukov@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:26=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Mon, Sep 16, 2024 at 6:47=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Mon, Sep 16, 2024 at 6:15=E2=80=AFPM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > Applied to `rust-next` -- thanks everyone!
> >
> > Also, for KASAN + RETHUNK builds, I noticed objtool detects this:
> >
> >     samples/rust/rust_print.o: warning: objtool:
> > asan.module_ctor+0x17: 'naked' return found in MITIGATION_RETHUNK
> > build
> >     samples/rust/rust_print.o: warning: objtool:
> > asan.module_dtor+0x17: 'naked' return found in MITIGATION_RETHUNK
> > build
> >
> > And indeed from a quick look the `ret` is there.
> >
> > Since KASAN support is important, I decided to take it nevertheless,
> > but please let's make sure this is fixed during the cycle (or add a
> > "depends on").
>
> I figured out what the problem is. I will follow up with a fix soon.

I posted a fix:
https://github.com/rust-lang/rust/pull/130824

We'll need a check on RUSTC_VERSION in Kconfig for this. If the PR
gets merged within the next 22 days, this will land in 1.83.0. Would
you like me to send a fix with that version number now or wait for it
to get merged before I send that fix?

Alice
