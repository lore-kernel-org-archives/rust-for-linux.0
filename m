Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBF6340402
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 15:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785769571; cv=pass; b=rs3s2v1c4gNUvNoksubgJfB3WRvfK7VqFikaHKqqSuPlURjatQwk4RD8UKZa1Jbgk+foPi1kbzRhecnDUC/9qUYKnuc2Yg1glfRUk3ncfIa0lMjuf1KPgoVtgT46J3QVEA+2iDNnXODYT7CEZWO9YvAldsi2cDKutepE6ZZhXGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785769571; c=relaxed/simple;
	bh=vJQ85GMhPd27rokuLxPgrmhCOeWEsn68yRurzB2w63U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VxSea19V6LpFW181NhQECfakEKS5FefwSRRC8XDuJXmRqEa23zJd7yki0Mq9zRuUuzfH7vNWo30PGs4c/F0SQ5fUbAwaO5T9WDTdFqoJWx+3LKH7YNk8SOqn2CmH2NKY+/0eGuAhtff/5gGt7Job9ieQ1HlHoIG6mo4iK2SjHRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nzUzzaKx; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nzUzzaKx"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fdd674e17so936126f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 08:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785769568; cv=none;
        d=google.com; s=arc-20260327;
        b=kojlY78A57d0wISB3vnySc5zzT0oJkC5z4C9pY6yi2RGTcRibrkVumC9aFu+L2QiSI
         q3Y5u6mGIPG1U/yOsx0j6RbnE89a8xaYPNH4DPVi21Q1JmKCjU6jDHoX4x+hBs2/BpKp
         70FEUdx8WeA5gt0M5QsPkqdr1BWyNuk97uqsUgefZNgmzhCcZedym7Dbj5YWR/gnKlv4
         0kzvIAXYjFgnkL4bjLAekYdgEJ/sj8t0V0s6PtNIqcvTkJvyVd4+WwXUnPrM1IXxG4lD
         laO3yZ1bGhh4BNuuN1996Tk7vkz/dd9aLtT61Js2rXqWSMSs3zmYqB/v+h9xvkkwKLwh
         1uEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Q8NiBv1owB+m2z5E0qzw1M2JQ8N4hGqbVT+Vkq10LI=;
        fh=BapPgKfuKPE+enRMesRN+XDwfMgNL5O6UsIiEK3x864=;
        b=BFOVix59r5BpB1ZiHt3IpUKH1cPvX5iZ7Fa3nGkihMB02ACo2y1jsSIKDTmQyk3AKt
         89//v5W25caykI8ZkoolpaUXqJVqyMxOHGVpHmPQGHEr2hZH/RmPdI2zwl65v2oZ5g/6
         cBDoUEJY5LGGRpi0fScYAfHYc2hfXAeWc/zQv5S0bx1ivZwZhX5DS2epPHY/SHdWzhm+
         e/V2rKfWbPPbWqPgoCqdLmAWBIFKuza1/HcCJumg3SDVq1hqcTobvH9tDNjefrsob/sw
         nO/AW6nT/VR0f98eTWmnrL3TVcht0AWk5QBsSZxjPTW1CjSdJyymWG+N53NbyuqHNQi5
         Byng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785769568; x=1786374368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Q8NiBv1owB+m2z5E0qzw1M2JQ8N4hGqbVT+Vkq10LI=;
        b=nzUzzaKxoo1sENHqmLtQc+ecsBGyJV1sub54tXJ43YCjws7lU3ycnhhpCrrrwVD+fp
         2PIN3+nu+tZDc8yAHaD2fuoV3RjpizKq0QPqBv/+LYL6Um1BXDhBPtdHYXBRimM058IS
         27SahQmG0UCpZvPeuhSWlL9mL4iHmO1VPAHB0+sNromtGEgmjqLlPmjTj5vzt4NGWpA4
         hz/LfJtgLjbJj7q8GTK8gGpoI8lc6U7gL0UIfFxQVL8GUCu+4Fl5n8XSvuhXXdk/q9op
         5yoIz7i4IO3/Uw2aTGi+36q84CM17uSvQEMYaSiNK+HVnX83mnPJK+VuI5szw1Xxuxhs
         qNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785769568; x=1786374368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Q8NiBv1owB+m2z5E0qzw1M2JQ8N4hGqbVT+Vkq10LI=;
        b=ibhTBRIVpWNcBKxmjbwgIH3e8NKxDnA7X+R41JILY3nxBZ3tV+CeEMyILcdb70CfYY
         EST8PRDjnlZXeGfE43+gWF9K4Be3fcHgb2owYPgnCKoAg4PgdyfwoV/FWoaXFLpvWsne
         i/em/+ZBhpp/C0242KM4EZ3PMXNoRROeEmO1TgfCyK+zdcZhXlsHZuNBvbOHB5JIgirW
         u6+mcp8h9dXXNvCcYnbxg8SY6E6RNrZjN15EjXq02JvAd2gYJaDcQc9dhER1jW1dhNpt
         UhsDuyJnWipsND8C+JxRGsk+WOS1Ki+W7Yqbcm46+Ne5K5Ran+5101ywLmL3NjP2zZza
         06Pw==
