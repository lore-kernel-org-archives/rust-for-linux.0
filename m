Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9072414C5B0
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336784; cv=none; b=nVRMgu+v04ahhg6mDiJ9esoNVmMVPvnas3CBHSZQM9A7wleMAaOIA8pXflpKIcUReRA4rHWgsICu3EyfOEX7biweWAg1nS+ibdOIzWQeeAvsf6xn6eNCu9WcgFTzNcSn2wm4lZrrD1hgLJBhkBV3+TSeoyrQYB3rkF7klUbL3y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336784; c=relaxed/simple;
	bh=mNaE1h8NaHTKBJQZIyVa7Mw+D1o4TevuB4UdKhDE5lI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=RHAK6BdpRFC9Oor5xmxy1l83yg/mLGjnu42M39LH/QdelQDbZ0/xJFLFntqJH1v9yrqEgkz3uLDpEIUmEK1RU0SkbH/CDegTW7WyVzs7N2alL6uHlWmTRzfDwJXPbXFt0k74sFbECEIFVUrixzx8JX27aaiRO+0/XAV6TFAiK04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrPjaUzW; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrPjaUzW"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2963dc379so791892066b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 08:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745336781; x=1745941581; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRtOvVcWeW7431Mklsq2L7XY1Dtw5Ag4kW2fiK2NRWQ=;
        b=IrPjaUzWuKggj0Jeaam4YDd4ubh7Ih7JWxaKV/cVBvv9fawN36TMtVQVXLdVtPcuzS
         /avJsdXhXXgu9RA8Prb1fVQQiXfUS2ty/kQDs+Uy9lmSu7E3cM7tEnyUy2yKylvkwMuY
         uHcdcuqAhOEFMfuqgtw28VwaCeH0RH60cDaMsIPxPP80pIza+ncEWFrMiG2w31yTdNel
         Y6nEmSe0T9q5qEO0KlmnN9mXPLUPZpm5DDW6Co6lq/01QLoD51hr2i9rVsNiLzUw2yUo
         Yx/NSlE7bC0e0Y//LCUjENNfvLp6zPJ2lXihX7ibr0K8V9Iq5EX7Onx9kswJAn4uPwvB
         x2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336781; x=1745941581;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRtOvVcWeW7431Mklsq2L7XY1Dtw5Ag4kW2fiK2NRWQ=;
        b=pfsGANiv3abFqKAK9Cp91iKCAeAqYzVPxrV8ZF11VkwHd4K/fYqKkfedYMgSHsvGmF
         W6vJsgsy6Rk2liIMgF3KYL8SaNG/RL/Kmqmie+HiKvb/40xjJrMSdOPNEGB6oii/M9pO
         Orvr6xcLUFGukIEOFqrL8K05hayzHOt+dfDRE9MT4kOa08SDY4MCyDg9BvyDE3gU+tGZ
         i68+nPyNeKBjCqVmRGlmp/PWICS+Z/W6bd6XDa4gblr9h+s6Vbbjg4rz1AhzLIqHSRR6
         mgO161Mqj7iYwIan1Z1nUldIFxl6M37ZJYXzl6ZBj4VXqv5FKm+B1tHsDvWyuskRpDFv
         6OvQ==
X-Gm-Message-State: AOJu0Yzg24KqThNMQ6n2vWmpevZgr3oOtrvgHIwLjadCYG4tO1GtcsuJ
	lv9gFvc7emNtW4COCTGVHtVLW26CamQMTfyHWDVhqtP8Yu6J8FUux3iuD9zi7QF0Y0hnx2OFy9Y
	p2BgwtTidrhj94o0D+8j9qJTbqd5zynmS
X-Gm-Gg: ASbGncsOkQw1XvKdzuUmh0DQ+i1i0fCtDYnqfdeWhdDi0B8BSj8ZrxcP7kH6huXOMsk
	kpvgn56NT+LA32IbUdIYGl27thwsi+G402Fjg+swy4sEjVnfUwEKwM/Vn1VdVHUNQj7U9A6/rZq
	Qxwphpwk6jfGNN/TWhNwNuaA==
