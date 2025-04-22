Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F0615098F
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 19:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745350660; cv=none; b=F+Pud89OX0W8WDHHZHbzWqO/CXEH+eUngLGeMviRS8LOljb6CQE7TxMa+aRy2+9YtZY5V/jaU+bi3+L8po1+2JgFIxCy+ROo0ywIQudofcasaciwbu4GyLL40E1iV8rctEGRhwgmJkUfUCLk64EuAkg4DU/TSqFLt8yerfgRU4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745350660; c=relaxed/simple;
	bh=uBCeJWuQg9yGebhCe0IxKmCUgXiu992oDMVtc4BuF4Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V9mi8Spx/G1T91XZ7U5ilSCIAVNjG2zxsRQHLvfSYATsp5kSiYdfeivF2m+VpIpgpeAztiBOrpSYBboB5sN7Qj66vRVTQmyCaMC78QGsT4J8QJRG1OplSB1QNZhnkkYEGSQImqQAH6mkuN98k1lTB1YdBiSqrYTkbMes8b9BtB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e0Vv84h+; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e0Vv84h+"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43f405810b4so30894265e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 12:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745350657; x=1745955457; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7RnXmCgq1tfF7gO4aZ9Pyvr8hfNnZsXUOnMOuRw52u0=;
        b=e0Vv84h+7F5H+eqUtqxS0cVCPV8M9BljtL+XicJEVI9sM3QgMLy7MCX6Lx53ZGbDne
         PRtcqLvvLvTuxrHVoymv2F0em7yqO/k/gvAoy5WmqddybLXgB+4vQxpQDZQPWpVXysZW
         tV7WIA2xFZ5Ru3wlG+EvmNn/7DSYPdp6f0SZYAaf36j3wMHofJGXe8H+2jgGyqwe+MSq
         O3Y1IXxECeUm6+2EWkYrUUAt4+KOY0/EzMamLusbhx6U5qh8w8gp4yLUj5s4ww1aU0o/
         Vkqhg0LU9eULfEBUkv89F37GNT4IhrpxZePmrv4izzs2sgitYpg8IUmjjCKY60kPo0c5
         Wkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745350657; x=1745955457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RnXmCgq1tfF7gO4aZ9Pyvr8hfNnZsXUOnMOuRw52u0=;
        b=XlahWUXum9uPI246NzaXaVy1eRPD9eLq/JvGNQtaJrUIp+6+7GfD4852qukzmyswXr
         eak40gYRY8Lh44vJy2h+KC6bZ7Aq4uO3GeJ/3K/x1gAKqB31IZt1keN7Dg6MG/2Vo/a0
         MjlwarNY70BfFrjtbdXkHb4hg6hzPp7nW1PH6+aZDoYM3oFGSauHxlRduWGwIP5iMCt2
         soZN3bNc+11iNhDKbYYwZB0MJn0+sGVfEbeWAO33WBqvDUZKpVpy0Z5JvVNHoQWw25de
         vPhscnQXZUPDZdk4XUD20D+rEcmk5yeMND4dh6mNBY22OQZYdhZOtcjX237EuPvovpml
         32nw==
X-Gm-Message-State: AOJu0Yzi4GD+Z4tV1aFotlsMvKmEvIsU18z463I+sHXRAXrTgy0eNB/O
	a7f24nhB6tlEsZxtB6bgUve6Vb2B3V3BlukcZQtM4INNJOt9p/VCk3wLtCVzJcVUFl/rYcMipkz
	gyxFt0DhG7D+EOQ==
