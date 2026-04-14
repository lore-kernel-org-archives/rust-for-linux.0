Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC8D3161AD
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776191969; cv=none; b=KLtto+UhKuT6n7JzLPcgLal5C7QWqHgLUn4zqTlDeQPph72T3hePKFnxe+rLQHF2cqddqSmNqowuAtIfjK/tnZUxH954m3YBuYzH/M7Rat+kC8/QNaS5iT5mCoYVJuH7QR0pRfuvj+crTdSlF33V8wzf7bXqcR7s199A425c0cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776191969; c=relaxed/simple;
	bh=Al22eCsPrDMWwuzUlQzmULHU1hnnVnLvohxy1An8XkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlCHHZzmTP09/SfDeWPm05UGLXLrW0htu9MMorpqHRK+bcCa81XoAJnVljVT5DVc4mnAln6iku9hZdMwG4eJr7Ty8SMpsRQl9H/VCFaQr8T9TQYhjFWfcpxrD1TZmLbWckgh7KAHO7T5Ko/klBXBg42kbrYtJc2hjwSCzb4bjMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=E+dWKydH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="E+dWKydH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so48314445e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Apr 2026 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776191966; x=1776796766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QDqOVJTUyVa1BVmErQMnVWTnNiaUpnAIeTBw2pAF2g4=;
        b=E+dWKydH8jWC1AEI+ukNI/3tIVptUivDQReEIL9RW4uDvqx3aZuBxnes5CZcF22cO2
         4IohEW3l4wBnbdBN8Bye5lscRj2Y46LK7cpU/Bf37f+UrOQ7iAELwprrWKIgJRB0fOda
         lKTysCU1CuMlkILseO7i2NL7eELBVkaODh70TYTxXqczGK9YBiXqDdMckp9l+7pJklR+
         HupjfYX6v408d7Jf6oTA96QWT7nhl6myyAl9sUaGBl8KcJ2MWL7MapoIgvmNfV4tKHax
         QP+n0Ok1xcVCpQhTv7TAR3kP/zslLrl3KH3VFpfdPohubK+2oZcuuNdTsONg4VpRta/1
         fAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776191966; x=1776796766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDqOVJTUyVa1BVmErQMnVWTnNiaUpnAIeTBw2pAF2g4=;
        b=rXrdYE24uzIinPbAuzMWXZxzAyTbdm0dr0ZV9neZ2zIY28Ep1f/iFqVjienjZpLqKh
         AlY5wD7QBqLZNLkW+cQJvSaaRf2RKezSeYrkN8r6pAJi7ozr3YEwz9nbom86EEP53zO2
         faXN3V9AQukED/O6S0uuNIGlu3QX4N2HfmKmDg1t0Y/qOvYLjeJ0a5ZmBYCuvz9RqK84
         8G6QBBJ+k35ZenQjSlqd16gAVsUz4Cp/kD0Iegy/TcTl9dCknFZlqSaqTFzO3g1cv7DE
         4gcsMp9hdXcsNt5bWGI4QNLOagyeyCQGGvVCvHE0lbaXCj+ZdpliJfhZLrV07braATAB
         EpoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VwlUNrnBJcXYSdc1m+0GF/NMxCcWrHCfWMH96BwUgFfFc9gFpM29X3oJLF9tr8lc+IxlCYctqdqnmlXyGTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSyxglaLdJEFk6Kl/ufEuRBX4Eg3cBpj7B8LbjoSNx1RxNYIxi
	YsBjLB/tuZXAB2/Yi6tv2CxYDVqKS1nYspQRXpcdafXdD5tcAnr4nCae5TXsHpprIOLBn8wnaEk
	1Nprc
