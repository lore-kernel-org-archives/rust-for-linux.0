Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB573AA9F8
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 07:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780385811; cv=pass; b=WzoPge6F5XYzXUHDXFuPzGuUyBxolzm+Y+zjpX1O/GqSM9B8j9b7zFFIu/LOTZcXM0D2O7dHRavCenAwQsCuTs74TlVgGa9wuHugFBXwBwQzGE3jh/tzHGPzFeMlQXBPpG90ztEBJatXB4ymggVmF2YzZyt50Ksn9DZwGV/uASU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780385811; c=relaxed/simple;
	bh=+A/GV5o2sUlHF+5jSvNVL6GHuIN8ETVy4HVJ/HHAPUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTdHJfsyl9UBKTu4BMFX3KBJtwRZCgCiKPot/gjsW7nA5Vu5oKPu2sWKil04s74s4WpVVbOSoQLpF0yFhWvKZA0D3YDH9K2pcq6Pvf0Xt/eVCjniKAlAGR0k4PtKrmmbL9FDbiGOpE14aChlBRiozoFIlNM2N9r7/HBJBFCyDP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrVkap4I; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrVkap4I"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-137c0db2638so244400c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Jun 2026 00:36:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780385808; cv=none;
        d=google.com; s=arc-20240605;
        b=GKdbZhxwJWDEv7W0nQLeZGDVbO6/V7sZd58zLbvIVV9yTCXEdcXmh8EmQNJ41SJt1k
         IGcPGMdY5aWVpA+i6ESIVAuQ250cT3JnOFc7aXbi2GBPjbEDxrIbyk+h5zAp0G17T7vJ
         V8yw+KhvhSZRLDKHdUn4bAW+LGjYEOQuMXjv9HUNjMZ0zRJNM/HmYJgqQTpSLQLnhOW/
         6UNfFwn7ZShTeAUiz2MTOfZNGkIHO9ro7hWSYBzLWtGPhKp2PUeMMJFWNuAZUpB4dfRe
         cHseCJBgMpqAWwKLJ+xufaRHKfbTvIoQykAcxMxx/OVCBZ0sbc8FJ9Ck3B9+Xao4pJIl
         DoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+A/GV5o2sUlHF+5jSvNVL6GHuIN8ETVy4HVJ/HHAPUA=;
        fh=vy6UCH7tQHYjXpNl9ZYNemfniYJk9SwFPjc2ROuP6Ig=;
        b=BBXIySPELwhmWH30qL3q6y9t90lQFXa5oStU6w+vXwJlu/EmMYq5MFo+Uqg0dMaFC0
         LnwZ/J+gu4m6mJVfESFecastoHf7lumnBMyoJJbbvEopjGiF4w8+dLhPlXJ51eJSkAwm
         Xestl6t0R0eRx++bp7JPFKiqWWmyGRFnOLu5K3J90LxOqIwZ0qfkABnvFMvw1HlDb6DQ
         giFrr2NTCWXD9py9HypmJ9n0FPpcYaTdpFaIcCvHA/QIcEzi+bg9lqBgc4pVRs58H8tB
         LXmiUE9EVWroa3ubRhoR46KU35oAeosRm/mYogJwLYrjffuo34EPljf5Zb6Ta4LVy4Ub
         czeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780385808; x=1780990608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+A/GV5o2sUlHF+5jSvNVL6GHuIN8ETVy4HVJ/HHAPUA=;
        b=PrVkap4I57y8fhb6AwoV4w6aKSd2xz8XwYil/5/WNN3F+u4NhsSRflSPIsRbpFib/D
         IFg8YylzjPYqQuijTKVND0mrezqwA3JQjhbkVhcGKd9qscnlg4rWy6NTvyTZAU7o+/LT
         XbR4G5Kf3KHzEjvYeZJLo1z9kDCKPWniR1+YNtaSIeV6kUOVJT9WsOoLq7rhdTJcheOU
         Jz8oJ1LlPP2DM+69ZDug2FuQckFal6aJiSTUU8psUWn8i6ABdK6QqX560a3xtufV7sl8
         9Aiaw7HvKrtwQV3y7aRuN3FsmUFwt/IygnPD6xaTpgIRYkbCtk2SAOzVMKGCBflTyr/7
         WyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780385808; x=1780990608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+A/GV5o2sUlHF+5jSvNVL6GHuIN8ETVy4HVJ/HHAPUA=;
        b=PSpu1+62h6F61BHCoYZAoi28EszruvtJwNxw4Rwt+06eVpDULBl21MAK2jseXeRAZA
         q/LPrm6oyj9u69t8XzEEue0Nf+ATAwVMjlpt0vNLi11GSyyakAaIBLl2YeRldt1NUDDr
         RkbIHe/AqX1aRCwbk//EtMIy+3HSzFHjR3/ey+TitFl8dySJUuHLzexKxEkt1Tv4+NWZ
         EvV2n6I9Nax+b4jpaifFWqqsMKH+WATgUHR8HMT0UEm4fkrOiLPOkj2r3FPvks7ivqE4
         PfTH1bg7SQQULFCJqJHUCktFdOpR7YX+aILHjL2cWeRTfuz+jb04wxFj7fqMWdaIW2u1
         sqOw==
