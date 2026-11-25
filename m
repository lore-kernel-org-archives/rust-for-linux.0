Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605154;
	b=psYU/mmnUESsjAIe7KMo5aOw6y9PpN2wzjOuS32ifZaqMCxKVG60LegFFTgq8nLKULos
	 WEbW+guS13+aLMerV1khd7VtvWVx9erxGzUowY7mno6FKETisVq+O/pIbpH083wWy4L3x
	 9CiF8WQLva+mi5wL2He5Ussg9F39L9LJjic7g6QEhCzF7MW4v9MPJvS09RAWVdZXe2+md
	 9RK6xDYWMTtxPAK4+zNPTK+JDIWX9bJCJxCxkTQ5CaUfEHhBkJvbOC4d+frQK3XaBOnJM
	 tlLPK9hCcjDKi+pMvOkKzZ4wcOhC7vmMCXqp/xbV4mKsfNgH9Qie9DqN9TupoN5VQLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=lmO9qlZWx0TKcaEyqSHqDwn9dZMk6HPcgLTZNeLkLbo=;
	b=WD4gvfj6guuounzWrpveH7ZzuQ1nezuB38qadQPq6s5qudMz7aNNZOfEWO13t1X330Ak
	 o2/arJqgSwWmYuA4FGRsSdTpuZs84zKuVHNYUomd07SSdVOThLOZe5sHYuTiPZKfOA9nc
	 CRHoG5Qf5ZFfD/qMSnVpIur3Mr2UXzwaTX0MrDeSneuvoFN6o2BQ6rpY/KkGH0QczTs/b
	 bqfklRBYdCE5bVdhvQ05mWVf5RYSG2EVezmhO9zMse5WKaLB3EoJtsTAgm3p/Ia1c6rw2
	 ieZwO8cfN8Ki8+FYZnmopEL5SsAdvhtk1y8EBVBxfc0/ulGft08qiQXi31uISVFrjRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NWMxLyQp;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F55606A32C
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 11:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F55606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NWMxLyQp
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4903fc8537aso3746048f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 03:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795605152; x=1796209952; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmO9qlZWx0TKcaEyqSHqDwn9dZMk6HPcgLTZNeLkLbo=;
        b=NWMxLyQpoPPny8w0k/sNJG7mdgkvkReOLIELehJK/e+4rGbD8J9jG2aKb3XYfOOdTz
         hH35qaLmPkG7tvE7RqXNQMzo2BSaRAw/A7yU7FubY9nHhBIC93TC6s8J2a3gpJFPk/tb
         XR0Ey5HSYA9Zwz7ii9iMR/qzFwVk1VuzcXHaVtzf1+oCb4uo6e8ZFyoo+NowU5l5WUkD
         VxoJl+rt+sJ5u8a1rbI7TvpTAObn9gUhfi/172MuHRScrj4sQD6dXVIa7QkGdNHr04sf
         x7nO3XIZH9VaGQbfQOtu+PKzRFwXx4YpF/9I9XCAVfbsDW/liFsB5Fah3n6RHa9UIF92
         c9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605152; x=1796209952;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmO9qlZWx0TKcaEyqSHqDwn9dZMk6HPcgLTZNeLkLbo=;
        b=XnMxXPgFDPexf3UdOZKWvD20tRhjXJh5i9EZyIQS7uiKJI+FGC9cNdfJ0UtLGfXnXb
         n0oCfeie6joHZfuUQVenEPe+lGGs2XUwfCIfkJXDMRZhFa9ohZKtFYHDqgfH/1oERD67
         zcpWnL8SPoD9xL5A7xMrjgRgb5UjqRpEYJSadYQ2/5hr81iVR+oG+KPacDxhs/uEp0d+
         4Fh2VkywAZLLhqoem5CfUf+jD64vcs+KpQwulSFm/katbca3HiRqqiExcTOI8fd0UBLi
         pwnOScHVlGhNfwe+TxRO2WgizRW5aNon2AfvqsNOnvODUjAYwrGFVCoKUWab84D4pZfa
         T1JQ==
X-Forwarded-Encrypted: i=1; AL+hErHcN0HgD7yLRCUi7q4SQBbCJSPVEJdeAiHrzDDw0VJihujgQ4CjQI7MXMthfj6sgV3lLZBHrgYYC7IGpdi1uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8OpwjhLeUWSVL0+KYea90Tm7wPDEITnyzfoElBHEYSI6HG52Kh
	2um1sKd2mfuxULg0SF4Q7VLX2vgO8YNxQJFlMsAqXGAQLSW0Hjrj8d5MbSfAf06Wf8Rl/cpOc6X
	+1aYKced3lTUIhWEGmg==
X-Received: from wrmk12.prod.google.com ([2002:adf:e3cc:0:b0:49b:2420:f8db])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1788:b0:492:3176:3d6f with SMTP id ffacd0b85a97d-4abb400aefcmr32875648f8f.47.1795605151706;
 Wed, 25 Nov 2026 03:12:31 -0800 (PST)
Date: Wed, 25 Nov 2026 11:12:30 +0000
In-Reply-To: <20261118133232.48603-1-vishal.moola@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118133232.48603-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125111230.1082141-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: drm: ioctl: fix call to unsafe function
From: Alice Ryhl <aliceryhl@google.com>
To: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	Asahi Lina <lina+kernel@asahilina.net>, Lyude Paul <lyude@redhat.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 01:32:32PM +0000, Vishal Moola (Fractile) wrote:
> dev is created via an unsafe pointer dereference. Following the
> convention, it should be wrapped in an unsafe block, but it is not.
>
> The compiler only properly lints declare_drm_ioctls! when its defined
> in the same crate as it expands in. Since upstream drivers are all
> separate crates, this is silently ignored.
>
> This has been present since commit 9a69570682b1 ("rust: drm: ioctl:
> Add DRM ioctl abstraction").
>
> Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
> Signed-off-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>

Applied to drm-rust-next. Thanks!

I stripped the commentary below `--------------------` from the commit
message and worked around a minor conflict due to the `Ioctl` -> `Userspace`
rename.

Alice
