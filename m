Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B62E4DAFB3
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 13:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158891; cv=none; b=e31k+l9lx/4EVUFYQ28ztcJzOF+morOtHyDwNpDU4f92JVEXmMPcgO+LgBcEdS0fqKiTzQj7VVc+m/upKDfi5XFMoJi8K12S2j38r18k4UAUaCJhcVhMOdZcJBAqbXQ/ssU0Zo0OgyEwfz4ltXlu+Qfhx9iVgB2KUjAEXS3Jx9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158891; c=relaxed/simple;
	bh=Uj759hRIg/ALoVbsH5xCndvCVekkU3D+FQB4R9sdVAA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gOtnD+MFzh9olrfArqpo9d80Ok2fobCa4I0hcLXTWFo2NcJq+gsfkxvh1S0KMVzlmIgw8FS03V4cKTVk+i+qmd4SMoYhAvrEKRiFcOfDWDfwX3FHxDQ7C9Ei9PtZ207nUlRsDhbPvFl901K1rMhTuALG0KxO0Z+NnlgRHnJktrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h/MDs/Wf; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h/MDs/Wf"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso51042705e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Oct 2026 06:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792158887; x=1792763687; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRibYQQCC8wRNRgMBFml+aQKdotOmpVfSxBareZMh+o=;
        b=h/MDs/WflOXyry2vWVTXnBpWv0XqzzDbaC/Qls6voYsicDFumSElwKDzZcfELgQqGn
         zketP0PQbBTup1c+jvmwJ9De8ZM/mzGsio+FTpjPwmRCMD3KlE3adSthRwpSMG6FQ0th
         H/K/CGfYdPMwiAKz5ngpbOIix887Wc8Q0IF/5dtsySHPnjF8oz1tD8UYOXU/YCrYBvwB
         lMXBMUebNGtwTMiIClgcFKt1VigBg0O4YMMFc1cG0U6GdfjpLolINJoRiLEXypnCI3l2
         HnoJE8xrJHPl4br0LVEGyL9YNhsIMtr3La2htznoBzbZHUn2I6xcT1jGEr0bnxjuoby5
         qbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792158887; x=1792763687;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fRibYQQCC8wRNRgMBFml+aQKdotOmpVfSxBareZMh+o=;
        b=Fa/OoBDsKFZImS+f0LPYAv/IbROIAun+dU8LBcwJqQXFxaoue1nIEkimMZlF0z5yke
         /XvOKpxiwZq2u9Ue9YMjprmR2v+b9iKJ+GMH2nWvQ6F82GOvwF1iYPX9dBP9FuTzfnbK
         mqQ3lASS7VMGFU3eVwFeCl7bYkaRiNGVMPp+akZS/njG0sa6tHoK5l6zAO+Qoc3Rl0Sn
         y5yp9DQDKvhvSX6DLXMUal4HpxhYAxbtGJogjb/QVre8eyXBTx/ImAWQz3QPN4n/L51k
         dGRH0M7DNxsgLbgKwDvHawYX2GcYOTeIrOk/VsPxFUoNQsqNTv/uFbh3HVjjZp+E6Bu+
         Iuvw==
X-Forwarded-Encrypted: i=1; AKwUvByWO8bjUC8cHGp33WFxyKB6V3KeA8wrwPbvStq77y5adbzzPA0Ab1BpedUUMN/uHP+Dh8d4Niw0/vgBCMqCxw==@vger.kernel.org
X-Gm-Message-State: AFq9FYK5LiYi7HVVS8eNpHQyPHOt64FvMVgLsEdNcUSnj1eHljsNq4wp
	LRjLFVSUhoBx0xBvQWyf6z4KNFDrV83lKMCltsMDOcUxaLpmb5TcFxuDpRqfpuk813egHzWx3pn
	qcWJapWnfzy1rBIYuRg==