X-Forwarded-Encrypted: i=1; AFNElJ+6PBATH5s+x/cw37FFxMy8K2dNYipdmcAcNC/eD30CjbLJcXCgWt6wTmcJDmkYgXjFy6MutwVioxNQdbOVWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUHjDTCAxQUxC0w4IhoGEsB/JjrvbPYBs4la/0juadKaXqFlk8
	xdn8LJ7omZrj/oqHJoLmQ6tWYNF85IEPjxboi3+hJdwIdgGoDN5XbPwn2/OnbHMtWJDHVGfiJVB
	+abMkOMvbl9Xn2fctsOyD8F5mwF9yBY4=
X-Gm-Gg: Acq92OEM7ntTCdYWXP/xEifI4vJ6fZYYflt3Gc1HKc/NmQ2HFOWNadF+Z0vfN5g4Uuw
	/q8rjG6xzx26h6OToc27MSBk6iQXpVlQ4YjCmfUAFsn7Zk1JkpqGX7CROfIXg0nlNmYnqeGdnAx
	9121Q1jbEUw1r+LfIE69WxcD0M6C+HIOUW8LUJ2bv+33r7gywfY2+D8C6IpypBruSxx6Scq6tXA
	frsowF9oswYgi7B84/3kmVRcd79YFliPkFqPk9UOc+bhFvnnwywnSlZZFhbLeaFFIC5R4zvpWsO
	i2PEb9JdMvSvG55rMTPQZqcs7kM9FXUeedNCEOtwrdpAiExBQSFvREpikogBEQjBeNX6hgrnSGM
	mIp+dXtu6Nrq2QvT311c6iWAb1JnBwWlsTg==
X-Received: by 2002:a05:7300:fd02:b0:304:c73b:79ea with SMTP id
 5a478bee46e88-304fa65935fmr3407438eec.3.1780385807836; Tue, 02 Jun 2026
 00:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530184944.10459-1-contact@jkam.dev> <20260601165042.8450-1-contact@jkam.dev>
 <20260601192305.GA965997@ax162>
In-Reply-To: <20260601192305.GA965997@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Jun 2026 09:36:34 +0200
X-Gm-Features: AVHnY4JJ4SVDYenG-jUsNBsnkOBJxlBK42SYK7J_hB85geQn0FH46b8_Yiq3DeU
Message-ID: <CANiq72nwsocH1xypqFegtAuopaARid_3NHCdbZNhDWjYOtNe5g@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rust: make `*.long-type-*.txt` a target for cleanup
To: Nathan Chancellor <nathan@kernel.org>
Cc: Joel Kamminga <contact@jkam.dev>, a.hindborg@kernel.org, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, gary@garyguo.net, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	nsc@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 9:23=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Not that I think it is worth resending over but I personally find the
> "clean '...' files" title easier to understand than the "make '...' a
> target for cleanup".

Agreed, I can take it and use that title (with the `kbuild: rust:`
prefix mentioned in v2).

Thanks for the tag!

Cheers,
Miguel
