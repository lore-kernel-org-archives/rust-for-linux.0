Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBCA2D59E8
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 07:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436568; cv=none; b=rA8QSB1XS9f2leKW+UXeqzukZjq3h2S1e8ZZfhTLu+XtH+sBTpzu1Z91+uoxCxgfZeGGr+tN+hrELB+A7XzFibyo5Fs+6kOzoi5T6bF3KUdC3QT29qxMEh7ORU7+a8APHQjPF7Ditkef0zZJuMJ1cYgXB6A5Xp+V0K94p9QVfaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436568; c=relaxed/simple;
	bh=+CoAt6fI9i0WpNCcNh5PHh9hQU7RcGZ0bzeTQpV2TTY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xse4htEsTjlpyM9S7Gri/oQtkSzDYnsX7uKOs8bMNhXhpHz9+KEweT0FRDCv5oSsQ1sUSTkJnK+MXXcmk1fMLvVHKI5M3tMN3dhsicXQR++FvkUlTzRLvUWcze5dpBNEMYfIA4Owg5m6c1Vju3gV7lflclusYcKRo0WMl89ubD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xrByk2Ka; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xrByk2Ka"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837a718f41so23012835e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 23:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772436566; x=1773041366; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B++JTSOCDEejhrrruo0lwnBFAI5zm/KxsIu6HPW4OXU=;
        b=xrByk2Ka/lzxu00yJY0EYyeohoQB2Lahz89kcaasp+MxaDa9tmT2w9v0hEeUb5GcmK
         mbZHbVAAG2FBL/vEgkhOeT1M+8AxP6nxIYGwLCUuApJ2PTeLbMunwkZR95qI7pdffTlX
         mmGa8oxLBtFYYfuD3QE5YMb2H4rXnN2zyiCLQvqfg2u7L6KtyvvM0TLU6HreHz1jCkBc
         YmIt5gXISfHwOvdvtvjJ820ppmJ6GOCWDAWTAEoR0KyA8IdsjbIw7wJA2Y0MhrRFZlbk
         wkGdF2Em9qoqVGbUX6R2zLsC26oWWeeok4WRWG7QvJgN9MTnEz8+THOwh3mQDsLDwoV/
         /Zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772436566; x=1773041366;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B++JTSOCDEejhrrruo0lwnBFAI5zm/KxsIu6HPW4OXU=;
        b=b9cv0V+u0evAslC7rsGHegeAZYWnytIqmj5VkFmaLAusIgfIrFjKVr68foIk4r2Sku
         crp/EZnSY+jJKOODx+JoVkDQTa2qnqn8lrpkCfx+2eYOE++1rFmUunZUW/5UdH+i41t3
         PG9njC/IkxfucAoE1LRoIzR1lpwaApvjSdUKV4LB3oI69JIyMyRnthA9YBgEBMFvEqxv
         /ThriExqjrby7hz8wXc2UoopkI8dYnM5vJEfTTIIAay37jYTJzOQxStod+RTnUNWRgWR
         SMk64eK1LEB2Q9y3YGQOALcl3IACBI1VldBLqcqFtiPHVUAAf6ZrdRmNtbiLmee/8/ZT
         WupA==
X-Forwarded-Encrypted: i=1; AJvYcCVXDXBniPgGycDKA6vQR68RpZtVJKxm4IfXWO4DBHDPjEIrwmjXSWiuHsrGQCo6ktd6tjE53GOvJ9GwC12gYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMN8CbS82+dMmEhb5SYdcHQdxqU1rKJoWH/ZaYWLf+F7KfjVTO
	Puz59zEL5tQOvJspYEuC7ySGDTf4fkuKvpuGxxDCOjIJZAYFea7l8vUV0P9Ue6yoq9vxBGB/hue
	l7nuZqykfmeSmUW+rBQ==
