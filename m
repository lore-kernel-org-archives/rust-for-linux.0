Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3B53F20FC
	for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 15:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779118244; cv=pass; b=cuI46plt1J1AwseRNPsMQTiiRetNgZI6xFL0p/bpYlBplW7dVumJORtMUuLK2KsKYtTRVDWxT4yhPSlbNXkRryeIRm0DLM3wWI9ryGBguxS17mc0sFfRkB0SFmbutQwGWxhd/RKae5otgUVAKHZsd8KrnIEhgJ0803tGjNhMRRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779118244; c=relaxed/simple;
	bh=+vEAVXbtKXzJ0GXvuxhDs8SaYPlm9eBE4st/1y9OLB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kq9jpGDRjAYIfnEmekTYmfRNJFNoyWSar5pOd3Ks1M5V2Wx/9avE1KZU8Up8P4D92OgSZD+Lu+auALcR63QbWwExLQZGto5Wyv+OcEFFyH7RPaQvsf1ahTzXpM5fo5r4B6mwIm8BYXrWGxpq6OY+9p1JnSiX3CxoJkaZsGD3l70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BfXDg1q7; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BfXDg1q7"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67cd93d8affso3133628a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 May 2026 08:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779118241; cv=none;
        d=google.com; s=arc-20240605;
        b=ffkpn8Q/gahltOGCiQPl/MjMveyBqxP2YqYOOcvtSxDOGYlc8p/s63JXlrw/lnMqcW
         /wki1DGqHhuc/bi+8mi0/dcsr5Bh/b9ER8AySw3ut9lybvXBPm/Z7S5DZxJBTb4z+aqv
         NFQKk3LTlsaBvOHhy0gm9xl5sFcXrlw6v68vrIvupt8bFIhSCW/QRmZ3r/2stzGMgi5t
         wPEMLjQcv9itG4gzz18ijgIW1s47151ELdr2Ay5OfJ1HnxZWJb7245cC7GS8rvbHkP7v
         IHcBAC7YCH0tkpQnsoPmn7njKxWPzFgB4N8+W4AWuNlAl7kiMzS4HoaLfO8Kn2S7qpjG
         Y+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xr3YAMIq21QdocFyJjm+i04fdGwMmfXGaCTr4UYHbMU=;
        fh=kwa68NRg3twe94JHi72dncsQckx1p691VwI25/YA7Aw=;
        b=Oc9NnT1WIES7FzU0Vgc1Hh7X5NEMUEBs3v1tkIXo7xO/jP+0LdfhU4skhMIDvnOsbk
         CNwmkL048lFJfmWa224S3XePO7GsR3NgoeSW+DfshRUvsfu8ScL1vy2xSwUPGyWUjdW1
         IZDdYt3eIW8zpBwngZ8VzHbQiYoJ5Yzl6NlJyh4HOfMHZ2AZLcMxTsKOcDM1HsS/VxGZ
         AHn8xEQhpYWmM2H+FWcu3oQe2hnYCmrPjdvjS0PhfQAR5YGfMFHHqwEW4kODWP01rVlD
         SLWBt0qrsosTkqo/RTFsmSaPtVm8XpOuExhqI530jqQ0XEwmKCEKn6VmbVDxWM4j9cZC
         gkbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779118241; x=1779723041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xr3YAMIq21QdocFyJjm+i04fdGwMmfXGaCTr4UYHbMU=;
        b=BfXDg1q71xqo1GxUqY9kjk+ey6vMw6Y3UfayUMtvXZfI+gMC+1QjcrwYGZxzpGjooN
         6ZsgwzStd+56HcJEqsFUsDJ9lR2kT/sjbefCcrWa9fsNn+feLwYCkQ7k4P0IL72rA29q
         FHUG1TZmUWbwBkFft+tJpcFgn76pRkEW3lmqZbyE/oVIDAbcwiJ9BGwL1sO+TRADLgbH
         DXHqxGh5AXmG8zvDBjKBZpzt578ntOj0dVpjVyBMupR410NUyEzWCs0YR8VQ+/qYdO3c
         NrjXgFUX0rSoCwVfBXr3RFZ4GLL79JqBY0soGr0J3w6HZYHGNp+iAbL/RG7HC//VJOrQ
         ew+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779118241; x=1779723041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xr3YAMIq21QdocFyJjm+i04fdGwMmfXGaCTr4UYHbMU=;
        b=S3EvHRi6TSvVfq3qI7dG+OKi6xq9I0+a0fp5qI0oOmGeeSk+j/Uof6PVnXJkY4jJTZ
         vzgfS8akW3GbfeER7MuAusufInQM12SKLWKTXIvbT9f3PnaQHHHCsFM3Mn8XOLnYzQFa
         xBarJe6SNq8jZh4vA9zq6G0tyLa6XBwei1Z0sqj0Y20N9rorZTf7EoVgjMwBiQGbeVYO
         Sy+5LGjy8eFGd1gBVCT43yL4DWp+DVnLjR5K+80h993KnGjiKsZrUEPsLtkzBSJsHt/A
         jfipPmtcMxUNedS00Tuk7aYxNcy5QiSk8t69fkM1DOK0H5Fnl55+I75LcG4zW7FiLUP0
         fPpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+essKOWlG+O8aKHx1yp4BlevgCiz+GzF2m3zyhNzsxKx575ffx+Hmw1na+dZ0GX3Z3GWESYEp4d9iIO/gt9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW5GCiNgYcvIdTPBLZORoil3FNk/jpeOhDnM9jWt0KijnLrHG4
	HNuu2MJawxRTehf3x+/AvFA3ZTSZs2frB34zf0BLnc2JH98DEsxcT7ELinsu0uA5WM3EDXKushm
	bbC6QbdlmSdynZlOHowUrb8FcQ2xHysL/I1/EQm+b