X-Google-Smtp-Source: AGHT+IG0m74NCBDfAN7J6NSQg6v19UWsx/JNfQ/I5HGYwAl4oODqZClIjiOs1/zp+FPH6wx5SmSmHSDNXpZgkW8=
X-Received: from wmbfo18.prod.google.com ([2002:a05:600c:6912:b0:440:59df:376a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f8f:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-4406ab9342dmr139491455e9.8.1745350656856;
 Tue, 22 Apr 2025 12:37:36 -0700 (PDT)
Date: Tue, 22 Apr 2025 19:37:34 +0000
In-Reply-To: <CAGudoHEN2NBYjFs28g2Oxe7LsP1A=guPUEbgAJTUiae6bBG6JA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAGudoHEN2NBYjFs28g2Oxe7LsP1A=guPUEbgAJTUiae6bBG6JA@mail.gmail.com>
Message-ID: <aAfv_pgxUHJSEaBy@google.com>
Subject: Re: looking for an informed write up on how to handle serious
 multicore issues in rust
From: Alice Ryhl <aliceryhl@google.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 22, 2025 at 04:44:20PM +0200, Mateusz Guzik wrote:
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
> -- 
> Mateusz Guzik <mjguzik gmail.com>

There isn't a single canonical implementation of seqlocks in Rust that I
can point you to, and we don't have one in the kernel. But we can go
through how we can design one. I'll start with a pretty bare bones API
and expand it.

To start with, I'm going to assume that we have a Seqnum implementation.

pub struct Seqnum { ... }

impl Seqnum {
    pub fn begin(&self) -> usize;
    pub fn retry(&self, num: usize) -> bool;
    pub fn write_begin(&self);
    pub fn write_end(&self);
}

I will not get in to how you implement these. You can use the same
implementation as C. I understand that the kernel implements them with
inline assembly, which we could replicate. Or we could do a number of
other things. Regardless, this is enough to get us a working but
bare-bones implementation:

#[repr(C)]
struct Meh {
    seq: Seqnum,
    safe_to_read: AtomicUsize,
    name_safe_to_read: [AtomicU8; NAME_SIZE],
    modifiable_without_the_lock: AtomicI32,
    // some other fields ...
    _cache: Cachealign, /* type with size 0 and alignment 64 */
    lock: SpinLock<MehInner>,
}

struct MehInner {
    needs_the_lock: usize,
}

fn name_equal<const LEN: usize>(name: &[AtomicU8; LEN], cmp: &CStr) -> bool {
    // Left as an excercise for the reader.
    //
    // Probably you just call the C implementation of strncmp, and this
    // function is probably defined in `kernel`.
}
fn name_copy<const LEN: usize>(dst: &[AtomicU8; LEN], src: &CStr) -> bool {
    // Ditto.
}

impl Meh {
    fn name_to_key(&self, name: &CStr) -> Option<usize> {
        let seq = self.seq.begin();
        if name_equal(&self.name_safe_to_read, name) {
            let key = self.safe_to_read.load(Relaxed);
            if !self.seq.retry(seq) {
                return key;
            }
        }

        let _guard = self.lock.lock();
        if name_equal(&self.name_safe_to_read, name) {
            Some(self.safe_to_read.load(Relaxed))
        } else {
            None
        }
    }

    fn store_name_key(&self, name: &CStr, key: usize) {
        assert!(name.len_with_nul() < NAME_SIZE);
        let _guard = self.lock.lock();
        self.seq.write_begin();
        name_copy(&self.name_safe_to_read, name);
        self.safe_to_read.write(key, Relaxed);
        self.seq.write_end();
    }
}

Your first reaction is probably "ATOMICS!?". But hold your horses for a
moment.

The reason we can't use the ordinary `usize` type is because we need to
*disallow* you from performing ordinary unsynchronized reads; similar to
how you used READ_ONCE instead of just reading the field normally. I
used atomics in this example to achieve that, but it is true that
atomics are stronger and more expensive than what we need. We might
replace AtomicUsize with a new type called SharedUsize (naming TBD!)
that has `load` and `store` methods which are weaker than the relaxed
atomic ops. For example, even relaxed loads on AtomicUsize have
additional costs associated with them because they're guaranteed to
avoid tearing.

But I digress. The point is that we need a special version of usize like
AtomicUsize that allows us to annotate that these loads and stores are
not normal loads and stores because other threads may also touch the
values in parallel. It has to be a separate type from usize to prevent
you from performing ordinary unsynchronized reads.


Let's get back to the example. The bigger problem is that there is no
enforcement of correct use at all. After all, we're just using atomics,
and any combination of reads and writes from different threads is safe
no matter what, so the compiler doesn't care.

To start with improving the API, we can wrap Seqnum in a Seqlock type.
It could look like this:

pub struct SeqLock<T> {
    seqnum: Seqnum,
    value: T,
}

impl<T> SeqLock<T> {
    pub fn try_read<U>(&self, f: impl FnOnce(&T) -> U) -> Option<U> {
        let seq = self.seqnum.begin();
        let ret = f(&self.value);
        if self.seqnum.retry(seq) {
            None
        } else {
            Some(ret)
        }
    }

    pub fn assume_no_writers(&self) -> &T {
        &self.value
    }

    pub fn write(&self) -> WriteGuard<'_, T> {
        self.seqnum.write_begin();
        WriteGuard(self)
    }
}

struct WriteGuard<'a, T>(&'a SeqLock<T>);
impl<T> Drop for WriteGuard<'_, T> {
    fn drop(&mut self) {
        self.0.seqnum.write_end();
    }
}
impl<T> Deref for WriteGuard<'_, T> {
    type Target = T;
    fn deref(&self) -> &T { &self.0.value }
}

