Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626DC352C2A
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 19:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771787491; cv=pass; b=K0cTdUDHtKgsvxB8kNN3Cf46qPHX5lr6TN5TpuGgC/i2sclybE6cnyCFX4B2p/Jwj96RoIfXgl4DZBkZ9SUp8T1qcsTz8wY3j5pZZKUkQpOpfpOfmLOAFJPh2y9pur4yzwuYf/Zw80Gc67O84wR2gBslZZEWybEPj/YUIfFXXwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771787491; c=relaxed/simple;
	bh=s/YD0OLVc6+h/cuK+yNzdFi8vPgttaGJW9YhqP9hbDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQMym8/67B++PTwY6pQYi1G0omCjj2VSZ1kd3r77G71bj2W80Al9zCO9mibIdQpImYvJrZeAEEToXPusMESVOhf++JSs6XVbg+6axJ5k/OSgs/tkPTL4QDmcwhtfz93r/lGTkhbx/JLZzDq1TGmMBWDDmQPSaF3BjE14g20tZHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+740L7Z; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+740L7Z"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bd801b40dbso60236eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Feb 2026 11:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771787489; cv=none;
        d=google.com; s=arc-20240605;
        b=j/sieHWMiv91tc2yMNEQUNLxJO926Rfi8UPiUGo7uFGLGln13m6/Cl1serh91pXVvo
         CSTbXBDXo55UJ0aLTd2CPZO/faZQFT3OPG9Go3mHmOTrnHyEL9dQgA4OG8DPWRC7YelW
         RWSWa82dgR078VhrxIJjhHn67Z8H/nbQ8yZbGobrJtPcJBTl6gDl4PG2lHVReb1rbSvV
         y/2KplKc7Va8MDIB1mOVAiaynlImSyteiWOUxuM5vIh1uC1og1DZ24kBh4pLoF1n3YCi
         fv4fY/tCGxeLEJ7WtWgM5n94N0eXfJeQoB8u896BuFXkcLW4qwW7s8G4hgjKJ5UF5fwx
         6qcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEfRoAIWjupjNUOZFtJHLhbd771aYMAh/CpJMSay5VU=;
        fh=ZQeWHxvbQl9VYkm6IRXPxbs7DFtIGBBsDEWZ24djmZo=;
        b=S4sYnO5YT1qASZVxRsF5JaLJN2zhQIy7/rghQR/aYlatsZ3ZA4A+bgWhLXWiJC9Q+F
         kGb5Xt4ZCGOSdrjTr8sHTrCWL3MbFXcQc+qANohIAGmwuOCGkuI8yVTrF+9QO1wYqrYC
         ESXHihfvkz79enNhTusAAlme5SRsdmozKMqlIN/83ajqeYLT9hNca13jAR4yV0ly+Vbz
         8J3TJ6SSBDih13dAFxagrvAT8rmWlXpwTYta1x8wQ1WFMbPzlFANqPet1W5S0f9/AOJJ
         y7U1fsPB6Or344S86ecGcffliSfen95wMCEUzQVbYU64U1TywlKu8naiaWPh1FS+wBoH
         4EFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771787489; x=1772392289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEfRoAIWjupjNUOZFtJHLhbd771aYMAh/CpJMSay5VU=;
        b=C+740L7ZI+ARrHZpUBT4/Bzp7+mcOI9e4c8rOOKNCos7cPFrHt1dVuimCMbzVXJz0j
         Z7PMhyPsndmkPw+KUtxGyDN+nnow1wlJzbiS9MfwB4x7IOoyZuRi+51VKALc+o48IP2p
         ASLsT13DTq+zvp35lzvjGeD8YRffLJtofHelrve6QXioAS2b4ryls2xnYN06U15aFE0t
         VPKJz8dSNbNCcz9M+KWYfnGHpvmUTssvKC7NKhjMz6GgYPNK83sSztx7lVqZ/4xLY2YM
         5p6OwXoP05urEJjMRVP1zHqSKcc+sZdgiw7s9A1M2ZZQLjQ+QIFU2FLEK9usHxoKh654
         +FBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771787489; x=1772392289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YEfRoAIWjupjNUOZFtJHLhbd771aYMAh/CpJMSay5VU=;
        b=Hj5lBKAbpkDZcjVsad8hpVxhf3fToaG2Zi3rCV7EL3DryFgaaaadXcqEGOUvt2dcmF
         XdmUL/w+Sfvg+tPah6gLMRtj9aj2U9mupyLMC9Cx92OHr18bSCE7BoA+OLNxrHOmQ13D
         llTyk7My+oiiApgMNVi7UHyYnLEvm42xXwm+wsSJEU45baVReLNF0s4EQSTruGRYxpzG
         UH5DviHj+A3mrer2M+ShAsgnOCHN0I5s5GrtG3dSoLZ6Kz/owHiaXwxT3D67Q80i/xwg
         PrOxbb0mG8pofEj3AS4fmGHQpIBQN/Nq4lKHLgx+IkQ/s7k9FqGCa8eCST1E0nL11D9s
         JIiw==
