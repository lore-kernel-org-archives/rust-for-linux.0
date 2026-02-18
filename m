Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77931271A6D;
	Wed, 18 Feb 2026 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407471; cv=none; b=GRN3DDs6YWzS828sj1kXNsw5UcoWR5+LG3olot/fdpQlHVigPM8+gWVpqvEN219pBgifAnYJrhzXq55FANt2uI8ICkKWHQ+PvTwPHZIjKO4YagvUK6AAUpNTD844q/pq7sbGAVNCrgssrXFwmd0kLHeMV1SWpVCmZQvMdwGCPqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407471; c=relaxed/simple;
	bh=5BhDohxi/Dt4pM2Aom0/HfkXZ43SmgfuTX1tvwIrp8w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=npGXUScmmAhbKycjIiWLa+YBIwheLrM30FQHZOVhT8MuGdRHobeAYBOuZcL7oje2so+LUi4eWjyYxLBdyyHikGWTxHQNu6JJRqjiDa0/X3G+a9QTl4JqtUfyDGQ/A5t/cS354r8K3YIsMrzZ2+Tuktg1SBABKmKydIoMIH8CX70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPqyI43l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPqyI43l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4685AC19421;
	Wed, 18 Feb 2026 09:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771407471;
	bh=5BhDohxi/Dt4pM2Aom0/HfkXZ43SmgfuTX1tvwIrp8w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kPqyI43lDuyH6COoxx8Jlawwo7f3PIUTUm3np3lZ3uUtlPTJNBhXG4I7B4hnl9Gmi
	 /yAWsqGgdzL9yHIh3nDunHON6BIqLbR7ZE9lK8QpEVWFdhNmstlelVuuiYFY3/9rRa
	 oje/E/aYEw8zgoOYUAmP35mpChGING4E2TF6Vuv+1wikJlty9OTYwF+wl8svtE5MuT
	 AMeNE/2CGnP8ycuwSL/ZebbuwtnORNKnH4Rbtk2VgQwCNUwiwie7dOK1N2fB3O36er
	 ADC3JXSKGa5j4wh0BQBf9V3tvqNcz5JZWJ7Hu316Tb2NNtUq540K29U5fGsNth3HD+
	 fEiDWQaE3rN7w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: page: add method to copy data between safe pages
In-Reply-To: <CANiq72kZQiu9DbQgkHXDDjHORwUdTm7oOhZOE4Tr8eHiyW7RbQ@mail.gmail.com>
References: <20260215-page-additions-v1-0-4827790a9bc4@kernel.org>
 <20260215-page-additions-v1-2-4827790a9bc4@kernel.org>
 <g4ihY-XQwSZ3ysINoU0v3jFzzJG7Uzonq0b6C-EYEYDx4pbJWHHJ1hYmQsmGATIDzexHv6NFea8YNikY6zXq6w==@protonmail.internalid>
 <CANiq72kovxkiF1Kj66yVyQYKx1OijjtTGB6UN5M35th57UFFeQ@mail.gmail.com>
 <87ldgteftm.fsf@t14s.mail-host-address-is-not-set>
 <RHTfcS8-6wqboBRd0aNAk2RG-phiMsedyL_E78rwI1FbLtNzmdCAlk5Es1KyQMPV_-KAtJw_-ImmDchI0Mp0Gg==@protonmail.internalid>
 <CANiq72kZQiu9DbQgkHXDDjHORwUdTm7oOhZOE4Tr8eHiyW7RbQ@mail.gmail.com>
Date: Wed, 18 Feb 2026 10:37:43 +0100
Message-ID: <87v7fubdeg.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Mon, Feb 16, 2026 at 12:42=E2=80=AFAM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>
>> Why?
>
> If you mean why we don't do it everywhere, then it is because for many
> functions it wouldn't add much value, but it would add substantial
> verbosity, which has a cost for both readers and writers.
>
> Originally, we picked the standard library style, because it seemed
> like a good balance that both had shown good results (especially for
> this language, where we have rich, strong types in signatures which
> help reduce the need) and that would get others to write docs easily.
>
> Sometimes it may be needed, e.g. there are many parameters with
> details to explain that wouldn't read well otherwise, or there are
> primitive integers parameters with constraints on them (instead of a
> newtype that enforces them) and so on.
>
> i.e. why do you think you need it here? When a reader sees the list,
> they will need to pause to read it, thinking there is something
> important/subtle there -- is there?
>
> (I say this as someone that generally likes structured, "exhaustive"
> documentation such as, say, the classic Win32 docs...)

I would rather not get into an argument about things that are subjective,
but if we picked a style, I should for sure follow that.

If we picked a style for documenting argument lists, perhaps we should
add it to Documentation/rust/coding-guidelines.rst?

>
>> Writes require a mutable reference. There cannot be a mutable reference
>> while we have a shared reference.
>
> Ok, but I am trying to map what you wrote with what the callee
> requires. In the second bullet point, you justify there are no races
> for the read side, and the third one for the write side. But you refer
> to the type invariant in the second one, for some reason, and that
> type invariant already promises no data races for `SafePage`, and all
> we have here are `SafePage`s on both sides, no?
>
> So to me it sounds like either you could justify everything just by
> invoking the type invariant (that is why I mentioned circular
> reasoning, because the type invariant doesn't seem justified itself in
> `// INVARIANT:`) or the type invariant is actually a different, weaker
> one (which would explain why you need extra explanations in `//
> SAFETY:` on top of the type invariant).
>
> (By the way, if we use bullet points, then I think we should map each
> to the callee's one, i.e. #2 and #3 would be together since #2 is the
> one in the callee about data races).

Others called out that the type invariant on `SafePage` is mushy. I will
try to tighten that up. I want it to convey the information that the
data of this page follows standard Rust aliasing rules. If you have a
shared reference to a `SafePage`, there can be no writes to the data. If
you have an exclusive reference, you are the only writer, and there are
no other readers.

I disagree that the bullets should be swapped. The second bullet at the
call site:

  // - By type invariant and existence of shared reference, there are no ot=
her writes to
  //   `src` during this call.

Maps to the second bullet in the callee safety requirements:

  /// * Callers must ensure that there are no concurrent writes to the sour=
ce memory region.

The third bullet at the call site:

  // - By exclusive ownership of `dst`, there are no other writes to `dst` =
during this
  //   call.

Maps to the third bullet of the callee safety requirements:


  /// * Callers must ensure that this call does not race with a read or wri=
te to the same page
  ///   that overlaps with this write.

I think it checks out? `self` becomes `src` at the call site.

But now that I look, I think it should say:

  // - By type invariant and existence of shared reference, there are no wr=
ites to
  //   `src` during this call.

That is, the word "other" is misleading. There are no writers, not us -
not others. We are doing a read of `src`.

Best regards,
Andreas Hindborg


