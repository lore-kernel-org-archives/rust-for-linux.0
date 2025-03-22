Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFA91F8BBD
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Mar 2025 19:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742670741; cv=none; b=ZffpheSbfvFklZyghpg7mLVNhEA8FlwYCaJssi+KOLjRn/zqymKa8VFxMh6xgTTLvR5JuowNf4sQW+YJ5hk3QHqXFy+b3VG17BOgTS/CfFHyPJJlFkN/UkLdiZE89TC0hOY4HZchkLQ7NRcH1Nx3iPf4jxLp+Fj2GZnrhaZtmD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742670741; c=relaxed/simple;
	bh=Ms3GzoMd0rlk4O2lv0P7VKB/JXaNBBDottrVBUZkhXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aJniLYoj3cKzoMoY4wo19eUPrvyfiQFRjGqWJZmBNa5v7sGQqV7lp2nl6k1OP25k8Z/TITuwDk1NiIcaRGtHqsz72qVk02b6FkkBlbWxdgOrtrGMpyiHoZJc8/t1T/w31SU8OQ913v04Mcane3k+yCx3LRZYUylPwR5E0iLS+JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=NKkRKj1k; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="NKkRKj1k"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6feb229b716so28666867b3.3
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Mar 2025 12:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742670738; x=1743275538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xc66qLysPvi281ZD9mTakiRweaXqO3hMAEWrZlpzBs=;
        b=NKkRKj1kiT/HQmu7ibaWo0/LNpusXk8Ar/5FeSLeH+saNcYNMyJWURQX2Iv+IXbltR
         44TwBxHyYkNmkaiFLCLKFTL3uzOhknmC974TPHuyPHL+8qe83Zpl4TTtKahg/syAyefj
         G1Exhd3VOx7FFCIa2Honz/z67Tor/gkCr7Q/aTv3ytcWpM/1OvI8KFfP4T3lVWNq82Dt
         RjyqrarQJskwFIue9SlxnRHQ0JSVL/89g8rzO3tHNMqAWDY9Rc+O3K/i0HAq5XViqBqC
         keaZ2w9i8MFb6shtt11rKJn3PvvZ+PuGXJehe2N4CSgFCdNxEzTwFAdoTWC6TVWbs+XE
         L8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742670738; x=1743275538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xc66qLysPvi281ZD9mTakiRweaXqO3hMAEWrZlpzBs=;
        b=VMJX0Pm18LegK+nA99FNWcjS9RzXumUU5X+6lVV2joV02LlxPz5GvH2hGWXN8Nk6Fx
         4yjSx0iBJAp+WolaHGfWUmQMhdXSfJbFnwIkP69q/2I2lnsD8EahmjSkd1Q4ggqukQ33
         ZwYaxWskBVShRO12jp6K1fcMpbHAf1ejTrE4WYH4R9Q039DmhkdPZvqSjB6StoMGT8Jz
         ICCC/6PGVrrU3N5ttRWBrM+RYi34iqjCwR5Ixj779D5QrtbZK0IoBo/SwhpfNZt4h7Ta
         JaCsS6Oeb+BVEiKOgpJB4RrbdTUEY2QlWYEi0mth8vpzemA86QsGKzmPHi/20NSIlyEW
         D5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVT3jzFVbBR8cn6Cfngligq7vVn/UMAjDIw1r8XdS9G8UKgVlX1SVVNpZBLbigU906GfH+VfUe3pB8/QTHCcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV2LEadWoxEw05onOoR3XbDjtbWL9XTJG1d/1hKpS/V9baiih9
	RFJNJEd6BY7G68HwM0h464c2Td6xJbEVKOpwkAFjxHEDdndkujLqajZOStb8uxg=
X-Gm-Gg: ASbGnctnnpYkGyT1pNTVpoTJ1b+KuazZXZAyhSy0OKwFwz1OCEwiNDFgIsM7fKkt6dA
	zRPC6YySzVY9TMvx+J8hRv/6cnSQqBsNiyK2UvfEiKXUQdDnISatGFCKhVnw+L4r5BSO+cwoiPy
	J8+FVYbD1MMsoucMbWV+dHb2xkZuEN1kPnMvdBzIoPHUwqgWo/q2WsPMWrsMomegc5pcnGCwvs5
	7tt1ZhhSrxzD6KaiOsG7NBd9erWv7ZqoKaXvh8/o9VvACaDubZpMsC44yQG6L70UAU1LRSpPePv
	TF91WuNmL4QwgIdWgOaE+kEvGHuMTCMCASYFE7QKFFBPwmbKRfDwjKmCTutywzE8QkMtB2on3qe
	zwALjxuj0y+OLG0PTJm6wEQZu5bex1SwtT/sKX77c
