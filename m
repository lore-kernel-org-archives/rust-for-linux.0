Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359584A21
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 18:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767379230; cv=pass; b=ZA60cwxwTnY3kgSuOY8iwZv6tDQwhu2sTwKcBOePRW6q5m2gKt12B2rdwd7pfCbMUSHlNN9Iceh4wPrurF+Vn+0lGxNto+cBZ7u3rAgMLPbQSwP4Rap2bgFAdoQZI4fVahlh254+lCGcPoy7bNQ8J2YKySnUkF7Y7USebdD47n0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767379230; c=relaxed/simple;
	bh=g5sHQkVrKOsKroO8ZxN4MIgW5nbWecrAIkpz6JGIwjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bo2e6qm7u3CjDC20Rub8iNU9Mhrwa0DKCjaJUZpatkjnIjn5znEjUj1ky3QzmRw/J2VQPdw4MUTZlpQerin7JIv8jPsNb6pbUNYNWBCzarUCOXpLJVIIk90v/syJih32DTrsT9qqiSMnGdNU/p3ghcg5zPQI0b7mH+piZCGfmoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hdgZJsYE; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hdgZJsYE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64b72793544so539a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 10:40:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767379227; cv=none;
        d=google.com; s=arc-20240605;
        b=dCq7LsUXwycqzd7aPhOSak4h8HpOo+oL+knTX9Bukf404frin1Eszq9Wn89zWu9C4U
         JlWj1bcOdq/cK8kDyI+m2+wLS5Q12Fj2X9UTUNUl+rVEYcaK3OHCeeXhqqJdQS07Qfl9
         gENcI6fxFmKYIw4E4/IXAndEFX/QzVbcxVDYCDn4nGo1i4/cjqeWmVsC7t7c8oOToJuA
         j4nf+sjpCOf7Ddm+TNey+IJFm/uwXg5ilnWkLkndTHXZPxx/k1XNy6j4MRRpS67g+e0o
         Pg75Lovd/hJiTpSG0Eutw+U3FONDvw9ItBYgldEfId7EuuXmY3r3yceowXx5BXeuGRT9
         48dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g5sHQkVrKOsKroO8ZxN4MIgW5nbWecrAIkpz6JGIwjo=;
        fh=WFG8XKFOoebevzI1AAJSwx5+RDAfHXn61bmQRUh9vBY=;
        b=X3KO4q05n+mTsccYo1nQN9hmKS9CrnEM5b4qB7MDEgfYhlH1YjIKACSkYbkxE0L8By
         uILGT/aRXV0NzyUuIznK1dTx+qAew+381hZMDVp22CSbQTUAEXBBRCHbDR9AHWS53bz2
         eSEUyTGksLE6Z84YaMH12/c3W2k/n7n+bYwRqYsNLSatCv6217z4qxlXrdixK7XnDD2v
         Rjy5qzWlLooz6fVbNG750A++QDAymB4xFvNLU3ImuBPKMDrBgf79mI4OW4mptDIQQB/N
         2uYIeDONfitXgR8tt5jCGP45whhtQ4E3OdMCYZGeqXNLQ1Mi1OZa0eXrnWdH7HPdAG96
         BaDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767379227; x=1767984027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5sHQkVrKOsKroO8ZxN4MIgW5nbWecrAIkpz6JGIwjo=;
        b=hdgZJsYE2E7NCwu1rFWkeRy05FO3Jznm2PWcWQQY6KLms7Tdvdzwsnmb8e8A94IZmD
         vOh4+1lGynA0MGBQMz2BIqoLI4nCffUXILo+RfsqNYO0cF1qkl0XyFCWlfS9QiFats3U
         OqJw19SRnmERj8OEpCGdSykcBmu7Cy8vICjsomLrj68yYDBGFs2xKYyTZrWc6Hn3VEHR
         R0glNc+mVd0t+z/ORoPjsTZZ7DwIuMFGBsz6ubbuqvDTFVPwwOvTJ5xkCzyeamKSGWvV
         mmlIVWHEFhDVFGmA/y3wymrk8KZ+uMhFERwgpHVjUtdz+edVoNaT38v3wfsCGGLXaTXk
         W2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767379227; x=1767984027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5sHQkVrKOsKroO8ZxN4MIgW5nbWecrAIkpz6JGIwjo=;
        b=bAcUoBwIOt8d+ikN85J81sKVQjiVc1vj6dBcouJ5gFYR4KZgJ9IukgNQ4Zqa2mT5eB
         2JY51h3nVqfyhAGp98Fjaa5PG/T0sHY1X2RYZgzvN15LsqQGz/2bMyb+j5hzif3fr31C
         R9jP6KGJU2S7uWApQ00jOXRlGchH4BZ57jq8s+2EM95urNa2bclduMXt9A//bOMOIACy
         WzB7BRci3nQRlF3Op7nNYK4IHz2cBUVHoUZHHQ6vWxdm3F61zhMY1FzATTRhp0X33YZ0
         5u7OO6WLVmu5kLY1wPBONC6HlnR4RzPP6RVSi8F0fWk95dpOt2mdfHGXwWhGmo+s8SvW
         e3fg==
