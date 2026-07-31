Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9A4416D1A
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 13:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785503287; cv=none; b=nviuQgDZuwTyFxnNit7p64XhLjDkVWdkkIAG7f8yX0ri/WZmVU6pEG3MmtRgZbtTlNlcSIV5SMl5mFwEBHWKSLvArCYPvGojiTerP8vMzV+CSdmcFTTSserEniuosAGFAm5tjtpBx60sFsiUsSw5dQpUdmvMpuBxNnznHdl/Ckw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785503287; c=relaxed/simple;
	bh=ViuDCFjmw/dzx0vsIBMgcReYNsdp4Yi1k2soTurBsFY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K3uwvAZ959JIC1r0dJ/RpltArHJ1W6I9ZlWKFkETyVoddp0Edr5W+OZSInEIp3YHOrOvQsniFMbUgUiQg/bN5mtaoVwnzd0QLfevyv5Prsn20VUBJPVkzbaEKvAHTMFOaQI45n91yDMuj0DA3cdjKL5b5O06m2JD8l9gxd2stgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HaPTC8rW; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HaPTC8rW"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-474170b59dfso802059f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785503284; x=1786108084; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKUpFb/0BO0No/UvKwO/5M2fcWH3/wzCNVF4fPxlP2k=;
        b=HaPTC8rW38HemPVq3sDigRkaEdSKSAjkdFUdyHMaSXNj5OiU6KHB/oDkXzTE7Krtmh
         GQ0wr/MiWRtK8y9qrNC7gCh6rIKSG3o8cM4J/C3HXBFgd8Z1e5EfOMDqk3Q/v6+wroTr
         +SWEEqfEZgWFJq1jRln+fQbQ/PodkmcOSG5Le2PN3WPxPEaIbFrlkb/O4nALP3AnNI45
         joUuES+8C9X4/RsuVJMH3ynI2KIegbUxFd2I91pzxS1XJ/vJcFpmqYzEDaMDYf+CS5Hi
         0jIxcouqSEQpymOdUnHRoE1ULYNJIzkwKO+5Xmz+nXVKuH6JXbosiAteFXeBouKG6YBe
         e2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785503284; x=1786108084;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKUpFb/0BO0No/UvKwO/5M2fcWH3/wzCNVF4fPxlP2k=;
        b=DImOIf26zv6wwzPA+/qFKTMmF7BJ/asdzH07T9RjE6XgL/MaSsr2VgPYMJMvITfHaM
         2L8jc47yH8OtBARMjiZS8KHeCMiAZ1uS23weOxPUcNUzKBcz6UQtZR206ZqCfWJo0s/w
         xfZ494Gt+FDBfR/OGKcSTtDHuKoIXj1859SOdv4SQL1ekXU3w59ef0ClBUXURBi5ce2o
         FfU2i7RoRro1e1sl5lzTicdKxBC1RVpgL7Zrop5kS2kXETOJIe7tGy83/VPkb6QzvTmq
         MjXv9icSIR5n5i4kCKhNst1PzYFc77Wmaz/Ao5705F8LQrjZfpeJkiYhu3xT/Xyc9zFQ
         hXbg==
X-Forwarded-Encrypted: i=1; AHgh+RoGnz8z06Gut5wlUOOQauW3jsvGDLnQsTqRslM0igEeJmfAutKgI9uJUeoM96UeloXL6Ig8+MKUkfCMhRWlqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFC71XLXMr5+bIiO10z2FQTZ/fq04p7HooFvo2ItmPapSodcMa
	lWl+cvJfwD8aUsFYDD3NJHukE8b+HXSwRJ4sQG5G70rlUM8g+8RDaVaZdM5G0nC7eYLajAbpVb9
	ozBCrBDPRpI0u4CtfRw==
X-Received: from wrui12.prod.google.com ([2002:a5d:630c:0:b0:47f:4f56:2046])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2882:b0:472:3090:d878 with SMTP id ffacd0b85a97d-47fd2ab92c4mr4245682f8f.4.1785503283539;
 Fri, 31 Jul 2026 06:08:03 -0700 (PDT)
