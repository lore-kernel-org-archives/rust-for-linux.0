Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65AA40683C
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097549; cv=pass; b=UG4Hb4DUHFY2Hm7Yhz0CrTdjKysElfy/wowk0xqG27QpVKr6SMf0UeCWz9EQSXOQwBqZHbhuRtk5HQ/W7N2bqku/D51ixVt5T9HvVTQmGuUFPg9H1H2NXI8hUwodWsU2Ouuxwy1lCut1JCo3pCYcdDmaD/eppNTPFG9tdqtSElA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097549; c=relaxed/simple;
	bh=/YmVURK0MDp3LHoT2Hf1OEAZRy1gwpXJffVWgEOo8oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6Fy9/3NsFXm+AeIjkLdUQ05cBl++QOxOxe4fC6hqq2m1pGOh4RbYSv/sb65YtHQcRkzAaq7jMal2NBJe3tyklgj72fwLuF2/b/xaYKorKMb70OAZM9EEt1JB42DKCW6E7DOmWJZwJl2aHX6M/icfYBotmumdto4UTVhKaVWHbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBjj6lsT; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBjj6lsT"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304da3b4508so702896eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 06:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781097547; cv=none;
        d=google.com; s=arc-20240605;
        b=GEkcVf85tjibdhwa63eVURiMA93KHNbzPON5C50zVXWIBWStAd/uKAIiy/CFZzUe/Q
         e98RVjD+LvBJpJNNIrSgwgQWrDv/4koh1Nie6Hi6+NOv+FN22aqUoEI9n4zO32Hrt196
         yYeN6HGxDrAdncYxovHXMmQ8Y9R9zg6tjMzTQQoiXOm/S7Ak6CJep1NZ2+wYYOuRwXXI
         jf04j0hdnCYc4sNIbB5IFX/pPh19zBsPgNyDQi628QB9oK7jOwZRBPyyLgljhZgIoLc4
         vg7EQK4+XlFx0/0zyq6CU0zX3lJStZTF0Eo2Jca+VfE6bnsVUoJMJuZ7VYIGMR+t/nFn
         L8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h2Vk4rSVCosFIh1AvgCOfAqs7WWptxzKC/NrQJphsHI=;
        fh=Bb17wdwfJ1LJcQGX7FIkwgND7frAjqpiZ6bPzaKSOqQ=;
        b=kxNvoX4X3mG5eSciu5jMpfPFkN7/WKfYgDqIyPLFEUVzpOzZ44FuMLgEWGqenDHkuI
         TOonPxrrRQtFWalTu18NHtFaPfgPScRvPmWLf29viGhIH1aypdad86FSCiub5mp+XQMA
         uUg8L7qgfPtIBWPd8TCLXc1PYMvO8ws0Ej8tfSAZOY5nyvB30JMZQhnxecS/rJtnw8Xd
         uUVkKHuGEr3B9GavBlU48ahAsmMcqIzMNNKtcyA2T/ol6afPksOO0J8FXvYcDFj99B/F
         +ocETUFOcyAvNIw6hdbkN5cscpHSN1rWu7swwjtfWpjpjGnubpUjH/Ipz5QAOQfUkodh
         UGIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781097547; x=1781702347; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2Vk4rSVCosFIh1AvgCOfAqs7WWptxzKC/NrQJphsHI=;
        b=mBjj6lsTem36Y5xvr3oWO35MJ20O6TJpUY2Cfjj8giQGAkse3vgwU40aOcsGea13WM
         o88hggX4lYj0QwWcxcJ2DIMRxw8ahxacC/U+5ohxLoCUp+no4syPvS5wAFWVXWD/FzMs
         vI9DT5GXsVRzoYisZ/RTmjOr5Nf9jvz7dMTZYlJk3QI75qacfxGr7vBx6H5EKCFGsbSn
         1mtFAPtclCesfZeYVetn20AqLEyPu6oDpIM+Cs9jJZIoL4j4IJcJlEWzNWYaliGvd8ZN
         a6MRPQFJ4jC8O+BgVSqwvq1wf/NFJYefQ3gTVSRk8/E6v7TwS7W6X3masNsEF5/0rIOP
         ++7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097547; x=1781702347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h2Vk4rSVCosFIh1AvgCOfAqs7WWptxzKC/NrQJphsHI=;
        b=L3NPL+ayBN1G2WHuV+VWlOYn5wvhLb3pYsbHcSz5a41lJpg+HGIxScHRoAX1ZT0TUi
         xLA7PkLuY6NtdJZEIvR/jkVLFaBqsTqrR2VJ8C8IKXiaWnL9UOHgDQSos1xFWbSveTk6
         F1H7z42tJBFbsEB93BBjWTQt8bkRGh8UeSerNeERkVJX1knQRmjNzpV2S6O6KAlt7+v2
         6qrkUzwSWPQq8b+HFfgZG5+rYiP8n+6AgoyXQ8qmIcgFaE2h3U2SrycYKiPtmORC4TF6
         x5QBYNXHMDs79iwY1KCC8DultX4Dpean0SG0FHNxboR7j70tTAcSD9cJlotoOg5UrGsE
         9/LQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yLHp40Qo8q84VhV6oGMgRp+wZ8qkrWzn5LyCn3V6GnNb7PB0sFTtYWPUdnmhfZDwcIB4HrGob27fhIwF1HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiQZ9w94+Mq3mkVpy0lRP6GNzRYFc3XKNiYtl9z1eMkOmAUpH4
	ZhC+mO2QuNXxidPgGh913s1II+Jz3Ogp8njSZmoS+gk2QxAGg8EB6SJfInbjLlSdGi8ckYYtZT4
	/GvsAjm6c09UmksJzRgWQn3lf7swUJ98=
