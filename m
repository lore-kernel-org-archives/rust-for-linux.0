Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69C43AFAE2;
	Wed, 30 Sep 2026 22:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790806325; cv=pass; b=VNgz1P1SZ24rSzt1OMgnsSle3fKeRTS3QcR5oLO5jc1W3wN8PtYnj0SUNuhjOnia48k0r4klvxKpnxZTnA4Q+jFY/mytl9JkAtmId5TpslIJ9FglPVX9DobXLL91VUQtugbS8r3uCn9/5B4eu68v9iPj/prKuPpc/E6IXvark2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790806325; c=relaxed/simple;
	bh=oXoLYJSu6hPT3Z4IyHghD8zubc5NgSK5ilmVJ/G/8Ro=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=geIjEgbw4c1a34+1lKPdOdEA0W96WZweIt3O/jj3O8Pw2wkpJbsr9CZW1AS/Bz2yNDlwFeULt9hQvXt6XR7csRh6L1iiAwiQOHDlezueXKTxfKZCI+7kdXrkeFjntQjMPxLKKFQ9RUO/SDGYs/Ylk2OO+qS3jT5In9Wy1jsbzvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=TgswJeQs; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="TgswJeQs"
ARC-Seal: i=1; a=rsa-sha256; t=1790806234; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KP4UtcmMfrie5mygnITzREXnvL9pcS8QpSEm5K5RlhurnWcg+eP5muYbD+4XTWMrNXSAcIpIVx58PAqo0+mEnYo2vWq+ajz9f6zurxvQoDVX9lIwX2CwAXpY/OimT/rnv7KKtMds9IfqGcFoMp+5GJ/cskmU5y60rpZM/fU1ev4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790806234; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WzSZ0hnUQT8CYMb5oLj6n5g++E2FZ910FVeaCeR9vMM=; 
	b=RKoDia5lHt3ecYgP0mQbg0tg45ublQuFLVkNBfvREFbtfNuwAOF0+Q7iUzuy/EnGcb23dimop66q44R0GXbkHWX0Rd0xhPci6C5LW2dkNnXCtoVsL5No8PoajXBFIOZnb2ZUfEpMpDYuc0ooJUTyGhbIQjMlr1hO48cHOBBfZqw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790806234;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=WzSZ0hnUQT8CYMb5oLj6n5g++E2FZ910FVeaCeR9vMM=;
	b=TgswJeQsT2KcLgzJU7Bc0CswanCEM81OQTY3i6ztQ2SsquPBJ9k/O2h+FcsARn4x
	YOir9j6t0WSZcH01LIq1ntlI8oT7fKXtUcFPIldaL7Euidqe2Wj4fVhsP50GQxEcDPV
	y9ov9Z+gRHdrq3LCE81BFLfTWbnVvdpBtBlm9Oto=
Received: by smtp.zohomail.com with SMTPS id 1790806233139843.2903306911663;
	Wed, 30 Sep 2026 15:10:33 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v10 6/7] rust: ww_mutex: implement LockSet
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260103073554.34855-7-work@onurozkan.dev>
Date: Wed, 30 Sep 2026 19:10:16 -0300
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <A11C8B1A-00A3-49C9-B9B5-30A55AFDDF2B@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev>
 <20260103073554.34855-7-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Hi Onur,

The bot has caught it already, but remember to compile with CLIPPY=3D1 =
for
v11.

If push() fails, two things drop:

> +    /// Attempts to lock the given [`Mutex`] and stores a guard for =
it.
> +    pub fn lock<T>(&mut self, mutex: &'a Mutex<'a, T>) -> Result {
> +        let guard =3D self.acquire_ctx.lock(mutex)?; <--- this guard
> +
> +        self.taken.push(
> +            RawGuard {
> +                // SAFETY: We just locked it above so it's a valid =
pointer.
> +                mutex_ptr: unsafe { =
NonNull::new_unchecked(guard.mutex.inner.get()) },
> +                _not_send: NotThreadSafe,
> +            }, <------- also the raw guard, which drops in push()
> +            GFP_KERNEL,
> +        )?;
> +
> +        // Avoid unlocking here; `release_all_locks` (also run by =
`Drop`)
> +        // performs the unlock for `LockSet`.
> +        core::mem::forget(guard);
> +
> +        Ok(())
> +    }
> +

Both unlock. I suggest that RawGuard consumes Guard on creation, or some
variation of this.


When locking, I don't think it makes sense to immediately retry on
-EDEADLK. This will busy-loop on a lock that will probably still be
taken. We should release all locks and sleep instead.

> +    pub fn lock_all<T, Y, Z>(
> +        &mut self,
> +        mut locking_algorithm: T,
> +        mut on_all_locks_taken: Y,
> +    ) -> Result<Z>
> +    where
> +        T: FnMut(&mut LockSet<'a>) -> Result,
> +        Y: FnMut(&mut LockSet<'a>) -> Result<Z>,
> +    {
> +        loop {
> +            match locking_algorithm(self) {
> +                Ok(()) =3D> {
> +                    // All locks in `locking_algorithm` succeeded.
> +                    // The user can now safely use them in =
`on_all_locks_taken`.
> +                    let res =3D on_all_locks_taken(self);
> +                    self.release_all_locks();
> +
> +                    return res;
> +                }
> +                Err(e) if e =3D=3D EDEADLK =3D> {
> +                    // Deadlock detected, retry from scratch.
> +                    self.cleanup_on_deadlock();=20
> +                    continue; <------ sleep on the contended lock =
before continuing
> +                }
> +                Err(e) =3D> {
> +                    self.release_all_locks();
> +                    return Err(e);
> +                }
> +            }
> +        }
> +    }
> +

In order to sleep, we must record the contended lock though, which is
something that this patch does not do yet. I suggest that we store a
pointer to it and call from_raw() on that. Also, when acquiring the
contended lock, we must hold it before retrying, or we will race for it
again.

> +    fn cleanup_on_deadlock(&mut self) {
> +        self.release_all_locks();
> +
> +        // SAFETY: We released all the locks just above.
> +        unsafe { self.acquire_ctx.as_mut().reinit() };=20
> +    }


IIUC, calling reinit() will forfeit our ticket and acquire a new one, so
LockSet breaks the whole premise of wwmutex: when there's contention,
the older ticket eventually wins. IMHO, remove that line.


-- Daniel=
