Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fRH5dbLi"
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8B410EF
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Dec 2023 11:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1701978197; x=1702237397;
	bh=ebtj7BAVJrLZ3IP51mFj4VcNWac0qL8aSAU6q5BgvrE=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fRH5dbLisUtlpi2soX9CFU0+WmyLxg0zl4sif6I/d+mHIv+9dhD04rNeP+QWazRDw
	 DI/Z17BjkhOdTiID2YDMcWazwLaydtGJQ/GTuOEy/KefBxxECbGkXFqdBIKXu7XYXa
	 1WhG8YpsYi31FJjRdvVt/ZwKk68r4LyYcIeJFirpKX/WHmegfge+hDRmiayc0WV7Zx
	 ULMV+uNgzO0Rkokwkw5UWHaPjNhe9rm+45X/ChmQpQxkOQ8+N/tnx16W9JWfPGxkL9
	 tqfU1QyLkbJ/IJAj4NB+ZhvlZ4GrptDkoWivJpz9g4SLsSFPas5epUFJhUH5N5LlE5
	 at3uR0TJzONnQ==
Date: Thu, 07 Dec 2023 19:43:06 +0000
To: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Subject: Re: [PATCH] docs: rust: Add rusttest info
Message-ID: <37cfa972-c2ad-4779-bc4f-db4cf561bee1@proton.me>
In-Reply-To: <20231206125736.2040066-1-dirk.behme@de.bosch.com>
References: <20231206125736.2040066-1-dirk.behme@de.bosch.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/6/23 13:57, Dirk Behme wrote:
> Searching the Rust kernel documentation all existing Rust Make
> targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
> rust-analyzer) are explicitly documented with their Make syntax.
> While the Make target rusttest is mentioned two times in the
> existing documentation, it's Make syntax is not explicitly
> documented, yet. Add a test section to document this.
>=20
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  Documentation/rust/general-information.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/rust/general-information.rst b/Documentation/r=
ust/general-information.rst
> index 081397827a7ea..af9812ce11d7b 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -77,3 +77,13 @@ configuration:
>  =09#[cfg(CONFIG_X=3D"y")]   // Enabled as a built-in (`y`)
>  =09#[cfg(CONFIG_X=3D"m")]   // Enabled as a module   (`m`)
>  =09#[cfg(not(CONFIG_X))]  // Disabled
> +
> +Testing
> +-------
> +
> +Running the Rust tests the Make target is::

This sentence sounds a bit weird to me, how about

    To run the Rust tests, you can use the following make target::

--=20
Cheers,
Benno

