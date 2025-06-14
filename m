Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824B519C546
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Jun 2025 17:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749922978; cv=none; b=eJKav36RA2IFDjG6sQbX2NPud/okvRatVXK2nkIpwezHsSXNFzRcsc52ViBKPsn4BTzZ38vktzWJ5fC2o334a4q0s6uLR3hMe6CLebs+0D9IWQy8UYoYCMp9Xd0nNt7dD0yRrPEa1GmpGAeKF1WqJZMaaqugqyrm9p2hfCmj98E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749922978; c=relaxed/simple;
	bh=Q5pLQ6oIBIQ+Hqd/WY1ApEmlO+DYAGnBVH0C4rdWSsk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BdC1IdwT4+U1TP8e5SBAL37J6hZMdrSpm/aGJnxUFE1FoajcknWnFmDSWn/wigdRlvPzwQNjLK8wVeBo+APzh3Wm/g/f36ox9tUDNLgd6bGfim64TgqLvEXn1B6UcqRAD4k01HjUw7VvRZ6XNxLGQq+l+byMWcGsz7tdKE9Zmn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b=Mbx+YeAb; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b="Mbx+YeAb"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 39D43240101
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Jun 2025 19:42:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net;
	s=1984.ea087b; t=1749922972;
	bh=Q5pLQ6oIBIQ+Hqd/WY1ApEmlO+DYAGnBVH0C4rdWSsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Mbx+YeAbIfUeKzSAmOCa7pWbWViUWalkcwc2Gy70WGbp1Haf6Bd18EM7xXO93HcaV
	 wpijaYW0juehpt6F7c3mhlZb7PPKXfrk04Uz8Jq28ln51Ns7IpeiX+x54ZPjVs5TrF
	 dMYJhwC2Wr9+Q0Zgn8jEF5B393PKEwQi/kBb/QPQGE4kAPdrJf0B1BFCHFkQ0+npH1
	 8bbXHKD1C50cJ6JhMb9JHaRm/veJ3y6fX3kk+h4cXnh4NmSxqBEIladhrfnib2QKNH
	 wtV1B7bYJvKRRNRlXFcYb+R0Ooj1aGwlCXMqRrPHhTva9tZ4MJjE3RbxtAMUhG56Tf
	 USkAPDnmGu8Q2xDnMTT5fqLLFqCuxcprQmWAVtgFcoc4236haDYPMC6JGITVee6p5Y
	 0kJzJLZ0nHXbCVIqpv+Iul0gseZnGw25c5OgD6pICYZyKkLlonvf65AGz6JG4insmk
	 eU1RO7/5MXNDFtgb1fPN10l17s8t6o3zfLnlTQuUlOYtambwLqE
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bKNrn5jBPz6trs;
	Sat, 14 Jun 2025 19:42:49 +0200 (CEST)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Eunsoo Eun <ewhk9887@gmail.com>
Cc: rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,  Eunsoo
 Eun <naturale@hufs.ac.kr>,  Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH 1/2] rust: macros: allow optional trailing comma in module!
In-Reply-To: <20250614081312.763606-1-ewhk9887@gmail.com>
References: <20250614081312.763606-1-ewhk9887@gmail.com>
Date: Sat, 14 Jun 2025 17:42:27 +0000
Message-ID: <87zfeamd8c.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Eunsoo Eun <ewhk9887@gmail.com> writes:

