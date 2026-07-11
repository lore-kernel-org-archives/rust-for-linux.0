Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A1737A83C
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 10:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783765745; cv=pass; b=YQH/sqVs8ls3+M+gBu9yUrRgz2qpZM01FT6qzg5QF+okgnbbRu/KEtMTk/mvmZ6+YxKR+pA8Q+zPjNqMhAhBxehRODTJrjaepn49YnxtuAQElLMYI+9NHx5Gbt+TfWJw4bFpbBcsFcBYPGA7fsUMGySmxGS5d7NeEZvIKhdM+Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783765745; c=relaxed/simple;
	bh=v7N7WBZIoji8pk3g78CbdkF7r0kKnU9EWaTwbfXpxQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ihZ+0G//wDhYQNZK2VSxHFFg9/okIhq5X9DNZIFZ0Egqy8AV9znLYHLecBjNjFSNbBhIQmTsgp6UBSrgxeRcmdhjazWbebGfctR4WeHS9LLsEO3Y7fP4ErQTI1TMOLTmkE8VreX7+2o6McAyqOm3jqp8Zl+hTBhhxSyGzYfYMpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vshMRqpe; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vshMRqpe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacef7d299so42685ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 03:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783765743; cv=none;
        d=google.com; s=arc-20260327;
        b=DW7mcGx9zh5Z8SpCRBDSSTYdmYPPi/KftPLgG+tAdZade9r77Qw2WCKwkxhUE3cNqw
         Y+ClO3oXYsCVvUINlIoS7v9uaYlGYPpAPp515kn8q/0B0N3KJnuYUnp1jwINaAQ9fgUE
         DtXDd8RFzWdbAYf8DypUVATmLmbuL5eWffvWghjGhMzSj6Ehpf/22EuiyDyhbs5A2E/p
         YIGtOnFOcoaDJkSIf+ryWnyAUK9kucs/2Kfk9hD8G7rKoPg3QUPqGGiXz5YuxrdMcYcW
         Q4bH4frtaE4C9QgRCyyoQ2ps2DAooZc4wherikXFo9bf5+awDyj0bCDKm8eCAbLJp0LF
         F4dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oV/kudkJykLXrPCFSfzrdIQB6KqnLT0upf2KM2vQErw=;
        fh=SFDVXuJpwpsnDSobTik54oaYyHdpk59tCSoy+MgEwwM=;
        b=GlAEaCJxCQ4wWC2bD3DATVr0Y1LUpVDkhWBbHO+dq5txJ84V4WZPyn0zj0O1GKGj2J
         cNkUnE+dS+w5fkwZuIwmMWVALK7IcT+giR+knmB9WKCXJVZ02EDMZt4e+pHljZ9d6pjv
         MoNB8NLDEQjIEL2vj0x3DhVbKM5h26SULCETYp+d4qBd3DLVFBdVMd4Ur1Ql7qXk8u7B
         Uzw+0nRr8A2xDTNwEgWlbOXkbB5YK5BGOwjFRPTkvunFw603NaKGlO232qzT+TCgvGo1
         Pm7WTp9LLlZPPftPa8UflOgRnRVi8Wudh6QKXpnc0b8OslBt5wrmXMBR2M9JvrBWDrvG
         4iwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783765743; x=1784370543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oV/kudkJykLXrPCFSfzrdIQB6KqnLT0upf2KM2vQErw=;
        b=vshMRqpewM1gdglf8iXrCqOh0oo9pvn3GSefHNBlLTcBGMsfOACdC478iNUm0OLpa0
         ZqoIf6VjOvPPGH/+u4rJJGzZRDuii9QzP8OiKIgLb/BEi49knlFvPEo4BJrvNTciGXtC
         6R/0A3UfZFCh++GKGKdq5BMrbCvAuSKQgct45CutnsTxJVs+rTxKuMubfWZoIfpTYTZW
         Xqa0n/N0zQL3VNImAqGa6NAjALYrAVGS85PQCKJ45ARXMCvLidPDBMLQm11UdvfWkV3u
         Ugc56GwfoqS8r2e0bKW8HZJeVyD+wy6uuZ78z3R3Lx0/qW0Uvb84P1xubbITwxHz5RZm
         KUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783765743; x=1784370543;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oV/kudkJykLXrPCFSfzrdIQB6KqnLT0upf2KM2vQErw=;
        b=dLT6GNhuswWaVqvrmpNyFQ4JuZRBbnTodPP97x2ySuVJtc48chMqqEPoumgaklU/gl
         BleevublJFrgL4My7dDRptlhqa0ojkUPgT9rAGsV1ndE77o4RcjDIjCNcidcFHXcBjtN
         kxzpCFGnsT3pZBfnL0UP208h8u0p4MPw8Ku/NLYkzin0nm+PqtHjZuKZMghhx9tUqY0P
         bP4G/JULdrPr71c0qiR0o5NZ4z1dbghkqNrVXzpKsA2TWtzuL32ouTsu1JR/Hohr/30b
         uXFqZU2Rj30jtpbAFtIjcrt7agnoU6ITzborqXkVQTHfhY/7n1rlyciOcs+qDLC1CcYa
         Cwow==