X-Forwarded-Encrypted: i=1; AJvYcCW0AmfAKKggxcOJhQYhfsZqCok/BAMOQOYI19C+mqTp9GzqGpQZEAFLos52TvfS81H5Vc4UtuuXTNSZQxnbcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztC0SuhGSSV0F4Jw/HAHlw9qQ/AO+Lmtm258APKZBZMKuv+3Fh
	Ko/oK44Qh3edIF+q48RoXKdr+U/xu3d2CPAmnLUNXraIviCoiMgZb1Z1uSZvtKMoNrymaMUvPt2
	RCP7Edir2L7SPKGPb1xrwmjcAJW2ZDDzDK7QkxULS
X-Gm-Gg: AY/fxX4fRdpAgLIjsxykjp6VQPbaKeQpMmLazCqzi6XTun7TS0h34QXyckMXogef7WH
	DvG1DTshRVHq5AmYe5LZXDasdFWt6/lONTY5vo/injVY7+rSLONOkFkVW7H66jbzxByQ4CdpEv0
	l2dUYuKsxtsu3xuykuenMhu4CXwIcEel0kz0oVeFKD/BaOX5XtBnYzTX6iVQ0Pfbrrj1Mur56YI
	zRAWymm4Onfe5NwsnSdq2DHpFgdqjsiNoCy9z5409XBkLKMDsNBPeUKC//f08xAeonzLENzmvl4
	1y1cuEjK30GriFxKHr0iJoawSQ==
X-Google-Smtp-Source: AGHT+IGBt7cDhjrnIqZEjatfwjZ501AgsttwfnxWdmgQoGcR4rtQr8UTgkpD92PT9cLinzIkTLYenNB0EkBn8MPjCPg=
X-Received: by 2002:a05:6402:5345:20b0:649:9266:5c68 with SMTP id
 4fb4d7f45d1cf-64fdab57dc2mr1995a12.4.1767379227335; Fri, 02 Jan 2026 10:40:27
 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230-add-entropy-v4-1-fa9485b6d372@google.com>
 <aVUbqo4wS7_47wmt@zx2c4.com> <CANiq72nuK09czKyhZJCy-LLpH5UZ0iB8SBmEMfXDVNu23gybxA@mail.gmail.com>
In-Reply-To: <CANiq72nuK09czKyhZJCy-LLpH5UZ0iB8SBmEMfXDVNu23gybxA@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 2 Jan 2026 10:40:16 -0800
X-Gm-Features: AQt7F2oXRitop1uXNzBFoaRTu2UUqwDiFBKmpa0jSKPshUsRF2utcHIjjnE5uzs
Message-ID: <CAGSQo00_t12z6rWStV3R0kNKFk-oa=dKWO+iw-2_fBWntvJRHg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: Add support for feeding entropy to randomness pool
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 7:46=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Dec 31, 2025 at 1:48=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.c=
om> wrote:
> >
> > Thanks for CCing me Miguel. I find it strange that it was left out on
> > apparently 4 revisions of it. Yes, this should be added to the
> > MAINTAINER's normal rng section. I'm happy to maintain this.

Apologies for that, it's my mistake.

>> Small nit: There are two existing comments in the C source (one of which
>> I know you know about because your text is almost that text). Why not
>> just use those verbatim? Or improve those and sync that to here? I'm not
>> a big fan of bifurcation.

It does not need to be different. I'll use it verbatim in the next revision=
.

>
> You're welcome, and thanks for the quick reply!
>
> > Bigger question, perhaps for Miguel: what's the convention for adding
> > these bindings? Is it, (A) "this is a useful API surface, so let's add =
the
> > functions so driver writers can use them later" or is it (B) "add usefu=
l
> > APIs as they're needed by driver writers"?
>
> We follow the usual kernel practice, so (B), though sometimes a user
> is known to be incoming, so it gets added in a separate series for
> convenience or similar.
>
> But, yeah, in such a case, it should be agreed upon / explained where
> it is supposed to be used, and the cover letter here should do that
> (and you are completely right to ask!).

I'll add it to the cover letter in the next revision, but for now, the
use case is a re-implementation of the qcom-socinfo driver[1] (still
undergoing significant revision) which uses it to deliver the contents
of the SoC info buffer (which notably includes the device serial
number) to the entropy pool.

[1]: https://lore.kernel.org/all/20251213-qcom-socinfo-v1-1-5daa7f5f2a85@go=
ogle.com/

>
> Cheers,
> Miguel
