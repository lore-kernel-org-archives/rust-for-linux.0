Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F59913C695
	for <rust-for-linux@vger.kernel.org>; Mon, 26 May 2025 02:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748225436; cv=none; b=Ymzgw/Essy3T1vu1YH98nAbNiY9rpqFmNP3vprBpyaClnPtYmfEUlxGuxF6wGGaV2ra96bTk0r6iUccf6gQMeqNGgJa1xHbA8fLPe97VPN8OR2EumVcRlTBnSBJmKsEBUboh4sxfVP0wpBXn3MITUnBznnDnJO5lrjO0QfuD0OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748225436; c=relaxed/simple;
	bh=0nbGT2GlXb33Ss9MQ4uxO6gE8jpDPRoMCrJSOOK5Q9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8syf/UAx7OqDXaj9+5va2Crl5sGoMqXTh8EuPafPgZwPuIDKc1soSD+PjlLAVEgEPoAUupsR46gbDi/HlD9jwsXHuu4BmsYrgt9DXIqdfbG/ovO0JDREmvr0HBYPAaf7nMu9H5mWMRpuV4FUUkEjy87IREOnVTajb3j8Ks9x38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbjKst8y; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbjKst8y"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2cc82edcf49so347687fac.1
        for <rust-for-linux@vger.kernel.org>; Sun, 25 May 2025 19:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748225434; x=1748830234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mn/KkI5glUJ7hQ7qi0uM8/HimmScaJn3h59Vw1YH2Ac=;
        b=cbjKst8yh1HvrJF3hUMfrDzMOkrbl0druk9k1nsmK600tCX1Hy0apyG8nuAS9Rr5eo
         Ovrp3Z66KWSRs/3SRPjnyCTj88B6c473VWdmakxNu1eQ9PbGbwtjsem3u2JGs/0ozei6
         1P2V5wjVla+o/Xpd3u8WfEFekvAsqSR4IXrRZLVZfY5NTH93jSb2QJaoEvku4z+HYYjs
         ucGHwKAZS8awi2qRHVzZj8AH3N7QDf94etwvMdlF4SWRnR0MIDsqp98KRBsCdrzqDxqU
         fYdfh6uf5Chq7e5qHUS70Vm8eY9jNoPKGXxhVwtbxvFrOECXJilL9hATazbsqaFWxT8l
         +I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748225434; x=1748830234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mn/KkI5glUJ7hQ7qi0uM8/HimmScaJn3h59Vw1YH2Ac=;
        b=vC/Msu/VniKQAne1hTHpilw2c/WsBDs6t+aRf9mnkilWCUacpjLpIerHqjYWsM90HF
         sCRbhDDf8UfkvIfoMUgVvsGBp5DzInle5phn2Dd3Zt0A95gf3mxdMjXJ4REiM4G+J391
         WtUT4u9b7+bmdokARzDhkZ2wve7EHS3EMzrnnfhvmhp0eT4SLe5N4R8ZzlRdgjoKl9uj
         MQN4yqVVUqBweDqL70Q9wL3BelAc4V16x0NDTlxBUl30sIcLsYZK6I1q5/RVY5hf+uBj
         RRirq4G55VWxaToW5AsmlUw3KLe36Vvx/NSuKA8+HSjkoRGW+0T4xj937dz8TZZJN+Fb
         g0Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWUeNjuO+7uROM9XsdZEd3vOzB3vB1oRe0dBCV2ho1NjsiKLu+cnMuaZmEG4P1I5Olc21QqbMlpJbRRWpntdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YziDW4W0d8IOwE56Kgj8RkYD8HYR6WJLU3oLkrU4LLBnxbtW6Sa
	RvTVr1rrO2uKLC7dVa+avMOq36m3qn39u73JxkD5Js4k+Qj/BG9DF65kGpYjjPAUtUCr3MgnN6s
	xaCrtutvmZxcRkKcm6Kpkf0nmVVD9P4k=
X-Gm-Gg: ASbGnct5GfLNleQjr0JqN8h23ZrIIsoOlqUy8pyl+DngyYr05oACWg3TZmQsiztF/Pq
	puDjYcP9Gg2uzXCfJVvfB1J38pkcwA7ep+uLavxGKb0S9ASxrP78ucfTM24Le74CwdlkIC7ur6w
	aWXn2NQge0kiwcRwE5InjaW2w0k0wLMDi+LuumCMmuuHvg
