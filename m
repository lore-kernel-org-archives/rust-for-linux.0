Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E0F1CCED0
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Oct 2024 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727817687; cv=none; b=jBRb9w1IelGWiVDScyh089INjrXw5xWFY4PZy5DjH5BSCsI7kRXyUBIGQlfdgvA1zd87/sJSurzl4TVJVv33QscSH8tHZ+SNm8d5+5sSCOaz/TFln4DVH0bhSq55AoVKSWkxDXEXEo6MIx+SJWZdUH2Ywu7yuF9rZMJu9rGXLww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727817687; c=relaxed/simple;
	bh=EQjfFUP6V15WHbsMfHvl8IITEfL2R5znZ0//S7cqib4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLUKQO/khr/8tJFJUNz9R2MWO/Hn7wi0NVR4GhTetiVXPJQ4e/4sNz9xQ/abTBhzIq9W9LPhECBPUi0EDusQTEAVPAIsfYi3drWKnXTmCbOXP2MiCg49QX6FMC109IrqVreCZCFeVrzE2xpsFhA1sA4F23jth/xSOcjNuvpgqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FvE7kiBX; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FvE7kiBX"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5398c2e4118so8164e87.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Oct 2024 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727817683; x=1728422483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoWrsU7z+qdIIFDpkMHhN4PhrREusH4jkiAl/mJtNdI=;
        b=FvE7kiBX8ZtLZa9UpwtJfNIQrFOiEzSoWeAXMqTVzC/H2VHvnD/MOVgjvO0BPoNHTZ
         DLgqN3x8qnWckY/gGPNv/Bwd2FK9OnqD3D6YIAbjWpTofZuNBgtspGjf7KejVXlwlYMo
         39cx8VrQsjE7n66dpjeoz+zzskC2COm2H5qxWCBxWj/IJf2S2qOom62uSkEQgh1CmEK4
         ks7Q6jEiCTLjB5NGmyjK5mhTnyS7+epwMCv8pMAbYhqCYY8B0H1yzi/lhA2XG5bP/deA
         i2BIFNwkzAwJO7O4KRmSVFAVvNG+TPQ4k3xCujBD4hFgvH58NuF8NJEQPhSRooSCldoV
         l6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727817683; x=1728422483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hoWrsU7z+qdIIFDpkMHhN4PhrREusH4jkiAl/mJtNdI=;
        b=VTKkFyQNuwZIilsMpF9GuSaVn5aVHVGc6fEO0QkMLCQ65tehwkG2R7jjTHZ+rwnhbz
         d9eDtn3JMulqJez5h7grpEmLlEfN3s9KaZUOzmQsuXzzx6KGZQvBQE9uRFqL/2xPv1tG
         Xk7VKeTSeRPJfYSVNBT90mbre01PKjlBrGLsE3YCckSpCBOdyqraFma1amj5XxK+x87F
         d8NvgTQj0RebPhLXnkwbzcj3BJPc2rMLIOavh2xJL0GsEmxwlxvjfkoDIFqijVk41dNt
         9wLNpP2/FUh4fum/j1Gc+DTOGDGMcPLvNI59ZiF8ak7V74QkbdjB4YAUQLStJmkbvkjI
         O6dA==
X-Forwarded-Encrypted: i=1; AJvYcCWCvXVP614rRVFc+M1KRReMtAClvqZX+Vb9iaWfiP6OKQ6TKAr3MG0gp2JgTg6WE82YCQ8FMeBGj9g2l6L5AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHtzJwrugk4w8sdU3VAfZD66+NrN92mjlW+XM/TxXLxBQ4masB
	hV4qdyHwtxkeo7LG8qNyl+im2740dhUP4ITnf1tPLAihdpC/TxndRfmMJyZFCUeRkug2SqtjF1O
	wjD0dQTiAr/gi5c0RAo22haZGryM4qArVjl+g
X-Google-Smtp-Source: AGHT+IGgP22tnj35LCYM0fX1Dz0p+NCTjOYdsvD+bPVZjH0BMXExjm00WWuhd0WmAK7axQvJ/g54h5N5+4LKt45smrY=
X-Received: by 2002:a05:6512:239c:b0:539:9ff9:5cbe with SMTP id
 2adb3069b0e04-539a0f0695cmr152225e87.4.1727817683249; Tue, 01 Oct 2024
 14:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
 <20240923181846.549877-32-samitolvanen@google.com> <f0eee8a9-766a-463c-bc36-676e49efe950@suse.com>
In-Reply-To: <f0eee8a9-766a-463c-bc36-676e49efe950@suse.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 1 Oct 2024 21:20:41 +0000
Message-ID: <CABCJKudn0WcOAg89ouTQoEHQC5n90SdetxHYG7GvQWmWo6WQ5A@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] gendwarfksyms: Expand structure types
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 2:16=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wro=
te:
>
> On 9/23/24 20:18, Sami Tolvanen wrote:
> > +static void process_variant_type(struct state *state, struct die *cach=
e,
> > +                              Dwarf_Die *die)
> > +{
> > +     process_list_comma(state, cache);
> > +     process(cache, "variant {");
> > +     process_linebreak(cache, 1);
> > +     check(process_die_container(state, cache, die, process_type,
> > +                                 match_member_type));
> > +     process_linebreak(cache, -1);
> > +     process(cache, "}");
> > +}
> > +
> > +static void process_variant_part_type(struct state *state, struct die =
*cache,
> > +                                   Dwarf_Die *die)
> > +{
> > +     process_list_comma(state, cache);
> > +     process(cache, "variant_part {");
> > +     process_linebreak(cache, 1);
> > +     check(process_die_container(state, cache, die, process_type,
> > +                                 match_variant_type));
> > +     process_linebreak(cache, -1);
> > +     process(cache, "}");
> > +}
>
> For variant types, should the tool worry also about DW_AT_discr and
> DW_AT_discr_value?

Hmm, I initially thought they were not necessary, but looking at the
rustc DWARF output a bit more closely, it might actually be a good
idea to include this information. I'll add these both, although since
DW_AT_discr just points to a member DIE, it's probably enough to just
process all child DIEs for the variant_part instead of limiting
ourselves to variants only.

> > +static void process_unspecified_type(struct state *state, struct die *=
cache,
> > +                                  Dwarf_Die *die)
> > +{
> > +     /*
> > +      * These can be emitted for stand-elone assembly code, which mean=
s we
> > +      * might run into them in vmlinux.o.
> > +      */
>
> Nit: stand-elone -> stand-alone.

Oops, I'll fix this too. Thanks!

Sami