X-Received: from wmsz15.prod.google.com ([2002:a05:600c:c16f:b0:4a0:2a5:ce1a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e0e:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4a18e4c3f32mr512182645e9.22.1792158887232;
 Fri, 16 Oct 2026 06:54:47 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:54:38 +0000
In-Reply-To: <20260814230923.1292966-7-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260814230923.1292966-1-dakr@kernel.org> <20260814230923.1292966-7-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016135439.44716-6-aliceryhl@google.com>
Subject: Re: [PATCH 6/7] rust: drm: make Driver::File lifetime-parameterized
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, j@jananu.net, alvin.sun@linux.dev, 
	deborah.brouwer@collabora.com, laura.nao@collabora.com, 
	beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 15, 2026 at 01:09:04AM +0200, Danilo Krummrich wrote:
> +    /// The type used to represent a DRM File (client).
> +    ///
> +    /// File data may borrow from [`RegistrationData`](Driver::RegistrationData). File data is
> +    /// guaranteed to be dropped before registration data, either when the file is closed or
> +    /// when the device is unregistered, whichever comes first.
> +    ///
> +    /// Drivers set this to `CovariantForLt!(MyFileData)` (or `ForLt!` for invariant types)
> +    /// and implement [`DriverFile`](drm::file::DriverFile) for their file data type.
> +    type File: ForLt + 'static;

This looks like it can be

	type File<'a>;

and if so, then I think it should be.

> @@ -221,6 +237,51 @@ fn drop(&mut self) {
>          unsafe { bindings::drm_dev_unplug(self.drm.as_raw()) };
>          // After drm_dev_unplug(), the SRCU barrier guarantees that all RegistrationGuard critical
>          // sections have completed, so no one holds a reference to reg_data anymore.
> -        // reg_data is dropped here automatically.
> +
> +        // Drop all remaining file private data before dropping registration data. This guarantees
> +        // that file data (which may borrow from RegistrationData) is always dropped first.
> +        let raw = self.drm.as_raw();
> +
> +        // SAFETY: `filelist_mutex` is initialized by `drm_dev_init()` and remains valid for
> +        // the lifetime of the `struct drm_device`.
> +        let filelist_mutex = unsafe { Mutex::from_raw(&raw mut (*raw).filelist_mutex) };
> +        {
> +            let _guard = filelist_mutex.lock();
> +
> +            // SAFETY: `filelist` is a valid, initialized sentinel `list_head`; the mutex
> +            // guard prevents concurrent modification.
> +            let filelist = unsafe {
> +                clist_create!(
> +                    &raw mut (*raw).filelist,
> +                    drm::File<T>,
> +                    bindings::drm_file,
> +                    lhead
> +                )
> +            };
> +
> +            for file in filelist.iter() {
> +                // SAFETY: `file` is a valid `drm_file` on this device's filelist.
> +                let priv_ptr = unsafe { (*file.as_raw()).driver_priv };
> +
> +                // SAFETY: Setting `driver_priv` to NULL is visible to `postclose_callback()`
> +                // through the `filelist_mutex` acquire/release chain in `drm_close_helper()`.
> +                unsafe { (*file.as_raw()).driver_priv = core::ptr::null_mut() };
> +
> +                // SAFETY: `driver_priv` was created by `open_callback()` via `KBox::into_raw` and
> +                // has not yet been freed (the file is still in the list, so `postclose_callback()`
> +                // has not run).
> +                drop(unsafe { KBox::from_raw(priv_ptr.cast::<<T::File as ForLt>::Of<'static>>()) });
> +
> +                self.drm.open_count.fetch_sub(1, Release);
> +            }
> +        }

Using `drm::File<T>` in `clist_create!` here creates `&drm::File<T>`
references after `drm_dev_unplug()` has completed and while `driver_priv` is
being set to NULL and freed (so calling `file.inner()` inside the loop body
would dereference a null pointer).

Could we pass `Opaque<bindings::drm_file>` to `clist_create!` instead? That
way we never create a `&drm::File<T>` when its `driver_priv` is being torn
down.

Also, this drops files under the mutex. Could/should we avoid that for deadlock
avoidance?

> @@ -27,17 +44,17 @@ pub trait DriverFile {
>  /// `self.0` is a valid instance of a `struct drm_file`.
>  #[repr(transparent)]
> -pub struct File<T: DriverFile>(Opaque<bindings::drm_file>, PhantomData<T>);
> +pub struct File<D: drm::Driver>(Opaque<bindings::drm_file>, PhantomData<D>);
>  
> -impl<T: DriverFile> File<T> {
> +impl<D: drm::Driver> File<D> {
>      #[doc(hidden)]
>      /// Not intended to be called externally, except via declare_drm_ioctls!()
>      ///
>      /// # Safety
>      ///
> -    /// `raw_file` must be a valid pointer to an open `struct drm_file`, opened through `T::open`.
> -    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_file) -> &'a File<T> {
> -        // SAFETY: `raw_file` is valid by the safety requirements of this function.
> +    /// `ptr` must be a valid pointer to an open `struct drm_file`.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::drm_file) -> &'a File<D> {
> +        // SAFETY: `ptr` is valid by the safety requirements of this function.
>          unsafe { &*ptr.cast() }
>      }
>  
> @@ -45,59 +62,94 @@ pub(super) fn as_raw(&self) -> *mut bindings::drm_file {
>          self.0.get()
>      }
>  
> -    fn driver_priv(&self) -> *mut T {
> -        // SAFETY: By the type invariants of `Self`, `self.as_raw()` is always valid.
> -        unsafe { (*self.as_raw()).driver_priv }.cast()
> +    /// Return a pinned reference to the driver file data.
> +    ///
> +    /// Only available when `D::File` implements [`trait@CovariantForLt`]. For invariant types, use
> +    /// [`inner_with()`](Self::inner_with).
> +    pub fn inner(&self) -> Pin<&<D::File as ForLt>::Of<'_>>
> +    where
> +        D::File: CovariantForLt,
> +    {
> +        // SAFETY: `driver_priv` was initialized by `open_callback()`. `CovariantForLt` guarantees
> +        // the lifetime shortening from `'static` to `'_` is sound.
> +        unsafe { Pin::new_unchecked(&*(*self.as_raw()).driver_priv.cast_const().cast()) }
>      }

Relatedly, since an open `struct drm_file` has `driver_priv` set to NULL (and
its `RegistrationData` dropped) after `Registration::drop()` runs, the type
invariants of `File<D>` and the safety requirements of `File::from_raw()`
should also state that:

- the `struct drm_file` was opened on a device of driver `D`, and
- a `RegistrationGuard` is held for the duration of any `&File<D>` reference
  (ensuring that `Registration::drop()` has not cleared `driver_priv` or
  dropped `RegistrationData`).

Alice
