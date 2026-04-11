Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530891862
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Apr 2026 22:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775947686; cv=pass; b=MQiSgLNcIEz76cFFDEB9mDDfISjJTj7WHp7eln8Pg1ytzEEOxYTrVVUX30355vvdr92+iCNljPiO5KJgzlcnMPtgjvJTwn+kxYn6wdolefanykHbHFdbXxk+HKlJcxvNPGXwy171Z6df7feg7RJOZ6h390DtXUSZdrtZZNxIwPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775947686; c=relaxed/simple;
	bh=hfI7WZixWr8hfh5FgBWMpYIgkb3WvfVlVAFZ8mrBIQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=igMKEmvy1LDz0NGCX/MlBKMBOucWFcR3d2d19ro+p9J5dxbcEgnnnQ49zP+QAkUrYI/aTuQrNqvbd9hMyKKhQppzMSkH9dR1IgK6jXF26/+EUlrzqCE74GxsAll3nWez033Y5bcsaslR9ahqCqNhgENedg1ZbiAo2LupZDEq1Sw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzWz7qVE; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzWz7qVE"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1277863a912so196956c88.0
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Apr 2026 15:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775947684; cv=none;
        d=google.com; s=arc-20240605;
        b=bYRm49AvUsaq/xU/OfsFK379UTDxF9ohIKBvbsRTdWkVrx7udzJpkJSRtHshAWgZcL
         Eri7eFWbJQF0ZVEZaA/Pa6c7qlXqqGSA/TYLgyiaBuev3AISDIUzPgwrSucFFyOAW80q
         rqdYdeR3TFb1CRLxHyraQtm+9NZwrGrd6Iz64epIfLQ3Vq0Fsci+jhwmtFS3ydlz/uV4
         G3nx9PCmSsG9/JYxQxMr0Qprv/CuccY/52Hu9wjBs81N6Bz5p4dtMq/7SbSd9g5JJ1LO
         ehHuhuhcvWGV4MUngOErmcoxxk6NjCfdQVHEd9KJ14k51x7atc4TXC1j2jqOuXBVjrM4
         yLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfI7WZixWr8hfh5FgBWMpYIgkb3WvfVlVAFZ8mrBIQM=;
        fh=x93tjG3QNS+pvFeEpA20AfaV8c5GV6kUFZSC3vNxz5E=;
        b=An2D/zRWb7Dgk6wRDVNLNnw3ZdsZ4f/sry923yCkgioQ19fWgJIxX9CEDgamuSBNau
         pvB77y8Vx539ro2oy+CD1UC0uyYJqGWuc7kjvMCB5Parhkd3ifvApr/0DW5XbH+7ZrY1
         o9xxnTWQk1ndRuD+gfFa2DWuYu1tN0NJvtLU/pkmf1GQxHJV66zeO4aQRi1VQDl+iHFa
         jVZ8mwF3KgXqAyautSDgs6VEmCJF6Yql4UZi6z7H/Rpn2bIuWfbusR2bxUHvrV9zsg37
         DOrhwSKA6gZM2czrcz/TQrnzpEXm6G9psafRImOKZPieMHvSXZyzMGlNov4TbYmYfsfY
         6hUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775947684; x=1776552484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfI7WZixWr8hfh5FgBWMpYIgkb3WvfVlVAFZ8mrBIQM=;
        b=kzWz7qVEaJPLNUIrtdhKrQycNx4cB3e7XrU4Q7c4iT1db1n77iVSVnaB+kKeQTqaW7
         ucIwHumMuRXfyLmDGN2Mpzm4U6BtshlHXtP+7R3wcnIvZ8pCYfDeFJKPFfsDNFbI9baT
         euCs9wtcktEepCYKI0SK5sRmbQAYCfeI2onvMDmIHGa2NVmk38L/aDaAGTNypx2d0l0K
         XGi9zUNPVaoEDgKctltAsVTPL77jM5+10iOxJXEreCOAnNMMAEZ2xwl1ryIMw1kqTDC3
         Fm8FOeQwdXJp3/GJ75zfzNfFQji9eYsrQfvyhuXSXQm9NhQ2d4F1CQC8EyUoa/Zt1I83
         SbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775947684; x=1776552484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hfI7WZixWr8hfh5FgBWMpYIgkb3WvfVlVAFZ8mrBIQM=;
        b=nErvUnvpKO8hGF1wAR9GiPi4O9Kl/QDHUPBYmdbvOQnSKDWT2VRhyFwLorr4WDkDJj
         rdBJHaB4JYPKHVJoufQpMbFDyZ+rNsHZzhURbukKADgsmeVX2U74eoJYVRoLLdSHW1V/
         Dsy49xjxCitHZKI4aTsNLXZjdO2gYIG9I9bBmUakXlMcOAZ4NAbc/C114pDCaXb5/j7O
         bv2mJAOkO5Bq+X/sBm6Czfb5Zdb4UcI+r3Zar/TkBubTbktVEGhFuRyBtN2VEv3hz0rx
         lv9qBAiOOhqq9IpW5nz2dhb+30F8pf/PpHjNWtCzfGd8l2BImc1WNFD6705RhKEVxsb7
         Dadw==