This API is still not fool-proof - we're missing the part where it knows
about the spinlock, but at the very least you have to explicitly
annotate each access with a call to `try_read`, `assume_no_writers`, or
`write`. This is how you might use it:

#[repr(C)]
struct Meh {
    seq: SeqLock<MehSeq>,
    modifiable_without_the_lock: AtomicI32,
    // some other fields ...
    _cache: Cachealign, /* type with size 0 and alignment 64 */
    lock: SpinLock<MehInner>,
}

struct MehSeq {
    safe_to_read: SharedUsize,
    name_safe_to_read: [SharedU8; NAME_SIZE],
}

struct MehInner {
    needs_the_lock: usize,
}

impl Meh {
    fn name_to_key(&self, name: &CStr) -> Option<usize> {
        let ret = self.seq.try_read(|inner| {
            if name_equal(&inner.name_safe_to_read, name) {
                Some(inner.safe_to_read.load());
            } else {
                None
            }
        });

        if let Some(ret) = ret {
            return ret;
        }

        let _guard = self.lock.lock();
        let inner = self.seq.assume_no_writers();
        if name_equal(&inner.name_safe_to_read, name) {
            Some(inner.safe_to_read.load())
        } else {
            None
        }
    }

    fn store_name_key(&self, name: &CStr, key: usize) {
        assert!(name.len_with_nul() < NAME_SIZE);
        let _guard = self.lock.lock();
        let inner = self.seq.write();
        name_copy(&inner.name_safe_to_read, name);
        inner.safe_to_read.store(key);

        // destructor of inner ends the seqlock write region
    }
}

Notice how the fields protected by the seqlock are moved into a new
sub-struct similar to MehInner.

The `try_read` method is also interesting. It throws away your return
value if you need to retry to discourage you from using invalid values.

Anyway. There's still another big issue with the design: when you use
try_read or assume_no_writers, it still lets you write to the data.
After all, we're using atomics which we can write to at any time.

There are many ways to improve the API to prevent such writes. I'll
share one here: If you have write access, then that means that you have
a WriteGuard object. So we can have you pass a reference to it:

impl SharedUsize {
    pub fn load(&self) -> usize;
    pub fn store<T>(&self, value: usize, proof: &WriteGuard<'_, T>);
}

This way, readers can't call `store` because they don't have a
WriteGuard. The writer becomes:

