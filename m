Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858626;
	b=It2bO3S07LrhF6z948J2kIFOt53x4l+l7QSrrhCLhIfr0Uo2wrqLc1BLBE+Ec6+odItz
	 RMusdfXc1wToEJk3Yd2yHexs9CLGAjISsn/8F6ZnzyFnEgjhKRcck7ENxEUesQPLy9gXE
	 wynY8RuqzM83sD4giotlv2Ly2w683ITBi/qjPmxZnijnBGg2va91PMFd7wkSbDhH0khFJ
	 dCTpHHz25hGQPfXAUNtcrWeJoIevztwOb1qk8E2sNx1KAXzUTkVJXWMRpmk3YMEAhS+Lv
	 KqIUbI3KRyUZw4gdSN3RSb+WB+s0C3r3yYIC8OPO0x+VJiNG3S/xmGHGe4T8CABgFqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tcLO68CSt/fn/aruBlJyttBvDc08aJeTjSqJH/iM54g=;
	b=VNZ6en051YLRVc8dHUu/nbHV/BpxZLLY4gvZ0v7BFLmoaRbN9Q53l2tnFs2puJmx1JiM
	 KnZ/oiUv2bwMAKLizzhkTDiSBrEHue18hY4w613NGok4BLIV2ZmoCWT/GlMdJgi8wdCEP
	 0FLjzQV9QQFmoUQ5FZyBYrlgfyYax9bf9PC3Lpsq/5TrOB4QV6CL4ourSpyjkE6+MaRlu
	 UsNkEhhEHSnQ0DFO8R07Z4xBRC6Jm/8hvOuEXpS7PaeA/D3JVoZxsM9kPsDbtqm+pBr/t
	 j0Gowf/RTd49Hy0PHumV8i456ctUhQZBSl88ntp0/HXtcmw84vjrXLJOnPepzIZ0x5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iO1wfEH7;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A00606A323
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 19:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A00606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iO1wfEH7
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab4354db11so39842601fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 11:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794858624; x=1795463424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcLO68CSt/fn/aruBlJyttBvDc08aJeTjSqJH/iM54g=;
        b=iO1wfEH77BdvTe03f2vR6SIZsaqxqrzv/hspvJcji784qZYr4ktfe4ZXCJwRCuqQ7x
         tr7FxVtKa5mtseRn2IsWjGjfdLyk66TwELHGvmCiSAlfa/cDRNy04NklFAloasnXdvE1
         71Xyn2JmmZ2yM7X+KgdCKY8+/0m/pQloM6siSYjOj+qgQ19n1aKUg6/vZ4RbLG1UcVKT
         tQoVYkn11FysKnWgYJrBtiRkMrnyrVKtokOYoHAtkVHzrdMNQgRjzNfgEJg89vctqcGG
         UlVkWBPabtLgacvTwJreKg0lwW9ZSaCnB9KKkLqs6k9+KfNkfkLg8d/lfHb1cTxphdWQ
         UgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794858624; x=1795463424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcLO68CSt/fn/aruBlJyttBvDc08aJeTjSqJH/iM54g=;
        b=UpZuVgWf6xfpnrlWhfhjhFQyHzU/uqf8kcFpDO4X/hpq1E3fKok+GMzfZz85YMYMVW
         4HddEZQ+KMliGyqRKIYoATgJEy2v8nmL0Gu1+dTdhGK0fOKTuYrqkIdkNaUiKOt1h+qp
         2wH1obVP4RlLrk0FwMZXslt3zLtsONoGYEBQMcvyj4pwkvfZ8RMiYna+yY6ziKA6oL5Y
         TnE8z+xyYENKSUxNAIxwZmBAUtpvXRmVWA9JPl4/JqgNkLtZkc4SCzP8uCczmdN6btMA
         vK1MatChpxW3qFFUVilqq45v2jrC2IvXOvVhFj/8ci2+uasNt/Fa46mDgrrqOZet+VFd
         Mmug==
