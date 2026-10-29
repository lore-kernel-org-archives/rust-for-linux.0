Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793308789;
	b=2FDA9V0KaFBBnEcDmYwZZ7dCYAT8QwgSYZ762jmT1xwLAE3kkTMiWzgoeBbsaUVKm2gD
	 GI8Mm++sbFMaPMZJGTCfBlrWuw7Vs4LejLUK5J3NXtzPy6rnT1kzuf7N/gcBUoVAymksv
	 1CAsskcsyUFxiZ7Jy4JMYJMVmLC8MyYb0eLk/1W9PnGefEshJ71x6Q/8pme0BHPSEymXC
	 BNyOwhuCLlLO/CqLFsLcWTjn/jVqPmKn5dDzho9Xx/Shu0fjE1ulU9mJBnvFetOrPuViq
	 9AlhEARK6OD7JVvgQcVaabDJaDpUKqJIsggGhChDMVdHoPgPSLzGv20TKaGpKlqhxcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dt+qDvsPcGiURlO71a3bjPghgUDjKVDdBI5z58Ghskc=;
	b=CpinsqscE4EWaMrimpBhX/54vdF/ADlE8QoZIC4Irjpg4rhqTfUofLllg35EshYV0Ksk
	 Ccfp3/6ZXFDcut2BiyqiOG0TUFOPifDZFyoMSNoKuo9uBC4jDqkc7GlqzT5ileA83qdZ7
	 1sQWDuqvSRWe5KTKuRfbZCXYtoJTImTfQVw00sD5421v97yUqbzDNNlehAa0rxZ16KYAB
	 fCM5mtlac7l9we6V3rZ5PG9WZ4eVv+k3dULEFYs0/RysxsADfuCSX4U82MOE41c7bdPML
	 INu9XqdXMaenTqY/FnUN2TP8VUInkoVS2BK5anifzIfqOnkQsGxCTiUcQBPVLvs6mtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTGL1tK+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB5E606A31D
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB5E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTGL1tK+
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-313bab9cfe7so23302eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 14:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793308789; cv=none;
        d=google.com; s=arc-20260327;
        b=MggaFh5Cxh6oRH3ulqOAspSzV3s+cXct7WNj774gNTbx0ltaaa8nMVwHMVwu1sOWk8
         f2/nmmS6vZjA0SiJA+81tMuGrpB0Q8rF3Eltq7+8Vjy/iJw8XtGHXUqwzXqePB+0FaPB
         VpAMbW2dIofe3Gzs8pw8bTeH8lkMekakvv39gbbYSNh/yWRP3mHFGNPsbDcExDKrd7HO
         2qRTQyxIqrVPz0amNU3kcMOY4COcEmEIjH9gona6pCHDycND9cWw9ldH6yamjQS722SR
         +rU4OwjGgV0YVp+Bs3TeEdOMH13mQbb/VYVrjYxzhgC/ZP84zrX5nV+BOgeKe/1gFJCX
         Zazg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dt+qDvsPcGiURlO71a3bjPghgUDjKVDdBI5z58Ghskc=;
        fh=zrfx13NNUQ7DD6XY8OQEEXczMhkhZLDdHM013UoJdR0=;
        b=MjIp7oCS1kca0BPRvDm1cozYxo9TTY1fLtxqvjB/nnmFr3cAj+Hlxm1m+tlcrhBWKE
         IPtJFMcqvQMTNcR389AClvPTLkciv8p5eCzXLr+R+pjBUz2ECqnov+HBDlMVNXozEDMl
         oe3rDrmeWRBN34tgfGyedxpCg4X3JLve+3vs2XrPeFp68JQiB8xU9s6KbQ8lHGafD/ls
         +S3EbXuklfpy8x2I1OYdez8/zB7Wi9oBMT5o77/cCZKFna9vDv0fA8XFIQijnTjTCole
         UDQUW20ZgYalN6SLcX+CxvBhXRCWkP5Y7SHAeHBbDDOgsE6mH50sVinsesg69BVdoyu9
         OSTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793308789; x=1793913589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dt+qDvsPcGiURlO71a3bjPghgUDjKVDdBI5z58Ghskc=;
        b=kTGL1tK+KJnI7KIA8BnwxMf4OfFvYxPX9ZtHUfXvMTlZt3Qts8co1ch83CywQfOjYB
         KrVeogKaTCnhYJCxyij5wDlm5fgUYPO7D8GTYYBlclw+C+7VPw+fEwSZbQyrwvV5g3ER
         /l7c0jb5xibmESolxbcRzlVfGr/ajNQTbMCzzK15se5LFtC6+CqQdXLpfqILFm0VErL+
         RvScVd2pwZ1VmPGXnCm7xIzTTMNY6YHrSZ55kCqE/rdklHdT+wsxNvxbvfDT8Tw1SOYT
         YCrgj1Z417I7lL3mO2UOEnTsQdP1oCtW95G7GSF5VlJVvr7Kc9TVKEYDO0wfraQYfSVh
         A2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308789; x=1793913589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dt+qDvsPcGiURlO71a3bjPghgUDjKVDdBI5z58Ghskc=;
        b=nvyjDX3Mn9RBWt4aOfqUI9GJZGc2CNSfeEQZ5i7FXu5fjDPspITahagPzfZr8mX8+x
         XV30A2l+H8o9xudmu3B1xwlnrKRN2NcI70WgvMRgvoShsEuyk568bVLromv5gzWECjBP
         bqK4ogqG1u8qRIJEg6XZRJx3sUCIXIwPz/PJQUGiaIJvuZ0JFPi3O8C4q7i2VV/b/VxC
         db9+LS0qykG4OqbgLKdfRkdiFOi1XSndzfP3PgvylKDow6tA4Y1DUyGJ+dXUaAk2YIKk
         18rKpBO+1dKNbqmJ5ZDk8ibDPJdjQbjKqwNchAChojOLwPumF5WnSsw2tB1yOWXqxmPI
         aOVA==
