Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37617283124
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764073485; cv=none; b=rE/GGez9OhrxsSkyPGHEqe7vipMr3Am7hNiYBAGjZ5U+eeXKGB9US5PW401eZu+p5+2QTlrwrEcyxeMWZdU/OlV6jxGLTvvZicfXgpE4r+mWLTJnkPdiwFtmienA8zeXljm7V7AudLxphxsBUzjz9jYwYwNevbWhTq8sYok7B6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764073485; c=relaxed/simple;
	bh=AipkYeLxqOofPJKfE6kYPtZb1dNoROJ4hDU3QSocins=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JW31JjnMPYIm9FQVxInzqOWCOgsSMbhNxXi6cSP9bKvsby88EFJ/lQpL2CdryqzVAmiEMFIWFHzIIRe9wPx8E8Y/bex/tlGuBbQUItbgPmjebobfRR4J38710tjd0rePvsOagEJoCj5u4vh+H8Y/XbVJMB1Kv006g+zLlg2phxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jQV3mhJX; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jQV3mhJX"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429ca3e7245so2645322f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 04:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764073483; x=1764678283; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UWqCGf4yniNYnv+0gGu8q0Azun9cQVkGzauYt4WzdGE=;
        b=jQV3mhJXyfAjYDOmiKQ55x6ZFDyIyfmOnbVl8sXL0+Vi2feyCHfSOdRBIjic7KPXC2
         1FpnpM2/B3zrpU+eDDtzCO6zoJ7vfBXa9sPF0b4nz5CF3KoDyeik86hBXbJb6p8dveJG
         Fqifxy/IwTSfo7gOYbmTiaBedBqX2U6gzrxYGsi9smSH9YuVMbHnHlvHGOIm9NuZRfhU
         dhQhNq3s6man2JdnRCSAbEeq7ae94B4fTPA/1OxUADt1isitEFQz19ZXsYl/qG7Jqr4O
         6WYHOUC92YrezAv0sHYv/jqZZv/zCJaYDIIDjFpQ0BSqCPI+sxGMkehWNLOtVEAQyVFC
         78mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764073483; x=1764678283;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWqCGf4yniNYnv+0gGu8q0Azun9cQVkGzauYt4WzdGE=;
        b=Fp34ypva7dZkDtmbdU6Dumr+OqWgWwOQ97qwReLVEBKTw9z76GKWVKd6eSp9449ONu
         coZ7piBsOvCAfE9/MfscP0DsVIJGt2P3d3aTSW5wqeu55u0fLY0IhPyE/onhDowr59gV
         iajEo9Gr7OXWsmwMGk/g5Xw2oWsuTDnSaLhuGT2K3a519N7+EL+exSdn+7DXXuEjAaMI
         pj4LlrvCZ9DjEeyyxPbrRQeVFLuzcizHe81KOYAKkFIXlWjeDvRbRxmdqt2RZBwtPdO7
         hxgT+N1ezILuURW6YRDv2fBLGLE6LCWnn6XyxBf57OMR4KXjkut7Xu8u7k/4awv2MafM
         zuCg==
X-Forwarded-Encrypted: i=1; AJvYcCWvGgq/lpGc3Zgbe5MLdPo6Fpy8Bx1P58ZMFvfosvC9w8kYEFwv5tqtTQ29y3+yPxIjvg6yFPMu8W4K0o0RVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSsVEXdLyPT8DDRo059oZL2cx3L7DT44WAyvJR/fbZXfWS3gBm
	45MnZJ9sWPgVlHtl2VIJQzo70x0IdNSSuDchR5oqByzFLdaOiJiC5jjZxxQzpDR1yYhnRMGErfJ
	0y4YhdqIwqz6NjBt+Dg==
X-Google-Smtp-Source: AGHT+IG2G97KKRtl5QTLxOePIordMgMh99WR16j540538wZ8wcvVCkUBTwb1GuKCnER5wu5hmB/vT2jtUiJeEds=
X-Received: from wrrt17.prod.google.com ([2002:a5d:42d1:0:b0:42b:29df:cc2c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d02:0:b0:42b:3339:c7ff with SMTP id ffacd0b85a97d-42cc1d19a16mr16939785f8f.43.1764073482439;
 Tue, 25 Nov 2025 04:24:42 -0800 (PST)
Date: Tue, 25 Nov 2025 12:24:41 +0000
In-Reply-To: <20251123092438.182251-2-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251123092438.182251-1-shankari.ak0208@gmail.com> <20251123092438.182251-2-shankari.ak0208@gmail.com>
Message-ID: <aSWgCT0beyqaD4jE@google.com>
Subject: Re: [PATCH 01/10] drivers: android: binder: Update ARef imports from sync::aref
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shankari Anand <shankari.ak0208@gmail.com>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexandre Courbot <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Nov 23, 2025 at 02:54:29PM +0530, Shankari Anand wrote:
> Update call sites in binder files to import `ARef`
> from `sync::aref` instead of `types`.
> 
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>

Greg, please go ahead and pick up this one, thanks!

Acked-by: Alice Ryhl <aliceryhl@google.com>

