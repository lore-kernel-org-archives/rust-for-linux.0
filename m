Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8E327F00A
	for <rust-for-linux@vger.kernel.org>; Mon,  8 Sep 2025 19:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757359687; cv=none; b=mdIMT6zGfbhrtmv+TWFb1O4qCEjwvTDwPosVPJQigBce318oQWtwjdiKX4VmTfekrZGTcX5GWbMfg+P82rF0C5XB2/nrre8DAPbooOuK4tQmTxiVlblSeMzhRkCfJ7NNRpQMWFEY6vq5EWt+00xiYHNHFiq63qRY7l+oJ6joCU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757359687; c=relaxed/simple;
	bh=IwzT+Cj3vKjQXDtweiY90tEcLiTN1PTMTj9KvvTvN0A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fNWGk3sjbFufO064aL773Ae+4VWcj97XC8CFEAeQllKfagbXRFhRUpYlKFkHdhP1i6byu/U4158sW9ZtfU2wqkq7ALTBwzFnrhK2Q7MCYasMkFYQYkeRAvbnPhRaa2Oq/itRDeS9aw4duEYKrxD5qFRLKzRked2OXIJIxK1l1Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2GClOP2p; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2GClOP2p"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45dd66e1971so32332765e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 08 Sep 2025 12:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757359684; x=1757964484; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+3QNBaTQJgfz15TsSjoGU8ORJ1OjGmgVk1ehgr+kcg=;
        b=2GClOP2pcieEUZqWN2x+Z+PQtPWrpvjLNAG182fPteyNFFq/3P+tcSl4cZeFgFUi6z
         3nVD8nVy3qEuxrTO6gcIqrF4mNcf3Kj+4sthghgkn4qict/xt4minckgS1Wc+hSxqN9X
         81bYWcPRPTVS6Hd+oSaA9PqBEwKTLXHHXrjkyWwsATf4uKRnApTKxwVNaNRUMBKwBhSO
         h0XLwkmiQSO9O86R4J6QqAoWL6dkk0YC2jjrYvikJlVu0QubyH1VPtO+VqMknCxCvHnN
         nHPnwWRqsO0vxMxoqgskgVceXCXa6WW5obpctpSHWh6RE9TVVgDH3xXSXhdMy3eg7sp0
         g4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757359684; x=1757964484;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+3QNBaTQJgfz15TsSjoGU8ORJ1OjGmgVk1ehgr+kcg=;
        b=fOu884YMSYhLFDshNJwgTioIq6O8GTOZh1RSlkyJ5Je0FYU7Tpia/khspV40/VKbGc
         k2JgIrJBL7OC4ab6iQE+JKP9ZXz+fOP/nAUMeN7Dm0frYat4dSmSDOdOb8E2HRmBfLRb
         BBk2Q3kXYnVMtLAParHdTYraZQ/2pbsUuefr3rtKrlu0ekHQsrLH6v1g8NyQsRyXl7EX
         mbEs+mIIVb10GHPJiWgAuJ1z3shtwyMcIJJrvZHAig+Lyob9yWD9o89i+zSft3YKQg6A
         wWrd9bFMbWqWVNOz4sUXkYay0gyz7307HkRcZPMpWhHU13xUDz5DkIGmyIJRZ3qUVRDv
         fQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlLIxaobzpYB8dIupTMsC6SKZZBXXJRSfUsutY4574B2VETvulfofAwqd+lcFNHbadks+BY0km6spWmWU/+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzc/qR4T5Qu6z7mgMgSH6Zn3F/xIyqxuYO8jOa5ROuSnhd3wo2
	HR3hNuouUxsyaf4Td03jSJ4vlKo6IUlTf2Px9bobgf2ialZYyLOU3nkpIsJy/E1tQFU/fqzfVAz
	1ZZgmVZ/pra7y/fXbiA==
X-Google-Smtp-Source: AGHT+IFsGy3BK+rpfmh2eok5bxbGiydxmKX6W9RiDLPamNcZgeW7/725lG44A9ID/LIfYITD8hQInUcAJj4weJs=
X-Received: from wmhx22.prod.google.com ([2002:a05:600c:4216:b0:45d:d39b:53ca])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b1a:b0:45b:627a:60cf with SMTP id 5b1f17b1804b1-45dddecf404mr92465225e9.24.1757359683889;
 Mon, 08 Sep 2025 12:28:03 -0700 (PDT)
Date: Mon, 8 Sep 2025 19:28:02 +0000
In-Reply-To: <20250908185239.135849-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250908185239.135849-1-lyude@redhat.com>
Message-ID: <aL8uQs07sFYv5bNm@google.com>
Subject: Re: [PATCH v4 0/3] rust/drm: Misc. gem bindings cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Mon, Sep 08, 2025 at 02:46:35PM -0400, Lyude Paul wrote:
> This is the first few patches that were originally part of the series to
> introduce gem shmem bindings for rust into the Linux kernel, which can
> be found here:
> 
> https://lkml.org/lkml/2025/8/29/1533
> 
> These patches don't have any dependencies besides needing to be applied
> on top of drm-rust-next.
> 
> Lyude Paul (3):
>   rust: drm: gem: Simplify use of generics
>   rust: drm: gem: Add DriverFile type alias
>   rust: drm: gem: Drop Object::SIZE

Applied to drm-rust-next. Thanks!