X-Gm-Gg: Acq92OEdeO+YIOx93xjE5zwq8AVz8FtGaCelVguV9kcWO2TuHDa9rsAX7QVFWJSFG4O
	DyaIUQVhFsYNS68MBR+Ub/NSi4+VgNbCxAbH0/HkOMbNcVd5B5BmCMxW7M0DCRd+V6BM7pTcl4o
	73c/qnydaJtqHuQzxK8UbNZ72mSSTptiqcfVAgIPv9Slqg++tRgddtIDG/RlcobuJOXhfCfsUdm
	2BghxgC+prjaglBuhbjgK5BzGzxYk4YWbpR5HD6t1GahQBBMniMdXo8V3Jc1m3qa/WzQq24kS+P
	pIk6rE7O5SVT0ylIU+i1wMTDZ18krDQelsubmnI27pqsPDn/gg==
X-Received: by 2002:a05:6402:360d:b0:672:6419:8c23 with SMTP id
 4fb4d7f45d1cf-683bcda5f49mr7146864a12.14.1779118240014; Mon, 18 May 2026
 08:30:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512105920.2426293-1-japo@linux.ibm.com> <20260512105920.2426293-5-japo@linux.ibm.com>
 <CANiq72=dD5fw6XmLJ=zSq_k_ZQy8sLLMs3m1xjX=UTpO7tLisw@mail.gmail.com> <agst-5rhj2mFF448@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
In-Reply-To: <agst-5rhj2mFF448@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 18 May 2026 17:30:26 +0200
X-Gm-Features: AVHnY4LccPGnU2YDNrFsmFO2WMi9bKjMeNXkKx387N8Rm1kN-rPvvLiTL_jpEeE
Message-ID: <CAH5fLgjbrPjpYReOYdPs+_Omv3w18AttkSGyc-VNogPZDP90kQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] s390: enable Rust support
To: Jan Polensky <japo@linux.ibm.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, ojeda@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, rostedt@goodmis.org, ardb@kernel.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 5:19=E2=80=AFPM Jan Polensky <japo@linux.ibm.com> w=
rote:
>
> On Tue, May 12, 2026 at 02:10:52PM +0200, Miguel Ojeda wrote:
> > On Tue, May 12, 2026 at 1:00=E2=80=AFPM Jan Polensky <japo@linux.ibm.co=
m> wrote:
> > >
> > > Signed-off-by: Jan Polensky <japo@linux.ibm.com>
> >
> > Closes: https://github.com/Rust-for-Linux/linux/issues/106
> >
> > I am happy to see IBM getting involved and being able to close a 5
> > year issue! :)
> :)
> >
> > I backlinked there this thread.
> >
> > > +KBUILD_RUSTFLAGS +=3D --target=3Ds390x-unknown-none-softfloat -Zpack=
ed-stack -Ctarget-feature=3D+backchain
> >
> > I added `-Zpacked-stack` and a bunch of related links to:
> >
> >   https://github.com/Rust-for-Linux/linux/issues/2
> >
> > Is there a tracking issue for it? I linked
> > https://github.com/rust-lang/rust/issues/150259 for the backchain
> > feature.
> >
> > > +       if [ "$SRCARCH" =3D "s390" ]; then
> > > +               echo 1.97.0-nightly
> >
> > `-Zpacked-stack` landed for 1.96. Is there something queued for 1.97?
> > If not, does the beta work?
> >
> > Either way, I would prefer waiting until we know the actual version
> > number, i.e. without `-nightly`. It is just a few weeks away anyway.
> >
> > Thanks!
> >
> > Cheers,
> > Miguel
>
> Hi Miguel,
>
> thanks for the review.
>
> -Zpacked-stack: I=E2=80=99m not aware of a dedicated rust-lang/rust track=
ing
> issue for this flag. The implementation landed via rust-lang/rust PR
> 152432, but it doesn=E2=80=99t appear to reference a tracking issue.
>
> backchain: ack, the s390x target-feature tracking issue you linked is the
> right umbrella reference.
>
> minimum toolchain version / beta: as long as we pass -Zpacked-stack in
> KBUILD_RUSTFLAGS, we need a nightly compiler; beta/stable won=E2=80=99t a=
ccept -Z
> flags. In v2 I=E2=80=99ll drop the 1.97.0-nightly guess and set the minim=
um to
> 1.96.0-nightly (the first release line that includes -Zpacked-stack).
> We=E2=80=99ll keep the =E2=80=9C-nightly=E2=80=9D suffix while this remai=
ns a -Z flag. If it gets
> stabilized and nothing blocks, the earliest stable release that could
> plausibly carry it would be 1.98.

You should not add a nightly suffix for this reason. If it's available
in nightly since 1.96.0, then you just write 1.96.0 here. Linux uses
RUSTC_BOOTSTRAP to allow use of such flags on stable compiler builds.

Alice