X-Forwarded-Encrypted: i=1; AHgh+RqtT92RAD2XD1XzAubRHMHrx2WzIf25qLBlWGmTUd+88e/e2WtzM+7wMEhnj6HJsGRyWBW7RIaYG6MdyA7rqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YztIR9Ty89iguFKJVZzTb54PiCEJl89GnJdst8MxetGFgdV1pzE
	8GpJO6HNg+RzWVEAAmT4ai+RdS/VAreAal3LT4lcnKzCxf/FXEFyhZFJGd6gPIHZfBk1beQ7r/k
	sVwiKPWJdeNfFClQsMxbShZZc7sCDMhk16an8CoMF
X-Gm-Gg: AR+sD118C3CGOcoeA00y8lGMFPvp0woH0daJ9qUNkELnA8yM3/nUbNMashNrBMVVi7P
	G1DqRXSjqDRZ1+yWxebommAf+kRZ1muOuRj7DS4wTzfVcxU37tPoXG4ELuZBIfzrA5SIisNpyuP
	haVahsNiRUBlhX0WsEBt3OVxrX1MEWU3Plulv15WCqGa/ENonMqo0QjfJWnSL0x0ALMu0pUy5ur
	qvVCa5T0jJ7DfHgkj2fKGCrnCozPMK7QL9Zo27toPSh9Fe0CO4J6RBItgf+979SrFgVhtVE2fEt
	aBEo6GRiPodPd+WWhUKBH/pG2+lwWMwBAd5qB92pXz6aI67o3JAvzgwfEMouIXPoWMdS8rl01HU
	=
X-Received: by 2002:a05:6000:4615:b0:47f:8887:3b07 with SMTP id
 ffacd0b85a97d-47fd72d320amr27491657f8f.13.1785769567433; Mon, 03 Aug 2026
 08:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev>
 <20260731-tyr-debugfs-v2-v2-2-aea19eccb996@linux.dev> <amyeMmmfEBpuVclw@google.com>
 <d42d6ce2-7160-457f-be04-ff84551e9b9a@linux.dev>
In-Reply-To: <d42d6ce2-7160-457f-be04-ff84551e9b9a@linux.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Aug 2026 17:05:55 +0200
X-Gm-Features: AUfX_mwlQH6Z-tduzlfCZ86MznBGj1HOcIQs7EHUIsZkQr1iKQzeu-QfbRXr-F4
Message-ID: <CAH5fLgh9oZ9jRATbLM+s+tNR_KjJvdYuJ4w_vxXKwCmRd28E5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] rust: debugfs: add SeqShow trait and seq_file file operations
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Melissa Wen <mwen@igalia.com>, Wambui Karuga <wambui.karugax@gmail.com>, 
	Eric Anholt <eric@anholt.net>, Ben Gamari <bgamari@gmail.com>, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 6:52=E2=80=AFPM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
