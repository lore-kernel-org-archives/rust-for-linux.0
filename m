Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC052D9EE1
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760948240; cv=none; b=N+cdaitQNEw+WRfcs/QMZLA67AHUwqf3Zg3LWRRIo8THMy7KYDJ0A2aQZ8dkvI1hmFKKEjp+dC8vTZS0iIByKgefhksj0LLPd/sBFgSxZwJ2lNqAtNR+nsoR25D2j7Ea+XmEJRpaZoJhvxT2qYQtG6eR4NQFas8ANedRpxRitQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760948240; c=relaxed/simple;
	bh=H0tga9DZv6zHPlXhb6ysF3xK2cSNnzfEhWaT6A6Prn0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uwaLB/OHaHtiWUygE3von1B9MP8CY+Mjvn33QcoSMEU+1FfQrg7t3AQSZ3wUdlWLYT0SnGIuEhNNSGzbjBA5YLnDablBjtlEwtOhRsbtiym3na490pO9gDIwtUhNBdoSxbO3GL7E+P4c90ETOdkxQsBg7spiCO4jEbWeH9BZ2so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jc/IrtFT; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jc/IrtFT"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e39567579so25385925e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 01:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760948236; x=1761553036; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LjMEk6mNBH8WSN8eHPXPJ3fCRbx/T8IK9tLp1EWYzkM=;
        b=jc/IrtFT9Ir9m6PYewmOL9GHlnHv9NaKjZGCw3ewMSVMJesMC3tGNxBA65wzsDHCiw
         8cwdmtGgdgZtKf7FiWxab+lEuZpIAc4pHFCbBTlUjcOsrAZCQ9gDoFQNCYlW34pqFo9i
         n7yE34OavRLQMAljgQqS1n/6ssRoVjBOk4UI0vg8prlMnzsmCHYjxCtv96q27MvKv0RA
         lyTbj931DMHJB8BOCdkVb6UNQu/ofdubclUNM/beah41hdhVDHEYhPgHbgTir6RsAVUT
         rEZ9BghEtbfj1mVD7I1ybLjqn49qxIXysd5rDf4Y3I1FjlJT/3NmUPZLkvE8exMF/fQL
         4thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760948236; x=1761553036;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LjMEk6mNBH8WSN8eHPXPJ3fCRbx/T8IK9tLp1EWYzkM=;
        b=q+5fj+gs4Tpu6xuv2bg5PvCI77VXhG0t9A+X0x5TOOj8lTJZoah8yiFM/H82gJVS1y
         3Tjz4SqZyDq4NojXY7sr7vxPSZ9QMTrwznL60IgVJG1M+w7Sov20wg4IW5wvPLKceUbj
         dS/ueb/eTVE51VDRxaddrHN+L3gpskhl966mG56hOQ2XhBT5nsnvS2i4ahSa5grbo/xb
         T0h/epTt+q4a6LNUQoYBd0FSjagIxQhYRMn1/wfpc37M6/4TX38m6a/jQGJeNMIimFUA
         tost+B6g7YibCwV7JSLuYCYtEetXpzrbb0tAC15IouWp88mt/fdh6FrkwnOlGeoFLi7G
         4KFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2vwhnD22Gxmbrm5Ktw8x56nmWDDcpR86IE5c8gTdIjo6iEpJRtTbQjV88kLN09sDpbf0QNIEErpE+A9KVow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWF45RMlwW9sq/9lslQcu6zQoI9HH8oNg++wR8DRCXoWfHRPDp
	i1wgpJQ6t/cH4OXC7L1ywYW6db0ffU7h/f/1hH/f1ZLGR5G5I2zUA8xrBfbwkZ28aDYF6sGw2z8
	ke83GJZpuDgkdY5KsAg==
X-Google-Smtp-Source: AGHT+IFFA8Am2fnybv9rvlh//I4Iw/BUP5vE4Qrvs/2x2IMy3Yp6BBWo4VkpWJV7hHHYkfYEkHZgL37ArvDw8k0=
X-Received: from wmbdr13.prod.google.com ([2002:a05:600c:608d:b0:46f:aa50:d6ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548a:b0:471:ff3:7514 with SMTP id 5b1f17b1804b1-47117877736mr89174955e9.12.1760948235873;
 Mon, 20 Oct 2025 01:17:15 -0700 (PDT)
Date: Mon, 20 Oct 2025 08:17:15 +0000
In-Reply-To: <20251020020714.2511718-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251020020714.2511718-1-ojeda@kernel.org>
Message-ID: <aPXwCwc4uevRO951@google.com>
Subject: Re: [PATCH] objtool/rust: add one more `noreturn` Rust function
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 20, 2025 at 04:07:14AM +0200, Miguel Ojeda wrote:
> Between Rust 1.79 and 1.86, under `CONFIG_RUST_KERNEL_DOCTESTS=y`,
> `objtool` may report:
> 
>     rust/doctests_kernel_generated.o: warning: objtool:
>     rust_doctest_kernel_alloc_kbox_rs_13() falls through to next
>     function rust_doctest_kernel_alloc_kvec_rs_0()
> 
> (as well as in rust_doctest_kernel_alloc_kvec_rs_0) due to calls to the
> `noreturn` symbol:
> 
>     core::option::expect_failed
> 
> from code added in commits 779db37373a3 ("rust: alloc: kvec: implement
> AsPageIter for VVec") and 671618432f46 ("rust: alloc: kbox: implement
> AsPageIter for VBox").
> 
> Thus add the mangled one to the list so that `objtool` knows it is
> actually `noreturn`.
> 
> This can be reproduced as well in other versions by tweaking the code,
> such as the latest stable Rust (1.90.0).
> 
> Stable does not have code that triggers this, but it could have it in
> the future. Downstream forks could too. Thus tag it for backport.
> 
> See commit 56d680dd23c3 ("objtool/rust: list `noreturn` Rust functions")
> for more details.
> 
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later.
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
