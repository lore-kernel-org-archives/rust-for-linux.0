Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A0023EA96;
	Thu, 27 Nov 2025 13:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251325; cv=pass; b=B1ZLcjX0BSHat9/nBGXs0G3iHBTyGjQjKBunUSpL723bcsTNChLUCdQOdxJ1/7976dcAHucv0P7PSn/Zg6grZ2ClhV4CcsTEcjS/72o3uqnkxBBdfXP3P8a+ps+gs3reVD1g4EhyeUXuQ21f7ISUuaGNMSi9db8WLvpKf9FxLro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251325; c=relaxed/simple;
	bh=dntth6/jrCaqi0XYThnSHefekHvT/SUzYV/VVHS9ag4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Rvw2pP2tlfzXgQFO2xvNmLa9WLweWaYewzGEOt4Q5TmAQmRLXVRt5y0U7u9xqbIxoeBEoFxhXS1H85KcnCYn2JTN4W8JdgkaW9juaNcdiVfblwcNIURZic03WupGQwPeSRuuLOV//IlWXVE0e+pn1QolxQew1+ItPHC9dxCUAM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=eaNSWJ+B; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="eaNSWJ+B"
ARC-Seal: i=1; a=rsa-sha256; t=1764251309; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LqPqbHEkly0jpMdBadNxShd0ol37SIGAeTBs2JLI3wU1Vrekcb/mdwW+Jwf6b708a+YiwaP1BMG1DH6oM80cNDEHITF9uy0gO6PR3x1/EBGxtJiOK1L90wBLxuknNk6iq5Jha6aoAm09j1hIUjbveeiOLeqL7mfsUwMBv9GV8jE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764251309; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P2VdRqL1KlL0MJaXaQrAmhdLve9Li0HIxSSQ9BDhuuI=; 
	b=N8F/Lxatz152KJJNVRK4TOrmpON8ocdeFWJkXNJtCjOUQz8fN7M3n7OBVH27LFJES4dh63neCwdxVDlqI+mtUgxvIOMV/3jzBjRHlALYpGpl9JltCaTSwZSg79It1WuxncFXNHVl9rMJaQljuHU+tdNJqexLVqIMHKoFJha1pd0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764251309;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=P2VdRqL1KlL0MJaXaQrAmhdLve9Li0HIxSSQ9BDhuuI=;
	b=eaNSWJ+Bcil2a1bixndv9D2TE9VZZp4mdEkabLPHFPbNf1BcJdaoRcwEMZ86Rf6D
	Q4bqlJKj/PcFUoA6YzxfaYIQgge/3/MRm/XckmYFNBQEB4hZnnVi8MBbgaG5vmsvVLQ
	Bo9R6wvfQCBPDJH6SFd5+opujpOyWwjv0UfuI7iI=
Received: by mx.zohomail.com with SMTPS id 1764251305830980.9182361397502;
	Thu, 27 Nov 2025 05:48:25 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [RFC WIP 2/3] rust: sync: Add dma_fence abstractions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <bc4f01ec5172d29abd64429e3017cc53c0522e01.camel@mailbox.org>
Date: Thu, 27 Nov 2025 10:48:10 -0300
Cc: Alice Ryhl <aliceryhl@google.com>,
 Danilo Krummrich <dakr@kernel.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Lyude Paul <lyude@redhat.com>,
 Peter Colberg <pcolberg@redhat.com>,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <8F85F97A-F411-48E1-9942-64B692E8CD79@collabora.com>
References: <20251118132520.266179-2-phasta@kernel.org>
 <20251118132520.266179-4-phasta@kernel.org>
 <E55D72FC-AEF6-4D2D-973F-123306E4EB4C@collabora.com>
 <bc4f01ec5172d29abd64429e3017cc53c0522e01.camel@mailbox.org>
To: phasta@kernel.org
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Phillipp,

[=E2=80=A6]

>=20
>>=20
>>> +                // among all the fences. This can't become a UAF =
because each fence takes a
>>> +                // reference of the fence context.
>>> +                unsafe { bindings::dma_fence_init(slot, &Self::OPS, =
Opaque::cast_into(lock_ptr), context, seqno) };
>>> +            }),
>>> +            data <- data,
>>> +            signalling: false,
>>> +            signalling_cookie: false,
>>> +            fctx: fctx,
>>> +        });
>>> +
>>> +        let b =3D KBox::pin_init(fence, GFP_KERNEL)?;
>>> +
>>> +        // SAFETY: We don't move the contents of `b` anywhere here. =
After unwrapping it, ARef will
>>> +        // take care of preventing memory moves.
>>> +        let rawptr =3D KBox::into_raw(unsafe { =
Pin::into_inner_unchecked(b) });
>>> +
>>> +        // SAFETY: `rawptr` was created validly above.
>>> +        let aref =3D unsafe { =
ARef::from_raw(NonNull::new_unchecked(rawptr)) };
>>> +
>>> +        Ok(aref)
>>> +    }
>>> +
>>> +    /// Mark the beginning of a DmaFence signalling critical =
section. Should be called once a fence
>>> +    /// gets published.
>>> +    ///
>>> +    /// The signalling critical section is marked as finished =
automatically once the fence signals.
>>> +    pub fn begin_signalling(&mut self) {
>>> +        // FIXME: this needs to be mutable, obviously, but we can't =
borrow mutably. *sigh*
>>=20
>> Is AtomicBool going away? Otherwise can you expand?
>=20
> The AtomicBool is just used in the example demo code.
>=20
> The issue here is that begin_signalling() should set a "this fence is
> currently in the signalling section"-flag. So the fence needs to be
> mutable. Then, however, Rust complains because self.signalling is not
> protected by any lock.
>=20
> So one needs some sort of synchronization. Stuffing a DmaFence into a
> SpinLock would be overkill, however, considering that the C code
> already takes care of properly taking all locks.
>=20
> I've asked about that problem on Zulip once:
> =
https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/=
.E2.9C.94.20ARef.20without.20locking/near/539747635
>=20
> Haven't looked deeper into solving it since, because those lockdep
> guards are kind of nice-to-have at the moment.
>=20
> I think the solution will be to make self.signalling an AtomicBool (I
> think you meant that above?)

Yes, that=E2=80=99s what I meant, i.e.: making self.signalling an =
AtomicBool.=
