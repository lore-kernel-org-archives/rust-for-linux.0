Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106388F49;
	Fri,  9 Jan 2026 16:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976754; cv=none; b=YYMc4GTA77sBnyNOal4XqNIP6iH6gk+VNc0J4tPQJetabn7d8Bxd/p/XP/wxMrlHpdyLadMmvHNAx9FDtSzA2rvPAVcL8mVGU9dbmzHzSvN2lquX6+6a+0n7hXPoyReRHWyzD5QbhDJF+Pi6QS0iiTjxNpq4ZE65uInD+v+DTuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976754; c=relaxed/simple;
	bh=YaBDdkupNRStfAvOaRvS/NP9WCcD6+/+bW2LKA0Nfok=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=NRdmxeNexnoQdILb/Yn6wlwJxIC1zMCWQhi+4mMx4zcvXIq4EQPdWDxe/zP5vVld3SQXGR2oF5aVPCnM6gkBV63sUyhD6K0LHGHd+/WvH5eMwIWC80kmC0R4pIlreBMnmtqPfptgZiqWtkp5S6CcTkk62xw25OHN8Q/MJbLG6To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHWJG9Qr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHWJG9Qr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17544C4CEF7;
	Fri,  9 Jan 2026 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767976753;
	bh=YaBDdkupNRStfAvOaRvS/NP9WCcD6+/+bW2LKA0Nfok=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=jHWJG9Qr4MPsD/Pjkw2AtobOIlfHsSnP8M5kfJgmJV5tIorjfFcfLkzj8t6+CaDkQ
	 5bQPAxF/cjHuSxJKZ2P4WMLbFURf7z5qTZpy5zlNkE+T5elbyRDc/PQ40+tkUma4LJ
	 W67pEbjR+n45KaJa1JTycI+Wd+75LN8cClfPDY9KjGrhaRYwmeYrfW1JfuD+JjzEcU
	 NDcTDb6LUnleDrUPWIsGizmygx3vtRZUAvrTCt1VoXlqadyPeuG9m0CnEgp2AJ2uQK
	 r76jM2AMQHV0YLIoOeyllNkmNVdfMVne8Mi+EtTC9g43BPoenl/vPHPsIAPmKlpLUt
	 tSXKQRSBOGWgg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jan 2026 17:39:09 +0100
Message-Id: <DFK7GA22REIQ.1YSKLW77KQAWH@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 06/12] rust: pin-init: rewrite `#[pin_data]` using `syn`
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Fiona Behrens" <me@Kloenk.dev>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Alban Kurti"
 <kurti@invicto.ai>
X-Mailer: aerc 0.21.0
References: <20260108135127.3153925-1-lossin@kernel.org>
 <20260108135127.3153925-7-lossin@kernel.org>
 <DFK2IZSN3G5Y.2ESC7WN213SYD@garyguo.net>
In-Reply-To: <DFK2IZSN3G5Y.2ESC7WN213SYD@garyguo.net>

On Fri Jan 9, 2026 at 1:47 PM CET, Gary Guo wrote:
> On Thu Jan 8, 2026 at 1:50 PM GMT, Benno Lossin wrote:
>> +impl Parse for Args {
>> +    fn parse(input: syn::parse::ParseStream) -> Result<Self> {
>> +        let lh =3D input.lookahead1();
>> +        if lh.peek(End) {
>> +            input.parse().map(Self::Nothing)
>
> How about make this `impl Parse for Option<Args>` and remove the nothing
> variant? It looks a bit weird.

`Option` is not fundamental, so I can't change the impl. Parse doesn't
have a blanket impl on `Option`. Maybe I'm not fully understanding the
change you're proposing.

>> +fn strip_pin_annotations(struct_: &mut syn::ItemStruct) {
>> +    for field in &mut struct_.fields {
>> +        field.attrs.retain(|a| !a.path().is_ident("pin"));
>> +    }
>> +}
>
> Multiple places have similar things for stripping annotations and checkin=
g if
> structurally pinned. Would it make sense to do this at the very beginning=
, and
> build a `HashSet` of structurally pinned fields, and use that as canonica=
l
> source for all generate_ functions?

There is https://github.com/Rust-for-Linux/pin-init/pull/94, and I don't
want to take away their work. I'll contact them and see if we can fold
it into this commit/series.

Cheers,
Benno
