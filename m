Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DCC1F30BB
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 18:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571380; cv=pass; b=U7OS9O9NbYABim5m18zDmzUMflzyZMyAxMkw4ZzvopCPbg3BIleYUadprwtGhht0okSfbavGLAr+r/VO6tiO5WnqnDjbBNLRQ4haKzUwlaUjBUEnD8opWapSijfXRXMEv5mlYBayuyHb++Fr6cB5ZX7GdTqKiBoH/2yN2LiiHPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571380; c=relaxed/simple;
	bh=BRTNEQ4O2F84GW1j1IDa+ZoiMoKj1hSznZ9zfsgkfIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/WGH5IaOSl8+DPrF9PiIG9Xdtr4Aip4i9UfxvSIswgfI7hScpR0s74QkiEGCOcu+i10tyRsO/voMzYWzQU8jPVdQM1laXIQRSbZxY7QeuAPzfso4VlTH/W6j603LknDMlL6q/38Fw7ANiCjAsHxWdXwPcFAQ9b28A7uBM93xow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MtoUy+to; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MtoUy+to"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-382ef647e20so9908925a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Jul 2026 11:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784571379; cv=none;
        d=google.com; s=arc-20260327;
        b=fmee6lqNU2up7xISX1e1QQooIsfCAHrv1Vz3U6Z4SJup6By7Rb3kGZcmi0fCjxk6/t
         XohymTUa2Qdci/DPNCHa205WO13lhOgGQbr1l2+/28WbzSfeoLNzCAaaWmjuXOnSN9Qq
         AzH0A+vlIKoJnwvWrGawcr2CRlOrs0APB384SDaUGkiBZJn/jy596uO5bNIe/tVoQz8w
         FZ/THFidrQdvFpy8oaatoDz8lcutmVznVyoU90DzpNE+dJM9c+dYM2Ca7P2YqJ3goHo5
         HW5jfVmQnX6s/EGHjSZI9BjPjQo1gF5o1PWWI8mbftYfGDhorNPfaaATWt/PTKnHtKUD
         h09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XcbLbMlAxU3FFYmHV6MHSiEe84/hA+evMZkKwSS6324=;
        fh=p1Ziclq4FwAwaXimqIRSklgENIoeiq1S4XV4zD7o6Es=;
        b=CNV4BgDu28ypYEM4Gs99uLNgDPXZU3mm5dyK1Y77DRVk46/xNb3HlgNpbRoN4jcjBR
         DQ4U5y5KutRUR+L0+cJV9vOkEeBi2DlkT0fqIGfm4ecwCYbF8711XGUtIyucGQmmKilz
         CXHSOQpjblwg447n7JhVmSJem9F4QhfhcwWaZdrBQCx+hS8lQoNwIHOkGsuHVVUhnWmk
         R/jV9Fc/TeySiIshLbM2DKN/Fe21RwVWZiUCs6nNcels9tHxe600xx1yBmOwdBRIHP9y
         oRVWYCojCR61kgB+uOkPMv2CVPEKejSbAfK8hfBiXumcra0TIPv5sVMcnPas8xXiYRhn
         tNwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784571379; x=1785176179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XcbLbMlAxU3FFYmHV6MHSiEe84/hA+evMZkKwSS6324=;
        b=MtoUy+toza1egkCGmOVuN+Q24SxV6reiLhdWIJlIqAYl42zQ6oYlTjHXokAVyoHyWv
         L0A8SN132Ov3MVTBHyHoYbEG0QhO2KQcMzWfnEa+r7xrIwkgFJwnw5zVjuzKNo6XOopC
         sJa/QvdoBetvKTHro++IFPT4u6dSkW/r3L7RZrga/XjmTT7cMzEill2BGi3C0qL8SDT4
         KHgRFSVqQDUVveGi9tyKVrrV94AvXD+eTeghLPLl9zlBFfgdOICxvf7Mf6OEBgBqzgO1
         QAs4AQbXXH6rrtfrulvT5vHiKfv8wZO5Ko8eUkPtKacHThMzcwL7xGN2VhjN35BsI3L0
         b8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784571379; x=1785176179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcbLbMlAxU3FFYmHV6MHSiEe84/hA+evMZkKwSS6324=;
        b=Sa1LyEz72gwjK59Miq+DO7+/mgoN3m8TuwFyQ96rsjwV6ACnMTXLr3OfJEIO8QFRG6
         JN2tNDBXzE22zjfk4NZ0hjj5OxEYvn8UkTn+DtfCbgvQzmN1UahOX7fXrfvxlQADZ6rX
         XTY0+v4yHqyZnZrRjuOzGbnATrj4StO7jbg/BY8xrq7Q9XVbAyIgax62ARPds0Hlo6O+
         ZoMBHp0uKobQmT7sXL2x9CcDXpzskMt09mtCVwYdfXntgYlkvcc13UEdY2D+ibMvZGyX
         ePuRLtBYMWQnfNs3qwISKvpPADADQ64IaMGYF4xHsEiKxKXnfnTXNXgbIGsK5T8ZB9NA
         +jIw==
