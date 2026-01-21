Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308E43A9011
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 17:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014947; cv=pass; b=X9JOSQ1QbYZqKj9kdrfRy30yKtt/MjZ/G37d2Z5pAS+AxH3AMMnt+TCpwgYCZxTTA0jaIHPY7dn34w4OLTeM6wZldA8oGrLiX2jO7UVVMAyhFemDUxBVXiqjkuv26wLO3UL8TQkGv21E0vrDcmrpxch+Q7pVO1ZCkYXGWPZqzQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014947; c=relaxed/simple;
	bh=Jg8FP/9e49mHZBk+nu8EkA54xOBM8bzpLmTXVx4ageo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7tiMUTZsdgf7IagSjPGDpj8Kdq/HFowQyBcalQxfLf6BU+geFVXzhmVuKqno4OidgbV9cR96fFsGh24jxI8ofWGTjRwSerGBCpHyGGh+YadM++ZE4DHKYUP6EB19ZYuh30X4B1qYBfLxp8YfCyP+JyCgExzo+EetOyqSGWNtD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLJrgTPn; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLJrgTPn"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1233bc11279so10344c88.1
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 09:02:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769014945; cv=none;
        d=google.com; s=arc-20240605;
        b=erlBGEayi21a2r4dKYj6tRpsxv8ZWdJ+biyv0ZbsfNATojn1iTOExylnG5Yvu1xYke
         sBZYVnsnxrooQMxAbNKyJ+slHSA/OzQk4JUBLrXxBmSW7h4GSOvOwTn+2cLFNge3SshB
         0XcKGuoRRk+cS7SSjiuga/DONJCg05jfVjoBeGneMPJhyIAPHFUCqoDvorjHuFkNhE/x
         7mCVts0IVhTLnGE56sZe2Ehqhfllkryi5tQQrJd5W1i86eXq8t7hdBqVifA94Ql4LUMb
         SPOqRQRjZayshJOzmRgg5vkJY7hzTvLBl1tCfpj1cWBFcSq3XuuuVlsygMfuxynyIPNt
         VXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jg8FP/9e49mHZBk+nu8EkA54xOBM8bzpLmTXVx4ageo=;
        fh=b7nNsJPEXI3XwBuxVLF4vbkVEFLHXMpfeRiU1Kt36Hg=;
        b=fXLRhDbl7ycM2ZFyLo6El0pja/Jv3QOufEGetEMxNO0FXMJ7lRynkV7HwywJzSl66u
         nPm539qlkpR4DE/WtGb4kMbBY2uRmNb/4/xsH96N9nHAkp6SXM7Vit9cRoF0MckgSmv8
         VFvFiP2+2TPJTFk/yT/Vfxz48SeLXhd5NY+6AHFHr9JVWC+UVGaQm5bh0huAJCp/l3oP
         gqE2IcDHwP0j966Uuh5uFOeV7vDCD2xGglWFY8gV6JSZjNglLuXCX5dbxPU4Vnp9BK6t
         u3y6XbgI4SdNOKvV3PH5xs4tmYmKCooW0UKNVEUbJc54abpSnNVbdZSuDtvNkDHgu0i7
         DAFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769014945; x=1769619745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jg8FP/9e49mHZBk+nu8EkA54xOBM8bzpLmTXVx4ageo=;
        b=NLJrgTPnhZYaZfmtVj9Ob6e/F+vO8nskpKGQ89So/O8uhf1il42nAqUM9aWNQiWsZb
         +n9vOVXQibrEccpwOAkY4jcWJLqwMyrdsLiCgs3J3KwksBu5OqaXv9lNu5ygEvMRz5cZ
         Mq1ou6zrj0Kn0wwNUxcy0ew69WWZiZ7pig5WWi83tOVCUDilhcqulnmzCTdaNx8WjCTc
         QBMGQpLI5leC78QG97mZK5PzE1tOnmbNPWYBdIwRZshtrh8sBBfMw8QW6tRmFxBoLwQr
         Zrmbwhjmwjp9VCmZHsVJ3khzcYNTsI9NwWYVpcRteUfI6dJls3lGOaM94gS0DMviMjvQ
         kOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014945; x=1769619745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jg8FP/9e49mHZBk+nu8EkA54xOBM8bzpLmTXVx4ageo=;
        b=h+2YUvmaXa2GUeBAb0h5bVJt/QTRRb7xxc2poK8w7KB8dgm6etFoDSif0bju5ca1C5
         zJbZdARb/MIGRuJqcKVjkorbvzowat5OKJ4RrFVAxkFJQPje0GDwkHpmGyxKVfwiei+W
         ogMGIc3mJaHPNJLN0tvtbOypjb7P0lefVFbWt7DzxjqxJ2iXPqswfWJdT2GQJx2NlrxA
         weQa+6L8XS30bVnEGi9TaPhXCpGgOR75Ir6kRGaihzssgybSaLI+QHZtC9iwz2u3VCe/
         at4rhx67UGe0Ftc0+FzkjvreLgJU6x6x8MWBGZOvdFUXown0yimws+Drg87qZO0VwO+L
         mAPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJxvl0Wvn9ypclnoTVA/WOsdWJ39Cqj4LWK0jFiW/gXY6LpcjJlCtBLeJBaRLJXpVCx219YI15sVookwZL+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwugSQ1spfTwBaWBJyAKn05UuqRsmvJyzlXp2Ah/riL65Hfq7pq
	xTV9RX6Ixdz86zyYghFd+uILNkW1gxIsifFptLfDhDSQ6LUs24czfgjhHu7ngwPVWpX6DK1Hn8z
	Aklx4ECOVh0Q1F6dY86b9cEk+Geet05k=
