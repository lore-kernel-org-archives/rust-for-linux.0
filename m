Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5F43207;
	Thu, 25 Dec 2025 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766684556; cv=none; b=V7gSbInxRm0FptwUKklFoPjH0siZ2K3j645rX7k5bZ1eOKADdXpIje66/l0WEZKjKiiuUuDFfohE0038BW6IzBYqU5Yq+lUERRo/OjbZIm4kohuKBkR7WMt5B+v5i5AQrbAMMsaGhjoBGe/WtQLHfwEiT9OPPO5zIfSc55dZHno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766684556; c=relaxed/simple;
	bh=Q6K0G+6uAJEJNLBbvH8mvTIdhAB5aN6l2vYgs0mXJzY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=L3vyqZ/kbwGGPOeodF2/Ob3Lm//uvPHUGt3fg7DN8jdDkat0pWtYfeR+ee/21X6g7F3sY0s91/Cue8qaLfmjk4SqxSmQsJbCWgoSlN2CwqrnLadMrbI73Phplz8KAOJS18fsv4cEe9U9m861TJg89ZoOIJNDMjOGRyXzp3eYSkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZTJyut0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZTJyut0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C94C4CEF1;
	Thu, 25 Dec 2025 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766684555;
	bh=Q6K0G+6uAJEJNLBbvH8mvTIdhAB5aN6l2vYgs0mXJzY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=UZTJyut0cPLRM7AoZquwviH1Y8Y94oaSklV1M/KbiMPANXS0L2gabgWJh30homC5q
	 0+xuMvAAwQUC/t8MvKAurmP2eXzH96tcDloMkmriC9oqSMX3J7thMBpvrqL2lAh62R
	 kib+0MUzU+CzaOVfBnK/+1DpdomvA7Gf5JayaO0GyhYwG36hAHcbDhYKUvW8ZO/nkk
	 AjqqGxcWBUyamGNcdgEJ3KWMLm0CXAMTj8lTEgH/Bc0qOWqdW0Wo0/7g/PW2DOrKlI
	 W8I4W0q1MMCZHgTfTyHHsk9NwTKT+CI2FDUgrCztOe4bfCwU6xL+Y+Ykj4U0vrV2V+
	 XiPAWsALH7aZg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Dec 2025 18:42:31 +0100
Message-Id: <DF7HEMI7I3LS.FW1IPV2QS2HB@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/4] rust: macros: add derive macro for `TryFrom`
From: "Benno Lossin" <lossin@kernel.org>
To: <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com>
 <20251225-try-from-into-macro-v4-2-4a563d597836@gmail.com>
In-Reply-To: <20251225-try-from-into-macro-v4-2-4a563d597836@gmail.com>

On Thu Dec 25, 2025 at 9:37 AM CET, Jesung Yang via B4 Relay wrote:
> +/// ## Compile-time Overflow Assertion
> +///
> +/// The following examples do not compile:
> +///
> +/// ```compile_fail
> +/// # use kernel::macros::Into;
> +/// #[derive(Into)]
> +/// #[into(u8)]
> +/// enum Foo {
> +///     // `256` is larger than `u8::MAX`.
> +///     A =3D 256,
> +/// }
> +/// ```
> +///
> +/// ```compile_fail
> +/// # use kernel::macros::Into;
> +/// #[derive(Into)]
> +/// #[into(u8)]
> +/// enum Foo {
> +///     // `-1` cannot be represented with `u8`.
> +///     A =3D -1,
> +/// }
> +/// ```

These two are copy-pasted from the `into` macro.

Cheers,
Benno

> +///
> +/// ## Unsupported Cases
> +///
> +/// The following examples do not compile:
> +///
> +/// ```compile_fail
> +/// # use kernel::macros::TryFrom;
> +/// // Tuple-like enums or struct-like enums are not allowed.
> +/// #[derive(TryFrom)]
> +/// enum Foo {
> +///     A(u8),
> +///     B { inner: u8 },
> +/// }
> +/// ```
> +///
> +/// ```compile_fail
> +/// # use kernel::macros::TryFrom;
> +/// // Structs are not allowed.
> +/// #[derive(TryFrom)]
> +/// struct Foo(u8);
> +/// ```
> +#[proc_macro_derive(TryFrom, attributes(try_from))]
> +pub fn derive_try_from(input: TokenStream) -> TokenStream {
> +    let input =3D parse_macro_input!(input as DeriveInput);
> +    convert::derive_try_from(input)
> +        .unwrap_or_else(syn::Error::into_compile_error)
> +        .into()
> +}

