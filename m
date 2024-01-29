Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6CA6026A
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 12:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706530744; cv=none; b=OSJfs0E/0EiXh8S5VR4XMppEoZQntJU0yP1kk5wH62jr+cP1CSgtLg6A9ycBjtAQK1tNsZJrwamlNE8iQPP11jTD9+59mNR+HIbepeyTNEiDggwz+CVzLOr3EUhFNujGO9AzmmjLxoEaXkP+3xVJrVbiDUh1sxDT3PUPwhn7Oz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706530744; c=relaxed/simple;
	bh=XcJOxxFwVzUk1Hmoy8T/Yzcsgyx8Q/hBv2Jk4zcdOxc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l5ZJzVWo2bAihW5oxJAbQ+kJ+y+5b44X6u/DHJcvYqdwYlJA5H6rXoCz+TbaCaPcWpPd96g6RArjh15D99PGMyR4H42wPLrl3BIEKea7qseW509X9A+xkWaWFUASBO+J4eYDERDpB3WDj5lrXoiFdBfzfvw386OVA6kPWrvKq3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w8qYptzD; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w8qYptzD"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5ffa2bb4810so28824897b3.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 04:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706530741; x=1707135541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OVPaWX+a40E+Wo1V3SFI4LMjdBosQXjWC6XDKZ57Zk=;
        b=w8qYptzDVvbJDA5xe6baCeXQ7tDtdADGuA7YKc6V6Bakr19Zl7/Iy2ICSzbOAkrWe1
         1jIVq5NSnVESiLimeYMvXsWqqFnoG7vSXLkV9yWpe04E+CzlPRI14q1cX9hXh/M9exDj
         QCQ9m2/SJ+msVNvUjHum1/FxcWIBNdfNWbUjlBR+8tH80Ga6GcAEuP0GX0sJbUbXtUO2
         1lRS4ttZR9JKEOfZcw3t97B7y46YTX0fAsW16nZGZprr/xSJSq9/qFQy4w6tPiwsEXXG
         eEWB4sMmVWJaz8HaauSc6LzUQYATgEheTjzr3ERdCXfPHZvlGWXs2m+LntIsotzwAhN3
         bjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706530741; x=1707135541;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3OVPaWX+a40E+Wo1V3SFI4LMjdBosQXjWC6XDKZ57Zk=;
        b=cs3UU29KlWcAqgrK0HclWLxebP0cZXQzrJSuoJVvYQqiPACXPCizS9lClkmLMb24NG
         O3/A3AxZ1o7k+O6o1p+ppCg2nSgDF7BfzkpMwIfrB8TK9etuzWm1LFA8Z//ywJOQxVwZ
         HcIHCJOVqlHy/uHDnkzmw3JwIwV7F5X1bw1AmEy7tAGeKBAO4Tq3/dMRRQh+GRSK/bLn
         ZzRiCV/l2J8rnIiDwTruqjgPS2cdC7oshGkeOuSHoJ6m6at+ImFMxMoGkzPaX0NqgfuD
         bKg59F8PWJswknr8PrSLoN4gs7+PgE56NfkoOETKjdPAxSlXpHkrP9gbWZ5jevHVReUv
         DyLg==
X-Gm-Message-State: AOJu0YyPo7wdwk877QF6UolXmvr4CV90g7hWYAOasHH0wHyBhjePCvuo
	sExklNh1SAYXqmsbz+QI/s6DFPwrWmNeiPFhoO5Jom9WIEeQvnMI3Kj/3qUmzL+45kRS23W26cW
	akzMetu09/WbkjA==
X-Google-Smtp-Source: AGHT+IFcnkCTaIQD+LMdI/9aBTJOKMoPzPFD9rXC/CgrdqQeCDPvb2s4sVOMqrOo3Vb+YCdklY9OmYAXyDWTLbg=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a81:57c3:0:b0:5f9:4fa1:1a0b with SMTP id
 l186-20020a8157c3000000b005f94fa11a0bmr1316146ywb.0.1706530741581; Mon, 29
 Jan 2024 04:19:01 -0800 (PST)
