Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F63A1CFC
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 20:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594120; cv=pass; b=GORqvnF4bJryX9YBcVHTxzm9sBYCIl9wmUWqFqe6hviIo6P+5VQimp8Lf+Qrs0SF0x2gStkcY9jRQ6/6sAYJ1XzFAsfTZ3DrIB6QB7mWRLn0kJ14VK8TegM5WKlsRLEJS0czC5brCd4ydR2DgQxbVdCOBvKyMtg+/crV8z8ENME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594120; c=relaxed/simple;
	bh=NBQFVHDxhIw7A9JyP0dJQo3nW0CSuwKVTNqwwpVubi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PToevONhnGc+PmoQQT5FOE7uAua61s+5j89GbdIScl1RWzE/iaiYfD7DnagsYcZ6tcywNuBlxQbPVM1CAye10E9dnrasAG9oDgj84ZKheDLpsqXd4epkAky3GDXHl7zq2SERrv81aOo1UyyUZWF6xbZZTrMRBe4wjqqaULGtc1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LauGrKLH; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LauGrKLH"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ac37f8898eso101323eec.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 12:08:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768594117; cv=none;
        d=google.com; s=arc-20240605;
        b=kY9KkaAubdfaakJWzN9cG417Pzyh6OKSRE2DtHmMdGuWy3Wd+IJwbAkcX6jLtUxszu
         /yJtwzcksVbXYkdvRgmP1r28ExFM1rS0wkrv8h6+4RjSGt80xceGJqRIg3B3ayw8Adms
         gSQ7nO0UjDKZAz8k1XdCFlkfsOZvJKKsl5IsbrUIOJhBJc1aeMx7C70BGviO9JJ1k/Q7
         B6lHneFM5Vew5Ji+TrdOMymOVjJn/hrxpy90RCW+ZDC72lyBdQ7S7/EFLAk5GE6yTQAF
         zuwZ5RtywsFVXysn4Va2gW9uM+UCEdahi1YMuAZIUeGQjZOaRMmI8jZSFzdvlmveGJ0N
         cC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YsvtuU5+fB61GGuk3tjN3IIALpHR/DDWFZ2u6Rwt2Lk=;
        fh=pddBMXeGl6TYk+A03EnPi5C70FVN0kSxQRmTDJPmEqI=;
        b=P97Kb4J9g7o+NHocz/NL+I0CdFa9st68MAESeoNTLisFXOGjSyRrYnv4eUpV5gQIfV
         nGQiJ927ri3NN1GD4QfvKBc7f9G+IorTmHnv2OAjFKBiKwPK1mIEJtiShgml9CCwkL0v
         ggt0jG2EVZquHuDXOi0w5FCMpuZfSX01l3cOO14SOTg9tPbkL9Hvs7wyrejhlF32S3Rs
         E3mFFUQS/AkZXtxBnEPSU0POlTzOXeQeRIxc6F2d7O0DLC1rkV0ZYRqVrvpiWB7u+uF0
         jyjMr7vZiKqCL/H9TQZI5cqkoHG0bko5vV9RrI37EOHylDtWN4KDQ0vcCdYsNYNnINmi
         KJ9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768594117; x=1769198917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsvtuU5+fB61GGuk3tjN3IIALpHR/DDWFZ2u6Rwt2Lk=;
        b=LauGrKLHMM027D2jFIhBOHF6BMv6jKiH4j6t/dKYlzjsR27r2x/pvCBJR+ctzr4pmc
         BOw/HSPqEptAiOZ1V02BIj1qR8uUnpgKdoSSU0iVmhC+DY4u4HgdI6a0ObXAZ+ZqMr2E
         uw9Se3JdKiosNbf0rEfc+JMjYPl35kLUV9oer/cypmtTDZ6uAC7389Fw4yYxKA6gczwd
         6Vn9MNme1QJ+zaadYv11T+c3REWLvdCkc7UsfNwMUL6Gque8QrP2P6CB2pDcolubjcfm
         r2eZzdxT6O2qnyzg7KLQGBZ4DdEVIFR3V7hW2UF3gMxU4vVW1tqw2+OjsZIlLbPd2OMs
         ARYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768594117; x=1769198917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YsvtuU5+fB61GGuk3tjN3IIALpHR/DDWFZ2u6Rwt2Lk=;
        b=CZiLo8/+c2/lZDwv4V8UvKZSnPqPBi+8Ke8Ss6BnZ1FS3vuaAcfgaxF1jAns8MPBUG
         QPSI3TICwHCTOk5WlXMA07o6AE+UV8r7eYNxofLygnLkYQzh7jwHFfKR3qanhXdw1CgD
         8mk3Wj8OPO+N2RXh6p8gIt2ksCTxyBhsLTldEhQ2OGxbeF+Yg3KWLuvrkxYRY9J6R8/H
         cXxkvpJx5PX+SYcjrvZ5EJn9g5+GRB0aPfr7AUQLiv2g2gaSyQt0n4NFCSLEURAgymHC
         EEN163f3Tebi+Ub5ujXQ5GumO1WIq2945QRhVYj+RsadatDuza59DVObLfsb675RDuN/
         eWaw==
