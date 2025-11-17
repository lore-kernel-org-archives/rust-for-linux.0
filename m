Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC6330CDAA
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391165; cv=none; b=AHsgwyg8reHXvOLotnkHVwzRPThfoIX7TKkOPKD7sT7OMtKp1ulokx8hdywdL7Tud/MMg7F457UbZmqj+hzNBsmFmXNphj1LvlkBMVGrag4NoDcIwpZQL+IAedo5rRNxdoDvyU3b6vTOxL1Ft1V7Yx1h8o+XqDaHn3t18DHGwk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391165; c=relaxed/simple;
	bh=fA2FEMUweRcPz/IS7g/9GVFRSo98iSibXJoywA0c2AI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o9fsFTjHfSYWlaBoDgYv/rNoAneNMa7H10wrQAN1C63Ygvyzdh91vX022tJJVhf/OWMItTHd0wKQtvA2C2r9Vad9Io/MvwuVE0jsdBX7zXJP9lPSuetSkZK1CZqg0sFJBCdNNQPAjnajqVluQyIqmiGBJf5aha0+mR73MPElAvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1qv/5itU; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1qv/5itU"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429c93a28ebso3436253f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 06:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763391162; x=1763995962; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DEmDel8YP6SryUyQdLqbBEwquCJ086XrGsRpVZIAPJE=;
        b=1qv/5itUBhdSMOpvX6C78eP/NmFGav1G4/+ax19/jWXgG3szfEtwMgpJuRdVWfBsFN
         iaRzSoA83KDShmMX9Bn0pEpq+06ZVfX+5WmR52YLc+CXQt0nL4MIg6OHld5kXmQhzGqp
         RewL3zXD6dbmQLM00tgb0XKODpxyfBlBcR7hBBgyIzw7AuW9m725jaodss81pSL/uPqB
         AXM+S0ZCnhCTXB5ceOaSF3HYhliSdsBHof/MpqtYdlVopjczc2zfeZO9Gs0I5LRnM5SI
         RyjHoVClR9VuP5cieWhbz6zSEyRAYYEEnzKbks7TFzvTIhkRmCTYUSMTQenEs/oVpHkC
         5qNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763391162; x=1763995962;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DEmDel8YP6SryUyQdLqbBEwquCJ086XrGsRpVZIAPJE=;
        b=FcPJ/klc8wZWifnpkR10cinlNPict1zLl5nh0qj+0TJ9yrKtQ38xt12h0rLBOwwKzc
         zMbQJS0pO7kaz2AEs+2Fhkc72x8JyhgXuEfJKIryx4uh7KgdPDDSZZ7CdH/xQQSPyobo
         B9xrKhRYynDN1GfqOD+IU8zZKkhnkS/pbUYX6+793qmGNmytbBAL8V8gZudXx9l18EB1
         qRjXuEdJ3pHglKgy/b4ilyrNc3Hg+9GY9td2niflF71nqDk6hKD7uPtdAvGjqfQUL6TJ
         VwXa7C6XLZIIdtRKhS8xekLE6n9lFCFO1hTKyqB4f/1zpqcTUlWGGdScf9WjCvPA8jcl
         kZkg==
X-Forwarded-Encrypted: i=1; AJvYcCU1PUFL5z+LaO7r6c5Eq9O6wSGTJenoDbBrq6XgirngolBKCOCCrCLnApvpsrRUC8kfM9xWKEipUQOg5tP+RA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7HJghV9Y7OE8qyK4pfgRLX8h00NZG5m6Pt0V6nyzEDVp8ApSZ
	8/vCeo8hfU5aa4c8wxnXwvfqulLhcUHtmytAAifWORaUgPK9EflXaD/9miESUz4HL55SfJa7pzT
	oA6xrv4PzTCf4VmB0SQ==
X-Google-Smtp-Source: AGHT+IEbGuGz0lgPXN/Q0+yKdln87Gc43i0ZEfM77W4barCcu736JcYss1j5wxMyvW59kDu9IU8AnICCu1X5VAI=
X-Received: from wrrm11.prod.google.com ([2002:adf:fa0b:0:b0:429:c2f9:8017])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2585:b0:426:ee08:8ea9 with SMTP id ffacd0b85a97d-42b593901d2mr12477971f8f.44.1763391162404;
 Mon, 17 Nov 2025 06:52:42 -0800 (PST)
Date: Mon, 17 Nov 2025 14:52:41 +0000
In-Reply-To: <20251117-nova-fmt-rust-v1-1-651ca28cd98f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251117-nova-fmt-rust-v1-1-651ca28cd98f@google.com>
Message-ID: <aRs2uTHwnTm9fdKs@google.com>
Subject: Re: [PATCH] gpu: nova-core: make formatting compatible with rust tree
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 17, 2025 at 11:30:07AM +0000, Alice Ryhl wrote:
> Commit 38b7cc448a5b ("gpu: nova-core: implement Display for Spec") in
> drm-rust-next introduced some usage of the Display trait, but the
> Display trait is being modified in the rust tree this cycle. Thus, to
> avoid conflicts with the Rust tree, tweak how the formatting machinery
> is used in a way where it works both with and without the changes in the
> Rust tree.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to drm-rust-next.