Date: Mon, 29 Jan 2024 12:18:59 +0000
In-Reply-To: <ZbSDkm65LML4OWKX@ohnotp>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ZbSDkm65LML4OWKX@ohnotp>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240129121859.1099000-1-aliceryhl@google.com>
Subject: Re: [PATCH V2] rust: str: implement `Display` and `Debug` for `BStr`
From: Alice Ryhl <aliceryhl@google.com>
To: yutaro.ono.418@gmail.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	armavica@ulminfo.fr, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yutaro Ohno <yutaro.ono.418@gmail.com> writes:
> Currently, `BStr` is just a type alias of `[u8]`, limiting its
> representation to a byte list rather than a character list, which is not
> ideal for printing and debugging.
>=20
> Implement `Display` and `Debug` traits for `BStr` to facilitate easier
> printing and debugging.
>=20
> Also, for this purpose, change `BStr` from a type alias of `[u8]` to a
> struct wrapper of `[u8]`.
>=20
> Co-developed-by: Virgile Andreani <armavica@ulminfo.fr>
> Signed-off-by: Virgile Andreani <armavica@ulminfo.fr>
> Signed-off-by: Yutaro Ohno <yutaro.ono.418@gmail.com>
>
> [...]
>
> +impl fmt::Display for BStr {
> +    /// Formats printable ASCII characters, escaping the rest.
> +    ///
> +    /// ```
> +    /// # use kernel::{fmt, b_str, str::{BStr, CString}};
> +    /// let ascii =3D b_str!("Hello, BStr!");
> +    /// let s =3D CString::try_from_fmt(fmt!("{}", ascii)).unwrap();
> +    /// assert_eq!(s.as_bytes(), "Hello, BStr!".as_bytes());
> +    ///
> +    /// let non_ascii =3D b_str!("=F0=9F=A6=80");
> +    /// let s =3D CString::try_from_fmt(fmt!("{}", non_ascii)).unwrap();
> +    /// assert_eq!(s.as_bytes(), "\\xf0\\x9f\\xa6\\x80".as_bytes());
> +    /// ```
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        for &b in &self.0 {
> +            match b {
> +                // Printable characters.
> +                0x20..=3D0x7e =3D> f.write_char(b as char)?,
> +                _ =3D> write!(f, "\\x{:02x}", b)?,
> +            }
> +        }
> +        Ok(())
> +    }
> +}

What about newlines and tabs? Those are printable.

If you are intentionally excluding them, please add a comment saying that.

> +impl fmt::Debug for BStr {
> +    /// Formats printable ASCII characters with a double quote on either=
 end,
> +    /// escaping the rest.
> +    ///
> +    /// ```
> +    /// # use kernel::{fmt, b_str, str::{BStr, CString}};
> +    /// // Embedded double quotes are escaped.
> +    /// let ascii =3D b_str!("Hello, \"BStr\"!");
> +    /// let s =3D CString::try_from_fmt(fmt!("{:?}", ascii)).unwrap();
> +    /// assert_eq!(s.as_bytes(), "\"Hello, \\\"BStr\\\"!\"".as_bytes());
> +    ///
> +    /// let non_ascii =3D b_str!("=F0=9F=98=BA");
> +    /// let s =3D CString::try_from_fmt(fmt!("{:?}", non_ascii)).unwrap(=
);
> +    /// assert_eq!(s.as_bytes(), "\"\\xf0\\x9f\\x98\\xba\"".as_bytes());
> +    /// ```
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        f.write_str("\"")?;
> +        for &b in &self.0 {
> +            match b {
> +                // Printable characters.
> +                b'\"' =3D> f.write_str("\\\"")?,
> +                0x20..=3D0x7e =3D> f.write_char(b as char)?,
> +                _ =3D> write!(f, "\\x{:02x}", b)?,
> +            }
> +        }
> +        f.write_str("\"")
> +    }
> +}

This escapes quotes, but what about backslashes?

Also, perhaps `write_char('"')` makes more sense than `write_str("\"")`?

>  macro_rules! b_str {
>      ($str:literal) =3D> {{
>          const S: &'static str =3D $str;
> -        const C: &'static $crate::str::BStr =3D S.as_bytes();
> +        const C: &'static $crate::str::BStr =3D BStr::from_bytes(S.as_by=
tes());
>          C
>      }};
>  }

This should use the full path both times:

const C: &'static $crate::str::BStr =3D $crate::str::BStr::from_bytes(S.as_=
bytes());

Alice
