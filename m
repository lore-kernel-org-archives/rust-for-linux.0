Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD7D1A2399
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 15:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756704; cv=none; b=nC6WTIBYIWD8oSG6m4hu2PMEEFcARIX9nLpCx2XeSaqB1pBBc0ZK+gx7bQmQx1kAHlG6wyLmC+EV15yZoNvkvrbqyMIT09JYWKhNoIK2zIybytpDIj6/ZsnTAV+dvM/9cZpkXZkReLq7bcs/T6jI+twl1iUJDSH+CgNgSsgZ6mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756704; c=relaxed/simple;
	bh=GOOKCiRNospXnF+RV+ncUhx7aYYZcIfAvAE0jNhSHKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QObceW5dS1nbTOdV0KSbZ93vTjyaV2Qit3Xkdw9RPHCIwcVMgt1ZI7Ita2u0Du6nQksgS7AcTJ3snKcV7aLBC8rsxbzuNbJxYja3vwEIf5P5s4zuWe/SXAEAzUk7/4ibDxgPVywk86Ws54GP477CbmWP9c4iLcUpuizsL5dCZPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OEUiRvS1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OEUiRvS1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a742481aso42686555e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Dec 2024 07:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733756701; x=1734361501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezn89nmMHt3a4Gk2YmXU8FyBpaEaviUGfCoPxT8X+qU=;
        b=OEUiRvS1g13/DgQNKbb5N9cF0nIcuBPX5O4qcIbz8jX45MhJ9otTn1BukRb39KIH5q
         JEejevWllgTrfrx31zGMlBwIDVneEt34G9K9MyO+9ZwMCcssHMMjKz70FVaRvIO9Y+3K
         d8fmNz95DJCtvHYWDi6BtgPkL/lru6RGQcvX7OtEOOaY3ZyX5AI4NA+mMwwjQuZfWPDd
         Wpdiss/hMQ4XDviuTPKjyqSUc1joj3y631Cv5ql3sgZhmFYwscNBHsMP47Kgt5bu514i
         QsLWIrTRihv2i1P8QpoRRbsH0pAtsgfRsgBRUetkfvL8NVC1pVcWt+cvHFkKBD1En1H/
         ggBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756701; x=1734361501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezn89nmMHt3a4Gk2YmXU8FyBpaEaviUGfCoPxT8X+qU=;
        b=ucS5ci9d5tm/klAwY4TlkqyBeN7VJ1qyE1KcgDkBUZvKxMmmyvLlAeWvI5z7YIkBeX
         isX6NU/ijfapYyIEkqv+WkPBVxJH6YZwjqoqTHlGel3or/d2NvSWSOqHZAmDCGjxtVJv
         A2lYU6HWWcJCltLEW88cw2P/47pIJI14ifzG/wUxC6G5YylW8cqwm0QmYROKPD9ba1N9
         Q1ogOGdqTae3FGrn2BYuqKf+2LRyRNIuXZ+6hkv24ZuVRnfvY/PLSf1MD/zWEWAsQxdW
         b/IVWseXxjc7MjSh7HAH4Lta8CuRE9lguH08C4KJgv7x4vAavMoQbJ3IaQQP8b1o53pY
         W71Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVgrNdSrwb8gzvmJ78OzxHDVfmniGEOqEqP1En0asLa8rfBX0X2Qu+NkpoLqTPKOKg9l7YiAu25GSSCiKaLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMIxMJP4m/M6+gpKClv8i0ImDF++1JhESvCV6koKF1q2XSKvB3
	Fg3TTQwHMcwL8g/y+IPwz7AljaUiSzQJIR9QaJshhbqFP4Xk6ENbL1Dd4LsNZjOmzdatAEB+KqC
	6gl5yYgmwZ05zgxt0xiih8RniDhtR3iU7FjCB
