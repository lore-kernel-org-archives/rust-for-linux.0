Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900265616A8
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 16:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883453; cv=pass; b=aOk3OLkVOOV4M0qu0LilCcZWaNTg5RYSv6IZkZbmDk9uFk9aSKfbCIua7e0jElqlQJ2soncqnQzYx8llWAhFQBO7+6zAlm4naTBpNBLKbsb0CWwpZCskVeIeKVOihEV9ArqvL3xJJ+CFbsHkw/qwfGiwyPWczZm9IgQEKWO94tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883453; c=relaxed/simple;
	bh=uy4f6Kdc75tGu226T9MOyKUIXwCE0AeSTkoqwgmc2T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y4dgX4mLNax/qIHszg07PayiXgeotcNqY/WN8k4C/nXul10I6isTGiOzq7Cw1PquuR1jhYDe1e4If2n56NpCKtU2tQ2l/LKsw7NmzIzE9293A10u1/1Vbu1ku3GtxSbTLZEpX5zbWQFQ8g4yW2QnanYCoRwF45EbcO3X3qKow1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8eJg1JP; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8eJg1JP"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97cb5c91d5fso89788241.2
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 09:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883450; cv=none;
        d=google.com; s=arc-20260327;
        b=i98rAF7INSJ83k8VvvBG3G+zgj1UJh0fBBt/t2jL+N00ecfmXwL1UfMQNsK5BE321k
         9lIAl/AkcC7ZqkUYlSq2dFViQaJFNLahtALhyUcX6wAWfH/urLb6z8yi6OdCM67tMMRo
         9Wch8maNcXWuJMUWOz7ImF5Ar+kGQBByivcK/L1o5mgFZTk7RaNBtTyNSQGsMBs/K1ws
         +RclM5lBk/J5mPDjt1qccM7o4sfaRH/mjAW9IgDqDr4118i+nURmACzJTAZkpFBXlenb
         RNsYywETptat5Il6YD8oA9VgeecnKuduG/4H+NkeKfPdySjXaxO1ZoKKSPlZPHrtpfRD
         k+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nt0kh0XYrPSHGJubgJUC0bfBx9LloKYXdOD5FMiKas0=;
        fh=3qoGxlkfrhd9W6BS1YEklrYbN4hYrYuIEtEskd52rCE=;
        b=QvKSN61EKFbtQ9Kr1GtxopreCD84+VwQtSw64Ap6eN5tnFtx3B8lnor23lqnFLRM8a
         euF45wSclTh0TVg4e/tuK5dnCb8v/74jq3BHKAbSDkhwwv+14xCP10u2Lrg0+84a49zw
         lb8eyI4NYsUm1o3nMlqE/9NiAv6DDNR4fhvPqO+STGDSQJN5enV7eni2RRttwGgevI3/
         zhzEy2lSfor4Ft0CyLjWY77lm/KAv6gSpKJttowzXcdcSGO2Pwmy/bQR/hWHr8iIP1dJ
         NVyHmGs8YwdgGCMHFGxGFSJkczZkNKZdtNrRuWej1nuRRIX1O0E5H70JdFQmf5XNspEI
         yXVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883450; x=1789488250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nt0kh0XYrPSHGJubgJUC0bfBx9LloKYXdOD5FMiKas0=;
        b=b8eJg1JPoG+Gbh/kbk74UvSjzM0KTnl1QMEiVUZQgC5qIaC8bKzWUOKp3zU/bzMHcW
         DGLopUwf3rrnTyYE9s5XljN6mEjbk8E2HnmFQSUFrTR9IA2otwg8QBhiSg/pcwvbS65g
         lesjUzDMxk/9iH0RVryCMeBrt4OLGWrj1K5kVx2ryQMMlWb+d3YV8gen8mz63hyKlluE
         apW8x8RedsYgyMLM8iUUw/KYqcHTGKTAxY23iJ6Nl6o2KklbsVmpylijp5mVXnP9+Cph
         JnFczgjGVFZIF1OINh4UHYy32yGNW83wOLoKXRDkQWGP+jV2d4IY37jpx3yjnUPx2Te7
         kDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883450; x=1789488250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nt0kh0XYrPSHGJubgJUC0bfBx9LloKYXdOD5FMiKas0=;
        b=gr0ip3Nbf7HbrxcEokjg67NHRxGBMY/OKBxgj5Foq6lhZU0l2vIIPFZFsDnmEOZvly
         MWfUE5r4g8U1/9Cvppme140c0+Db/ceswYVZx55DExkJC07IfuSM+9gnN20cyomn0Uls
         8Uc97K9OrMOSmQyVwA1D1ECvyZaQP3IePK4K5xmz+jDpFaYUYkCl5GmsiT5L45uFiJeN
         l9Mt/HgnhV89asg/ODLepTM68kSkLG8399iPiIvB1vB+8xZafHgHtWawFB4M4GFKE2Pn
         tzzJIuv09kHvF4hgMCY4cfyT4vqVMErDpwIXVeb1ozu/3Svq39Uj4mT/BDE5DUu8EGeX
         m4oA==