X-Gm-Message-State: APuU4Z/vL/kmC6CP4nKVYJsnEWupVavUOGokZrRSdO4XO/lS/Q/f2iSa
	C0iatOxBBnhzUQq3oF67rsuTcy8msROyfCKA4mrg+N2C9hmw8DzbyQ5eZYCIBdS4oQ8=
X-Gm-Gg: AYBFou11eRYsYH8mWSWeMovelILd8sAS3bGiFyl9kUDFBpscPyoWguz1frihojT0sln
	ry3STe1hqx3MWcp7TnG56jYBSeOWr0+u+cE3sG2jzyOov2ryXoaxfmln/Lw1zrRhZWpO967/Cux
	qEJyHxYwWG8vYr5cSawkJuKlQ2O6EbJSfRFb8oqpYHZriuLfdRftWYEprIQLw6kDbprtr0WN9lA
	h8uK8i43RHfRx/J10n7eJwP33YI7QeiDjrpgF1Ek5xdWtTF+xyFya+ysXclf3w8oLK1atLAc60k
	7QAUymm3KCVVyEOsxsSnZQlckSIXL9ATdycUPrHkdgqqJcWE3AW/Dss9UQGvgjl1epBJjFMjCZQ
	dNhFJB/0A99DIZcuLvJhBpTA+SO/pxW1T0Fsg0GzMihzIBj4uH8uGBJbM7S+d6dg/KF+roTmN9P
	I8EZ0fVY6hWEJJ/T06tUz5e6zLK0Z7SnK4AtohD1esckUiEMnd15s9Khxx7YkRFJQ9UfcXvVm+l
	X0UBJNIDBH0CRCiUufO9YXIUg7EMLIW5y3PrDZVu3M/DwF7rmpkdmKZ4qOPu5FkL9G271f3srOw
	VqO6i81RjMCBDNM0AwP2n3BffOT+g00AmSY3hgU=
X-Received: by 2002:a05:651c:1445:b0:3aa:fa3e:21bd with SMTP id 38308e7fff4ca-3ae2b4bc383mr36582541fa.12.1794858623655;
        Mon, 16 Nov 2026 11:50:23 -0800 (PST)
Received: from IuseArchBTW ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d1ff0sm35700701fa.32.2026.11.16.11.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:50:23 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rust: sync: atomic: Update safety requirements for `AtomicAdd`
Date: Mon, 16 Nov 2026 21:50:08 +0200
Message-ID: <20261116195011.24156-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `# Safety` comment on `AtomicAdd` contained an unresolved TODO and a
broken sentence ("...to must yield...") without properly defining
`wrapping_add`. Remove the TODO, fix the phrasing, and define it as
wrapping two's-complement addition (`v.wrapping_add(delta)`), which
accurately reflects the behavior of the underlying integer primitives
since `AtomicImpl` itself has no `wrapping_add` method.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
 rust/kernel/sync/atomic.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 6d27898add42..5f6491fafd34 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -127,10 +127,11 @@ pub unsafe trait AtomicType: Sized + Copy {
 ///
 /// # Safety
 ///
-// TODO: Properly defines `wrapping_add` in the following comment.
-/// `wrapping_add` any value of type `Self::Repr::Delta` obtained by [`Self::rhs_into_delta()`] to
-/// any value of type `Self::Repr` obtained through transmuting a value of type `Self` to must
-/// yield a value with a bit pattern also valid for `Self`.
+/// Given a value `v` of type `Self::Repr` obtained by transmuting a value of type [`Self`], and
+/// a value `delta` of type `<Self::Repr as AtomicImpl>::Delta` obtained by
+/// [`Self::rhs_into_delta()`], the wrapping two's-complement addition of `delta` to `v` (that is,
+/// `v.wrapping_add(delta)` on primitive integer types) must yield a value with a bit pattern also
+/// valid for [`Self`].
 pub unsafe trait AtomicAdd<Rhs = Self>: AtomicType {
     /// Converts `Rhs` into the `Delta` type of the atomic implementation.
     fn rhs_into_delta(rhs: Rhs) -> <Self::Repr as AtomicImpl>::Delta;
-- 
2.56.1

