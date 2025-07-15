Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716A623C50C
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752573099; cv=none; b=qzE5SvJk0TL1tqfX5+ViKnd/kRdiSIUGWhz18UETZ2MB0pk5KMtzwnZIA5YRydvMjnWcr5ugZ+P67ShScho5ECrM70M+oUhmCk5zFgMfy7S9vcUkTKSABVQl3QSrAJXuoEKqwrTrxNQG4zjIv4MT31hPoPf45XkXL5krH6HCs6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752573099; c=relaxed/simple;
	bh=Dgs1qIrysoNAg2AOINl2aGEsWRtbLJzCbvAJeqhPM7U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qfa+dkY9lm/io7Koxvn1Aw5jIJ1kTjPNJ9RcxDYXqrcf7NCuO4ljgGoAs/hhyHgceVXAC3DoDFkZqFcTiJryiFpww/8QFXUltD8Ci3SrYI6y4F/r5WIHBQnKO6OkdAa1iwzAWhT++w4PYXb4h3rsUZ1VtMd+h98P3C/z8XhYOCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DjDIuCe4; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DjDIuCe4"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45600d19a2aso25037925e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 02:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752573096; x=1753177896; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+MREHy9J/PLyeRHnyD95ljTGbq1jYjr0lA/qpvqt0v8=;
        b=DjDIuCe4PvIu3nSIlhQnIdHc7ZQV1Qe+wZYnSQGn/vhbYNv8KXXEOGbu0Cb8WyIjqI
         hblAOHc3pjE3V2wSWAg3a72ReTnFsVUqff1YGrLvI/1hrNC44CR5K78tv30nXTALBqVS
         0I7Rf6EWLB05WqE2TBfZIjayJcp0PKgEyp4ofzR9iieYLXoqNdt9dtgSRw2aWQnxPJm9
         308rgP5cuPfT5t2CRaYi5JBmEXKA02Gv3tzFJI99FTZMfRfGrfSz/2qheJVH5f8JkiFt
         uLGsW65mVnZGlU8wG3v8mM/UN7VAJkpx/I7OE6UvJkdxbLdlvMRDe66FwrLHNYSTgJQF
         REaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573096; x=1753177896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+MREHy9J/PLyeRHnyD95ljTGbq1jYjr0lA/qpvqt0v8=;
        b=jeQgCZXDtzMu2KSWTawoJdoRxCI8HqjfJCqMhmhBH49c0QusDUdckD1NAmTJIflM24
         Wz+CFc3We9WbofzdFXNirZOhTo1qE1yHMEodRDCctj/l0O7vnx7RJ+WFGtGNtPwuwCbE
         t9ncFgevFYRk7JZqKrKkMYlgFRbdyF27J6FmJckTe+5HlX/xRK/IK1tjjsFzjuWRFb20
         JOX8eU62AOqIwibtcU2w7aMKBLcgrSjEx2s6QPA55dFg1+tQjOXK7P8jgkKYmcD9QHvV
         8SC9Mc0j7OM0JLrQbgV2aG46QarkmY/w8IWEAK4dBLpOVm1FgdoYYzUD+SuqNpniRE0H
         gnEA==
X-Forwarded-Encrypted: i=1; AJvYcCUauJuQvl2UtfH5x0AlnoVfWXizi4wllyTDLAqrmt58DMxD8ogIzic5gtSYx8EhDrK5AUiMHwY52K0tGG/6ig==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6aLgehI7uFBojpBs8gTUqNrVbUf/GCKBerTQ5R/5d6g21MzoS
	awhXaY2157B36p70KfCxzEKJLKvnD2OIo5kyIyY7yVQtk9OSfq13hpiffF7/YqTDHiL+xeAxtFN
	qt2geSY9Oth3qYJXuaQ==
X-Google-Smtp-Source: AGHT+IGJAP1+ZulutRY8G2MIa1ShjZ+AxiW7jwygp8WNpBM226EVg7NyZcp47KjYiFQoyst96Lw0sqe7m2o1QuU=
X-Received: from wmbdv10.prod.google.com ([2002:a05:600c:620a:b0:456:1ba0:c8ac])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64cc:0:b0:3a4:ef00:a78c with SMTP id ffacd0b85a97d-3b5f2e3b3f4mr12137085f8f.55.1752573095709;
 Tue, 15 Jul 2025 02:51:35 -0700 (PDT)
Date: Tue, 15 Jul 2025 09:51:34 +0000
In-Reply-To: <20250711-rnull-up-v6-16-v3-14-3a262b4e2921@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250711-rnull-up-v6-16-v3-0-3a262b4e2921@kernel.org> <20250711-rnull-up-v6-16-v3-14-3a262b4e2921@kernel.org>
Message-ID: <aHYkpkzNFh36-6Pj@google.com>
Subject: Re: [PATCH v3 14/16] rust: block: mq: fix spelling in a safety comment
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 11, 2025 at 01:43:15PM +0200, Andreas Hindborg wrote:
> Add code block quotes to a safety comment.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
