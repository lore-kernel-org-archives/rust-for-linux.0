Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432D61A3A80
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 16:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880162; cv=none; b=FxjfPoUnq3WoGgGoVr5sYhEq83uGGpkciDuPRsEInmF6h6SSdLxn/jK1VUDIsQHZySRt+Po6hLWxDChWWZMcSn0J0ude+UdhwGOfc38K2mE4KrQN+Lgki7ZJyWII3dAtsrCxxTjKVf0DNh8672r1N0teBhnFzd0pzjSznqhexSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880162; c=relaxed/simple;
	bh=6NfF/X3yQ0XHNDEeB3ap42sSQz7382eJ+Iu/Erbmta4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F2GK52HRkpTFV/ugn7q739/9coHVDTqFvTQNxaNDV/frpvMiIcsyhqOhNH7Fh+/GOhwPn0dE+27liXLnDPtD+25XmRk2A8VxXOuZWO29gN4jRratyJgYPJEnMg/hV/ReKyBab5xy4nDq8avS2sYqcGjeHLBhLhAodtGrn6/IObU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J9/BQFxs; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J9/BQFxs"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so938727f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Jun 2025 09:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748880159; x=1749484959; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5LSRzdKUmCfZ6ZEE5fydRUyqDXoWGCBC1D0jQYKLUL0=;
        b=J9/BQFxsZhIwlCDz5SXBS/iueKbpK1pyjFzr22hVE/h1/8slUTcv5GyAAwDeWWr1kA
         4taHqIeLvnAB9+Xr3OEUsmUwEJzWr3xPUpBaNECaLhUh/fZ12ESL9pOsbXpKg12HT+Ui
         KgCG8bdzPpCTM+5m4EafxDqIlOiMzw5Pt1QgjQ32MxGU2z+BTeSh17Dl4UFxfFHzO7Z4
         rFS/9uuhuuy2cFf0waoYQR4MFWO3qOQbEXAi7BXcvvKw7BFj6XHVCkD3kegCX7R+DFA/
         vqkQ5/JiIh4qe+fPBGC5ueU5TXFaJJkEotK4X7IoPMvSnWwSx5WIqLFvygtwx19IZc5f
         Ts6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748880159; x=1749484959;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5LSRzdKUmCfZ6ZEE5fydRUyqDXoWGCBC1D0jQYKLUL0=;
        b=MqAgyYvRGzLCcxpnQJadydq+cgj7/8FNt1Tw6HTcb6X6ajlpf8MmAt9XX/b5QKDQt1
         JPGlf2s2iRyxa/mGw2Kbpueqxk2MuY329JlMyV5zIr5rEoOnxS6BPf0MFBrgCOzigfZs
         4jIRxUGWS1qJovBuPQwHoHnvXW6mx7qAHE3RZ5TosoYou0EWR7nO572B1j1cKSc7stEd
         q7rj0OCi7zQlSgWa0TJo3qPuN0mdZ1iF6XWgECaYd7ABY6LEmQAOYt1fLRE2dTYVr657
         /HkUyDdRbxH7lXx3q5JezBpnDpNK5yiGYCfw5gCYS94Mwl3jmg/skOqtCLVb4Qlo5KMY
         0Gpw==
X-Forwarded-Encrypted: i=1; AJvYcCVoY1hPiuomthvGVWldZb1eHHn866dQ0ZgBUqWJeQCPstnmVBivCpgPp+ThpOfaaMS4Gx/6j8Y1EW73y/d8RQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9yHVTCztLGvpklHTcfJdYu8r3xZI+AFeuYZl/NuHSgiKqF3e1
	w2WWf6XGoC1BxcdpEqM8+6w8KKKO1HN2fUTXjViU/3kP+ZScy6Nd0YewMBaUaIJ5KZP/3W+aOb/
	JJfTBhq2PiAQHrOO6FQ==
