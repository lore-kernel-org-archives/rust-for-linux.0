Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357472E7F3E
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 13:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430313; cv=none; b=My5TJBvR2Z1UkDhiLBfg0xtG1gbr/svJPDJCykpiy4Ecodqz/g93qnwlRGd7FBcZeixfd6jkt+aoyuT6Utmy9IPueEcoWEsgVbhI7ney2GBtCsmNe+wvzywEerbbog++Kmxn4hcMkiuHT8Pau9isvRADe95ZZ9XCW5bcz3RvLdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430313; c=relaxed/simple;
	bh=b6uQNrhNikH2Q0HQopBOVotB+XA9Ug+QLp3Yi/Unzkk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kJn2Qk3wCVx7QyUSbCdLDLwjf9D2/ZjVG+vNioUGVf1VUFhVtzVmYOBLjZc4Zz3uG9ZbjUXQ/ZBTtTsURdNDNX/vH7sZPW6vod7NvwWt8nKTJiqsIf9im16gYitq7BiYSwUCqN0HTx0fXrZntbMftexebpMG0oAu6ItcC6M2WOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=twTFpl1A; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="twTFpl1A"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-493b21b1fe8so35560415e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 06:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783430310; x=1784035110; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEr1CyyiwHzjsKf/Z8qp2leuOLg38t+LO0nZBG+VMc8=;
        b=twTFpl1ALfBfuUd/ntDWS1qtEGl0CfYu9P/p2R47wm0nAGUojutMGZ2t+LdorJGcJk
         G4kWqXDEHkVK+o5vNMJUIX5voSIjNYe/evLY1dSYuYpuuq/QW3r/PHSVfMTtWxKNJgrx
         f+UVDf4uuWECg94gh8gYlTTrrszK6uS7MAWQgD+bL2NUbVPc53l0SdrXsA528xsZt9sP
         0t8r5DO1o7bdbWnCGqCmMTqkMC13UGrPIBlu5KpX1mKQkhhEKCkrVgBGK9sFNVVwrBX4
         jr4TNZWtmu8IxxY4PFF8I7BriH8Q757D6KijQ08YWL6ag1Momtt6TpTVqMLcQOrD5YcE
         RFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430310; x=1784035110;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEr1CyyiwHzjsKf/Z8qp2leuOLg38t+LO0nZBG+VMc8=;
        b=TEWjsYPwWk3a0pdx1rQCaQ/VB52Fezs45LBKYOOYNOo9rssQVrnszuyfa9RWr75NWr
         3FpNy9TtAyAicDAiD6uOsuJSVaLNNYghCbo+ITT/0Lj7mEDmo4aW5QRHI+sEDCSFayZK
         92qynxXmd7zPjPc7GMHxaw+62TgmGOq/39ZRtNYTbnYI6FukEX0OM0dbAkT2cQdct+B3
         q7tHfmytNT/XMalfgwYFPfNu8LCEIc+Am5AQ412PBenEtf+T2G5jPahRZqtRfwhTkVl7
         o3UXxSxoEt2IgCUY6wPK/cf7zf00fNAxC/+mUsNH4YU1k5j8nULvdLTqLTc4jiN2zGUo
         qB+w==
X-Forwarded-Encrypted: i=1; AHgh+RonlnvpxEwIkluRahsW/52gzqd/S4P2SLwfv/ShCI6ZNu752v4lC8ob8CBvbRrDm+sbudKF2ybge0cSvTWeDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0zNuk+IkVeTUqz2qEhR74a/hve9yjuo0CJu0BuVLg1w+d1zox
	chwJCJcULK1Zdu9+ZBgbpCWYVdDbrAtdMSqW20Vjz9W+5NkGmn/4N5fVgn8r6YZ3V+n0odtlj/z
	6Zju/ps+2Cs66TYdkiA==
X-Received: from wrbce19.prod.google.com ([2002:a5d:5e13:0:b0:460:672f:ad65])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:628f:b0:493:92c9:1e6d with SMTP id 5b1f17b1804b1-493df08f731mr54832105e9.33.1783430310169;
 Tue, 07 Jul 2026 06:18:30 -0700 (PDT)
Date: Tue, 7 Jul 2026 13:18:29 +0000
In-Reply-To: <aj8LInp1enuylpRg@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-4-cc922f544dc0@google.com> <aj8LInp1enuylpRg@google.com>
Message-ID: <akz8pQ6Ga0J9AmvX@google.com>
Subject: Re: [PATCH 4/5] rust_binder: consolidate transaction failure prints
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 26, 2026 at 11:28:34PM +0000, Carlos Llamas wrote:
> On Tue, Jun 23, 2026 at 03:38:07PM +0000, Alice Ryhl wrote:
> > +        // We don't yet know the real message size because it depends on the secctx size, so for
> > +        // now write an estimate. When the real value is computed, this estimate is replaced.
> > +        // Writing an estimate here ensures that the approx message size can still be printed if
> > +        // the transaction fails before it is computed exactly.
> > +        info.debug_total_size = info
> > +            .data_size
> > +            .saturating_add(info.offsets_size)
> > +            .saturating_add(info.buffers_size);
> 
> hmm, I'm not so sure about this "estimation". I can see how it might be
> confusing against the "final" size, after secctx and alignment, bla bla.
> I wonder if it would be best to leave this as zero (until this is known)
> or maybe have the "raw" individual values from userspace?

I will print the raw individual values.

Alice
