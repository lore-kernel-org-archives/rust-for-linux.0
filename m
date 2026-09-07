Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602342D7D3A
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Sep 2026 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787894; cv=pass; b=aULBVkEpvENo8yGpsM+P0ix9vBu2xgEiy3nSgFL/QO+DWnzWHSY7gEuVenIBXI/aNXzz07Cy33oUiDSEFEGdfWhbEHlXrqgKP7YIQ7GBDM8wFshXrS4Z9UugnAwtf95B+0yROCRrYc0Len/+Tv2vmw2OIphf0tDUdbLPzibPyKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787894; c=relaxed/simple;
	bh=D1wAsx4CR5aOXpjyMVJB7sUcHL24GlLysdFmwnbPMG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYZzrbd1o/T3PDF8EyV7Z7LurDTUUZ8m0Ap+zZR2uRYwh34i+nJWqeS4l4TRICqQCVeqD+zOAH8wDVU1CytcqRQfn5wnkQ+6DkwWf6CIRGKbVLhMm7pCvcvO9v80Sjl9AqIrYwks5CEy/e06XMjsNW1pwjkUoyamgKedSuA8QQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=spbupDgo; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="spbupDgo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-484362f5c4aso4499174f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Sep 2026 06:31:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788787890; cv=none;
        d=google.com; s=arc-20260327;
        b=pyMu9GPIde1fhyZEO0rdensNweey09UZbqFwn0BI8zyyGhGLOVQHjQweHImp3iW5BH
         VrAijhm9IdxZGFcC1kYoOcpTetY5Qf9R0ikvj1ZW8wYpe+MYzUNGEaorZPbbpzKYgQAq
         IfsTHLAYq/rMl+FHyCGv5iP6vlniQI1onDRCtOcFJfvZuXHiXEXr6/cbBnCaMqK+9O3R
         hRtXIeucVq3Cd3rsG5PleS4JPORGl+geD13jyLb5NHHTCWlNvea/LEu0TT70foi0Kequ
         yithChZhfhZThh7UihbP+Y9PIc4BWKB0oBehDm1X+lsTy/QnH052OVa9bAjbWL2rJtOt
         TKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MeIqMgyiOqWe7HQD7SmKTKpkW52D9bvAC89kO8GNV9I=;
        fh=FLkXr1o+T0TUBKX0GYea4RKfKGdmzRbeeeiQ9t+XOxU=;
        b=fosLohJF7hxfL+XjP1TJPer4v/nhSvPurtw+dePKMaCqFqolQVw8D+o6x2YALZBMjd
         cpEZBb6+YPSbUHfrgjbJN82uVCgnI44xY+yV0sSufvlj2oKKLG+4bTYNCyewbkJlZ5ph
         zigrq0kh8XCt6nNzheuQx3tKajpO+K/4PaOecRNaKycUEBkfc7v09lhLYrg4i71w9s5b
         ciCmMurWkEV5Ul/WlMNirb8UmOhrZI6z5ai15GHxxFH+ZCYKOZJgduazlX5gZDiS5ych
         FVXkfmO1b5vDpdfL9AcIDQejDbzuXZYH0e5ILDMFVYbYIqr1dXMhM84wPXLOFDSMFtYV
         85HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788787890; x=1789392690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MeIqMgyiOqWe7HQD7SmKTKpkW52D9bvAC89kO8GNV9I=;
        b=spbupDgop7EtF6LYBkWQ9ckcY2wRT7YansIOqBJI79GXYwzCjdWeTXINKquwY6cYHL
         JeI34Hi7pVztzOwg2+D34FKvq8mBKT0OY+YrhVyh2l7uVL7bMRTePOh58cUtRvqHNbI8
         e/cErHKimIHfmLqdeM/+yOBMDMxLAwncvOPUZGFHZVmzrvgfonGyh70Wgt3dVC0Ryhfi
         5MxWrQVYlhi1cByIZin5OUEF4VLz5TIs6hlPSfgt69bRxMdwXdNeTkSwgbkKVW/meyIa
         OEjQfhjojpo2i966P83w0kdEWn0tZb1NKgItBeFy5UYJ+5oCS/K4pB09uEd9bfrAJPJf
         JmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787890; x=1789392690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MeIqMgyiOqWe7HQD7SmKTKpkW52D9bvAC89kO8GNV9I=;
        b=O9GOCnzej231Ak2aCUdvdeT+IVvbNZ0gho2ZwP8RMLjKiIdhWsak/h/u2nypaDTrm7
         wa2cKtcjF90dSGxrSERRqglvfLtGnt0SUfdtXYzQEwSTsZdG1tK9yeAHLOHExQ/b0gC0
         dNFAKTCx4/G3t/H6Bkv4Qu7nCU1u2mgR6OUjAampDl/mAWLIVYnbNSiqsvvbcN/Jmn4b
         rwdl4jU59mL0cStTBtP4JoQ4xtdBfanCKEuBJJOvhMiyIMKszW0jpH7IniZMEFo72M5Y
         kyyE2D6eskyPUAF7MwsD2rshnGxxHe7coOqedm9IZbmpacFlCPJYhr62j2+g02GnVYFw
         Nr0w==
