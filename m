Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA6715B119
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726509468; cv=none; b=WhxFg+AjGIdf6dKDDHtn5JUkUfK/2RpIdnJLOnzJC6Vx83j8OFP+3KeEZyOKIXvgqum8yFHX71n68PLnlYtxGQpopwMqzBwYTMFqjLF4Z4UzN6elzovlRns9X4JfE6fqmRwUYVCKsXm1WwjTKH2rPDW93C+rNm7JzxSMJwKHaxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726509468; c=relaxed/simple;
	bh=Gh5tDREiHEnpEDRPhHsSQxRx7+9MTLgRITQN/2iACUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/pA32uKpCPHqtUSgMHUnAfHqIQuD4G3MbHY5GlkASb+lZpkEZz5yV/OGCZgjsvW4U95Rrtso/cpYGqft4Bb2nKwCDO3/cpcZJHjTi8n70gti4RCMyFOnnhcf3KJOgl7Y6ulL5+JWDfAhRxZnTS0ot/RpoYwB5eGWvFMYhhFB9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsB7gFOA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsB7gFOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76309C4CEC5;
	Mon, 16 Sep 2024 17:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726509467;
	bh=Gh5tDREiHEnpEDRPhHsSQxRx7+9MTLgRITQN/2iACUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NsB7gFOAR0yrlppOChCkYETBnovD5imaQqvyk4ApwJCgNtinF0/IqWH0V7Cq7fGeI
	 jGwzDJ5Unf45DwjwPjW8r4P8DUCQbHzB5o/2UR00zAX5O3KO1tlX0G6kmpiXsWiBi6
	 I926P6vNzL3FlUXHaG5NFZJ+x54rfcu/MaWGiDEy7F8lqamreIJhwlTeju9SRm8kEs
	 sFWhXXezlclIi3u+EigfpQWzM/WX5OnuIvMohBpXKnMbj8QgIw0qCRSCnXWHUCXeZR
	 BFuujH8cqgzhwxlV/jm2J5YPWwWInR8hachMrbvsspIWi+yd4W9LTjPqo4wx6nKjRm
	 kTu/CcMCP3UTQ==
Date: Mon, 16 Sep 2024 18:57:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH] rust: mutex: fix __mutex_init() usage in case of
 PREEMPT_RT
Message-ID: <20240916-geometry-busboy-69d298979a8c@spud>
References: <20240916073752.3123484-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dk3tqx9VYOHhw1ky"
Content-Disposition: inline
In-Reply-To: <20240916073752.3123484-1-dirk.behme@de.bosch.com>


--dk3tqx9VYOHhw1ky
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 09:37:52AM +0200, Dirk Behme wrote:
> In case CONFIG_PREEMPT_RT is enabled __mutex_init() becomes a macro
> instead of an extern function (simplified from
> include/linux/mutex.h):
>=20
> extern void __mutex_init(struct mutex *lock, const char *name,
> 			 struct lock_class_key *key);
> do {							\
> 	rt_mutex_base_init(&(mutex)->rtmutex);		\
> 	__mutex_rt_init((mutex), name, key);		\
> } while (0)
>=20
> The macro isn't resolved by bindgen, then. What results in a build
> error:
>=20
> error[E0425]: cannot find function `__mutex_init` in crate `bindings`
>      --> rust/kernel/sync/lock/mutex.rs:104:28
>       |
> 104   |           unsafe { bindings::__mutex_init(ptr, name, key) }
>       |                              ^^^^^^^^^^^^ help: a function with a=
 similar name exists: `__mutex_rt_init`
>       |
>      ::: rust/bindings/bindings_generated.rs:23722:5
>       |
> 23722 | /     pub fn __mutex_rt_init(
> 23723 | |         lock: *mut mutex,
> 23724 | |         name: *const core::ffi::c_char,
> 23725 | |         key: *mut lock_class_key,
> 23726 | |     );
>       | |_____- similarly named function `__mutex_rt_init` defined here
>=20
> Fix this by adding a helper.
>=20
> As explained by Gary Guo in [1] no #ifdef CONFIG_PREEMPT_RT
> is needed here as rust/bindings/lib.rs prefers externed function to
> helpers if an externed function exists.
>=20
> Reported-by: Conor Dooley <conor@kernel.org>

Welp, once I turned off the 7 or so lock debugging config options again,
it does seem that this patch has solved the PREEMPT_RT related build
breakage - thanks.
Tested-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> Link: https://lore.kernel.org/rust-for-linux/20240913-shack-estate-b376a6=
5921b1@spud/
> Link: https://lore.kernel.org/rust-for-linux/20240915123626.1a170103.gary=
@garyguo.net/ [1]
> Fixes: 6d20d629c6d8 ("rust: lock: introduce `Mutex`")
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

--dk3tqx9VYOHhw1ky
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZuhxmAAKCRB4tDGHoIJi
0oSPAP9dCYxdFcSKaxkhINzmpvryv3FdU60YdYII8r9VQnVSHwD/Qzgm3du941b/
YJ60xtAV46sXBzGhk77Xe+aP6QIBJQU=
=YLLi
-----END PGP SIGNATURE-----

--dk3tqx9VYOHhw1ky--