X-Gm-Gg: ASbGnctdwCRzgYAxJxGaeaXRF3UTOcq3LhQjpJGrlNyU/9Od5SUY6d3+qvmNEducpAh
	8fj0MNHL1L1pzHi03mFTiY4Fh6Ld53TZvVU9JcGV0VDfWB1Euj1B50p+pKHQKyA==
X-Google-Smtp-Source: AGHT+IHARy2pp+mkARCLjvba0y2x8gM4wwzt9yhM7UBN8pF5mt6au3buMyrotXz1sOrdemtnJyYsbglTDwW+Xa2zG04=
X-Received: by 2002:a05:600c:a48:b0:434:9fac:b158 with SMTP id
 5b1f17b1804b1-434ddeae4d6mr91859435e9.1.1733756700704; Mon, 09 Dec 2024
 07:05:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2024120925-express-unmasked-76b4@gregkh> <CAH5fLgigt1SL0qyRwvFe77YqpzEXzKOOrCpNfpb1qLT1gW7S+g@mail.gmail.com>
 <2024120954-boring-skeptic-ad16@gregkh> <CAH5fLgh7LsuO86tbPyLTAjHWJyU5rGdj+Ycphn0mH7Qjv8urPA@mail.gmail.com>
 <2024120908-anemic-previous-3db9@gregkh> <CAH5fLgjO50OsNb7sYd8fY4VNoHOzX40w3oH-24uqkuL3Ga4iVQ@mail.gmail.com>
 <2024120939-aide-epidermal-076e@gregkh> <CAH5fLggWavvdOyH5MEqa56_Ga87V1x0dV9kThUXoV-c=nBiVYg@mail.gmail.com>
 <2024120951-botanist-exhale-4845@gregkh> <CAH5fLgjxMH71fQ5A8F8JaO2c54wxCTCnuMEqnQqpV3L=2BUWEA@mail.gmail.com>
 <Z1cGWBFm0uVA07WN@pollux.localdomain>
In-Reply-To: <Z1cGWBFm0uVA07WN@pollux.localdomain>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 9 Dec 2024 16:04:48 +0100
Message-ID: <CAH5fLgisVC15muFB0eThiMveFBoauB4jUVwW9Zez3cKT0Q=_iA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: miscdevice: access the `struct miscdevice`
 from fops->open()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Lee Jones <lee@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 4:01=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Mon, Dec 09, 2024 at 02:36:31PM +0100, Alice Ryhl wrote:
