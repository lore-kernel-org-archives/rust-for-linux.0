Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8BD2336B1
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 13:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733924116; cv=none; b=Gmy8NfLbmZcRh5Wwd2PViV9ZYKXQdzqEa4wPNU+n2kF6+drTGp6OMZtTnQG+ofrivoHrNluYdqawO/cU9QLwpR4PivfA9g382vziuZ8NLHcpB8Aq7TFGK3nNLEkarNiVA/tGtMMJ+G96Q5QwrM1QrUgHR6NQm0pO+CX+z4O6xTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733924116; c=relaxed/simple;
	bh=BuYhbD4rX4zl3utJjQBcdTO/iTewSt4YyC1J4oAAu64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGn63QUQ1lFIBzLsjg7BfKKxJ7CzJW8s3GIFUlA3Q4PkC46lHVWJQv3v3S7del7gsNQBXtDedSjEi6qmqFTDxIqLcJFci+fSlIFT2bywwDg6v80g9z7ebQwebez90ZfNDAsgyiKVpbekReH87ny7E2HaPSKM1MHKiYBw4Ac7920=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BhfT5EaY; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BhfT5EaY"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so3002046a91.3
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Dec 2024 05:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733924114; x=1734528914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ku7DkOVzzle9z1Ec1uYT0I4WbNTgYq8/0HLdlZJN9mg=;
        b=BhfT5EaYrlD38HWOKjgE/0q0a+pxW0qtuexScOH6l3UUH+7BOgRPiD0OX1FuSpS2cB
         YxTVvaeqF0/Fg8TYq7Wr0VEQQg+jEaLyTEIkousTiHO62oFG2DXD6G7FzveijQ9s1BIB
         UhNfPO47v7jRHbgJExIlBgErEBYxJCDAzJnwqjbLf51iFzmOmBVrbe8klAZXqGHqxA6g
         +ZODnGMxU+3MG96Pr/WK3WUff1YKIQI78p3tLafEl3ggl3qrrUCH8mR3nNkWt4d6T8Yr
         2yTUhZ6e/l/HIo6/HPpICzADIziUSrFmpQtqRDXVk/Nl3xpoHIfh7bGhzYmHL/QA3vZF
         XHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733924114; x=1734528914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ku7DkOVzzle9z1Ec1uYT0I4WbNTgYq8/0HLdlZJN9mg=;
        b=jR1+fn/5ltcFkQcbpeN/CHQNH3QHnrhrwPyKYwzc4vwqZ9FyFoiTBZ3BtnHMdLQ2Ld
         fYj04bc4KueCU4JKykJrDIXZbvlteUFNO/WurLLC/Y5p8KiaFdvPVw3+CjK8fHfLhJmw
         Rwcz6IBocL9oQszA47Ekds0W+H9EBV5gRSc3vdclY5+ku+N4wkw8RABXtLrZ3I+w8SmX
         AnbId2BkKpT0809kNyB3JCDe6CnYMiSzSwcDItAEib4sLA24ehbcfXxMHA8JEIM+nsJn
         0m/lWj92g6pZIYF7ZllXPR57pN6PNJZ7yj/fQCfdGF7Oqhiruf8nNdJh219YLgIB0CK3
         uu6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9FxGUXwo15XDWnCLB1xW3OXsjRzJR2699s5p29EvbFEA6atLMO/oQLrqWEK3pf1B9lcwm8mkeg7RPYEK30Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhhC1mOPyoxT4EU0XWOWcd1ET+6Lt148rfqMkgYyHOKU7QDDrs
	OvRDpGWq6nXD4x2Rqwxg9DWSU7btGSJ1pbZMjfYNuwVGRUrPCyCwQxaWE2T2bsNi9Fyd6crWe+v
	GBDUAK3JR+QevdItegobb2HbonTk3mZWsd4+U
X-Gm-Gg: ASbGncsTQtD3a1FbYX2vehpbX+1TWGXhgq3REc1vpzar2KB6mFmlDcff2anUb2rz7TO
	FX3exlvV15jCiQRuNfu7S1yvPt/YeKQSqLFBRb+OaCjwqXhGodYxCfQ7JKc7GTMxi1Q==
X-Google-Smtp-Source: AGHT+IEnM1tzLPIDTRYuyTHakXiG8NvRRFsE1nGgmeTcz35DMENnCwernFqnRXsvkvtr10TnQHQeZczHhKeAKVx4Exg=
X-Received: by 2002:a17:90b:1810:b0:2ee:ed07:d6d2 with SMTP id
 98e67ed59e1d1-2f128048f0emr4720486a91.37.1733924114218; Wed, 11 Dec 2024
 05:35:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210224947.23804-1-dakr@kernel.org> <20241210224947.23804-2-dakr@kernel.org>
 <2024121112-gala-skincare-c85e@gregkh> <2024121111-acquire-jarring-71af@gregkh>
 <2024121128-mutt-twice-acda@gregkh> <2024121131-carnival-cash-8c5f@gregkh>
 <Z1mEAPlSXA9c282i@cassiopeiae> <Z1mG14DMoIzh6xtj@cassiopeiae>
 <2024121109-ample-retrain-bde0@gregkh> <Z1mUG8ruFkPhVZwj@cassiopeiae>