X-Forwarded-Encrypted: i=1; AHgh+RrFf4ya3gYs4J892pdMqLJae9KbEYjdsS2GA48ZpudGVNkA+HMZksK/JKtLEDOzetQiwS7awNm4q/ioPsFq0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxJ+dq/o+45esJTmanoqBdaZ4VGsSxYYi5q0Qypv58AIstw2d
	+vV+bSJYtkClQF38ZJlG6yACzKkMdIcxfKZF5iX3NgmBbcZj1lNpc14fvP0WLQKwpM03sPDf0pt
	mGq3lAkHjyO0/GX5v7JvUbJ6VobShevb6uxSQ2528
X-Gm-Gg: AfdE7cm9oB+QJFIGeUMrf6639S8P8jzxb9fwrPyAzdW6HP8Re2iauB5l63sW/FpV68C
	aKIV4HFLMY5doSNA+34qwRrA2oGC3idQdDWubwY4NUxwLdQZsdZinFWSA2cmV6BUxaQLcsd29BF
	7Q98w5c126Ag2XHYb2MX1EqHvH/7YR1GOpZaM/F8wOPYBWMC37RrOkzBiEmmrWNMw+BgPwuHa+h
	MsPeLHT377PDdbm7O0vS4hSPnvwNc6OGQ+5nao3FT/KP1F0ICBkSI9AlwU8CZmzkP/o1ejzZsno
	4MvjNSSy
X-Received: by 2002:a17:903:2a85:b0:2c9:d89f:fd98 with SMTP id
 d9443c01a7336-2cea1d79204mr2038715ad.1.1783765743095; Sat, 11 Jul 2026
 03:29:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com> <2026071046-musty-subfloor-53ec@gregkh>
In-Reply-To: <2026071046-musty-subfloor-53ec@gregkh>
From: Jahnavi Nitheesha Mandava <jahnavimn@google.com>
Date: Sat, 11 Jul 2026 15:58:51 +0530
X-Gm-Features: AVVi8CdVA0e9M39pTo7f9PmDS5PArNQHHOoIpLiTjQMgExKbzuAD-FSltKzzmyE
Message-ID: <CA+ba3EP9PO3ccBu1VK53WeR_2cT9MaGC_5dPcy9QKnvHBXX5fA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] rust_binder : Implement dynamic debug logging mask
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 8:31=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 10, 2026 at 02:32:51PM +0000, Jahnavi MN via B4 Relay wrote:
> > When a user-space application sends malformed data or makes a
> > lifecycle mistake, the driver rejects it with a generic error code
> > (like -EINVAL). Without internal logs, the driver acts as a
> > "black box," forcing developers to guess which check failed.
> >
> > In the legacy C Binder driver, this issue is solved using a dynamic
> > debug_mask module parameter that toggles verbose logs for specific
> > subsystems. This series brings the same critical capability to the
> > Rust Binder driver to provide developers with clear, real-time
> > feedback.
> >
> > Instead of rebuilds, reboots, or guessing:
> > - Developers can enable logs instantly on a running device by writing t=
o
> >   `/sys/module/rust_binder/parameters/debug_mask`.
> > - It prints the exact reason for failures (such as alignment errors,
> >   mismatched call stacks, or invalid handle references) directly into
> >   `dmesg`, reducing debugging time from hours to seconds.
> > - It protects system logs by keeping logging off by default and only
> >   enabling it when developers are actively troubleshooting.
> >
> > Based on top of:
> > https://lore.kernel.org/rust-for-linux/20260707-upgrade-poll-v6-0-4b8fa=
e7bf1d9@google.com/
> >
> > Signed-off-by: Jahnavi MN <jahnavimn@google.com>
>
> Patches 5 and 7 did not apply to my tree, can you rebase against the
> char-misc-testing branch and send just those?  Other ones are now all
> queued up, nice work!
>
> thanks,
>
> greg k-h

Hi Greg,

Thanks! I will rebase and resubmit only patches 5 and 7 as a new
version (v3) of this series shortly.

Regarding the feedback I received on Patch 1 (using the BIT macro
and Atomic<u32>), since Patch 1 is already queued, I will send those
cleanups as a separate, follow-up patch. Does that sound good?

Thanks,
Jahnavi