Date: Fri, 31 Jul 2026 13:08:02 +0000
In-Reply-To: <20260731-tyr-debugfs-v2-v2-2-aea19eccb996@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260731-tyr-debugfs-v2-v2-0-aea19eccb996@linux.dev> <20260731-tyr-debugfs-v2-v2-2-aea19eccb996@linux.dev>
Message-ID: <amyeMmmfEBpuVclw@google.com>
Subject: Re: [PATCH v2 2/9] rust: debugfs: add SeqShow trait and seq_file file operations
From: Alice Ryhl <aliceryhl@google.com>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	"=?utf-8?B?TWHDrXJh?= Canal" <mcanal@igalia.com>, Melissa Wen <mwen@igalia.com>, 
	Wambui Karuga <wambui.karugax@gmail.com>, Eric Anholt <eric@anholt.net>, 
	Ben Gamari <bgamari@gmail.com>, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 31, 2026 at 01:05:40AM +0800, Alvin Sun wrote:
> +/// Show callback for `SeqShow` types.
> +///
> +/// # Safety
> +///
> +/// The seq_file core guarantees that `seq` points to a live `seq_file` and that
> +/// `seq->private` is a valid pointer to a `T` with no outstanding mutable
> +/// references.
> +unsafe extern "C" fn seq_file_show<S: SeqShow<T>, T: Sync>(
> +    seq: *mut bindings::seq_file,
> +    _: *mut crate::ffi::c_void,
> +) -> crate::ffi::c_int {
> +    // SAFETY: `seq->private` is a valid `T` pointer with no outstanding
> +    // mutable references.
> +    let data = unsafe { &*((*seq).private.cast::<T>()) };
> +    // SAFETY: `seq` points to a live `seq_file`.
> +    let m = unsafe { SeqFile::from_raw(seq) };
> +    from_result(|| S::show(data, m).map(|()| 0))
> +}
> +

> +/// Renders `data` into a seq_file.
> +///
> +/// `data` is the value stashed as the debugfs file's `i_private` at creation
> +/// time. `show` is invoked on each read to produce the file's contents.
> +///
> +/// `open` and `release` are optional lifecycle hooks called during file open
> +/// and release. They can be used to manage the lifetime of `data` (e.g.,
> +/// reference counting). Default implementations are no-ops.
> +pub trait SeqShow<T> {
> +    /// Writes debugfs output for the file.
> +    fn show(data: &T, m: &SeqFile) -> Result;
> +
> +    /// Called during file open, before `single_open`.
> +    fn open(_data: &T) -> Result {
> +        Ok(())
> +    }
> +
> +    /// Called during file release, before `single_release`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `data` must point to valid memory, kept alive by actions taken in
> +    /// [`Self::open`] (e.g., incrementing a reference count).
> +    unsafe fn release(_data: NonNull<T>) {}
> +}

Hmm. So in a later patch you implement SeqShow in the following manner:

    fn open(dev: &drm::Device<T, drm::Normal>) -> Result {
        // Hold a device reference so the device is not freed while the file is open.
        dev.inc_ref();
        Ok(())
    }

    unsafe fn release(dev: NonNull<drm::Device<T, drm::Normal>>) {
        // Drop the reference taken in `open`.
        // SAFETY: `dev` is valid per this function's safety contract.
        unsafe { drm::Device::<T>::dec_ref(dev) };
    }

I don't understand why this increment/decrement pair is necessary.
Just based on the code, it *looks* like you have them because otherwise
`show()` might get called with a dangling pointer to the drm device, but
the inc_ref() in open() ensures it stays alive.

However, earlier in this patch you said:

> The seq_file core guarantees that `seq` points to a live `seq_file` and
> that `seq->private` is a valid pointer to a `T` with no outstanding
> mutable references.

So based on this, you are saying that open()/release() do not need to do
anything special for the value to stay alive.

These seem contradictory. Could you clarify the situation?

Alice
