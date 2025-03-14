Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5043E1BC3C
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Mar 2025 14:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741961393; cv=pass; b=BUNzVqSadKdsRn6RFNNrQxSwpjBhS4xssccn0aNTg4jUCYW/38dj2Zd4F+DpVYlaRdUJMmq+6Ou4vX3w9HazM/PBwfb0yYSw2WytFqqmOGKX7g4h9Zm1tKMZdya4AdIc8z0FtlbNYrCIwsW5sOjVamoaQ5pmRjrRzEe7MPB5z2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741961393; c=relaxed/simple;
	bh=B8Hyh/SDYIG+1f5Y8CGOnvLXxwjKn37T0Sjjqqwg/DI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qO/OgAhKAP7VyZUL0NVCVW+2m40wCgk+zNDteT0p933D5j7wiLbhCoP9yOXeW8tmFrLq9XEqv1uOOwQVNaplTvlPhYHf+wdpeeHuPdkgnZ45FSfvi3jXWT+9ElZfBNkoA8Uv8OQDzRzfrrN7x28bkBrSozb0UQVDbi3izNr+MjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Hy8PRptG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Hy8PRptG"
ARC-Seal: i=1; a=rsa-sha256; t=1741961369; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CNWdahbJrCP1wSoOaKRO1N7je4HBsKs7yEqccQVD4ZyxfvB6CI7OKCeY6XAsXjI3OKlBAvFUoz/bnNZLzcsmGsoKYP8rwOV+SKK92N7YKXAd/Yvl3KaazMhjDTzSAlVP6wfBEedLsQeITBzYJDEmho0bT1a9mymu2rqL33jP23E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741961369; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SGRxvpip7TbNbVhpn+m4nFFlJ/88DuM9bqFT9cnkcoc=; 
	b=EzlrX+e74Tf0QRlP+X4jAFAvPMJPK0KZmRxNwWgI7U/ze5ECpcM0RUo7MLMvGUkoaPv+nOtHMZH1wEtfeZcUfOZxjhha5NuIF0u9r169F206J3DDv9sOGTbJ5Tl798L5gzZflW0w0XzW8GgEHKnacT+urHGYjyBqY0hcPd7Vldg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741961369;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=SGRxvpip7TbNbVhpn+m4nFFlJ/88DuM9bqFT9cnkcoc=;
	b=Hy8PRptGX5c4a9N3vd9ONd8++DKbnt/tJIEu02hWBdYdgnWpKVkFHRgIdq1jKLAJ
	7mYTEtvWKTsShveHc99pkjRM1/OgdlVj9fjcXG7SxAwDBo7pC88TxcRl/5ld+Jf2Uch
	3uAHdh5Qme/V6UOaZ/sw2t55zomti5a+Pb6YCOZ4=
Received: by mx.zohomail.com with SMTPS id 1741961367359294.85325309647544;
	Fri, 14 Mar 2025 07:09:27 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] rust: add new macro for common bitwise operations
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
Date: Fri, 14 Mar 2025 11:09:12 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 felipe_life@live.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <E2FFC2EF-96BF-4306-84CB-B77348A10CEE@collabora.com>
References: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
To: Filipe Xavier <felipeaggger@gmail.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-ZohoMailClient: External

Hi Filipe,

I=E2=80=99ve been using your code on a driver I=E2=80=99ve been working =
on. It
definitely avoids a lot of repetition, so thank you for that.

There are a few things I'd like to point out, though:

I personally don't think that "bitmask" is a good name. Something like
"impl_flags" would be more descriptive of what is actually done by the =
macro, i.e.:


mod flags {
    use kernel::bits::bit_u32; // This is not upstream yet.
    use kernel::prelude::*;

    use crate::impl_flags;

    impl_flags!(Flags, Flag, u32);

    const FLAG_FOO: Flag =3D Flag(bits_u32(<some bit>));
    const FLAG_BAR: Flag =3D Flag(bits_u32(<some other bit>));

    impl SomeTrait for Flags {
        ...
    }

    <etc>

Additionally: =20

Flags & Flag doesn't work, but should. This applies to all other =
operators. In
other words, you shouldn't have to write:

let foo: Flags =3D ...;
let bar: Flag =3D ...;
let baz =3D foo & Flags::from(bar);

Regarding the docs, as I said previously, you need to transpose the docs =
to the
type, e.g.:

mod flags {
    use crate::impl_flags;

    /// Flags used for XYZ.   <--- has to appear in the generated code.
    impl_flags!(Flags, Flag, u32);
   =20
     /// Used for ...
    const FLAG_FOO: Flag =3D Flag(bits_u32(<some bit>));

    /// Used for..
    const FLAG_BAR: Flag =3D Flag(bits_u32(<some other bit>));

    <etc>


Also remove #[allow(missing_docs)]. You should capture this from the =
macro
invocation directly, if present:


mod flags {
    use crate::impl_flags;

     #[allow(missing_docs)] // OK, user doesn't care about docs here.
    impl_flags!(Flags, Flag, u32);


This should result in:


#[allow(missing_docs)
pub struct Flags(..);

#[allow(missing_docs)
pub struct Flag(..);


On top of that, your code will actually generate a warning depending on =
the
visibility of the enclosing item:

my_driver.rs:

pub mod foo {
    mod bar {

        impl_flags!(=E2=80=A6);
        //
        // Expands to:
        //
        // pub Flags(..); <-- Warning: Flags is pub but bar is private.
        //
        // pub Flag(..); <-- Same here
     }
}


This means that you should let the visibility be controlled by the =
caller.

As you can see, there's a few things to be fixed still, but overall =
great work,
I appreciate it. Can you please add the suggested-by tags for Lyude and =
I?

-- Daniel=
