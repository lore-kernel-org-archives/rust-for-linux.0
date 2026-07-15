Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60679280335
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 08:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102823; cv=pass; b=FRZYiUzmgbUQdDIu5k6vOF/Dt5DNHOLbAWbJ2IuCylhB311dDzjDI+J8VGcD+HGuoJxxEODfHzgbKBvll5xdG2pIdirp/GX3HziMk6oKbsL+TcRIiCLHS7fMfI+MyvTaTZ3ZsFmhLEu2b2Cdijpgtzk/TA+fFVboexwsObKeAR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102823; c=relaxed/simple;
	bh=anX8UaxJ4WrYOir1Bf7AqZ78Tml7E4ZtoJ1AaNrJv6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGmJWP58pHRiUYaYzSRIPAw3tpyQS8kItCYjfHws9homgEbBqa/I/RY61rMHWqlvqfNauu1XoJiqI4P25yyPp0VCi+q92GEHUa8TcCz79+1CqH/K7Mu4vpneMRw6s90gOcfnT9IS3OAExhLsU2zgoNJAhxb9Wsk/9P7SBs+ktXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WwtPdZ2R; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WwtPdZ2R"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c7902f47so44167935e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 01:07:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784102821; cv=none;
        d=google.com; s=arc-20260327;
        b=pDAzRPi4dPnc+ag4H9voTly1yT2GQsNvuBq21B6My3wMk3KbBTrnVXzP1Pa5nmUdQA
         PmUJMmyJDJUgFCvrDcjuVt0mQg+tJQJUpf3dhem3mbXmauA8267S5bCCGvcTQbVjBU99
         gJ0ncW4vE0PvRCIhnKriq/33fDHzPsZ6/5AfuLbPcHzWLitnzAxyy2GBpQ/YbrfVws+z
         hbw3DrLUuuUx2nJSg7XFeSZppPkzrVvXkEYrWhShqtOwwUUttaIdPq0M1l/M21M+sdQ0
         0eqA0UBQ86CNBMFSDYp5VT60tyI7phvYFb9EOEg/mfjJ2rzvcwqYQmVlLKhhz1f1tEw0
         FgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7grnnCCD4sCgZ0pN3Sf5LRFWY9qV6BVxBPnYIus15LQ=;
        fh=NhWWbL2yrYyIFUr99c/xfEQQ/27CPYZ9yqm5j99Ntw8=;
        b=RVQo2z4Xb39uDs1ElNv8SEJC1kuBdLY9+RrXhGRhQUyKRfQNgtJ+2H1HI6y4lu2Nx2
         zY+33WByKYiVGvY/R+1GRkyWrjE9DGw4RjFFDbrizOHt6Esl7IkWsy6iYpvLjeQwjfoR
         i3sET0fxeIKk4z5J5puw5lLA/wfhmvkaKUAPUtsHQPyoDnFoWfzImOX8K+N2x+S4y6z2
         jjvY/j/S+Ztl3o9mSLv84sj39g5+dhlgUVkPfC89aYlxtnTlP2POvSZEHaZjibsgybwp
         xkfOpN7XHoKTpoXzm25mZ2uO0jhZ6v0wxmceHhfaw2GdhmMWCYi0vvIwnVXjJewznaSZ
         rd4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784102821; x=1784707621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7grnnCCD4sCgZ0pN3Sf5LRFWY9qV6BVxBPnYIus15LQ=;
        b=WwtPdZ2RRjzeQgp2doynT9k0f9sAhiKMg2M9YnzjcrhMfZiabpgtwJNRPNL/+50WRE
         jUDd65qcDuo9LP5jG2lIGUZ3RJ6KDwCHQL7eBXtebm0N0+/V9IEabvp9BPTGShILYKwu
         ygOD4TlrPS73hrgS6yIkWQbJJptvvmxZCI5w0tqoadrWXOcc9VxlW6+XVj5obbf7c/1k
         UDvMnRHG1PILm5EdAu+TlZnPFByFex8/Q6gHY8O1anfbxo+jNJ3DD+lCx7C58QTA79FR
         sdUo0KSjtIcvPMJrBrcDcHsWE9YXZg6vSxK7JpTrxdlLpop555z0zKFLiV5AqAXhb2fn
         tzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784102821; x=1784707621;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7grnnCCD4sCgZ0pN3Sf5LRFWY9qV6BVxBPnYIus15LQ=;
        b=SkdOTZj8BRSRPSqA6ZsQJo9gQ2h4Avr3/Du3VaANUzzzDN4JvkeokStyyxAIVH8HT8
         YhDAH0oVNqjei9065zRrZ9pTPIuxOzoiIHmn+tbwuxbEHmQAHdv/sC/ORhWKuRtKpJFM
         aMUiZrYOjWbzaEhbmkXzgdNmEz1LXlQoNgPoIfgfiMAN9gq1JMbmHYTYwsdhZnuKubto
         gO5x0O9eWG5hViaHnKoNvsoYRYkKlBSIBsZRfpmqPtXl3XpF0TPWNEL+Gv64nplcatqi
         /Juj9HPEVQeZfCj0cnXFpCLNnR+nhfVrfNwCYH49d1bkzVawSJyP4vyp0ByTm6rs8SIN
         eXsA==
