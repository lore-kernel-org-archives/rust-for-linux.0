Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E5F204C0C
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 19:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745005489; cv=none; b=axcrSpXDZqS74dO/9vNW74N47oEx5/jiyi1yKchAohG8AZeDQofiI48dM3qzwo5rnJt6JeNuWKqtsmrBUoLTpd58QvbYqrYyBEYkaYwa3OsTjSYqJ0FTNKkOqahtZ4KV4bs3KiIC9NTrVFCPz4uZNvi/ehqfxeqIY0XK9yb8bzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745005489; c=relaxed/simple;
	bh=VmITldUAVN4yeDbRisnT/KKRuBjKNTaek+ixSS4e5/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTgQ4DmrEvNEIuk0yqv9rB4dZscVHqpNVNe8Q3vnDx31JVpTCFzTuwbKeUWXdD4EsvdjLBTYLPw5MtyPGU5hRxLzUzbnln6Srd9ZbxhJpDNFBNG25iG8U5QzwIYzPSBSRsnhvLfbY0glS9zR+c/MuVxwqTFgcqNDw3i3kg2QZEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hefring.com; spf=none smtp.mailfrom=hefring.com; dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b=ZMnnfyMp; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hefring.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hefring.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b="ZMnnfyMp"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5e39d1db2so112696685a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 12:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1745005486; x=1745610286; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SLauaaAIMDgGRmgJvUInjJwX+d3UVwdMW/GukaI+OmY=;
        b=ZMnnfyMp+VyxkgEwIIqKCYfnMlOgzYMfgd0BiXmhy54bzSUN1C61DZVI5Msptbs3MZ
         XU6tnoQW2EfNMMmPuHFfS+07mabg30BH2bHFAc8UMUZ1+fI6jMQqMUsiJA3rjw6AEWHW
         RDtF3Yr5LANc1Qyr4sGHc+qf/BkmI4QlyhjMl8YaGPVR7Z3IBHlTMradDqSgdctvMJRS
         Ii+hmyCreHwhGC0TOVxY6oKcVFF7+7Wa6f+/d6vK7WCOPwLnezvOxCyvz40SeQBQcUV8
         SM9FVM3Mv1jJT3cF5kcHAaDmrokkVJmt/ajoqab8zXkNcGOVEMfGW5p5nbxRzt/zCxAl
         4BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745005486; x=1745610286;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLauaaAIMDgGRmgJvUInjJwX+d3UVwdMW/GukaI+OmY=;
        b=TzRyUATzN3O0LFWPcaEgfgUMfAW4LN4CFRyuaWxTmGG8EVgPYbumNA4tUfP0COCuAV
         ZynUgj5r/Nf3+xz2et67DoAlPVuEKudfMQQC98qHEXb7tuz4Z4pxp6ZjwuOYWFliqKBO
         ol2TbZC5PybCBWSjsRXjBa11wcWlwXU1b/OtSyp8+cJtTgHonB2y0gWnXUv51omHXwwj
         kPDIzgQ7N9/Oa+Svak6Q0Y8A4eEYkatxULGP5rfhLY9g7ODgGIcgTplUNT7ehQ4FfW17
         Bvz/JogtlI6r+GOi/2TufeeHOfJCaIH8eX+3oD6sm1ahZqTrXTLHkORv3AFJLrRw8sfX
         FrKA==
X-Forwarded-Encrypted: i=1; AJvYcCX8NN08ll/UVsRl4r8r5HQXM+AbjHLPH0frGMj6PrnE/0Vo90kvqN4TcP6NXIFz7VlKUomVvjsLORz9hah4iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YynEHxTlTTRRwjeLvyRR3Xs4FA+TBfZqg5TevlpmluUIwz0i9r3
	otJA3YuB/Vh21V1zEz6H2LDDdk8MXFh7ckbAl7U0bu3HBoH/zrMHbFYKz8QRSHs=
X-Gm-Gg: ASbGncsbkI9AoS1hMrHy5wGiZpLgJBop4T+aMrERkb0TPAFTU6aLflti/SO6CYW2E8F
	d7gIqhaamZ3v6SsyKwKlqFRLhKjRieJYqrPGu9hEAh3+NZIfs3GOYcY0fjsI7tgh8V/cmvindhj
	xYBzYWwTfkJOKJ4uGUeG+4Im7/5DJmNlc+dV/VEA87uHW10Y68yZtYwNHe96zM3nCByDgRpWv6i
	JFy3Ie87gYredq5Up8vGWnh582PMtK6DO8Spf8RGsBpCyFPXwOqU7R3LjuL9OUTm5NOulyvJ4E5
	mwZEb26N/lRQ9P+hHcHpl347pkZEYLumUqqg/K3xnzKxzbtJ/HgJQzTWxQ==
