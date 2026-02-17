Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A5A3101A3
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 09:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771321070; cv=none; b=tIX1oDHFwfiGuneovXYTPajUttt1RWvRqb+OO5ZkGxWFbcr1l7HexLm7TtrvxdWAqCDxCPrI3SpIMDPtFTuo3HCUoSOpHlmoAQCzFF5gsTMzaNaPPZe+6Cb7ykgogutf1nA26a8AdeKuKNcmoRObFGcGlSRuan5hTp9RUEwDgRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771321070; c=relaxed/simple;
	bh=S6npqCGz7MJKQxmu5aF3PVZVDV6ku+otm6iDLDDd7IY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A/NowHPoSKy+n2T7VRfHJbw9IhiLivsjyeyXlwYtgYO94R/6Qph+pCVKGmbdKVeAjEDkAkprH1nfC48B/+Gjko1htLH9hR2Mp7wg8RK8JyO6ULGkxDU9qb+SozBUPl6eKpoIk4fNN+GTFGtrxZWVAAI51H87TmGgVtZAiKuTphk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aGYQ9b14; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aGYQ9b14"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8fbe7a6f41so286239866b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 01:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771321068; x=1771925868; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VDpmvLwb82PE3bqd5qS4FeiDIo1F2mrGhUa/vVUAn98=;
        b=aGYQ9b14dr3ryWyPugkq5LGAtqftmMV52HJW2qUiMnye4kQxtBsegCunnjM2OcfBy2
         pFhExe+S0QRyr7TGIi56c8s5yUQvDnXFmwzCFSLXvSZOwcWq2aHLbd1pPyUa0t/FibUY
         rqIm7Q11KsQ/0pYFDXhQsvbhc6gPZ3f0aKuW95t3gUZTJEdU37VLzUz24puGjDM1pMUz
         eLRQj9ohxWmS1/s+Cn75xdPmHvffoqViYb6Xd2EHHYn8ZY2VrOwhQ0wGJMdPQZNuEoy/
         bTIIqCXsiJf+jVGWfkSwpPmY0iG8aj0o7mOucAYULQEr70B73/IC29xiz4S+4RmsIVMo
         CzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771321068; x=1771925868;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDpmvLwb82PE3bqd5qS4FeiDIo1F2mrGhUa/vVUAn98=;
        b=bqiPBil/BgHhUCpT8AjlELSNLaHQITqY4/M8fFKFlKb33QtDWfphvO1rbgt3+qgwhg
         KGE3Emm4v5qzUUefpxOatIQu+aFFk10w5eFJjOWTwpUMqROOBMYdJmXTuMwrBacW8lEv
         HyR6Gcm9Squ2CqVA9zX3xdtlMDEXVcJEsF9St2clnMF5oepmx7PfjnjWOVm1Jl/x5TxY
         4UHSL5lyosOoCymLgF0n4sQjxUKiFeTwwz4tpIFttA1oa9HovDngodTLLmXE/WCVPs+v
         Vk3xZkWu0ekbMTxKBnqy5YBeMd/OYoLjxAWgXB1DlUukMiK8kymB5TV7ZqICvu1GF02b
         yoyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAygvNnJxB5gyjPgJYCVIUd6MmFs8ZjEZY+CdL4dZMa/5VO7lfBUDMAU8P2WbU7rKcg3X9keJHoHrgboQn8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd+n/Cv2HziqVrAnYpyqT/i6oYtqTceAISjXeIecuw6FblzUoM
	Su4omJ44awJX4hHPLorxEfQ2GuZLa0VJkTe4dOdNIFTNsvmvlr2Lo0KVBvTXnOHWiYIG2Ih1phI
	8sHLlkOXLnTnuUrYaLA==
X-Received: from ejbfw19.prod.google.com ([2002:a17:906:c953:b0:b8e:fadf:2a18])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9808:b0:b8f:79bc:b0e4 with SMTP id a640c23a62f3a-b8fb452e6bbmr730399066b.53.1771321067874;
 Tue, 17 Feb 2026 01:37:47 -0800 (PST)
Date: Tue, 17 Feb 2026 09:37:46 +0000
In-Reply-To: <20260217092343.GN1395416@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <2026021343-germicide-baritone-efe8@gregkh> <877bsgu7fb.fsf@kernel.org>
 <TZXRjQ6gkmJNdRcfDVKKEl8Zd-8b7HBCLMrrPXyXYq9HmsVE8BJS4a6FE-YxxNsOBrIQl1fiOvfS19rLkPSmiQ==@protonmail.internalid>
 <2026021313-embody-deprive-9da5@gregkh> <873434u3yq.fsf@kernel.org>
 <20260213142608.GV2995752@noisy.programming.kicks-ass.net>
 <2026021311-shorten-veal-532c@gregkh> <aY9HD7nH5A-DtgmR@tardis.local>
 <20260217091723.GU1395266@noisy.programming.kicks-ass.net> <20260217092343.GN1395416@noisy.programming.kicks-ass.net>
Message-ID: <aZQ26gDRdeTpmLRI@google.com>
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 17, 2026 at 10:23:43AM +0100, Peter Zijlstra wrote:
> On Tue, Feb 17, 2026 at 10:17:23AM +0100, Peter Zijlstra wrote:
> > On Fri, Feb 13, 2026 at 07:45:19AM -0800, Boqun Feng wrote:
> > 
> > > > > Suppose the memory was 'AAAA' and while you're reading it, it is written
> > > > > to be 'BBBB'. The resulting copy can be any combination of
> > > > > '[AB][AB][AB][AB]'. Not one of them is better than the other.
> > > > > 
> > > 
> > > The idea is if using Rust's own `core::ptr::copy()` or
> > > `core::ptr::copy_nonoverlapping()`, you may get `CCCC`, because they are
> > > not semantically guaranteed atomic per byte (i.e. tearing can happen at
> > > bit level, because they are not designed for using in case of data
> > > races, and there is no defined asm implementation of them, compilers can
> > > do anything).
> > 
> > How the heck would they do out-of-thin-air? Any memcpy() implementation
> > that can cause that is insane and broken.
> > 
> > Compilers are broken crap if they do this.
> 
> If rust core code can cause this, I stand by my earlier position that we
> should not want that anywhere near the kernel. There is a reason our C
> code is free standing.
> 
> So fix Rust to not be broken or take it out.

It can cause this to exactly the same extent as C can, and that's why
you all came up with READ_ONCE() and similar.

Rust's copy_nonoverlapping() might not call memcpy() if it's a small
fixed amount of bytes. E.g. a copy_nonoverlapping() of 8 bytes might
just emit a movq instruction or any other way the compiler can come up
with to copy 8 bytes. Like C compilers, that includes emitting more than
one read, for the same reasons as why C might emit multiple reads for a
single read when READ_ONCE() is not used.

After all, this logic all comes from LLVM which clang and rustc share.

Alice
