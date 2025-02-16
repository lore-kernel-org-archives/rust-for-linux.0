Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9725C1917F0
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Feb 2025 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739709660; cv=none; b=fZziGVuUGw7LRSl9Sc2gYuMGahIbv8jCabQPLB6140us7ZnKVU1dLN1ZQU1/xEhtKhBKW9E84mLaH7gJAEv0nNzRNXDgEiWalzeQFDyJEqIbBHLV7UG7sJ00tP1FqESJfQmTlpVTtUarqlR9OIDf7hIETHr5XEo4Xh3U4klyIEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739709660; c=relaxed/simple;
	bh=Sc85HGzsFWfaGk/iyYFW84nqwWegZPXqD9lfA1Wbgl8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YoJLW/r2ct2DZGdG7TLVWnjUtPOs01JCoqEI6IdMrMeHe3ZMOwkC5gg3XUJSJbPwRHRZee+sXoOGYQn7xf9hwSSTbuoF0MoZgmnXumdBULzgbhfc63hrm/lJ7qt4Y76d/UJB1T8vFw5aiGvrVh1oq5VnzaYuW+IkRSMZ7UJtN0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=Rzb0CxzJ; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="Rzb0CxzJ"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 96DED240104
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Feb 2025 13:40:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1739709650; bh=Sc85HGzsFWfaGk/iyYFW84nqwWegZPXqD9lfA1Wbgl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=Rzb0CxzJve8CE/LMVHheOE4GraSzgepj/E2ebT0GYsSIZVVTcdCi7b0wbSudZxR1a
	 qA0LDn0ZXcu8pvVFj2Ew8MSY9XTE/3W3bMDad1RWiNYvzw6C3dV1PlEXKJAvDljrEp
	 z1fgcf42F0nr/JMso5utMo1wevL2ZlPXSzGzzutMrvhLaBcWZiM3mBpA4VOXg7sUEu
	 UpFFSabVH/Pkj4sKF8SKJFTg6JYZ1uTncFduumBS6gBQZHXslNzJjFgBO9+GLvgLWO
	 wos7+ASA7DNPCyqSkD7gWCOzAVWNLA4T/ONXJ3jDp7plszo/fHhRXaFBsszi6hU10Y
	 RonxCxr+2tclw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Ywlkl1pHmz6tvq;
	Sun, 16 Feb 2025 13:40:47 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  "Rafael J. Wysocki"
 <rafael@kernel.org>,  Danilo Krummrich <dakr@kernel.org>,  Miguel Ojeda
 <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng
 <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6?=
 =?utf-8?Q?rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  Nathan Chancellor <nathan@kernel.org>,  Nick Desaulniers
 <ndesaulniers@google.com>,  Bill Wendling <morbo@google.com>,  Justin
 Stitt <justinstitt@google.com>,  Wedson Almeida Filho
 <wedsonaf@gmail.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org,  llvm@lists.linux.dev
Subject: Re: [PATCH] rust: fix clippy::too-long-first-doc-paragraph
In-Reply-To: <10690211-eb3b-4b95-8d9d-35c62930d924@proton.me>
References: <20250215223106.2346285-1-benno.lossin@proton.me>
	<m21pvy927w.fsf@posteo.net>
	<10690211-eb3b-4b95-8d9d-35c62930d924@proton.me>
Date: Sun, 16 Feb 2025 12:40:46 +0000
Message-ID: <m2v7ta6p0x.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Benno Lossin <benno.lossin@proton.me> writes:

> On 16.02.25 01:12, Charalampos Mitrodimas wrote:
>> Benno Lossin <benno.lossin@proton.me> writes:
>> 
[..snip..]
>> Hi,
>> 
>> I cannot reproduce this as-is, but adding
>> "-Wclippy::too_long_first_doc_paragraph" to the "rust_common_flags" in
>> the Makefile reproduces it. Maybe try adding it there in your patch?
>
> I have done some more digging and bisected my Rust version. It turns out
> I was on a rather old nightly from last September. I also don't get the
> error on a newer compiler version. My bisection identified that the
> error last occurs in nightly 2024-10-18, so from 2024-10-19 onwards it
> compiles without the error.
> So probably `-Wclippy::all` implied the `too_long_first_doc_paragraph`
> lint in that version. That is probably because of [1]. It changes the
> lint from style to nursery.
>
> [1]: https://github.com/rust-lang/rust-clippy/pull/13551
>
> So we don't need this patch, as it seems this never hit stable. However,
> there is already a patch fixing what this lint reports: 2f390cc58943
> ("rust: provide proper code documentation titles").
>
> I think it's a good lint, so maybe we should turn it on?

Given the critical importance of readable documentation, I agree.

>
> ---
> Cheers,
> Benno
