Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734162FF161;
	Tue,  6 Jan 2026 20:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767731136; cv=none; b=MwN6uqfUqbhsWRJ8h2Pfb90Ehu3PO024CcrM/QRdRUIj0mz4hUfRUNELy2DKFTKuTl3wclOrWlQZpl9bzK5d73zl6L0nAmekwrIbS8Vt6L2n00VyZX5zQRHSFYKSHbOhTosk9OIsnIDc7pUyFfsHt9KfiupOepfbO1a6vFEKoIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767731136; c=relaxed/simple;
	bh=MKj+Ye12wUndxifMsp2X7RZrJSg2Sn2dUSISyzRLZ0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JP3elHyyA1oKipJf3dmNrLuMVxMmePgzU9O2LVB6Dv72sSBKftoPCisd16JxvWc1DWW4bC/uOKm5zHM1d5PrryjJ3CI4BDynY8TlEweDFW+yBTyNZPQPZeVo9uudWndkqrTsnfEnBuzjWzYed6NcpIqjtr1NS1ISY7edDoV/jsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUgnygKs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUgnygKs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6281EC116C6;
	Tue,  6 Jan 2026 20:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767731135;
	bh=MKj+Ye12wUndxifMsp2X7RZrJSg2Sn2dUSISyzRLZ0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iUgnygKskXmoRSya5AVCqO4NNrN0q/bA370tn/gyVrHvFCTo9m1WjllddNOUFPORw
	 SxBNQCg+8K43vTHNmSY6vOWJ2RQVLh4N8pvkv/WExNwJKOAB/V6WjVI9v29b4uS4oA
	 O21xEoIv5OfD5j/F3kXY4Z13ABl6VAYP+9/dDpwDcKh0f4/yZMprPzazGzfQ12vi/t
	 SlUmaW0QJER7dQIrfN6id2qb8qLa3hSa7l3/5Z1mpqzelXMU3SoKAFYr0WF2hg2F+r
	 2VwCbkJEBNkOqFgxExyYRyOoXl9IwTDfOzjgMHCnF1YIHdW5oXOTSjkFRA6S7C4h0p
	 zPGSPA8JjlrbA==
Date: Tue, 6 Jan 2026 12:25:34 -0800
From: Kees Cook <kees@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Ramon de C Valle <rcvalle@google.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: declare cfi_encoding for lru_status
Message-ID: <202601061223.E39B079CA@keescook>
References: <20260105-cfi-lru-status-v1-1-0b2401f7c5b2@google.com>
 <202601061201.2CFE0303CB@keescook>
 <CAGSQo000gN5-33yQnuXw08v3+4ZNDbDH780-P+mHmGmtSz9=mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo000gN5-33yQnuXw08v3+4ZNDbDH780-P+mHmGmtSz9=mw@mail.gmail.com>

On Tue, Jan 06, 2026 at 12:18:41PM -0800, Matthew Maurer wrote:
> On Tue, Jan 6, 2026 at 12:01 PM Kees Cook <kees@kernel.org> wrote:
> >
> > On Mon, Jan 05, 2026 at 04:12:47PM +0000, Alice Ryhl wrote:
> > > By default bindgen will convert 'enum lru_status' into a typedef for an
> > > integer, but this leads to the wrong cfi type. It's supposed to be a
> > > type called "lru_status" rather than the underlying native integer type.
> >
> > Is this a bug in bindgen?
> 
> Kind of, kind of not. The things that are interacting here:
> 
> Rust assumes that enums have all their variants defined in its
> codegen. This means that if the Rust definition for an integer enum
> has variants A=0, B=1, and C=2, and we get sent `0xffff` from C,
> undefined behavior occurs. To mitigate that, `bindgen` usually (unless
> explicitly told otherwise) *does not* represent C enums as Rust enums.
> There are several ways to do this. The default, usually used in the
> kernel, is to represent them as integers of the correct size with a
> set of constants available to compare them against. Alice has added an
> exception for this type which switches it to use
> `#[repr(transparent)]` struct lru_status(int_of_appropriate_width)` as
> the type.
> 
> The Rust CFI implementation assumes:
> 
> 1. `#[repr(C)] struct MyStruct {` should have an encoding equivalent
> to a C type named `MyStruct` in the root namespace, similar to using
> `extern "C" {` in C++.
> 2. `#[repr(transparent)] struct Foo {` uses an encoding equivalent to
> that of its only non-zero-sized field. This is done because the usual
> reason for `#[repr(transparent)]` is to guarantee that the layout is
> identical to that field so you can safely transmute between the struct
> and its field in certain scenarios. There are several places in
> commonly used Rust libraries where CFI will report if
> `#[repr(transparent)] struct Foo { bar: Bar }` is not encoded
> equivalently to `Bar` as a result.
> 
> If `bindgen` output `#[repr(C)] struct
> lru_status(int_of_appropriate_width)`, it would just work, since that
> encodes as a C struct named `lru_status`, which happens to be the same
> as a C enum named `lru_status`. However, outside the scope of CFI,
> labeling this as `#[repr(C)]` rather than `#[repr(transparent)]` makes
> no sense.
> 
> What Alice is doing would create a struct with `#[cfi_encoding =
> "myencoding"] #[repr(transparent)] struct lru_status(i32);`, which
> would get treated as a transparent struct, but have the provided
> encoding.
> 
> The possible fixes in bindgen would be to provide
> yet-another-enum-generation-mode which causes `#[repr(C)] struct
> lru_status(` to be generated (easiest) or to automatically attach
> `#[cfi_encoding = "correctencoding"]` for all declared types, possibly
> by querying clang first. This latter approach could theoretically come
> with an error to emit if CFI encodings were being generated but a type
> that would need one is using a raw integer (which can't have a CFI
> encoding attached).

I see; thanks for the detailed explanation! My main reason for asking
about this was wondering if this was going to be something that needed
to be fixed for all enums, or if this was more of a one-off. It sounds
like it's basically a one-off due to how the enum was chosen to be
mapped in this case, so that's less concerning. I guess we just need to
make note of this when choosing that kind of mapping in the future?

-- 
Kees Cook
