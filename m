Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9F2379C21
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 20:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783714030; cv=none; b=u0/exX87N/UUwpuvw5qgHs0OTBLVgZUkdplbxh+N31qNNY/tlzo2oquTfSclAvgy7Gr3hha+EjnydWQzPWMPx1SW8NjfS8ic6+SN7NqgrylPHNfbrhfRDsNLk6AF17of1q+73u2S9aZIJoAV157sglFDTweyTfb1aCvBG9tblbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783714030; c=relaxed/simple;
	bh=NHeLZ2+KNh2Z6emckirbDq9YafEivHgxCHFq1UeQXhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6P+kU26jE2tof1zjHAjwqQpYUZMk9QViz7z4KHHWBvJwGgjb/cme6lo7OWxyCk064rxoAn6LMRHdO9oeu8mvPMZGTw2Ntj4leJLt2Ce8qFIh7Pk0+22J7pTPlyGOahY+wTfzQKIphk+I9OoCF4cOBhtljFobb17ZEW4bCii/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u3k//Wtm; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u3k//Wtm"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacef7d299so2395ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 13:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783714028; x=1784318828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a3ShivHS7ipU/TTVmTr+NO3Mq0/3DMG68EURWnXMD6Y=;
        b=u3k//WtmSoHUCxRWWbrwUE0JdxeLZvcLHDij17K7m1Jxsr9rh/caLpPBtQ0h0gh35+
         KJPQ7FbKFaVqRePXW86inIbCJvnKooNbGcBJT1MHV5hM2UHZtZWQdMjzlUb8FKSRBmqP
         bQt0T7M/zWV2dLKbs+6xySbXXwRvuAbm60PHdBmXNkp6A20MoUUxU71sSz4NSfLqu/p6
         uxwtU10MV0YzjUyLHQ2b40BDP/4DLqbVT4ydBidcGi2PNbiIfPCiSSHvxlW14Y8obk3N
         DCWVmI9W2B9WS+yxNoq6t8Jxp2PbHZyZEbBWDcueTfrc70sEmNRGnQ8JO7vcxPEJ9i5/
         TJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783714028; x=1784318828;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a3ShivHS7ipU/TTVmTr+NO3Mq0/3DMG68EURWnXMD6Y=;
        b=iyAM4Nw3Z686IowNoM3kahZ0gHWl6WICgIUahX4uh+VHYTGxkNHT7Hnr761ipLjzj8
         /eX56hrzCQfeCJZg0Vtvlz4gSSHR5QoyeyXNsulez9q3CwHj9A64GXUXw1pmBP2FQk4a
         A5ZmUX3xeOBFWiH9tMFGR0WXVn9uXtR1x0hEtDh8Nfd/+OAunt9DSvccSaLioG0WvrzT
         lFg30qBlXBx3DJ0Unb7TPPClogkEY8GQLxCp8RZ0+F6fWBQs4+vRDLAxkUDgwcIOkSk3
         CSWtJo+y3cQ1NAiOyVfOFATkLN6kIWdfzvqfO3lwMokuVkStdK1Qpj6S0tIBm8+jMHDY
         c7Mw==
X-Forwarded-Encrypted: i=1; AHgh+RpCieJJmrE2/Vz7bSoxhrlgd8JO7r/Qb7G4Kfz4aGGpDTBJEVY2GtBvgYyDefQh5P1vpa8B093+B/rp9pubwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAF0H5YSJhIXaEBhGn9HnguPXquoP45Be6yVNbxPdjxJYCiUO9
	gyeGFGvy6MxnbprRswj4lmYqGQFvoWWpiU6sfq1yOBNrWaFSYBPXskwBhVQUO5HB4g==
X-Gm-Gg: AfdE7cn1aH76L9JN4vdCpOW/PcqaL4Skjv8rWZAKOqvO4/sct74mTcCI6/G72GSOS7z
	rAiEVXMC7WDPinHsQ62o70kUTltwgsx+mr/rKa3L++kcrTOAMkYTnIeKAvUfUbpT/h7aJMPTX3E
	hWvmJQ4qBS1v0Uei4UBxgr2SiqLctZWkwVc3JpVzMl8oKjjEi78/y1a0Q3/4UnzRIE5W3NOEPnH
	7Wmzh1Z10YIHExT/fTG6cee+qJo0Ibe1KYrx5PY80OZ+mCFg+OKnh8Vd4gnM0DEFfXKr6R2OAQn
	RhzESloIzJSU5Y5Sn6d8SLR9/w8gvt1Kvt8lIatcw8C0Kry1y4Ikv4JNQg3PpMlVweCa0byTa6C
	Zo1+Z6oNzLBLTKL2IEM0vH+NDkymq1dH2HYAqWE1ZcbKj6m0jY+wg6rL/bL5dPklc16ES/MIbUS
	OXwctnPOHl/uA4MZZvdmg3rM/DzysAMfY+hdeNfCaQ/WhnHUAWhAqEGVgQi84Z0AI9j9OdGT/Z/
	B/0O4TU1CW5wu3UXpYzR7dxDpltAtO8Ln7ezEbcHl0EGE0=
X-Received: by 2002:a17:903:1b04:b0:2c7:b1e7:501e with SMTP id d9443c01a7336-2cea1d791f7mr132215ad.3.1783714028150;
        Fri, 10 Jul 2026 13:07:08 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db0eaasm10774675b3a.52.2026.07.10.13.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 13:07:06 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:07:01 +0000
From: Carlos Llamas <cmllamas@google.com>
To: jahnavimn@google.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 4/7] rust_binder: Implement BINDER_DEBUG_USER_ERROR
 for transaction parsing failures
Message-ID: <alFQ5ROPb1WMHv8a@google.com>
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <20260710-rust_binder_debug_mask-v2-4-2846410e3ae6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-rust_binder_debug_mask-v2-4-2846410e3ae6@google.com>

On Fri, Jul 10, 2026 at 02:32:55PM +0000, Jahnavi MN via B4 Relay wrote:
> From: Jahnavi MN <jahnavimn@google.com>
> 
> This adds dynamic debug logs in `thread.rs` for:
> - File descriptor array (FDA) parent offset and parent buffer address
>   alignment misalignments.
> - Memory copy, write, and translation failures during transaction
>   serialization (including out-of-bounds pointer fixups).
> - Incoming transactions or replies that do not match the expected
>   thread calling stack (such as out-of-order replies).
> 
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> ---

LGTM, thanks!

Reviewed-by: Carlos Llamas <cmllamas@google.com>
