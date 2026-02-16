Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CBA1E32CF
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251870; cv=pass; b=ZAmjqZa+Heofx5/OPkH9DEbJi755D6uwiOpW1RezsNAT1NOZJ7KVsYJ5i4nB8nziBwA6hw3kQStDVM7erVLNsZZ8iK3++zEEsh1fH/irkOhJ3aqJpRzYu3ufXLhde4lyI27rL2LeRSL8d3WWj6nOmlVHKkd6mzAAljg0AFo3n0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251870; c=relaxed/simple;
	bh=qrtP7CyB08NWeCItHZjwkTJFLla/EWNkBnkZyFH2cj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gsf5o7EA0kDFs6VGismRGfRpOmCoti5bd4ukqdIP2LhDCHxFkBeN7dxg5pn95Dhmd1hvVBma7Qe+pcoWxdAgjIVD8MuJEqnt2nme6nQWRAy7bRHzA5E46JooZdwA6rMLRmqEZdMD8Ym6u5JpWXZyFEudqZSOedyttyDeqnCs3FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjGhoUT1; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjGhoUT1"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba716126f5so158453eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 06:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771251869; cv=none;
        d=google.com; s=arc-20240605;
        b=VFmgooAoUlETjHLj1rTSmV2UQR9d9uFGK7cSM/+KKvPItUPHYL03ZjQWQeQVJIdcfl
         cAK4eQIMTdo32HlExf0akfrKvP5X9rYvtWBUG3t5ouYAMd7lcvPIIwa1vvPA/QWngIIG
         IuAxvlhqiTOmm+fJbC/OSASXVFy8Dzvm/846hsnKBqEc42DZ6wcTAMW1g3ITjiAzirgK
         zxlRWKM3pDDNkfSEgsb3Bzv3ks12dE6pBR/LVSRJgClDgXwTHS+8A93SoQHsDaTDu113
         EFG4ue5s1uPeapKS1JZ5HSoWA3IR3aTMTv8QOts/LIxoDPKrqtjvum3NExZxaJ15iHz0
         u2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3fhj1NI5B8a4QzQvZdeh22acJJzxZGMx3LNXMrKwuzI=;
        fh=DxspkEzu1bmJrXYEDV1wwV/4m9NTlXOQWf5jTlRu0ZI=;
        b=cAWHeTHPvu8xvePnQMBBuePruZRdgNo7VWQxMXWX+gGgc6lkOGxrRJyJc2GtP3C0eN
         MZJRYtfv2Mhfh/Byjnpvg8KXJ74ooVDUQNKfnRRoIEplVEhc/y8aoGIdc2T61wkooeq8
         ECK+F8pBwDXqh+JfAVMKf+lj9gXzJkYj4cYE0Be0xVY5uwe6H/T40OV8hkArHvJJTZ1v
         ny15kEelrXKdJvBS94GrCiaxVo+DZMIsVjxx/mePZyXBFxjtdMfv8IZsI9H0MvR4GSkW
         jVsKhsf/NoCrD2jZdeL+ywIUH7PiNOFQY6NsMKgi1IwwQQrDITrKV6wFB55rhYG1sdZ8
         sRDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771251869; x=1771856669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fhj1NI5B8a4QzQvZdeh22acJJzxZGMx3LNXMrKwuzI=;
        b=BjGhoUT1vpf4qfBSnrbR5FuZD2gH/e2+aFdvK2JfYoFMxAx4qZd7Yvh7oJZNf63ICG
         cw5+mRR52KetH4mUdWdfJG8rwSJ0RZe+5icpVaKQz+qtypIQkvQ5WzKjS4htna0w9CLp
         6RlCTKbntV2O1z8uBlHeSUE2GjGc0i8fafBQrDbek3psvFMVm5rDuHBctxMlQ2PLzIAW
         UyeHGt6vitN2C5N0ozDSx6l4uz/gIVZdfRv20o9LRW8ETcSLnQTlBVK6U1GW9Wu13sOd
         AcjYht9A8fHlVodqzll7GIWDQfw2/bSr/T6lfd9I2C3qCl+pljdZgMXRFoJ0wulG82B0
         039A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251869; x=1771856669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3fhj1NI5B8a4QzQvZdeh22acJJzxZGMx3LNXMrKwuzI=;
        b=s7Y1bap92ZvRyGmtB4jWdTCAukYSY7DXr4KOsLSeMtwWBAX1yC+FjxzmVEa7k77/Jg
         75fNAioBzrQR0NaJ6T+EJhDWTxGYRtUrIObm74wo1UIpV5kXEG0a3PKIyikzi0t3llMF
         cORdxQO23nb1vDkwGdIKxL83LCZOjpMQxqsSchHsSXVXFGkVQFZJkMki1mt7f4qqqEbg
         5IwmfbqcQ2VAaauX1W8ArhCiav5YxwFE0Fl+HokATTNtXkldvfxTS3vcaWAUZyT+7N97
         c6J/Ir5mJQAkwU6xpwJAA56hAXgsUGpMSBZn7NZND4jbb6g8QySbTi2AKlY7PjefIVNf
         REHA==
