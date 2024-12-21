Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71AA1096F;
	Sat, 21 Dec 2024 00:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734739264; cv=none; b=p1HIWqLv+bD+0lliuCXfUQ/GN8xQ5p7TZf70xBgMgHNOpgoD50cL6A31wqBIEcD8iNrhCkmkwtYTBG0jBP0ppp3NSqnj1Ro3K0q3icYoN3sGsOIET77vdzf16N7LLb/PwLzB3Pg9R+lL+7mbI7Th7kCL6/YeE3t9N+gTUKSe+VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734739264; c=relaxed/simple;
	bh=eX8b234DE8wi5j8JlFiQH5ya7r1DiZZ9S4kBANKQgIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q3NSxdSGkrrGxlkqaQVWvTj1UpcKFTpdVNfZHFNqNkzpUDPlQh7V/PemEWdSgH8J0qamMO4oSW/+xW+weAX1hAUNKrS1CPd/k/nRjGieZaGFAAcGMmRiwqBSYg3XpacK+NYiWZlCluHZSj8+S8NijhwXAYXDjZwbmiQYq/okoto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7nAFPsV; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7nAFPsV"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467918c35easo33327981cf.2;
        Fri, 20 Dec 2024 16:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734739261; x=1735344061; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZRsZijb28iJaPSe0DkMrJb4n9CKWQUlvhBL/d90ths=;
        b=b7nAFPsVSeB5jGgt5x+h8uZ8ib71vF271PWSafKJ6CFQnxiHvZ0Xghd6PkFeitXhkP
         T0oW5ofqI8DloEaxU7Ew0tzaJ4Uix42qcV8skyI6eOg3WlwTtFHn3E8e5ytAzHuQonoV
         B5ZFliOnohUG4RCL9KbYRvhq5d+WnGvJNqDV0xYwXJ3gvO5xQxy7O05i9clu/J39BiKj
         NKSVtr+uIngdWOCbNvTLxVg5fruxTCX2o05U09I25s1W2Si+RIobzhUCrJzHaAp4Ez+s
         99Yil+fFyEiZBuXBQVD0kcpmfsWm+eAx1l23TzD552sKSNf35I7n2lfLepjUu8KBBQql
         bQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734739261; x=1735344061;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZRsZijb28iJaPSe0DkMrJb4n9CKWQUlvhBL/d90ths=;
        b=Fg9BmCr9Z3w2wA+wAU0YH8Ys5TZa+vSiYPeg0i0ointEqwFqPWzSQoSgbCki7wf5QP
         k/cIA7ypMVx2gZkGh/HEU1o4Vqzmk6ubucznKXbRqEcEgp2GVLDEmYfCH7bDkWdgvAyp
         dWFDN4XX7HBhXSInDJC3/2X4MuVD3UsdsFYsmwHup3h9dPkFe/wxpNtBE2HulFZOWl2c
         nWz4GSyGBlqJ+xs+9Cqvqia7kTnuOtfaF1Zl6ZyU6FGHn6NjCOzs+9IU08okKYz3N/nj
         NsUiy2i7mOCNpsnRvxeHFvFqJtTlqudmsgXLyFt49ARDMHprSnIDx9U0LjgUdHYJRGp9
         m7lg==
X-Forwarded-Encrypted: i=1; AJvYcCVofkvZ0nII0tfFkVGak/hygm07+8tlgxGpbCV477TOkiEyQF9YysV+nh7w4RofER0LPfYtf7l1ZsIDq2FY4Ew=@vger.kernel.org, AJvYcCXdWBGlVZZYpjUCq2AWkRIH01uMxv9LHIKJhSLt3iT6X7PbDh3NiYO11lBSCziU59YahDX3dv32CqVtbZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGcYOurB2j7njDJLJdmY1H3hA0b4dZvWO/r7oXBGE22XriEV7y
	J+j7kraNhaXPAtHuohuPCkjTNhNoAI8Avk3CZqEzM6gavpG0O+pu
X-Gm-Gg: ASbGncsZ0nEFbDM57X7lnp17GQ3WX6w7p69YNi1m0GOzKuYMeoEmaiWNiBgey/FFbvx
	1Eq+eMCOBX5vPI4pnwYkmJdG9v+BlpyH3nQnJSU7w8bzsBga2AVYSEoBjwe/OqnoYTFCjNIUwuD
	IZ5piIW5dvt9tAgoYyAzoBLi49cw2dmexhbtju7AkzucaywqrEz/yXfAUHjQvxDK1NXRrdLSjJ/
	1lF2qb+udXD1G7EpMdYeWXeQjXucLG3s2+SJXvyGgIQ8IAqO6IUYr4mV6+4MziksTDfDpFaBeNI
	bkBrFFEm5bV/dzNY/mjENPs7NEqdexfWXpuN4lRUz+f7zrY=
X-Google-Smtp-Source: AGHT+IEJU/gU/Rh2aXVGkz64AW0aSW3R4f7zLJ5URPK7VJHu0NMuTXuzQDrCDwhcvovsGW0J6t6Uww==
X-Received: by 2002:ac8:5f82:0:b0:463:eef:bab4 with SMTP id d75a77b69052e-46a4a8f4b2cmr88286021cf.26.1734739261541;
        Fri, 20 Dec 2024 16:01:01 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb17625sm21623351cf.57.2024.12.20.16.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 16:01:01 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 95E491200043;
	Fri, 20 Dec 2024 19:01:00 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 20 Dec 2024 19:01:00 -0500
