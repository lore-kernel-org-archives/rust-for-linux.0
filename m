Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8801B4122
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Dec 2024 08:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733475131; cv=none; b=TwL0/hlkVLID50uhsGFGIlUyiB8VACsI6MLoCmdhtYao62a5PXgWCNfKfo99KYI6sQIxtrr6S69EohSmz/ukPJfceacWHccO21UNGIS+uA6qpWGJMs6kBI70hdsy22mOy3MCxcvgCXgMrnf2Iuy9TWiwvACfjLPqF0YYaypnLQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733475131; c=relaxed/simple;
	bh=HWOvZgLSVd4Y+0nv4kgmQCgIFwzHUYGbtKg4rEf3nqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQ0Uy6rZvHdDVMJAqrBQR8baIEnRpB7G9HEdbkeZct4YI2/6r5kBptldPqTcdabl30eLygAHFa0bON5RPfTZcDfUX7f7Ma3FpdE8bBL8UgzrOjsmFrpbgMNcmkd5PjdKDUTK40zbzTOBLcu62Gv0MlgwLd+LzOBuCZa1StX3wIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zdLI8uRq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zdLI8uRq"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3862b364538so290535f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Dec 2024 00:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733475128; x=1734079928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gJq14hSweOijzVadMR3u3GETpuY+wtsd9Mx2IMYAJM=;
        b=zdLI8uRqmBLz69+z7+/rB4XzOFUaEsVZaZ8qX4UHC4toG7yC/uMxwAfnft/n7vSzVk
         cv2tPHipPigWSWtnEG6IolYamRqlM+w573TKF+g1AZBz6kHwOep0jmJVAuEzyMVF0uuF
         8ev3rfkW5kEDIutlZ11fjes9LS5394F8A8Gsp5HbPcY97xBuUt7rwfWh5JxWdNdAraNg
         C6/m0avaicbomFePmHD7s07I+Pyq8LMsxymvhZVp3wNZENmdaG3wBdrEssa0LZkh0Hg0
         KOzWnMxE8frIuCiVMuRFJ60czfSYSMrg5ij6i1YagiaqkazVtqekuohP2cqekNVRN3qZ
         qLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733475128; x=1734079928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gJq14hSweOijzVadMR3u3GETpuY+wtsd9Mx2IMYAJM=;
        b=egoLJUk4oCMRsgaNqo+1nPVi8TZa3MEiTvPX7MuSlHc3A4us50vOL3lFHsXuBPOClD
         Avp6+O6kHhkRwvi7k8+DTvN3AlX4Zzew0f8T1mLahESZUgA3ofL2fm2OWa8Koxh1GE/l
         +khDBfAhtifpCD46P5OzTokVUVZ2KKz1qcmLCDAbaMvnp/MYDgCjFmDXTIqEFOasaiY3
         CwWC3AXHEnUsFMJWKlZWnmr+utxpXZVc+4JjvoLT9bUjAie6HhK18HPPTk/OwIyDj0Cf
         lQDOBAHCJlMYbzLOEgMxljfzDKaALIG1WUfFgugICqOoqibpKSs6ffDsDNrm7I/T6xps
         Gtpg==
X-Forwarded-Encrypted: i=1; AJvYcCViug8jBAxEeBOHq8wjZFlaq9DzQOP9FKWSuAqUp/ajSXbxJ3ZBPeJlfKWz8TYV/LFc/Xt5M1aREQKDqdr2DA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKcD6pEqYZEWAhclGIyVv/Mp2ztyj04ujUdvOzs/t4qUz2Kdn7
	kyCoD3kUPIVDRFaWo0xVHOWSwqXUIfpoztMoD79WU00fdVjWQpQPs4BcRNtFg8+/qmXOgjJUdsN
	Mmml2TaAK5aHNhkY1vF5EYNUFLunmRbFw7c6z
X-Gm-Gg: ASbGncsX9m+GZkwJEvkeXJeuG6M6DBgY4qmFqoCRnmNBwBTvDBtEjfSJMPrih9YfRge
	/3+GSlRduwgyB7SjNc0hPqzZYQeN4LVvB
