Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7772421EFD;
	Wed,  4 Feb 2026 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218544; cv=none; b=YeSsTsLoYa4iYsIOVVf/mSBq4WM/RF5KhrguqUacZek0pVkviIiBEK/oMmRxrZBXQSXToBS+7L4iQnNj+800urJxLqi+K2BgF0OnVKZXVpKNS+L6HxFiLSsIoWgT9nW3OQGzKwf+Ro/DQyjDm0MbVtuOhC5m8IZ+SWhmRzGVmZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218544; c=relaxed/simple;
	bh=QKVVD+VED38HnrXr/JITeGWgjURaXPWa1Xedn84btf4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=qKXaw/JOmOVdYNpx7CsJhXimlkO4ks3MfeghzlOqDIZ4psQFDQfEW3FomIIlqRScEYDCnecQZh5wBb0PL99JSO+xqjY9bjWFK2LZhnIQPzp6woc0L4Uv1qoIF3MJ7enTmK6H+OAoQt/qfM5hs91w5NSu1dDgmjCwaBpX6mQbHgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TTfSlDeb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TTfSlDeb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7DBC4CEF7;
	Wed,  4 Feb 2026 15:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770218544;
	bh=QKVVD+VED38HnrXr/JITeGWgjURaXPWa1Xedn84btf4=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=TTfSlDebQAJqui1BgHSLQCpxmS1XraC4tCysTQlx/7N2g5rtB+tlpXXC0ldh9xiGD
	 OT8seMStZDGN8ZHn4zPekngkKI8Kvzghah8MwYXK7gHzIkPw8cT8Zj7K2ylotwmyyS
	 5bVn3aetLQXvUA5Hs4YZmtbHYz9r1UyD26f12s1cpSqTj6NaT3R8XUt5zAnjhjVuOe
	 s/9baVrvWxyOP6X+0aeCGahyFh/hVJDzPmYHNW5P/ri9bGycBC0GpaLlBJE3BU95XC
	 5Avy4MUetp//pSBPcuLXYM3oWMorFMHTYePXG6RB/exwpOEYhPKicSOTfJOVBWXyHq
	 Z/mUgO6aOJ6Ug==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 16:22:16 +0100
Message-Id: <DG6A3L2W1YC0.YOB6BUMGG38F@kernel.org>
To: "Link Mauve" <linkmauve@linkmauve.fr>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/4] rust: nvmem: Add an abstraction for nvmem
 providers
Cc: <rust-for-linux@vger.kernel.org>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, "Srinivas Kandagatla" <srini@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Ard Biesheuvel" <ardb@kernel.org>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, "Eric Biggers"
 <ebiggers@google.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Lyude Paul" <lyude@redhat.com>, "Asahi Lina" <lina+kernel@asahilina.net>,
 "Viresh Kumar" <viresh.kumar@linaro.org>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <officialTechflashYT@gmail.com>, "Ash Logan" <ash@heyquark.com>, "Roberto
 Van Eeden" <rw-r-r-0644@protonmail.com>,
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
References: <20260204040505.8447-1-linkmauve@linkmauve.fr>
 <20260204040505.8447-3-linkmauve@linkmauve.fr>
In-Reply-To: <20260204040505.8447-3-linkmauve@linkmauve.fr>

On Wed Feb 4, 2026 at 5:04 AM CET, Link Mauve wrote:
> +impl Device {
> +    /// Register a managed nvmem provider on the given device.
> +    pub fn nvmem_register<T>(&self, mut config: NvmemConfig<T>, priv_: &=
T::Priv)
> +    where
> +        T: NvmemProvider + Default,
> +    {
> +        // FIXME: The last cast to mut indicates some unsoundness here.
> +        config.inner.priv_ =3D core::ptr::from_ref(priv_).cast::<c_void>=
().cast_mut();
> +        config.inner.dev =3D self.as_raw();
> +        config.inner.reg_read =3D Some(NvmemConfig::<T>::reg_read);
> +        config.inner.reg_write =3D Some(NvmemConfig::<T>::reg_write);
> +        // SAFETY: Both self and config can=E2=80=99t be null here, and =
should have the correct type.
> +        unsafe { bindings::devm_nvmem_register(self.as_raw(), &config.in=
ner) };
> +    }
> +}

This should not be a method on the generic device type. Typically we use a
Registration struct for this, i.e. this would become
nvmem::Registration::register().