X-Gm-Gg: AeBDievWA9sf26S6GrVge7A91LP+7dMZfnrYME2FtfsSgA/RPLCgWS2UHPCiCed6xIc
	Dqd51LVEzsrFtv1ZB043qIK4QOjDwOeWIWlNmVsVEbdk0VeJ7ekoCNHgt8H8837Dkx3s1WXmg4N
	tGhdDu+q/r9Lb1NLt7OLyB45fLRoIu5PJWKRqU5spjPhIm1HLXUJzeMop5ez8b95ICAoJJQKt4k
	Pr9qSCsXlbtb4E5zHzu0zHagafPWldo/G0l9wNG81bBL2jtsOUQJxjMxaaaLNBwc9gAFSXR/Nih
	cAG9+iM35U3SZVWttbkcrJcoVh2gSCtCpvCYv7UJhqB5in+8sk67eTcI41Rfa2k67ip7tNtzLY8
	pRqNNncjG+5TDBPyQ1+kaPB4CxBDiApU8sfEGCKiw4zoqqWboHcgJMz3DC5XNiiBONyK3CayaO/
	R6lC8QAFODlJGwnly4jMaVPCa8DlPsqP+oPIE6p9uf94Gcolz03Lpd1uQVUIeJ+O8TZvuBUtPzs
	Tk/sNNgfxmjnA==
X-Received: by 2002:a05:600c:46d0:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-488d689dbfcmr264013605e9.30.1776191966269;
        Tue, 14 Apr 2026 11:39:26 -0700 (PDT)
Received: from localhost (p200300f65f20eb08ef305da4f44807a2.dip0.t-ipconnect.de. [2003:f6:5f20:eb08:ef30:5da4:f448:7a2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488ede15694sm118371645e9.3.2026.04.14.11.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:39:25 -0700 (PDT)
Date: Tue, 14 Apr 2026 20:39:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Danilo Krummrich <dakr@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
Message-ID: <ad6IJwpp5AA0-fAW@monoceros>
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
 <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="blufdf4hg3r3mn2j"
Content-Disposition: inline
In-Reply-To: <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>


--blufdf4hg3r3mn2j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
MIME-Version: 1.0

Hello,

On Sat, Feb 28, 2026 at 11:44:25PM -0800, Linus Torvalds wrote:
> On Wed, 11 Feb 2026 at 15:04, Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > Driver core changes for 7.0-rc1
> >
> > - Bus:
> >   - Ensure bus->match() is consistently called with the device lock held
>=20
> So I'm coming back to this, because it turns out this sounds like a
> horrible mistake in the end.
>=20
> You document it as being about consistent locking, but it appears this
> change is what made the "firewire oops at driver attach" turn an oops
> into just a silently dead machine.
>=20
> In other words, it makes fragile drivers go from "you get an oops" to
> something much worse. The oops becomes unrecoverable - with typically
> a black screen at boot - because the probe is holding a lock that then
> makes everything else come to a grinding halt when the driver fails.
>=20
> And yes, this obviously only happens for buggy driver and doesn't
> matter for _correct_ code, but about half of the kernel code is
> drivers, and that half of the kernel code is also the typically the
> most badly tested and often questionably implemented half.

I have a machine here (stm32mp135f-dk, ARCH=3Darm) that fails to boot with
dc23806a7c47 ("driver core: enforce device_lock for
driver_match_device()"), but doesn't oops on dc23806a7c47^.
(Fails to boot =3D no kernel messages on console.)

I didn't try to debug that yet, but I wonder if that is an understood
problem of said commit. I know that the commit was reverted in the
meantime (and the machine boots fine on 9de68394a615 ("Revert "driver
core: enforce device_lock for driver_match_device()""), but does that
mean that there is a driver involved that somehow violates driver core
assumptions and should be fixed even without the consistent locking?
Hints about how to approach the issue (if there is any) welcome.

Best regards
Uwe

--blufdf4hg3r3mn2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmneidkACgkQj4D7WH0S
/k7mDAgAj2QD1GrgaK+tSN/eZXXN/Qh33Q0fcE5ECUYjXCEQOQ1/Q0PENWiMEJcD
1JcKF8Jak0kMclC6LLwAc7RiVYQR5DZJ78BQlqh4ztLmBpVBr5SOiUTIyL2MvyCX
xcuO3DWSQkpoBCzBxLHaRyLUkg4lpkI+YG4iasQkeia77K+wwr3CHzcLtUJmPuJM
hN/GwawWf+pCjemuKj1tDv1dzLcXfA7LKVfqG8cGiDj6YXzAI3rXHvAjRZlyYde5
+4ajajrBgskzGi17QNymTyCwO4+5i+lOvyio54/wW/C+zZuzKC6e+nKoGdhEonFZ
xuh+AtnOD5zUXWOPg4Xsmk4tqnno0Q==
=0NgR
-----END PGP SIGNATURE-----

--blufdf4hg3r3mn2j--
