Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EBD3054EE
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 10:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762771855; cv=none; b=u7MAbnOtmujGz91NAjWR974yEEpqGMgDJdfSnRnQBhibj32sfOiUnnLGdMI9rnqQZ/mjUMBSySXqVir+TJqb3eTR6Ekky3mBON01dQtRO1c1huahe+toNkL8SncIlQNQBQX4dabOld3UmOOMGxK1SSdfIX6hWYsb751pvXlh+Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762771855; c=relaxed/simple;
	bh=QuvzLQvjJhrJPEv2EiWNZ0BlmMA56gk0ZaiE4mu3nUw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EcV2Oy9SDTCGa0zXoNDV7IqZt7eJd3DXomtdWG0atnMEIdPMtfmDEfqYpUHXw4B+3npL/DKQTW97gdrfz5supKwSk6inmsxsCJvls7u/bq+/s17wjBt7tnJL3xhf/GAU13d+aCVTE/E4FSnngMfBgduY6gIfAiZB01NsWSI/uFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZPxsn+u2; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZPxsn+u2"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b70c6ff2639so264839366b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 02:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762771852; x=1763376652; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jAehjyaMCP4/3fDkR7/7In2PF2fJ4VvVwolrpLltF9s=;
        b=ZPxsn+u2ZATM1esOgyuV4f5Wv/lwph1n4AP8h7MO47bSkcn8tBKUIUpPPmZap56jkR
         5DOrkKcZxUzHyykTk+nPKBMs2KEjSt+5mIRh/d4mbVXreOiUi6xxstfpWbm9OKssLcd6
         /k1XA+nI/63ILdM2Bdq5mWrbI9f3Ilmp8gCwnvs7otalv72rnggQonAfuHiQYZ6btYLX
         jto0oAALSW0mQ8903qULfvuaovN7eCdCn+DzVPRVF7EbXnIYxgMKwvb3ssCY2ht5MTXI
         toWFb6tTfMk4hxnUmwIVyd5dKgCSVsi2h52ENzRHblyLgOcXW4AgR/rjtlWBLVdxSKA6
         HHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762771852; x=1763376652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jAehjyaMCP4/3fDkR7/7In2PF2fJ4VvVwolrpLltF9s=;
        b=TV7xZN3d3yolfRFpwtfZe0fhGVD8y0cglun1NvKMURR9woiDV8OyfKKsLlV4TDniGy
         RKTzIJHWQM4W1K0yjNtcdvuYTwnIzE4d0ebSD4p2E9WvXutF3LEX9LfssUaB1oUU32Xo
         mmz6v00y8jO+Yt5Em/1q2xvF51s43MqbaR4SjddyS9QuqoOtL5pK8Vgtn0lDWvQWpNRW
         sExsp2ofYP1V31bxQT0HkP7OExYh+WqHZnVZI3B1g9XG22m+60qXQTELlE/OAFqpMlSD
         O/wgrrloYpM2lJjl4P0kZaix+/Do6txbonWPP2zC34fKP4e//TiDTY6tzVJ2I351ezhW
         uHTA==
X-Forwarded-Encrypted: i=1; AJvYcCWXUjGMW5YSbyDhOv2qr7sD25JjWt9AVPPnhFm9VMrmBZVPaLAZfdL6rkZtQ2gxPLrTz01zyXkGwBCflgzCZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOHEVDvHHZc/ZDOHCyrvg717SMV3ASeoISmkdI23jRKlSgnJzi
	fit4Nce15NE3K8bQu4gVivEWaKl+GcqEbiPGDLbEO1OWJr3yrsgIUqIY7hCWr0Wlyl3NLFOcsf6
	Egva56mp/Kv02G7LYSg==
X-Google-Smtp-Source: AGHT+IHAxf8vIQMyFMTQjQQEpwFvS82i11CDs38Q8zhN6iIl6WZ7bHyAX4vTa1PqPqK6uf3c9yj3YRaeI9ccAqo=
X-Received: from ejctl15.prod.google.com ([2002:a17:907:c30f:b0:b71:a2e3:37b8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1c03:b0:b72:9c81:48ab with SMTP id a640c23a62f3a-b72e050415bmr723371966b.59.1762771851712;
 Mon, 10 Nov 2025 02:50:51 -0800 (PST)
Date: Mon, 10 Nov 2025 10:50:51 +0000
In-Reply-To: <20251110095025.1475896-8-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-8-ojeda@kernel.org>
Message-ID: <aRHDi9phG8iz14SO@google.com>
Subject: Re: [PATCH 07/18] rust: proc-macro2: remove `unicode_ident` dependency
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 10, 2025 at 10:50:12AM +0100, Miguel Ojeda wrote:
> The `proc-macro2` crate depends on the `unicode-ident` crate to determine
> whether characters have the XID_Start or XID_Continue properties according
> to Unicode Standard Annex #31.
> 
> However, we only need ASCII identifiers in the kernel, thus we can
> simplify the check and remove completely that dependency.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Verified that these match exactly for ascii characters.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
