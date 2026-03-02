Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9C64279F3
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 16:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469996; cv=none; b=BoYyXcYE4JTpZPR2MSf7oEVJVfsCdpKDd5wR1TM/zsKB/cqnzBrVmCcQ883rNFTJD4aGCJecPpoHsuBktK4kPzX4Jc3WhtobUJaVOMiL05R7wBzQ+0V8dd/HUI3U8bXDeATJsAvHyjsSEQi4Nq3A1UpMX09b8lqvzGCXRuY1ZWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469996; c=relaxed/simple;
	bh=4z5K+KiCeElKstJ2uX8xd2HVV2ql9/jQMvYGpgTfM8A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FpR+9Zf/dmHhpuPGHq4B/6q5WnIryUhm3XX1eqnATsS0BE7Gg5Knbm7/oybYUzLh4Z5jybqZB88wg39n0v0Wiq8KP5TRGi3axKznG410dkgKxWcdm5QTtO4dUxnnLnoZtVxHnS0BztqoxlboIYQEkSWfLeTBs9X/nGKZiIbwlqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SLHEuliz; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SLHEuliz"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43999e04921so3029133f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 08:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772469992; x=1773074792; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QYg22rfSXMfwVcQppmIM0Zb0tvFZKcn9JNJPKatkhBc=;
        b=SLHEulizJvXUOww0kxnldZ+9g2JVwDQBsBSM+W8nJejKVyFmpvgfiRFCE2SYb/BVi4
         KbXeFB9naEwkqxrMsPu8Sm8OimloFrxPQi3GlCbTC7txhdm2UAB5Z8J6pVXecw0p8Npl
         1az9OyAoy2n+qDLTEMPwvXDw6FXn73ID+J/Z5CGdTq8OLGSnxz2opSm9k/P7ogFd+iAf
         No5NT8CsC++lie1PB0cH6uX8nN9nr7+RhRXe8l3HmKOWpFCLkrA+xFyNnrz+SOaygSv6
         X9pbmx8tHhGGlSeYDP9svygbKzoMxjOMUOyR5fGG7KczecVDiSohVv8ocrBV31TIIs+K
         cHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772469992; x=1773074792;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYg22rfSXMfwVcQppmIM0Zb0tvFZKcn9JNJPKatkhBc=;
        b=NiWzia4iW/qgDvcvNncSmkm8BTgoFOEdTmcXDp+uh94tXXZpXpvP7Y5KYYlyvQUv2m
         yVLeNXjwGUR5F8fx0HQOdZ+WGr9z8bxPNakEaNB7Ymwf3qq8TSpJNS5n2nU8vcoGNud5
         DPzmRyoHwMaMPBEgieWosUqOhAb9YuSE5s2iHs+hZxfVEL0x9qBxHO5EUDnEetdwG5FQ
         ALJ1hCefiv3Rn60KDxdjIGDtq0TymWo+b6K4+h5GPgll534tFgVbbLjXcubv00H7ORny
         mUImYiPrl5vjk3JzxKHNzBqgy8BZObSmRUPJK/C6Ab0CD43KD8dXY1u0gvoTPTIdOvxN
         nPdA==
X-Forwarded-Encrypted: i=1; AJvYcCU2kKr/IqEoTDj/kDtGSgkuNlBO1Lz2RiTHUNR7Ii4bLNbNmhyI/otHVsebZbLaM4RKWccQCIcK5ncbZF/GKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykYdJSwjz+WY+dU7TjZsBco5wKlMFKy+h7ZbaVAkfJS80tWhEb
	1aRVWpkuEo3SKVmIcsvEEOUpAOKBXT1lcycSV6BRB6RJMeKeZQtW713W7MVAU3Xhu7e/LpRxVSG
	1kGQx3OA1Zfon6qFQig==
X-Received: from wrbee8.prod.google.com ([2002:a05:6000:2108:b0:439:8f84:28e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f90:0:b0:439:9464:ac0a with SMTP id ffacd0b85a97d-4399d97f64dmr22793244f8f.10.1772469991630;
 Mon, 02 Mar 2026 08:46:31 -0800 (PST)
Date: Mon, 2 Mar 2026 16:46:30 +0000
In-Reply-To: <aaW81JU7P82nXNbd@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com>
 <196AEBB6-29A6-4F0F-917B-A042F422698C@collabora.com> <E0BC3E06-FF0E-4EAE-8B7D-FFC1630F537C@collabora.com>
 <aaW81JU7P82nXNbd@slm.duckdns.org>
Message-ID: <aaW-5vwuf97Cpt6r@google.com>
Subject: Re: [PATCH v2 0/4] rust: Add ARef support for work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 02, 2026 at 06:37:40AM -1000, Tejun Heo wrote:
> On Sat, Feb 28, 2026 at 02:35:05PM -0300, Daniel Almeida wrote:
> > Tejun,
> > 
> > AFAICT, there are no further comments on this series. Can I get your feedback here, please?
> 
> I don't know enough to have an opinion but if it looks alright from rust
> side, please go ahead.

Yes I think it looks alright. This just makes workqueue usable in more
situations.

Alice
