Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3417145A05
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771168582; cv=pass; b=X9sGVppv+fYi/ULO9QX7IUmyraXNUBQrT3bRnbs6CAXRzF6OxQn/Gy6WwjkaFSheyOVO43HYtOCOBwwsZwYXchiGybzntAgUOpRZeP0/ALii0mc4Jl1sT79P0TLVu367iYCFg1G0f+/V/dNRa+gWU9BZv9cl+QrNRZeFBjzfzjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771168582; c=relaxed/simple;
	bh=AL15Mh9etBWPE25EFeS4lQD2/hZTmGlq6fuqay8J0ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XocwMi3rooN51S6ZqVQOQDiVdEUnISGbkDtBOXKevwujHiiKchC0aRjgPAWIqgpjAuNtuXULYQQfW6sJcVfQXaymJppQ/VPSBlztZlU6E9aIn1y6RqW90yf9mvW3pOfACkXUYXuDn6xrghkVcDCFByiC6eWb/IQS7y0lKYlHIoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zfw+p2cz; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zfw+p2cz"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b8095668ebso182417eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 07:16:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771168580; cv=none;
        d=google.com; s=arc-20240605;
        b=h6EjgOlcxXxEcSNywWH28MVohCK0FF8nRbTWGFLFWIDP/7Q9kBfT4UpTQR9Jo5ZXp3
         5hJkSCGqDPgr9iJ6Xrcd06bWx+AmL5Mnqhviw+fP9a/eOlD/2OCKaQf5MF9jpuYYC4J1
         NZ2X9/sPRrhOtUFHOHaT3eeS611O6EgYDyb8ef1U6lv8+MDEudX6O/qM26ejtuyhsrrs
         +t6NzdWKb/68EYQmeacLhUoSo5arkV4OPOh+MyiSKgMOj2p5htcrFEahhUxnWOwDbJBm
         ziGmYA9m4HnckbEqtKKjtafiKzn+HGFKtf3F8IGaHbsCafvDN87fvRuwdegpRYsHuLsc
         FKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QH+Nffj151vnOrelt29CF9sRyMIqor6D8vmVbazV3k0=;
        fh=joADRZa4Z82rSGTAjS7KvH9ZP/cs38Ev5yFknNbCX1k=;
        b=LiMoGo1xf6spTsNXJ1uFIxK1dwBBRtU2xOmRObpylz0PZUkxYADFbT/XDJHLUBX7bf
         gTTT5ggeX5M4+IYqg+EnVsmFZg8a+fqF08CKQ+Lx5Bny36ShU8jD7/7Ww9yfuWaS6B85
         3ieSmnn+HWPq9LPA1pDRO7QijLBqtI2PBYBxzo/kJWqKPo6sN4Zvwrr0jOSW81OZba7k
         Fj1wYbnIQiQiGsgyuGkWAmLu2lmpi0hMYFtOtbLY7NacoFg9RO+7YjnQ4WRzATius+Qe
         3YJn/d6LrDZPXb+fQh4RUbwNn91WkjbKlZOut9iEA/NxXV7tRI5ngU0+LVw9j/Y3N1Vg
         Ppdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771168580; x=1771773380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH+Nffj151vnOrelt29CF9sRyMIqor6D8vmVbazV3k0=;
        b=Zfw+p2cz4fUIoYP7vD73uMY/khkMUDey7/g/Z+R6D1YjF0nFBOgr/QbT/DDVAPvWd8
         PsQ8S32pq0MXsoUC1alWWRSD2eHCJ4umiAzvKChLg8AIIbvlOunXeOLUhAVgzZSpDzNb
         GEgXmIG5F/BnbOD017du2yeBtp1263VI41NqXkwgmPKtZhFilMf26NRnAAqqwM/72QkI
         Yq8xA2OMMJb8keXATDeb6BrPyLAlh20rCJkMLagkm9eBUAYtw2H2YtZ+Q6wPv/AvyuOD
         OqYjFaunR5Uj2ieXrwEQIdNTMoBbUcUNOCoZh36kMFqn/2D7cv72PO4NGftDGOmaPRgP
         vAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771168580; x=1771773380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QH+Nffj151vnOrelt29CF9sRyMIqor6D8vmVbazV3k0=;
        b=M2gR6HFEx3dc5YuwoUW1f9wagm7DhyNmwEVH1HxK9r6+OBIJxd2ISHYSsE1YgbUhdX
         DOL5BMPzTMewOh+x96W1nJHSU2FjXW/XPuQuYIRbqLBRyIt0v92aPN7381wszbi/SVho
         f/q94Ku/gToW5uYuhuFAork+T6H4LTRLYpmtsD6zLphAq+oCi0NCSYEfpBaY2GPpMhsg
         ziP2Q08w8QfqME+8McwU7KyZqtEDH1H0M9WVOGKHD+0DpcwH2CC/FIXf3Mt61McYotIP
         zatZTuuSIDeu7BOmn3rzQyEsuVxXvMFi38c6Qvl6tfGNFzK/uCfT/3fAi70C882rcVD+
         X0Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXhrgV5h6zlGVgkDPkZvKYbAjqjCLJr7MfE2WWP9RkkZ4lEnJCyipTiVMeO4u8H+cloTz46mjqLf8niawFlBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyah6qVXIOew3Wqr6E3Wp0LaIa5UhaYxxRrkWKCt4+HlB9lnSpT
	C93KTeEdlGiwCcAMuCSJtBmuvAP3qLpbXYGnvWuqMsxgyWbPIcW7NLGFo5uinUmj6rhDZkouThl
	giw9UqcOLtzmK1kYvtcm3iW1B4zAb9hc=
