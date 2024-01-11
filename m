Received: from bues.ch (bues.ch [80.190.117.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8CFD287
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jan 2024 07:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bues.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bues.ch
Received: by bues.ch with esmtpsa (Exim 4.96)
	(envelope-from <m@bues.ch>)
	id 1rNp35-000Hwc-0l;
	Thu, 11 Jan 2024 08:00:18 +0100
Date: Thu, 11 Jan 2024 07:59:57 +0100
From: Michael =?UTF-8?B?QsO8c2No?= <m@bues.ch>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] [RFC] rust: error: Convert 0 being an error to Result
Message-ID: <20240111075957.09cc5129@barney>
In-Reply-To: <20240111064415.908487-1-dirk.behme@de.bosch.com>
References: <20240111064415.908487-1-dirk.behme@de.bosch.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3Q6BPKBuB7StAstupAchl.5";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/3Q6BPKBuB7StAstupAchl.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Jan 2024 07:44:15 +0100
Dirk Behme <dirk.behme@de.bosch.com> wrote:

> +/// Converts an unsigned integer as returned by a C kernel function to E=
INVAL if it's zero,
> +/// and `Ok(u64)` otherwise.
> +pub fn to_result_zero(val: core::ffi::c_ulong) -> Result<u64> {
> +    if val =3D=3D 0 {
> +        Err(code::EINVAL)
> +    } else {
> +        Ok(val)
> +    }
> +}

Would it make sense to use Result<NonZeroU64> as a return type and make the=
 function inline?

--=20
Michael B=C3=BCsch
https://bues.ch/

--Sig_/3Q6BPKBuB7StAstupAchl.5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEihRzkKVZOnT2ipsS9TK+HZCNiw4FAmWfke0ACgkQ9TK+HZCN
iw4+QhAAl+Qmw76vKMyNJPhiTmySmnQa83L3B3fcxHEIFi72jFETXWvaU3YnRLyl
P8mFh1Gdi9Pk5XenArANhDfpqX5kiB/r/RSmLVtJDqux9MRMwxjVuLQq5YrK/wEO
8o5npi1OTQJiImPpV3+JASj4hmjudMJw2kENImSRKpV6aR6vIPYUgnV1pQzmfyV/
S7SJd6Wk8oStnOvJzjTPZPLGtwtaVcXkyVf/n6hHbFlQu2nltUPmYzZCP0kj7s5Y
XO8HqB76SxOf6DF5Zy6XyOyXlDF8DxxLKz9R7FdhwUXqDAA+gUt4idV6ZwKfFsYB
FaqBfZO25BzmbubhJp6pi51rMj8N+N7PI/ZyFIG7WtwRU+TuDDRkVpN2BeoCVoZ5
XLFp6S701lerc2MBbN51xwmuRe8NOJmqwyToYGpjoBkAtblE4RXvcI3r2aMo2EuG
iA24ry7KyW4+0mRZEgdY8mnyGfzOYEwgWGVClhzdAFGyHqqz6evlnBpYTD1Itnl+
9t37LjkjoWcde2JpbEZgeZMBBb6M0eZVi6NprNGIbL+t0khMy8dthltD6NofHNGX
XO8kZipYvllVVJ6bTyx1sThkV3H9YwG/KobwpsL+wH9lTuaf6fCz1W5zavJOl6Mr
XLYQHwE8JEZx4oTgTHyn7tPa1KkJpNr7lG5uA2DMTtSn/RjxHSc=
=icWJ
-----END PGP SIGNATURE-----

--Sig_/3Q6BPKBuB7StAstupAchl.5--
