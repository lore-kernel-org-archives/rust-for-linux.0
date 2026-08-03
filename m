Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BB6B672
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 04:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785733025; cv=pass; b=rVLIrCF+om0EA7nQ3gp/ntv5U3KrWpNbqHGbrZGCQPoxmAjOnlfl/FCOxvwEwsrSt5SkbbzF7erYqCLp0eoMzc7rE8VOk8Q5QaCWuN0HkIM1g0QqtxHJ+Pbt5aLG2F20D7V29McwymYvo70PzYrr2Tw9a63oSonO+tkZ1LT1pDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785733025; c=relaxed/simple;
	bh=7QHHfDiNQ8NR9pBggcuyK2tKVzJPRKkQDi0dZ+akzpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuAruIY3F3fFDsF+3t6SVsHzJGVtc7857wKVKa2f2sF05qaWaQCtMTMTByKo7goGoT2ldCCFOTIaJ96tmrCV0Nzh6yYKYzabHkgsyRE9+5HI+aPdt09MDcjCsk3VMbT8L/FAFhTDA26e3e6Y2f8k9c9uVU+0tlnEZ6yqMuM/Qg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jS6UnRSn; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jS6UnRSn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so3582825ad.2
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Aug 2026 21:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785733023; cv=none;
        d=google.com; s=arc-20260327;
        b=neYCCwEbsZMpTFZ9Pdra+FwQ1xd3GkA3b4DYpjJtcRAx9w9016IGZEWs/VP7dXi9RP
         4aW5zpCYdzpTmOyQuD727gjLdMNM3W5xUXWAT0/U6GhPu8Mbl32Qa63CEva8dbgH2A0P
         ZZh+lhkW+bHoJrFqtysQ6HnQa/vqMFFLjmtb3gmd+gtx4NHF6h7hQAfzOTWNw7FNAudw
         sBJzaYCGLI/ljJMIrzLq5TxXZkvGZdVblPbI7tfrRvPY2y1N6OK/JxBmPOTTkq2S0KFs
         ppKyt3UNWj7Uj9CQ2ODlGxx51YBzihYk36MgoVquHb1whP0pTeghx0Gd3VKZvhdjqIii
         XICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7QHHfDiNQ8NR9pBggcuyK2tKVzJPRKkQDi0dZ+akzpg=;
        fh=I3FYhXdMXIzP0JFpnmRBLdrf2YOxVl2tDSusMqw9+PU=;
        b=hYAcc2QpYpXTBrMaulwoFkW4bL9YEa8yE5K+LZLdQZR1rBNx1ZzJaWLW4rvwMT8viU
         XhWJvpeStI8IRxXfPenThNQSWqUvmTHhoWpDlmyGtSfzAGS9yxG1A+KZ0xBA1weNkebe
         pBdOkMaesnL4yUWO2LyApexXEZpER9Zp6Z6t8phCfO9t8m5U92VbZSk3CkJcA+bxRptN
         NgoazcbBkZmxVvw7pGqyaJ4eJddcfk4yzjXWVBXXqcRRZvSLwXhHbCeCtG27DucgNGRa
         Mc7lK1hO+AGGAm6DI4T4tQjSIirpvZXyEDAR6FhabVJ8EG7yvOY2AlsHZYwfDusEWBFp
         jcwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785733023; x=1786337823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QHHfDiNQ8NR9pBggcuyK2tKVzJPRKkQDi0dZ+akzpg=;
        b=jS6UnRSnJu1vPJoxOaQRTE1utglVsymHR8/BQHUxP6vRDweveI4895dG9pXyApbhKD
         xY7zIfWYWzAVaofPRITwhnGtPm2y3urNg53gneCZy3hbyZApy9S06DvL3A5RGzjcjBVX
         bYBhW2H5Nu1YwOOeGPEEmwkf2cvGXgZh2U1yxwJKZTr9rzjU/WuozPCBSvs78hFThIda
         Uo2TC8IWdncw20v0DPSdk1XelAXbGMJmSIm4QE6uxPzrUbX8Y7OuWQvubf47fh3BfNbz
         qa+P0RmZbwNxzSbZUPQFiFwdf4O4yQolrSwUFAQqtR34lg5pIUlgHqtzMINNVhzgzauG
         7mOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785733023; x=1786337823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QHHfDiNQ8NR9pBggcuyK2tKVzJPRKkQDi0dZ+akzpg=;
        b=hAW4e/SKmvfhB+eyzIWNZI3qn2FXSxNPmM/jkw5o3sfW7YbgZN5vjsTbUt+Nh4Cjrv
         odx9e11vZ8Ee7vixIIOkS7rP4JPYg1XAdoZnSarAsUy5C3uRhEa7g5aCw/S0O8AOxRAL
         yOSq3SG/r61EHxA5r9xCe/vso5ptK1PwNMzpD2oSR+VjDHTJjGNexC4iwB4YjksPAZ0d
         CTrV7W7BE+gqPrBdYRUdJM3TrRwzANidhQwBwob6SJj/tTO52ZpXuYWQEn7fCFMAhPGR
         Fsr7PXUu/1rUVPj7L6xg2XnN/ntkzGkV5c9LrFvlMpz3E74kETcRxdfW4xpiDuyvJgi3
         U4Tg==
