Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A323741
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Oct 2024 00:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124801; cv=none; b=GI67Lq6dxSMEqFnPndx+DDq11nQiei1IgwH+ocdfZ4ndqhTuexjuHjjy/meI9q/z8755fjq9yiaCJ+DLPXRd5x42p/JRx0udPgkUXKtbtAwNjJOEv3cOO/4TDuFV4NCokTctwkejl3RIXd9nDEMu+f71YMZqOuQBX3J5EMLv+2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124801; c=relaxed/simple;
	bh=0jwTR0iueyndpPrNwaFPpUKTaxSDEKtRjzWhhrTbnME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4HzhudjeAywkmPOyIpxsaTpK6v1b8yD56xMmSzCbv1RizXbOqwa9BJYoC2wrU1qruh+ok4zpk1pcq5e/5RuhH05DeCHmyQDqF7h36B/abR4GMxHHTYdrzWHwLB16qWAN1bMzwE3G8ODU26cAgZe42baBKAba7O0myNfoC1LkiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dPAShefK; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dPAShefK"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-460969c49f2so123011cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Oct 2024 17:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124798; x=1729729598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWdC8o5l9dSoefG8d0V05ixiC17MDxk90k3DqUJtL94=;
        b=dPAShefKWC4QLcHJmjMl42aFVABXczWNYOdsNby8FvOQZmrOY+D/bLU44LMmQfp28j
         o5RU24BNZTDP/dGSSF4rnlvS13/PAsvwi3YP9tLDNCH9eB6NZETgfc/G3zieRIrxHGqk
         sqCrjVa+fpeBHGLut2kvfeBCE6GLbwnQ7V6Wt0GF5OjvStGyxtrbx+CnB5HbPtyOhBkw
         wt3ZM0nl0fFdk2+clQPHPKmi7n3GOedeQC3AScb8UfjcPZddocARw79Ape7PfOv+XhMM
         r/O2ZQnw0eEuKmKRqRMdl8vj33Sx/gwdsXQCkIVtr/f0xMu9O+RUCs1CJN/qDWRvZDB+
         pkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124798; x=1729729598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWdC8o5l9dSoefG8d0V05ixiC17MDxk90k3DqUJtL94=;
        b=leNfF/33uIY1ilgWlEjeUfa5dtLRFHMvbU5STrMhYvr2r7aD5kBx7h0agrKQ2zrx+/
         /IuhlSpCF/6/wsF8P/4j+3jIKx13vRxd0wA/x2wTmTxnO9EDy4t6VdXruwWAE0rWnXPv
         E1y+XKLl4oByexb5UaMjOx9jM17TRHEf4MR6TeXI5IItFACvq0F9e0vfyf2w9NB5xlnK
         FIw9kIpECVgJXdBTJXZyz1JY7+4kyHdLgfJ76fClQO7XPknMiAtFQySBGJJkE/fXBa7Q
         rhKio/tDh3s69URKRP9HOD3i2HR+wEs2fIhxmrc+gqrDA8jisqqRSs9Z5WDDyqHBoSsO
         /gxA==
X-Forwarded-Encrypted: i=1; AJvYcCW6sfbYJE+bATzSZdoWiwz/MzCDRw8D2PqP/253Ktfe34aGKz7dwvPQy26uEbRZ7UWZBp0qWLwLiz9lC2Dqwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT8KTUZRKbbSax4Ot2II8LdvXpZ9PeVtdCRTUIG9+rHKBfnLSr
	ElLNUbbSKKGtmM65iYDQNnKR5koislOndwN6Fs43tGlPEzGozTrrjGv0/D07KmTwN4w5BpUGBkq
	X8gnjXzDGUZbijNOXAKqXcyf123A3U/VljthT
X-Google-Smtp-Source: AGHT+IFyrIuiUrO1qU9KQuQZSVEK+54cenmGt/fL8q6O8TUeM+0K1ZlNZ1Ma9YYWd9GL+AJTnwqdve95TquY/nRUVCA=
X-Received: by 2002:ac8:648d:0:b0:45f:924:6bcd with SMTP id
 d75a77b69052e-4609c8e1b3amr1552851cf.22.1729124798070; Wed, 16 Oct 2024
 17:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015231925.3854230-1-mmaurer@google.com> <20241015231925.3854230-5-mmaurer@google.com>
In-Reply-To: <20241015231925.3854230-5-mmaurer@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 16 Oct 2024 17:25:58 -0700
Message-ID: <CABCJKucg9okLPkK1bgDqZ+gdRxSxvkE2Ff8JPBkrcsH+Guo_vg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] modpost: Produce extended MODVERSIONS information
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 15, 2024 at 4:19=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 107393a8c48a..d18ff8a1109a 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1840,15 +1840,56 @@ static void add_versions(struct buffer *b, struct=
 module *mod)
>                         continue;
>                 }
>                 if (strlen(s->name) >=3D MODULE_NAME_LEN) {
> +#ifdef CONFIG_EXTENDED_MODVERSIONS
> +                       /* this symbol will only be in the extended info =
*/
> +                       continue;
> +#else
>                         error("too long symbol \"%s\" [%s.ko]\n",
>                               s->name, mod->name);
>                         break;
> +#endif

I applied these patches to my test tree[1] and have the following
options enabled in my .config:

$ grep -E 'MODVERSIONS|GEN.*KSYMS' .config
CONFIG_HAVE_ASM_MODVERSIONS=3Dy
CONFIG_MODVERSIONS=3Dy
# CONFIG_GENKSYMS is not set
CONFIG_GENDWARFKSYMS=3Dy
CONFIG_ASM_MODVERSIONS=3Dy
CONFIG_EXTENDED_MODVERSIONS=3Dy

When I try to build a Rust module, I still get the following error:

ERROR: modpost: too long symbol
"_RNvXs2_NtNtNtCsivAAjSnxUpM_4core3fmt3num3implNtB9_7Display3fmt"
[samples/rust/rust_print.ko]

I suspect gating this behind a config would require you to add a new
command line flag to modpost and check for CONFIG_EXTENDED_MODVERSIONS
in scripts/Makefile.modpost instead.

[1] https://github.com/samitolvanen/linux/commits/rustmodversions

Sami
