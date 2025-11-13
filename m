Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6676F2D7384
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763028461; cv=none; b=qdCE4pneoDlkcuXlD1bcq1XU6BRkdRWUoLAn25FtzHr7e/P7JbTw3lzGQF13Z2zETMtJPdQGvueQn79B5Eo/seoiAS5GppFpfLw04vTdi67zPlvfAfHQCpEjd/QYIzje2aaRvb/n8UNWpKuFf2kpkT041X1GSu1mo/XWhio82Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763028461; c=relaxed/simple;
	bh=m9TkgqMhYirtNzwimIUZHjj7o0XNs9YPAR6daUulpug=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gwv+3lYlHnhyE+s5vOqYgZEMbLA9z36QaDhdH8jETABaDV4iJq2/C+cT23NRfvwwYRx6i1i3kXPGX/t9Ueq0bBBK/hz+YhuOC/2rfo37kXYwSkh7Zg57xh6Gc2VAo69TGaK1rLMfw6kzqrzAPMYJf9q9DHCnGWFD/KfatP1Ujms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ewz8YZ59; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ewz8YZ59"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-471201dc0e9so4664695e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 02:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763028458; x=1763633258; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DFlD3hB1nMDfsj+QE9x0vFkAXs0VDTm9i1zO27pNwno=;
        b=ewz8YZ5925n269e0sCT4rXM1c/cE3Rdw1oXnXF9sGkrKgMRk8wa53u6B4r1KJJ0DHq
         bcNL4icSKS4SVotzGRJnriqmS6YAFYJ4jUxo1jTbNMWCbAFXkGPL3dDKWFma0xhWAihu
         yALdApxNbLwJW+WUZEK5ai7f8JY+R0i1OGUGCMOOxrBn4y1/G44fFNyR/1lYwpCUJmcP
         eUA16z7+wTHMDBcagHnpawNQUCoBdOkwBJFO9M+S5mKlkpuY75E1Y3yTW8ha1kSZ0Kl2
         ubew5e9GK/iNawUpMJ095m4WXzzqxR1Vp3IqCN2j2JT2iWUDOwgN++A+HDUFhVqVNCct
         k2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763028458; x=1763633258;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFlD3hB1nMDfsj+QE9x0vFkAXs0VDTm9i1zO27pNwno=;
        b=tF+E1QH1iKZxOEhN2JArDCNOV2RqOVowsm+zP1Ur4uJh95RdnycWDIHw2GxnfwBsB3
         yKFN73b/COB2fwt7+9BH23Kw5ZFN+/OpDtXJsSnTV9WAMOGx2HYVT3IBkZR79TuHJs/V
         25SJwShYPILorq7fPc4QSRA6xcA1EBIXVT9+uLYYJZdMkquAq7IOvqAaENwUL2uAnk2g
         bdnduI7VyTdbJ/3lRc5VfeJ0zWdEpFENu8y7jI5e2Oa7ivIVHgeKc/F1fBxZxOzt5GuH
         xhHUmhfaYXBrj1PsVe0L7erTUKCg9vBnE0nKsI6cECQpbk9zZiZbdN3BC+uQ9kJuSFW7
         n7dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm5EnZR+sPlSDIKvsPwR9R9O/xgXo5IyOwH3yI1oywV6wih0DFMYKsDfqR4RZ3o/Z79yf+aPa3oM0fR0Oyjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz710DfbJCvZ8Ylf+J/WmAYbLKkyWfuA7WF7tX9kyRRr8WkOcb
	6Br+21a4uLXF5NGS4giVEBlzwtCTPse18zHT8F5s76UrumBBvTZPYGig+4j9g/nNGK50soe/qVg
	txSBMSHYgO3FyOPrz6w==
X-Google-Smtp-Source: AGHT+IGJRvcyoeeX6Ohsm6vlherRPmEE2hcgrpiYRm5lhIQG/zzJiqoFytt21cvAgBuaDC8VP1A6M0hfJYcM8tc=
X-Received: from wmdn5.prod.google.com ([2002:a05:600c:2945:b0:477:554c:6842])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4706:b0:477:3e07:217a with SMTP id 5b1f17b1804b1-477870be036mr54779775e9.36.1763028457685;
 Thu, 13 Nov 2025 02:07:37 -0800 (PST)
Date: Thu, 13 Nov 2025 10:07:36 +0000
In-Reply-To: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
Message-ID: <aRWt6Ah8KuBXff8V@google.com>
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	jens.korinth.tuta.io@kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 05, 2025 at 02:47:29PM +0900, FUJITA Tomonori wrote:
> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
> pr_*_once macros.
> 
> A proposal for this feature was made in the past [1], but it didn't
> reach consensus on the implementation and wasn't merged. After reading
> the previous discussions, I implemented it using a different approach.
> 
> In the previous proposal, a structure equivalent to std::sync::Once
> was implemented to realize the DO_ONCE_LITE macro. The approach tried
> to provide Once-like semantics by using two atomic values. As pointed
> out in the previous review comments, I think this approach tries to
> provide more functionality than needed, making it unnecessarily
> complex. Also, because data structures in the .data..once section can
> be cleared at any time (via debugfs clear_warn_once), an
> implementation using two atomics wouldn't work correctly.
> 
> Therefore, I decided to drop the idea of emulating Once and took a
> minimal approach to implement DO_ONCE_LITE with only one atomic
> variable. While it would be possible to implement the feature entirely
> as a Rust macro, the functionality that can be implemented as regular
> functions has been extracted and implemented as the OnceLite struct
> for better code readability.
> 
> Of course, unlike the previous proposal, this uses LKMM atomics.
> 
> [1] https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io/

There has been a fair bit of discussion below. Here is my take on the
way forward:

1. OnceLite should be it's own special type, and it should be in a
   printing-related module, not kernel::sync. The reason for this is
   that do_once_lite! is hooked up to a special section that allows you
   to reset the once status, and if someone used it for anything not
   related to printing, they would end up with being incorrectly reset
   when someone resets pr_warn_once calls.

2. I would suggest just using a relaxed load followed by store instead
   of xchg. This is what the C-side does, and I think there is no strong
   reason to deviate. It allows for a single byte of data instead of i32.

3. If we *do* decide to use xchg, then the xchg needs to be guarded by a
   load so that we avoid a write operation when it's already cleared.
   Many read ops are much cheaper than many read/write ops.

Alice