X-Forwarded-Encrypted: i=1; AJvYcCUxk5MdfqrSEtzgqNKNAvnSTf5jZ68Ch4j9QqEBHpFi+CeRpFafbiM/2hJLcWOjRlHXLXi56OBIAneA55C4Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHKbOhCoJCpFjtyTr4e0RNyKp4w7MBFgB/8MEmaXC1JcYS0oca
	m58CWpBe/N1/OoTmzw2G8Bcn2jzDAxonpM56OZKjMyvEBqTsFaUoTHCvlkU6yj2G/wO6zQhv9UG
	cqLBUj+K1Yto+OKrs+B9PpTjLbuphXFs=
X-Gm-Gg: AZuq6aJpN3aIZRg/I2NBGCaT+qoLull5gw6CyHZKInps1KK++ve1JWkUdRZ+GDOGgDm
	8HziW+v+UlM4qzeh07wqnaEeTTOxEpOPCvZrmrv5dBEOTgRL5pb7PL7UwPGFt93I0mRLe+CFiSu
	OpIPStigqYCn2YzAafJJZxIRnhVq10x4OwgJIPKIHeZgciktIRcumthUp0jitH45V0+l+sBvvsA
	m29UfWe/INI7ESJL98dhAwTw5lL/DIz9Up/KBHOE+Q5FmA/xvCtz9Vlb8B57MeEMe9aOJ1rszEy
	TySuz+5xdqXzKzXR+eATJsm7uBHHx77KbO1j2W8dYjyH5ECvfhBxilFDJA5sK3jfPBC655yhCKw
	3d2eB4DxvAueVpscuO24wGkMEfYguauCvoK8=
X-Received: by 2002:a05:693c:25c7:b0:2b7:f145:a70 with SMTP id
 5a478bee46e88-2bd7b9ed182mr1491522eec.1.1771787489452; Sun, 22 Feb 2026
 11:11:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com> <aZtT4MH0Q8Ic9ZiM@luna>
In-Reply-To: <aZtT4MH0Q8Ic9ZiM@luna>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Feb 2026 20:11:17 +0100
X-Gm-Features: AaiRm53bLm8BaSMJ6yUOF3BzlMMZn0BBot3u7XXipnBmPLeFtS2Lh6iTAtxhJHc
Message-ID: <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Alice Ryhl <aliceryhl@google.com>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2026 at 8:07=E2=80=AFPM Link Mauve <linkmauve@linkmauve.fr>=
 wrote:
>
> Should we come back to describing the target like I did in my first
> patch[1] in scripts/generate_rust_target.rs, or should I bring that to
> Rust to create a powerpc-unknown-unknown-softfloat target upstream?  Or
> is there a better third solution I=E2=80=99m not thinking of?

We are trying to stop using the custom target specs, so we should ask
upstream to give you a built-in target you can use (or equivalently, a
flag to do what you need, but I think the idea is to not have such a
flag).

i.e. even if you used the custom target JSON, we would still need to
ask, since the goal is to remove that script entirely.

Thanks!

Cheers,
Miguel
