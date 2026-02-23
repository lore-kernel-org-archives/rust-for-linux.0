Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B5B2EBBA4
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 15:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771860710; cv=pass; b=cKIA7aE9kvzk1O06Z3m1fy1lle7y2dpR5R3Es3aclVZs/7jUFG5blTIanyBP2yqfb+xsJXqqtr0pHaYTP/Ya9ymayoM4HEmvbkK8o8Qh+e3jUxnNDGQByuu5ERAbgOaH/Ov5/zb6aWaDPa4urioUJFPbQZZ4hp6Gx33EPmCRXn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771860710; c=relaxed/simple;
	bh=uilEI5+tBHBNToSheDl6KMRwBNfeK6QgbgEXP/jym0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpV4yifqUFn89AzsMr+pGHcU1QmHMnHWnyD4saAsnBa1RvB1KTuKQ4dp8AvHpX6EwASIHZ+oP9QwIjGshMlISJwuGDUIzq+kf3FMQUx6CQ3pMx9IDFnVwwSW/2aKRdZS+LEJvKLonpIjuTLctXmTQlDjU2dxk8qO6qf1LCcVa2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOsjhHS3; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOsjhHS3"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-124a5810e41so229882c88.3
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 07:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771860709; cv=none;
        d=google.com; s=arc-20240605;
        b=EcUFHwxXTOrS1pQQ9Qhk37YgLfeRulNxK11E+B9P6+Tv/Gxl6T0/L3OU3pyViUC9Bx
         tRCcNk0DPCfQCe9PE+iPs0FKTVhLctAjaIxozPUbBTiXjDfo5DABrWaz0dI/tH/TaXDW
         t6DjufvpOrMwkn7CogKkK6kMFEJNMZbXC8naFlrG+gT6TZ/jyHKMHqKYhfN/+khlB181
         xKEjMn7dmJcZMhkjnPtAJ2CT/RpTi/FA6R4ILE+/L3ygiOabLPCX036ZH+C0DQkt3ocR
         /P7VJlERzUDxsFWMXKyYInERbbEEMNEdq1t8p9ACd4cQg+9kOGmgfgflM6HOgg0NldX0
         Pb3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pAk8ejtYqNKil504XGxzm+aHwjMu2ZLiZ7Drb8rL6K4=;
        fh=WiQgLnljIv4WaZBNyF8FbGKCAaDOYsVosAHFUVEPogg=;
        b=VadOVItzPXH8tEEmjz1M/kzMuQXPLJwNsmbxwSio8YrAoZ0rd6faenntdXnEWGN2cT
         /86f6m4DS+Gm5PaCmeQhlDzKiUl7rQ41XigsHroWozSN6R0oa86SfC0nFUf3hQiUbHqJ
         j8aZr7wTh/cTET42uw8sThdu3Fd1Pc0Wc80WSdRvN6itGJ+922UrSEylQShx57sf+Bhg
         8CJwrehoHj0RlGZvh8H3lPdFwg0HBuTOrtvY221bD5EQS6vL27EoHYTeeRPVQHuf9ohY
         jc8Kos9copm56FemIoG53PmwXgmBEBMAYNReXCUDb8AkaU44TFim/D2vnDRUX/mDeM9Z
         cddQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771860709; x=1772465509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAk8ejtYqNKil504XGxzm+aHwjMu2ZLiZ7Drb8rL6K4=;
        b=eOsjhHS3Ozmq1VwGODcQdkn8BEX6Q7yVxAxY5igi4hhVUKusDZPgKWiQaozpAx35g6
         1p8ZMVuHNvwWs5A47iMPpq71be5P4L+EaTb1V8R1hq2kxJNXrX8TUrXJsTtci63rqCN/
         BeurzxtsSreoLlWoQYtehE+m5SQI6yFnz2jYiS6WJNXGNqfdiEZ9gzZqt7DYUUtUw9sU
         CmLaFOIZex1RXh39QePeZp7Z0w2GYyJgsmgIbxSMQaDMj6dGRAto5UpDgm2OeyNoOreg
         jOQ5jYb31nrIMSHVa5zAj/5kZkQL+/jJPWyqa1PHlYNCV8NXI1umaCSFS671C+QCuX6c
         oAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771860709; x=1772465509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pAk8ejtYqNKil504XGxzm+aHwjMu2ZLiZ7Drb8rL6K4=;
        b=jqM6JB3dY80UwJFGvbMVF8YtaNhf7dTvZ5B2MJJdPJG4AC5ryMPFh5mxIMT5qjgi/t
         g+QrBKfbfmK08TtEjVMg//CxTr4rU5qu2rCPmhWabFBrYZYvO1A1cNM8G8NTsWice/Sj
         4NnvY7UHblxp24bogypM00bL7SiiYLSqbhi6wfP2++sPxUQBM2UxTJoI/jc/fcIavcRl
         q6ZQlFGyOrA6Cyj1XoMnp0VgWM1tnaSxkaqQfCTHf+HKY3f5BTUXYUFnNahL2odRCJaz
         H2/OwogjjqMD/qLc8LNCU74B+3W1/EqGxOPuXMxm/X21di7EPGsJsNOiUCDWEbwNaI4y
         QkpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8Wp1AV84s49FXiklsytQsXqvI9BS5s6QLbt5G48AhaC7GezN5UudZoGBabSepYHWrCYFW4c5qPwOZFb9v1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrmoh5q4UmPhQiolfKSmH8WaKB9Z++f9YkWzA2ci2tiTQUWMO6
	1hheUE3eTEhStI5t33ScnEJUhAEbFuDLGRYxTV7grPE5pDcsDwCO6Fj0bKNXS8svlWgS0+We4d3
	0nssGcigoW71tX0OZ9hFH6uwn5tSrbng=