X-Forwarded-Encrypted: i=1; AJvYcCXNXmqvMbBEvjalkLhYhW317IkZTlZSx4KdguVXLufN2TTEEeCl/Sj6TowJzRHa+uTNGnh+2DImLiDcwXItDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyDc09lgiY1AIplcCWzAnuGcYw24SBZC7VV+SEBRfC6St4GuL4
	etGLVxTUkXWJc2yu1ecBngPSIfxCn8qTTsOlOEs2Pvm76FpkIcQTkMNS6Respl/LbKL5Khp2Yxt
	BP52aA/WK1UEeE/rWXh5nGqUVzYYHIqU=
X-Gm-Gg: AY/fxX4tOrV4vg8os7pDlig5Ip8HQ+Onh6+gxOn2bogbB5fn6ZuuYmaXc0ztwK2qaMT
	5pO3ZMgIZVp1rHE5qs4RbNv2ZSvMa6VdyOVc4vFXB7U0+/YdB0IGVoO+dPicg6NIaJl9gFmeUFA
	p63kQbncgbXfZ5Ef3qNyF09GxaDNNrrvhbWnDE1EtR9FB6P4+oo2y2FRk8JoSi4wTFcH96wi4iq
	sJeblMx9uAbbtVcrFDpHOdyMMj0BoMLQu5U36D/1fZL1oN8L2EvvEcle3hEN3x0EY9e71pD9OHi
	n8OG9IOoUabatQvFb0XlWpWkskGBi6Jz0CqWppjmArCXfoJgKSlf3CncT+LUSwvpoYQv0oF9YVM
	HvF2W8SA5cvsz
X-Received: by 2002:a05:7301:1f10:b0:2ae:5245:d50e with SMTP id
 5a478bee46e88-2b6b4114382mr1569788eec.8.1768594116917; Fri, 16 Jan 2026
 12:08:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201170130.10922-1-mhi@mailbox.org>
In-Reply-To: <20251201170130.10922-1-mhi@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 16 Jan 2026 21:08:23 +0100
X-Gm-Features: AZwV_QjmlLDd-W7QFg7wV0iI_5lLyHCQdEinVqQCLwbNqlboWu5be1a_Qj1y-zo
Message-ID: <CANiq72kGg9PVWmJtY-LTAuh0-YrvAsBeVCdptB9DxWCvZzcafA@mail.gmail.com>
Subject: Re: [PATCH v3] scripts: generate_rust_analyzer: Add message to
 sysroot assertion
To: Maurice Hieronymus <mhi@mailbox.org>, Tamir Duberstein <tamird@gmail.com>, Jesung Yang <y.j3ms.n@gmail.com>, 
	onur-ozkan <work@onurozkan.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 6:01=E2=80=AFPM Maurice Hieronymus <mhi@mailbox.org>=
 wrote:
>
> The assertion that checks whether sysroot lies within sysroot_src
> currently fails without explaining why. Add an error message that
> prints both paths to make diagnosing toolchain issues easier.
>
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>

It looks like we are removing the assertion, since there are cases
where it does not hold true, like NixOS:

    https://lore.kernel.org/rust-for-linux/20251224135343.32476-1-work@onur=
ozkan.dev/

I will take that one as a fix, which will mean it will land earlier
than things in `rust-next` (where this one would have been), so this
one here will then not be applicable anymore since there will be no
assertion anymore -- I am sorry Maurice, since I know it was one of
your first patches...

I guess it could still be nice to somehow check that the `sysroot_src`
belongs to the same toolchain as the `sysroot` even if it is in a
different path, but I don't know if that is possible in the general
case, and it is likely not worth the complexity even if there is an
elegant way.

Cc'ing Tamir, Jesung and Onur.

Cheers,
Miguel