X-Google-Smtp-Source: AGHT+IG8cLazPRIdxKpkEHN0QpVz7JJD0lWn7hgDZa3uU8xfy6JHF1/OrcOMgFXS+oLc0dKG6umKocG6VFxuQNY=
X-Received: from wmbfp6.prod.google.com ([2002:a05:600c:6986:b0:450:ce9d:a742])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1885:b0:3a4:eb80:fcc2 with SMTP id ffacd0b85a97d-3a4fe15ad82mr7450176f8f.11.1748880159443;
 Mon, 02 Jun 2025 09:02:39 -0700 (PDT)
Date: Mon, 2 Jun 2025 16:02:37 +0000
In-Reply-To: <aCXxnUdO8--5y8Zo@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com>
 <aCUQ0VWgoxdmIUaS@pollux> <A7E3A124-AF77-4A4A-B4E2-AE7DDB1CE007@collabora.com>
 <aCXYaCGvO_tI1OOh@pollux> <39C56E3E-07C6-44BB-B5F6-38090F037032@collabora.com>
 <aCXh1g5FWNiz7exb@pollux> <BEDD659F-B222-4150-9018-3B59126140E6@collabora.com>
 <aCXv86nAARGgoqEq@pollux> <aCXxnUdO8--5y8Zo@pollux>
Message-ID: <aD3LHfkmuXR-wPzm@google.com>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, May 15, 2025 at 03:52:29PM +0200, Danilo Krummrich wrote:
> On Thu, May 15, 2025 at 03:45:28PM +0200, Danilo Krummrich wrote:
> > On Thu, May 15, 2025 at 10:16:33AM -0300, Daniel Almeida wrote:
> > > 
> > > >> 
> > > >> Well, not really, because this impl PinInit can be assigned to something larger
> > > >> that is already pinned, like drm::Device::Data for example, which is (or was)
> > > >> already behind an Arc, or any other private data in other subsystems.
> > > >> 
> > > >> IIUC what you proposed has yet another indirection. If we reuse the example
> > > >> from above, that would be an Arc for the drm Data, and another Arc for the
> > > >> handler itself?
> > > > 
> > > > Can't you implement Handler for drm::Device::Data and e.g. make Registration
> > > > take an Arc<T: Handler>?
> > > 
> > > No, because drivers may need more than one handler. Panthor needs 3, for
> > > example, for 3 different lines.
> > > 
> > > > 
> > > > The irq::Registration itself doesn't need to be allocated dynamically, so it'd
> > > > still be a single allocation, no?
> > > > 
> > > 
> > > Right, the registrations don't, but the handlers do.
> > 
> > Why does the handler need to be allocated dynamically?
> > 
> > What about something like the following?
> > 
> > 	pub struct Registration<T, H: Handler<T>> { ... };
> > 
> > 	pub trait Handler<T> {
> > 	   fn handle_irq(&T) -> IrqReturn;
> > 	}
> > 
> > 	// Could be `drm::Device::Data`.
> > 	struct MyData { ... };
> > 
> > 	// Implements `Handler<MyData>`.
> > 	struct IRQHandler1;
> > 	struct IRQHandler2;
> > 
> > 	// `data` is `Arc<MyData>`
> > 	irq::Registration::<IRQHandler1>::new(data, ...);
> > 	irq::Registration::<IRQHandler2>::new(data, ...);
> > 
> > With that you can have as many IRQs as you want without any additional
> > allocation.
> 
> Alternatively we could also do the following, which is probably simpler.
> 
> 	pub struct Registration<H: Handler> { ... };
> 
> 	pub trait Handler {
> 	   fn handle_irq(&self) -> IrqReturn;
> 	}
> 
> 	// Could be `drm::Device::Data`.
> 	struct MyData { ... };
> 
> 	// Implements `Handler`.
> 	struct IRQHandler1(Arc<MyData>);
> 	struct IRQHandler2(Arc<MyData>);
> 
> 	// `data` is `Arc<MyData>`
> 	let handler1 = IRQHandler1::new(data);
> 	let handler2 = IRQHandler2::new(data);
> 
> 	irq::Registration::new(handler1, ...);
> 	irq::Registration::new(handler2, ...);

Yeah there's no reason to *force* the user to store an Arc. The user
could store data that is only accessed by the irq callback without an
Arc. I agree that for shared content you probably want to access it
through an Arc.

Alice