X-Forwarded-Encrypted: i=1; AJvYcCXiygfChbNkAM8zjAKw3FAAqfC9DeIU2Izou4nglMmsVL2V22a8jbXxUbFqoiNPBBDPdxc0+qyM3IRIlCBhtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJ7Vp9CGhigsvcsnn+8bX2+Fxf/7oIhCm5SMV48leaYW+5+yW
	EeGA+DOnwsE3lEQtforpy5XFj1ap1MGgGZx0NCSm2THo8afu1ExkoIW/vBMAk4g6UftiLXQGeYO
	PoMeQrKhx0UNAFB9Ve/A/9Thjlx9aZKY=
X-Gm-Gg: AZuq6aICj3M/vbBGxcm5HWK9iOhOehrqvugJdzYruyuG9WO1qa+FvqsfNW4EliLFSRF
	ssVJfd4hhNxdpmmwIJiLF+i1uW26Bp4UB/y8+hW2GmvMMsIL59KZ0IEokNQkUsOygpA3tMcaWbA
	uiZbpNi7O/g/D1wxceES0BcIrmj8SK1rFX5JSZzBm7uyrnMW6LxfcAuhj20huGjmzyI7Fivv2IP
	iXgtx3FKVuXdR+73HzTDYu/TvdP8qAg1COFPs6KX7kx1h3ekd0XX190Im0+9n+fIINS99dlFDoW
	vCtr2o41HoSitqed3WG2DdtOHcMX6aINYiyuPkMb/R53M4WFdwwmeJPptrplho9PdxIJ9tohiEK
	PUSvormychRT36PcDlCgHNw1S
X-Received: by 2002:a05:7300:72cc:b0:2b7:b6ee:b3c6 with SMTP id
 5a478bee46e88-2baba0af644mr2465795eec.7.1771251868869; Mon, 16 Feb 2026
 06:24:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215132232.1549861-1-lossin@kernel.org>
In-Reply-To: <20260215132232.1549861-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Feb 2026 15:24:15 +0100
X-Gm-Features: AaiRm51y4jwxHijrwz3pk57XVJCnDrjftKmOkAxttl_LhfyzKOBo9kadO-b5zv0
Message-ID: <CANiq72neBAezTpC__wdanNwNKXCYUd4ezst0u_P39R3LjA-RqA@mail.gmail.com>
Subject: Re: [PATCH] rust: pin-init: replace clippy `expect` with `allow`
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

As we discaOn Sun, Feb 15, 2026 at 2:22=E2=80=AFPM Benno Lossin
<lossin@kernel.org> wrote:
>
> `clippy` has changed behavior in [1] (Rust 1.95) where it no longer
> warns about the `let_and_return` lint when a comment is placed between
> the let binding and the return expression. Nightly thus fails to build,
> because the expectation is no longer fulfilled.
>
> Thus replace the expectation with an `allow`.
>
> Link: https://github.com/rust-lang/rust-clippy/pull/16461 [1]
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Thanks for figuring out the PR upstream, that is always helpful -- I
also noticed it in the 2026-02-13 nightly, so this saved me having to
dig into it.

If you want, when you decide it is ready, I can take it into rust-fixes.

By the way, if you send a new version, please include the error -- it
makes it easier for others to find it later in lore.kernel.org. In
case you don't have it around, this is what I got in that run from a
few days ago:

    error: this lint expectation is unfulfilled
        --> rust/pin-init/src/lib.rs:1279:10
         |
    1279 | #[expect(clippy::let_and_return)]
         |          ^^^^^^^^^^^^^^^^^^^^^^
         |
         =3D note: `-D unfulfilled-lint-expectations` implied by `-D warnin=
gs`
         =3D help: to override `-D warnings` add
`#[allow(unfulfilled_lint_expectations)]`

    error: this lint expectation is unfulfilled
        --> rust/pin-init/src/lib.rs:1295:10
         |
    1295 | #[expect(clippy::let_and_return)]
         |          ^^^^^^^^^^^^^^^^^^^^^^

Cheers,
Miguel