X-Google-Smtp-Source: AGHT+IGvc1b8N6DPk/luNrIsJI2W0E9BsK6iaXzYzbX7t9XofT/SilpG+ZW+vZjQIERHOKwhQ3dETp+sSLnFmeMw07M=
X-Received: by 2002:a5d:64aa:0:b0:385:f64e:f177 with SMTP id
 ffacd0b85a97d-3862a893032mr1796793f8f.11.1733475127898; Fri, 06 Dec 2024
 00:52:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205162531.1883859-1-lee@kernel.org> <2024120632-hardwired-hardhead-1906@gregkh>
 <20241206074443.GJ8882@google.com> <2024120622-unvalued-wriggle-7942@gregkh>
 <CAH5fLgj6rqVbGHrU4008fvO60fJdRWoE2SvW7nc9njPUFuzJ_A@mail.gmail.com> <2024120615-concert-oven-66f1@gregkh>
In-Reply-To: <2024120615-concert-oven-66f1@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Dec 2024 09:51:55 +0100
Message-ID: <CAH5fLgjb9UaFGB0fQn4hO5oWySkNdY0ZJDUaNTgiEBYu6wG5BQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] rust: miscdevice: Provide sample driver using the
 new MiscDevice bindings
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, arnd@arndb.de, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 9:44=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Dec 06, 2024 at 09:31:28AM +0100, Alice Ryhl wrote:
> > On Fri, Dec 6, 2024 at 9:11=E2=80=AFAM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> > >
> > > On Fri, Dec 06, 2024 at 07:44:43AM +0000, Lee Jones wrote:
> > > > On Fri, 06 Dec 2024, Greg KH wrote:
> > > >
> > > > > On Thu, Dec 05, 2024 at 04:25:17PM +0000, Lee Jones wrote:
> > > > > > It has been suggested that the driver should use dev_info() ins=
tead of
> > > > > > pr_info() however there is currently no scaffolding to successf=
ully pull
> > > > > > a 'struct device' out from driver data post register().  This i=
s being
> > > > > > worked on and we will convert this over in due course.
> > > > >
> > > > > But the miscdevice.rs change provides this to you, right?  Or if =
not,
> > > > > why not?
> > > >
> > > > This does allow us to pull the 'struct device *` out from `struct
> > > > miscdevice`; however, since this resides in MiscDeviceRegistration,
> > > > which we lose access to after .init, we have no means to call it.
> > > >
> > > > Alice is going to work on a way to use ThisModule to get the
> > > > MiscDeviceRegistration reference back from anywhere in the module. =
Until
> > > > that piece lands, we can't call MiscDeviceRegistration::device() ou=
tside
> > > > of RustMiscDeviceModule.
> > >
> > > That seems crazy, as ThisModule shouldn't be dealing with a static mi=
sc
> > > device, what happens for dynamically created ones like all
> > > normal/sane/non-example drivers do?  This should "just" be a dynamic
> > > object that is NOT tied to the module object, or worst case, a "stati=
c"
> > > structure that is tied to the module I guess?
> > >
> > > Anyway, I'll let you all work it out, good luck!
> >
> > If you store it somewhere else, you're probably okay. The current
> > place is just hard to access.
> >
> > The problem is that the Rust module abstractions generate a global
> > variable that holds an RustMiscDeviceModule which is initialized in
> > init_module() and destroyed in cleanup_module(). To have safe access
> > to this global, we need to ensure that you access it only between
> > init_module() and cleanup_module(). For loadable modules, the
> > try_module_get() logic seems perfect, so in Miscdevice::open we have a
> > file pointer, which implies that the fs infrastructure took a refcount
> > on fops->owner, which it can only do once init_module() is done.
> >
> > Unfortunately, this doesn't translate to built-in modules since the
> > owner pointer is just null, and try_module_get performs no checks at
> > all.
> >
> > Also, I'm realizing now that try_module_get() succeeds even if `state
> > =3D=3D MODULE_STATE_COMING`. :(
> >
> > So in conclusion, I don't know of any way to provide safe access to
> > the global RustMiscDeviceModule value.
>
> Odd.  How is this any different than what is going to happen for
> platform or other drivers of any other type?  Sometimes they want to
> only create one single "static" object and register it with the bus they
> are assigned to.
>
> Do we need to have a RuscMiscDevice object somewhere instead that
> doesn't care about the module logic at all?  And then just use a
> "normal" rust module object to create a single instance of that which
> the misc binding will handle?

Actually, I guess we can access the miscdevice in open via the pointer
that misc_open() stashes into the file private data. We don't have to
go through the global variable.


Alice
