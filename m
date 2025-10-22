Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E9D305E18
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761121646; cv=none; b=lYo1/VnQMgdquMPgkSfccTQHObzflGwSgKYhPNWqQGW/fmT1E6hdRQ9kjvnoz5rfBrfU9lRDVH4ZtH/oxhE+OD0fpUcrqi1sPUPsDO/3OKo/F7v/1QsLylJGRN1KM6nr0af/t28vhNUGnd2ScK97Gi9IvZqxckzCjdTGZ7uGcYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761121646; c=relaxed/simple;
	bh=tdMCrTS11/V/RG3ZXCpH2xncw9MorPLnFVlPKePhQcE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XX+k/Kuf79MNKFpgtu3yrR0j4SzZ1KhwJyIZat1TmPHHfwew+W20n4Z8AMclDBNDFfBLDAvnhkZGBezRIpofA/hZb1jQRm1VwSRxvk06HEeSjKNgE/ku+jE4/o4eB7nlQGUojWpkekkXdkQg5EQJs4jFX7AMk/lMrYTL5V2dBZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hkMde9Re; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hkMde9Re"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-471001b980eso39649645e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761121643; x=1761726443; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EEzCC+9AOK4yZHpfROCb40dtqhboh5xWZdG1MYZMg9M=;
        b=hkMde9ReTpa9FN58YfFSicanoYc6L5pUWnRZeg1vXxQxKh8wKSGbnWIJE5w2TFm6ya
         JeJ5iWXFmUMyxVGLmqa/gFqqVS5qllbLnaSV4tJ3ODBoOtb6wj4YYXGONfkJJL7DlZYJ
         7ZeKUx1+SI03kEoxXwJuPo/6aoYF90icKw+SogR0wB2Vfif3/qPHz3vvGacNgpsEXoGK
         nkm1lcGlquRP1lxTm/4kSQb9rfxT37QmIQ4La5pOIq+OkO8nYpL+/LrkTIBiTOYt1hL5
         YDIOTUurf+/996f2r+rYDGusan6Ue966wUKnvOL43bH/4MllRaojKQSOhgyT9jrGoOxK
         EvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761121643; x=1761726443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEzCC+9AOK4yZHpfROCb40dtqhboh5xWZdG1MYZMg9M=;
        b=ebnTPq6PiN5IiM2hsKe/yK3StmUJ9W0UYoXUQlhJmNE5cXSSwGNqvrgtNaib/V9PpT
         vRVk4jlPJ+ML0u/LZUXuo/oCY1xrVFaTbmF/Oi1kjsa5SJHNpeoDN8CDZtTI5k6uHO7A
         n3x1VpOPpGiRwhsBi1e945dLbNqlnCxxzli5a6mCh3TNQawkx7KS5uwKfXwQrUDtu5sG
         cEMsp8+VAV7Ay3W+kas33jFsympHWV3qW/MUgtGtddtbYfnnPDqhtQ+j3oIIl5ZMAWps
         Ki/4sWM9CmRO4skMCE1NE8mEybiOKmNn4/pLbCJpYqRUov4BtDS6zIbYWxIISnzp70uG
         duuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuN8Cs1Gf+30mkk6ejHfMbVUal+eiOatjkAvSwJo7UsjXdAMR5C6MMR9dBfF9+g30waEPab7XxwIqNshjsHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8SQMlLXLDJWi72tIWPNT77U+tQg4g9N6VFAT7sZmbjxQjHskT
	n22/OGiLpgJxdpDHVRqUJKvx8aovlQOOzqskzIiCEF4gP0w4roh2+zwiF1CcsDCUiQI0Lti0hwi
	uc9szrocoREJzVbJkkg==
X-Google-Smtp-Source: AGHT+IEWMusiGxmG8q/baznsT+BCENOjAatF/36w38yfM62+imMcUpM6TlM1aCKBP8oAPtZRLy3N/J4JPzr+R+U=
X-Received: from wmwr16.prod.google.com ([2002:a05:600d:8390:b0:45c:d828:e351])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548a:b0:46f:b42e:edce with SMTP id 5b1f17b1804b1-47117925db7mr133274735e9.39.1761121643176;
 Wed, 22 Oct 2025 01:27:23 -0700 (PDT)
Date: Wed, 22 Oct 2025 08:27:22 +0000
In-Reply-To: <20251022080717.GI4067720@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251022035324.70785-1-boqun.feng@gmail.com> <20251022080717.GI4067720@noisy.programming.kicks-ass.net>
Message-ID: <aPiVajDTiPsxZweo@google.com>
Subject: Re: [PATCH 0/3] Remove the usage of Rust native atomics in debugfs
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 22, 2025 at 10:07:17AM +0200, Peter Zijlstra wrote:
> On Tue, Oct 21, 2025 at 11:53:21PM -0400, Boqun Feng wrote:
> > Rust native atomics are not supposed to be used in kernel due to the
> > mismatch of memory model, since we now have the LKMM atomics in Rust,
> > remove the usage of Rust native atomics in debugfs.
> 
> Doesn't rust have a language feature that allows you to blacklist them;
> ensuring they are not used?

I believe clippy lets you do that.

Alice
