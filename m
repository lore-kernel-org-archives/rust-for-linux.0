Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793723573;
	b=XKRw0mQsAw/R4Sqa5puITs8IKIVeu2KeUGoIjz+F5vG49VVQuT8txTIyEEAEp+KTtllg
	 Evgv2udGaV2T2JmAM6qRvKGbPvfaMhZ2NJL8qFF/KQgO2W0+urQbyJoYK/W5XF5WQlL4O
	 rMhvpvuCFwCT3x585QN/8IpJJhGlzHK4VzfXzfuIQw5Cfux20iTskt5Y2Wazo/br8bwlx
	 lo5VtLUYgQphzKfOdDDUvtuixSiApX0eWQnPF2VUFfpKBtaAG5ZQ54EM4tjBYWaQsWVXk
	 ebgiJ2ZW4OO/onMOJDpnzyhS0uypMUJ3G28g0orYdTRoXT/STqZOpoiNo4HWbW6EXdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=oMXVh8m9JA3+VOPHTMjFKEf5mQ5MCDe9p1cShRw1s5g=;
	b=oSKPxdq/dw3oqOdoOoYrydGnXJheaKS7DZwuy77Qi5pc88VrQr4gfPSXP5r+uKEgDrr+
	 T06uh9TSkMeUAkj2zkqUaMhMZ0kntHVnzoaLIyC2g4qqcRUxDJtVLnZPJh7DSFPKeo+4y
	 et0BPki6uD7oe0yg5WPnKk7BbS0zd6d14qepu83+/LYlvlbbn9dhL18Zy9lSj3uyUAr+8
	 wyNRTpV9jfuHGA6acVG27k3BN11V7BrYONCrIoSHWe9pvPz9hW2yrSN4TW3NZRGPwq/JK
	 s3TRL1Hel5/XeLVvi5olBOxDsRu/S/KGbC+unm4GXAS/VytWq2hRSrgW8dLqdBJraoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3FJQM3C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70517606A332
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 16:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70517606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3FJQM3C
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a1c464349so578590eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Nov 2026 08:32:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793723572; cv=none;
        d=google.com; s=arc-20260327;
        b=B5AIR2IFZY7I1U4Ixxw8FPrqfRaH3Q/YIzb+i9c36EyankOa3t3rT488+4BiVgztrW
         ISGbIR4Jpm0DFXmwUl7B5IQmoHUiEuOCVStFaBFA1wSQEIdaYAo665hDRg2JCpTs1Zu1
         lqkIohdbm/DllCEvcAup+PSvUu/y7Ma2UxFJKz7jq2BbgLb8+7UcNHDogUkfnK13kcy5
         hXiQYU0f6q0JW07xEpI1gq0qb3lVKVkXJoSLIJsRt6LufVMyFjqXhVYkLkThQVMMLQWf
         xL4LI+4WMqK/pOF/pR1HUuL+jbeArcHfjwPbU0ZoVK74LetGin4gPrRYQ4WfI67CGncO
         n+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oMXVh8m9JA3+VOPHTMjFKEf5mQ5MCDe9p1cShRw1s5g=;
        fh=bpTnb637mIqXBkPlDk6uxbsdAfZIPiZXOXJeuO0pThk=;
        b=baBQa1ZIRoH4LzsLHJEzVp1smtwTjkwo4vzA/WJxq7ksSsd0sbffb+2w3ivKqQfL+U
         0DaYVqWbxcP6VVgmBpVhqOYsBFcMJhgNBrzlaOo9yROVVP06OnpZz2YSa1AhlxcwwtaM
         Gr78fRL+4LCDivzhiPDR80cHrR71tzWOxz62XECE9pp9tqgtZvh9/ApJWGSS+CDh2Evm
         FmWfX4968CO5ZhrTpWixqlQrhFqVDnUvdBQubikIQ20e857ydFIxmWy6ARryfWmsgxHr
         ug8dsbMqbMvVyato9Tfh2/LVKwAmeC6q3ToA49Zv6cYDsadfG4rD1g0oeOhfptMdBvUk
         T+AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793723572; x=1794328372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oMXVh8m9JA3+VOPHTMjFKEf5mQ5MCDe9p1cShRw1s5g=;
        b=q3FJQM3CxAp6nXOI7CrIcPwt0ftF1W1wq2B+rAtXOlUHVSX/WwEvf2/4lc2ZHoSmKz
         lnYXZtTv2P2QyyDtQUEgOUQoJkvotlVEjNzE09zJVAbHxhi6XXgNHQ1cEKP0stCoHCYC
         ++eJ1PHCvPzL/r+hM8dBmy9CYmZ2Wv/P3ojk3TN4ga5dbA5TjgOC7rKO9DwwO8uEYUQ/
         i9VXMSRdf8VlHX862nFR4uFY5XCI98B7n7+DXFoZG6ZpUw7R4kSQjt6E6yliUWxYFdEV
         YIVP2G/KStUn6XIkORPoM+IFZM7A/2gtwvghB8fP9b86UPdgBA2WIpPnjTqvvxiZ2fm7
         J0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723572; x=1794328372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMXVh8m9JA3+VOPHTMjFKEf5mQ5MCDe9p1cShRw1s5g=;
        b=HWWUEYNIsOUnAwZLkdFwojZfp5khd8BaxCjMu04+IJhWm/L4+r+TeSuXR/V/5XLiff
         FdAhHd7NcM+0xJPmq9if0UX/yXQro0ZHffDZKzBhmtVrNxisJNBiHBzwUsLtHPr5sRQt
         3ADvNa7+ZVteL9kaUYIxE4fW3WWlyQP6ntJ+o9q1zvYp8oiDdk5xLN+fe174bu1f/Wc8
         cxNpV1WoBQSRjmt0be5kS52Pk0/F4EZB+4QDze5wYschriU2DeeYPRA6acojhpmmhn+D
         v3fjRvy9XuczEmFZOGk253WBdBkwjXOC2jQYlTgYv6j/RLXD3f2hG4UpAPJo0jpb4bsT
         D+OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPNQWiJgBIH7x/VJgQajyb/3JB5AOVls0+LedV3HcDwdWehD2/YWeVe6Ml7LRyE3Oii+LXz0dlumSApB1kng==@vger.kernel.org
