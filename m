Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7165C20C49E
	for <rust-for-linux@vger.kernel.org>; Thu,  1 May 2025 16:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746117520; cv=none; b=UqvFe3CpiiokGGF3WHJTKaXX9qNrOX93kctZxMbkYR5axCcmIa4o3U/3efIg4ImKKB6RkULYKG1dQKXY4J+KuI6wNiRDGyCK1rTAefAEe0siZ1O4ATEmJB9HnxxeFyUIQvoADFbC14QlJ3UxLNg5I9pLgGlpMcZR2aRZHlm3//8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746117520; c=relaxed/simple;
	bh=mq9cB7mvgmVF/wtmdcOXWkQn/YStMMR66oEsQjN7E/o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dUVYSCgCVqy4Ew7qT7QZ3wiVehtvKMLEDqRf3tIUE5xUINXfBeeJYZNb3B10fSGezLkC3liIVGwDpOdcTiBx7jRaUZrrYHrif0mgj2JvL+UqtkQhUSwIlxDBctHKmJHKVGG94bg/ZHBzVhWrG5BkY8pj6H6Ol0EDNdawUdQuz+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E45/8xbI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E45/8xbI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55C4C4CEE3;
	Thu,  1 May 2025 16:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746117519;
	bh=mq9cB7mvgmVF/wtmdcOXWkQn/YStMMR66oEsQjN7E/o=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=E45/8xbI/3es3dhBK/yHrHLtmOfI5Jj6Myr008dGaG485v+n4RQFc1K4NB5ExJuUW
	 x1n3WHj1n02ZNzb+6ocsQgeVtkgkGtktTWG1/QBjvp2vU5uLgmlO5bWlM7vK5avUIV
	 UjZG5L36+9QA3IkywJR14/f51z/Ajstfwh1E5l9qI3QucXE3C81tdBGUnBQ8ShAXdA
	 iBp9nXS624dbMR9nSNgqDMlZG6cO3QqOTJNZdvc2aTIJfllbg0nOa+o7bXwdGttKl5
	 Tsw7Y4wUfwNwK3ZjvvQGNjPc7gl3aMRRGK12YYy0aVT7Qtt8dSeQ5kFIJ9J1kuTHSZ
	 B2d9YgWaldD+A==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 May 2025 18:38:35 +0200
Message-Id: <D9KZ00WU5YM5.235RJ2R0YSDC9@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/8] pin-init sync for v6.16
From: "Benno Lossin" <lossin@kernel.org>
To: "Benno Lossin" <benno.lossin@proton.me>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250421221728.528089-1-benno.lossin@proton.me>
In-Reply-To: <20250421221728.528089-1-benno.lossin@proton.me>

On Tue Apr 22, 2025 at 12:17 AM CEST, Benno Lossin wrote:
> Synchronize changes from the upstream repository for v6.16. Branch with
> all commits on top can be found at [1].
>
> I did not expect that I would synchronize a lot of changes this soon,
> but here we are. They are pretty conservative, so I don't expect anyone
> to object (if you do find something, of course speak up!). A short
> overview of the changes:
>
> * Make the `Zeroable` derive macro compatible with field visibility and
>   add union support.
> * Add a new derive macro for `Zeroable` in order to allow deriving it in
>   bindgen-generated crates.
> * Add the `Wrapper` trait to allow initializing wrapper types (such as
>   `UnsafeCell` and `UnsafePinned`) via pin-initializers.
>
> [1]: https://github.com/y86-dev/linux pin-init/sync
>
> ---
> Cheers,
> Benno
>
> Benno Lossin (4):
>   rust: pin-init: add `cast_[pin_]init` functions to change the
>     initialized type
>   rust: pin-init: allow `pub` fields in `derive(Zeroable)`
>   rust: pin-init: allow `Zeroable` derive macro to also be applied to
>     unions
>   rust: pin-init: add `MaybeZeroable` derive macro
>
> Christian Schrefl (4):
>   rust: pin-init: Add the `Wrapper` trait.
>   rust: pin-init: Implement `Wrapper` for `UnsafePinned` behind feature
>     flag.
>   rust: pin-init: Update Changelog and Readme
>   rust: pin-init: Update the structural pinning link in readme.
>
>  rust/pin-init/README.md                |   8 +-
>  rust/pin-init/internal/src/lib.rs      |   5 +
>  rust/pin-init/internal/src/zeroable.rs |  27 +++++-
>  rust/pin-init/src/lib.rs               | 126 ++++++++++++++++++++++++-
>  rust/pin-init/src/macros.rs            |  91 +++++++++++++++++-
>  5 files changed, 253 insertions(+), 4 deletions(-)
>
>
> base-commit: 39051adb070432b283e6c11b2b24937281b9f97f

Applied to pin-init-next -- thanks everyone!

---
Cheers,
Benno
