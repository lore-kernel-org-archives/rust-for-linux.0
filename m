Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94F128CF5D
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333078; cv=none; b=sNWYqCT1exe82lOTwdJDobykWXzYfvmm0eHLdFMSls1a14ew7QSntMqI5Sq9R0vPXXtuEMQoVLS56uPDe8DJ+k5LHsIEmo4OVZvAY2F8yuJqYz8ISkfZLkpTx+3GqoY4p+0Kk41tOkZXmkpB5t4biP2C4ooefOv/74WSbA1vToI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333078; c=relaxed/simple;
	bh=F5dShdsn7aELi66k899N6Nm4hyHdESAYSctGP+0aafc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Mrhkc2qIgTJJpp4PKGRfjx72XPCUjXrN9vm56weP1cIFgPCgVKivuxCfM2yRv7gBk68YzDJzMAQCYgNPw+I2Qm1/x2es02q7lQxyiAzlDYczr0/yBwvY7kg+kMMHYGriI8mz3Xnw2TWDv6QCtH39AMXqagNiYfTY6toOFd6f6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1z/EwTa; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1z/EwTa"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acae7e7587dso709483366b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745333073; x=1745937873; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kz6TwdMvbeLVmwDYLSQ5uuE01PHsS3u3yf9Mm+lJ6GI=;
        b=c1z/EwTaMFSJPoHo6vpYkfPcoxN4lqGeoIGL3NEsdRc7Iorc+62QT3ToEPxM3YhzDd
         i148xVdFWm+cSfdy2BtLD7ItnMUc3iq8HFwZE/4VCpXBNZiC4r0YcX7Mdvq0bunCtSke
         vQFIWKdalFiVZlTnxQYGZ1ogilH4SDuNf1ScpmLHSPHQA/p4dNwMVLKLQsMRCmjYbXBA
         NmdRg7Jv90Epg2QkTJFBwNTT4cRJTeO3yThtTcO4EEc1io5p8fTrqC1xSpaYVk9HoRvK
         hZT6tca8TApLE6l26Ol4GjDAbPDrbFjTCxUOk5VAnVHJcCgZN+pjMxz5jnG9KBCOyEVf
         GwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333073; x=1745937873;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kz6TwdMvbeLVmwDYLSQ5uuE01PHsS3u3yf9Mm+lJ6GI=;
        b=H+E6ttE0QOEQwovQPTHYhTu7jzFq9KgPjCEz+cA8BbvcI/7FqvLZpvoMfqf1fhuJut
         O4Sb0N0X186IHFswG5Btuo7r2+OtZGPz87L1XTtPo14ghMfY5UPePY4D66+k5CGLsg9s
         t6IrWHVv61fC2tSIKJKbwnfbwoAmbhyeuFqlkDeHKtSJXccpWLXB5WIUHEPqawz80k1r
         xm96fZC3X2OGLN8D4IEIuopNnYZ0fLiGebbtDE7P8F7KLGOR7/AuEkbPKZFP5icvRNuB
         BPxepgH/Mrzwt0HV3CMw1BChqpgd5GQQ1kj8qzvWiDGmEQOdP8N0DtQzpod1cVSUA6Qi
         QK9w==
X-Gm-Message-State: AOJu0Yyej+Tn8vDmatdwZquGy9OHKDDsy5/5CyNLnSXOoJZdskuuNJos
	zKUDhYPoTbIGTY0/lWIOA2mkDJpF/BxJfPkrcsIqfVhhU5eNfnKCTDD4IN4J0FtQj6N8mmnKQ0h
	W0aitcIX87gQVab7ZQPeWomWvY4PRuztz
X-Gm-Gg: ASbGncspox88VqTah6uQJfRfUo7gbwtSXcRAAVNtdQi3nQAg4BlOl64S1L8G5gvtU2s
	bSrUWVHA9ZTupkhGjcmbmVIcmj3ZPZbMV2b7B4jtLaKSFrJ2FM0x09lOA+woPeod6pljRTCxAfV
	ZtTsncxklHB1Mba/ntF9pkcA==
X-Google-Smtp-Source: AGHT+IEt4g+iXWYw7+J4d44PUnWrR5Owo06708Xlnr0pvZaXeecH38IfBAo9bUuVS6h0it+cIrj0u3DV52ehJQ1yVaI=
X-Received: by 2002:a17:907:7d8a:b0:acb:138b:520d with SMTP id
 a640c23a62f3a-acb74aac9efmr1279253766b.6.1745333072799; Tue, 22 Apr 2025
 07:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 22 Apr 2025 16:44:20 +0200
