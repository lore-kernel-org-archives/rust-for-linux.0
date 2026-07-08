Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4628A41931C
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 10:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783507859; cv=pass; b=S0+jNjy/6QujqAqp/Pzp6AcDVHN011sv4Zr+MLg9yqO7+vbF5mX1LqguKvEv5LxRovGfiIIccQiKBekRz91pYvXbnAIVW1mruxHyeEReh2LMG7kUo0SfUtoBrNIA4OxKSPFxQvbKB8I4kavhTIXvDpi+9vGyh3ZPgDnRH6fcVOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783507859; c=relaxed/simple;
	bh=prLupvgPM2+eXKAMHkth2DFLb+LVDTMqUjjAZbZbf6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DksZYljAOTJ1uvvGVXQXKBxM56b6mIsX/hoLL4wOflWDLpvIW5Y6cHaIPK4r8sjUTGVclMdJ9IneuquiSYIEGA73/QmbgNqwfK/lQiFtA5dK+EwjfYAoWADeahSTXK+8bH2veOBEXcqbh6cWFE6z7oiS64PQohRhYsYsb71mx6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srj0fT57; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srj0fT57"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso16846a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 03:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783507849; cv=none;
        d=google.com; s=arc-20260327;
        b=Dx3VVQxgRVKQpBeb4VZs8mrAb55ugvKdwvDePGSoJLn4iDj0jYPRzm5IA1IrretMkm
         7kVt02J2wAOV47hudPDuGkMjL1HVwxlup42tzVQKu3TOULScpAW6VFhZj6ATv+TCcHvR
         0uplMt1E3djHuNhbtGtsAPbDRhDbSFYVtMlW1iuDuX9w7sTVfvo3Wi4HGX1LBVX4Ps2j
         wju6yfiS35WxuMlEYBlvenjz2+x6zqBFqTVB+HWFCC3QYaegPjBmrLmBqn8SquJqUTrl
         pgh1Vhzo/OynGNLsaZfKDDh2vE2d7oZ8CFC0SuF6pBOwslpkRHMBkNkCZ8vbdbZOs/7+
         iLhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=prLupvgPM2+eXKAMHkth2DFLb+LVDTMqUjjAZbZbf6Y=;
        fh=+yilJiErIJwZ7j59Wt04bQDVZpI+hxrFUDGOqpmXBZs=;
        b=OsMYoM+Vr9XE34R9+D0zwnNFUhhO4+YiqXK5DthiW36yOxo67Ym71Noic+tLcJfk/v
         dcUrD1eUg9qQmi9ATbGfAEUb8qimf2xhoIKld/4/62bA/tM7mU6mPHt8dxUi3X0MD8Ze
         Od0d1cASozJ5DS5SAoWI1M5vWbiaS29W6lDuydNDK08aRyXEr4grcXnjKsMt4tj+S3sv
         3f0Lcw2YaoQxhstocDC8W1AvrCbepEfDeeslQTIbJ8LrhXpz5/WUmT/5sJIvezsRAgCz
         SL1quTaV15M6r75oDmjdpzfZAWYs99sfVQqx04Jd3oC7qe5DyIxvaFp4w6OMWb2pYebm
         qBdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783507849; x=1784112649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=prLupvgPM2+eXKAMHkth2DFLb+LVDTMqUjjAZbZbf6Y=;
        b=srj0fT57cN/v8y3AR8kCj1WoHHgp83MP5ZiyhKfaVqklGMdGJphYllxeF3nT3hA+RD
         GXpq+7TBNgLjCE1P2bhXeKnseVT3GJI3bg9wU3IgB9EoaoFSkocw5ji/SJJCdz7/um1y
         KyP/zNM5IPMEmWrQdTOQ2dh8TN6KwkW7aa/qwi3ixtqmLDiF4I6UtaFUQphhwMOkuJeP
         AZE8yApGXOf5Z6nVI7gUr/NWoEVEwxQl53FGGQBZngZVm3TQiOQVFtjWQtbSvuSZ5AW2
         kgcYu73BEhkpbxgGW8FJUIBmC32TlBnGg/bXgN2XC0qncJhP7FtbzE/QhO66wbdLc4Uf
         bP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783507849; x=1784112649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prLupvgPM2+eXKAMHkth2DFLb+LVDTMqUjjAZbZbf6Y=;
        b=eSIDzi1b4WJRsjYF17tiBSwFQRumymVfUaZGjb2r2aUHb6f4zMq4J8SFC3BmhTi23D
         uZd7gGcBvcZ+mKNy4jh4YdrOmFJZLDZRt0CjR7dF4tLiptmue2LOiEcjfXM628IVnQ4G
         72d1S6sRiWEl6V/wA4vpGiZpcPuu031hsNxxDf7Td3EhtNyl9NFJzKsdWoIufh/DPznd
         IbUtJxJcXsWXLg8YvJbvrp7eX8GHiql/Ux4q/lJadeldWDeF07CkEAi8iGM7kYvfGDSd
         wp43Ii8nUGnruS6RijGVaQC1uSm7w4sJZaZMxUoloxCzMkmn2ncD5qxWWoLVZi066ZOH
         RnDg==
