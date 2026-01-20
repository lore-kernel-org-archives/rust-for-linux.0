Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9032A428829
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 12:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912732; cv=none; b=rBA2QT6g4dAkNo6ZulG0qQbiuGYe8wBBfL659L06ULZSh5ju4JXGTKKwyB9C5qXjrvY8AbdNH1JwG2srXNLYCvWjKhaJpkRS/IwJV0toaNsHZqIJfWX9YJRtJr6VRgu0nqVTOGtOhHVDvqoALkbHkeThIivP3GqWtIa8X68Ypic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912732; c=relaxed/simple;
	bh=PwApb91RxQIKd1rzfJ2xAleSXJcHnAXezOdyfHCU/8k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZdJBuXBIA5Vn7zhCS8/LmTnJ0UtdZtIJ/VB13h+eXi1L24tEra4mKcoAJqDKRp5zjXD3xvcdM9/tbA6mxNn/v5rfbpgSuAVAh9FUXOmmvwXf+h2jSPmi8fprGCZLwgyPZ6FfkJL3JaJWisHEgkGseV900rV1rkmosxhV0fwOz1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2umk9AWi; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2umk9AWi"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-430fb8d41acso3082546f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 04:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768912728; x=1769517528; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v5uBS89EprhTXTMtWy33Byzr1DNzGriqxZMXGCf0cIw=;
        b=2umk9AWiz9orTQh9fEnzb0/lEKqJ1LAOeotkj6jpFrnlJBuYCX/3SstEFf5fY+njwX
         iaYtfRFkhx0r/9VonYrK08tW5yfXMSDaEs/BWm7Yg5irVgrc/TzszgVQCdID/DxRu79b
         n/swbGsrAA142gRzDZXbjPopqRC1j81ry8PRixoFL5kM+vEIPambFVj4T4wpyH9iEoAn
         +mnh/TuW3Duo3UVER0vn4CCj8x/Qg0NoB+TtYw0ebfCiaOhsih8krX6P18R7IL0fAfnZ
         7lMHoBION3CvFBFdMnC1biBllH0SaCi8cvn7mTqEV2Ax3s8+li0W/ioQutbY5jCT/tKR
         ZxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912728; x=1769517528;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v5uBS89EprhTXTMtWy33Byzr1DNzGriqxZMXGCf0cIw=;
        b=FKbKE/PXv/WNTzGz1Dmyk2MctXsRUet1q5z4iHhCn5rU0CU5Eu/kQUBXNz+b2GaDD0
         Uf+IIvt3L9/zNccJw1bORT4p1gVEU18Ul0tnW1oCqJVJGykiR2Pa3pOQkuD1R0YTBzJl
         2EHXT7fRiK1m5xSsAvJHIDu5FeKYrY6HObiNrevAzIGUCGuRfS7JCGcMxxra7pgKOqMD
         yEmXNC9HCO88oYvnsbSF5LMDNrIgWuX1gaaqPqt6PycHflQ/8UjAxbsgwE+h4NrtuNjJ
         RFZz/slD4UlFhpvPXZWWwyTXW1QyEBUe0cuF3RrH2mYknPdaWquyLdeJNlUz8CgZ2Gf6
         rxxA==
X-Forwarded-Encrypted: i=1; AJvYcCVSH8p27NWri6rYdwQ43pA3PBdvH9ydnHU9+D+gYqUXP35D76jJ9zEd9KCMOZ5dj56sR2QnqpKvxRIWO1fuXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoUtvZTjXsPfeXOy35gJDH4eMJbcBhMTYaUt6tJz9DLLy7Jdi1
	p9pdSAq4B4T3xeIXRdUsE4y+CDT8gX+tw8AX7aqtrEWEWg1lKb8JVVqzLpEWydKkLwhiaamVqqu
	nkBk1Kg/C6lVKqCabLg==
X-Received: from wrp4.prod.google.com ([2002:a05:6000:41e4:b0:435:948f:2ec0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2885:b0:430:fd84:317a with SMTP id ffacd0b85a97d-4356a051d68mr21671610f8f.38.1768912728086;
 Tue, 20 Jan 2026 04:38:48 -0800 (PST)
Date: Tue, 20 Jan 2026 12:38:47 +0000
In-Reply-To: <20260120115207.55318-2-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260120115207.55318-1-boqun.feng@gmail.com> <20260120115207.55318-2-boqun.feng@gmail.com>
Message-ID: <aW93VwfgkHpJfjVs@google.com>
Subject: Re: [PATCH 1/2] rust: sync: atomic: Remove bound `T: Sync` for `Atomci::from_ptr()`
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kasan-dev@googlegroups.com, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Marco Elver <elver@google.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Jan 20, 2026 at 07:52:06PM +0800, Boqun Feng wrote:
> Originally, `Atomic::from_ptr()` requires `T` being a `Sync` because I
> thought having the ability to do `from_ptr()` meant multiplle
> `&Atomic<T>`s shared by different threads, which was identical (or
> similar) to multiple `&T`s shared by different threads. Hence `T` was
> required to be `Sync`. However this is not true, since `&Atomic<T>` is
> not the same at `&T`. Moreover, having this bound makes `Atomic::<*mut
> T>::from_ptr()` impossible, which is definitely not intended. Therefore
> remove the `T: Sync` bound.
> 
> Fixes: 29c32c405e53 ("rust: sync: atomic: Add generic atomics")
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