X-Forwarded-Encrypted: i=1; AHgh+RqBcCl2RETamK345VQdVKrzjreAuT6zf+XR2F/NrOCzdgEi+r6HBYfR2CaW+9+qc2Z6iYVMXZkCPZb2jBe0lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1QdRKRQ0tgFDSbFN10tMC9KpZzcY9tLyn+mGK5G0S0d1w2P+S
	cZGAWDr/tPco9+/1D3adoTaMpw9pQfhjXvXgy7eehPwoAcvUmeXpob7YrYHcM08r3U2VVN9Jm/7
	bNuDF+/pGH+FOlHUYs1s2hk9lwDBthY1y3/ANLPBE
X-Gm-Gg: AfdE7cluDkQbU8+yJwgo0DaZtL8/UKtQXeMINDF/XyvspEPy61/egTpBKQ7kpMQcvml
	Qv1UhfUEopRZiom0kOb0Ei5Y0ZFqAWUHuh6bLlWXLDLpW+CFvYkmoDIeOvB+G6i7OZvMRn/3TvR
	EyThGvPbS2tFGZvLrwS4/G/koKPnELuayn8FObzwzdSC3FYq2J74WhIDGA80NlHja2in1dDOgx0
	+vXUdruGjhHoABTcjWEv5dcGFid34fN+hHDtLs1lyiCAbT1Gqvh0HGWuRu698QFpPzE7COeU9x5
	O+KhZIwoRp/nkUNszj+g8/E7N/M=
X-Received: by 2002:a05:600c:8483:b0:493:c8a6:b517 with SMTP id
 5b1f17b1804b1-4953c3944d9mr18980225e9.38.1784102820014; Wed, 15 Jul 2026
 01:07:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783456063.git.pgovind2@uci.edu> <f56e1010822963b2f8133c63de47645834281007.1783456063.git.pgovind2@uci.edu>
 <ouf2qqkiqgvn5yy6umr36ii5ltgacx3qthyhbol7ly3qn6lypv@pmkv27ngsbcf>
In-Reply-To: <ouf2qqkiqgvn5yy6umr36ii5ltgacx3qthyhbol7ly3qn6lypv@pmkv27ngsbcf>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 15 Jul 2026 10:06:47 +0200
X-Gm-Features: AUfX_mxcfDa7WSudj0Q6zu8VDrJ89ChidSgbwBc0KxRCpnunkL6_Q7YNcncqaK4
Message-ID: <CAH5fLgjHWsVc-o_kv9=CBPVWqHJP_V2kRN97C9b+6aHt8agb2g@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: cpufreq: Fix temporary write in Registration::bios_limit_callback
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Priya Bala Govindasamy <pgovind2@uci.edu>, rafael@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, ardalan@uci.edu, 
	zhiyunq@cs.ucr.edu, dzueck@uci.edu, ytan089@ucr.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 8:11=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On 14-07-26, 20:30, Priya Bala Govindasamy wrote:
> > Writes made by `T::bios_limit` go to a temporary on the stack instead o=
f the
> > limit pointer passed by C.
> > Fix by creating a mutable reference to the actual memory location of
> > the limit pointer.
> >
> > Additionally there is a creation of a reference from the
> > uninitialized limit pointer which is unsound.
> > Fix by initializing the limit pointer to 0 before
> > calling `T::bios_limit`.
> >
> > ---
> > Fixes: c6af9a1191d042839e56abff69e8b0302d117988 ("rust: cpufreq: Extend=
 abstractions for driver registration")
> > Reported-by: Dylan Zueck<dzueck@uci.edu>
> > Reported-by: Yuan Tan<ytan089@ucr.edu>
> > Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>
> > Assisted-by: ChatGPT:gpt-5.4
> >
> >  rust/kernel/cpufreq.rs | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> > index 58ac04c650a1..0f9385d41b64 100644
> > --- a/rust/kernel/cpufreq.rs
> > +++ b/rust/kernel/cpufreq.rs
> > @@ -1349,12 +1349,12 @@ impl<T: Driver> Registration<T> {
> >      unsafe extern "C" fn bios_limit_callback(cpu: c_int, limit: *mut c=
_uint) -> c_int {
> >          // SAFETY: The C API guarantees that `cpu` refers to a valid C=
PU number.
> >          let cpu_id =3D unsafe { CpuId::from_i32_unchecked(cpu) };
> > -
> > +        unsafe { core::ptr::write(limit, 0); }
>
> Maybe add a comment over this on why this is done ?
>
> Miguel, can we get around this somehow ? The driver is supposed to fill t=
he
> `limit` field and not use the uninitialized value.

Why not just use a return value like this?

/// Driver's `bios_limit` callback.
///
/// Returns the limit.
fn bios_limit(_policy: &mut Policy) -> Result<u32> {

Alice
