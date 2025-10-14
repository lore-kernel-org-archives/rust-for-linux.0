Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1538F3002BD
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 16:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760458917; cv=none; b=Mu+o/qqsvfpoLIQaYzUdG4M/1ro1zrMtV97Dly41XGGU9JaaDPiOgzSU1g94Jm+OpcteO7kuDjLeunDW0Y3r7qinA21jjR+i9OizDY6T4P6KonsyAsgnkyhzqIf57trsdhnomj1QKGcxvD4mNWLu1b3RBxPRSoabK8PXafayiDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760458917; c=relaxed/simple;
	bh=1ockt3UvGLECOAaQWH6tVkRd0+TsZ62TiYm4MpBPTSI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b89+JE+2O79RP1SRY9OXQVLm5nzk6fI0mh5tSvms6M4991qoaw6o+n2jE8UHiEx9qeSfsmF4JW6zeaBEgD6hjlwAJ56Vg5nncTKTk9x321h+UBpTRh1sU61yh8w2r/LvSuUzmcKZS+aehBprdW//QWm9OPP+ogT0L5txWKjgrKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ISmccAZb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ISmccAZb"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e45899798so37685955e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 09:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760458912; x=1761063712; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LGEZTXFiD8LOPaMPJT+QP3xsnmMASODltHyOui+E240=;
        b=ISmccAZbctkjFKHq3yexyZB2/2LDRnjMMWQM7PMM5fauh0IleH8JWDdeaSFu0OC/2g
         o+Yd4ZtcpUbp0ePgsAb97vYSXgKijqGTNFuG1ItRceSfJ8vEnOkit9FRaV2k52LNAEYf
         ZaXXmyWCB+SjILKV/bPBlGK9CusbS64xb+VBkCwzAA8tlAyHITBYO9ShSsJkB618UlzV
         HAf2NGuXQ10nFW/4gRmPKGZX8nyw6E2cQCdR3L2pFOuQNDbO0U9sXVm31PlWT3C9iAiW
         Lpl/qKj87auA/B+w4OaxQsG5soqipXiXDG3hYMHeY4JyE0jezFs6SCMgcx46p8+I0anR
         9i3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760458912; x=1761063712;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGEZTXFiD8LOPaMPJT+QP3xsnmMASODltHyOui+E240=;
        b=Ikh0YCvp4R9VusdI2msDFHL1EOguvWM/ZJU75tO4HPbZbtQN3WNYJgg/18udMNrac2
         51bjuVLUEcHtJg7hSdPzqAasdiH/FXD8/PxYq37A1uTjGhIoxT3fsA8n9ROjRMQ4TdG6
         bI0BAuXnSgS9zJh7rzJIiZmUtVMHc0WzlUfMlzKWUU7jdsx/eVlrUwEsarzAE19uYhfL
         YL7Fv13MDrM9OOeJMZNKo+FYz+Fm7ZA9CXfLgtsUi8XHVlHX2ooEvwPyvLQR4sSQ8vo5
         lOMDr6cmHKH0ii21aiYq4cq/VGfeHj/vHD/DGONDEh5NOGPbaOA96Htj8SYOd6EKmuNG
         lGJg==
X-Forwarded-Encrypted: i=1; AJvYcCVo7shlTfOgChzcEV1I3zW/cyYVDeTJKUcdsw9nlOVJttyjrFwis8GUKb8mvFdtuohXaOAgkGkehVTPF693PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj9HbkkYpjm4vbx1T+c8PM3oJF/hA9UyKopEhq4bPVT+sWlJ4S
	1/yDyFVqOowaAuU3o9dPxkReTtiY1WK2WwU5/VpbksLZnQW9fUzL31tbKSeptKCA/GVJIG19DWj
	kN5hI4HEwjGEXISRyaQ==
X-Google-Smtp-Source: AGHT+IHoAjuapMOgn96BGUuObSLekFaVbtcXEvLwM5YNydoj7wu3jFNwPTugPL0JpzleSqoLJxGWun+sdMDP8cE=
X-Received: from wmvw16.prod.google.com ([2002:a05:600d:42d0:b0:46f:aa50:d714])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4688:b0:46e:5df4:6f16 with SMTP id 5b1f17b1804b1-46fa9b1788amr171616585e9.35.1760458912468;
 Tue, 14 Oct 2025 09:21:52 -0700 (PDT)
Date: Tue, 14 Oct 2025 16:21:51 +0000
In-Reply-To: <aO51pV5WSmqnT4rL@yury>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251013001422.1168581-1-ojeda@kernel.org> <aOzET46lagm-p8go@google.com>
 <aO51pV5WSmqnT4rL@yury>
Message-ID: <aO54nxGil6a5hLQN@google.com>
Subject: Re: [PATCH] rust: bitmap: clean Rust 1.92.0 `unused_unsafe` warning
From: Alice Ryhl <aliceryhl@google.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Burak Emir <bqe@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 14, 2025 at 12:09:09PM -0400, Yury Norov wrote:
> On Mon, Oct 13, 2025 at 09:20:15AM +0000, Alice Ryhl wrote:
> > On Mon, Oct 13, 2025 at 02:14:22AM +0200, Miguel Ojeda wrote:
> > > Starting with Rust 1.92.0 (expected 2025-12-11), Rust allows to safely
> > > take the address of a union field [1][2]:
> > > 
> > >       CLIPPY L rust/kernel.o
> > >     error: unnecessary `unsafe` block
> > >        --> rust/kernel/bitmap.rs:169:13
> > >         |
> > >     169 |             unsafe { core::ptr::addr_of!(self.repr.bitmap) }
> > >         |             ^^^^^^ unnecessary `unsafe` block
> > >         |
> > >         = note: `-D unused-unsafe` implied by `-D warnings`
> > >         = help: to override `-D warnings` add `#[allow(unused_unsafe)]`
> > > 
> > >     error: unnecessary `unsafe` block
> > >        --> rust/kernel/bitmap.rs:185:13
> > >         |
> > >     185 |             unsafe { core::ptr::addr_of_mut!(self.repr.bitmap) }
> > >         |             ^^^^^^ unnecessary `unsafe` block
> > > 
> > > Thus allow both instances to clean the warning in newer compilers.
> > > 
> > > Link: https://github.com/rust-lang/rust/issues/141264 [1]
> > > Link: https://github.com/rust-lang/rust/pull/141469 [2]
> > > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > 
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> Added in bitmap-for-next.

Is there any possibility of landing this for an -rc of 6.18 instead of
for 6.19-rc1? That way, the warning won't be present when compiling 6.18
with rustc 1.92.0 and newer.

Alice
