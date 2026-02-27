Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AEF3112A1
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 19:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220495; cv=none; b=a5RltXmnLx0vv+625rRIEcj/K6Yeg+67g7cWS+G04I+V6TPtMSyo4MMXkNC3DEULaOh1CKuygfhKaoyEY/aFp3l0oaQIDim+ovmOpdMIN+G2r3TbNObmCPbVk45qjnQaN460rstOIwUoZDViUrFa4HPpBNeYpD+sULZRRnv+RFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220495; c=relaxed/simple;
	bh=HfVDmGC4fB3MiRfy2NmM8QDzL0ngy1GxNiE1UvPUglM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YNBi0VKtmpzKmlaq4sS4ZIR+nTOWI+A3gciKKE71FuAzNQzUEs4uYRxLsCwlUtz3AzHw4bjgFd/o2ua0Q22LHYmc7KjM/LBnG82eCjRYKmRCK/O9+mNzkv+CJOOxy0QnY/dOgFyRhsDPEeeqbtQ/MfLvc+UpSsNpT1PMNxkhZ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pwg7qZeS; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pwg7qZeS"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4836cf00787so32436885e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 11:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772220492; x=1772825292; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=w1HcWsQPS7f+mcem6RVU74G7Wi+GwI58L79rKUSwDFo=;
        b=pwg7qZeSJeHFvzKt9o6skkwd7BF9E0NkMset5m4FOpTOC+Ki5A4QecbY445B2Mf4DQ
         kEDnjWx+zcApBKkUXcNOVIjataP08wdFNaNVG8Y23kuT8h3DTErjOrqc+9GKh2vzNKwC
         EumL0Q8yggt21gazgHckhK981jwUwXI3RB6Dnh8aB2FlTlLNFYvTz1yUv+FHFVzOHA34
         04jwx+a5CZ4qj8kvUnxpYHj2Y0F00eX0IOpONyMCC3rMS0w8tzUxGn2FC39fpEril06u
         2hcBXY4ONE54t+Wzwy95iVFrfm7BVL7CCTOFnTVT20IrjoJvVFiPC5P+Ai4LbC+rhJdE
         6ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772220492; x=1772825292;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1HcWsQPS7f+mcem6RVU74G7Wi+GwI58L79rKUSwDFo=;
        b=Jp67MICLmo5Os1YabvdY8N8XHndc8G9F4MzrAZGAL3gNBO/z+1onE+qdd0brn5zyQ5
         7ID+hQrT3BAhomPMacHeeJ8myeTVB4IqaZ2uJmNUhAx/Z+MaDW3gNNU4kOjQ3dmckEzc
         qk2LoFQjuK3yG4IQagcUxgkRMpFO0AtDE0yyX59FECb2ilZIYVdQ0zHCEgE0wKuEfpBr
         B2ZZYVAr03OzNyJg8zOJyoXlTTiY0Km+q7up3BRARK8gF2gWeR2rPSN8XI9VBPFRH7ry
         66jRzgdDVYmTQSjRpoK8VqsQIMiurBpjSha3M0S16D7OnZoCB0/JytupxX4lf2CvBbHP
         XZkA==
X-Forwarded-Encrypted: i=1; AJvYcCVN9P2BjTOmZo3wMvTekPRCYjYsHsPl7PiPjkTQJ8EWMR9HHTfMAzpl5x2fHn/aXtzErC99WcOOkqA1xnDAPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGgdsSoPNgSdSUnOi99Xijp1/whB4MTiRvUSMKCXITZnkbvyCI
	slxVf4X66K9JJgl8U7Y/nAiDkHsog8oM9bwVoNMebLlYe+/2iv62rDWxX13G23ZTVBjtOXMzzQX
	71mcVbwgTVfIMXq2MzQ==
X-Received: from wmxb15-n1.prod.google.com ([2002:a05:600d:844f:10b0:480:4a03:7b80])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c1d:b0:483:4b37:8620 with SMTP id 5b1f17b1804b1-483c992e330mr68942145e9.10.1772220491946;
 Fri, 27 Feb 2026 11:28:11 -0800 (PST)
Date: Fri, 27 Feb 2026 19:28:11 +0000
In-Reply-To: <aaHvcvbmkl7oSFOR@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260227-create-workqueue-v3-0-87de133f7849@google.com>
 <20260227-create-workqueue-v3-1-87de133f7849@google.com> <aaHPs-nULPEt_wJB@slm.duckdns.org>
 <aaHp_pGBxA4pNiXJ@google.com> <aaHrxzWIFFUjzWhu@slm.duckdns.org>
 <aaHuXEO64ONKMW4O@google.com> <aaHvcvbmkl7oSFOR@slm.duckdns.org>
Message-ID: <aaHwSxIaTqLWndkw@google.com>
Subject: Re: [PATCH v3 1/2] rust: workqueue: restrict delayed work to global wqs
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, John Hubbard <jhubbard@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Tamir Duberstein <tamird@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 27, 2026 at 09:24:34AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Fri, Feb 27, 2026 at 07:19:56PM +0000, Alice Ryhl wrote:
> > I guess the question is, what does destroy_workqueue() do?
> > 
> > - Does it wait for the timers to finish?
> > - Does it immediately run the delayed works?
> > - Does it exit without waiting for timers?
> > 
> > It sounds like the refcount approach is the last solution, where
> > destroy_workqueue() just exits without waiting for timers, but then
> > keeping the workqueue alive until the timers elapse.
> > 
> > The main concern I can see is that this means that delayed work can run
> > after destroy_workqueue() is called. That may be a problem if
> > destroy_workqueue() is used to guard module unload (or device unbind).
> 
> delayed_work is just pointing to the wq pointer. On destroy_workqueue(), we
> can shut it down and free all the supporting stuff while leaving zombie wq
> struct which noops execution and let the whole thing go away when refs reach
> zero?

But isn't that a problem for e.g. self-freeing work? If we don't run the
work, then its memory is just leaked.

Alice
