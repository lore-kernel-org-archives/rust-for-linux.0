Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45C52F12D4
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898724; cv=none; b=cPswcZ3dsDyjr/TgtYO2PwtpbmfYnOoLkwu2/vs940h1TZeoNlfcP3H7vCqJjpMZgLyCJGPIJx483VR8l0dZJ9KQ6AJ2n7Z2J227ZTR+1sCJLDTnquopCZ2XFlXTd89CABI0w9z0LPwzbgObjO1Rmus7dvmscYo22JHLDWoGqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898724; c=relaxed/simple;
	bh=uGUgh7ki9bLfK3npVskZllRl6/2+3ou/Zjci3ZBF4GU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gI2ZKqt9p6iEXoZa8pHvk0gMnyUt96Wx5w3/bYCHq+NNdV9O/exh65TJWjmgIEe/0y86pEARnxFF+5Er7ffZbP28SXvKe86lt1o6r0qDRQLg/XfhUA2NjO7MxxPsC/ggHXzyKHGJUdFeXVcMjJqLQkoMHVCRcABnNQquYjedjeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pnDFfpZf; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pnDFfpZf"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64da80b3699so9017578a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768898721; x=1769503521; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwzWOY7fBYLDsz0TUsm7RUZKhHWr8qsEprgw8/boGXg=;
        b=pnDFfpZfrLVG09BXlMCEl4cq04w0O9Gw3MyPOWfsl+nKm1anFcXitv3cgIcT2NNW1M
         MsW5b8SFpIpKwL/ig9tR2dI85jvS2Y9ypdEzXUgg8LPnfBZATG0YTe34tLU+SPrp9QLh
         qjcx6nIh8Py7PpqIazz7wDGsMIUvpBK+M6SbdXzUqgg9oyyVrblkO9rHf5JoyVTq1uo5
         4duimCF/Oq3Cm78Lx2N82lhue5VU9n3TEJBoltNHjwtxe+Q4qGgeefElJCs+CObpxtCa
         dsQiJuyrKc/PPEUjcjuO/5Cxw3Cy5qa1wM2HHHWIn5dHJG8va90oxFhvsBYZomwUfBpZ
         BSaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768898721; x=1769503521;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwzWOY7fBYLDsz0TUsm7RUZKhHWr8qsEprgw8/boGXg=;
        b=LI8RGeeduDOGB9o4FSlmhQ320b+hmWdFUXZrZGjEz/l74bifBdQAvbUc5NvLoKQZB6
         thc+66sIHczRAdibjWLjIgcWxhfANo8j4jrVkS977XcMzQPVClDXfABk/g8IfPEIWij5
         xDmn9nGbqPfg0rjPQisWA5p1GhgPCbt7HbwAK5RxZ7tIWw0UV57flwRXc7TYHIZ334Wy
         SlZKjy7MDxej9CI/AWw7LJq7RNid/FW8y37DPRpw2SN7XKznGWX+P0tafcQWI1YfQK7d
         IVvo268HUIgZDbAskARnqKXfzAAu1knRF+6pwi+SzX6jqeQXbjHmnauazNPW1UF+1z5j
         MliA==
X-Forwarded-Encrypted: i=1; AJvYcCXT3oZSjEwDvFcgKyFN/Uo+R0v8TqxNPWBcVppKG/AU/s8vQZN0M0k9aYtpzOmbSDlUr7RgmaU+x0sMYhrjsA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9hlfQznJMl3llS97IO5Z4KJzAm0W/h0q+5AK4pjXl4vq6eHCT
	V3QjPq3pb5gGQ4Ah5+ljmcAwkxxb65mHueGa5QwEg3cCJaeSjBCGQFLvmySyOTmpWP8DaKmjZ2B
	d7r2cdqR78rtZIojrBA==
X-Received: from edsc18.prod.google.com ([2002:aa7:c752:0:b0:658:143:cbda])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:270b:b0:649:81f6:c35a with SMTP id 4fb4d7f45d1cf-657ff4eac6cmr988179a12.33.1768898721257;
 Tue, 20 Jan 2026 00:45:21 -0800 (PST)
Date: Tue, 20 Jan 2026 08:45:20 +0000
In-Reply-To: <20260120-register-v1-2-723a1743b557@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260120-register-v1-0-723a1743b557@nvidia.com> <20260120-register-v1-2-723a1743b557@nvidia.com>
Message-ID: <aW9AoG4kgQhw_AEr@google.com>
Subject: Re: [PATCH 2/6] rust: num: add `as_bool` method to `Bounded<_, 1>`
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jan 20, 2026 at 03:17:55PM +0900, Alexandre Courbot wrote:
> Single-bit numbers are typically treated as booleans. There is an
> `Into<bool>` implementation for those, but invoking it from contexts
> that lack type expectations is not always convenient.
> 
> Add an `as_bool` method as a simpler shortcut.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
