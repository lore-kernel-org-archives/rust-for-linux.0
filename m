Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED80A26AF5
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Jan 2024 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705657422; cv=none; b=tfwD89EPR02CLsseht8w0phKSfXUU1clCeCE0eP4TPFpwq2TqBA6wH7x5BDT/5AGEYdjnztsV6UgL/CkjaazcuifgN80ftXSScNWw27VE3aLlXA0l86ToGPnBwk+ZFy1ab9zscfLxERsSSEi45XmXkE3kMJh3b4SS+CxVUpGJUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705657422; c=relaxed/simple;
	bh=tG2zsCK8yQbCDBC3gzpjutSRIN2h2t3FmjArqi3HUsA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uaS76WjTfs/mE8wnYlmXMFNUL/VIEzYFe65JSPJUCRive8zQj23lWY5lOU4K3ByCG5XEK2L1xgMH+HpY6eV4SFYR8sc15/5P5F7kk0bSOnmHsAJFi/jhAKBuqj2P4ZSzRL1OsTqQ5j26vIsQD4uvhJBcZHBhR13lPIq7Q1AXhRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=TYzO3Kv3; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="TYzO3Kv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=plqhpujkl5dg7mbbrfxmygange.protonmail; t=1705657418; x=1705916618;
	bh=+LdiskQeHEZLdxUpn/S/pubmhIJOcYkLCINwk9ZEXhs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TYzO3Kv3NP/nXCpS9KlHhzYw6dzOjNA9WCqWMCaf5s5TZI4X9gF8CoshCPEzWGb2V
	 Jw5CAxiB2CH0mQcsY6b6qehsWqgG/nc2AiC1LtSYGgstutdQpD5vPVE2i66PNAVCcT
	 mGlQ0CwXXmzR1kUCg4CCaRL5LANeLg7TNEPsUt97XUIwr3fAASwnHkC78D2v8BbTwY
	 22TBc1ACbb33Z6tDY59Y4hJlkaNQi9f+GZ2r2cTZVDmbhZlswHOvDsTbgjyhw8cEdk
	 0V3v6zPEix1/sDRey8BIe+KlDmpFJeupanjDH4vpl6DKxg/LS0LQwLvXm7HM5SUwfx
	 eJ3thEiUyWzfA==
Date: Fri, 19 Jan 2024 09:43:23 +0000
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Dan Williams <dan.j.williams@intel.com>, Kees Cook <keescook@chromium.org>, Matthew Wilcox <willy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3 4/9] rust: types: add `NotThreadSafe`
Message-ID: <a8caa050-4296-4b3f-aded-ef41bdf7972d@proton.me>
In-Reply-To: <20240118-alice-file-v3-4-9694b6f9580c@google.com>
References: <20240118-alice-file-v3-0-9694b6f9580c@google.com> <20240118-alice-file-v3-4-9694b6f9580c@google.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 1/18/24 15:36, Alice Ryhl wrote:
> This introduces a new marker type for types that shouldn't be thread
> safe. By adding a field of this type to a struct, it becomes non-Send
> and non-Sync, which means that it cannot be accessed in any way from
> threads other than the one it was created on.
>=20
> This is useful for APIs that require globals such as `current` to remain
> constant while the value exists.
>=20
> We update two existing users in the Kernel to use this helper:
>=20
>  * `Task::current()` - moving the return type of this value to a
>    different thread would not be safe as you can no longer be guaranteed
>    that the `current` pointer remains valid.
>  * Lock guards. Mutexes and spinlocks should be unlocked on the same
>    thread as where they were locked, so we enforce this using the Send
>    trait.
>=20
> There are also additional users in later patches of this patchset. See
> [1] and [2] for the discussion that led to the introducion of this
> patch.
>=20
> Link: https://lore.kernel.org/all/nFDPJFnzE9Q5cqY7FwSMByRH2OAn_BpI4H53NQf=
WIlN6I2qfmAqnkp2wRqn0XjMO65OyZY4h6P4K2nAGKJpAOSzksYXaiAK_FoH_8QbgBI4=3D@pro=
ton.me/ [1]
> Link: https://lore.kernel.org/all/nFDPJFnzE9Q5cqY7FwSMByRH2OAn_BpI4H53NQf=
WIlN6I2qfmAqnkp2wRqn0XjMO65OyZY4h6P4K2nAGKJpAOSzksYXaiAK_FoH_8QbgBI4=3D@pro=
ton.me/ [2]
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

--=20
Cheers,
Benno

