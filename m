Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [37.187.220.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA930286D5E
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.220.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791732411; cv=none; b=qVO48it23GjIl8I7503834keRo+8/TRyl9YyFDJuCxJrpx9o7tZ9l9NdmTW5x7/6CJBE5zHDHRw4yE9vr2GTDkQOp3peYtQTvJaaFGsGB8Qp60bRiGWPRebTmFpkVjxoZEDOP8jT0Vvl5sZlT4Mk1BSp8f9vpm+fqwz8WNgv1Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791732411; c=relaxed/simple;
	bh=1UiWxxWmaqJS/1eMvEfKBukxOF927TCrDCQv/J4e9+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YvVqGz7Q/QnzoiB94jh+i/q4w0Au92LDqwIYxrm4EUMvl4Yd++4agwI9Nj0Dbriuk8N90pAugJl972oH00YbQaFwqEqkZ3JNM9Guni7WH1AVDHVlZxKezSKy781p1VYXj5/kQADah1/lXlY+uANxoajnjbzP2SbmaYZ5h8nLoNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=jyrBvQLz; arc=none smtp.client-ip=37.187.220.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="jyrBvQLz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail2; t=1791732397; x=1791991597;
	bh=RXyfFVfaAhlQRHEV6RukULXPip+X7zzDOrgAXGjUHEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=jyrBvQLz9yBGShrDXcTleIU74SPcLuRy1kLDtZ5Ics3vWQ6Z1tjZQJFmdbOaHlfXm
	 ZmyfRoiG0MQlxyMvzHKYkXn1SHo309tU6rEYCxrj77KTtmTCV9DIVIxyxlhjZ0Uy3s
	 14OKGOnXtn1suGYWbqFMDLpBDPuVKko2M5U4MzOECGTthJn3epSioUOjuYSBo9IfYK
	 4YP+t651120yToVpN+WG9xRYhTN1Q317xGG6jJ0mhvbj2gMCsu9K530a8sU3gu6kUv
	 ueg+AA3vtK4fj+0UZLtrjrGT1ykON1XOvqoq7lZaOlioZgwN1QGdyMeaSSyBIsxzG9
	 +xkM+MAtWNHOA==
X-Pm-Submission-Id: 4j2kw71YDfz2ScWv
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 6/7] rust: ww_mutex: implement LockSet
Date: Sun, 11 Oct 2026 18:26:20 +0300
Message-ID: <20261011152630.117725-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <A11C8B1A-00A3-49C9-B9B5-30A55AFDDF2B@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev> <20260103073554.34855-7-work@onurozkan.dev> <A11C8B1A-00A3-49C9-B9B5-30A55AFDDF2B@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Sep 2026 19:10:16 -0300=0D
Daniel Almeida <daniel.almeida@collabora.com> wrote:=0D
=0D
> Hi Onur,=0D
> =0D
> The bot has caught it already, but remember to compile with CLIPPY=3D1 fo=
r=0D
> v11.=0D
> =0D
> If push() fails, two things drop:=0D
> =0D
> > +    /// Attempts to lock the given [`Mutex`] and stores a guard for it=
.=0D
> > +    pub fn lock<T>(&mut self, mutex: &'a Mutex<'a, T>) -> Result {=0D
> > +        let guard =3D self.acquire_ctx.lock(mutex)?; <--- this guard=0D
> > +=0D
> > +        self.taken.push(=0D
> > +            RawGuard {=0D
> > +                // SAFETY: We just locked it above so it's a valid poi=
nter.=0D
> > +                mutex_ptr: unsafe { NonNull::new_unchecked(guard.mutex=
.inner.get()) },=0D
> > +                _not_send: NotThreadSafe,=0D
> > +            }, <------- also the raw guard, which drops in push()=0D
> > +            GFP_KERNEL,=0D
> > +        )?;=0D
> > +=0D
> > +        // Avoid unlocking here; `release_all_locks` (also run by `Dro=
p`)=0D
> > +        // performs the unlock for `LockSet`.=0D
> > +        core::mem::forget(guard);=0D
> > +=0D
> > +        Ok(())=0D
> > +    }=0D
> > +=0D
> =0D
> Both unlock. I suggest that RawGuard consumes Guard on creation, or some=
=0D
> variation of this.=0D
=0D
We can forget the original guard after constructing RawGuard before calling=
=0D
push(). I think we can keep `RawGuard` as simple as it is.=0D
=0D
> =0D
> =0D
> When locking, I don't think it makes sense to immediately retry on=0D
> -EDEADLK. This will busy-loop on a lock that will probably still be=0D
> taken. We should release all locks and sleep instead.=0D
> =0D
> > +    pub fn lock_all<T, Y, Z>(=0D
> > +        &mut self,=0D
> > +        mut locking_algorithm: T,=0D
> > +        mut on_all_locks_taken: Y,=0D
> > +    ) -> Result<Z>=0D
> > +    where=0D
> > +        T: FnMut(&mut LockSet<'a>) -> Result,=0D
> > +        Y: FnMut(&mut LockSet<'a>) -> Result<Z>,=0D
> > +    {=0D
> > +        loop {=0D
> > +            match locking_algorithm(self) {=0D
> > +                Ok(()) =3D> {=0D
> > +                    // All locks in `locking_algorithm` succeeded.=0D
> > +                    // The user can now safely use them in `on_all_loc=
ks_taken`.=0D
> > +                    let res =3D on_all_locks_taken(self);=0D
> > +                    self.release_all_locks();=0D
> > +=0D
> > +                    return res;=0D
> > +                }=0D
> > +                Err(e) if e =3D=3D EDEADLK =3D> {=0D
> > +                    // Deadlock detected, retry from scratch.=0D
> > +                    self.cleanup_on_deadlock(); =0D
> > +                    continue; <------ sleep on the contended lock befo=
re continuing=0D
> > +                }=0D
> > +                Err(e) =3D> {=0D
> > +                    self.release_all_locks();=0D
> > +                    return Err(e);=0D
> > +                }=0D
> > +            }=0D
> > +        }=0D
> > +    }=0D
> > +=0D
> =0D
> In order to sleep, we must record the contended lock though, which is=0D
> something that this patch does not do yet. I suggest that we store a=0D
> pointer to it and call from_raw() on that. Also, when acquiring the=0D
> contended lock, we must hold it before retrying, or we will race for it=0D
> again.=0D
> =0D
> > +    fn cleanup_on_deadlock(&mut self) {=0D
> > +        self.release_all_locks();=0D
> > +=0D
> > +        // SAFETY: We released all the locks just above.=0D
> > +        unsafe { self.acquire_ctx.as_mut().reinit() }; =0D
> > +    }=0D
> =0D
> =0D
> IIUC, calling reinit() will forfeit our ticket and acquire a new one, so=
=0D
> LockSet breaks the whole premise of wwmutex: when there's contention,=0D
> the older ticket eventually wins. IMHO, remove that line.=0D
> =0D
> =0D
> -- Daniel=0D