X-Google-Smtp-Source: AGHT+IGKshaTgbMcpr9UNssd5GQF9rWZ6akyX1Lym+sKao77CEU4NvOIGlBPRgaIF+zI1BiKem6ung==
X-Received: by 2002:a05:690c:fca:b0:6fd:2321:567f with SMTP id 00721157ae682-700babed947mr87056967b3.8.1742670737953;
        Sat, 22 Mar 2025 12:12:17 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-700ba7938e6sm8572027b3.64.2025.03.22.12.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 12:12:17 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: tamird@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	contact@antoniohickey.com,
	dakr@kernel.org,
	gary@garyguo.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v5 01/17] rust: enable `raw_ref_op` feature 
Date: Sat, 22 Mar 2025 15:12:09 -0400
Message-ID: <20250322191210.1926380-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CAJ-ks9=GHVfd=iRT73DviOD=6dio3U7wQWLaXAhKr3UG5-ivvw@mail.gmail.com>
References: <CAJ-ks9=GHVfd=iRT73DviOD=6dio3U7wQWLaXAhKr3UG5-ivvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Mar 22, 2025 at 02:24:30PM -0400, Tamir Duberstein wrote:
> On Sat, Mar 22, 2025 at 11:08 AM Antonio Hickey
> <contact@antoniohickey.com> wrote:
> >
> > On Sat, Mar 22, 2025 at 10:16:01AM +0000, Benno Lossin wrote:
> > > On Thu Mar 20, 2025 at 3:07 AM CET, Antonio Hickey wrote:
> > > > Since Rust 1.82.0 the `raw_ref_op` feature is stable.
> > > >
> > > > By enabling this feature we can use `&raw const place` and
> > > > `&raw mut place` instead of using `addr_of!(place)` and
> > > > `addr_of_mut!(place)` macros.
> > > >
> > > > Allowing us to reduce macro complexity, and improve consistency
> > > > with existing reference syntax as `&raw const`, `&raw mut` are
> > > > similar to `&`, `&mut` making it fit more naturally with other
> > > > existing code.
> > > >
> > > > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > > > Link: https://github.com/Rust-for-Linux/linux/issues/1148
> > > > Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> > >
> > > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> > >
> > > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > > index 993708d11874..a73aaa028e34 100644
> > > > --- a/scripts/Makefile.build
> > > > +++ b/scripts/Makefile.build
> > > > @@ -224,9 +224,9 @@ $(obj)/%.lst: $(obj)/%.c FORCE
> > > >     $(call if_changed_dep,cc_lst_c)
> > > >
> > > >  # Compile Rust sources (.rs)
> > > > -# ---------------------------------------------------------------------------
> > > > +# --------------------------------------------------------------------------------------
> > >
> > > Not sure about this change.
> >
> > This change is so I could enable the `raw_ref_op` feature for doctests
> > since the minimum Rust version 1.78 still has `raw_ref_op` as an
> > expiramental feature, and will throw errors at compile if a doctest uses
> > it. Is there a better way to do this?
> 
> I think Benno is just asking about the extension of the dashed line.

Ahh ok yea that makes sense, thanks Tamir, sorry Benno I misunderstood.

So the reason I extended the dashed line was because before my change 
the dashed line perfectly aligned with number of characters in the line
I changed. I figured it was supposed to match the amount of characters
of the line.

Giving this a deeper look it looks like the all the other dashed lines
are maxed at 77 characters. 

I will update this.

Thanks,
Antonio

> 
> > > >
> > > > -rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons
> > > > +rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,raw_ref_op
> 
> This looks correct to me.
> 
> > > >
> > > >  # `--out-dir` is required to avoid temporaries being created by `rustc` in the
> > > >  # current working directory, which may be not accessible in the out-of-tree
> > >
> > >
> 
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>

