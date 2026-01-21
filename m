Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2FA1D555
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 00:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768953689; cv=none; b=In8H5Aq/0Mxlkef2URWXz02X1BT0k/C30M6JcqQh+hIbdomZoK004H5Ww2rgYicl3KXXND1ylYSCtsJHKDmdyfx47Q9v5D2ab4FI8uhRJSYL9bNry966r1AuvMS+x17vjnZ6FNw4lGzECShrYBOWe7/o4G/SYe7L23d7CDSzeDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768953689; c=relaxed/simple;
	bh=yRdJQmpTWwZj8gimb94j0TPF7S8boNAdmVxrjjDF1sk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kXXT9mi7nwTyMnDMh/MCeRX5CIf7B/l0vSKYfTQiyWBaPV7Cl/U6BnUTa4i4ApNgbNL1c5iQtX3/7RCiqjFlpeLX1sfYGHcdgdryu1Qkzb/xPLtd0ZgWCqShITax0GvScFaT9xOe2cPkY+dBJ1x7aZ3ulXwRGYBD50+FBzu0UGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aj7cv7B0; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aj7cv7B0"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a12ebe4b74so56661675ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 16:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768953687; x=1769558487; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRdJQmpTWwZj8gimb94j0TPF7S8boNAdmVxrjjDF1sk=;
        b=aj7cv7B0RiXLew4GU9ErUHbAz1sreeIe7dPcnwtstuOM9qQjMu5fRgQ9EBmLP+F7XH
         2/xff9vM+4JNgTXv5ZMsuD+uPxhPj/ErW4Ajd9N95PqsztfiZ3SdXF6ZEnPyyRbYIeM6
         bP/Ia+qWB6fHsKu0WHMLddGXW+Ze84HnwWeT6oG11XMQ72f5dcFkjSVtsyTz2mFb12yk
         aXYa0qmtm+jy6LHB7K4CmLGVwaAEiFOaNhVyhouuyeFrg0Zq3/1cG83yiEJbj90rkp+W
         5+Z6tVM7GN7Xv8sQN1Y6rEBEVApAnvQAqwJ+1C+nEMcjMZycdvE01iQ71Cm2dPukq9qK
         PV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768953687; x=1769558487;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yRdJQmpTWwZj8gimb94j0TPF7S8boNAdmVxrjjDF1sk=;
        b=RY96+71DnP0MIlxMh9uQmIM1p58IZ4Nzsd46NJUgWogj1EfM7pZUcsw/QzjjMR0ju6
         EMyZQbrj5ojptkO888y0lX1F7CT7G5t5V3nyCdwBTa8ltJ7shDf2F76Qx2ULatLvsiZp
         n+KqGKhSv8wqbLcOU4EtYEFZaMoPB/GSlHgq000a3PGgMd/8MbXY3dpsA6DiOeK9H2dy
         w3u3BmezmkfNMsS/wp/XpEu7HP8QcbGJ5djK9uZCZdyWGuhwo4Mn1eSPAxpPYlyAAIug
         M9/2LtoM/vQvBy2LdF5KziqlJC7ZaZr91GJ7NsyKNzO/PaliZjPdyH6gE7qQtU/AKwD9
         FNtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbRcioufTKGvEE0j33HPt8nCJ7G/K/wCidUSPEQXGv2xNKL+w0MrKfHLVsNl6365w+Vxhvb5z+SJ3UGe0kDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAqeQ4o4mmx1uFXvi5FwALYUbJTCGHtp28d0gSp6VVY1Fri5qw
	K751Idp/rPpdreiQp4vUsR+Sz4aVtk+brIak8rkZfXF0OzlGVrO4TUwu
X-Gm-Gg: AZuq6aJs/gxyw7GXJj9joUh0TRIQRDkH23bccFmyfky0vH1C7UgRyjQB6OBK45JlXHl
	rAgW2PSBxf0+0tW5zV+HA8AcpUv1J/1pyPDyGhg+MtqwDT3tUIFPvSlF9V6geV71BZo/6NDEDjw
	m+HH2hlUDkKufZYVz1gf0lC6gmgr3bPteaUFEUYYdTUIAXnX/0RHLcp2/OawW7gVM7k/TQeFLlQ
	aL3m7FzKDxlG+3P7XKZc4x9w7sh9vnduGsNsspSaHw6uQ9pGma3tuSoIxWSg79Ozkmo895sT8pz
	tin9Ktqt0cZ8PDZSNGhforLKD4/KUyCULdQwl9paiLEHANRvlOxn2gF/owa/FuqhYGQTuvI6yL7
	kPCoENJJMlsf/k3ZJLilsF5XMENZccTGWtudXhg2MT8eFcVVIOF4618TzUpAqLdv9wUbNeSZxh0
	ZhMIsjjg==
X-Received: by 2002:a17:903:1a2c:b0:2a0:d5bf:b271 with SMTP id d9443c01a7336-2a76ad5bf2bmr31448885ad.32.1768953686781;
        Tue, 20 Jan 2026 16:01:26 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dedacsm135367515ad.58.2026.01.20.16.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 16:01:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 09:01:20 +0900
Message-Id: <DFTTQTYK1KNF.2N1PS08QIAID2@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 6/6] scripts: generate_rust_analyzer: move sysroot
 crates to sysroot_project
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Tamir Duberstein" <tamird@kernel.org>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Jesung Yang" <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com>
 <20260120-ra-fix-v1-6-829e4e92818c@nvidia.com>
 <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>
In-Reply-To: <CAJ-ks9k_c3hq9ov8nqXLakkC6=Ly1+Fr3kbQ8BUbAQrRcHZhqw@mail.gmail.com>

On Wed Jan 21, 2026 at 12:34 AM KST, Tamir Duberstein wrote:
> On Tue, Jan 20, 2026 at 3:55=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.=
com> wrote:
>>
>> Use rust-analyzer's sysroot_project feature to properly configure
>> sysroot crates (core, alloc, std, proc_macro). This allows
>> rust-analyzer to correctly resolve items from the sysroot and
>> automatically add sysroot crate dependencies to all project crates.
>>
>> Some sysroot crates use #[path] directives to load files outside of
>> their directory but still in the sysroot. This is disallowed by
>> rust-analyzer, so the sysroot crate are not properly loaded. Loading the=
m
>> using sysroot_project tells rust-analyzer to let them load anything insi=
de
>> sysroot_src.
>>
>> The sysroot_project field was added to rust-analyzer in v0.3.2328
>> (~1.87.0) and is silently ignored by older versions. In that case,
>> rust-analyzer falls back to loading the sysroot via sysroot_src.
>> This basically works, but the advantage of using sysroot_project is
>> that we can make the set of features/cfgs more similar to what the
>> actual build uses.
>
> This is a very nice patch, and perhaps obviates the need for the
> versioning infrastructure in
> https://lore.kernel.org/all/20260109-ra-fix-primitive-v2-0-249852a4145a@g=
mail.com/.

I still think the versioning infrastructure is a prerequisite as we're
using the `sysroot_src` field here.

If we specify `sysroot_src` without `crate_attrs =3D ["no_std"]`,
rust-analyzer treats `std` as a dependency for all local crates by
default. Consequently, any rust-analyzer version lacking `crate_attrs`
support (which silently ignores `crate_attrs =3D ["no_std"]`) would
incorrectly assume an implicit `std` dependency for all kernel modules.
Having the versioning infrastructure first allows us to handle this
transition without breaking the user experience for those on older
toolchains.

Best regards,
Jesung
