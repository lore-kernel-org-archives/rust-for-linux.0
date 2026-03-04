Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55114371D02
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 12:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772627194; cv=pass; b=drbGC7kz5q0+rvkLzcKQFhKsjhGd5Yulsvv+Oq00XkmKszuyPkw0kRp9Qcpv3bWR+UtiXbJ6cdp2JWGeZCKZa2fcngiJ7NYcXzWjmTtlcZiKa97qiSZs52fcdBhmNNBBSa1cGoB0pCGH7I4TGvMvOVGByuRnzw56wusTvqR1wCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772627194; c=relaxed/simple;
	bh=wtueJCBBCEMMjfOCs5Mxf2bg8BKuT6JfLOlp5ygER1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNbtBvJ2IAW0Q1mAK11RKhTC+MVcmufNvmeCq4GU4bDLF7+RXeghHj90QgjGoFVhJ4t1gBTxS9tPrAlxG8QYTFglGhSf5AGQSLpqP4oN8qYItxLvhxDZEogaLAwrXENJn6hItbXlcOpcqRPSHDbfnBn66f0jr/krxj+dhGKVD64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyFAIxlz; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyFAIxlz"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12734af2cdcso230838c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Mar 2026 04:26:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772627192; cv=none;
        d=google.com; s=arc-20240605;
        b=fdtxtkmpXyijsnAFMH97kyvvY0monCedMYFBy3AAv6yF1V2tWDRXwI/nay4zm4NJsL
         zzwFwwjSjBgq+MpMK/8pA1nfoBexjRAi3+8Lqf1CBOXgc73nyvAiNRw0egGnZrhQBvCU
         vTx3CFdG4PEmIn1FGDBM0KgPFahAOpx40ShcQIYg1zOB6oV6J2IFtcwbU/H4+KmEIGg7
         RCdw0+/nZGlfV4svzhVGmZOED2NIWRmS/JFcpPQtKU+Odbni5nbl++/EXcwsF4UbcZB+
         IjzlGCFo6dGF/AKa5kyYBqHIPMeoAq0zsq6wxrtQLKHsZ3iyMva+Sn7BBOG6UIf8eFYO
         dymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wtueJCBBCEMMjfOCs5Mxf2bg8BKuT6JfLOlp5ygER1E=;
        fh=S2+Ar3tzrQ8RMtks0MMP6Ql+z3WxRo5wxVIQ4vGIA78=;
        b=U6+l31ibelGXy6m7gDJqOnANj9DzmMLWrd9G7TTpi6q0rCUAIo52vrq+NBJy2CoAG7
         ZXhFDXxnK+kMZMy0HIpAH66F6/MjRYMLbXL1CnYbflXYxG/oj20CZzLYx35QXQO1UTHa
         bR7vKF47qdGjB1W1sHzbfn+ke7YJ7cbJ99OOhHysGuzK6ZUL4f9d3HCVbvRod4YGz03b
         TkkZ/Zo16nzUrTZNgCkN3OdtVk4HwXY3DAGoYvCCc2ZZnwTXTYnfEe0DkhtMqX+wLCxo
         WIchzCBPQ1+6tehzTyRrgRJemcqVvz9uv//gFbvJ6tgZl9cXTO5Fd28wbpNKbbmtZhuv
         lxXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772627192; x=1773231992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtueJCBBCEMMjfOCs5Mxf2bg8BKuT6JfLOlp5ygER1E=;
        b=MyFAIxlzoF+lJ/9rciaSgdTu5aTddqbXWcKoVAQ6oTGm8kCUFtv2GutgEfrqc5NHfE
         WvI9VQTmM4alKCtfLA29ImHBiiBxLF+RbKXWFWwS0bHdbFzBgbJqPLulz0u6MvDLiiaH
         zzm9KA3CkmskkPGLxcBy5kdv50gjF14REw8Vtpf9Q2ECdWZipiabqmBUAFxVDgGiw38K
         KwrP0h+bnDLGOnYdw5R2Poer+ugXOdUSV6GhTDXYvFkpN6TnXAV6l4RoFTXHLwuwGJiw
         iUN2hONOzvDE411kZe6uc87Ev/oXEtAMqOnPA21OzqozEIBaJOVB03KwdlbMT0vOZCKl
         VYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772627192; x=1773231992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wtueJCBBCEMMjfOCs5Mxf2bg8BKuT6JfLOlp5ygER1E=;
        b=dFXbmsme0Y2cr/2GqBS3CoxLc5/XswTj6MrCjId+T2xNBpIK0dv7g6lbCXP876UGCp
         pArG+wKNMcfrB+4IIDb01h4pQE6gNAveHWRam2JdYBAxehgpP8UfhZOaIQl5V+XOmgal
         wzezIDj/Go6kLiVgjki1NAob21G6L4hvhXzXBupiBBbGcBCqT/PMhGcLPXJx6s7ydDpP
         eIMO/N/2J6ECyc7irxOyurvMO8D+2mkJQOTaJWBkYCSNHN6rab+p7QaQj5gLeyXksKR2
         /WPxOnZUpKjTGAZNMTgMVXO5xV753sFcRvwo8NURphv+mkqHIf2mh2Cyp8v6nsCKXdQ7
         09Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUSKPpxPYdxxAfxbkN2GpFX0lLDZdc353kVdo3XQW5wGkRnNXqCQuL4hZFFkyQ6Mx+OneXuK6OYBH6bLG6+Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRBacJ05737Zo8lYguIBpf9utfxW150bR76loXyPRPN/Y5AF6c
	zHtuQE5G0YFAcyRxkKLxxjOTtvHOTeMUI4ueqep1o/Brd7QCRc8w1sI3BC/9ydm/t+zQVJRTw0Q
	U6aFfXzQxJxjAwJS/TCjuA+AU7Ib1akI=
