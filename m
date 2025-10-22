Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EA13043CE
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 08:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120876; cv=none; b=GyzYH5PNDkp27MTy+u/xqyQX+NdzYTUc93NOsynX6l35tzOzYQcPVdtIA50vSQAfOGlQJXM69jfLBUX5TifFsYSmdBU0/LMFyW1T9CyvofL8OtfrpQAWwHPxjNvA7oRSpRaMpYuiDd/vCSiN5+ZZ9cx8DA+/f7ot94NTLAGGguE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120876; c=relaxed/simple;
	bh=nDmcqom4nRH1kg8OrqhgJ/APXOzAvqbtVdtI9YTYb/w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dvrHR2nVD+pVMlonaF+skDWqQ3WBvMtRguo/tk75VgtTM2fFgl2EcUXa0GPAv3+I5500kXFQvvYxIbGAqRo7W1nfEjOFV36YeGmtqVdduDfHZm12fjdoCGFA5PYzZNOKTXpan+bKK/ALeK8HW23i4vP3OH1KHioLRPDWBxP/aiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1VWLxkLz; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1VWLxkLz"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46eee58d405so33215135e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761120873; x=1761725673; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ogsn3X1mobn8/e1uiGkS9XQJsz3R6ivSIjiDXFm3+Q=;
        b=1VWLxkLzd0y2N/vipoDX6gubUhI1J9Uq+NBzcVpmjU45fBdPQ8wI7HsotLqO/dEe5u
         GxAfjYXzFhEgPDw6EhCb4UqLLTXUDoYJW7SwvkJp6z9u51+lmtEUJ8UMk4H43XMUZJjq
         TM7udf/bDj1U2q8zPZel4UBB4olVLrWlnAiTjky8ov21Nv2uFzNJwGpsgtSbcdBoyyth
         88zi6VAQZEH7KwLwnVRcPSKQjqX23KnmpDQZ8pwzbk5ry6Ypu4tCEqtp5TBtXeJ6kW6N
         3KZcNHsOR8lKcqQhu0Atc1DWEvcyL6O3aRVi0a8wDuV1el91WWO8Guo702K483Qb8jkP
         YG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120873; x=1761725673;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ogsn3X1mobn8/e1uiGkS9XQJsz3R6ivSIjiDXFm3+Q=;
        b=Sf2kwX/QmB2y6XArFnizpFxj6K0Qa4YU1yAY03pKrP/LvojJzHMfDHfAEq5Gx5YV0/
         ZJeEgxCNuadaoB93aMLCI815pNqI4OQuC3sZGUCQR/Hs36I8tBy9Cqg7pqvSZc+96vjY
         YxSbzXkcDyiQFigp5TOrbu2nvrrhLBxtTyaHpDntmQ3bTPf46q1EJEFWWmqDo+IJ061E
         QV1gwkbo+yoR1zESCMZIqaLCHijGpKu3F8VoKopxuaVsSqH8+jYm3oYWhxPxUF4UlTlf
         zLEBISZCqLDlp7UNPBSER2vNDDmLpODfYYLeYl6bN/iqMG7xml1PZvQLPp4esYWdP2YE
         aRsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD5MQJsVYztp3HLzpUZLcmTYtKG2KT3gE/q4purOnx7wiTIzM9RIwtXNRgKkQQgUvPqdMMRhM1mmujHea29w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxkhO1rNrZgdvSWYyMJCHVVCU8kF0wNGPkddKvyHyRUwUeeMua
	BKAokgul1KlylRRK43JKSQ7MqM45Zma1mt8Uy1bhJ4Z+CzJUOPNJ6b898PnG1p8itNaFcjPXBtj
	aqWA4+t8XfzMTSkDcdg==
X-Google-Smtp-Source: AGHT+IHVymDPMVFRxtz+pEpsqCDA+1l2F++eBCPDtyYxS79P5clFYGmutl6mMG3GyLc2Iqc0bUnGJy61wcbICgU=
X-Received: from wmwr3.prod.google.com ([2002:a05:600d:8383:b0:46e:1f9e:6471])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b03:b0:471:15df:9fc7 with SMTP id 5b1f17b1804b1-47117906a72mr141554885e9.26.1761120872959;
 Wed, 22 Oct 2025 01:14:32 -0700 (PDT)
Date: Wed, 22 Oct 2025 08:14:31 +0000
In-Reply-To: <25717cdeac76376fbcf7ba10a1b2e855800d3778.camel@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251016210955.2813186-1-lyude@redhat.com> <20251016210955.2813186-3-lyude@redhat.com>
 <aPJDGqsRFzuARlgP@google.com> <25717cdeac76376fbcf7ba10a1b2e855800d3778.camel@redhat.com>
Message-ID: <aPiSZ_CGLD4o755q@google.com>
Subject: Re: [PATCH v4 2/9] rust/drm: Add gem::impl_aref_for_gem_obj!
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Asahi Lina <lina+kernel@asahilina.net>, Shankari Anand <shankari.ak0208@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 21, 2025 at 01:33:00PM -0400, Lyude Paul wrote:
> On Fri, 2025-10-17 at 13:22 +0000, Alice Ryhl wrote:
> > 1. Annotated with #[macro_export]
> > 2. Export with `pub use impl_aref_for_gem_obj`
> 
> I assume you meant pub(crate) here? (Since we don't really want to expose
> impl_aref_for_gem_object! to users outside of the drm crate).

We will probably need it to be pub later when we split up kernel, but
feel free to put pub(crate).

Alice
