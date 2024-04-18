Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A601C15EFBB
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Apr 2024 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713441350; cv=none; b=UyBRvbR4vVdAt7TtjZYQmNHA/xypkZY1x0kbz29d1/DE5ITtrAGwy93vod8WGLSPa7P6AJZrQTx4YI1m8ZY4HC8xMp2RDTUs71dzNNaQYU0ua/0BUgH0DfTEXl0pu8vUf9eTi7SFD2NYK/0YKPfXIHWNhUAFz23ppr8UChGdAfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713441350; c=relaxed/simple;
	bh=kWwv23Xmgvsgj2YhpzCieenmpVIqMjh7rBPrJrdPiJU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPkKDDHmq/UPIDo6QOm/14m3QfhL92GAesGHil+w4OydHc0kmSEnqZnv4sovBKdFlbBnfzfplU6UPcUMfZu/yq0bb+MlZeCC5GxrI4Ai3LBn7AGf97tURuUUFetdhlxXuaiDd5gXu7WA1/qqPEhJ15UHT7fnFJHmgFY0a5SJojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=g6WWhKhv; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="g6WWhKhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1713441340; x=1713700540;
	bh=vIt3tGGJDLzoysWW9pyqRGHlAGJMnjOxLghruIfsJaQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=g6WWhKhvDnC+vJ9odB7JQ1XhtErZqeeLg8RK7rplL0tkup2kQjArMfc7ObGigfsQ8
	 knJXeRq6KzT5WsS+6iiIed0lFoyr85vPqoPeFJcTJWc90Ci93yJDPpfWEmYFHQCJqU
	 Dd2OYN4MvgPhknWGwtsw7b/ei1qrOdYCY26eU/yUB2JLkiu3wQyYtmttqGXGYlGdZz
	 JhueXDfWDorTc3VZgo+e7D45C+y4X0hW5dJlhE73Y8+M37l9KZwQAc5ZvUBU659IcC
	 uqMy67abki84pd5jv2flPh6lV5ByYRK3Bk4gzPqycSzRzaqHBFIWIGWA74HXp17dGf
	 xWGewwdZQeWcQ==
Date: Thu, 18 Apr 2024 11:55:34 +0000
To: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: Valentin Obst <kernel@valentinobst.de>, Trevor Gross <tmgross@umich.edu>, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v4] docs: rust: extend abstraction and binding documentation
Message-ID: <5c8aeb78-6f36-40ca-8965-43717c1333f4@proton.me>
In-Reply-To: <20240418070618.3962736-1-dirk.behme@de.bosch.com>
References: <20240418070618.3962736-1-dirk.behme@de.bosch.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 675b39ff1ce9f97ae03ea67563d72ec48f22ffa0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 18.04.24 09:06, Dirk Behme wrote:
> Add some basics explained by Miguel in [1] to the documentation.
> And connect it with some hints where this is implemented in the
> kernel.
>=20
> [1] https://www.linuxfoundation.org/webinars/rust-for-linux-writing-abstr=
actions-and-drivers
>=20
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  Documentation/rust/general-information.rst | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>=20
> Changes in v4: Rebase against rust-dev v6.9-rc1 to re-start this topic. I=
f
>                the reviewers are too busy and its not a good time for it
>                just let me know :)
>=20
> diff --git a/Documentation/rust/general-information.rst b/Documentation/r=
ust/general-information.rst
> index 081397827a7e..6c6fb3a5e318 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -64,6 +64,62 @@ but it is intended that coverage is expanded as time g=
oes on. "Leaf" modules
>  (e.g. drivers) should not use the C bindings directly. Instead, subsyste=
ms
>  should provide as-safe-as-possible abstractions as needed.
>=20
> +.. code-block::
> +
> +=09                                                rust/bindings/
> +                                                       (rust/helpers.c)

This needs updating when [1] lands, I don't know if Miguel wants to do
it when picking this, or if you should do this before.

> +
> +                                                          include/ -----=
+ <-+
> +                                                                        =
|   |
> +         drivers/              rust/kernel/              +----------+ <-=
+   |
> +           fs/                                           | bindgen  |   =
    |
> +          .../            +-------------------+          +----------+ --=
+   |
> +                          |    Abstractions   |                         =
|   |
> +       +---------+        | +------+ +------+ |          +----------+   =
|   |
> +       | my_foo  | -----> | | foo  | | bar  | | -------> | Bindings | <-=
+   |
> +       | driver  |  Safe  | | sub- | | sub- | |  Unsafe  |          |   =
    |
> +       +---------+        | |system| |system| |          | bindings | <-=
----+
> +            |             | +------+ +------+ |          |  crate   |   =
    |
> +            |             |   kernel crate    |          +----------+   =
    |
> +            |             +-------------------+                         =
    |
> +            |                                                           =
    |
> +            +------------------# FORBIDDEN #----------------------------=
----+
> +
> +The main idea is to encapsulate all direct interaction with the kernel's=
 C APIs
> +into carefully reviewed and documented abstractions. These are then cons=
idered to
> +be sound. The goal is that users of these abstractions ("my_foo driver")=
 cannot
> +introduce undefined behavior (UB) as long as:
> +
> +#. the abstractions are correct.
> +#. they don't use ``unsafe{..}``. Or they uphold the preconditions of al=
l unsafe
> +   operations that they perform if they use ``unsafe{..}`` for performan=
ce optimizations
> +   or to call unsafe abstractions.
> +
> +Bindings
> +~~~~~~~~
> +
> +By including a C header from ``include/`` into ``rust/bindings/bindings_=
helper.h``
> +the ``bindgen`` tool will auto-generate the bindings for the included su=
bsystem.
> +After building, see the ``*_generated.rs`` output files in the ``rust/bi=
ndings/``
> +directory.
> +
> +For parts of the C header that ``bindgen`` doesn't auto generate, e.g. C=
 ``inline``
> +functions or macros, it is acceptable to add a small wrapper function
> +to ``rust/helpers.c`` to make it available for the Rust side as well.

Also here.

> +
> +Abstractions
> +~~~~~~~~~~~~
> +
> +Abstractions are the layer between the bindings and the in-kernel users.=
 They are
> +located in ``rust/kernel/`` and their role is to encapsulate the unsafe =
access
> +to the bindings into an as-safe-as-possible API that they expose to thei=
r users.
> +Users of the abstractions include things like drivers or file systems wr=
itten in Rust.
> +
> +Besides the safety aspect, the abstractions are supposed to be "ergonomi=
c", in the
> +sense that they turn the C interfaces into "idiomatic" Rust code. Basic =
examples are
> +to turn the C resource acquisition and release into Rust constructors an=
d destructors
> +or C integer error codes into Rust's ``Result``.
> +
>=20
>  Conditional compilation
>  -----------------------
> --
> 2.28.0
>=20
>

Otherwise, this looks good to me:

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

[1]: https://lore.kernel.org/rust-for-linux/20240416074607.1395481-1-nmi@me=
taspace.dk/

--=20
Cheers,
Benno