X-Forwarded-Encrypted: i=1; AKwUvByAbzcJ3P49b+P8dkdVHntkCy3SUF32N2MOqxp8KJPDgYS2K9zl96UVZmeSfU1KCVPfY6mDC+Kr0hNJaCbhfw==@vger.kernel.org
X-Gm-Message-State: AFuF++mjzxr0/ESeLoL5Ngro/Cyz8hJp6T0G1yPiFa5syKl2CnNoYRa2
	4q+GHEWyEQ+qykocxC7ts6AjqJ1EypAh/8OPU0AJOTyyZeIo6R/RSKMGJ//VucWIF9J5EMWW11i
	N91IgT+DboZgxOMQ4yN9ZWks9FrTWAYdIYmKOliHz
X-Gm-Gg: AYBFou3pcskX2HPOG076AGlqbXiv/UxohFLGMfh7Unl+eUcfrmlgeiM0JlP9veofa2Z
	cVA5/7iTp5U0Wdwb+UVmoZcpNCS9TNbzPeUxHkzFP+reJOyol2AwBqdr6A479fqMIxyV+T0Igy+
	1mgXHJ2k/WncIdhle+F2MclA46vWh83qyLs08a06J9mP8VdhEYjoJeQPPgcIyT/bermv9WVObH0
	n9O8y0g0tTT3Qvpjg5C7gYlMb4+F82KagZaa9KNW3CBZPwGQ2xtF/vPHG0hqIwwrn/Jc8nwHFGa
	fn0ex0otIj7BMcMcsTaoF1TJp2/2kYAOkmCgKmHeFyWtBNywCcAqYpU7hVbNFzsccIzN11WpQhk
	7sauMSqDZtyjzMPa91Y3vOxsmYmMNBm99+Bbc+V4XLg==
X-Received: by 2002:a05:6000:26d3:b0:485:8393:2176 with SMTP id
 ffacd0b85a97d-485870902eamr40614985f8f.21.1788787888668; Mon, 07 Sep 2026
 06:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-4-490735672187@kernel.org> <ao2WubjLtDuHvRzx@google.com>
 <DL894TFXM5AT.2QOXN683UKXIF@garyguo.net> <CAH5fLggAMfBcxprKJxs4JbieKadC_mKg4B0xNETOH1QUi72UGQ@mail.gmail.com>
 <8733vlxmm8.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <8733vlxmm8.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Sep 2026 15:31:16 +0200
X-Gm-Features: AcwNN1Umd_wQEAUZHPYxidNRM70dkjd7WtcOMgQxK1KjbblodnsY1lRpQ3kHiGM
Message-ID: <CAH5fLgjEfZO9DwcUxaKCWd_hFUrXU+cxiwmRg1UnM2pKD6gPvg@mail.gmail.com>
Subject: Re: [PATCH v20 4/8] rust: page: convert to `Ownable`'
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 2:38=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Alice Ryhl <aliceryhl@google.com> writes:
>
> > On Sun, Sep 6, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
> >>
> >> On Tue Aug 25, 2026 at 2:20 PM BST, Alice Ryhl wrote:
> >> > On Mon, Aug 24, 2026 at 01:17:56PM +0200, Andreas Hindborg wrote:
> >> >> +        // SAFETY: We just successfully allocated a page, so we no=
w have ownership of the newly
> >> >> +        // allocated page. We transfer that ownership to the new `=
Owned<Page>` object.
> >> >> +        // Since `Page` is transparent, we can cast the pointer di=
rectly.
> >> >> +        Ok(unsafe { Owned::from_raw(page.cast()) })
> >> >
> >> > This doesn't satisfy the safety requirements of Owned::from_raw()
> >> > because the page may be used with vm_insert_page(), which increments=
 its
> >> > refcount and causes it to be shared the vma system, and this occurs
> >> > before Page::release() is called.
> >>
> >> I suppose the existing vm_insert_page() abstraction we have is already
> >> problematic, because it uses `&Page`?
> >>
> >> Maybe we want to change the API to use `ARef<Page>` so it already has =
to be
> >> shared? Conceptually it takes a reference count from a `&Page`, which =
isn't
> >> possible because `Page` is not `AlwaysRefCounted`, so it needs a `&ARe=
f<Page>`
> >> to be able to do that op.
> >
> > Honestly, the problem is the safety requirements of Owned::from_raw().
> > Pages have a "special" main reference, and free_page() does more than
> > put_page(). It even does something when the refcount does not hit
> > zero.
> >
> > The correct behavior for Page is to allow the user to hold one
> > Owned<Page> whose drop calls free_page(), *plus* any number of
> > ARef<Page> references that invoke put_page() on drop. This way, the
> > owned page controls the special drop codepath.
>
> This does not mesh well with the model of `Owned` behaving like
> `UniqueArc` to `ARef` behaving like an `Arc`.

It's a different case, I agree.

> Please help me understand; with page having a main ref and an auxiliary
> refcount, if we model that with a single `Owned<Page>` and a number of
> `ARef<Page>`, what would happen in the case where the main ref (`Owned`)
> is dropped first? Is this legal?

Yes, it's legal.

> My intuition here would be to follow Garry's suggestion and have
> `vm_insert_page` take an `ARef<Page>`. Can you elaborate why this is not
> an option?

That would be the wrong ownership semantics. The C side increments the
refcount rather than take ownership of a passed-in refcount, so the
correct argument type is &Page.

Now, for the use-case in Binder I believe we could switch to
put_page(), as we don't need the extra stuff from free_page(), in
which case we only want ARef<Page> and do not require Owned support.
But as long as we are calling free_page(), it needs to not be
clonable.

Alice
