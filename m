Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF022874F1
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769502413; cv=pass; b=jvpAb0nHSpDE7J8OvD/V/WyW0d2jXpG6Wl2Ncibf23EKM/nEgEg27fG+/nWO9c7CXV2jc1rBi9jWkhxgDvfQ9k30JF7lEyVMbvQMwvMTnEHlpEmHulzA4mL1h3t4Sio0IXxXguEsLoH/r2zhChZC+vU8Bao17VXERrR7rbv9+I8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769502413; c=relaxed/simple;
	bh=Sl4m3dvsEO0VkRuYOaBX3ctrGwJsczeT19nXFnORUlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kuf+EQ79jmfBEHFE7a8FgQcKs5/lP8xiiYm2YkFoiiGh36klRFnEc4m33ayU3KY0edEC9LQ7lzcPUcLJ14zt1EaeFZJtIPs1FcdBQw+dEfCtN37Nqpz4yWg8gyQcri5qae8LjmnJnB1fwCan1ItluYYU+W9yEV3TGEqV07YMb0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GVuwfh5r; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GVuwfh5r"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so45536595e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 00:26:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769502410; cv=none;
        d=google.com; s=arc-20240605;
        b=gcxOwagQ6ECUdJKknRI0rUfemrnNqPCvW6IYMTLeFn/DLE7AcjEE9FJ/RGTs2opO4c
         4Znjc5FeEVBHaF90lUJ50vSMMOU19DOBTeNm3NAt93iAdRDx5zrdLsxk629KXVNqhS+C
         cvheTDtGjfCwl2JPeN86JN7SDCJdYYO0c8XYyijq/9LR2FUXSdcFhTww28LU+4m29Hn7
         hftG0hRnk99kf0MuaVgQxnTqom+ZNXS1J19V9m9F4rlBLfPtWLpUfR5X6oCybXOdS2ho
         P8z0bs1IdTg9XBQOclZATzYGXABJPKMlyol7l/5OBXiSZcqGbuDJ57J+zWrOV1P+zT6F
         VVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sl4m3dvsEO0VkRuYOaBX3ctrGwJsczeT19nXFnORUlQ=;
        fh=dRxaaOFxefvhoa3NrZkx6abGkPRdRLR3aAwqUANoqzE=;
        b=Jk8zFbn1iY0THwj5xIhUgtSSkZHDSZXN2Fv+Hc/MotlcAGxhP2R41FQPda0e99Dywd
         vdwGReIA8PTGkM0ZZ6/MinTQQ/6stzIzzp90r+n1h/ane9N5FdC/k34KRO4tQA1VvRA+
         BwQCQ3ZUWTq+7NM1Qhr5A6dClX+ha0Ck81nS7wxef5zRUhyyvY+nOYlEeOy+C8Mgqsvq
         3yhZUGQ4raAql42p/7s/Pv1Ts3mdLynyhonUhxo7ISRYzh60s0ooJTU25zQDKWSEf8uo
         Ez61L99KsKjk/cy7XA1RFzq3osq5sskcBJwwDMxqZNfQ3zWqPXDvs5pBG6sfUDPqkUog
         5B9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769502410; x=1770107210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl4m3dvsEO0VkRuYOaBX3ctrGwJsczeT19nXFnORUlQ=;
        b=GVuwfh5rWga+r5e5wK/1qktVK+ue7X8olp1Ttsoz26VeLWpoO30ciFco/ODArl30Or
         /oyhAXKbwvCJbg3hsfCuoKclaF6URIW9qbytzI2avZTRPt0Ycb3TmfRCybNzAvfd5Bjx
         udVyigaJ3QgG/fGLgz3yv9NhioFkNB8gNRgqVXv++GSHUYBxqcM6tygQanC6ywEe31zo
         eTV49ytpH+hRytMYCnxgGURH1JkNKHJQNHi87AnGTiAvrnjn5AzUwKA5vCvYNTlvREWE
         9saBApihjYg5bMBq7ji18Z7zhYmcub4GuaAuqghW9YCIp//Qw7DjSWW7kJdVKm99153Q
         O8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769502410; x=1770107210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sl4m3dvsEO0VkRuYOaBX3ctrGwJsczeT19nXFnORUlQ=;
        b=WGxjeZMoQc3g+YU3WQprudau7ws1I1kyhzLCsI5CbsXDyho8DVUByvs2jmUDEmv6+J
         yFEfB/3C83pjPtiRFtJOs3JOW5O4nLSR0QMXb1h3z0zCuJ++gtX9jZQkaz9hfNDSP7fS
         pSM+LJGR+hcWs3fnULe/04Swoz3DudkEMFey/9RkHdLDDLgl6LWkR/PiRXTbh9k04Gko
         b7Ajh5W3rOn8bjISEXtgZeUzJ4jKOtvPB+ZXt1EPA9uoeA6/BHxxuIsp2giomCHe0Lwc
         WyWpe11yuLQvT0pSLMBTYsHlZ3I6ugRi7ybqHXGeyTTSSoPUeM/jHSAayMi8GoOglW1z
         CBUA==