    fn store_name_key(&self, name: &CStr, key: usize) {
        assert!(name.len_with_nul() < NAME_SIZE);
        let _guard = self.lock.lock();
        let inner = self.seq.write();
        name_copy(&inner.name_safe_to_read, name, &inner);
        inner.safe_to_read.store(key, &inner);

        // destructor of inner ends the seqlock write region
    }

This isn't the only way to solve this problem - there are others. Not
all of them are fool-proof - including this one. For example, I could
get a WriteGuard from one SeqLock and use it with a SharedUsize stored
in *another* SeqLock to bypass it. Other solutions *are* fool-proof and
don't have this bypass. Some of the other Rust folks are probably happy
to tell you about field projections which is an upcoming language
feature that lets you do this (and other things such as rcu) in a
fool-proof way with much more convenient syntax.

Anyway, since the reads and writes are just atomics, Rust the language
doesn't care too much if there's a bypass. It's mostly something that we
might care about as API designers.



Ok, let's return to another problem in the design, which is that it's
not tied together with the spinlock. This means that you could call
write() or assume_no_writers() without holding it.

The most direct way of solving this is to make a single abstraction that
wraps the entire thing.

#[repr(C)]
pub struct SeqLock2<T, U, V> {
    seq: Seqnum,
    seq_data: T,
    extra_data: U,
    _cache: Cachealign,
    lock: SpinLock<V>,
}

impl<T, U, V> SeqLock2<T, U, V> {
    pub fn try_read<R>(&self, f: impl FnOnce(&T) -> R) -> Option<R> {
        let seq = self.seqnum.begin();
        let ret = f(&self.value);
        if self.seqnum.retry(seq) {
            None
        } else {
            Some(ret)
        }
    }

    pub fn extra_data(&self) -> &U {
        &self.extra_data
    }

    pub fn read_with_lock(&self) -> ReadWithLockGuard<'_, T, U, V> {
        ReadWithLockGuard {
            seq: self,
            guard: self.lock.lock(),
        }
    }

    pub fn read_retry<R>(&self, mut f: impl FnMut(&T) -> R) -> R {
        if let Some(ret) = self.try_read(&mut f) {
            return ret;
        }

        f(self.read_with_lock().seq_data())
    }

    pub fn write(&self) -> WriteGuard<'a, T, U, V> {
        let guard = self.lock.lock();
        self.seqnum.write_begin();
        WriteGuard {
            seq: self,
            guard,
        }
    }
}

pub struct ReadWithLockGuard<'a, T, U, V> {
    seq: &'a SeqLock2<T, U, V>,
    guard: SpinLockGuard<'a, V>,
}
impl<'a, T, U, V> ReadWithLockGuard<'a, T, U, V> {
    pub fn seq_data(&self) -> &T {
        &self.seq.seq_data
    }
    pub fn lock_data(&self) -> &T {
        /* we hold the lock, so we also get to use the lock data */
        &self.guard
    }
}
// Ditto for WriteGuard.

By using a combined type like the above, we enforce that the spinlock
and the seqlock are used together and make it pretty hard to get that
wrong. The example becomes:

#[repr(C)]
struct Meh {
    seq: SeqLock2<MehSeq, AtomicI32, MehInner>,
}

struct MehSeq {
    safe_to_read: SharedUsize,
    name_safe_to_read: [SharedU8; NAME_SIZE],
}

struct MehInner {
    needs_the_lock: usize,
}

impl Meh {
    fn name_to_key(&self, name: &CStr) -> Option<usize> {
        self.seq.read_retry(|inner| {
            if name_equal(&inner.name_safe_to_read, name) {
                Some(inner.safe_to_read.load());
            } else {
                None
            }
        })
    }

    fn store_name_key(&self, name: &CStr, key: usize) {
        assert!(name.len_with_nul() < NAME_SIZE);

        let guard = self.seq.write();
        let inner = guard.seq_data();
        name_copy(&inner.name_safe_to_read, name);
        inner.safe_to_read.store(key);
    }
}

This API is rather nice because it lets us avoid repeating the logic in
name_to_key. The seqlock provides the retry functionality for us.

Of course it also has the disadvantage that the layout is rather more
fixed than the C version. The layout used here is probably what you want
in many cases, but the more things you enforce in the API, the more
inflexible it becomes and the fewer cases it will support. This is a
trade-off in API design.

Another way to tie the seqlock with the spinlock could be to do the same
as LockedBy: https://rust.docs.kernel.org/kernel/sync/struct.LockedBy.html

Anyway, this email has become long enough. I'll stop it here.

Alice
