Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AC22FA0DD
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 21:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464720; cv=pass; b=L1sE/YhkpK4Z4fdvPv/wZ3wVRyrTR5UwQWCASa/bpZzMnsMrUh2J7lFIucBuxoXPxs5O13VFJ8lXY+F+GHkQ6R78/sZyrZXEM0Tnhi13POMD+0fl4akhSORMWCqd7QrdsX9047yJpGRILvE+ffqx00Z4nd+K4v2sP494KoEkyrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464720; c=relaxed/simple;
	bh=OgZZYPJNUqsBKrLMQHY/AFEIWgBtulsGVYqrQth1ClE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oe7bSaicZIQ+Aml6zulwjNqSawH8xNPfO9pTVcGLhRB4K93jsb7UdwOmV/KuQxPnbdFAS+xSTbkkBp9V2zShPPJTo9X1Vx5YBWJpdlFEYUuVCmp2maS20bFopkla4IGoj0yo7oGivuj6zFlOkPUdPMJNDyn7dIhafXdaEtHmZ7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=otxH/UMT; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="otxH/UMT"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so52132005e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 13:58:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769464717; cv=none;
        d=google.com; s=arc-20240605;
        b=IV6WFRTkJLEUYB83ULKRax3X1glIS59qttq1X184LLedi1woQHIkOiNvbp12afzqwh
         XWIdWQjqWrqc3SoSlXRVdWWQt5EsdanSgAId6Sn7/FDMYWi3hLziW8EBdUam5M2mowvW
         VmKD8h72n3MaIAehnDBHJOXl4qt5DdP+1F6ZXiYqQDBeOioMsH6wFP471sDaLDy9QCtU
         JkSyobRmkIWYPehaRrhQTekZrUkVVW1jPwyKjZdR6I0c6A6U3eoYgVtVAwzPKSN6ZgSn
         qtq31L6afT1t75ZFVftqEBs61mY6eKHws7+vd98defTXJlck2bkX9ddU2K3sGGW0lYCn
         74eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OgZZYPJNUqsBKrLMQHY/AFEIWgBtulsGVYqrQth1ClE=;
        fh=kj95OVBhBffKmF1JymXVaHUPM945QF+UOjlFN7IetkA=;
        b=PoeLBkWEnF7Pb5TxIZSKN7xbjXQbn+ZWYsyVVotQOoGoXz7G0SJugMCDdjmca8bY2Y
         LCji4lvFirJCbxrX7twiKEmD5jVfSFfyN/gO65JS6XUg6VzLYdcQCbaw38Gp303McMsw
         Q+R1pSH+SnoeZJp4z8Z98KS6vgYYkjWNbpl06FxTiNvZxiP62IlVLnT6pzWOafdm/FRu
         /OXXzN05uqFV6SVQzMcn42egrRGck28VjidED2HpPd33wlR6F3pgbypi8LuOXo1tmzeX
         xAUdl7D0WcBm6qz4OU4gphMx8FeL/k9/KFJfecMLc8UzKPvj52LRU8Y9PXqwLhe3UfZ/
         VUmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769464717; x=1770069517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgZZYPJNUqsBKrLMQHY/AFEIWgBtulsGVYqrQth1ClE=;
        b=otxH/UMT30aGfMwZYtOcUxLxdxipfP3nwdGqZi9KhhumVUDXdWN9dSfAOnvdno04sl
         wVdw0gWmhkUKXI6/UO6jm/NPAQ67XYgID/gxTvFjVfjpsNdZ3AbuwXQaqxzjpnUo/2ZA
         nGqPIECU6BpL64SL0WE10FfANbF8+SRbTJIc1p5pSTjisvMSFyin562J9QRsqV1l4Zuw
         s4D8NTHIXL47BE1DYwbVWRnvkA7clLBGAWHW+nsVUxzxI3b1Cm5DKU9OePtV/PiZrptH
         O2GkiV+NkLLsiMvUaWNu7jGlpvzhOhZuel2a/nGzAU9L5R3om/0d7HQPnZoB73mGtnCr
         QWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769464717; x=1770069517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OgZZYPJNUqsBKrLMQHY/AFEIWgBtulsGVYqrQth1ClE=;
        b=DCcm8mKZfWPrZHlRDbOido6YyaCmrfQUm8g4zzVLnxhgP0E5d62IdXxCMlV3G8dKgj
         ZOAyQHZJl848MfiUbUk0nO47vCHvRHLjjty3y2622l2T42gHeCp74s03vvU6B2hc3I2U
         LPpPNuqtwHAjN93+qKomDL6lyNOzBVo5HpBzCJnEXjvD2JUtCKlRxQbfDfRNMMzMBlst
         xo6ONGz7xGPUKwahv9oNh/kmywjrgYj9EFticxAa4buwp821Tvq5caS633zJFimOBeCt
         3It3ctlWiyiagkQg2qWKDN+kcdaZlQVZGb0G1mxNm0h6BtDyHmQsj42lRxcf9Lybav0l
         AsBw==