X-Gm-Features: ATxdqUGZoWGUZ1cpy0mynJ7Mya9oDeUSAFM7L241gOoVthTTfiGCi0diOuICAx8
Message-ID: <CAGudoHEN2NBYjFs28g2Oxe7LsP1A=guPUEbgAJTUiae6bBG6JA@mail.gmail.com>
Subject: looking for an informed write up on how to handle serious multicore
 issues in rust
To: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello.

There is a lot of Rust marketing around "fearless concurrency".  The
features showcased don't cut it in projects with serious needs and I
failed to find a write up on what to do in that case.

Everything I found so far revolves around the following:
- an embarrassingly parallel problem, where you can pawn off
everything -- good, but not applicable for vast majority of the kernel
- type system which prevents non-mp safe code from being used in a
multicore setting  -- nice, but ultimately pretty minor
- some atomic usage, sometimes mixed with unsafe -- does not cover
what's needed (see below)
- wrapping all accesses with a guard obtained by issuing .lock() on an
object -- non-starter for code with serious needs (again see below)

Resources I checked:
- the official book (https://doc.rust-lang.org/stable/book/) -- maybe
the usage is too advanced to mention there, but there are 0 pointers
where to go should you need it
- Rust for Rustaceans (https://rust-for-rustaceans.com/) -- same
- Rust Atomics and Locks (https://marabos.nl/atomics/) -- it describes
some of the nature of the problem, but does not show to deal with it
- Rust for C programmers -- same as first two

I also found the crossbeam crate for reference -- again only has some
of what's needed.

Ultimately you can't fine-grained lock your way to high performance,
neither in terms of scalability nor single-threaded execution. The
reality of hardware is that not only lock contention is terrible (let
alone in a NUMA setting), but the very operation of acquiring a lock
is expensive even if it is cache-hot. Locking for everything may be
tolerable for small-scale userspace programs, it's a no go for a
modern kernel intended to run on boxen with dozens of cores.

Here is an example of what's needed, how C falls short in helping out
to validate correctness and where Rust could help at least in
principle (except *so far* I failed to find any resources on how to do
it). Of course an individual determined to do something wrong will
find a way to bypass any and all safety belts -- for cases like that I
have no expectations of Rust. There is however plenty of honest
mistakes to make here and which Rust could help with.

I'm condensing the crux of it into the following:
struct meh {
       /* read-mostly area */
        seq_t seq;
        long safe_to_read;
        char name_safe_to_read[32];
        atomic_t modifiable_without_the_lock;
       /* ... some other fields */
       /* the lock protecting the struct, explicitly separated from
read-mostly area */
       spin_lock lock ___cacheline_aligned_in_smp;
       long need_the_lock_to_access_in_any_way;
};

The first 3 fields (seq, safe_to_read, name_safe_to_read) must only
ever be written to with the spin lock held.

However, everyone is free to read them without the lock and this
happens frequently.

Suppose the common case reads both safe_to_read and the name and needs
the seq counter to ensure correctness of the result, maybe like this:
long meh_name_to_key(struct meh *obj, const char *name) {
        seq = seq_read(obj->seq);
        if (name_equal(obj->name_safe_to_read, name)) {
                key = READ_ONCE(obj->safe_to_read);
                if (seq_equal(obj->seq, seq)) {
                        return key;
                }
        }
        spin_lock(&meh->lock);
        if (name_equal(obj->name_safe_to_read, name))
                key = obj->safe_to_read;
        spin_unlock(&meh->lock);
        return key;
}

Pretend this is a part of a lockless hash lookup or similar.

If one was to write C code to handle this *with* safety belts, it
would be a lot of hand-rolled asserts and even then there is some
possibility of a screw up.

Note in this case the ->name_safe_to_read array might *change* as it
is being used to compare in name_equal(). False positive/negative
mismatch is handled with the sequence counter.

So I would like a code sample in Rust which handles the above in a
safe and performance-friendly manner. Of course preferably code trying
to misuse the struct would fail to compile, but a debug-only runtime
check would do just fine.

Most notably:
- the code issuing name check + key read *must* validate the sequence
counter before returning
- need_the_lock_to_access_in_any_way must not be accessible without
the lock (duh)
- no writes to the read-mostly area without the lock held, except for
the atomic var

So how do you do this in Rust? I did not cover enough, I can write
self-contained fully-fledged C example.

-- 
Mateusz Guzik <mjguzik gmail.com>