X-Forwarded-Encrypted: i=1; AKwUvBwgZwnhkOBgzn4ENsiJ/vF+FqeTsTxI1AnPoab12jpbu7cZIdOeXfBxkjXMgBofgoygb5eCMG2w+iRRZXxJIw==@vger.kernel.org
X-Gm-Message-State: AFuF++ndPxzEXtT2Ky9gV6vg35ic+s9OUFm27DTvzvyHwDS53iMDOueN
	QrgGudDNVCfMDrGrUcG+9YNGkRZU4XR203tekY/94levKW/KKEA0kual2K+1BBNLD2AOkS7vCP4
	9zpOTl+RfZCCdwjOjBLvfxwl6Z73SwSo=
X-Gm-Gg: AYBFou0mUMzUX9lYYVoT3BLIyFS2k0IpHl3Xjncd/vq5B0bZ4VwJa66H2p+GbjNBCTx
	gwUgtla7MsXNgJ9sc53+yrMm2E02qSgYx/B2yDwk1OuyqlqPXR7gkWUUDuqoyYcwZK3OkEjNq7i
	gu2ejdN59CPoeZt9Jeu9k0NtWNCUZl8LMaGXEsfSdbhb/W4JsfUROBAfTna5QbfxGhdbQ7ad4ew
	OOEzjNLlWrgg+wiAP6oI8Qn3fEP4el6x7xkF8+3E6Ip9iWwpuTsKTiEBQRgw7+6R7RSR2f6gFOc
	IL40yl40ht11yP6T/NQI91HEkckvZk9atQew4TGC4a9xh9RwrsEvQDqRcV7/FGdSe+XLdF0AahR
	TDjF36giNuA6iDiLfdhzZUGkrGCoJNxk=
X-Received: by 2002:a05:6122:a5c7:10b0:5c1:24b6:a1e0 with SMTP id
 71dfb90a1353d-5c7fbaf3b05mr2679642e0c.3.1788883450339; Tue, 08 Sep 2026
 09:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831183311.1090131-1-alexander.deucher@amd.com>
 <20260831183311.1090131-2-alexander.deucher@amd.com> <aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info>
 <e8a53eb241b2cc912e9cfad5f6a0120aa9683481.camel@mailbox.org> <apyTR-f8W6Jt7uP5@soda.int.kasm.eu>
In-Reply-To: <apyTR-f8W6Jt7uP5@soda.int.kasm.eu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Sep 2026 12:03:57 -0400
X-Gm-Features: AcwNN1UGWQ08V1C6NZZQaio8lehal8RQn4GKIdJFwvOdWZL0ItwTZuEEeLAGaiw
Message-ID: <CADnq5_PjN8X9V0PQ=no39NCAGM9Hp1JezOuKNpHqwo1=WfsPQQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/gem: Add callback for when handle count goes to 0
To: Klara Modin <klarasmodin@gmail.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Felix.Kuehling@amd.com, 
	Mukul Joshi <mukul.joshi@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:25=E2=80=AFAM Klara Modin <klarasmodin@gmail.com> =
wrote:
>
> On 2026-09-05 11:31:41 +0200, Manuel Ebner wrote:
> > On Sat, 2026-09-05 at 07:36 +0200, Thorsten Leemhuis wrote:
> > > On 8/31/26 20:33, Alex Deucher wrote:
> > > > From: Mukul Joshi <mukul.joshi@amd.com>
> > > > ...
> > > ...
> > >
> > > > > error[E0063]: missing field `handle_free` in initializer of `drm_=
gem_object_funcs`
> > > > >    --> rust/kernel/drm/gem/mod.rs:265:58
> > > > >     |
> > > > > 265 |     const OBJECT_FUNCS: bindings::drm_gem_object_funcs =3D =
bindings::drm_gem_object_funcs {
> > > > >     |                                                          ^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `handle_free`
> > > > >
> > > > > error: aborting due to 1 previous error
> > > > >
> > > > > For more information about this error, try `rustc --explain E0063=
`.
> > > > > make[2]: *** [rust/Makefile:799: rust/kernel.o] Error 1
> > > > > make[1]: *** [/builddir/build/BUILD/kernel-7.3.0-build/kernel-nex=
t-20260904/linux-7.3.0-0.0.next.20260904.221.vanilla.fc43.aarch64/Makefile:=
1442: prepare] Error 2
> > > > > make: *** [Makefile:256: __sub-make] Error 2
> > > """
> > > Full log:
> > > https://download.copr.fedorainfracloud.org/results/@kernel-vanilla/ne=
xt/fedora-43-aarch64/10951622-next-next-all/builder-live.log.gz
> > >
> > > Reverting this change and 2/3 from this set fixed the problem for me.
>
> That leaves only the documentation without the feature so might as well
> drop 3/3 too in that case?
>
> Otherwise, the following also fixes it for me:
>
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index e1ebad77ebe2..847e0ee38863 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -278,6 +278,7 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, C=
tx> {
>          vm_ops: core::ptr::null_mut(),
>          evict: None,
>          rss: None,
> +        handle_free: None,
>      };
>
>      /// Returns the `Device` that owns this GEM object.
>

Can you send this as a proper patch?

Thanks,

Alex

> >
> > Verified.
> >
> > Thanks
> >  Manuel
> > >
> > > Ciao, Thorsten
> > > > ...
>
> Regards,
> Klara Modin