X-Forwarded-Encrypted: i=1; AJvYcCUJMdGzUJf6NbzuyT6QYewp4sjjA0FK+URR0x02VCMVdo3btlxE8kjyFPKSirAkIX+5GmFpLJ2SpIA0hS/5rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuhVRFzmm+mEii1LvDnvi5Mf0cO/RB5rAShG/+t2l+vTtHXZv4
	5beaCnQDhVKrxK6jAWitCrsFipG8N2NRm4iQ4vZRz5lwUOeSEsvgygCBjBYy6vTSeh0H6v7O7yj
	ObxaF5rsP00ojdmtsEOigMlD6w4TQvQ+YbKYeaPAG
X-Gm-Gg: AZuq6aJwlvejF3/WCYpDefzd12DVoq7S5SHXXpcRt8RE0Gumu02csOY2mf5g0fEXASB
	if57hK+bmeUvKX3FUdNH7LVO/HmlKvBC0IOYiHec3dZJ5EY5BCIvoWjZj4duhr/lK4jcr6xNarO
	lWpujIXPO4GgJb7mONcq7Pe2vMX/gmTKrHWpacw3Qo925L3b+ZIe89rLfLW6hg0kkBMmK6lkbnA
	smoO6dENWpX9zz1O6Dz+YcRHI55PDaT+eeyVPSmP2zBIPEJnMwOH3DKvP0thfw2ymitkc8QBg1r
	gIjj1nGgVf1rgfiPeUNIdhTbVw==
X-Received: by 2002:a05:6000:2905:b0:435:9223:bfda with SMTP id
 ffacd0b85a97d-435ca147759mr8332178f8f.21.1769464716802; Mon, 26 Jan 2026
 13:58:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-jump-label-rust-maintainers-v1-1-702b03482f2e@google.com>
 <CANiq72nV0Z_UjdAwT=41TjjfmKnT6WL4hVNcxg_QCe7TAEYK_Q@mail.gmail.com>
 <20260112100006.7db6d31d@gandalf.local.home> <aWUO59edshSRit-Y@google.com>
 <20260112115408.48ed4d35@gandalf.local.home> <aXddnjiHCX-XS5S9@google.com> <20260126213748.GR171111@noisy.programming.kicks-ass.net>
In-Reply-To: <20260126213748.GR171111@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 26 Jan 2026 22:58:24 +0100
X-Gm-Features: AZwV_QihZvcwiBl1p-Lov7buKmEkVHfq8VKsqtX0qbF8wCZDMWiYhzhA-vv8XL0
Message-ID: <CAH5fLggpBodWYv2EQy5sgg5eSp9=7PM9ZqXcKaTuozNKN1eGGg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Rust files to STATIC BRANCH/CALL and TRACING
To: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 10:37=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Mon, Jan 26, 2026 at 12:27:10PM +0000, Alice Ryhl wrote:
> > On Mon, Jan 12, 2026 at 11:54:08AM -0500, Steven Rostedt wrote:
> > > On Mon, 12 Jan 2026 15:10:31 +0000
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >
> > > > > And have the M of the other sections be R here?
> > > >
> > > > Sure, we can do that.
> > > >
> > > > Are you still willing to pick up the patches? I think that is simpl=
er in
> > > > case there are any series that touch both the C and Rust parts. (Su=
ch as
> > > > the initial tracepoint series did.)
> > >
> > > Yes. So I guess you can still add me with a 'M:'. But I wanted a sepa=
rate
> > > section so that all the Rust expertise is still included.
> >
> > What about the STATIC BRANCH/CALL subsystem? Should I also leave you or
> > someone else as 'M:' there? It's unclear to me who usually picks up
> > patches for STATIC BRANCH/CALL when they are not a dependency to a patc=
h
> > for somewhere else.
>
> I think that'd be me -- I typically do the static branch/call bits.

Ah, thanks for the clarification.

Are you ok with using the approach Steven suggested for STATIC
BRANCH/CALL subsystem too? That is, add a [RUST] entry below the
current one, list you and me as M:, and anyone else in the main entry
as R:, and patches land through the same tree as where they would have
landed if they were a C patch.

I'm open to whichever setup you prefer, but I think it'd be nice to
get these files into MAINTAINERS somewhere.

Alice