X-Gm-Gg: ATEYQzxcJvxKO2cca8rA5TTISIIgl/fdW+4fLSMgvCwKkL+My4x3++fDbwjgXW/50M+
	99lF8+qNcVsArJ0Iy0dL+vlDNmIUZyHZZ07X1yrFX6SGdwRHzY9YweKLeEuOrytXoiA3o1M17M/
	fVZY79EeBgGbacUUNxyEUsk6Q80GJeG3HwC2aUPNp08xcUvJsQ4KpoHj1ta+bHStpmNLEE8Z8IC
	hvuY0Vc6aY4ttHCN/K74T/1RxpQF0bnTaSJ6TMoPw5gQqc7PgGdwmT7JY4ultdqYE68Up7Km6fc
	M3BgBJQbjj4pYdivy29AyNw0dIN8X9vstIDI4GeGL8KFHd7WdNYXzTZZk3laS2nbUf3tzIIbv01
	K9XHr5PBybcZdaLqx34UNff0G
X-Received: by 2002:a05:7300:a483:b0:2be:171c:2177 with SMTP id
 5a478bee46e88-2be311d4088mr330124eec.7.1772627192327; Wed, 04 Mar 2026
 04:26:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302140424.4097655-1-lossin@kernel.org> <aabGlKYNd0CrO7_f@google.com>
 <DGTSY7NPZEDA.27MENGDJA87B8@kernel.org>
In-Reply-To: <DGTSY7NPZEDA.27MENGDJA87B8@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Mar 2026 13:26:19 +0100
X-Gm-Features: AaiRm51LnBoGAWzHTv7J2p-I8X53qmAWI7PHPSJeyTzO5jsiNAGKX0S8c6BsfoI
Message-ID: <CANiq72kNdc7=-uoWXBpxkn2No6-Z0hVnx_yWMNphyTVscsMkUA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: init: remove `#[disable_initialized_field_access]`
To: Benno Lossin <lossin@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Janne Grunau <j@jannau.net>, asahi@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 4, 2026 at 8:00=E2=80=AFAM Benno Lossin <lossin@kernel.org> wro=
te:
>
> I figured that we can't really "close" a Zulip topic (we can mark it as
> completed, but that topic was originally about the field accessors, so
> not sure if this makes much sense.

Using Link: instead of Closes: is supposed to mean that only part of
the issue is fixed, i.e. whether you can "technically close" it or not
is not important (e.g. Closes: to an archive like lore.kernel.org are
very common and actually what the docs mention as the first use case).

So I would say Closes: should be the "default", and Link: is for
particular cases where an actual issue (or message) carries several
topics and could be confusing to have several commits with the exact
same Closes: line.

In the case of Zulip, we can link to particular messages in a single
thread, so typically it is possible to use Closes:, though the current
UI isn't great to see where exactly it was linked to... :(

Anyway, I guess the inspiration was the similar feature from forges,
and perhaps in case someone has a custom tracking system that actually
auto-closes things in a forge, but it is a bit confusing. Having
allowed "# ..." for Closes: or a similar Closes(foo): instead of
reusing Link: may have been better.

I hope that helps!

Cheers,
Miguel
