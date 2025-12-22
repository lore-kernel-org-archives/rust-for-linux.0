Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5E4326D4A;
	Mon, 22 Dec 2025 06:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766384859; cv=none; b=DKxia9++81pvSs3UGmNPBKfJPbI8W+KgEmzy51OQv1OrRGISHj0F6p+RXTzq3Em605BFD3R4SFDuOyDq3snhJBCzSG4Vcu7xOjIHUTKLNoX6IR8YT0KtHnMKP73kvzeVAB4oy7IGkr5hLbW8yqDA5HDZOO1Y6zWDsb2LmYhi7+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766384859; c=relaxed/simple;
	bh=geH/XlW8c8p3QOUcAAzLG2rsxTaTr7PINQkX9tAKwpQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=l3iX25prKTskIMQ8HHsZS4Zfv+Ywa+v8MWOo0X/B+DmXMG1mNVsUnB+YE0nSodITYJ5zsLkCUAMor8XyuTLf/mnGjQk5mnNRCwjpGsxMVs0X4Ve+hcPAcwAsF8zlasuaNtZnmfsv47dIl6oWLr4icjnkXsMPqHu2PWQgBFDZFTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQnLcN20; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQnLcN20"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0927C4CEF1;
	Mon, 22 Dec 2025 06:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766384858;
	bh=geH/XlW8c8p3QOUcAAzLG2rsxTaTr7PINQkX9tAKwpQ=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=FQnLcN20V/Wljj3AJgzRozUqoFH/ocOx+XiGYenLm49w3h/clD23nLVqeAxbjl/Pw
	 BZxgYjxImwRQPyx9BH5Bts4unBpxSmDoMYmxPZXjKzcd1oLb1amwNgzDrZXVB/c598
	 7EptZd/2vspcyFTpQmiZ0EWWb+VVekCjEVq/ulTQe9RhkUeFAFIURCzd/yIpqdQBhk
	 MNPtj69dtad0M4sVnyfTWsuXIgxFRDTYrN4PMlaDJfKgLp3fKEReXnmvD9ge3sYjht
	 2qPslsMhwJeNCwvPXVS2HQkjpCUTIsyQE34t0lqbATpx4q+k43O1/01wat4ZPyr5hw
	 8w2Pb1FoBZoWA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 07:27:33 +0100
Message-Id: <DF4J677NSJDC.3QY743918HBOI@kernel.org>
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
Subject: Re: [PATCH v16 15/17] rust: sync: lock/global: Add Backend
 parameter to GlobalGuard
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251215175806.102713-1-lyude@redhat.com>
 <20251215175806.102713-16-lyude@redhat.com>
In-Reply-To: <20251215175806.102713-16-lyude@redhat.com>

On Mon Dec 15, 2025 at 6:58 PM CET, Lyude Paul wrote:
> @@ -94,11 +94,11 @@ pub fn try_lock(&'static self) -> Option<GlobalGuard<=
'static, G>> {
>  /// A guard for a [`GlobalLock`].
>  ///
>  /// See [`global_lock!`] for examples.
> -pub struct GlobalGuard<'a, G: GlobalLockBackend> {
> -    inner: Guard<'a, G::Item, G::Backend>,
> +pub struct GlobalGuard<'a, G: GlobalLockBackend, B: Backend> {

Could be useful to make `B` have a default value of `G::Backend`?

Reviewed-by: Benno Lossin <lossin@kernel.org>

Cheers,
Benno

> +    inner: Guard<'a, G::Item, B>,
>  }
> =20
> -impl<'a, G: GlobalLockBackend> core::ops::Deref for GlobalGuard<'a, G> {
> +impl<'a, G: GlobalLockBackend, B: Backend> core::ops::Deref for GlobalGu=
ard<'a, G, B> {
>      type Target =3D G::Item;
> =20
>      fn deref(&self) -> &Self::Target {
