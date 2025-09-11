Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6182C11C4
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Sep 2025 21:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757626450; cv=none; b=TOb21vN7uxBQIYP/3hrpMBNY1oE2BQasuf4Pg9JA5dqhr9sHhMIShrjVCVT8vYqIAqKnx8rLc95ni/nAT7hx/hZ2NXGdO2uttS+Y7sYwGZtoihIYlc4GWrekwz7dZqRQTQnWdfNMD7DrXJNUv6V34i1s6O48Cq3UuE7zs2JCFyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757626450; c=relaxed/simple;
	bh=DArQZMSzbiv1lP5IGrAzxpiqV93uZUFZ+nF0H+B7CCQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=iuCZBHsHGyRdoXfozwSo+U2xofywi2jfDCAAF1xjtDI79aSsQzfd6X9fFXivnKziujNbXAiWd1snw7WUyHe/SDua5rQgDb7wjkGZhuBAlrdqc4/QvKzDipK3zvjEge3s1+meq0z6LquXSmokSoDunJH0SsWCK2oQk+tV/cowKh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYGBY3Bi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYGBY3Bi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA59C4CEF0;
	Thu, 11 Sep 2025 21:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757626449;
	bh=DArQZMSzbiv1lP5IGrAzxpiqV93uZUFZ+nF0H+B7CCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYGBY3BiPmtVs4J5aiLkGRwfsAr1fk5/vzIFCevVaulQNq4iWcocLwKh9Js+9tQqO
	 2/lLGwcFBVZ3E3XmrZ4NSnHZspS1I/O6S30r6OYBMglXs0vv8jzSMMf8iacq4Kxwwv
	 JEGAZuOXPgn7cToqLhFUTCQGCBoTnHfY6+BwGYhE0NNWE+UFxBox83PTy5IOpBJ1oa
	 5z1UrVKbJxhRsNEaILBWex+y1m+mr6DOmfXDs0coPg4wHn8XExy02NkBCg3zJl5eIE
	 Sr3dt7YC0b30laR5ycYMuVLNxw3/yX8nGE4qJpDqo0niBQk+mOCCQ1rio9EGZNj47f
	 82GgARQ3V3VlQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 23:34:02 +0200
Message-Id: <DCQAKOW781U4.21PDX0X4EPPX2@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/2] pin-init sync v6.18
X-Mailer: aerc 0.21.0
References: <20250905133401.3312707-1-lossin@kernel.org>
In-Reply-To: <20250905133401.3312707-1-lossin@kernel.org>

On Fri Sep 5, 2025 at 3:33 PM CEST, Benno Lossin wrote:
> Some very small changes coming from CI fixes & a readme update. These
> changes are already merged upstream & originate from these pull
> requests:
>
> * https://github.com/Rust-for-Linux/pin-init/pull/79
> * https://github.com/Rust-for-Linux/pin-init/pull/80
> * https://github.com/Rust-for-Linux/pin-init/pull/81
> * https://github.com/Rust-for-Linux/pin-init/pull/82
>
> Note that 80 & 82 only changed CI, test & cargo files that aren't
> included in the kernel tree.
>
> Benno Lossin (2):
>   rust: pin-init: examples: error: use `Error` in `fn main()`
>   rust: pin-init: README: add information banner on the rename to
>     `pin-init`
>
>  rust/pin-init/README.md         | 12 ++++++++++++
>  rust/pin-init/examples/error.rs |  4 +++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
>
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585

Applied to pin-init-next, thanks everyone!

I left the typo in, since I will need to fix that upstream next cycle.
The banner might also be gone next cycle, so I don't think it matters
too much.

---
Cheers,
Benno