X-Received: from wmna22.prod.google.com ([2002:a05:600c:696:b0:483:272e:764f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8e:b0:47a:8cce:2940 with SMTP id 5b1f17b1804b1-483c9ba2922mr208928775e9.14.1772436565594;
 Sun, 01 Mar 2026 23:29:25 -0800 (PST)
Date: Mon, 2 Mar 2026 07:29:24 +0000
In-Reply-To: <aaUlwfP72ZpshLPL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna> <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
 <0a176f95-eeba-428e-b19b-b08503d9ca5d@ralfj.de> <aaUlwfP72ZpshLPL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Message-ID: <aaU8VC-kLOKDyYDP@google.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
From: Alice Ryhl <aliceryhl@google.com>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: Ralf Jung <post@ralfj.de>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Jubilee Young <workingjubilee@gmail.com>, Matthew Maurer <mmaurer@google.com>, 
	David Wood <david@davidtw.co>, Wesley Wiser <wwiser@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 02, 2026 at 11:25:54AM +0530, Mukesh Kumar Chaurasiya wrote:
> On Tue, Feb 24, 2026 at 09:58:10AM +0100, Ralf Jung wrote:
> > Hi all,
> >=20
> > On 23.02.26 16:31, Miguel Ojeda wrote:
> > > On Mon, Feb 23, 2026 at 3:26=E2=80=AFAM Mukesh Kumar Chaurasiya
> > > <mkchauras@gmail.com> wrote:
> > > >=20
> > > > I think, disabling altivec, fpu and vsx with compiler flag will wor=
k.
> > > >=20
> > > > What are your opinion on this?
> > >=20
> > > It is really up to upstream Rust -- for us, i.e. the kernel, it
> > > usually doesn't really matter much how things like that are
> > > accomplished: whether via flags, a built-in target, a custom target,
> > > etc. However, we need to know what the path to stability is.
> > >=20
> > > My understanding (but I may be wrong) is that upstream Rust prefer we
> > > use built-in targets for softfloat instead of disabling via
> > > `-Ctarget-feature` (and that the other options may go away soon and/o=
r
> > > will never be stable) -- at least for some cases. For instance, for
> > > arm64, please this recent change kernel-side regarding `neon` as an
> > > entry point:
> > >=20
> > >    446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfl=
oat target")
> > >=20
> > > So please ask upstream Rust (probably in their Zulip, e.g. in
> > > t-compiler or rust-for-linux channels) what you should do for powerpc=
.
> > > They will likely be happy with a PR adding the target (or whatever
> > > they decide) as Alice mentions. And until we reach that minimum
> > > version (in a year or more), we can use something else meanwhile. But
> > > at least we will have a way towards the end goal, if that makes sense=
.
> > >=20
> > > In case it helps, let me Cc Ralf, Jubilee and Matthew who were
> > > involved in some of that discussion in the past, plus the compiler
> > > leads.
> >=20
> > Upstream Rust dev here. Indeed we'd strongly prefer if this could use a
> > built-in Rust target; we can work with you on adding a new target if th=
at is
> > needed.
> > The kernel currently uses a custom JSON target on x86 and that's quite =
the
> > headache for compiler development: JSON targets are highly unstable and
> > directly expose low-level details of how the compiler internally repres=
ents
> > targets. When we change that representation, we update all built-in tar=
gets,
> > but of course we cannot update JSON targets. So whenever possible we'd =
like
> > to move towards reducing the number of JSON targets used by the kernel,=
 not
> > increase it. :)
> >=20
> > Kind regards,
> > Ralf
> >=20
> Hey,
>=20
> Sorry for delayed response. I was out of network zone.
>=20
> I am not sure about the process of how to get this in rust toolchain.
> Should I raise an issue of github for this?

You would need to add a new file to compiler/rustc_target/src/spec/targets
in the rustc repository.

If you're not sure what to put there, I would suggest coming up with
something that looks plausible, and opening a PR with that. Then others
can help you with filling out the target correctly.

Alice
