Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699AB17BA6
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 13:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742390217; cv=none; b=hzpe2iwi06T8TdWTDgmP70AJvzM/3zbgb32j9aJT8DzhLlAKHHrJGeTugGueQxNn9iGWLUEz94whHrP6YCNjhTBnm1d7CIotzOMR2ZyvcmRzR1HSCm1eWtdNt0whLxh+rm5nQOk8K2/aZZgadYxZOGo/JtFBe3kn3IvuufXMgSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742390217; c=relaxed/simple;
	bh=mIhnMEW5yuowNnYq0bWTeTVMLPHGSgJ9laVnEiA4/2w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dpQf2Yk95FEmFC0U99XhDaJ0BUrwEkm6aqPwKyxD2L8bT2nc4Zo0xl3oPlbDrrIHLGqHV1f97u+tS36GOPKlotwzElJbLCE96iX/2HlqnQ1wqXjSWR1UnW3ZwoS60aIZ2iTiF16oC1XP1HNnx0yKR6OVJzmYwBOcsVtGW3ThCw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M/3AuL+A; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M/3AuL+A"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so28514025e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 06:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742390214; x=1742995014; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iZFXJ7cV5lp42vCux/Cd6AXi3tX+zZrjbpR69QN/IgA=;
        b=M/3AuL+AiVAWgICHx0fgUYkO1v3QJn/Pi+/Y1zuffvOTfHNGbkjmDDfabU0+KwL80p
         lQ4H9CkO+VaWca7hqRraH5O1FfkF9+cZ/1GT0W3+7xjS0qnQJh0EEaCXmhlrG2y6Hlr1
         K7kqhDpSnlN5nZbd5FSLAyTE3GNImnGGl1UgI4zDRxiiBIv6EYic1au8jl2Y4RG8AigK
         XUHibrDGu0peBb35v0wfGSRHFDhRENMFd6od2EvdLmAgi7KPJGHEeBQHo6Cl7krzkkbf
         8Bvf2Y9k9Vjj3D9UliDLSVNvH0jc2vvDMyYC3zCGfJAnXIviO7yS+jtG6r1XJrG7/GOv
         mJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742390214; x=1742995014;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZFXJ7cV5lp42vCux/Cd6AXi3tX+zZrjbpR69QN/IgA=;
        b=BSSSpX1OwBfFnYghVbV6jzQIeNvzwqeTZdiKmpbOZRJpPtwY+wGU4FMJJ0h9gnkJrx
         2KPNlYoU22PN/dX+Ah20wKFa+JF/R5he8G+8P8fXWBwjnLNFVFMoCt+S88g3/w9rpkEm
         dBezyc5ecd/a4pWUQgQEHztfeSPwrzj30Gx0jBYpBDB+LmYyLugY0lqoRD2sDZjkmVWS
         MmHebZ5n7jkC44+2Fpevf9LR/2MFm1mOk3U63gUoyxoI5AKy/Y4Nsvg3aOJq6StXjrsB
         ddg9tBccQWPInBLyTriOK6dXb5hgE0badzxW0P5MDc929LC6n83Is1/LzAyGYjxHH56F
         LTDg==
X-Forwarded-Encrypted: i=1; AJvYcCUqppEYNmGESXn1pgpzytDnBaC1EO3CukUnZ5YglI8nnWAJYx6yemzuxJMJdpxYkfkLvS7lNRJAr9b65Vq9zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDo2YJrKPrX2UwL8hdrBjT0uyuD68UYoBU6iwk/fYT+6uEwED6
	BSfQWNNeT9kNRy0IyGpUqIC+kDTs17eqOLJvzyngOcR5MAp6PFT0XfYggU2732LaH9QekdMTAX6
	DIRO4MJP6wZl88A==
X-Google-Smtp-Source: AGHT+IGQ0tlk++4uoFRIvqDYa5fnv7Q7EnYkzjyoAXFfXjg3CJAiWVBpRU+wF6+JxkvPFHSROMZ8hlh0rLPLYIo=
X-Received: from wmbay3.prod.google.com ([2002:a05:600c:1e03:b0:43c:f5f7:f76a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c23:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-43d43798dd6mr20385345e9.13.1742390213917;
 Wed, 19 Mar 2025 06:16:53 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:16:52 +0000
In-Reply-To: <Z9q8xcsAYhQjIpe4@cassiopeiae>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318212940.137577-1-dakr@kernel.org> <Z9qy-UNJjazZZnQw@google.com>
 <Z9q8xcsAYhQjIpe4@cassiopeiae>
Message-ID: <Z9rDxOJ2V2bPjj5i@google.com>
Subject: Re: [PATCH 1/2] rust: pci: impl Send + Sync for pci::Device
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: bhelgaas@google.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 19, 2025 at 01:47:01PM +0100, Danilo Krummrich wrote:
> On Wed, Mar 19, 2025 at 12:05:13PM +0000, Alice Ryhl wrote:
> > On Tue, Mar 18, 2025 at 10:29:21PM +0100, Danilo Krummrich wrote:
> > > Commit 7b948a2af6b5 ("rust: pci: fix unrestricted &mut pci::Device")
> > > changed the definition of pci::Device and discarded the implicitly
> > > derived Send and Sync traits.
> > > 
> > > This isn't required by upstream code yet, and hence did not cause any
> > > issues. However, it is relied on by upcoming drivers, hence add it back
> > > in.
> > > 
> > > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> > 
> > I have a question related to this ... does the Driver trait need to
> > require T: Send?
> 
> The driver trait does not have a generic, it doesn't need one. But I think I
> still get what you're asking.

Right I mean, should it be:

trait Driver: Send + Sync { 
    ...
}

> The driver trait never owns a shared reference of the device, it only ever gives
> out a reference that the driver core guarantees to be valid.
> 
> > The change itself LGTM, so:
> > 
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > 
> > Alice
