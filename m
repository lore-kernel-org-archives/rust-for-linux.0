Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D671DDC00
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Apr 2025 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745402437; cv=none; b=L4j5Yk45cBHjkbRfqlqO053YuHHHxsPZD13GtqRMXi7SIdaQ8Jl9bHl0Wn+zNpj3ml4h3hRQUFskZ95FKjvt1B5wbPDXa4IS3WJCp4AgD0dnlBoegXrO9RabuM259MdsKoLe+yKo0LmeG88xbmepZ3AHUS5Fjcz9sviKsJL2ZSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745402437; c=relaxed/simple;
	bh=VgzYbY0oOhWfmqo7f+6XzHFZWCjo8IMXixxTGldAmuI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Fwn5VsXnGK6Ow8N6fYNHKwSNVrArhCoe7QhnfoxOgaTHMFKb3FLHEpVFSQcRh3HIs3zbl+wR2U4Jybzhq+iQVYjwmcbXnYR/+fjX0PhcMr6C7k2dadtM7EG2UfMSKCsUwA5VUP3um/+/LiGvFvhKK7+vwAGNcnI+p/4gWKMPkh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A4SaYjZo; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A4SaYjZo"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so46252825e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Apr 2025 03:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745402433; x=1746007233; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XeRE/uyP2Ylb8d6NxchTPtBgKowZEwY+2L9eBaso3Eg=;
        b=A4SaYjZoI2AGShlVNLhny7Wgp4FbfOa79vLP6K8T580F5XaCVSG0vhBPK6kbBcFQVS
         g+Ao4gbm+PqhJ3dq/eGw5L87mJhPy3ff1sp2nSvt2oh3tA1in/RHZYNMrkhlrpQkGAeq
         fm4NsHFlNq+W610MybNYJ2ORMKcUw7dhBW8Pxc6Qb4q1GP0ae0NtT5QVeP68EB4ksJjH
         BEzLLy10CNHY1KT7UYp/egAwUUfGz7jPyYcxxRaQur7zrUPlrCoDqKgjcOXARZ7tt6DY
         Lha55UdZd8LIeLwvu/QhDCjy3aW0o603DzTD5rCD7R0TEolnNsgTh6krgkQTbJEHQ7XX
         jrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745402433; x=1746007233;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XeRE/uyP2Ylb8d6NxchTPtBgKowZEwY+2L9eBaso3Eg=;
        b=MRcK2Ct7DwHhT89/sa8MO9zOhn/p2VgZkwbWLNvX1YU5V95cVqVBGGT1KF5T2JnRCR
         sG/B9OSm7PqlqZ+J17eyICdHmrDI2RQyGMNAw5dNd6MxOBFMEmWHNu9qdepQRPH5g1aX
         EDDieCLi1s15/6BxoMsaH/2rCTy9Swz5PexFCgRS6PDhdc/GOFWpiJVdmLdVJcDKZO9H
         cxpSHKCnNCzrGYvxX+AAEsuhnD3aLwlP4DQD+c4XgJcYBzw+F6OmlKJFEoV5BF6fJ+T2
         LoA1bHl0Tv9/dzTkc+ZrpX7En3vJrD9XZCesTXJw3iEanUWwculPUbKWPrSn58fznLYg
         ispg==
X-Forwarded-Encrypted: i=1; AJvYcCV4X3zMdCIXGdZCnQKDdYVYXGbHb1//889/P+heyjmge04bFnOMK4Eg2Zyoa/6VQyT8cuuSR64vCQQt7Imp4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGJBcFR6TrFRHiHlo6ESvIlHDJVvBINbLOVMEAytZ5vXTs3OR5
	kSl+z2aWhTJ7UdjuGy+Ol3MAqdSYZkwl0+e/+l1gbCcuOzfA2lt+HKMQuvPa63LM1uWNQ6zGbp4
	SyxoZ//VYgD7sIA==
X-Google-Smtp-Source: AGHT+IE8mnGfPAG4LipFCzdCtOArBissv+D7h14/rFohxgGLky9bT/xZR5pOmCnrj4oVc2Xdby8XmMUnBg/Gkjw=
X-Received: from wmqa6.prod.google.com ([2002:a05:600c:3486:b0:43b:d6ca:6dd3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:190d:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-4406ab67e15mr167894105e9.7.1745402433158;
 Wed, 23 Apr 2025 03:00:33 -0700 (PDT)
Date: Wed, 23 Apr 2025 10:00:31 +0000
In-Reply-To: <20250416-vec-set-len-v4-1-112b222604cd@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416-vec-set-len-v4-0-112b222604cd@gmail.com> <20250416-vec-set-len-v4-1-112b222604cd@gmail.com>
Message-ID: <aAi6P9R7KJyZdzis@google.com>
Subject: Re: [PATCH v4 1/4] rust: alloc: add Vec::len() <= Vec::capacity invariant
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 16, 2025 at 01:15:40PM -0400, Tamir Duberstein wrote:
> Document the invariant that the vector's length is always less than or
> equal to its capacity. This is already implied by these other
> invariants:
> 
> - `self.len` always represents the exact number of elements stored in
>   the vector.
> - `self.layout` represents the absolute number of elements that can be
>   stored within the vector without re-allocation.
> 
> but it doesn't hurt to spell it out. Note that the language references
> `self.capacity` rather than `self.layout.len` as the latter is zero for
> a vector of ZSTs.
> 
> Update a safety comment touched by this patch to correctly reference
> `realloc` rather than `alloc` and replace "leaves" with "leave" to
> improve grammar.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
