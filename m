Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9D7302152
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 09:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632773; cv=none; b=IN75zubLfFUwDNI2MkS3LSvB5+b41IE3WTQXallSU8Rsv8gu+Gncp9yNmcMziUTNezws9rPRAbvqf57cn+mKIuGpWO/ShQ7Iwp3CXBMBppMC65EP+SP/ypJFvgs0uFLywa0bHycWVykAlBXMmXghIDO3eFKdKZH6YHpd2mXJFtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632773; c=relaxed/simple;
	bh=ebkAz8idP/5kWsCMCA9Et9EJ9cCNttzJgavkMh49SLI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JfREUxRRGJi+SwxC2dOto7DaC2jTOQBslb+h6V54dKmEVZBH3uUbmw7R9Ct6ElAJZT/02Iu5TGOA/NK/3U75KCuZ15DffX8SNH1gRmkPEW4kaTG0pR4OldW3EyJI2j8Mgikb+lOzJGwQe9a/ALsXs2g51nXdlsSyvdLPH+IlWdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gcEmZ0e7; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gcEmZ0e7"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b478551a6so317329f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 01:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763632770; x=1764237570; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rKhkvz9RkKrz0nh0wD2ZjaTl6jF91MXKlXmQggVVFBw=;
        b=gcEmZ0e7586dxVugwr6itgoelevmEidgzLqb0ljCZkKeElu8KtcqXw3/gn3pVm4bb3
         gG/bB+DECwkdIvYS4OHS5CJW0Z2nn3Yfmqoo+RsQ7sgk+pUmT9bR8RzpHcaeq3/4JMQM
         UFK3yeJiXQLScs7x7OAw3E1zNN4q+LmjNseT+IznFvWOz+GMKEagvWtNQpfOiGAHv/gJ
         aLwUsbdV87xv8mqZczzx0QLQ8coJb03tV6TWjkzWxXEyb04TRmld5NraYYFet3jb3rsW
         QgY/XK1uXY8aU6SnsRRd0c1XBwyze4+JWkv0Uuw+MTAi7MC5HJuRRWn8Og3t14l+NzkG
         57VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763632770; x=1764237570;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rKhkvz9RkKrz0nh0wD2ZjaTl6jF91MXKlXmQggVVFBw=;
        b=DWB1cmcMtiN82lM6SmZgoxm0XqagOHglUGST/kGvBKB6YS+mGe/wKpiEbtUimocyL9
         Rs96eA0yaPfxjeJFZDNbtDZShMUprrpDciwZPn5CiCgP6dtodrMJXqCUt1H5hqq5abwg
         Lj/uHQ18VFQEdCcpNGXKkfpH3ZrVt3EDi0LhTlzIGDlWMUgjQYws9hOGeQxyqDnScQrH
         IsHrMioeUSGDIEDVE68VIq/nF/iqLr+ZfEjm8vWbgDJPdwZvUup0sIIQtmJAFjaVEMB7
         eMQlrohNLsZM3L6T2NhmpQkPX9Y2V64aFyrN4UcH1wSYtkZpqgaRAPepe2qdXLKGupLp
         bJSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrFExxQcF2Qnlmq4K7b7sbN0pMGci+lIibtyNhdEKYp3nL2IaYob0pXMhgmj6iMDhtEZBrx9iKtwrMIqUUyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsk2jrYrtpMRhUeI9qA9DBmz+jcnUJvrj41u8f13vO5TLED+AW
	aGsayE5rrAs7hYEfkWl2GVeWNKLpbzqWakbQTGuF0pR+V9Z7wGjyln2SbqTussFWl+r62gEZj2t
	zdJX7TYnq2uoUZqdMlQ==
X-Google-Smtp-Source: AGHT+IEKKD/BmbPlgMBpPggaAQdc02UN5hstoI3MhFvEktRwsM27SKW5fgN95go6FNLuZRUl6xabBr5bc6/w7Gw=
X-Received: from wmfr22.prod.google.com ([2002:a05:600c:1596:b0:477:632b:1238])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc5:b0:477:97ca:b727 with SMTP id 5b1f17b1804b1-477bac0d06amr14368825e9.19.1763632770470;
 Thu, 20 Nov 2025 01:59:30 -0800 (PST)
Date: Thu, 20 Nov 2025 09:59:29 +0000
In-Reply-To: <DED5D81TXPCO.3FK81IGE9KR0O@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251119185125.1411151-1-ojeda@kernel.org> <DED5D81TXPCO.3FK81IGE9KR0O@nvidia.com>
Message-ID: <aR7mgRgG8fKhgD__@google.com>
Subject: Re: [PATCH] rust: slice: fix broken intra-doc links
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Thu, Nov 20, 2025 at 10:56:29AM +0900, Alexandre Courbot wrote:
> On Thu Nov 20, 2025 at 3:51 AM JST, Miguel Ojeda wrote:
> > In older versions of Rust, the compiler doesn't know about the newer
> > `as_flattened*` methods, thus `rustdoc` complains about the intra-doc
> > links, e.g.
> >
> >      error: unresolved link to `slice::as_flattened`
> >       --> rust/kernel/slice.rs:19:23
> >        |
> >     19 | /// [`as_flattened`]: slice::as_flattened
> >        |                       ^^^^^^^^^^^^^^^^^^^ the primitive type `slice` has no associated item named `as_flattened`
> >        |
> >        = note: `-D rustdoc::broken-intra-doc-links` implied by `-D warnings`
> >        = help: to override `-D warnings` add `#[allow(rustdoc::broken_intra_doc_links)]`
> >
> > Thus fix them by using an URL instead.
> >
> > Fixes: 88622323dde3 ("rust: enable slice_flatten feature and provide it through an extension trait")
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > ---
> > I have seen this in -next -- please feel free to take it or rebase if
> > preferred etc., of course. Thanks!
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> Alice, I guess we will want to take this into drm-rust-next or
> drm-rust-fixes since that's where the patch introducing this originates
> from?

Yes, it goes in drm-rust-next:

	After -rc6, the branch is open for fixing bugs introduced by
	patches queued up in drm-rust-next for the upcoming merge window
	only.

I will take the patch.

Alice
