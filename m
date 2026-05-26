Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF69352C34
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 12:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798760; cv=none; b=hfcqI3ccD7ND5Qasc1AwmI5YQwY+upgeFSFQQo3BalR/noDgZepO7+WjRbjSBQDCL7X2PU+0qAYkzSXqzKvcv8aTIS33Hf3G+e06yOQaOsUAWbc1pwSskSjo2r3u/QHlkvv0E2Oa0Pt5cAM186kw14qObcxzwIEoD9GzyWNDBjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798760; c=relaxed/simple;
	bh=bbvkZlYKOqeCe3/SsT3wqclhze9eYuPTsH1vuOU7iGY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GLUm+G4Vm4tSnJ8zcCjZH6cnj5HXX/7MDaHsF4QhHLaQPM99+3Hk5QV3oXY3h6Aem8dC6dJmKGzJCNtuK1eGAA/0qAyuf90guqXVkYwj48qNl2ux7IdhPVPYeF0DIiwgzJI+jxoP9ldXBKzfQLNWzjH1Yk3rtvaSFHm2vPQZ3vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RPLg+rXP; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RPLg+rXP"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-bcbb3e56f10so173762766b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 05:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779798757; x=1780403557; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bwJtuJV6FGZNVPXkToA6hLSEWjoW3YMUQuWq/eQ+HxA=;
        b=RPLg+rXPVAh7+Lb73IMtPR0+G2KAuk68J9DY9EmdwIdqb8lXx0p31nS/I0dx2ptxD+
         cbk+4oTMWFDV3zB1PZnYjc4mo3Mn6S9ajMffS1P0LoHGOAV90z4d3fuJ/NdWSzSCgDTT
         FwC0CGCDElKkUtEPkAlLd73r8vCp8+4dSK2k4Bj7YvFlFk6aO90iYcZFGPfgrFH56oBd
         mV4eZtOEfzjJAGglhRi4495r2Yc+QvnqhEqn1C2IRQUHFtcFiH798vP8jkChd71Hdo7U
         Wr4k08ZAsplEKk+6riaDTDvOsDILCBgoQHoI4vzHu03WvbNmX/St566NXAQrg3J0wJXz
         6vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798757; x=1780403557;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bwJtuJV6FGZNVPXkToA6hLSEWjoW3YMUQuWq/eQ+HxA=;
        b=PNWae3oPjusOAo3KUvu7sWGzABF/5Pxeow/UE1vlKnsLdImw8Di1m6uWa/Y5G0v8DW
         dJEjmOr0qGENvRtBlXUoY86xnOL5TjojTqcgZ8hZMgqFIv2cjhtBgxkzyZdb6QYsAYsT
         qEdiuClmD9fyb+r1r4PU/bGpC7znCGvndlmMxmL0FtEdxJMJUSrm82spRD6FrFKNFyIw
         ZeQwugRXHa7JY6MLrhTUZMGwYttrDzFTsN0hiGW6M2Jp6WwjLPL2gxszWDbeocoH/Vjj
         Q7Z2cEuBBym7FlvAGpIvVHLooKZL5RZmxvfqkGME3u1PL8m99WV4iBk9grjoa+7iJu4u
         l9SA==
X-Forwarded-Encrypted: i=1; AFNElJ9/6VqnSW/Cru+ECQ8TCR2N+YWX/24frbb4hSuvGbpG00qY6KMZShTwHRk4LOI5Wbfx+A8XyXC6KLTnx3Po2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjAJdTsiFq3lwuD52XgvX2Tne7L/+HooXPTCpIGCiXRl0WlKL6
	Cg0LJkIGAebS45l8Nighn7vmrxhj2v+y5lAAdDv8NrZ1pH8aAan3JPmypzn21lEg3zxrnYvcSNb
	ygUCWKbxTmsQ+L71PFQ==
X-Received: from edwc7.prod.google.com ([2002:a05:6402:1207:b0:688:c517:703f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:b5a9:b0:bd5:7a3:a58b with SMTP id a640c23a62f3a-bdd269b6a00mr791892666b.46.1779798756142;
 Tue, 26 May 2026 05:32:36 -0700 (PDT)
Date: Tue, 26 May 2026 12:32:34 +0000
In-Reply-To: <20260522-binder-strict-provenance-v1-1-3d6e9406e864@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org> <20260522-binder-strict-provenance-v1-1-3d6e9406e864@kernel.org>
Message-ID: <ahWS4srqxLJWYGTf@google.com>
Subject: Re: [PATCH 1/6] rust: binder: use strict provenance APIs
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 22, 2026 at 07:12:46PM +0200, Tamir Duberstein wrote:
> Replace the pointer-to-integer conversions in the Binder Rust driver
> with calls to the strict provenance APIs.
> 
> The strict provenance APIs were stabilized in Rust 1.84.0 [1]. Since
> commit f32fb9c58a5b ("rust: bump Rust minimum supported version to
> 1.85.0 (Debian Trixie)"), the minimum supported Rust version is
> 1.85.0, so no polyfills are needed.
> 
> Link: https://blog.rust-lang.org/2025/01/09/Rust-1.84.0.html#strict-provenance-apis [1]
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