X-Forwarded-Encrypted: i=1; AFNElJ/LCA+2ka1eOtnZP5NT3ZPSofzsO5kB2Jr/2jUtaw68bDTA6wgHzM0g8wP9d9svV1+UQQ4GvlP7YVAZ9GT5Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/0SNfZWmQW+plfJgeiUVh5zqAWvL5tdRa2BU1pCNOUVLdRpEz
	JjiOcOc/cDMm5EAaiuzK5ESWC+7lzncfxxrmY76L43ArAF0Z6u++JQHR4gpK5OSgNuiMm7TR858
	hO0udIGjZLnAZfIgGt1S1ypdIAoWWFCo=
X-Gm-Gg: AeBDiev4vnqpGpkpWbWscg0nxKhnE9YCvI+/ykxpeqkE6Poo6D2aTzHXurTIIr0saw9
	3Z5Pu2tYMnBHAc1gdJ9H1yTcDeZllLDSo1dvPXuHisvjsFA4QZZJEgnsed8kGgAGwnNa3fshfAI
	mTIuijE3g42Jzx6Q8F4mfMtn4hnkl9vLFqeQTEXcJ63g6Dq4r+vD0X6ZQBWgfd/Q71PizPifKDL
	WLY2sql0FMSBNCnuQ3iQqAdUo8qIZ6LddL2lBOs5Ax6LjujlchgEdhJOZXhUYC9wXamInoPgPu2
	ay9S9hRrUi2tcgio6jpHvG2G5O4OKCkqbmb3jcPqp+sOKA29t3Qh8WxRybJVBdL0/FBuA3NiBnE
	WDpk8LoRABSXh2ahdbxDH4+/1FD0GXgSNyQ==
X-Received: by 2002:a05:7300:6da6:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-2d589ca7743mr1992099eec.5.1775947684276; Sat, 11 Apr 2026
 15:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <YpOxb7raN9ztoDEyfT5M8S4KZA74Ua0I9VLcImKPi_lJ6K5xWugbgbzKmQcl0rz2XdRw0cXOYrDpOYjz9q62Dw==@protonmail.internalid>
 <20260410164704.1986859-1-wenzhaoliao@ruc.edu.cn> <87ldetx01d.fsf@kernel.org> <ABUAdgD1KKnjiCpcrxWXD4pE.3.1775914622691.Hmail.2023000929@ruc.edu.cn>
In-Reply-To: <ABUAdgD1KKnjiCpcrxWXD4pE.3.1775914622691.Hmail.2023000929@ruc.edu.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 12 Apr 2026 00:47:51 +0200
X-Gm-Features: AQROBzBJf75ZdfXiiC9J0iti4_SQ4JgL8eo_clRRhwnKg6Y8oacC5LbCeYbWwUU
Message-ID: <CANiq72nuy-KoA1oQewOX9EgrUOo7H-9UhWB0TkzhfAZWpnUUDQ@mail.gmail.com>
Subject: Re: Re: [RFC PATCH 0/2] rust: block: add a borrowed blk-mq timeout callback
To: wenzhaoliao <wenzhaoliao@ruc.edu.cn>
Cc: Greg KH <gregkh@linuxfoundation.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Miguel Ojeda <ojeda@kernel.org>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 11, 2026 at 3:37=E2=80=AFPM wenzhaoliao <wenzhaoliao@ruc.edu.cn=
> wrote:
>
> Learning from you that module options are considered 1990's technology an=
d do not fit the modern kernel model is a great lesson for us. If we misund=
erstood the maintainer's intention, or if pursuing this outdated mechanism =
goes against modern kernel design principles, we sincerely apologize for th=
e noise and for any burden this has caused.
>
> We are perfectly happy to drop this patch if this functionality is no lon=
ger desired in the modern kernel. We really just want to help improve the k=
ernel, and we will try our best to sync with the maintainers to pick up tas=
ks that are more aligned with current kernel standards (like sysfs/configfs=
) next time.

It appears you are replying to Andreas' message, not Greg's :)

It is true that kernel module parameters are not something that one
should generally be used when there are better alternatives, but rnull
is a bit of a special case, i.e. null block is used for benchmarking,
and Andreas may want to have parity with the C one for comparison
purposes.

But since your commit message didn't really say for what this was
meant for, then Greg rightly pointed it out :)

In any case, I wanted to thank you for reading and following the AI
and tooling kernel policies I mentioned to you in Zulip! It may also
be good to disclose the research side, at least just a link to that
Zulip thread could be good.

Thanks!

Cheers,
Miguel
