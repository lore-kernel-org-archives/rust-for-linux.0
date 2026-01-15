Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D7C286412
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491367; cv=none; b=kVoJUB9THgRiJV6umuVKOCQfZP99jYafNmQGh/kMXpflvVywXvFhVthnEUNEdHK5EdNDiDsIIiUtIOWCbX3sW7IuOSkIt0dRML/Sv1EnkxfxwsajEvw6exwLi7sW/XAhYNhsM2CZVGSovngV5Eli1LLDXIxaGAJqvbgZhtgaSyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491367; c=relaxed/simple;
	bh=IMPdZb+1ZCG+wavZREKs/rl4zWIhCOC4m7kBGgWWZbU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mW23yitNKZn3VDlxpbJ+gbsRQaWpV7KFUqTHZ4vXhhfuoQrPEG+FwLYjsnX4nSj/SBUeSHbn3s2namJYmOs/NbyUUkGTwj9T/lR95D/3g8AXHnWRtX5e/PeluOfYVEFGfsFsWVI6HOhgdkKdoS62bTKRaOeox+SvmqFNHUsLKOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KlLDbl3y; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KlLDbl3y"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4325b81081aso880591f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 07:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768491364; x=1769096164; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GLaVRn2FkZUkVWgzT/uBjf8v0R07DMhycI5J8JYhxFU=;
        b=KlLDbl3yCyPbKZ2YaxVa5tTpDAypMRMTNZDPcC6j4pZ+kboZRwYqqPKXyxGQTOYyK5
         Gdx+orHdEvdJZs+od6fQxg91FbdyBNS4cSmiU5O9ZYP2NOLr5oD5kdigsB28niOXdcYQ
         Vc2QD8bSp/ZZkUXrNcy+Fhr8mQmNF7hcxWZ6cISA9mZPvwBJcMu3SCv/V0NdvKxKDi6P
         X0asHhtCtRAui+RRh1ijWF7kxYI17Et++4/+WQTKADIQP3Ln0FxvJGmg6HwzmM3ar2tD
         kZgIZ19qUwBSda6F7lJvj1PYjsOlLh2H85f2HqRBmYT7QSSZFWCDaKGYxn0IQN1Dtiag
         Ks0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768491364; x=1769096164;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GLaVRn2FkZUkVWgzT/uBjf8v0R07DMhycI5J8JYhxFU=;
        b=PQxCHY6abrHz6W6jDl0O9WwlAjPJv9pyuGqkbjZRekvW2VNqHkeNOeqGsNVIZUVRLH
         NHg6rDeIuwHBvqdADZ0H17KASGXGZd49Q7FskVHfNulUCgOR6HMgazRNoZwcQBRBiRNh
         vU0WG+q09c1J5iAgYen7EDxnwkzb+7KRY5GHIrOdrUNSppM8q80Pm1iJGN9czYqC6FHL
         bUNJzGYBzkev+OIdIw2z9EyOiEFLxmkmpsL0/ZmdqqjpPmaKxDrfbCma+gI5MOtpb3Yo
         l8viFSCqzGf9pVqKX2WAQ9jz2SHnGAy1y5AkgNlUHRdGVcvaVAzDVZVp3qDH7PA8OmO3
         WWgw==
X-Forwarded-Encrypted: i=1; AJvYcCUqH9ziA3NbwMWxQjLLgGA+KciQixE+nd8KZn7f85yrVTUErbKC6uOuUUn0YWRi9wg1m7eUGhw6ccxIN311ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YznkkNt5AdRJZ/OmsuiGBB9TA4hg21Fuo0FECjU1+Eh+rsKymqj
	2spPoZPRNhKmnLmnyWZzOa0mlzNcGkihBn78TALPEhrX51/dqNADhR7HjLNBhf/rt8FJlMKPX3A
	vsh5eiCbfpa/aphsvGg==
X-Received: from wrbei5.prod.google.com ([2002:a05:6000:4185:b0:430:f681:413d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d89:0:b0:42b:4267:83e9 with SMTP id ffacd0b85a97d-4342c4f4cdemr7491225f8f.2.1768491364318;
 Thu, 15 Jan 2026 07:36:04 -0800 (PST)
Date: Thu, 15 Jan 2026 15:36:03 +0000
In-Reply-To: <DFOP5BY09539.AFY5L5FV1HNV@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202220924.520644-1-lyude@redhat.com> <20251202220924.520644-8-lyude@redhat.com>
 <DFOP5BY09539.AFY5L5FV1HNV@kernel.org>
Message-ID: <aWkJYyNds5zWpgYE@google.com>
Subject: Re: [PATCH v6 7/8] rust: Introduce iosys_map bindings
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Krishna Ketan Rai <prafulrai522@gmail.com>, 
	Tamir Duberstein <tamird@gmail.com>, Xiangfei Ding <dingxiangfei2009@gmail.com>, 
	Zhi Wang <zhiw@nvidia.com>, Matthew Maurer <mmaurer@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Jan 15, 2026 at 12:21:51AM +0100, Danilo Krummrich wrote:
> (Cc: Zhi, Matt, Alex)
> 
> On Tue Dec 2, 2025 at 11:03 PM CET, Lyude Paul wrote:
> > This introduces a set of bindings for working with iosys_map in rust code.
> > The design of this is heavily based off the design for both the io and
> > dma_map bindings for Rust.
> 
> I already had a chat with Lyude about this, but also want to post it here. I
> have mainly two comment on this:
> 
>   (1) The backing memory of iosys_map may be a device resource and hence has to
>       be protected against (bus) device / driver unbind.
> 
>   (2) The idea for the generic I/O infrastructure is to support arbitrary I/O
>       backends rather than only MMIO. For instance, this can also be PCI
>       configuration space, I2C, SPI, etc., but also DMA, VRAM, system memory,
>       etc.
> 
>       For this, there is a patch series from Zhi [1] splitting up the current
>       I/O structures into traits that we will land soon.
> 
>       We will also have macros analogous to dma_read!() and dma_write!() for the
>       generic I/O infrastructure, which Matt also works on for his QC SoC
>       driver.
> 
>       This will allow us to unify all kinds of I/O operations into a single
>       interface, supporting the read!() and write!() accessors for values, the
>       register!() macro and raw accessors, such as e.g. read32().
> 
>       With this we will have something that is way more powerful than iosys_map
>       and makes this abstraction obsolete.

The trait approach generally requires knowing the target type at
compile-time or paying dynamic function calls, but my understanding is
that iosys exists because you might not know which variant you want at
compile-time.

Perhaps we need an

	enum Iosys {
	    SystemMemory(...),
	    DmaMemory(...),
	}

and implement Io for Iosys in terms of the inner types.

Alice
