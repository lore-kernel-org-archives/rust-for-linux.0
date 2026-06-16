Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A043BB11B
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610633; cv=none; b=JTuRU5uj8q2eeXViHGyCphegTPcQBVvx+vjNuOErKkUzQj761P5jKL29eiKPU8ZPIMKVcpFWmQn7gJMyd4DH9idXkr9HdMlav4M4vOzP15JOZZQhS96vs88oHXWYxZpfCbsHDbzM5/yz0q2FpZJc+UDzHBhqkq6x1ak4QX7yrfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610633; c=relaxed/simple;
	bh=TObrEHhKuPNM42P0oLKIGdOx5sA4x16gAm9/x6UBmOw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hguJsjdmYfNNoEHSaVUa0sKmkM+TIBC1AOlCUTsNRMCsiUEBNhDg6VA21C70PSWAAtyowp4O3FPcliAtvZUJrfPnHF5M25yOGyjZ9i7EROGaImvbLnmku4dkX9ijpTiTKB0zmi6Pf33KL0BAIE27JYWzdHzFY9g2q3rPz4Dt6Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NuZOhfcZ; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NuZOhfcZ"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-bf523c6dc90so439205166b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781610629; x=1782215429; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcH8wbzZOm8yn4lLoAkAwb8V6hZltU+bJ+2UV9XpA9s=;
        b=NuZOhfcZrHteFgg+qVuJKf/u2zYwxMNt7M/+3Kh2WGKDHOK0XbwQU4TtUudSmIqfHp
         3d512sWF3YSKCtWQ4TZV5MeKudggeHCDoqM2kGKSS/6vct350HmOXUvKVfl2WpMkekLC
         zToUW0w6iHcPVj0SumIP+N2aMhFr8Fc4DCVBRZeUMJce0W0vsLnNpyaNYZOpNvfxOGkR
         n/gnavsNlF7llBohUYrKUQmn4UGZBkm4RxyM+ZAD8yOKsL03u8u2+w0jF76KFxxuDvGe
         vfBu/tdAI/YA/CfT/0uP87PxyZVwq1No+5SIzDm1wxIn8DsB15iFz9+PGgfao4J+51Qz
         gdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610629; x=1782215429;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcH8wbzZOm8yn4lLoAkAwb8V6hZltU+bJ+2UV9XpA9s=;
        b=gtrz15PsXhhgrMl9O7ZovI6mMBXmfd3u8qZtNGSoGhtc6U7GpTL1yq4FQXk1Z/a46X
         aJ7EuoIWThFQ1MpQlz//8vviqH2TnsrXMf3M3jFLbFT4tXLZ1fe6oRsB1Eogy3CJAhSs
         R3WPU2kLp3TGzgjiFmV9Y5EcGD0ZlGazoPKOUHbz/1MXKttkBg+FXdkylrCFgKF/NNyP
         n72aE5hNnKEMIJ3HprN7eTt1E4anB9yU/154hWHBC/qBRoVCZJv6DSiSR8R3z2H4kHDb
         RjsdaswozniIGGn0hdejJqVDJFvTbeGSIJGKB3wY2wviKyqkoGfzErs211H5j3xGLmZm
         REsw==
X-Forwarded-Encrypted: i=1; AFNElJ+i+4C5qRRU5TLilto70w0sQPCs8m61PpjYCfbzBu37PJQg+S56ospA+PYZWLPFXyI35w+kbuFdgJ/hoKGKLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb35voMDqMHQHCvle96ZOorKeMcHmhLxLqHzfsZ7mFobSG7RT7
	Xv6RT0R8LNpsPSDAA4yLxjiqpvPWuwZVZ6F1XTHQYKTOiOy5GIWLaUASa6Sa9syGzU/dZybpJud
	DerSRCGEsSVmwcEIBBw==
X-Received: from ejfp18.prod.google.com ([2002:a17:906:e92:b0:beb:c99:aa2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1dd6:b0:bed:9a7:5ed1 with SMTP id a640c23a62f3a-c043a477df5mr130254166b.5.1781610629337;
 Tue, 16 Jun 2026 04:50:29 -0700 (PDT)
Date: Tue, 16 Jun 2026 11:50:27 +0000
In-Reply-To: <20260604-unique-ref-v17-1-7b4c3d2930b9@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260604-unique-ref-v17-0-7b4c3d2930b9@kernel.org> <20260604-unique-ref-v17-1-7b4c3d2930b9@kernel.org>
Message-ID: <ajE4g7JsM6bnpEOu@google.com>
Subject: Re: [PATCH v17 01/10] rust: alloc: add `KBox::into_non_null`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Serge Hallyn <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Igor Korotin <igor.korotin@linux.dev>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Thu, Jun 04, 2026 at 10:11:13PM +0200, Andreas Hindborg wrote:
> Add a method to consume a `Box<T, A>` and return a `NonNull<T>`. This
> is a convenience wrapper around `Self::into_raw` for callers that need
> a `NonNull` pointer rather than a raw pointer.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
