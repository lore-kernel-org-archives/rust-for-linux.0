Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BEE2E8DFD
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766138681; cv=none; b=XDx4PJetVVCIuZ7qe1Fwct2V0FjDxLs/j9T/PxT519c0Zp1fKlYhlO1yjbDHjOhXsC2eTjSDztoxZHMMn8W7STfsqlBOXfsQrvzkvD6WO+ZS3gk02kz8fTw0VKIW78YtjH2Utlk4M3jA6YIaCED4S7iCGhuDMXHn+wng7JYMUHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766138681; c=relaxed/simple;
	bh=ihMVyDllurToHeLiN93dhlOh8p/bZUYBfmk1fHtLRA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUK95Y5vbj8E2ewRK1cNiv2kP8GxGf1JSyxFUumnDUA0ObOO3eqPwGMMkmK39qABqdmtpaE7ClClQ7Ha6FpRVKKFfa30svEVqpKv2jAeesDfcAJ+aSSnho/499ywlXCcQdb99SxgSeJvHDuIyDwCtRL8LgYRqn2FK+XUePlH16w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JK1vGGt6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JK1vGGt6"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a07fb1527cso3369455ad.3
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Dec 2025 02:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766138678; x=1766743478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1VrxEK+gDnV8ugE5t26U+jWY1Ysmnza3WwUpdmSU7o=;
        b=JK1vGGt6H73ZX0imlh38isbvIAthLBakm1IXpjITZKLC4B8dNL8OlIg8ImxNH3lzO6
         OC+1sGyiUKxWr+CIj2t8+oVaE2TUlpg9XyIPAt8mGlizqHUrobpl9IzHTzywb4qRwzo4
         oD0AkWERaIHnduAXqYnrt5kGgzvGUfqTvnjTaeHl5aNw6sFCSCMsWU/6ixziOrFEBSov
         tX+fKXljIVG3DX2Z+Mh8PVyFh0nJQqZyyVJuxnc1YAC5J9BL1fA1Od4BsDJHus2zXIfq
         cJcwB3OMPR9n26YU1kx54gvEXAWm4TClRg+E1S0a6vUY9r8K++mf797qtNJnOgnW4f3S
         ASNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138678; x=1766743478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q1VrxEK+gDnV8ugE5t26U+jWY1Ysmnza3WwUpdmSU7o=;
        b=M6gAPVBSgCdQONH5nYBMK8bRpiqBgESNO8lcd3FaorMY13ByQjoIBAG9sHQnrndnC1
         +IvxhUgZoUvDijqC8Fv9Bfs7ksFxzbHkfp/b5eRIjbtzdNJxXvjrsILtMRhoZiDkhx7Q
         HY5u+7gJF+XnyAdCnYQ2Oepznofji36QoLRFwEr4p+uxfMxoRq/UCOdV5ueN5wHQL4sx
         SfYj+V/VaJt2CgR3RW3W6qnrKsaeLoUsjdNJ6k/OKmerQYy3hCXKK+kB9Cle1AUXmIFE
         tMPu5V0CdwGAzDrcfZ+dnYA0CbSglbeZqXneAA6HGa6M157aylzq0wICdq+36lmVSTon
         F6sg==
X-Forwarded-Encrypted: i=1; AJvYcCVwJVZLfBuIzNN4DkaNLCKw40LSIj1f37kOh1ViMC0cQzxH204B21UW0YMnqkEhrc5PSrz9XGCq7V6LlGu/fA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzToy50Avwyzs/Q89BCO76qoTU809+UtMOfGZGaRPX2XEul0MGI
	eQ9jvAVTNkVEQLzXlQYVL3ExAyNsb3O0dX6UiX6ChXpMC/xnda79LxTtsgzYsXn4gvGcxCOFjtL
	l6SiED+ZVpGXM0NXchEIw3cmUKfJhoPg=
X-Gm-Gg: AY/fxX6o8XR90kej478pKmTaH8IgLiEBm+AvgWyd6pTUaA6tNi50nauNv1uVWgYfaZ2
	IGpOSOyxU1LB8XfJYuZNmVy76+yurD5rpQWwmqkLWN4KAB7LWnnTpfHXm2n0GfzzyHy78zLbTAR
	kHtHySfiL0lkgCpexoDDr3dB+OZE8tAX+IuxPvoix/E+6Rl7fq0Jt+CGGQMn/BoLG7jVWhzOVPq
	4BYX1eJ1qsoE3KsxcDuMTLowuxcHqhyukdXMXGdT2AL4i0UNql+iTzr6AGAmegg4YfFGqZAZrxC
	alVY7qRFT0UOnVip3C1n/3qggMTg20Mre4hIDGM60oB5Xl48ZkBaFGJJCCs3wVXUNQaWX7Jb7B8
	SXKZu6y9nkjOnIQ==
X-Google-Smtp-Source: AGHT+IHtUE602FvgMsT8GOtnJov33zxYYov4x3dhU+tYUl3Bs4Jcfe4thjZtl5QPHbP1Vrw5LKSSxaJg77FzcCaSzio=
X-Received: by 2002:a05:7022:6294:b0:11b:98e8:624e with SMTP id
 a92af1059eb24-121722e11famr1344359c88.4.1766138677829; Fri, 19 Dec 2025
 02:04:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219092537.1227513-1-davidgow@google.com>
In-Reply-To: <20251219092537.1227513-1-davidgow@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 19 Dec 2025 11:04:23 +0100
X-Gm-Features: AQt7F2oEuGq9y_76Xm5CdUbTK6H7VwI7P-ClCTr86yLdf4auZUg3tY0uCinYqK0
Message-ID: <CANiq72=ZKGXpsmvKHGsX9=tr9Tbdkd-7baJ-RN4crBdXkcB6Yw@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: doctests: Number tests by line numerically, not lexicographically.
To: David Gow <davidgow@google.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Guillaume Gomez <guillaume1.gomez@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 10:25=E2=80=AFAM David Gow <davidgow@google.com> wr=
ote:
>
> 1. Is it worth renumbering all of the tests (hopefully just once), or
> would that break too many people's test histories?

Personally I don't have such histories just yet (and anyway the tests
generally work), and even if someone does, it may be best to pay the
price sooner rather than later.

> 2. Is there a better way of doing this in Rust? I can think of ways
> which might be nicer if the whole thing is refactored somewhat
> seriously, but if there's an easy numeric sort on strings, that'd be
> much easier.

We do essentially the same in the main loop (which is where I suppose
you picked it up), so it isn't too bad:

        // The `name` follows the `{file}_{line}_{number}` pattern
(see description in
        // `scripts/rustdoc_test_builder.rs`). Discard the `number`.
        let name =3D path.file_name().unwrap().to_str().unwrap().to_string(=
);

        // Extract the `file` and the `line`, discarding the `number`.
        let (file, line) =3D
name.rsplit_once('_').unwrap().0.rsplit_once('_').unwrap();

However, we could perhaps save the information so that the main loop
is cleaner instead of redoing it.

Having said that, given we are migrating anyway, this patch may be
simpler to avoid reworking this code. So I am happy either way.

> 3. Should we wait until after all or some of the changes to the test
> generation? Does the new --output-format=3Ddoctest option make this
> easier/harder/different?

We could do it there -- it would be easier in the sense that we have
the proper data already with the proper types etc.

On the other hand, it may be best to define the order we want to
follow (independently of the approaches), and then the migration would
be a smaller change conceptually, i.e. one less thing to decide then.

(I have to send the version to finally integrate the migration soon,
by the way -- I would like to put it in this cycle if possible).

Thanks!

Cheers,
Miguel
