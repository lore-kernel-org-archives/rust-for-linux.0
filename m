Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A56139A7F8
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777028995; cv=none; b=PPoRZeM2QOc65RNPLynfB+7dUl1N3F6M9P87/ZV2rmPbZwMv2Rt0Tow0+7yz9EdHrmyBzS7hBaT+Feok2fCx0vdYFcl7zm9uRwKb+Djm361hwn/T+0j5mYrpBrP8Pyojv/6wsoO95BUSm84ZFB1wsJkX4u2Ip3KB9d/rmHZ9Xxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777028995; c=relaxed/simple;
	bh=2m/skchHwc5eR3DekHbks6y2/UhAgeRXG9eMAJvaWJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S1ws2/ejEJEksoIWZvIB2a0F7xnnwtKNbHvFZhF/AlWjFZ6MpnqhGU5YUt/dPRwRpTgoF0v0ZD62uHua5clt3DHaiHqzWgKzbi3vdom+QMFyeK0leep22NyVD4VlRg39RRU+jsNzPVDEAvy0FSjrVC1lO4hBEwNqLuXBQ879R6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZQhFnen; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZQhFnen"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43fde5b81a1so5769590f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Apr 2026 04:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777028992; x=1777633792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDKNX6OzlxA7jl/VimGCsLSHmvQn0nEFxj0ZFcUDDEc=;
        b=WZQhFnenLpFmoian4wDUgJpJo0bgM8tJx9QmVT6XTuGZXb0nlyWyqBkgr7MPXk4vre
         AUQqhNYjqusSl/EaTewN3KUmXEfmdjFE3TSjWy3NyQ+3Z9vGMIXmNIhmvRyVyv6we20z
         yEPiVgtA9tuoghJV1jGo9ku6H69MEas9tQRs6WN06VTPAvFaB+QDWtkUjGXIHnZ9ru4A
         b8AjgmPLwkMNqDNlel6MKlzsjlXfi/nFbZHK1PCoc0IX+2KCppmW2NBvE1qYue7wa8sv
         UosYi3Xag3aKKUNjw0HNRXPWbjF+5Wo3AmcsnPSIBIqPR7BoSko4EONk2MOeBYmxcOJQ
         AmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777028992; x=1777633792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FDKNX6OzlxA7jl/VimGCsLSHmvQn0nEFxj0ZFcUDDEc=;
        b=P7URCYs/Y1Wb36QnEjxXj16ghB29Duy6Cx3R9JEgwitPZt6vgPjU7QLeIVYwOyjtm4
         3AoTHL/hSb1E/oZBxPBdGlLrUz9Pxn0fXvkQDcquJEYG3Nco+z6lkgMOUXtc8tCs61cF
         THIafF+mmlppmqYWCasL9WsPprQ/VtzUJhKjBAVJJc7OknwowHXCA+4SYObnYWZGG/JF
         HyQMJhttlLcwLU6/ZKu2MeYmha3S5b/7SWulrerNV/IzWKOvTEfqWVquSylKDOnZQPr6
         f59ln+ru6BSJYttu5Xz5hoqczrZBOTsIfn6lGGz7DF/hU/Zg0FsTjtU9Oj12pBbuTKVF
         F8dg==
X-Forwarded-Encrypted: i=1; AFNElJ8Kj5I8NkaFCPdcZGZyODDz3BX/GiyikUU4LVWupLrEZ4eb3vPdYx0InHy4szGfRB1AvZH0Ewib45ntve12aA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/nvL3je37g9Ari11dMXZetmRDKkwSCHs2RwH1anD5vLNbT0/
	zvZJBja13LrcFpRyL7HvSZniCdDVCOn/yoiF9dw2PR4UAMzFVacaFLRC
X-Gm-Gg: AeBDieu68UDZJoiPzWhPN4l9whd0tNAkg1KbDmFFUtsK6UUAqJJc5WNWkodNVQbcoL4
	oDbLsKQRBq17EivtxUFSxlTcI6TPvHHtuQ4GXrc+eJ/0BhUpmknoFDlu8jJ44zDLyBX6b9hSfuz
	H9RL0+p7Km96SOt+uBll17ZLetVQy+D09btOus4iVhJdwC8ihmTIO1DNTwP2d77mF+KYfuPtWMh
	C7yKojxDJiwyeYZ4Hnye/L8PUythCnLRqgud9PTxyujQI/3JrKqOKxsynSPwDgIx/X5hSTJBv34
	96P0p4MAdk9LLaTpyDpeY/Poq99O1q56cUs0Y304CLb2/i01mv6culMOrh83Z8pqbrpJLsZcHyU
	U9djcylIjQFMuT2sfN0XhANRODusTHF0BQ5N0inO1WH5PY1jfBkFZwgumAFjsKXNzNDtCS1cEzT
	iF8Wmmck3mrw8Orju1peIUq/pb58x7XFx+Mqc8bhEW3RjwiNm7Pm9xPSmie3L1vlslUMXjnGuTd
	AdmW36Ngyk5eg==
X-Received: by 2002:a05:6000:1863:b0:43e:a69b:d818 with SMTP id ffacd0b85a97d-43fe3e0ab5dmr49306229f8f.38.1777028991633;
        Fri, 24 Apr 2026 04:09:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc0f31sm59174867f8f.12.2026.04.24.04.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:09:51 -0700 (PDT)
Date: Fri, 24 Apr 2026 12:09:43 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
 ardb@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, simona.vetter@ffwll.ch,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <20260424120943.4a65dd69@pumpkin>
In-Reply-To: <aes7L3M1d_LvvGKa@luna>
References: <20260424054742.45832-1-mkchauras@gmail.com>
	<20260424054742.45832-6-mkchauras@gmail.com>
	<20260424101425.6bde0e17@pumpkin>
	<aes7L3M1d_LvvGKa@luna>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Apr 2026 11:43:11 +0200
Link Mauve <linkmauve@linkmauve.fr> wrote:

> On Fri, Apr 24, 2026 at 10:14:25AM +0100, David Laight wrote:
> > On Fri, 24 Apr 2026 11:17:40 +0530
> > "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:
> >  =20
> > > From: Link Mauve <linkmauve@linkmauve.fr>
> > >=20
> > > The core crate currently depends on these two functions for i64/u64/
> > > i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t u=
se that in
> > > the kernel so let=E2=80=99s panic if they are ever called. =20
> >=20
> > Ugg.
> > Surely you can make it a link-time failure?
> > Or change the underlying code to avoid the divide. =20
>=20
> This is currently a link-time failure, which means if any of the core
> crate or drm_panic_qr are linked in, the kernel will fail to link.
>=20
> And since we rely on core, that means no kernel can be built on PowerPC
> without this patch.
>=20
> A possible solution would be to change the core crate to not divide
> u64s, but the last time I tried to do that I couldn=E2=80=99t quite figur=
e out
> how to do formatting without it, maybe I will just open an issue against
> Rust.

If the problematic code is (effectively) printf("%lld", val) there are much
better ways to generate the digit string than repeated 64bit divides.
On particular you can use 'multiply by reciprocal' instead.
For example see the latest (I think it'll be in 7.1-rc) version of
tools/include/nolibc/stdlib.h

	David