X-Forwarded-Encrypted: i=1; AHgh+RqowkQzQPKPcqqJZ5gq2SAKVM1RqqcLc4Y+t57TisaDn8mybXutnIPv4qCnwFd7rQESj/u8yHZzEUSAAbdZNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLRE+5AwDvHSD8YrmGuBJa6XABM19Y178UtfkQCcV/+iWwvvtS
	JbUum8AtLRtJTqv7xROGUmGC1kxZ1kaJSCpbn5P+ufFe15q1N8keM1Tx+eE6jM3JHYCl0vIbhqF
	HwBG0pE9OkYCfefehcyayMrrwRzIzdgI=
X-Gm-Gg: AfdE7cka7PgNF9bBVvvpMKfnxY7cp6zxXjpH9mIiRapw2R/gjQICEvjiLB6hRFG+ouS
	i76fQCKobCxEY8ONTLodOKLpuHwFQqatttrTJfA8hvWFi07MAQxHqIZTNLAmtnXVFg93OasNFUv
	YQ8AXjdHUTErYCLmhcNfoJh0dmRumIIiHgt41GWPdmMFjIDEFkA1QLf4zcfNSL3FEtlqRut2z04
	HMVtwMkLS555mEKOYZ0qT/18dMmxLTUOL9RGRgVPstamzLrSVTkTTTy/BGVc7jjjsYpWQqjz6tL
	6ovPurctY8hNYbsTf3usA4jtjA8EvEpGJjvdOcJ6czUHfWlGwwv24VV+TbhkEeyn5kRzBMiccuR
	ETSMPJ7d5OIRqJ/ftbLtGp4k=
X-Received: by 2002:a17:90b:3dc5:b0:37e:1ff4:44c4 with SMTP id
 98e67ed59e1d1-38941fb0f9bmr1734344a91.5.1783507849018; Wed, 08 Jul 2026
 03:50:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-zerocopy-export-v1-1-2bfc355853c6@nvidia.com>
In-Reply-To: <20260708-zerocopy-export-v1-1-2bfc355853c6@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 12:50:35 +0200
X-Gm-Features: AVVi8Cc7MWBNTF2zZYY6434dPdju2NAnCnyGkoavE9DERVwyjc6kIlEIdNjc2Eo
Message-ID: <CANiq72=-JJB2FpiDfo6Kx33RpS1Rpdi6Zvahw7zHfLqvoaHDWA@mail.gmail.com>
Subject: Re: [PATCH] rust: export zerocopy symbols to modules
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 12:37=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Non-generic, non-inlined functions of the `zerocopy` crate are only
> codegen'd into `zerocopy.o`, with their symbols currently not exported,
> making them unavailable to loadable modules.

Ah, in that case, yeah, we definitely need this.

> My `CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy` config is uncovering the most
> interesting bugs. :) This one was revealed after applying [1].

Yeah, it is a bit painful. I will add it to my set.

> I am not a build system expert at all, so be aware that the patch is

No one really is... :) (Unless you are named Masahiro!)

I think I will route this one via `rust-fixes`.

Cheers,
Miguel