X-ME-Sender: <xms:PAVmZ03XgIenDL8w-K1apBUAg2ZPADM__J2AaaUJJ-rh3ZQu5T6xFw>
    <xme:PAVmZ_H1PPxqbmvPXo8CJr9IBHJG_TrWAA9aPu0438CmQSJ3Cc67Zdsboe-f7vA0r
    sK5Tv_VCBqOMihSGw>
X-ME-Received: <xmr:PAVmZ86Vd9pTxwQOHdqrtX4i-b7Dc_jx4xTfePFO6xMJhrZ41cwzFOAmpqk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtfedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkgggtugesthdtredttddtvdenucfh
    rhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeltdefueegfefhuedtheefvdelhfeftedvhfdtveel
    ueegtdejjedvieettedugfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehhe
    ehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
    pdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepph
    gvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgohesrhgv
    ughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlohhnghhmrghnsehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvug
    grsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:PAVmZ91ITXipo_T-kTdZgsczoYkLm9hJcI3mHMfh5agGJFdI6wFLqw>
    <xmx:PAVmZ3FYXrY5mg2VluSKtgzutgI9Ub68FFKRb5l9vPLP3q4b-CqgNg>
    <xmx:PAVmZ2_Ks3D22ODi_T8B-NiSJUd2h--f0P32JrALCWyJSwTmG7lN5Q>
    <xmx:PAVmZ8l8XtceU0sZS3Zjm_I7M5lEUjrddkC7svkpf5GHagzMpvYLBA>
    <xmx:PAVmZ3GEVPdj4wN6eDuyNrgSoARgzKL7n2sIAlKTX6pHQ3Nb3bubXtv1>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Dec 2024 19:00:59 -0500 (EST)
Date: Fri, 20 Dec 2024 16:00:59 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com
Cc: Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, Lyude Paul <lyude@redhat.com>
Subject: [GIT PULL] LOCKDEP and Rust locking changes for v6.14
Message-ID: <Z2YFO5zr9vm5kdjb@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter & Ingo,

Please pull the changes of lockdep and Rust locking for v6.14 into tip.

The following changes since commit 63a48181fbcddefe5fb4c6618938bb64c543945b:

  smp/scf: Evaluate local cond_func() before IPI side-effects (2024-12-05 14:25:28 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/lockdep-for-tip.20241220

for you to fetch changes up to fbd7a5a0359bc770e898d918d84977ea61163aad:

  rust: sync: Add lock::Backend::assert_is_held() (2024-12-19 14:04:42 -0800)


I combined lockdep and Rust locking changes into one pull-request,
because it's easy in that way for me, but should you want two different
pull requests, please let me know.

I keep all the Acked-bys in the MAINTAINERS changes, but feel free to
drop them because it's going via tip. Again, thanks for the trust and
thank Miguel for the support!

Regards,
Boqun

----------------------------------------------------------------
Lockdep changes for v6.14:

- Use swap() macro in the ww_mutex test.
- Minor fixes and documentation for lockdep configs on internal data structure sizes.
- Some "-Wunused-function" warning fixes for Clang.

Rust locking changes for v6.14:

- Add Rust locking files into LOCKING PRIMITIVES maintainer entry.
- Add `Lock<(), ..>::from_raw()` function to support abstraction on low level locking.
- Expose `Guard::new()` for public usage and add type alias for spinlock and mutex guards.
- Add lockdep checking when creating a new lock `Guard`.

----------------------------------------------------------------
Andy Shevchenko (2):
      lockdep: Mark chain_hlock_class_idx() with __maybe_unused
      lockdep: Move lockdep_assert_locked() under #ifdef CONFIG_PROVE_LOCKING

Boqun Feng (1):
      locking: MAINTAINERS: Start watching Rust locking primitives

Carlos Llamas (3):
      lockdep: Fix upper limit for LOCKDEP_*_BITS configs
      lockdep: Clarify size for LOCKDEP_*_BITS configs
      lockdep: Document MAX_LOCKDEP_CHAIN_HLOCKS calculation

Lyude Paul (5):
      rust: sync: Add Lock::from_raw() for Lock<(), B>
      rust: sync: Make Guard::new() public
      rust: sync: Add MutexGuard type alias
      rust: sync: Add SpinLockGuard type alias
      rust: sync: Add lock::Backend::assert_is_held()

Thorsten Blum (1):
      locking/ww_mutex/test: Use swap() macro

 MAINTAINERS                        |  7 ++++++-
 kernel/locking/lockdep.c           |  4 +++-
 kernel/locking/lockdep_internals.h |  3 ++-
 kernel/locking/test-ww_mutex.c     |  9 +++------
 lib/Kconfig.debug                  | 18 +++++++++---------
 rust/helpers/mutex.c               |  5 +++++
 rust/helpers/spinlock.c            |  5 +++++
 rust/kernel/sync.rs                |  4 ++--
 rust/kernel/sync/lock.rs           | 35 ++++++++++++++++++++++++++++++++++-
 rust/kernel/sync/lock/mutex.rs     | 13 +++++++++++++
 rust/kernel/sync/lock/spinlock.rs  | 13 +++++++++++++
 11 files changed, 95 insertions(+), 21 deletions(-)