> > On Mon, Dec 9, 2024 at 2:13=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Dec 09, 2024 at 01:53:42PM +0100, Alice Ryhl wrote:
> > > > On Mon, Dec 9, 2024 at 1:08=E2=80=AFPM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Mon, Dec 09, 2024 at 01:00:05PM +0100, Alice Ryhl wrote:
> > > > > > On Mon, Dec 9, 2024 at 12:53=E2=80=AFPM Greg Kroah-Hartman
> > > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > > >
> > > > > > > On Mon, Dec 09, 2024 at 12:38:32PM +0100, Alice Ryhl wrote:
> > > > > > > > On Mon, Dec 9, 2024 at 12:10=E2=80=AFPM Greg Kroah-Hartman
> > > > > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > > > > >
> > > > > > > > > On Mon, Dec 09, 2024 at 11:50:57AM +0100, Alice Ryhl wrot=
e:
> > > > > > > > > > On Mon, Dec 9, 2024 at 9:48=E2=80=AFAM Greg Kroah-Hartm=
an
> > > > > > > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Mon, Dec 09, 2024 at 07:27:47AM +0000, Alice Ryhl =
wrote:
> > > > > > > > > > > > Providing access to the underlying `struct miscdevi=
ce` is useful for
> > > > > > > > > > > > various reasons. For example, this allows you acces=
s the miscdevice's
> > > > > > > > > > > > internal `struct device` for use with the `dev_*` p=
rinting macros.
> > > > > > > > > > > >
> > > > > > > > > > > > Note that since the underlying `struct miscdevice` =
could get freed at
> > > > > > > > > > > > any point after the fops->open() call, only the ope=
n call is given
> > > > > > > > > > > > access to it. To print from other calls, they shoul=
d take a refcount on
> > > > > > > > > > > > the device to keep it alive.
> > > > > > > > > > >
> > > > > > > > > > > The lifespan of the miscdevice is at least from open =
until close, so
> > > > > > > > > > > it's safe for at least then (i.e. read/write/ioctl/et=
c.)
> > > > > > > > > >
> > > > > > > > > > How is that enforced? What happens if I call misc_dereg=
ister while
> > > > > > > > > > there are open fds?
> > > > > > > > >
> > > > > > > > > You shouldn't be able to do that as the code that would b=
e calling
> > > > > > > > > misc_deregister() (i.e. in a module unload path) would no=
t work because
> > > > > > > > > the module reference count is incremented at this point i=
n time due to
> > > > > > > > > the file operation module reference.
> > > > > > > >
> > > > > > > > Oh .. so misc_deregister must only be called when the modul=
e is being unloaded?
> > > > > > >
> > > > > > > Traditionally yes, that's when it is called.  Do you see it h=
appening in
> > > > > > > any other place in the kernel today?
> > > > > >
> > > > > > I had not looked, but I know that Binder allows dynamically cre=
ating
> > > > > > and removing its devices at runtime. It happens to be the case =
that
> > > > > > this is only supported when binderfs is used, which is when it =
doesn't
> > > > > > use miscdevice, so technically Binder does not call misc_deregi=
ster()
> > > > > > outside of module unload, but following its example it's not ha=
rd to
> > > > > > imagine that such removals could happen.
> > > > >
> > > > > That's why those are files and not misc devices :)
> > > >
> > > > I grepped for misc_deregister and the first driver I looked at is
> > > > drivers/misc/bcm-vk which seems to allow dynamic deregistration if =
the
> > > > pci device is removed.
> > >
> > > Ah, yeah, that's going to get messy and will be a problem if someone =
has
> > > the file open then.
> > >
> > > > Another tricky path is error cleanup in its probe function.
> > > > Technically, if probe fails after registering the misc device, ther=
e's
> > > > a brief moment where you could open the miscdevice before it gets
> > > > removed in the cleanup path, which seems to me that it could lead t=
o
> > > > UAF?
> > > >
> > > > Or is there something I'm missing?
> > >
> > > Nope, that too is a window of a problem, luckily you "should" only
> > > register the misc device after you know the device is safe to use as
> > > once it is registered, it could be used so it "should" be the last th=
ing
> > > you do in probe.
> > >
> > > So yes, you are right, and we do know about these issues (again see t=
he
> > > talk I mentioned and some previous ones for many years at plumbers
> > > conferences by different people.)  It's just up to someone to do the
> > > work to fix them.
> > >
> > > If you think we can prevent the race in the rust side, wonderful, I'm
> > > all for that being a valid fix.
> >
> > The current patch prevents the race by only allowing access to the
> > `struct miscdevice` in fops->open(). That's safe since
> > `file->f_op->open` runs with `misc_mtx` held. Do we really need the
> > miscdevice to stay alive for longer? You can already take a refcount
> > on `this_device` if you want to keep the device alive for longer for
> > dev_* printing purposes, but it seems like that is the only field you
> > really need from the `struct miscdevice` past fops->open()?
>
> Good point, I also can't really see anything within struct miscdevice tha=
t a
> driver could need other than `this_device`.
>
> How would you provide the `device::Device` within the `MiscDevice` trait
> functions?
>
> If we don't guarantee that the `struct miscdevice` is still alive past op=
en() we
> need to take a reference on `this_device` in open().
>
> I guess the idea would be to let `MiscDeviceRegistration` provide a funct=
ion to
> obtain an `ARef<device::Device>`?

Yes, you take a refcount on the device and store an
ARef<device::Device> in your own struct. You would need Lee's accessor
to obtain the device refcount:
https://lore.kernel.org/all/20241206090515.752267-3-lee@kernel.org/

Alice
