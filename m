Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE904071F9;
	Sat,  6 Jun 2026 08:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780733381; cv=none; b=BXZSmk8E7X1VFQtwoAG/0M0eVhWeafBODMlV4qrIoJwFckQf/EWsY7HSM8jpGapXiAwCaWYzlevdQ6A6AbNcVnmSELj7cAoGuJwtqTzgrV937u2dpEbhiPIwxbu0lrZPtEz8yGlELDqftX0j8NTkChg5iOirrDyyn/GEWLpi8TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780733381; c=relaxed/simple;
	bh=Ddqaet52rqEDAhbQi3ZIb2FbL4lSrYZZXY408QDcirY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RVMJpGbRjJ2knzlGP82A9gfmyY2dgZA0p6Hb4Z88vNoLW+3Ieub42aszUfjAoo2ZQZeErfsxDQKGyHKR2Lb8Pa6VaDZIDSk9ixMW3HOQmoSOQiSq6RVscSQGDDebtXvuhAukTgJ1Q9OrmUW9uGVs1gzdd/y8IeJLVoea+tq9kGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lur9stjw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lur9stjw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7233F1F00893;
	Sat,  6 Jun 2026 08:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780733379;
	bh=cE+0f4YhfxIdvdE/jaRWEABJzl0iFjhEKcegaGb/Gfg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Lur9stjwC+LWPWxPdFlEXgUaYe9u01mjBCnlNTK/Rnry5S0k4XF+spsmZXsMStFze
	 WB31QcD2H28Z1uPzXY1RuVRNh8mo9FmMU6ZR3YORhICWOrn61+vfLNk0vkjC8Q9GYH
	 0BXAt6betE17iNLkBTC9WM0N5S+OkN0y8H2kOMr3a0Hd4OG3t1bexlIF/x+LzlQdBN
	 GZU1JvYzlthRcXt6OB8Ll5lgSLL2kkAMACdiASaE3udUFOqF2mXnRiPlUtumeZbORh
	 vjLqa3TfD0Lf/qiBLIPcCaT0DZ3qg1lROcuFhfrW1snE5AeCV1TXiVsA0kyXO5rWNg
	 GuobbZypyY/XQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rust: impl_flags: add bitwise operations with
 the underlying type
In-Reply-To: <CANiq72ksbJPBtOhB+Oo0bc48g+dYLXPOZz=yQVTE1C5H+jyKzQ@mail.gmail.com>
References: <20260605-impl-flags-additions-v2-0-0d27242f460b@kernel.org>
 <20260605-impl-flags-additions-v2-2-0d27242f460b@kernel.org>
 <CANiq72ksbJPBtOhB+Oo0bc48g+dYLXPOZz=yQVTE1C5H+jyKzQ@mail.gmail.com>
Date: Sat, 06 Jun 2026 10:09:31 +0200
Message-ID: <87h5nghyys.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, Jun 5, 2026 at 3:04=E2=80=AFPM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Add bitwise or operations between the flag value enum and the underlying
>> type. This is useful when manipulating flags from C API without round
>> tripping into the Rust flag container type:
>>
>>   let mut lim: bindings::queue_limits =3D unsafe { core::mem::zeroed() };
>
> Can this use `zeroable` nowadays?

Yes, probably.

>
>>   if self.write_cache {
>>       lim.features |=3D request::Feature::WriteCache;
>>   }
>>
>> The above code would be needlessly verbose without this direct assignment
>> option.
>
> v2 looks better overall, but I am wondering about Gary's question in
> v1 -- not sure if you saw it:
>
>   https://lore.kernel.org/rust-for-linux/DGPT710WN25X.1B9P21BE6X8P4@garyg=
uo.net/
>
> The commit message shows a converted case, but is it that much
> verbose? Perhaps you can point to the use case / code that made you
> think about adding these `impl`s?

I feel like we already discussed this. I don't understand the objection.
I have a C type integer that is a set of flags. In bindings, I
manipulate the flags (I will send this code within the next few days):

    /// Build a new `GenDisk` and add it to the VFS.
    pub fn build(
        self,
        name: fmt::Arguments<'_>,
        tagset: Arc<TagSet<T>>,
        queue_data: T::QueueData,
    ) -> Result<Arc<GenDisk<T>>> {
        let data =3D queue_data.into_foreign();
        let recover_data =3D ScopeGuard::new(|| {
            // SAFETY: T::QueueData was created by the call to `into_foreig=
n()` above
            drop(unsafe { T::QueueData::from_foreign(data) });
        });

        let mut lim: bindings::queue_limits =3D pin_init::zeroed();

        lim.logical_block_size =3D self.logical_block_size;
        lim.physical_block_size =3D self.physical_block_size;
        lim.max_hw_discard_sectors =3D self.max_hw_discard_sectors;
        lim.max_sectors =3D self.max_sectors;
        lim.virt_boundary_mask =3D self.virt_boundary_mask;
        if self.rotational {
            lim.features =3D Feature::Rotational.into();
        }

        #[cfg(CONFIG_BLK_DEV_ZONED)]
        if self.zoned {
            if !T::HAS_REPORT_ZONES {
                return Err(error::code::EINVAL);
            }

            lim.features |=3D Feature::Zoned;
            lim.chunk_sectors =3D self.zone_size_sectors;
            lim.max_hw_zone_append_sectors =3D self.zone_append_max_sectors;
        }

        if self.write_cache {
            lim.features |=3D Feature::WriteCache;
        }

        if self.forced_unit_access {
            lim.features |=3D Feature::ForcedUnitAccess;
        }

        // SAFETY: `tagset.raw_tag_set()` points to a valid and initialized=
 tag set
        let gendisk =3D from_err_ptr(unsafe {
            bindings::__blk_mq_alloc_disk(
                tagset.raw_tag_set(),
                &mut lim,
                data,
                static_lock_class!().as_ptr(),
            )
        })?;

        ...

I don't understand the rationale for writing these flags into a
temporary to then assigning later.


Best regards,
Andreas Hindborg


