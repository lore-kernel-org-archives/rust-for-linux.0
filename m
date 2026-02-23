Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0312334F241
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839533; cv=none; b=jPL0zpFXpUHWL4uVsgTVqJDlhTT9qV/KnvWQdtQPhdiRrosAmOTBwz5KQ5qKsPyeToPasBnZgzUNuecyV0RrylvhmvXWy7SdaITXSMRqaujimxZ2GalOrgcljBOl76Vz3Y0WOgupnAME8QmFgJGJ+fI52xwLBytJnRJ1nnbEr2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839533; c=relaxed/simple;
	bh=gxy+/s8L6Svy+u85I+jjvexOSnsf4iX1hFPbmrGKxz0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l1eGaacYdoxLTyC/2O8OTaIX8k9nnb+1YdRZg2cMypDyiDN3z6a3pdDiAICsQvnO2a2LjXlbkIQJ5JfYTIlwtEmKfCxDQvU3VFfN8/LnDvHznhoQJF2z9focKPYQvHSRNd0YU0EotUqQeRzhpxDdC7pXLuvxtOEk2dRrsIdqm1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2aNcC1xX; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2aNcC1xX"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836abfc742so27325685e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 01:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771839530; x=1772444330; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEki8/3kEPkYK4GTCiTKeIkEztw6O4in5DWfsgS0OCc=;
        b=2aNcC1xXEm8NcuqFzoXyofnuuZeiu3En9zTHlK8qSaiuwzA8CgBMRMsJpMS7yfAcIy
         5MTMJUfbV+QFjahRIEAN82ph642Zf+GYKAhpg9q9qm3+TejGwIMv5iH1cRXrKW8ZzQzS
         BmrkMvFEkN2nB11jPlxjFc6EADxF2dnAvpy3eCtH8rTprN3vmK+v9wwaaPxSOkHylgqE
         4HfBV91EAQOrh33ZB0YhYtjAMlICht85+Sz8XjHAsHeof0gk0qLFpDITp8GcJukZi3SR
         QacoH5Dr5d204kICahdN61rK/Z7KBxoRP4ckYT9wAkJTCEik63ysBPGaEAzXvxoj9k04
         UHmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839530; x=1772444330;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEki8/3kEPkYK4GTCiTKeIkEztw6O4in5DWfsgS0OCc=;
        b=v/rHIeePeLb+UZDGZtjJatkCF66Ijy3LJGk7p+HIHUooGjJ2dJC6UD4iNSHQUMcOo/
         eAQxyjOqXxfm48pf5NfXJKzn/WgNFp521oHZqwGZUwSgIO162V52H4WG9jS4H6rziXNh
         gHX7+bGUa8JbW/TUj/JzwYPbv2bUwYfFyVyi6egIU9YhZM36Ob/0HjVsL8BDl+hWBh0A
         sO9p9p4/kTQawOqomnryxnR/V9qkmL2bTc1bWHjfhXtezDkACsujQvo2R+g5PW84t2E4
         p4B/owyj73b92egmU1P99AhMQd8rkh0P4tKjwZHC19IJfOcd8K2zxqs0X7JaC3w8QYux
         YWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVorMABMBJDkUzi/4Z4oB5CVpEDOBjIJ52fPkf7Cwvdiz7hz5u5CRU5n4qZhUnxRIxl6ut7ypfZnnHIhmEDCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFytF/u5Eed+9L/fF2/AkpP7Si6T/vQKy07+ZJqLy/MUgX3xL
	1q886Ru6bGUYvbl7ehHcl4ee7FnndSMXo7cBSy0n+MbWeaWXOTgBRkwTrf94oWPqYxPRFYghhjP
	9vcMBN9MXmI3ZFh4jJw==
X-Received: from wmg8.prod.google.com ([2002:a05:600c:22c8:b0:47e:dc0c:276f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8d:b0:47e:e779:36d with SMTP id 5b1f17b1804b1-483a95f8bdfmr128430325e9.23.1771839530398;
 Mon, 23 Feb 2026 01:38:50 -0800 (PST)
Date: Mon, 23 Feb 2026 09:38:49 +0000
In-Reply-To: <5523ddd6-fda1-445a-9235-54e778df2694@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com> <aZlz49VtPA0JbEGx@google.com> <5523ddd6-fda1-445a-9235-54e778df2694@nvidia.com>
Message-ID: <aZwgKcdEnSHyuSLG@google.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Content-Type: text/plain; charset="utf-8"

On Sun, Feb 22, 2026 at 07:41:44PM -0500, Joel Fernandes wrote:
> Hi Alice,
> 
> On 2/21/2026 3:59 AM, Alice Ryhl wrote:
> > On Wed, Feb 18, 2026 at 03:55:03PM -0500, Joel Fernandes wrote:
> >> +impl CListHead {
> >> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
> >> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> >> +    /// - The list and all linked `list_head` nodes must not be modified by non-Rust code
> >> +    ///   for the lifetime `'a`.
> > 
> > I don't think C vs Rust is useful here. What you want is that the list
> > is not modified by random other code in ways you didn't expect. It
> > doesn't matter if it's C or Rust code that carries out the illegal
> > modification.
> 
> Yeah, this is true. I will change it to the following then:
> 
> "The list and all linked `list_head` nodes must not be modified from
> anywhere for the lifetime `'a`."

Ok. Perhaps you should say that it must not be modified except through
this CListHead? I guess it depends on whether you want to add methods
for changing the list via this API.

Alice
