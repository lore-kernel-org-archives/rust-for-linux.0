Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122E51A38E1
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 22:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742854088; cv=none; b=WffOAv7jslUgLwNYibAkmNtNFapzd/gC+b0TzEJN0N5XfB2rQ9WMVUCaaADMu8nJ87dZ5OvefEOzt1WZnyWzoNB92mzMq/uMh3hzDVGzNjW/qv74yql5wL4cnKDeoxe8kw9Gxej/wfhOH6ZEzmJpMgjKX1oOFQEAsBXEEPdkX/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742854088; c=relaxed/simple;
	bh=prSCQBg7smOkYOPdg79z019jrIYNrwA4QyC9M2Wng2I=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jjsZ3GFkRl41XeyxRUC21Bf4fWyFRbGqkoAkk5C+f2lgn4w7Gaxv9MHgqyF55v4wrB9n9nK3IjtAMppC2gRLcAQnZfkOHivw8mUjjQsmmhVaM3omy8aspjN/FlNOt1SQgZPLnD2srPbNZ3KxJlVWSCwYLGH5NinQfhNwAxdsx40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=KgMXlUSI; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="KgMXlUSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=thbw5iiwh5bdpmrj7l2ttojuvm.protonmail; t=1742854083; x=1743113283;
	bh=DWui/hVY6ZxHgBntphJzAodXbH550NTvVJn4yNgMU+8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=KgMXlUSIc8i/NbjtLqFdX7kJ1QFkEo12UP4/CLZAlfclJeSn0MACbnW6j4AsjN2y/
	 sv5simvv4XMMagswhAXvbLgB7F5Lcw5cTS95wv7lUYV0c+gmMZoWS+RLT6FYXmkYmB
	 WJZwEcMP7h/vJVt0f8oPjmRZRR0dI2K4lvFYfaxRhtp21NpJSeeItDArvRLkZ1SpZH
	 PTMEATLk1wcYx0AXMs1puVh/pMD+eMfzMYxmngqI8dOGB46mnW8K2C6hRbagqDtvw0
	 jlVT79sgeYYjVmUPRzKNi6LckqL0NKkUPyILU8MytdZsZ56DHF+oi7Qy4tvV/yp3lF
	 UCUMk34gQqnuA==
Date: Mon, 24 Mar 2025 22:07:58 +0000
To: Altan Ozlu <altan@ozlu.eu>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: static_assert: add optional message
Message-ID: <D8OU7GR41GBP.1ESS80USPVQ4O@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 72dcb5949a62a77f6f2f51cd551fc3162fc7f099
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Mar 24, 2025 at 10:01 PM CET, Altan Ozlu wrote:
> Add optional panic message for `static_assert!` macro.

s/Add/Add an/

> It doesn't support argument formatting, due to `const_format_args`
> being experimental. It will fail to compile if a message with argument
> is given.

I don't think that this is the correct reason to give why it's not
supported. As you mentioned in another mail, the feature is a
compiler-internal feature and is not intended to be stabilized. Yes the
error reported by the compiler references the `const_format_args` macro,
but that's an implementation detail of `assert`, so I wouldn't put too
much weight into it.

Instead I would just say that `assert!` doesn't yet support formatting
in const contexts (maybe also add that to the documentation, so someone
will complain when that's been implemented and it flew under our radar).

> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1149
> Signed-off-by: Altan Ozlu <altan@ozlu.eu>

Usually when sending a new version of a patch, you don't send it in
reply to the previous version.

---
Cheers,
Benno

> ---
>  rust/kernel/static_assert.rs | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

