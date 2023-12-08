Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fZU5w/HM"
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A900E0
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Dec 2023 10:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1702061591; x=1702320791;
	bh=Fhwl8VP9SjH2PlvxlgvaOamJ8GNORSKnzUM4ViTldZE=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fZU5w/HMO4INzcjjSc13fW7vhFlM7zNLFwbuBPR8P4gXsytul1t2xePUYF747uFXw
	 8Uijcz8Ea+NqbKINzuMa2xvEiLK0Nmsh35rjY1GqQsV2fPswU1P1n/azz9EruE1J5N
	 p3dpyj2+88lDlA5H9H361AQMxKkEpLac15CkwX+3ZP87Fso6I9rddt6IiHXaEsmcqB
	 XhZ+jhKkKgVQhcOSiCha1DuMuf9LZN8FGZSd2D66Jw6VKbZmaiZj/YTXBvy+16nMvB
	 YixP2BCOeLalQoxR2bgi/6METsJAPL/oi9xavpdBFeyMtpDfldDU3/zOTIOKCQldWA
	 6amYA/7lmJIBA==
Date: Fri, 08 Dec 2023 18:53:04 +0000
To: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH v2] docs: rust: Add rusttest info
Message-ID: <90f63ef6-bdf4-4800-825e-f7488da435ac@proton.me>
In-Reply-To: <20231208071455.2584037-1-dirk.behme@de.bosch.com>
References: <20231208071455.2584037-1-dirk.behme@de.bosch.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/8/23 08:14, Dirk Behme wrote:
> Searching the Rust kernel documentation all existing Rust Make
> targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
> rust-analyzer) are explicitly documented with their Make syntax.
> While the Make target rusttest is mentioned two times in the
> existing documentation, it's Make syntax is not explicitly
> documented, yet. Add a test section to document this.
>=20
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
> v2: Added the comments from Benno and Trevor. Thanks!
>=20
>  Documentation/rust/general-information.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/rust/general-information.rst b/Documentation/r=
ust/general-information.rst
> index 081397827a7ea..0972ef12690e6 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -77,3 +77,17 @@ configuration:
>  =09#[cfg(CONFIG_X=3D"y")]   // Enabled as a built-in (`y`)
>  =09#[cfg(CONFIG_X=3D"m")]   // Enabled as a module   (`m`)
>  =09#[cfg(not(CONFIG_X))]  // Disabled
> +
> +Testing
> +-------
> +
> +To run the Rust tests, you can use the following make target::
> +
> +=09make LLVM=3D1 rusttest
> +
> +This requires the kernel .config and downloads external repos.
> +
> +The tests can be run via kunit, too::

I would not put the "," there. But I am not a native speaker, so my
advice might be wrong.

--=20
Cheers,
Benno

> +
> +=09./tools/testing/kunit/kunit.py run --make_options LLVM=3D1 --arch x86=
_64 --kconfig_add CONFIG_RUST=3Dy
> +


