Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B233286D53
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 23:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765495021; cv=none; b=LRWDigzEtVr86j6t719n2vQNb/qQuDxUUy66mY+UckwMFzrbmjzoVGNk/6GPbp33sXJ/ZsmUKvWfjZnL4H1M27+P2qj0F0DQr/cHNPisesg4uV9lp+yiESPPj50eSU3D/fhLkd9kWcvwn49aQaPoLZqvxU3ViHJhf9DTgjXiBWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765495021; c=relaxed/simple;
	bh=8mnSFiy27QdOh3ieBINJ04d3omCzK2ZejjJJGCV7188=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOQqkdBXAzxyl7DPvfnvQa2maaTqhCABCcevYMCg9LAplMkBCvObRPWvdS57cvrR+I/cVhpht7qDu3jI1T6Ex5qguA2GJqZByEWqieu1wmlxsvTa0HxzyXluAmIjDmazGzgSUZnDtkDmhu36ecRU2WXEHF++uja//CG42guarRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJ4SQcE0; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ4SQcE0"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-297dfb8a52dso651595ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 15:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765495019; x=1766099819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mnSFiy27QdOh3ieBINJ04d3omCzK2ZejjJJGCV7188=;
        b=cJ4SQcE0eDlEV6vDqingqNxAK1ZIqqm2OdMhSwKTKByNtc/RR+QRErN9d1uOnJeJXH
         9EoyMQFGNlv+MG1xI1NOA0lzNu6FtzcaVvpQIpf15rmTWG7QpLPv1DLUR2p/+f8jdQCX
         kDuSB36cONg3m9mQOTR7uEb36n1M12JFFfYlZT3Z+sImtVa9QUgm7fr2NB4DvCvWCegn
         e9jnUHJs3WEcgEKcz/wNY5Dxet4hi6GTv1dHsN8MTbLj0CLbAgDyn2+h39PmEPtIY4he
         PLvC1/ka097UNYfC5aM6KOrcZsQg+mlDqctqtif+XRkpF+LgYe5F4NKeBkVV8S9PMUYr
         Pn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495019; x=1766099819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8mnSFiy27QdOh3ieBINJ04d3omCzK2ZejjJJGCV7188=;
        b=dMrY0Udb/CeLjuP210N1VIy9sqhITHS6mV8xqJ/K+CWQpUN8Kd0fgWeJWJq3nsXuAt
         H/b7BiBTERxDNpeXA2GnsVn9anpAl4x06a0V8bx61iDDFW6xjp3/FZ0EPrjFYunkpDAU
         WVfslAK41ga/Viwfi9pgw+3iWIIaKyVT6lUDBuAsAx1znkAXQgE1mkwuFHNxrmvbix/o
         oNZaYUoQx5Ul/zY40fmrlSvWMJSZ0EERYDj0SwueWqfmFw1rmLwFgN4nWoqgjY70b/yF
         XnIr9Cm4Hszd75Sy3Hk+JFFjs1dubt7w4oXOaBLE5wIlhL9fDez23gHOLVRVizXHYf3r
         cgpw==
X-Forwarded-Encrypted: i=1; AJvYcCWRuvaouYsmO7fwT22sHwAebTeOLyXrplMF5I7HxseG1BYATdtl8i2MM2udM3xTqkpu3K9ckc3qjwfkwwNW7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsjUNYX/hvOHA/Hy8nbKjlhImvU63kDKtzsc6A1i1MIvn+UDws
	Ur1Yu5t+vIWSbgAlWT8llbdj6reD61yOrjp3D7SHOF657l1UhThOUtD1lpG+rzvyDxmwfN5g6tA
	i1M7kdDAkFS+C05G+Y3LEFqdGOJssng8=
X-Gm-Gg: AY/fxX4bw2VQpndWmw08+1n9qBB2d579Rf+LigqL+fKFf6tefQVXfgW/gBMyOkFE8G2
	rHrctGkNB/YQcLlhWz883VKcWdI7hFQl0xdHE/blLeQ3Q1sUqVoDIWMRCS5ryW9/MKY1Pix6sOl
	FV3yHCmt9W9cKM4KRwCqmcvw/PC7a963viTaTu9jBGHu1PGknVNilrmwu327wIAF1m2Mw1DUen6
	HsOXGe1Ce+YMDqnH/dtePDdz+U5IHAA+d4o+9F8vPmu/9svm2hssxoHxSZd1FJaX5xjyo2QJkCJ
	f9hdQFJ6TpWJwweBq2ADOPENQNMvXieVKieymla0EvLow+salJetP34d7Lw4Y4HQWmgpsFvqIEk
	BMlZu4Dt8TUh8xQ==
X-Google-Smtp-Source: AGHT+IFYeKP8iC/T9YXgOHhW86RZtp3HRfERrabRnKlVZMi3RkcOIdKsTDRkSvGOoxrOvXAtmjzTG1RrZv7v4C0kB0E=
X-Received: by 2002:a05:693c:26c4:b0:2ab:ca55:b76a with SMTP id
 5a478bee46e88-2ac3013778dmr97330eec.5.1765495018562; Thu, 11 Dec 2025
 15:16:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202512110753.8B3YlvtX-lkp@intel.com> <20251211213133.56265-1-boqun.feng@gmail.com>
In-Reply-To: <20251211213133.56265-1-boqun.feng@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 12 Dec 2025 00:16:45 +0100
X-Gm-Features: AQt7F2rhAjOgEEsqv1auF6Ic-f3a--tEyGDZ73ZjFWa3CV0-UuFP-i3owl8hhmE
Message-ID: <CANiq72kHGjVmcje5fgHYqsZOdM7kN6HqnrvMdoLsbp7c_4AUhw@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: atomic: Fix fmt warning
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, x86@kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2025 at 10:31=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> Commit 14e9a18b07ec ("rust: sync: atomic: Make Atomic*Ops pub(crate)")
> introduced an import ordering that rustfmt disagrees with. Hence fix it.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/lkml/202512110753.8B3YlvtX-lkp@intel.com/
> Fixes: 14e9a18b07ec ("rust: sync: atomic: Make Atomic*Ops pub(crate)")
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
> Hi Ingo & Peter,
>
> Looks like I missed one rustfmt issue in the commit 14e9a18b07ec in
> tip/locking/core, here is the fix. Feel free to fold it if you want.
> Apologies for not catching this earlier.

Linus picked 309e49039f12 ("rust: sync: atomic: separate import
"blocks"") in mainline a few days ago (but the solution I did was to
add a newline to separate the import "blocks" with different
visibility instead).

Cheers,
Miguel