X-Gm-Gg: AZuq6aJys+ntZXBDcMi7selSZIO+wmxsf4rqNifQ9bks22koBdtYBrELqVAQzJouOYb
	y1wxEhcGUlNE/N0iYgsQBpsMmRZOZmnqeTDFMCTnZTHtkzH21QS1/xj2rGQij9Y1JRrK5UiyYn9
	4P3cSzGlzE10zaGedEoBLKMu3YKC6KigmZ1gL7g3zw7I7Y1ALbftvMhqll/wBKRwOJVhXQ5rTd5
	3e0BmNaEbK4QhVxDelt9uC6fyWHspuW2fOMCRckMYQlL/RZ3WSCGbqlKJfs7K/XpFsJlzd8BaSH
	ICoipUNk7zuTN0KnaRmAdOMkW1O/9aFbUnOqDp0IDVJ8ZM4dTP40utkPgbu0i2/A+BB6g159AlU
	DroIVYzuaTB1oR8nWrXYTvAM=
X-Received: by 2002:a05:7300:5712:b0:2ae:5dd5:c178 with SMTP id
 5a478bee46e88-2b6b3ef8367mr7975062eec.2.1769014944879; Wed, 21 Jan 2026
 09:02:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119233621.3465304-1-fujita.tomonori@gmail.com>
 <KPB3FIcVMpT7PQ-Zg-0bQVF4nSfqiVuhuzot88r7jK8LruVydZSqJRtFsvpBazN7-iJV8NL6ZLPzK_RnQMHV5A==@protonmail.internalid>
 <DFTJPKIWK06S.3J0C75Z4RHUY3@garyguo.net> <87sebzti6x.fsf@t14s.mail-host-address-is-not-set>
 <DFU8R1U4X9IM.DS5S82YYN4X0@garyguo.net>
In-Reply-To: <DFU8R1U4X9IM.DS5S82YYN4X0@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Jan 2026 18:02:11 +0100
X-Gm-Features: AZwV_Qgb2U-Ym0pk0ER12NGbJ_Yn6X5eAgAGr8p34-DhURyDo_OGUJvyb8vQwYA
Message-ID: <CANiq72k_BQgd2mnk0k2N+tuo9s0A_--hJFM4JzFr1PcH5b45uw@mail.gmail.com>
Subject: Re: [PATCH v1] rust: time: Add Delta range constants for time units
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org, 
	aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, 
	jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 12:47=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I don't see a user for these APIs. I'd rather not have an API for documen=
tation
> purpose only, especially, to me, the documentation reads fine without the=
se
> constants at all. Simply stating "If `millies` is outside representable
> range..." etc would be fine.
>
> If there is a need for APIs that don't staturate on overflow but rather r=
eturns
> an error, good, then let's add a try_from_* API that returns an error. No=
body
> shouldn't check against these constants manually.

Hmm... I tend to agree that exposing things that aren't meant to be
used isn't great.

Perhaps another option is to provide doctests to the methods (which we
should have anyway... :). Those could show the behavior for certain
values (and even if the actual maximum was declared inside the
example, it wouldn't be exported as an actual API -- we could even
hide it in the example and mention one shouldn't depend on the actual
values).

In addition, perhaps the main `Delta` docs could mention what kind of
range it can hold in e.g. approximate years (even if `i64` makes it
obvious it is big enough).

Cheers,
Miguel
