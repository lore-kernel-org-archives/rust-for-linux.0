Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8662313E19;
	Mon, 24 Nov 2025 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997871; cv=pass; b=rPGpkj3gWVwa9/orsZiViO3bq3i/aTGsncyxFDR6PHA/PRmxh1UDy/1Eedaiii7FlEUBFZK5EPmQIxH6i8pXb3W8O47K4M12iPp9Epw/usUHZTRGiA6Lyu31jKI5DZP54icpkR1N5mReSQ4nhq2sVoKNSOsJ3LIC7wuU7m+xRt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997871; c=relaxed/simple;
	bh=Ji6fYfYutm8QXFWFnkeNbapma5AzhqoL58q6EQn7p4g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZUtnkX9qIV91GmWT+mw5klu0BEk4T2C4Hgk/OC/6SS8lSqFesSplpS36VhbTWxk2ECZrvB3Yssd3L9j169qRZnL6ViftcjnzHDAb0gh1tNR3imWVUc3M8O7THtVfPse7QtIPD52xxtEZWsVtGjLbRm5lYUz1I+iOqaRmo/dzAhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=baC3qx5R; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="baC3qx5R"
ARC-Seal: i=1; a=rsa-sha256; t=1763997849; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fKcG7yqSD60UQf6/NxIdqIodGmP/daHMrMjr8g3DCD9LzXxB6DInn3/MI9X77b36Jmb4XqrPRTQNOzV19Yr66je0BmbnEnPlaa0ir8/TbeX/P4e6yPlmZiwITTB7Due2nYCwqXiNzAbfMJz2OR71DqjbKwjwYCMw/8w1D24bAtE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763997849; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6iEf7VMHNEASOG8Vh3StuVEOElqIX2Ewj+ACldc5thQ=; 
	b=cq9BL3EjPHETFSq+l8REYUjl9EN1h4h8ZXkmI9RSGIkvOFSoZwbLNWKh6YmRoDrdia/BbgqfLJmBE2xlo+J7+sWVvcVFPflzc/j0Aqml3a4OPOkmir/nI+4FNXtxaFqeJlFb52IyCz9atW9Yk69Y2lgryalb9CvfxMnf2DnZWK8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763997849;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=6iEf7VMHNEASOG8Vh3StuVEOElqIX2Ewj+ACldc5thQ=;
	b=baC3qx5RKVZ7xlE/2VKu4YesxTU8qcmS6WgRm6Ye8PFHYJPgvTs0LAbP0Qd62PB4
	rq7pjaRUVRT2GlTVi5xPP/JDP0/2qqXQL3d3ppnoyKZZYh1QGu6fXKpWA21YtLwt7qe
	rKAYpDPqiaFwCV277gCXnz88QvM1Kd0hmK5fCEsU=
Received: by mx.zohomail.com with SMTPS id 1763997846696691.7351681305079;
	Mon, 24 Nov 2025 07:24:06 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 1/8] rust/drm: Add gem::impl_aref_for_gem_obj!
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251023212540.1141999-2-lyude@redhat.com>
Date: Mon, 24 Nov 2025 12:23:51 -0300
Cc: dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Shankari Anand <shankari.ak0208@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1E5BE820-90BA-4135-82A8-05777B738BD5@collabora.com>
References: <20251023212540.1141999-1-lyude@redhat.com>
 <20251023212540.1141999-2-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Lyude,