X-Forwarded-Encrypted: i=1; AJvYcCXKzKpDiIfQU9X6DAYYHRC426D5JI8HY16U35xlp7zCBggWhEugUqvsqqo5hzrLoP/oa3QNazA2qq/TCIvTbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF8lU5jAfGEL9fY0DiZwCJMT0tpc/VAbk6IUQ9VVFqn0cV44ZL
	EtN8ueoAMS26l9vdeicIHgyJz+qLCskEcAq0Q5bj9gAuFqhjpbLJU2UumAoHrZtfWTRTEZaqQmI
	YkUocCx3fT49fZT9Cm7h/0v4ARQTk8H4s38lPXxTpr4X3cRUkR5yhLXVZ
X-Gm-Gg: AZuq6aJQ4Mlxi01hv9u0yz1usWw0ToSAV6inmdWyCszuD0/+vqRkh9yfINEljiJLixT
	9BwOd3GCprFEmFDqmUYkfZUD2bbGb/Bmf4sKXluHIcDYzQvUcwDEQEmUqmDOHTnVvyJxCjf8xXJ
	Xu9iDjN4GsmebbnFdhxA2OlMJnCIazrb9kRaW+6+J0IQXEy5rgqjx4e2pDXHATRcnc4J/y4lC6U
	INxjVfjVUhVIqJrSDWhxIlVLIGw688YGVAm/Bsk34dDdmKPGAtlXQaz2XcBQ7qmYh7TCWFTvoW6
	7b3HPJajmkXEej3quPw1DbS57/t2/MqFj2234sgOpfuyGmhDXvVqWOSQPg==
X-Received: by 2002:a05:600c:4e4f:b0:477:a71c:d200 with SMTP id
 5b1f17b1804b1-48069e70621mr10255735e9.11.1769502410131; Tue, 27 Jan 2026
 00:26:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-jump-label-rust-maintainers-v1-1-702b03482f2e@google.com>
 <CANiq72nV0Z_UjdAwT=41TjjfmKnT6WL4hVNcxg_QCe7TAEYK_Q@mail.gmail.com>
 <20260112100006.7db6d31d@gandalf.local.home> <aWUO59edshSRit-Y@google.com>
 <20260112115408.48ed4d35@gandalf.local.home> <aXddnjiHCX-XS5S9@google.com>
 <20260126213748.GR171111@noisy.programming.kicks-ass.net> <CAH5fLggpBodWYv2EQy5sgg5eSp9=7PM9ZqXcKaTuozNKN1eGGg@mail.gmail.com>
 <20260127082401.GS171111@noisy.programming.kicks-ass.net>
In-Reply-To: <20260127082401.GS171111@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 27 Jan 2026 09:26:38 +0100
X-Gm-Features: AZwV_QgANvHt6Lqy5OOiiQfMqFktPFZ9UjT4gMNqlsOKZAwYLRP9FTi1Hmw-t5o
Message-ID: <CAH5fLgiA3Cat1g69O04mnd08bwzxnVKjgV8mABTRoK2G87S4Tg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Rust files to STATIC BRANCH/CALL and TRACING
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 9:24=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Jan 26, 2026 at 10:58:24PM +0100, Alice Ryhl wrote:
>
> > > > What about the STATIC BRANCH/CALL subsystem? Should I also leave yo=
u or
> > > > someone else as 'M:' there? It's unclear to me who usually picks up
> > > > patches for STATIC BRANCH/CALL when they are not a dependency to a =
patch
> > > > for somewhere else.
> > >
> > > I think that'd be me -- I typically do the static branch/call bits.
> >
> > Ah, thanks for the clarification.
> >
> > Are you ok with using the approach Steven suggested for STATIC
> > BRANCH/CALL subsystem too? That is, add a [RUST] entry below the
> > current one, list you and me as M:, and anyone else in the main entry
> > as R:, and patches land through the same tree as where they would have
> > landed if they were a C patch.
> >
> > I'm open to whichever setup you prefer, but I think it'd be nice to
> > get these files into MAINTAINERS somewhere.
>
> Yeah, I suppose that'll work. That [RUST] entry seems to be the
> predominant style in MAINTAINERS.
>
> My only concern is that most of the [RUST] entries don't actually
> include the F entries for the !rust part, which means that if the C bits
> change the Rust people aren't notified.
>
> So I would suggest having all F duplicated from the main entry and then
> add the rust files. Or, like we did with ATOMIC, just add you as M to
> the main entry, along with a few rust files.

Ok, that makes sense to me as well. Let's do that. Sending v2 now ...

> Some day I might actually learn enough to not see it as line noise :/
>
> See 2387fb2a9b84 ("rust: sync: Add basic atomic operation mapping framewo=
rk")
>
