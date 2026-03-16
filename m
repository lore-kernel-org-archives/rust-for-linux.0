Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6087E39C00C
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670206; cv=none; b=JGGMnsGPh+DBGZzfeEnsKZTzwGR1k1pDuq1Buay25ppjnW7gUTn6gyv9gon/QNj38zMMXPTc4YOE8q+DAnq8BRwcrrytpLbUsL2qhZYu2rybD40kkp6QTDyAP9V9lBSOtumRKP2/uJ45Wnv87UYbGP2uTSqORIOjZZ8c0OxKJQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670206; c=relaxed/simple;
	bh=sdpty03TCex/UgqZHl9yfQaEUVMXg9s/yyXg8HGvaok=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EF7kmRmm4KWM/jwF3boWfY8wHcePOM5ChZ1jaVv6lAgRuytNefZOJC17cc0VoPqrpOaSyf8y+iBS98vyp+OUa6W4ixzikSgtbdGtTHuJMOyox319GaJLO4KRJwMSGFKgMd6LeX696vkRR2xDv0+E0g4Hrc/ISlfTc84mHhaamqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CUDJYe0q; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CUDJYe0q"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-485390246c8so39026845e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773670201; x=1774275001; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeUjNMMG4GfHQRRynCaNYnIeDtLOZ0Bu2Mqel76COck=;
        b=CUDJYe0qulTgBOprOd9xa2oj2ed/zilU/v0AAYsbyaL5LqbKQWu92J1vg8uenCR2dT
         By5uC2EpP09kmZ6C3zo+xK9mjIYnE2ZbPAKv72iyiCfeYsc7ihSLR5u2UeP/IeTHmfzW
         TrylIWSfmiE/nkB4DPClEOVtBs8zIRcSY9zmXwVAUGWlIUU1cDPGQ86CXS8DeggUfavV
         ID++o6U50IbQKIMpq/u8JeZSrVpvADf5Adhwlbgg/6yZRRygj3PEHmPFU5BVWmLfSV8h
         L/HVDHKDVHOwTMteFKQ2YkktiES2CQyez75swGgSRSV+ZQxeXM7kV5Ui0dbz/f3g1gZl
         ObZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773670201; x=1774275001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeUjNMMG4GfHQRRynCaNYnIeDtLOZ0Bu2Mqel76COck=;
        b=PhCbKjM+rCDODoNAjgTOzKzBIaMT7xf2kYE+veXfajB4yDXcQ1uxk15rAQnYFC5Xmu
         gXgGE2S76rRHtBtvZapQ5OJNglgWQf8u1k9Vzt7yeq4RpYyuOyKC15HbbTu11TMbePhI
         IQ8Pb6jBcS2AeJi5uysox8Y9FIZRR0lpn8t603+8qy74oZMASAJuBQOIiUuTxOq3O4NF
         OX+fMbQJeEONt6+JUIdr6pkPSA9meCLljMJMAjJNf8CZcs2AGMTvTUEar+j6ct9OdSqr
         lWMEJVta2lBvCoTDkvkO+nGOQVq/ktWBpSi0YgwOPtam5XDHhzepTMHdaxBoUq/QWQ0W
         YXjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6VxuwbpfJ8ZmYxPzSt3PPt8xdTLcuFy9Ebg9/rXIW5Wdm9N0oO9Yzdo9gupx3lPWL1WtJzFNeLDx7yhINRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGHIKLtUZzLmDjMnza9oxG8hG7KuN9BQnUU1f/pTqwj7hRh98b
	FQaCHE/ccILl+kzSODjLamSFZZ/ppqAsVHsy7Yy81ycF80x2T6qHlmw9/uB5z2xjan5RZH93IBT
	KNfbOdQ0WxmMbOUbdtg==
X-Received: from wmoh4.prod.google.com ([2002:a05:600c:3144:b0:485:3a2f:2f7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b55:b0:485:3f17:425 with SMTP id 5b1f17b1804b1-485566fd0dfmr210993035e9.21.1773670201292;
 Mon, 16 Mar 2026 07:10:01 -0700 (PDT)
Date: Mon, 16 Mar 2026 14:10:00 +0000
In-Reply-To: <20260308-rust-binder-trace-v2-1-9e38637a2193@sdhn.cc>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260308-rust-binder-trace-v2-0-9e38637a2193@sdhn.cc> <20260308-rust-binder-trace-v2-1-9e38637a2193@sdhn.cc>
Message-ID: <abgPOOBR4u2Qkej3@google.com>
Subject: Re: [PATCH v2 1/3] rust_binder: remove "rust_" prefix from tracepoints
From: Alice Ryhl <aliceryhl@google.com>
To: Mohamad Alsadhan <mo@sdhn.cc>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Mar 08, 2026 at 04:24:34AM +0300, Mohamad Alsadhan wrote:
> Remove the "rust_" prefix as the name is part of the uapi, and
> userspace expects tracepoints to have the old names.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1226
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