> From: Eunsoo Eun <naturale@hufs.ac.kr>
>
> Make the `module!` macro syntax more flexible by allowing an optional
> trailing comma after the last field. This makes it consistent with
> Rust=E2=80=99s general syntax patterns where trailing commas are allowed =
in
> structs, arrays, and other comma-separated lists.
>
> For example, these are now all valid:
>
>     module! {
>         type: MyModule,
>         name: "mymodule",
>         license: "GPL"  // No trailing comma
>     }
>
>     module! {
>         type: MyModule,
>         name: "mymodule",
>         license: "GPL",  // With trailing comma
>     }
>
> This change also allows optional trailing commas in array fields like
> `authors`, `alias`, and `firmware`:
>
>     module! {
>         type: MyModule,
>         name: "mymodule",
>         authors: ["Author 1", "Author 2"],  // No trailing comma
>         license: "GPL"
>     }
>
>     module! {
>         type: MyModule,
>         name: "mymodule",
>         authors: ["Author 1", "Author 2",], // With trailing comma
>         license: "GPL"
>     }
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://github.com/Rust-for-Linux/linux/issues/1172
> Signed-off-by: Eunsoo Eun <naturale@hufs.ac.kr>
> ---
>  rust/macros/concat_idents.rs |  9 ++++++++
>  rust/macros/module.rs        | 42 ++++++++++++++++++++++++++++++------
>  2 files changed, 45 insertions(+), 6 deletions(-)
>
> diff --git a/rust/macros/concat_idents.rs b/rust/macros/concat_idents.rs
> index 7e4b450f3a50..c139e1658b4a 100644
> --- a/rust/macros/concat_idents.rs
> +++ b/rust/macros/concat_idents.rs
> @@ -17,6 +17,15 @@ pub(crate) fn concat_idents(ts: TokenStream) -> TokenS=
tream {
>      let a =3D expect_ident(&mut it);
>      assert_eq!(expect_punct(&mut it), ',');
>      let b =3D expect_ident(&mut it);
> +=20=20=20=20

We have some whitespaces here ^

> +    // Check for optional trailing comma
> +    if let Some(TokenTree::Punct(punct)) =3D it.clone().next() {
> +        if punct.as_char() =3D=3D ',' {
> +            // Consume the trailing comma
> +            it.next();
> +        }
> +    }
> +=20=20=20=20

Whitespaces also here ^.

Maybe you can add a new helper function for this one?

>      assert!(it.next().is_none(), "only two idents can be concatenated");
>      let res =3D Ident::new(&format!("{a}{b}"), b.span());
>      TokenStream::from_iter([TokenTree::Ident(res)])
> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> index 2ddd2eeb2852..d37492457be5 100644
> --- a/rust/macros/module.rs
> +++ b/rust/macros/module.rs
> @@ -13,10 +13,27 @@ fn expect_string_array(it: &mut token_stream::IntoIte=
r) -> Vec<String> {
>      while let Some(val) =3D try_string(&mut it) {
>          assert!(val.is_ascii(), "Expected ASCII string");
>          values.push(val);
> -        match it.next() {
> -            Some(TokenTree::Punct(punct)) =3D> assert_eq!(punct.as_char(=
), ','),
> -            None =3D> break,
> -            _ =3D> panic!("Expected ',' or end of array"),
> +
> +        // Check for optional trailing comma
> +        match it.clone().next() {

We might be able to do something like this here,
   let next_token =3D it.clone().next();
   match next_token {
         ...

> +            Some(TokenTree::Punct(punct)) if punct.as_char() =3D=3D ',' =
=3D> {
> +                // Consume the comma
> +                it.next();
> +                // Check if there's another string after the comma
> +                if it.clone().next().is_none() {
> +                    // Trailing comma at end of array is allowed
> +                    break;
> +                }

Lose this, and let it check naturally?

> +            }
> +            Some(TokenTree::Literal(_)) =3D> {
> +                // Next item is a string literal, comma was required
> +                panic!("Expected ',' between array elements");
> +            }
> +            None =3D> {
> +                // End of array, no comma needed
> +                break;
> +            }
> +            Some(_) =3D> panic!("Expected ',' or end of array"),
>          }
>      }
>      values
> @@ -143,9 +160,22 @@ fn parse(it: &mut token_stream::IntoIter) -> Self {
>                  _ =3D> panic!("Unknown key \"{key}\". Valid keys are: {E=
XPECTED_KEYS:?}."),
>              }
>=20=20
> -            assert_eq!(expect_punct(it), ',');
> -
>              seen_keys.push(key);
> +
> +            // Check for optional trailing comma
> +            match it.clone().next() {
> +                Some(TokenTree::Punct(punct)) if punct.as_char() =3D=3D =
',' =3D> {
> +                    // Consume the comma
> +                    it.next();
> +                }
> +                Some(TokenTree::Ident(_)) =3D> {
> +                    // Next item is an identifier, comma was required
> +                    panic!("Expected ',' between module properties");
> +                }
> +                _ =3D> {
> +                    // End of input or closing brace, comma is optional
> +                }
> +            }
>          }
>=20=20
>          expect_end(it);