X-Gm-Gg: ATEYQzzj72HkZWpsxoMi8lKe+UaHZ0kRvD8VZ2bgrp4Ub0sapyNpZl3+OTuLUjjX1A7
	CF8pIDkoTU1DaLxcX2gUswUgxvM0goG6XLBZHxwaVq5nUA3GEllAeUPDOZNA6H1C4B8ZCUWfxHR
	aauanTB5gVcLqFBN2QPUPcggS2kXppvz4Kmeu/jQcvHXjaZsJCcXSwI+37F1xP4vyl7jlPBTwxt
	ubSkBgP2irLTvyZe369zlUSZeL1t/mQEqWpWL6XoCdjZczHAEKt/sRsznK7hWSNoJAeTaJVKKvA
	i9di+Zs00qKp7k9ub5kuxNbJxHfGA24GOW5qtugLoEZheV0aDbmj8R1u8GR7DZXg9gJjk8QWu/1
	PsfaBaFMCo/lgDZgr30Hgn5bV
X-Received: by 2002:a05:7300:e207:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2bd7bdaec6cmr1877425eec.7.1771860708535; Mon, 23 Feb 2026
 07:31:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna> <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Feb 2026 16:31:36 +0100
X-Gm-Features: AaiRm52K4i0fpTeiP2c0ziG19k4_bQVuvrLcSD-qpk6IrkIxs1psp6f0fzvc-cQ
Message-ID: <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Ralf Jung <post@ralfj.de>, Jubilee Young <workingjubilee@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>, David Wood <david@davidtw.co>, Wesley Wiser <wwiser@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 3:26=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> I think, disabling altivec, fpu and vsx with compiler flag will work.
>
> What are your opinion on this?

It is really up to upstream Rust -- for us, i.e. the kernel, it
usually doesn't really matter much how things like that are
accomplished: whether via flags, a built-in target, a custom target,
etc. However, we need to know what the path to stability is.

My understanding (but I may be wrong) is that upstream Rust prefer we
use built-in targets for softfloat instead of disabling via
`-Ctarget-feature` (and that the other options may go away soon and/or
will never be stable) -- at least for some cases. For instance, for
arm64, please this recent change kernel-side regarding `neon` as an
entry point:

  446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfloat tar=
get")

So please ask upstream Rust (probably in their Zulip, e.g. in
t-compiler or rust-for-linux channels) what you should do for powerpc.
They will likely be happy with a PR adding the target (or whatever
they decide) as Alice mentions. And until we reach that minimum
version (in a year or more), we can use something else meanwhile. But
at least we will have a way towards the end goal, if that makes sense.

In case it helps, let me Cc Ralf, Jubilee and Matthew who were
involved in some of that discussion in the past, plus the compiler
leads.

Cheers,
Miguel