X-Forwarded-Encrypted: i=1; AKwUvBwngRXxBYDK7IBqE0kTCpWXEh8jCPd266wB1ptN449hIeLAhGUOtNlBohEmx/CaAogEqqKy+9eTcmpSm8M3qg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJrdnr4zVdMtPiuWbCab2fs1LfP+RHV9PPWQ8ZWJHPeLXh+nPIq
	a2PlCeywjtyMDLJ1LiMBhCpE0ED4aSrx6Evn2L2iedbAGcmFd9xs9BoYT67TYIjht118eAjnEJY
	xc5HR2keE6JEMQFdxDYIay2i+W7HhM4E=
X-Gm-Gg: AYBFou1cbYpPyKzehAnxGkdtC2nMBmQog/vrmPTI7h8p+ZuBELDvoNA9dOMhnsHex65
	eDOTUI+d/JW4CLKyeIk7Otac3G0ssXBfRa5EevBs7ApgHChGUyfzNf7Sb5d0N8m73ZQjZsnRQGX
	DkKdrAbVI13L4Se928XhYF+o4jt3u2/80z3yiFyvaDXn7xVFqQVfTMn8Ott5ATr3xEy5E4TNyge
	WlAmnJQGswz0fFFnV5vEztXvMa+8sut1Sq9ARiUALn7Yge7CzH+PZfnqkH6R3Fzz/YLVqYLQMOA
	+6TZhvcHzCvVe2J+SfMQifndO4v9ka/nn0xMRJjPlIGJKXQCPuYD8r609caZ3aIZP4EUMegu3UB
	HIFunFdo4cRwCyqCoysNcbkM8MOu5bWUlxxvM+iMrHNVbkkf4AFob82ctMJzaK79Y7L6qlCaLPE
	aKyYKBDcWDf0v8cgNVdxWfzkYIFO7w5MrD6F+HfdYBbHyktTAa1OAjO9MOyUAjyOBUZju1fwXrt
	xND7na90fkoTlwAYlbfCDoNPc2Y/Y4qU9rwj2qJygJLR63JUtMTM4AoEQ==
X-Received: by 2002:a05:7301:144b:b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-36a4220aab3mr1098784eec.1.1793308788464; Thu, 29 Oct 2026
 14:19:48 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029180116.49074-1-ojeda@kernel.org> <CAHk-=wjt_ahzkGAwnExc85O5RArzFiAV-SiFzY8eP7RCXqWM1w@mail.gmail.com>
 <CANiq72k2+GeKSdE_pirNLzdkEXUtwO_sDzZZkeMkMuQzneqK3Q@mail.gmail.com>
In-Reply-To: <CANiq72k2+GeKSdE_pirNLzdkEXUtwO_sDzZZkeMkMuQzneqK3Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 29 Oct 2026 22:19:34 +0100
X-Gm-Features: AclHuK-B-93CiIohKRmpO_iS2eYQ2ZAiZiPmguGZSCGx1kUGVAYo9n2-Lyvh4P0
Message-ID: <CANiq72nneQ_EyREu=VxdSowS6NAMJaOtwJvza_STj9JFi=4U_Q@mail.gmail.com>
Subject: Re: [GIT PULL] Rust fixes for 7.4
To: Linus Torvalds <torvalds@linux-foundation.org>, 
	=?UTF-8?Q?Emilio_Cobos_=C3=81lvarez?= <emilio@crisal.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:16=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Emilio (the maintainer, Cc'd) is open to improvements and helps us
> when possible / within his bandwidth, so we will see.

And by this I don't mean that Emilio has to do it, of course, i.e. I
just meant to land it.

Cheers,
Miguel