X-Forwarded-Encrypted: i=1; AHgh+RrGUW2X7M5o1f1GKm01cCbb/+WfeYqTyc163DvjJcn5yHUcjkqhCOJwnm4Jb+z/h9Dl0JJh0iUB0TwtkLfjtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4CKADMVo+F2VpJthRvAD2pQG70g1GTLZkL6xfX30h9jtsaPLW
	/pQZZTFJ6f3ZKHsEPOM7wHKVk0PWrTxS8+9wGj7/ZefhLfLR10X0LnhKwQa5f6CMl9WR7FSRRpA
	5GIexe4WGRU7hi11siEDaSewCjC3Az91Vcy6g
X-Gm-Gg: AR+sD12TeiTMUGg4BytfS4wo+2Z8TOZMcGny5FHWgw/cZIW0AlpGIj8O73x6XNAAaJ8
	XzdQSZ8VkqE8AZ2sBUkmUJ9zRXainfy2Vq/DmEqTr1d89sI1v59YixV/569hVrGaoDmzm8zse2y
	/VS92uoRhsvcXjV98t6gifSUFfD8FjR4EfUkZVsGEI4bvaHGv2kRFp9DJ0v5bZLOzMzDdnvDb9x
	Ls6ogy9XT1yP9kJ1UEYmsDPqAfLg0/x3G1rX1xR3xo98qEycembOilG0hLzTWhJAvRAFH8RzXdz
	i2a/zLZAIaQlKcorJteyDEUCBOP6btcnDIVayEJIMPLTM7SOPUOLTI8Sw6Oqv4rDVTAQcTiCPww
	enatdsK416w3c0m/F+Sqp7mo9X9c2LosBKdaxOE4CuB7LRoFdI9g6UVhmt6kbpCD2cPSrQQk=
X-Received: by 2002:a17:902:c952:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d0521bca53mr128319585ad.1.1785733023256; Sun, 02 Aug 2026
 21:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-pr-ratelimited-v4-0-435f8d6e9605@google.com>
 <2026073148-cushy-mocha-2ecf@gregkh> <CANiq72ksdfw57QE1+FsMW3uE5p056tTn=xxK1m3fg-ABhHU8cQ@mail.gmail.com>
 <CAH5fLgjZuKGBX7R4O1fat1s__mR2LHhQWD7tWdz6F_FxECFOGw@mail.gmail.com>
In-Reply-To: <CAH5fLgjZuKGBX7R4O1fat1s__mR2LHhQWD7tWdz6F_FxECFOGw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 06:56:50 +0200
X-Gm-Features: AUfX_mwSNiHVG_TmM9oRHND-DBxj-Y0Us6dx1Xwdhd587Ui6jO1yiLpLdqkPmlQ
Message-ID: <CANiq72kuB3dHDcsw0WApcVOrJJs3kS_BWt9ELqm8YmcEz6yeSg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Rate limited printing for Rust
To: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Carlos Llamas <cmllamas@google.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 2:20=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> It's not too long until the next cycle so going via Rust tree is ok with =
me.
>
> I'd appreciate if at least the first three could go together so we
> don't have split it over three release cycles, though.

Ok, Boqun: I think you didn't pick the first two for your tip PR,
shall I or Greg do it then?

Greg: should I pick all this through Rust, i.e. including Binder's, or
leave the Binder ones out, or do you want to pick them all?

Thanks!

Cheers,
Miguel
