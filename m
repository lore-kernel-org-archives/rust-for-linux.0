Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23F82853E5
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 18:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097950; cv=none; b=sAfdAMCdt9wI1wYedF9rpN/3OrYgIRXGX+bfOD7upsz9rZIlVCIUO2XtKNnr0VxcD1Xje/EMKym9ZwWFLuJStq24ZtcmblplpBt0DAsLMNJCMRkN+A0XBby/RoqfbUhGoc35eT74lgepUE+17QuEwftKCb9pVY0lpACkvsXCnUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097950; c=relaxed/simple;
	bh=CHUPNxM/0iSi3JxpF1CgjbXiZ6B6iePJkIpSXdkv5Hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uf+E+8K6pgNyHgLXw1BxVGpw0DBrBhavzICiWvZWhDHDsLJAzNzlB5RMYtN/J25SQQq4WPSaRkoa4GrRcPG5P7eWHIiRmcw1/57Gtmb0uPPYJ1LRkP9vk5MR9PDGuR4a3TAu/bYkeTT8l1lPwOTQY1z7lRRL4OeiAAI3wGYlOHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6uEiN/q; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6uEiN/q"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-313290ea247so908200a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Jun 2025 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750097948; x=1750702748; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/0aQKPid0OhDziJF4+CcxNb1aOV1KdoI2S7xwsL/iU=;
        b=h6uEiN/qrs0bN/91ejJiTIout1pq99w+HK21Ue2ouRZnAcMNrK2B6N6Z6sn6L/xYsy
         Vt4FHRbk3GzBv6Y/UK1RVurOZQOQknfWm9t+M5AA4usP/1MNQhnz27IaxUP7hXFwpocB
         GqS+0lMrtxzC15qOAxbs7pv/lZuuBM4jeqlhKDeR1jmXc9CX366a/CJgtnibIwwoVo2t
         3Yo8W3zuSl9tDsyADBm4G73MWA8+ESG0YQMqxKCvOLu7D3SLg+RPPXe87r6O6D+vween
         kzQJKO4SqOWZV2w41idEzSosQvz8UMK6kkxD+C6vRCemYr/rZn2cxQ+IkQl4KfCwTWjy
         FKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097948; x=1750702748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/0aQKPid0OhDziJF4+CcxNb1aOV1KdoI2S7xwsL/iU=;
        b=FCPmGQkRlGpvIxS39SW1heRgV4hVqzXKnXEnICQYluMPXrdB3XC3/OzVE1k6vW5zNS
         A/bLUbO+sXjgZ0bSBxwoEm3ZeLCthcf2A4wkH74jdlHO4Oyl+LIMXKy0yl9u6sy3PS+I
         dbtscg/YYRHCvJPylqsV+aH6qA4EqIZ3KsJ2fIzsse+Wapi+u93pk1Dgk9RmAZE+XKQG
         li7i/AC6z6k6PTaZXuFOm5LNSz0TAag+drOiFpH9uXDMB8+EwutJ1xjWOKymbz1jaMAZ
         nXqt6TdYgPebwkk1W9T9iIu3Q/d19ezE/OZNMKGUJ6ErUlsOMMZozRU4qj0SMYU4krZN
         zI1g==
X-Forwarded-Encrypted: i=1; AJvYcCU9wI+z466AZS/0n9im9MeXRuS94kCJZuoXyQU4dzABQeILPc+cy//lkKddhORyb3M0OjWddgGcqzJezFvb2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrOvrQvB2di9E4y4aPIQqtPsl3Sj5i1R0aWSxX8uEVER8Miy+0
	mus3mOWRfGUNALECm8p3WSMjEBxlX/ykm4kibGaRl6rF5bqiY43/z4FKyFLatqmhIW/YgZUegmo
	7R2c+gjeVpvKBRXlQTANwKkPq68fhoIQ=
X-Gm-Gg: ASbGncsZ50sUdVe1kNUS9r6/FIp3a9N5P9hqgAzkHTTwJl76bwDToCAzoH0rvgnA/d+
	uh5oszp7aBEWWBHk01PuX6WFFbjGa9aG5pd96Azhfgx+mG8L/5gyUXg+OhyifRnPsajuIDCruE8
	p+AeB/pnlxwfQEi804zZ8gv6mh8M/jZPrYSuzPrerj3RA=
X-Google-Smtp-Source: AGHT+IGz+W+Rm6gPDIuwDIccWeN+0Zfr6xGMzzV634am9HH7hYPtbeE3HM07wzqfwx8gOuABgbLZ2ISGaOaiaWRp+aw=
X-Received: by 2002:a17:90b:4c45:b0:313:2bfc:94c with SMTP id
 98e67ed59e1d1-313f1e70849mr5982590a91.8.1750097947830; Mon, 16 Jun 2025
 11:19:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609223606.2897030-1-ttabi@nvidia.com> <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
 <123f682b56e1ecc24bb2dcc351f536641920fcf0.camel@nvidia.com>
 <922a39510eb74ebb2e463d20d7d5cc5c23316155.camel@nvidia.com>
 <DAMF71ECD17E.7C58IZHG946V@kernel.org> <62d73bf7771852188d915fbdf5dc23f7d9260121.camel@nvidia.com>
In-Reply-To: <62d73bf7771852188d915fbdf5dc23f7d9260121.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Jun 2025 20:18:55 +0200
X-Gm-Features: AX0GCFuP4qOFtMqPLPUEC1tUSDcY_wCip4g2--RzcVbPIlSb-7V8KqF2x6xEE6o
Message-ID: <CANiq72ki5AJFJeKXhBa1wy84AdBN5Eeg1cP168807_q6PvmvPA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"lossin@kernel.org" <lossin@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 5:37=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> After a little more trial an error, the compiler told me that the correct=
 namespace is:
>
>             assert!(core::primitive::str::is_ascii(FILE));

Yeah, that looks fine since it comes from here:

    https://doc.rust-lang.org/core/primitive.char.html#method.is_ascii

(Please use `::core` within macros.)

> That works.  Do you want me to use this or just str::is_ascii?

`str` could in principle also be broken, e.g.:

    https://godbolt.org/z/Ysxnb1WPP

> Also, how do I add "-Z macro-backtrace" to the build?

You can use e.g.:

    make ... KRUSTFLAGS=3D-Zmacro-backtrace

I hope that helps!

Cheers,
Miguel