X-Forwarded-Encrypted: i=1; AHgh+RrIIAHJQWD2CcoaHdGGgEfJDpdAEb+NxqKW1d8D9BgZB+Yhber9RXXfHPRVKFPNfKu341GyGif4RGOlF5XZCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrbhxu4tUHFxkcQAMrUIH8tmIO498EGj8aTcdO7lRQaKIEapao
	zK3ykz1a4ElWC/WmQg9obnZEPn9rrFJIh9cmuLTys0r9uKnSAtJ47wkyvUrRVnmql5um7lxI3kI
	rKOmnLRwwCuV7Dc2fNjSAqR16xbRRhoHKCfmy4yc=
X-Gm-Gg: AR+sD11/YfPzM8xNiHumvQzVlVUm0NmhERe0vX6JcoIxGCnXJbI08hNaAPyZqigqxIm
	Zz5droJXomJzDEcMPVPm4MYh6MksFUveosrOoRDK3AQl1RjBE/kbd9pYahJAJ10kSYooYpQ/PGv
	UKLM0nKHj2PUfGSIWyS3uQN0EsU+MRU1/mQCnqXJETcN/Nu2ECpnak2O4vTQWezh9XkR3N1V8Te
	TIsl6NRe3YAaT/Mkyex0Vdrh5JmmPvX8+3ZWv7WbkzIu67gop8xyFClllM+CJSaW07B/K0pdQJl
	rxRox71eKBVh/mmLXM/SCh0uzGLPYSBmRlonUDLID1PXT+abmA9P/DgvyTL6GaJmkM8uUDzB5yA
	xBdW1ajKCUswY
X-Received: by 2002:a17:90b:3ec7:b0:38e:7eb:d07b with SMTP id
 98e67ed59e1d1-38e4b55affbmr17282364a91.34.1784571378108; Mon, 20 Jul 2026
 11:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717042247.3634961-1-tomo@flapping.org> <20260717042247.3634961-3-tomo@flapping.org>
 <DK1SRBA3315M.32N4T8QQBUOER@garyguo.net> <20260720.184751.938933263969124163.tomo@flapping.org>
In-Reply-To: <20260720.184751.938933263969124163.tomo@flapping.org>
From: John Stultz <jstultz@google.com>
Date: Mon, 20 Jul 2026 11:16:06 -0700
X-Gm-Features: AUfX_myBVTGUs1isUDf1xFdHYpko8PRfK5j7XAV6SZGEdyYIniKK0dkFdMXduI8
Message-ID: <CANDhNCrKMdHCmL76LWCROVF2Ly-9NxmfmQ2T+P=iv34aVkO2uQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: use Delta and a Jiffies newtype for timeouts
 and delays
To: FUJITA Tomonori <tomo@flapping.org>
Cc: gary@garyguo.net, a.hindborg@kernel.org, aliceryhl@google.com, 
	arve@android.com, boqun@kernel.org, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, 
	tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 2:48=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
> On Sat, 18 Jul 2026 16:20:10 +0100
> "Gary Guo" <gary@garyguo.net> wrote:
> > I wonder if we should have time types being generic over units. So you =
can have
> > `Delta<Nsec>` and `Delta<Jiffy>` and `Instant<Nsec>`, `Instant<Jiffy>`,=
 with the
> > generic default being set to `Nsec`.
> >
> >     Delta::new(42) // Delta<Nsec>
> >     Delta::new_jiffies(42) // Delta<Jiffy>
> >
> > Thoughts?
>
> I think making Delta generic over the time unit makes sense; Delta
> <Nsec> and Delta<Jiffy>.
>
> However, I don't think making Instant generic over the time unit is a
> good idea, even though it clearly is for Delta.
>
> Instant is already generic over ClockSource, and jiffies is not a
> clock source: it has no clockid_t, it is read via get_jiffies_64()
> rather than ktime_get(), and it cannot be armed through hrtimer. That
> leaves two ways to force a jiffies Instant, both looks wrong:

I read the above and thought, "but jiffies is a clocksource":
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ker=
nel/time/jiffies.c#n21

And then I realized there has been some unfortunate naming overlap,
where it seems the rust ClockSource seems to map to the clockid_t, not
to the clocksource concept that Linux uses to abstract the hardware
counter used as a source of time (for the majority of the clockids).

Very much a bikeshed request, but is it too late to rename this to
ClockID or something? So there is maybe less confusion when reading
across C and Rust code?

thanks
-john
