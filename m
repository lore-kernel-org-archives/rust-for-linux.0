Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B542874FB;
	Fri,  9 Jan 2026 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972861; cv=none; b=NQ61UANHeylasQEOBxHah+AJgCfgvxSI4YErrxataJzvWjz1GGrMKwx4dwLwRzlxaszXn6WnBktaZK/fmDsczY/HvtSlKoQk8lZF97cbrLJleqyxRqXFm10/J93LB9TOtSlkovz+wgugn5gLo6GBLtvtxtX1XEOhPCcWdrUOtnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972861; c=relaxed/simple;
	bh=M4a0SEBe0kOn2kcj0FWverBIYNoDyLiU5W4XtaQaDbU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tUGhZiIe4nP4sEHN/jRGdHZchFmmAMmXEH8EUhURKG30Q0n5iPKH91Mahj8PGSU/1c4ijx5Y3WqFTe3e+9vRqk0ZGKwEvR7t74XhDER47PkGQkx+o3ujm53OoxIB+b1Okfmb8L4uDs9gd11z8BrPmIzEOkHRXqzI+AbtTn4Rzy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6BdV9gt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6BdV9gt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D70C4CEF1;
	Fri,  9 Jan 2026 15:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767972861;
	bh=M4a0SEBe0kOn2kcj0FWverBIYNoDyLiU5W4XtaQaDbU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=T6BdV9gtsGFqZEx0dODjpE3uKAhx9/EVwYu9T3XYiLliWhZGIemIGU9ZixzivlCXQ
	 E7WJWLTU+kLDuqT9Od/kITe51BF7z2lXNCjKWRAuPTGYd885qoPYdvUoyQQ3ZTiCqp
	 Va8hSeeimqWGtxi/p0tc52fhuk4EiiObCURqAn49YanQPltwopo+XI2CkCvU8UxUy8
	 mCAt82dLesW+LE+neaZlx8yr6bg0lvPM5LzaAmsjFUknvf954Nb5e3rUpOGDalduVl
	 V2r+qYTpS7vwt20aSg6bwD297dQgnmnvI9G14h/oMKYb14LXBYqzZQ0+jVI46ALQUf
	 2hJLENshs0AAQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 16:34:15 +0100
Message-Id: <DFK62LHP35VZ.2HKVXST2SEI39@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/12] rust: pin-init: rewrite the `#[pinned_drop]`
 attribute macro using `syn`
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@kloenk.dev>,
 "Tamir Duberstein" <tamird@gmail.com>, "Alban Kurti" <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-6-lossin@kernel.org>
 <DFK1RR7HGFKN.XM2V8C9D0PR1@garyguo.net>
In-Reply-To: <DFK1RR7HGFKN.XM2V8C9D0PR1@garyguo.net>

On Fri Jan 9, 2026 at 1:12 PM CET, Gary Guo wrote:
> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>> diff --git a/rust/pin-init/internal/src/pinned_drop.rs b/rust/pin-init/i=
nternal/src/pinned_drop.rs
>> index cf8cd1c42984..4df2cb9959fb 100644
>> --- a/rust/pin-init/internal/src/pinned_drop.rs
>> +++ b/rust/pin-init/internal/src/pinned_drop.rs
>> @@ -1,49 +1,56 @@
>>  // SPDX-License-Identifier: Apache-2.0 OR MIT
>> =20
>> -use proc_macro2::{TokenStream, TokenTree};
>> -use quote::quote;
>> +use proc_macro2::TokenStream;
>> +use quote::{quote, quote_spanned};
>> +use syn::{parse::Nothing, parse_quote, spanned::Spanned, ImplItem, Item=
Impl, Token};
>> =20
>> -pub(crate) fn pinned_drop(_args: TokenStream, input: TokenStream) -> To=
kenStream {
>> -    let mut toks =3D input.into_iter().collect::<Vec<_>>();
>> -    assert!(!toks.is_empty());
>> -    // Ensure that we have an `impl` item.
>> -    assert!(matches!(&toks[0], TokenTree::Ident(i) if i =3D=3D "impl"))=
;
>> -    // Ensure that we are implementing `PinnedDrop`.
>> -    let mut nesting: usize =3D 0;
>> -    let mut pinned_drop_idx =3D None;
>> -    for (i, tt) in toks.iter().enumerate() {
>> -        match tt {
>> -            TokenTree::Punct(p) if p.as_char() =3D=3D '<' =3D> {
>> -                nesting +=3D 1;
>> +pub(crate) fn pinned_drop(_args: Nothing, mut input: ItemImpl) -> Token=
Stream {
>> +    let mut errors =3D vec![];
>
> Any reason to not make this `Vec<Error>` and use `syn::Error::combine`?

Is there a way to have an "empty" error? I dislike using `Option<Error>`
here... If not I'll just create my own helper type instead.

Cheers,
Benno

>> +    if let Some(unsafety) =3D input.unsafety {
>> +        errors.push(quote_spanned! {unsafety.span=3D>
>> +            ::core::compile_error!("implementing `PinnedDrop` is safe")=
;
>> +        });
>> +    }
>> +    input.unsafety =3D Some(Token![unsafe](input.impl_token.span));
>> +    match &mut input.trait_ {
>> +        Some((not, path, _for)) =3D> {
>> +            if let Some(not) =3D not {
>> +                errors.push(quote_spanned! {not.span=3D>
>> +                    ::core::compile_error!("cannot implement `!PinnedDr=
op`");
>> +                });
