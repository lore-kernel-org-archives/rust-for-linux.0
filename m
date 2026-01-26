Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE63382E9
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 12:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769430435; cv=none; b=DFkprDu8bFEIjnlkYgV3iHzsKu90Mm8WQazzL5R29NTORWqouWjlfBVGCCGx8q/82AvS4CbSvSY08ozo3g5UTHgJD6FzgABfFa+qqilJfhWfSAwlNabNJJeO1tPzuk4d57w2+DENoID5DN9pSV7edBG5pHA6hfvKKmfP50Iz4kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769430435; c=relaxed/simple;
	bh=C2Yrsx8BEe/uE1erPa1D6nm5Ea5RI97rb+qpPFJ/eTk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Lhas2KRiZ8AEKNqulXOvj48pIhAomXLdlmseuajzvUbQetDltsh/3gmZLjP5tspmn5PEW5CYLvLrUBv2S+7i+o75E6alVu0zmx8tBndoNcHen55Ne/8WnaFG0YBDt1VHINrw6Gw2W7ZhmKYcQMh6ZuMfCr9h4gyd2bAyUhlGxIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ffQ048Hz; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ffQ048Hz"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-658150fd8f0so4191062a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Jan 2026 04:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769430431; x=1770035231; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNPACF7BHJNyZE5O+HEZnoBtnoLj9ZTeWesT6J0q/nQ=;
        b=ffQ048HzFLM10OSXEJikib2HL9/PDR1q2ft7HXWRguAadcW0Q378Z6fpXcRXSxZebr
         z+N9Z3EDMxxsdEytQonhF0hjoisGdWI5YWgLfLeZchjSGScJ+3Qy5AL40kfgD6QTAhpY
         LHPwk4EvVrkuhvhvWNdfkyJQJfpOaj1aObTwek2BomQaI8ltaH9VNn2D357KOEchiU1U
         voPYarssgurvcNSwpEjaXgVeVzoGdBv5EnHSDvSB0gEW+PWSQraO9qpj4km98el70cOS
         3YqBqgvz8CiN0Lk+KCfdEI7AYYFSp/CNYn/TWPDDCXT/AYmNheW0o8nTOHisWipkpFog
         jvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769430431; x=1770035231;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNPACF7BHJNyZE5O+HEZnoBtnoLj9ZTeWesT6J0q/nQ=;
        b=AsuCoECpGLeHkDsuOYPoe7VG6ww0j1QDoqzBvWF/okQuu+TwKkkDbX7lH9u76WQa60
         /VTN5eM8XjfLx7pQ9Wr15xXMta+x3GEnfo+WfGloBQinRpwsgFFzlIkxQwSudC1/DBrJ
         jzoF6NJ46DNt/Nw5ANzuuDF+2lMT9mONrMzxVyU3Dk5u1mN8Cgb47ei/WgxxyXmaer2v
         7//xqeMNTw2OoNcxZZy3vV1kSaH1Uftj+JBixw06jprZQc24paXfCN1MuHkTHjfKh+Qj
         EqDCl6Q+odlgnLfMVocmVeTD38ycLypKnF060aOQfTbKOZXIBOiaWyWlW0qkLIFjdW3X
         aEYg==
X-Forwarded-Encrypted: i=1; AJvYcCUi05HYUyKjFErEnNUL5GCSqgBXuS0Re40gOxyD1dAX0k5tK5qIfWs7yBDnc+aoXkhK0e1/1LQHXAkieqQ/lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyseI4azNYCUAtvMDWmE3v6n18YHbXBSGNARWTKOvYAGSDz9FRO
	zWCUXtaHMtE/z8r3T2r6oc78jqvqhR/l1ahGkJzTlMd61FqPVWucC0xzMiMMl11/xupFr4Jv27J
	Zz5GKMRR+bJZePcq8YA==
X-Received: from ejbbm2.prod.google.com ([2002:a17:906:c042:b0:b7f:fdb3:8310])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:9f91:b0:b88:38e9:8f7e with SMTP id a640c23a62f3a-b8d2e89cc06mr330057866b.46.1769430431676;
 Mon, 26 Jan 2026 04:27:11 -0800 (PST)
Date: Mon, 26 Jan 2026 12:27:10 +0000
In-Reply-To: <20260112115408.48ed4d35@gandalf.local.home>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260107-jump-label-rust-maintainers-v1-1-702b03482f2e@google.com>
 <CANiq72nV0Z_UjdAwT=41TjjfmKnT6WL4hVNcxg_QCe7TAEYK_Q@mail.gmail.com>
 <20260112100006.7db6d31d@gandalf.local.home> <aWUO59edshSRit-Y@google.com> <20260112115408.48ed4d35@gandalf.local.home>
Message-ID: <aXddnjiHCX-XS5S9@google.com>
Subject: Re: [PATCH] MAINTAINERS: add Rust files to STATIC BRANCH/CALL and TRACING
From: Alice Ryhl <aliceryhl@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jan 12, 2026 at 11:54:08AM -0500, Steven Rostedt wrote:
> On Mon, 12 Jan 2026 15:10:31 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > > And have the M of the other sections be R here?  
> > 
> > Sure, we can do that.
> > 
> > Are you still willing to pick up the patches? I think that is simpler in
> > case there are any series that touch both the C and Rust parts. (Such as
> > the initial tracepoint series did.)
> 
> Yes. So I guess you can still add me with a 'M:'. But I wanted a separate
> section so that all the Rust expertise is still included.

What about the STATIC BRANCH/CALL subsystem? Should I also leave you or
someone else as 'M:' there? It's unclear to me who usually picks up
patches for STATIC BRANCH/CALL when they are not a dependency to a patch
for somewhere else.

Alice
