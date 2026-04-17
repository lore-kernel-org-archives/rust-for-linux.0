Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6D52D0603
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 11:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776425577; cv=none; b=bVB6PXbgFrkxMmHbWkysQva7HrsoZUikh3SFfUFEkmpZYV1blwxCsv+LrYp4FkH2k6a5zwv5A/iE4AYmOzm69pJgsipTJ49h+vrd6Cxv6Z3poNqXSlA5QCnhuwua8kSH3r9QUtLBG1m9KXlyT3Ic5/RPOjQIIlVv28oDKD12vXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776425577; c=relaxed/simple;
	bh=1MLbXPE06SDad6v8rlI+y7wq+rnQo7dINrAfqUW4a8M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c4TwQlYBu58Wv3hGDw80XDhhfPuFiS1wE+iBB8NpsjwB7bEKdkRrsLYZKmIBNDB8QMvYdHKkVktsbM0O9RMVSYoMa9M5XmScfmxPgZJB1pdhK+jGiR/PPxBrX8bhrP3PuBQJlKpRxQcw5oHfvrOqUD+JzPQ5f0M7FY1ztD1JBzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vfRHm7Lz; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vfRHm7Lz"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43cf5b4dac8so996897f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 04:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776425575; x=1777030375; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W4Ws3Fp0j5FbcqNDEVXW7kBezGoH6rxWa1ymfwLTzi8=;
        b=vfRHm7LzZPeyndSTwWaZvjqvfXobGyQFP8tfSYAENVxDyWRUTxInqgI/+G9ltjyYjg
         WnZbWgvKfgO7ZUkYM6qrrEGMNjOsUyxRkMQFtdow9BtSOvOzUmMfZ1Xn0aMYIlosOK/3
         MPpEWIaeYE46Xcd8v/9PwgKPd0Igegcb62buzGX0IbV8mNpe/8E5UAIglmIEOqdZud/D
         Le4uCFQX7ijSmBFYWxQnwKoiEsgaRwMZACWi6CA8/9dWU3Mca8Ey5Rhy5FauYvKDWSBY
         tIRhbEyYTVXGqr2Tubo6ZrABSFVlty6ZiLCN9Pwy0qt5IzfRbcauw+sx0lqN3lBCdyI8
         2ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776425575; x=1777030375;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4Ws3Fp0j5FbcqNDEVXW7kBezGoH6rxWa1ymfwLTzi8=;
        b=Qxjdky1/KFTOA1970JrXV390ALph5SdnnM8/4zyhTWqvHpZsFK0JZeFiFU4pOvAQ0z
         Ps/gAC3fOlus+1WhCXFnqPf00SPxkDfpSWC0UOAE7NnjVGpFxU/2NTNWA1jtuv6RWk0E
         WZ81WTqORGRn3WJ5AfCC9bGziYoJowG6pvWA832Uc3er4a0r2QzKPU6H87IxJ1Ra2Yiz
         MbtQZJOE4BcInVmQ82lRhurZ3/9eqnrrs4/vIxy9TWl2LLqmrzgQwWBuy200soHMmtJK
         p3sJtGvWkHMOwq1MgDepzGB6ykUpUdTSk6u3TYGC1y80rrqotr2QN6NsHTgOGEfUiHQv
         1BOg==
X-Forwarded-Encrypted: i=1; AFNElJ/u3dnnKVPCC/G8deKpZ1hp/k0WqRMPIhSdUtN1SVpj6R5RdnqVkuXcEI0TJ4cu7jFqFOFG4tCJlHiz2QzRSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxznbCfjyYuvY/kZ5xmbCzGRBjKHd7AQGj2ZnJJ4RyN2/IY4tEa
	75rPE7NyQzvRhD/iYiGsAnNf4b95K1Mx/D/orWHSSYyGmQafkKCkJH/Ey0/FJEMCzSic/CkyBri
	igMFSSh7nns979371bg==
X-Received: from wruf17.prod.google.com ([2002:a5d:4dd1:0:b0:43d:8896:b950])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2f83:b0:43c:fd7e:72eb with SMTP id ffacd0b85a97d-43fe3e144b5mr3941450f8f.41.1776425574579;
 Fri, 17 Apr 2026 04:32:54 -0700 (PDT)
Date: Fri, 17 Apr 2026 11:32:53 +0000
In-Reply-To: <CAD4GDZxGo6p9A07rKAW4MZNdFOYrMVzjkYNjwTqKfFcqKkzU1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260415-binder-netlink-v3-0-84be9ba63ee2@google.com>
 <20260415-binder-netlink-v3-2-84be9ba63ee2@google.com> <CAD4GDZxGo6p9A07rKAW4MZNdFOYrMVzjkYNjwTqKfFcqKkzU1g@mail.gmail.com>
Message-ID: <aeIaZc-3RbIrOJik@google.com>
Subject: Re: [PATCH v3 2/4] ynl_gen: generate Rust files from yaml files
From: Alice Ryhl <aliceryhl@google.com>
To: Donald Hunter <donald.hunter@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Apr 17, 2026 at 11:54:05AM +0100, Donald Hunter wrote:
> On Wed, 15 Apr 2026 at 10:39, Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > To generate netlink frames from Rust code easily, generate Rust
> > libraries with methods for generating different netlink messages as
> > appropriate.
> >
> > The new 'rust' type corresponds to a Rust version of the C target
> > 'kernel'. There is no Rust version of the 'uapi' target since Rust code
> > exports its uapi via C headers - choice of language is opaque to
> > userspace.
> >
> > This logic is kept in the existing ynl_gen_c.py file to reuse CodeWriter
> > and other shared pieces of logic in the existing python file. This has
> > the disadvantage that the gen_c part of the name is now wrong, as it
> > also generates Rust. One possible solution to this could be to rename
> > the file.
> 
> Hi Alice,
> 
> I started a rough refactor of ynl_gen_c a while ago, so that I could
> reuse CodeWriter and the gentypes in a code generator for strace
> decoders. I just rebased the work to net-next/main here:
> 
> https://github.com/donaldh/linux/tree/ynl-gen-strace
> 
> If that looks workable for a ynl_gen_rst then I'd be happy to help
> tidy it up into a patch series.

That sounds convenient!

Alice