> On 23 Oct 2025, at 18:22, Lyude Paul <lyude@redhat.com> wrote:
>=20
> In the future we're going to be introducing more GEM object types in =
rust
> then just gem::Object<T>. Since all types of GEM objects have =
refcounting,
> let's introduce a macro that we can use in the gem crate in order to =
copy
> this boilerplate implementation for each type: =
impl_aref_for_gem_obj!().
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> ---
> V5:
> * Move .as_raw() call to `let obj` in dec_ref, to ensure that the =
reference
>  to object is not live by the time that we call drm_gem_object_put().
> * Add missing #[macro_export] annotation
>=20
> rust/kernel/drm/gem/mod.rs | 54 +++++++++++++++++++++++++++-----------
> 1 file changed, 39 insertions(+), 15 deletions(-)
>=20
> diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> index 20c2769a8c9d6..32bff2e8463f4 100644
> --- a/rust/kernel/drm/gem/mod.rs
> +++ b/rust/kernel/drm/gem/mod.rs
> @@ -15,6 +15,44 @@
> };
> use core::{ops::Deref, ptr::NonNull};
>=20
> +/// A macro for implementing [`AlwaysRefCounted`] for any GEM object =
type.
> +///
> +/// Since all GEM objects use the same refcounting scheme.
> +#[macro_export]
> +macro_rules! impl_aref_for_gem_obj {
> +    (
> +        impl $( <$( $tparam_id:ident ),+> )? for $type:ty
> +        $(
> +            where
> +                $( $bind_param:path : $bind_trait:path ),+

Don=E2=80=99t we have to match on some type here?

e.g.:

            where
                Self: IntoGemObject + // or whatever the right trait is
                $( $bind_param:path : $bind_trait:path ),+

> +        )?
> +    ) =3D> {
> +        // SAFETY: All gem objects are refcounted
> +        unsafe impl $( <$( $tparam_id ),+> )? =
$crate::types::AlwaysRefCounted for $type
> +        $(
> +            where
> +                $( $bind_param : $bind_trait ),+
> +        )?
> +        {
> +            fn inc_ref(&self) {
> +                // SAFETY: The existence of a shared reference =
guarantees that the refcount is
> +                // non-zero.
> +                unsafe { bindings::drm_gem_object_get(self.as_raw()) =
};

=E2=80=A6so that we=E2=80=99re sure that things like self.as_raw() =
exist?

> +            }
> +
> +            unsafe fn dec_ref(obj: core::ptr::NonNull<Self>) {
> +                // SAFETY: `obj` is a valid pointer to an =
`Object<T>`.
> +                let obj =3D unsafe { obj.as_ref() }.as_raw();
> +
> +                // SAFETY: The safety requirements guarantee that the =
refcount is non-zero.
> +                unsafe { bindings::drm_gem_object_put(obj) };
> +            }
> +        }
> +    };
> +}
> +
> +pub(crate) use impl_aref_for_gem_obj;
> +
> /// A type alias for retrieving a [`Driver`]s [`DriverFile`] =
implementation from its
> /// [`DriverObject`] implementation.
> ///
> @@ -253,21 +291,7 @@ extern "C" fn free_callback(obj: *mut =
bindings::drm_gem_object) {
>     }
> }
>=20
> -// SAFETY: Instances of `Object<T>` are always reference-counted.
> -unsafe impl<T: DriverObject> crate::types::AlwaysRefCounted for =
Object<T> {
> -    fn inc_ref(&self) {
> -        // SAFETY: The existence of a shared reference guarantees =
that the refcount is non-zero.
> -        unsafe { bindings::drm_gem_object_get(self.as_raw()) };
> -    }
> -
> -    unsafe fn dec_ref(obj: NonNull<Self>) {
> -        // SAFETY: `obj` is a valid pointer to an `Object<T>`.
> -        let obj =3D unsafe { obj.as_ref() };
> -
> -        // SAFETY: The safety requirements guarantee that the =
refcount is non-zero.
> -        unsafe { bindings::drm_gem_object_put(obj.as_raw()) }
> -    }
> -}
> +impl_aref_for_gem_obj!(impl<T> for Object<T> where T: DriverObject);
>=20
> impl<T: DriverObject> super::private::Sealed for Object<T> {}
>=20
> --=20
> 2.51.0
>=20
>=20

Perhaps worth it to look at the comment above, but as we only expect two
invocations of this macro, I=E2=80=99d say this is also fine as is.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>

