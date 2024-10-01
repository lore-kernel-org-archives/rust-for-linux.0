Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5029A19D886
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Oct 2024 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773997; cv=none; b=DV2TuexTBOdIjlp/jZ7/F5hZh7A7NmYQ3HvW6JKShG5xzKC19Y6MRk0FVVIxPRU81vhZCBB964anENIa47SWiidYmGd3dcoVaouRxEJZAVl3oCkO/CUHMln5C2UEjrV7BBJ99Je5bimYiRjncF0Maa4ZcH1qn52EiqwKbrniUMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773997; c=relaxed/simple;
	bh=icegb0pL2qbdDUASsVDPbVE5YcWxzi60TMK9YewrNjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QXG6kQ/gh7Tc1Pym0AqXFjslKrgG4yVk8xrNvR5MtxO22Tmv5eMyfPHBMv0YnUo6mhnUmg8iqXBXXtUqqv2Kh5TOfZh+9viA/6eb1JKFwctdXXpDfTfpDgDETxCmpvZrGAhAL7ACVYrewMG6j0aopxU8si8fJ0NjMeurpP8hQFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PWpspQiS; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PWpspQiS"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3770320574aso3556019f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Oct 2024 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727773993; x=1728378793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9fBdWWDj6fOst+uTdJOT76rvj+EDLa+s01mSNdgJp0=;
        b=PWpspQiSRg50gToc6umua05afvlx/n2ly/LH0bGA9bIoFb6MycaV6jLBwb92sDIHVi
         fZGyPZtpKy87T4Mx7wVv17eRXfneAq4V6cemXbTuHBShcoeRkyH5E0pBQKPn3JprMk1s
         tCPwYfNyKd8SBOX8hDGIAF2yZ8M+SawF6eS41H3Jbnp29ieBG3nUPWFS5l09V+2RAMzf
         K3Nt2GX4OUbZdbp8BDbet6UjsdXb5/XbwD/Rkaq540C+rgBa4G58j2T9MqxojGgKNdaQ
         WdM4QWuuqT2eGnD2Gi2n0n5uyBLaUWSaYMlGA5o+DM30BctIvN9N8hn7kPcSBeYtsGWq
         VNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727773993; x=1728378793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9fBdWWDj6fOst+uTdJOT76rvj+EDLa+s01mSNdgJp0=;
        b=DTAhDtDMCcZK7FKtG8qLM13HAnsnlNPsu/7NuNVJV1xnCmJkjnW/sxD8n45V36T/Ke
         ObSChshZP5AF90ioHBoBWD+iRcehQz1++TDamei1E/I6qOWBtgrHoXp5FgANKs6TSzAP
         20cvVH9GFKcNbMhHKawCIWQW/N/Ec7sx+btEGkktA/ja8svqpkD5bKzD+BYfFGmZiPlX
         WGJfoB6ebbp0Xc5E7Kk3Sdo38dlzdnDWtlhW6QPbwWRRr9tpIHwx1BGrcaRhluVTVSn0
         LRN1Seh0nkBBgDAhvglL3oJE/kVZWZ9aEQJJQTIGAfc5EYgVaXPMYSqWQwUDR3JeBlST
         zusw==
X-Forwarded-Encrypted: i=1; AJvYcCWZuHUspanGsb4q7PBKh1bEief1soiNTAs4D7ajmHx8/47v9/6f/aOyBYNFB6fDCPkb24esbDAlb5QE5BD6DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjCzlj8pEi4QXpHZyISG4ZRI4g1XP0gpE916hnPSY0ple2b6mz
	ROcFq5Dks0srHOs35C3mdRGLku9hsHGrv3oykXovrk7T3iZU3CSJ9tdd50f7zzxil6F6mbrLDti
	fFlMLtqHGjuslIIFSFueLbt0jNGTXysWPQwgm
X-Google-Smtp-Source: AGHT+IFgU7zCWKFIxKy1DfT3m8rNSOqxhergloVQ6Xgu0kb9+slgAkmLbC7op6hq7zmCb+3at5j3LcLeTtFhS60Ms4E=
X-Received: by 2002:adf:f08c:0:b0:374:c1d6:f57f with SMTP id
 ffacd0b85a97d-37cd5a606a0mr7144966f8f.7.1727773993290; Tue, 01 Oct 2024
 02:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001-b4-miscdevice-v2-0-330d760041fa@google.com>
 <20241001-b4-miscdevice-v2-2-330d760041fa@google.com> <755a5049-d6ca-41de-ba49-16bda7822fe7@de.bosch.com>
In-Reply-To: <755a5049-d6ca-41de-ba49-16bda7822fe7@de.bosch.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Oct 2024 11:13:01 +0200
Message-ID: <CAH5fLgj+KtgZWx8XxCLPCera4VaqfdyUucpj9HthFViq6_Df9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: miscdevice: add base miscdevice abstraction
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 10:54=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> On 01.10.2024 10:22, Alice Ryhl wrote:
> ....
> > diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> > new file mode 100644
> > index 000000000000..cbd5249b5b45
> > --- /dev/null
> > +++ b/rust/kernel/miscdevice.rs
> ...
> > +/// Trait implemented by the private data of an open misc device.
> > +#[vtable]
> > +pub trait MiscDevice {
> > +    /// What kind of pointer should `Self` be wrapped in.
> > +    type Ptr: ForeignOwnable + Send + Sync;
> > +
> > +    /// Called when the misc device is opened.
> > +    ///
> > +    /// The returned pointer will be stored as the private data for th=
e file.
> > +    fn open() -> Result<Self::Ptr>;
> > +
> > +    /// Called when the misc device is released.
> > +    fn release(device: Self::Ptr) {
> > +        drop(device);
> > +    }
> > +
> > +    /// Handler for ioctls.
> > +    ///
> > +    /// The `cmd` argument is usually manipulated using the utilties i=
n [`kernel::ioctl`].
>
> Nit: utilties -> utilities

Thanks!

Alice
