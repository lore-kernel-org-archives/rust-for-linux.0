Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6AA3A1E8B;
	Mon, 22 Dec 2025 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766384755; cv=none; b=G2NjPuFBQ/tBP14tQE9ENWYLNDQreVDW4KstCt2SE6H7oI7/cs7/3GtpHxT8rjWfIm2HUaqZSrqcSTJi1ugtFUvwNp03MXGKKW5HH6E/auIN4NcMelUodJWypXqvRpN0k28sbOf6j24KrPFOHHMTbVEKC9aX6u06CG25SK4nV0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766384755; c=relaxed/simple;
	bh=dvQguyIO5KfKblMuizrQIPeG/PDvxHJhMfJRbDgu1Yw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Nm9kWoGuUarP1EtmIWhLFUdBn/EGEUhycDmReuMdXceOwzSsfLc1Gyk5R4KbOwqskHnECbNCoRHmQqBouZWeskY1iYhGlf7fFCEfp7jCNR+rU6xGG5ycQFjAKOC/xfE2uTm9Tu3sfcFNQDI7Syk4ox8/4nW5CWXmxdLGOCtwVq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TD+pNXKY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TD+pNXKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD4BC4CEF1;
	Mon, 22 Dec 2025 06:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766384754;
	bh=dvQguyIO5KfKblMuizrQIPeG/PDvxHJhMfJRbDgu1Yw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=TD+pNXKYgFE+uvKOE7Tbis/0A0ee/6+btuGLiYEOkBfLqjy1w29d1/fb8XqbVAHvg
	 hejeJg7oJXrpXuGM1nN7yskclizUqb7Upq/a2kTiO1LOm7y9BcdLzTSbnBs/w/O0Gr
	 fFUVE9GfSAUe0JMl/UtStrX09RESAYhByOkZFaPWdEhKEezzZm6ZAczu36BKs5+X13
	 LS9sGGc5Y8PC/SABaYD5ZaB07V/SorZ8ivEImwgP+BSQHgjCv384Uf1bVKYMcbOLn/
	 8VrkkWla1zWeF6aRUMzgIsc5iXVcjUlGYnRyWn3D5Ophbp57A/+RKcs/OjHl5VInD8
	 nbptAymjBtHhA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 07:25:49 +0100
Message-Id: <DF4J4VKRL07V.9LLZA5UR1BD5@kernel.org>
Subject: Re: [PATCH v16 16/17] rust: sync: lock/global: Add BackendInContext
 support to GlobalLock
From: "Benno Lossin" <lossin@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>, "Will Deacon"
 <will@kernel.org>, "Waiman Long" <longman@redhat.com>
X-Mailer: aerc 0.21.0
References: <20251215175806.102713-1-lyude@redhat.com>
 <20251215175806.102713-17-lyude@redhat.com>
In-Reply-To: <20251215175806.102713-17-lyude@redhat.com>

On Mon Dec 15, 2025 at 6:58 PM CET, Lyude Paul wrote:
> Now that we have the ability to provide an explicit lifetime for a
> GlobalGuard and an explicit Backend for a GlobalGuard, we can finally
> implement lock_with() and try_lock_with().
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/sync/lock/global.rs | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/rust/kernel/sync/lock/global.rs b/rust/kernel/sync/lock/glob=
al.rs
> index 64fc7e7a4b282..7aee9b25baefc 100644
> --- a/rust/kernel/sync/lock/global.rs
> +++ b/rust/kernel/sync/lock/global.rs
> @@ -89,6 +89,34 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<'=
static, G, G::Backend>> {
>              inner: self.inner.try_lock()?,
>          })
>      }
> +
> +    /// Lock this global lock with the provided `context`.
> +    pub fn lock_with<'a, B>(
> +        &'static self,
> +        context: <G::Backend as Backend>::Context<'a>,
> +    ) -> GlobalGuard<'a, G, B>
> +    where
> +        G::Backend: Backend<BackendInContext =3D B>,
> +        B: Backend,

Since `BackendInContext` is an associated type, you don't need this type
parameter and can write instead:

    pub fn lock_with<'a>(
        &'static self,
        context: <G::Backend as Backend>::Context<'a>,
    ) -> GlobalGuard<'a, G, <G::Backend as Backend>::BackendInContext>
    where
        <G::Backend as Backend>::BackendInContext: Backend,

Cheers,
Benno

> +    {
> +        GlobalGuard {
> +            inner: self.inner.lock_with(context),
> +        }
> +    }
> +
> +    /// Try to lock this global lock with the provided `context`.
> +    pub fn try_lock_with<'a, B>(
> +        &'static self,
> +        context: <G::Backend as Backend>::Context<'a>,
> +    ) -> Option<GlobalGuard<'a, G, B>>
> +    where
> +        G::Backend: Backend<BackendInContext =3D B>,
> +        B: Backend,
> +    {
> +        Some(GlobalGuard {
> +            inner: self.inner.try_lock_with(context)?,
> +        })
> +    }
>  }
> =20
>  /// A guard for a [`GlobalLock`].

