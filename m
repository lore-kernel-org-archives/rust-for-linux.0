Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA19171CC
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Oct 2023 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pw/SRXYo"
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB36CC9
	for <rust-for-linux@vger.kernel.org>; Mon, 30 Oct 2023 06:58:53 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-542d910f34bso1437667a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 30 Oct 2023 06:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698674332; x=1699279132; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pwv0nNI/GXb5sK6crMnTZzX7DXnGnuo4VkjJxSyGGBE=;
        b=Pw/SRXYoxDLks3cmJ83KKdDUaLJOw/++8rzzczrv5QNwLvEh6F/aVJ4p8Vm04Tu5ST
         uxoT1x1n7FxzK7ZAn2srR/K/yTwAfdbIeAYEuxwpyr3Iz/H/slZDCFi2x3TM/QbHZTXy
         0fgOZvmzkr2c96W96XsJemLGGtK9rGVnG832Z7lJDXfDsrFvh/JIq2H20S+6La/asCPF
         XE1qRMs36ns1Vpzu/g4yS1N+6xp03dknrCTZrLJeVBh3YUu4oo2IPGZHOgxkPVauPDlI
         2wf2LzII9tsSqUiPPYy0trkBFEKk5NJ82FQCOhJbHqfx+Ys3qx8Y2dDSdi/Rg4roxr3W
         FkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698674332; x=1699279132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pwv0nNI/GXb5sK6crMnTZzX7DXnGnuo4VkjJxSyGGBE=;
        b=gTCd0hptU3Rlbr8itvlMxQoPMY4etwmhMNpQ0T+MRJkFQPKVu0EJwcTdR2x++IIxLr
         tl/P3Ksr1FwIEVkDR33xMxB31URQ889DEFqp5ui6gkx2MXuVD+fwDdOHC5oEBxXxuGFc
         VDKrQWvZmLfYbVnYCE8ksJ7pM3uSEGzpka6J5cDuxQOPCzM8egfl2cg2MP5p7jPgdc69
         l0h0uNTlcuNoCgDHrLpm/GtB2UWn/BQU0RyfyFEeExTO8WwevERIuOBn72+eDl3siAyd
         ELlNZX2wkYx5KsEc83v+XQohWd69rZWsIFychxzae5Uqk1E9Wb//VowY+HkBj/QaNm5S
         mFzQ==
X-Gm-Message-State: AOJu0YxuXaJ7Qc3Sr1Gx1qlKzRVW9r2KDP68dIhCgN6fCaeoraOLBFU1
	+qvRjtyThqyYywO2DwpI+LRnN0hBn95ac3U=
X-Google-Smtp-Source: AGHT+IGNKlEATVPDh6rVqDOpRvWhA0c/AXkrrys3npUtceRNXpU/wxHpIZOuNkZ6upnlTs5QHBR1A23TFUXF5l4=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6402:f19:b0:53e:b944:d5ca with SMTP
 id i25-20020a0564020f1900b0053eb944d5camr92691eda.0.1698674332155; Mon, 30
 Oct 2023 06:58:52 -0700 (PDT)
Date: Mon, 30 Oct 2023 13:58:49 +0000
In-Reply-To: <ZTmelWlSncdtExXp@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <ZTmelWlSncdtExXp@boqun-archlinux>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231030135849.1587717-1-aliceryhl@google.com>
Subject: Re: [RFC] rust: types: Add read_once and write_once
From: Alice Ryhl <aliceryhl@google.com>
To: boqun.feng@gmail.com
Cc: a.hindborg@samsung.com, akiyks@gmail.com, alex.gaynor@gmail.com, 
	aliceryhl@google.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	brauner@kernel.org, david@fromorbit.com, dhowells@redhat.com, 
	dlustig@nvidia.com, elver@google.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, j.alglave@ucl.ac.uk, joel@joelfernandes.org, 
	kent.overstreet@gmail.com, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, luc.maranget@inria.fr, nathan@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, ojeda@kernel.org, 
	parri.andrea@gmail.com, paulmck@kernel.org, peterz@infradead.org, 
	rust-for-linux@vger.kernel.org, stern@rowland.harvard.edu, trix@redhat.com, 
	viro@zeniv.linux.org.uk, wedsonaf@gmail.com, will@kernel.org, 
	willy@infradead.org
Content-Type: text/plain; charset="utf-8"

Boqun Feng <boqun.feng@gmail.com> writes:
>> On Wed, Oct 25, 2023 at 09:51:28PM +0000, Benno Lossin wrote:
>>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>>> index d849e1979ac7..b0872f751f97 100644
>>> --- a/rust/kernel/types.rs
>>> +++ b/rust/kernel/types.rs
>> 
>> I don't think this should go into `types.rs`. But I do not have a good
>> name for the new module.
> 
> kernel::sync?

I think `kernel::sync` is a reasonable choice, but here's another
possibility: Put them in the `bindings` crate.

Why? Well, they are a utility that intends to replicate the C
`READ_ONCE` and `WRITE_ONCE` macros. All of our other methods that do
the same thing for C functions are functions in the bindings crate.

Similarly, if we ever decide to reimplement a C function in Rust for
performance/inlining reasons, then I also think that it is reasonable to
put that Rust-reimplementation in the bindings crate. This approach also
makes it easy to transparently handle cases where we only reimplement a
function in Rust under some configurations.

Alice