X-Gm-Gg: Acq92OE1MXGsQpu57EV4iVpXzGGUTM/cNgULKPsQ9EVe3AQbBuBz3L3qCvdVoRJsnX/
	EJGV7z4YESMpQk9lfDrF4dWbF5MCutSyRc6B6DF9M9VV3EDTi2meBET1UXwONra7afHLGdtujPh
	LisenJDJDzxk6IiFdj9R1um8AlEa3hbk1JD36/+2MRDSSMSxc024OdF91O7HtGIEiiuoBXVUDrt
	d2GfnhLtEgUi+abhQD8Al9ZfZuiZdpff4INh83WRO0l4Qc+7EgV0g4uBqsgxAzwv2RTT/9DLiB4
	EQ3DdPOyVGr7ubn+wQHPmc0dMMZXvT4IDc6i5pJVx+ygFzTldJD0PSWv/YbI5tM1k9TyZhKttuE
	Fj3/FJX18gi7jNym5Ixf/O+fhSPgd91jj1WOYwnfQPX4G
X-Received: by 2002:a05:7301:1e4a:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-3077b3668c1mr7212725eec.3.1781097546906; Wed, 10 Jun 2026
 06:19:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509101939.27108-1-mo@sdhn.cc>
In-Reply-To: <20260509101939.27108-1-mo@sdhn.cc>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jun 2026 15:18:54 +0200
X-Gm-Features: AVVi8Ce0AUySVEkoo7wKF84aAmre-48CnOK0Dpfz19rQsNTXlYuYUWWeQqyyDcE
Message-ID: <CANiq72=p+NG_JRuDBJPPtN2QkmFGJ0BuFNMWnQ=Vg+v8x9+0yg@mail.gmail.com>
Subject: Re: [PATCH v8] kbuild: host: use single executable for rustc -C linker
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yoann Congal <yoann.congal@smile.fr>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 9, 2026 at 12:20=E2=80=AFPM Mohamad Alsadhan <mo@sdhn.cc> wrote=
:
>
> rustc's -C linker=3D option expects a single executable path. When
> HOSTCC contains a wrapper (e.g. "ccache gcc"), passing
> `-Clinker=3D$(HOSTCC)` results in the shell splitting the value into
> multiple words, and rustc interprets the additional word as an
> input filename:

I have been taking a look at this, and considered applying it since
Kbuild is OK with it (thanks a lot for all the work during the
different versions), but I am not sure if the following bits are all
intended:

  - Shouldn't `HOSTRUSTC_LD` be documented in `Documentation/kbuild/kbuild.=
rst`?

  - Why do we do both `clean-files` and `CLEAN_FILES`?

    + In fact, should we do it on `clean` or `mrproper`? Nicolas
originally suggested `MRPROPER_FILES`, but this is on `CLEAN_FILES`.
But more on that below, since I guess it depends on how we treat
out-of-tree modules...

  - Was this tested with an out-of-tree module? I am asking because:

    + It does create an unused wrapper in a `scripts/` folder in the
out-of-tree module directory (i.e. the one used is the in-tree one) --
is that intended?

    + If we remove the wrapper during `clean` as the patch currently
does, then it means we cannot build Rust host programs in an
out-of-tree module (because it uses the in-tree one). Should it be in
`mrproper` instead, or should we generate a per-out-of-tree-module
one?

      While I think the kernel generally expects that the same
toolchain is used for both the main build and out-of-tree modules (it
may happen to work otherwise, but as a policy it is not supposed to be
supported, or at least that is what I recall I was told), I am not
sure if it applies to host programs. I guess someone may want to use a
different host toolchain vs. the one used to build the main kernel,
and I guess things would generally work.

  - The `filechk` could fail if we use Rust host programs in more
folders later on, i.e. if two submakes run it at the same time, and
one at the end deletes the (shared) temporary, then the other will
fail if it was in the middle of updating it.

  - Since we have now `zerocopy-derive`, which is a proc macro, I had
to add a dependency for that one too like the other two.

Some good news, though, is that the whole `clean` thing made me
realize I missed the `mrproper` for `zerocopy-derive`, so I am sending
a quick patch for that.

Cheers,
Miguel