X-Gm-Message-State: APuU4Z/yb5kddKNuCz12ElbAFxKE3O6ipZ8/Z6TLbcpOiH1Fzl3BLGcy
	VlMq59S4MBEvelnUM4px8zDF4wNlB+uetEBjpUgyHQl3I03JfbmX14s+Qr9lqTh6m5xgKnJoi1t
	ZPsYLjbV9G8mWMG5ammsWb82ZcpnCbJhSROYT
X-Gm-Gg: AYBFou20go4YrNkVtqAb9Ikjah34o8sOzo8rsbTNi4mMP03ICLZ224PaSgrK6FBlHHm
	3xtZTJN+5QosVSzPliHt6Ctp1FtUWttXDNozw73OaOiu0QXbcn5MhOooAy46wwOvj3wjUWFEWb5
	LnN5TgdGiVY4DpU/2+Ysi+qj3sv3TcDVDCS3M8EYrkVKCcTjBb4syOjfmlDyymmSmUMM7YcQuuz
	5FMN10wM7/1UV7U2aYTg2CG/oJ6QdGWkaUmIdtlm+cS3PXQjV0OiD4wViWz4yf58LWMzhja9OzY
	7Bo6Bbdfw4utdYcx+uZ2Dy9OrakTfyNHTct1GBmYwP6NPPBh/ur+bxnwr2ayQr4dZfXvXn8MLZi
	XIFNoSBGBwv3gi4qp65US1Ex+ezj6kxffgRX8MpeNYaBaEkn1zTNxdgbK3yv9QBRRSh6lnA6K9Y
	jyafDdzaaOVgTv8U2SMEtyfZV7KqeMF9vb6Deq5Mb1Dby6wda8HmVU4sfcSTfx54JVk2JnIz3y1
	/7hDaW3rNWtCtOWxSAk/DmeKnXNp2VS51RZ
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr27747765eec.2.1793723572486; Tue, 03 Nov 2026
 08:32:52 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com> <6d7a63ae-f08f-4973-b2d5-27be454380ef@davidgow.net>
In-Reply-To: <6d7a63ae-f08f-4973-b2d5-27be454380ef@davidgow.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 17:32:38 +0100
X-Gm-Features: AclHuK90AIFn4pqC962aeL0MAPJKIlqb3W_SNsS254mHQiyiX6txvzvtQ8rl_to
Message-ID: <CANiq72mf6Hx1YZDKv0GKwEd2gDfQtUkuA4RGhgUEfOCpR0ixDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
To: David Gow <david@davidgow.net>
Cc: nico.antinori.7@gmail.com, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 3:46=E2=80=AFPM David Gow <david@davidgow.net> wrote=
:
>
> I'd rather this not pass, personally. I think that an assert!() within a
> test should work normally (i.e., it's possible to assert that the test
> state is normal, and a failing assert will fail the test).
>
> I could be talked out of this if it's really unpleasantly different from
> non-kernel Rust, but in that case I think we'd want to make sure that
> kunit_assert!() within a test behaves like a normal assert even in a
> should_panic test.

Yeah, it all boils down to what we mean by `assert!()`.

When I implemented it back then, I intended to allow people to write
the normal asserts they would write (which could help in case we were
to e.g. import code from elsewhere, like a vendored library), as if
would have "Rust-panicked", but not "kernel-panicked".

Viewed in that light, `BUG()` would not necessarily need to make
`should_panic` succeed or not [*], but an `assert!(false)` would need
to make the test succeed. And then we could have a
`should_kernel_panic` and maybe expose a public `kunit_assert!` etc.
to distinguish them and so on.

Having said that, I am not sure how many tests would actually rely on
such differences... I think the core requirement is that, as you say,
we are able to test for Rust panics in functions we call within the
test (and ideally also other Rust panics within the test body too,
when viewed in the light above). But if something simplifies
implementation significantly, then we can consider other things.

[*] I asked an LLM to test what happens in userspace Rust when one
aborts/traps/etc., and it differs in stable between a normal test and
a doctest (with the default `panic=3Dunwind`): essentially, the former
dies, the latter succeeds -- it doesn't seem to be well-defined yet.
There is an issue for the doctest side of it:

  https://github.com/rust-lang/rust/issues/143009

and there is a bunch of discussion on the different linked PRs.

Cheers,
Miguel
