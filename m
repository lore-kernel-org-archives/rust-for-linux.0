Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03F6389DE8
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862371; cv=none; b=uqp+fNTKMeeh1BQyf23rIUH8+KSZrPPA13uRFmpF/IvJ8gEBar8M07dDJ3dWuBp/t6Ebk4kL7ZK2m26w1m6YdGLrYlipzJoX29bN1U6czIXeRnDG6T6tkFnWgI8s8X3seag5tq9Mku0WEwjlaG4MTcW0begsTwBXrBtd3k/6RQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862371; c=relaxed/simple;
	bh=wzHdjoJpM5FWOQNw952qUlKiXY8OYpG47P6WAmX81RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISV8R8f+mojIl0c2tYExtRv+iBhLS6ctqsddlbyxJsE0Ddo17rbi7nG+5wmdKViz3hEh3rsahjlXNWIxoZSUluTfm5R8DQMU1Uxfx5tf1UFss/rCBYBnkzEdxMDuZeQ+jVjjyAJceLK/+gst7hI/6QZdIMMslkxiHjhXq3PW/Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJTCUMNQ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJTCUMNQ"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82c28f0a4ecso3033722b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Mar 2026 02:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774862370; x=1775467170; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xGALccOgtUVKb8ynYPgQbEzvhqor5CbjYx+rsGEXTzQ=;
        b=bJTCUMNQa7S/ZMmwgNjcvl5Opg8oScJwAwJ2zFB4FC97uDGw4ajQZ6L/RGZAOH9wLX
         KR4Babza65J2QCxJlxS+z1pYAEPiN+L1SsayEaUIPi/UTnooSRX1rZQVB0+Ibe8fMU2S
         SQPqFvWA/enOtXgOx1C5489ciNDTGRPHW2CAsv8ghm5o/+00wtzzYYPK5Z049DZP+0BQ
         Xo/N02IlAlrVhQ8daoV+r1peNbKprSjGYxS2Dfxkus7r0EE5/iMVwzRjA3a7Q9U82esS
         TdaHQ3piUe9VEz08oZIRLjWTsuVUiURVnoAeC00vaL9on1PYze/gnK+ktl6incsiampZ
         SlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862370; x=1775467170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xGALccOgtUVKb8ynYPgQbEzvhqor5CbjYx+rsGEXTzQ=;
        b=ckR/S+LmWr7ce7mwjgul78GqawVMa7dCvQ2+0QbzOM3cYNLVsrml3oMEWH30owC8GV
         kVAGWUW3ZZwDmTkaxZSM9+S4kyqNwFhlK1bkRggtDWxtpRnMdPoVh8W60r2OF87H/6m3
         Pnxo2kY2ERTbiXCUlMM0rQLD0GEkgmpdwFYTcmCrZTxBe9BN1FTyHwkTigjrCZFGvfeL
         5y0wUksFb4fi6neM/wog3TrxDmBdP7clY7AvZnMDWX+3vrWN+4SVY/O52IzuYVm8DPEx
         I1p5frzhGFb9fgy8mG9HY5//5VCw4tr5iDBwa+yg2DIPM1BKgcOMh+SQ3w+7K59G+qfB
         PTBA==
X-Forwarded-Encrypted: i=1; AJvYcCVjjwfG7wQdc9wIji6uYmNZLOcNpndGpRP+/bz9cL0as4syhGh9obKPGLydLCQZ4HoRiC5v+VFaPG1g7q4VMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLFQYisDtlpACWy2gVojCtoxoEJKrzlJ9SNyN3C+QJ3uYiaGSP
	vnOHkLW0uBkMoFhglPLHn3ei2wRSt4ORcViOYSlEZcUfG0Q8tdiu47CE
X-Gm-Gg: ATEYQzzRHSSWkWGZj9AyZQWHGEjjFDiaiCj7BKBqULVkqqh3V04HSwkg+tkBgu7oSbg
	0qVIQqJeadH1xrf0P3vsi3t/6UcRaj4Xf6hkMu/tKUcSiUDhS5RNhMutAGAGoJVrTwdRLaJi6np
	R7xsORgbpOkLoV37P4uQzMj5rDZU4/3cTf+SMcEHuWR9kM+2GZgq3+2c/MOC+Uwk3C85GIrfnbO
	+Nzsm5xnHvPgPPtwOAwW3AoFP+HmZigDlvehM9yCqPsoDulIR5mxV9P+GeCsgp0BJYBqs5NTrLT
	iOPR521P+wo7wi2pS5ZCEFM/bOGHaEkFI3HI7Xp6UhO4RNTU0BtzfDwtqQCsmB9U2sTPQI2eduX
	PUuWtLa0TCs4jDPVFJ2h6jPvpmM6w30uTf+vPGA6KA6xPOmh/Kt2VpmuNwIiPAK7gJG4SrgrDms
	E9E5gzFa+RA+CP/mkvIi9gwbFrE6U6dKfkvQEJDrZ8+iLLATuoJRAQqYuvyzm6t5uHcqM=
X-Received: by 2002:a05:6a00:6ca8:b0:82c:6ba6:607f with SMTP id d2e1a72fcca58-82c96026331mr11486694b3a.53.1774862369945;
        Mon, 30 Mar 2026 02:19:29 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82caf97abfesm5625780b3a.1.2026.03.30.02.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:19:29 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:49:19 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH V7 1/4] rust: Fix a race condition in Makefile
Message-ID: <aco-FbkAGGXDM946@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260329160254.2592207-1-mkchauras@gmail.com>
 <20260329160254.2592207-2-mkchauras@gmail.com>
 <CANiq72nxgwPUv1AJhRQSFNWtV+w_a-VqK3VWtjaKncRJkNNETw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nxgwPUv1AJhRQSFNWtV+w_a-VqK3VWtjaKncRJkNNETw@mail.gmail.com>

On Sun, Mar 29, 2026 at 07:25:19PM +0200, Miguel Ojeda wrote:
> On Sun, Mar 29, 2026 at 6:03 PM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > When compiling with -j1 flag in powerpc, the libproc_macro finds the
> > libcore.rmeta both in toolchain and local rust directory. libproc_macro
> > should use the toolchain provided libcore.rmeta.
> 
> By toolchain, do you mean the sysroot one or something else?
> 
Hey Miguel,

yeah the sysroot one.
> We should make it such that `rustc` does not try to use them to begin
> with, e.g. we added `--sysroot=/dev/null` to prevent that in the past,
> please see:
> 
>   71479eee9da8 ("rust: Suppress searching builtin sysroot")
> 
> In other words, we should try to avoid adding dependencies (even if
> order-only) to workaround the issue, but instead we should get rid of
> the root issue.
> 
> Otherwise, after a build, if we rebuild only one of them, wouldn't it
> find again both? i.e. this is not really a "race condition".
> 
Yeah this makes sense.

> From the original message, I see this was happening when building the
> host libraries, because the targets happen to match, i.e. you are
> doing a native build on powerpc, right?
Yes we are doing a native powerpc build.
> 
> Perhaps we could put the host `.rmeta`s separately, or something like that.
I didn't understand this part, `.rmeta` for host are kept in sysroot
path, are we trying to change the sysroot directory?

Regards,
Mukesh
>
> Thanks!
> 
> Cheers,
> Miguel