X-Google-Smtp-Source: AGHT+IGGz6zoHh088qxJilY/EvOvhIPSXy8fUNa+ieb6DWbAkBi28AE2E4s/KpUTmXo35a88Iwt8lyBkmrbbCcZaJ/c=
X-Received: by 2002:a17:907:d643:b0:abf:4da0:28e3 with SMTP id
 a640c23a62f3a-ace35b7110emr172474266b.18.1745336780527; Tue, 22 Apr 2025
 08:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGudoHEN2NBYjFs28g2Oxe7LsP1A=guPUEbgAJTUiae6bBG6JA@mail.gmail.com>
In-Reply-To: <CAGudoHEN2NBYjFs28g2Oxe7LsP1A=guPUEbgAJTUiae6bBG6JA@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 22 Apr 2025 17:46:07 +0200
X-Gm-Features: ATxdqUGCdWqbCa4BcCOTIknfFz0JvTyW5zIvJxsR-vGPMHNSZ74-kV0Tc9ng1uY
Message-ID: <CAGudoHF_WSSu1j8pQMuHeq12uDZz=K_ORP0BETVTaijGPB0Zag@mail.gmail.com>
Subject: Re: looking for an informed write up on how to handle serious
 multicore issues in rust
To: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 4:44=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
>
> Hello.
>
> There is a lot of Rust marketing around "fearless concurrency".  The
> features showcased don't cut it in projects with serious needs and I
> failed to find a write up on what to do in that case.
>
> Everything I found so far revolves around the following:
> - an embarrassingly parallel problem, where you can pawn off
> everything -- good, but not applicable for vast majority of the kernel
> - type system which prevents non-mp safe code from being used in a
> multicore setting  -- nice, but ultimately pretty minor
> - some atomic usage, sometimes mixed with unsafe -- does not cover
> what's needed (see below)
> - wrapping all accesses with a guard obtained by issuing .lock() on an
> object -- non-starter for code with serious needs (again see below)
>
> Resources I checked:
> - the official book (https://doc.rust-lang.org/stable/book/) -- maybe
> the usage is too advanced to mention there, but there are 0 pointers
> where to go should you need it
> - Rust for Rustaceans (https://rust-for-rustaceans.com/) -- same
> - Rust Atomics and Locks (https://marabos.nl/atomics/) -- it describes
> some of the nature of the problem, but does not show to deal with it
> - Rust for C programmers -- same as first two
>
> I also found the crossbeam crate for reference -- again only has some
> of what's needed.
>
> Ultimately you can't fine-grained lock your way to high performance,
> neither in terms of scalability nor single-threaded execution. The
> reality of hardware is that not only lock contention is terrible (let
> alone in a NUMA setting), but the very operation of acquiring a lock
> is expensive even if it is cache-hot. Locking for everything may be
> tolerable for small-scale userspace programs, it's a no go for a
> modern kernel intended to run on boxen with dozens of cores.
>
> Here is an example of what's needed, how C falls short in helping out
> to validate correctness and where Rust could help at least in
> principle (except *so far* I failed to find any resources on how to do
> it). Of course an individual determined to do something wrong will
> find a way to bypass any and all safety belts -- for cases like that I
> have no expectations of Rust. There is however plenty of honest
> mistakes to make here and which Rust could help with.
>
> I'm condensing the crux of it into the following:
> struct meh {
>        /* read-mostly area */
>         seq_t seq;
>         long safe_to_read;
>         char name_safe_to_read[32];
>         atomic_t modifiable_without_the_lock;
>        /* ... some other fields */
>        /* the lock protecting the struct, explicitly separated from
> read-mostly area */
>        spin_lock lock ___cacheline_aligned_in_smp;
>        long need_the_lock_to_access_in_any_way;
> };
>
> The first 3 fields (seq, safe_to_read, name_safe_to_read) must only
> ever be written to with the spin lock held.
>
> However, everyone is free to read them without the lock and this
> happens frequently.
>
> Suppose the common case reads both safe_to_read and the name and needs
> the seq counter to ensure correctness of the result, maybe like this:
> long meh_name_to_key(struct meh *obj, const char *name) {
>         seq =3D seq_read(obj->seq);
>         if (name_equal(obj->name_safe_to_read, name)) {
>                 key =3D READ_ONCE(obj->safe_to_read);
>                 if (seq_equal(obj->seq, seq)) {
>                         return key;
>                 }
>         }
>         spin_lock(&meh->lock);
>         if (name_equal(obj->name_safe_to_read, name))
>                 key =3D obj->safe_to_read;
>         spin_unlock(&meh->lock);
>         return key;
> }
>
> Pretend this is a part of a lockless hash lookup or similar.
>
> If one was to write C code to handle this *with* safety belts, it
> would be a lot of hand-rolled asserts and even then there is some
> possibility of a screw up.
>
> Note in this case the ->name_safe_to_read array might *change* as it
> is being used to compare in name_equal(). False positive/negative
> mismatch is handled with the sequence counter.
>
> So I would like a code sample in Rust which handles the above in a
> safe and performance-friendly manner. Of course preferably code trying
> to misuse the struct would fail to compile, but a debug-only runtime
> check would do just fine.
>
> Most notably:
> - the code issuing name check + key read *must* validate the sequence
> counter before returning
> - need_the_lock_to_access_in_any_way must not be accessible without
> the lock (duh)
> - no writes to the read-mostly area without the lock held, except for
> the atomic var
>
> So how do you do this in Rust? I did not cover enough, I can write
> self-contained fully-fledged C example.
>

Here is a more complete example. It may look silly as presented here,
but this very much *is* representative of what's needed -- safe
operation in face of data changing as you access it and without any
writes to it. While this code is not something you can readily test, I
think it is sufficient to show what I'm after.

#define NAME_SIZE 32

struct meh {
        /* read-mostly area */
        seqcount_t seq;
        long safe_to_read;
        char name_safe_to_read[NAME_SIZE];
        atomic_t modifiable_without_the_lock;
        /* ... some other fields */
        /* the lock protecting the struct, explicitly separated from
           read-mostly area */
        spinlock_t lock ____cacheline_aligned_in_smp;
        long need_the_lock_to_access_in_any_way;
};

static bool meh_name_equal(const char *s1, const char *s2)
{
        /*
         * Inefficient for simplicity to not get in the way of the
crux of the issue.
         * Also intentionally ignores the case of s2 being longer for
the same reason.
         */
        return strncmp(s1, s2, NAME_SIZE) =3D=3D 0;
}

long meh_name_to_key(struct meh *obj, const char *name)
{
        long key;
        unsigned seq;

        /* note there are no stores made to any shared areas in the
common case *and* we may be racing against meh_store_name_key(), in
which case it is fine to fail to match the name. it is *not* fine to
return the ->safe_to_read value for the wrong name */
        seq =3D raw_seqcount_begin(&obj->seq);
        if (likely(meh_name_equal(obj->name_safe_to_read, name))) {
                key =3D READ_ONCE(obj->safe_to_read);
                if (!read_seqcount_retry(&obj->seq, seq))
                        return key;
        }
        spin_lock(&obj->lock);
        if (meh_name_equal(obj->name_safe_to_read, name))
                key =3D obj->safe_to_read;
        spin_unlock(&obj->lock);
        return key;
}
EXPORT_SYMBOL(meh_name_to_key);

void meh_store_name_key(struct meh *obj, const char *name, long key)
{
        /*
         * for simplicity pretend the api contract requires it
         */
        BUG_ON(strlen(name) > NAME_SIZE - 1);
        spin_lock(&obj->lock);
        write_seqcount_begin(&obj->seq);
        strcpy(obj->name_safe_to_read, name);
        obj->safe_to_read =3D key;
        write_seqcount_end(&obj->seq);
        spin_unlock(&obj->lock);
}
EXPORT_SYMBOL(meh_store_name_key);

pahole shows:
struct meh {
        seqcount_t                 seq;                  /*     0     4 */

        /* XXX 4 bytes hole, try to pack */

        long int                   safe_to_read;         /*     8     8 */
        char                       name_safe_to_read[32]; /*    16    32 */
        atomic_t                   modifiable_without_the_lock; /*
48     4 */

        /* XXX 12 bytes hole, try to pack */

        /* --- cacheline 1 boundary (64 bytes) --- */
        spinlock_t                 lock
__attribute__((__aligned__(64))); /*    64     4 */

        /* XXX 4 bytes hole, try to pack */

        long int                   need_the_lock_to_access_in_any_way;
/*    72     8 */

        /* size: 128, cachelines: 2, members: 6 */
        /* sum members: 60, holes: 3, sum holes: 20 */
        /* padding: 48 */
        /* forced alignments: 1, forced holes: 1, sum forced holes: 12 */
} __attribute__((__aligned__(64)));

I expect the rust code to retain the layout, notably the separated lock.
--=20
Mateusz Guzik <mjguzik gmail.com>