X-Google-Smtp-Source: AGHT+IHi1qEGGO/9pcvHTp0Xydqxo04Oz9IXipqF7+K166+yoLclI0eNGI7rSM4ss05GvLdt3ykMpw==
X-Received: by 2002:a05:620a:1923:b0:7c9:23c7:a92b with SMTP id af79cd13be357-7c927f55148mr672289585a.8.1745005486577;
        Fri, 18 Apr 2025 12:44:46 -0700 (PDT)
Received: from dell-precision-5540 ([50.212.55.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925ac131asm138758985a.56.2025.04.18.12.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:44:46 -0700 (PDT)
Date: Fri, 18 Apr 2025 15:44:43 -0400
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Christian Schrrefl <chrisi.schrefl@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>,
	anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org,
	laura.nao@collabora.com, linux-kernel@vger.kernel.org,
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev,
	rust-for-linux@vger.kernel.org, torvalds@linux-foundation.org,
	Nick Clifton <nickc@redhat.com>,
	Richard Earnshaw <richard.earnshaw@arm.com>,
	Ramana Radhakrishnan <ramanara@nvidia.com>
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
Message-ID: <aAKrq2InExQk7f_k@dell-precision-5540>
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org>
 <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
 <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com>

On Tue, Apr 15, 2025 at 05:38:54PM +0200, Miguel Ojeda wrote:
> On Tue, Apr 15, 2025 at 1:40 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> >
> > On Tue, 8 Apr 2025 at 00:07, Miguel Ojeda <ojeda@kernel.org> wrote:
> > >
> > > On Mon, 07 Apr 2025 22:58:02 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > >
> > > > Regressions on arm build with config rustgcc-lkftconfig-kselftest on the
> > > > Linux mainline and next failed with CONFIG_RUST=y enabled.
> > >
> > > > Bad: next-20250327
> > > > Good: next-20250326
> > >
> > > > Unable to generate bindings: clang diagnosed error: error: unknown
> > > > argument: '-mno-fdpic'
> > >
> > > I assume this is the arm support, i.e. commit ccb8ce526807 ("ARM: 9441/1:
> > > rust: Enable Rust support for ARMv7").
> > >
> > > Clang does not seem to support `-mno-fdpic`, thus you probably need to add it to
> > > `bindgen_skip_c_flags` in `rust/Makefile` so that it gets skipped when the C
> > > compiler is GCC.
> > >
> > > If you do so, please double-check if the flag could potentially alter the ABI in
> > > a way that `bindgen` would generate the wrong bindings.
> >
> > I tested this idea and it works but I don't know enough about
> > rust to double-check if the flag could potentially alter the
> > ABI in a way that `bindgen` would generate the wrong bindings.
> 
> Yeah, it would be nice to have someone knowledgeable about the
> arch/GCC/flag confirm or not -- I don't think Rust knowledge is
> needed, i.e. it is mostly about how GCC behaves with/without the flag
> and vs. Clang (since `bindgen` uses libclang to parse code).
> 
> The original commit adding it to arm (and similar ones for sh and xtensa) says:
> 
>     When building with an arm-*-uclinuxfdpiceabi toolchain, the FDPIC ABI is
>     enabled by default but should not be used to build the kernel.
> 
> So it sounds like it is only an issue for particular toolchains/targets anyway?
> 
> Cc'ing Ben who introduced it, and the arm port GCC maintainers in case
> they may be able to tell us more -- thanks in advance, and sorry for
> any potential noise!

FDPIC is only relevant with no-MMU targets, and then only for userspace.
When configured for the arm-*-uclinuxfdpiceabi target, GCC enables FDPIC
by default to facilitate compiling userspace programs. FDPIC is never
used for the kernel, and we pass -mno-fdpic when building the kernel to
override the default and make sure FDPIC is disabled.

Therefore, it is perfectly safe to omit that flag for kernel builds with
Clang.

Ben