X-Google-Smtp-Source: AGHT+IE6GxnCgZfQE34+GGdxCnGU4yePgtG4uRtXLQLRBOpOIUwNJkgnFqMM0umpqsY81ZTDyF0GGxbskYdCpBZgnwY=
X-Received: by 2002:a05:6870:4589:b0:2d6:109d:2598 with SMTP id
 586e51a60fabf-2e861dd0438mr4215534fac.5.1748225434078; Sun, 25 May 2025
 19:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aChczAWsPdmdeen3@pollux> <D9YO7XDNV712.3A5HSSLUQIZ2W@kernel.org>
 <aCrwuQP46RFHxYB5@pollux> <DA00X0RTYKMA.2OG25TZ1X3AU@kernel.org>
 <aCsAEJtkCKKhspnF@pollux> <DA03ANJMDOU2.1ZQWA6MIENVKD@kernel.org>
 <aCsX-k0K_jqLvD4e@pollux> <DA04WHRZBBS0.17WRMWDF0A335@kernel.org>
 <CAPZ3m_i8fwsBRJKay72LHT4pEW=eZ5LxCFD=8CYkuEksjjt3_Q@mail.gmail.com>
 <DA3ENUO97I6D.234AA7I97AV62@kernel.org> <aDA4HIOL-g37cvpy@cassiopeiae> <DA3IPNILKRA0.3LJ8DGKQ99KP8@kernel.org>
In-Reply-To: <DA3IPNILKRA0.3LJ8DGKQ99KP8@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sun, 25 May 2025 23:10:22 -0300
X-Gm-Features: AX0GCFvh5ITjv588SBXUFjNEzCG7fOrSzN8qlbEeJ_5DVMpeDB5z9JJe-MCTxaQ
Message-ID: <CAPZ3m_jw0LxK1MmseaamNYhj9VY8AXtJ0AOcYd9qcn=5wPE4eA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable type
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, benno.lossin@proton.me, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guys, thanks for your patience and kindness =3DD

I'm sending v3 right now!

In Brazil we say "Tamo Junto!" - We're in this together!
Marcelo Moreira


Em sex., 23 de mai. de 2025 =C3=A0s 08:53, Benno Lossin <lossin@kernel.org>=
 escreveu:
>
> On Fri May 23, 2025 at 10:55 AM CEST, Danilo Krummrich wrote:
> > On Fri, May 23, 2025 at 10:42:58AM +0200, Benno Lossin wrote:
> >> On Fri May 23, 2025 at 2:13 AM CEST, Marcelo Moreira wrote:
> >> > 3. Clarified revoke_internal for SYNC =3D false and swap correction
> >> > Proposed Documentation:
> >> >  if self.is_available.swap(false, Ordering::Relaxed) {
> >> >  if SYNC {
> >> >                 // SAFETY: Just an FFI call, there are no further re=
quirements.
> >> >                 unsafe { bindings::synchronize_rcu() };
> >>
> >> @Boqun: is this true?
> >>
> >> If the answer is yes, then we should add this as a safe function in th=
e
> >> rcu module.
> >
> > I think it's a case for Klint, since synchronize_rcu() must not be call=
ed from
> > atomic context, since it may block. Otherwise, there shouldn't be any a=
dditional
> > requirements.
>
> Makes sense, but then we should add this as a safe function (in a
> separate patch). After all we already have other safe functions that
> should be unsafe were it not for klint.
>
> >> >  }  else {
> >> >        // This branch for `revoke_nosync` requires the caller to pro=
ve
> >> > that `data`
> >> >        // can be dropped immediately without waiting for any RCU gra=
ce period.
> >>
> >> I'm not sure that having a single function that does the revocation, b=
ut
> >> has this going on is a good idea. The safety requirements will be pret=
ty
> >> complex.
> >>
> >> @Danilo what do you think of inlining this function?
> >
> > Sure, if it makes documentation significantly easier, which seems to be=
 the
> > case, then it's probably worth.
>
> Yeah then let's do it (also separate patch).
>
> ---
> Cheers,
> Benno
