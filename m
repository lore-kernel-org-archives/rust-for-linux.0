Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C892318124
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767175484; cv=none; b=h/96bMdmmkzeBJdVuRI5LgzzQCYwpJfsERSB/3e1LZ4Bb6eYfaRCGyk1KkYGBOQFvLLqC9eq5Md+4sS02R1niGHulRRixecYZykXMDRTkOFr7Svcyh051zhPwDFvC/QjqkPO3s/KyFnybbscdCEom0WK7xwe6Z+5+PL1gA9HPyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767175484; c=relaxed/simple;
	bh=uKVvZJDp5yxDeaDPsVzKvHO3sEuN741fMSc0AEc7iG8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P58++D/DTnBI9xlPSB298VYpubs5eQf8ssuo5SffZpnQ5uWbP78GHiZ7/5Pr0oJ0sOObnMWlfat9Lw5rrKQgT+G0Lybgtke5vHgsjD9cl/OFXn1ecQ6pLM5lM9PxN4Oqw1sL0kfPLyzOKebSHzRdtzo7upDUobdi6MyX+//kQEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1GZ5j0Ms; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1GZ5j0Ms"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477cf2230c8so107909445e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 02:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767175481; x=1767780281; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qj7PIpF75OzBGXifcwFcI1pliIEIflkHSTgdELda34k=;
        b=1GZ5j0Ms8R/YR1GbnnpINT2mNhhRZMlSkhAJHQY7sMM6/XBPw7ybEbjLafOyuRx+2R
         1nCBeXcXmfQvn4GpURryQhvf8XQ0ScASCPzyC5F/TxK9PADWctX19KKqU0HXCr4ttnGH
         d98pIz6smuSsOJjeM9CFE0YAzRyoK7igEiJvsIVwRGMOpmxaBdPF7Vl9Z/pIeed3+Am1
         bJP1ZluetrM69dHsg0hD4QKAF2v/H+qQZosMamSBBVx8TCqWtfZHulvxuPeh/kcwSpes
         fYpf31SroGBDMAcxuteaYyjiFUsBKS0WugDmYwzfZP22d4CIONQIeEHWkmC9JfCl/njm
         l7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767175481; x=1767780281;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qj7PIpF75OzBGXifcwFcI1pliIEIflkHSTgdELda34k=;
        b=V2JoGU25EKLoih5+7ke/uFOjw2GGJnOmqCVmaBbvseJR8A9vJZRNKVY7S/YwPcClz2
         gIUqP+j94SFoOjJTRwsx3uAt7O0ioo1XIzA4A3Wb9C6zujWZyydPbyK5rEMFjb9ihzGC
         gf16M/J3wMdGWEN0FIloo3gE5TVCyHDvJMPMhq3E1ZA7X1R6ERCyHQQOjO8l79t110uw
         Cyfa9QvKRXlirUU+VV5s4Oc8DJSXvlC4cMhKYvAMbubLLl9BdgnVb3Ws4IiN3dBjVZWS
         7KV9ZdLe02lYc0s9grS9xKOM9lMox7HCCVdXrUEzcVgmKQtiCVXw4eq8+8juJK4EK3I9
         TIhw==
X-Forwarded-Encrypted: i=1; AJvYcCUB/NEacjfiUUsLH/LcoVBCflQsSFBuWFSVf4PF7NpnIiyBOF2l1rpysig/JKETmrXDL833+2e7qXiG50TxTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwReKDiP7lrq2UVkxokiCOEuonqoiDKCK1pi5BP5y5+rdMbvjoy
	f4HvSbGTUQO2XJclNNprfJNetlaOMztva/hBP1A0fVexGPcO1hvmTbLD/SWdIjz1BS2a5fMAeKB
	S4ORYMsAoMXdJYPn8eg==
X-Google-Smtp-Source: AGHT+IESgiXsWUPRMaHS20OLD6T8m/1d1mjmirIPKXuMlAngrVuJ5ONN4BhR4DUo6LfCY2h5cGgc+0zNO06kKhY=
X-Received: from wmga6.prod.google.com ([2002:a05:600c:2d46:b0:47a:9a5e:7c36])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4447:b0:47a:9560:ec22 with SMTP id 5b1f17b1804b1-47d1954a2fdmr386334975e9.14.1767175480880;
 Wed, 31 Dec 2025 02:04:40 -0800 (PST)
Date: Wed, 31 Dec 2025 10:04:39 +0000
In-Reply-To: <aVKN0Q-6bsHGq_Gy@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251229072157.3857053-1-sunke@kylinos.cn> <20251229072157.3857053-2-sunke@kylinos.cn>
 <aVKN0Q-6bsHGq_Gy@smile.fi.intel.com>
Message-ID: <aVT1N1NHQDCe2Dn8@google.com>
Subject: Re: [PATCH v7 1/4] lib/vsprintf: Export functions for Rust pointer
 formatting support
From: Alice Ryhl <aliceryhl@google.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ke Sun <sunke@kylinos.cn>, Dirk Behme <dirk.behme@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>, Ke Sun <sk.alvin.x@gmail.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Dec 29, 2025 at 04:18:57PM +0200, Andy Shevchenko wrote:
> On Mon, Dec 29, 2025 at 03:21:19PM +0800, Ke Sun wrote:
> > Export ptr_to_hashval() and extract kptr_restrict_value() to enable
> > Rust code to use kernel pointer formatting functionality.
> > 
> > - Export ptr_to_hashval() with EXPORT_SYMBOL_GPL for pointer hashing.
> >   This function is used to hash kernel pointers before printing them,
> >   preventing information leaks about kernel memory layout.
> > 
> > - Extract kptr_restrict handling logic from restricted_pointer() into
> >   a separate exported function kptr_restrict_value() that can be
> >   reused by both restricted_pointer() (for %pK format specifier) and
> >   Rust code.
> > 
> > The kptr_restrict_value() function:
> > - Returns 0, 1, or 2 to indicate the kptr_restrict sysctl value
> > - Returns -1 for error case (IRQ context with kptr_restrict==1)
> > - Modifies the pointer value through @pptr parameter when needed
> >   (sets to NULL when access should be restricted)
> > 
> > These functions are needed for the HashedPtr and RestrictedPtr wrapper
> > types in rust/kernel/ptr.rs to provide safe pointer formatting that
> > matches C kernel patterns.
> > 
> > This refactoring:
> > - Allows restricted_pointer() to reuse the common logic while
> >   maintaining the same behavior
> > - Enables Rust code to use the same kptr_restrict handling logic
> > - Reduces code duplication
> 
> ...
> 
> > +EXPORT_SYMBOL_GPL(ptr_to_hashval);
> 
> I do not like this. At bare minimum we should make sure it's namespaced, so the
> author of the code deliberately needs to import it (I'm talking about C side).
> 
> Ideally we should have something which is Rust specific, like
> 
> EXPORT_SYMBOL_FOR_RUST_ONLY(foo);
> 
> Can we do that first?

We don't have an EXPORT_SYMBOL_FOR_RUST_ONLY(). The closest there is
would be to place it in rust/helpers/, since such symbols won't be
available to C modules once we land this:

https://lore.kernel.org/all/20251202-inline-helpers-v1-0-879dae33a66a@google.com/

But since the current file also needs to access this, I don't think it
will fly.

Alice