X-Gm-Gg: AZuq6aJYS0NA4PNC6pwX9TG4aVTlUWpreU01SN+V25uVNel72+SeXnLYoHOV92n58pr
	al7hEQk7wR6jjKNePf6kdozVHzgCfBHJREbvF1AU7gtvEr6F5rWa6YncFbf0khAEeSbUGqmJ8WU
	0KWButV6Qa5edJRTgtj93xV7/zp3DvHFeJ9xaEYF4SOmW56OJs0g5V51SmoWZ5YKKsGsKZ5txYg
	dV5zP+kXFjgh4Uwc9uk1uPI7qERyGKYk0kTSUnXU6gcXa7IHoW5l+1p0tW91q/LGQaqkeOyShYU
	RInc3QXvGLTmDdquAkd/bBK4lOEje1Oqh7Re/0TZ4UAu1wzPaIfzxC7IbXxJFdOui8lKaF8KZY7
	aRLnpishB7MxraB8H6st4TNdcMLRl+/TXqy0=
X-Received: by 2002:a05:7301:9f12:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2bab9fdaf9emr1894000eec.1.1771168579864; Sun, 15 Feb 2026
 07:16:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214053344.1994776-1-gary@garyguo.net> <DGEM8AITP519.149B3IVELY7HA@kernel.org>
 <CANiq72kt-it2y8iAR6uA-EuJ8pVygwvOV70MSd5+vYwq1Tp9Bg@mail.gmail.com>
 <DGFHJP0MN0EN.254I1QVHR94VA@kernel.org> <CANiq72=+orB+-sTAJHiPQmz431+pCg2S5E9NFSbuh4NNhppfLg@mail.gmail.com>
 <DGFJVWDJUOXK.27766P8H081G2@kernel.org>
In-Reply-To: <DGFJVWDJUOXK.27766P8H081G2@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 16:16:07 +0100
X-Gm-Features: AaiRm50EtmQn8PdExABeKpESrNCWxxBBDWYKus4Tb3Po-JsjqXGy43eCyy0P354
Message-ID: <CANiq72ktXTSsxKHcX5eNGf-6NR-ySXf9CX0M+gPumzZxVVufow@mail.gmail.com>
Subject: Re: [PATCH 0/4] rust: add pointer projection infrastructure and
 convert DMA
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 1:56=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> see it land within three weeks or so

That sounds fine -- as I mentioned, what I don't want is that we land
patches like this one (i.e. soundness fixes that require a new
feature) with the urgency of usual fixes, but rather more on the side
of that of a new feature, since they contain one.

(It is not so much about this patch in particular, it is more about
trying to establish a pattern.)

> Ah, I thought you already know that there is no rush, as this topic was a=
lso
> raised by Gary in the last R4L call.

I know, but Gary finished the latest approach a couple days ago, and
it is now when we have it in the list. If we could have used the lint
approach, for instance, or if the new feature was smaller, then the
review time for the new feature patch would not really matter.

So I wanted to make sure it was clear here whether this was urgent and
how much, and whether we are all in agreement there is no known UB
somewhere or not.

I see Benno has just written a very useful response to my question --
thanks Benno -- and I agree with him we should add the summary/context
to the commit message.

> If there is a potential bug (i.e. code that is broken, but no user experi=
ences
> it so far) then I usually take the fix through a -fixes PR but don't flag=
 it for
> backporting.

That sounds fine -- my only note is that we do our best to backport
Rust soundness fixes (i.e. unless there is a reason not to, e.g. it
could be that it is just way too much effort and the risk of getting
actually abused is low).

I have just added this section -- we may also want to add it
elsewhere, e.g. the guidelines, for more visibility:

  https://rust-for-linux.com/contributing#soundness-issues-and-backporting

In general, if code is actually broken, even if a user didn't report
an issue yet, the stable team also takes them (going by the things
they usually pick). But I assume you meant it more in an abstract
sense of broken ("conceptually broken", "theoretical issues"), like
Rust soundness bugs, yeah. So Rust soundness bugs are exceptional in
that sense, i.e. we nevertheless backport them even if "theoretical".

> To me a soundness bug (that is not yet "abused") falls into this category=
 and
> receives the same handling.

This sounds also fine to me, i.e. we add soundness issues to fixes PRs
in general. Here we ended up needing a new feature, so that is why I
mentioned the review time.

It also means that for something like this, that contains new code and
is low risk, it may be a good idea to mark the backport as "Cc: stable
# After a couple weeks in mainline" or similar to get extra testing
before it gets backported.

Cheers,
Miguel
