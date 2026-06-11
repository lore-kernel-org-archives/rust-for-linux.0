Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77DE2BDC2A
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 23:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781218886; cv=none; b=ROiEdFjniAvZ0X1AUqK2mam2Bbre3FW6bHhhjlJcCIe3Q65A6sQcbBa8tbak7iydEO6ZDvfGu2RGgv1XfhYpIQTDa388LZ2X37OAFs79K6R8AxjvkDyrFxz6SBx0Oq17iqzHNcvlXdcJvp68DCEsv7b7naXIwGRaVCBSuvfjHtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781218886; c=relaxed/simple;
	bh=DelHHAMFWxAl0SNZO1xnCbGRWq+KNLmV2brrXT7LscM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=npbXfx9Wov2PDIRf59u9Wbj6WqRdxPGpiuPYZIrh9pfN/n72HTV5gD3k2Q+h1Alru0c6scczMB1txNuaTnkx/C6itYdn1CWUm2RADY9T9nJTEzEcLrJt4DkncLqY1mBULrrM4Z3FvT3FNjMH/r/DLyMFidJ1dn9qQJk8uNSCyxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VJbW+8ub; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VJbW+8ub"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-bf44ff0961dso32399766b.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 16:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781218883; x=1781823683; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DOuq4y6WifNPAq57DakxdC7yB0GZEzCwPY3FwSzdtuM=;
        b=VJbW+8ubk2W2NiEQL4SY/3V6f6kdBQpJu7xu0SDtA1Pw+7UmGt7jSIGKpmg97gOu/0
         ZOb0qNbNRWymZttyDATBPmh6t7gzOB0dSc04ojmC2acBt/+zrIaNs4Z8PYsieRFTsJFT
         RTajhmce9Mvgw1gAMjoVrgcduXDvvzoPMVdRY9BFFAVKfFztLgjRJk/wQy6/w9L7i3H4
         oAI2uA99kizqLQwBhFIwVLwr6uGDbg3XOnN/OvYELMUToXid8BWBkODYTKivxszsV25R
         a4O8jZSEwSax92/zBeCbpB239gq5lCKVzZ7D/JLrbGeSIeshBXJBDhrQ1QjXUH42hyly
         MnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781218883; x=1781823683;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DOuq4y6WifNPAq57DakxdC7yB0GZEzCwPY3FwSzdtuM=;
        b=O7bNG2fJK6JMNzKgmfeqaOM1cKnrDXAWafBJ6l4EvIaQC0kaV4rv5OM7pe8TfqhcT3
         rtMI7bkG9BOUZmfKKjAeGT2Y6AEchgwDZWBZ6Z4aZtUHBhhQW60RGskWq2C7YRY9mTKi
         KW3bYZ6vgs0EytEJ5JcAgLWw5WZicuuX4Nb5iar/S9xbD+FPHP4vF5AyK+QNk2DztGmG
         RNPFUMFLJdW287/Fi7dNdXFPipZWWnGG5uoJqOArJAf8uJER8z+Im9Y0kLqRMFfN9RA0
         kEhSaT3CSpVxbCe/vLihOmaV7LfmJ63A2VqyKU7HoUIFgsAVZ05V2wbbVtFFxHRr4SFZ
         DQ5w==
X-Forwarded-Encrypted: i=1; AFNElJ+raNgz1wDEEJWVn/0ql70/iTy40pnUKY+7b6ug077T/Oq4KW1OeP4Xkm8PtaqbnvuWTkq4lq0vnbNW70UKyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaUcd/HIH83xnqv1ahHryr2Mm7Z2FpZIA8RSj9CeFPVZM8t/9M
	UvFlb1SNAw3c5jqRtCBYnc10JH1z3cMBngI5CKCl7B9bCqF32SxEp3J+Gyx7/hFSMPtfNtq9tCD
	hiCZpnvT6jhTFXbxk/Q==
X-Received: from ejbla25.prod.google.com ([2002:a17:906:ad99:b0:bec:f3f6:bfe9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9994:b0:bf0:b39:dcc8 with SMTP id a640c23a62f3a-bfe29227d51mr1961766b.26.1781218883029;
 Thu, 11 Jun 2026 16:01:23 -0700 (PDT)
Date: Thu, 11 Jun 2026 23:01:21 +0000
In-Reply-To: <20260611190555.2298991-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260611190555.2298991-1-gary@kernel.org>
Message-ID: <ais-QaFQUb-6cB2X@google.com>
Subject: Re: [PATCH] rust: bitfield: mark `Debug` impl as `#[inline]`
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jun 11, 2026 at 08:05:54PM +0100, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> A `Debug` impl is for debugging and is normally not used, and therefore
> should ideally not be code-generated unless used. However, Rust has no way
> of knowing if a dependent crate is going to use the trait impl or not, so
> unless it is marked as `#[inline]`, it will be code-generated in the
> defining crate (as it is not generic).
> 
> Mark the impl generated by bitfield macro `#[inline]`, so they do not stay
> in the binary unless used.
> 
> This reduces nova-core.o .text by 17% (from 151922 bytes to 125676 bytes).
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