In-Reply-To: <Z1mUG8ruFkPhVZwj@cassiopeiae>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Dec 2024 14:34:54 +0100
Message-ID: <CAH5fLgh3rwS1sFmrhx3zCaSBbAJfhJTV_kbyCVX6BhvnBZ+cQA@mail.gmail.com>
Subject: Re: [PATCH v5 01/16] rust: pass module name to `Module::init`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org, bhelgaas@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	tmgross@umich.edu, a.hindborg@samsung.com, airlied@gmail.com, 
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, dirk.behme@de.bosch.com, 
	j@jannau.net, fabien.parent@linaro.org, chrisi.schrefl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2024 at 2:31=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, Dec 11, 2024 at 02:14:37PM +0100, Greg KH wrote:
> > On Wed, Dec 11, 2024 at 01:34:31PM +0100, Danilo Krummrich wrote:
> > > On Wed, Dec 11, 2024 at 01:22:33PM +0100, Danilo Krummrich wrote:
> > > > On Wed, Dec 11, 2024 at 12:05:10PM +0100, Greg KH wrote:
> > > > > On Wed, Dec 11, 2024 at 11:59:54AM +0100, Greg KH wrote:
> > > > > > On Wed, Dec 11, 2024 at 11:48:23AM +0100, Greg KH wrote:
> > > > > > > On Wed, Dec 11, 2024 at 11:45:20AM +0100, Greg KH wrote:
> > > > > > > > On Tue, Dec 10, 2024 at 11:46:28PM +0100, Danilo Krummrich =
wrote:
> > > > > > > > > In a subsequent patch we introduce the `Registration` abs=
traction used
> > > > > > > > > to register driver structures. Some subsystems require th=
e module name on
> > > > > > > > > driver registration (e.g. PCI in __pci_register_driver())=
, hence pass
> > > > > > > > > the module name to `Module::init`.
> > > > > > > >
> > > > > > > > Nit, we don't need the NAME of the PCI driver (well, we do =
like it, but
> > > > > > > > that's not the real thing), we want the pointer to the modu=
le structure
> > > > > > > > in the register_driver call.
> > > > > > > >
> > > > > > > > Does this provide for that?  I'm thinking it does, but it's=
 not the
> > > > > > > > "name" that is the issue here.
> > > > > > >
> > > > > > > Wait, no, you really do want the name, don't you.  You refer =
to
> > > > > > > "module.0" to get the module structure pointer (if I'm readin=
g the code
> > > > > > > right), but as you have that pointer already, why can't you j=
ust use
> > > > > > > module->name there as well as you have a pointer to a valid m=
odule
> > > > > > > structure that has the name already embedded in it.
> > > > > >
> > > > > > In digging further, it's used by the pci code to call into lowe=
r layers,
> > > > > > but why it's using a different string other than the module nam=
e string
> > > > > > is beyond me.  Looks like this goes way back before git was aro=
und, and
> > > > > > odds are it's my fault for something I wrote a long time ago.
> > > > > >
> > > > > > I'll see if I can just change the driver core to not need a nam=
e at all,
> > > > > > and pull it from the module which would make all of this go awa=
y in the
> > > > > > end.  Odds are something will break but who knows...
> > > > >
> > > > > Nope, things break, the "name" is there to handle built-in module=
s (as
> > > > > the module pointer will be NULL.)
> > > > >
> > > > > So what you really want is not the module->name (as I don't think=
 that
> > > > > will be set), but you want KBUILD_MODNAME which the build system =
sets.
> > > >
> > > > That's correct, and the reason why I pass through this name argumen=
t.
> > > >
> > > > Sorry I wasn't able to reply earlier to save you some time.
> > > >
> > > > > You shouldn't need to pass the name through all of the subsystems=
 here,
> > > > > just rely on the build system instead.
> > > > >
> > > > > Or does the Rust side not have KBUILD_MODNAME?
> > > >
> > > > AFAIK, it doesn't (or didn't have at the time I wrote the patch).
> > > >
> > > > @Miguel: Can we access KBUILD_MODNAME conveniently?
> > >
> > > Actually, I now remember there was another reason why I pass it throu=
gh in
> > > `Module::init`.
> > >
> > > Even if we had env!(KBUILD_MODNAME) already, I'd want to use it from =
the bus
> > > abstraction code, e.g. rust/kernel/pci.rs. But since this is generic =
code, it
> > > won't get the KBUILD_MODNAME from the module that is using the bus ab=
straction.
> >
> > Rust can't do that in a macro somehow that all pci rust drivers can pul=
l
> > from?
>
> The problem is that register / unregister is encapsulated within methods =
of the
> abstraction types. So the C macro trick (while generally possible) isn't
> applicable.
>
> I think we could avoid having an additional `name` parameter in `Module::=
init`,
> but it would still need to be the driver resolving `env!(KBUILD_MODNAME)`
> passing it into the bus abstraction.
>
> However, similar to what Alice suggested in another thread, we could incl=
ude
> this step in the `module_*_driver!` macros.
>
> Modules that don't use this convenience macro would need to do it by hand
> though. But that's probably not that big a deal.

I think we can do it in the core `module!` macro that everyone has to use.

Alice