>
> On 7/31/26 21:08, Alice Ryhl wrote:
> > On Fri, Jul 31, 2026 at 01:05:40AM +0800, Alvin Sun wrote:
> >> +/// Show callback for `SeqShow` types.
> >> +///
> >> +/// # Safety
> >> +///
> >> +/// The seq_file core guarantees that `seq` points to a live `seq_fil=
e` and that
> >> +/// `seq->private` is a valid pointer to a `T` with no outstanding mu=
table
> >> +/// references.
> >> +unsafe extern "C" fn seq_file_show<S: SeqShow<T>, T: Sync>(
> >> +    seq: *mut bindings::seq_file,
> >> +    _: *mut crate::ffi::c_void,
> >> +) -> crate::ffi::c_int {
> >> +    // SAFETY: `seq->private` is a valid `T` pointer with no outstand=
ing
> >> +    // mutable references.
> >> +    let data =3D unsafe { &*((*seq).private.cast::<T>()) };
> >> +    // SAFETY: `seq` points to a live `seq_file`.
> >> +    let m =3D unsafe { SeqFile::from_raw(seq) };
> >> +    from_result(|| S::show(data, m).map(|()| 0))
> >> +}
> >> +
> >> +/// Renders `data` into a seq_file.
> >> +///
> >> +/// `data` is the value stashed as the debugfs file's `i_private` at =
creation
> >> +/// time. `show` is invoked on each read to produce the file's conten=
ts.
> >> +///
> >> +/// `open` and `release` are optional lifecycle hooks called during f=
ile open
> >> +/// and release. They can be used to manage the lifetime of `data` (e=
.g.,
> >> +/// reference counting). Default implementations are no-ops.
> >> +pub trait SeqShow<T> {
> >> +    /// Writes debugfs output for the file.
> >> +    fn show(data: &T, m: &SeqFile) -> Result;
> >> +
> >> +    /// Called during file open, before `single_open`.
> >> +    fn open(_data: &T) -> Result {
> >> +        Ok(())
> >> +    }
> >> +
> >> +    /// Called during file release, before `single_release`.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// `data` must point to valid memory, kept alive by actions take=
n in
> >> +    /// [`Self::open`] (e.g., incrementing a reference count).
> >> +    unsafe fn release(_data: NonNull<T>) {}
> >> +}
> > Hmm. So in a later patch you implement SeqShow in the following manner:
> >
> >      fn open(dev: &drm::Device<T, drm::Normal>) -> Result {
> >          // Hold a device reference so the device is not freed while th=
e file is open.
> >          dev.inc_ref();
> >          Ok(())
> >      }
> >
> >      unsafe fn release(dev: NonNull<drm::Device<T, drm::Normal>>) {
> >          // Drop the reference taken in `open`.
> >          // SAFETY: `dev` is valid per this function's safety contract.
> >          unsafe { drm::Device::<T>::dec_ref(dev) };
> >      }
> >
> > I don't understand why this increment/decrement pair is necessary.
> > Just based on the code, it *looks* like you have them because otherwise
> > `show()` might get called with a dangling pointer to the drm device, bu=
t
> > the inc_ref() in open() ensures it stays alive.
> >
> > However, earlier in this patch you said:
> >
> >> The seq_file core guarantees that `seq` points to a live `seq_file` an=
d
> >> that `seq->private` is a valid pointer to a `T` with no outstanding
> >> mutable references.
> > So based on this, you are saying that open()/release() do not need to d=
o
> > anything special for the value to stay alive.
> >
> > These seem contradictory. Could you clarify the situation?
>
> You're right. The `SeqShow` trait documentation was inaccurate -- the
> framework does not manage the lifetime of `data`, so `inc_ref`/`dec_ref`
> in `DrmSeqShow` is necessary to prevent `show()` from accessing a freed
> device.
>
> Will fix the doc in the next revision.

I'm not convinced that works soundness-wise. If I just leave
open/release empty, then I will be able to access a &T inside of
show(), but there's nothing keeping it alive, so I could dereference a
freed &T in safe code that way.

I think we need the seq file to instead own some sort of value. Then,
show() can be passed the a reference to value it has ownership of, and
release() can be said type's destructor.

Alice
