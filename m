Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91104C92
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Sep 2024 02:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726282275; cv=none; b=ep4gAhV/DtLdF30yGb2Vs8WIeDbkycCt2FDfbC8F8Mmrp56KFkdpwW8D6fbFrUpvF2k1zOGRHNAfANCS0qPav2ZfbF4WTjNQQaDydV241F+dQKtJ66Ys4jOdFhU3xRja/L96+KbT4GNSjoOkRh3asWILS5gkiLXePmlhr2ZLY4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726282275; c=relaxed/simple;
	bh=714S60HEYqBOe2G85nVsNU+NFuLSc4huCLTfAsIQjAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lz1vz2sfESSLJCyy/kHRNh7iZQrbOAN2APLhDn3NAzFepQcncbReqa7O6xjBW0WqiN7uXALxWHzCYsq+97KdZuwOFhJ7RFHIJjezl71Sh4L0qxJXBrcrS3QyRFEIXl2+GNWErtVFdBXqmGfigQm/44eFZSB496VHtIkC1+rKUU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TK15ieSr; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TK15ieSr"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4581cec6079so137421cf.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 19:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726282273; x=1726887073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+blspuoybzNu3AhzC/SMKsKwmuAp3Z3K2v2XJsIopFM=;
        b=TK15ieSrNnXVuh+IhN1PPm42sTbbUnqwXYY+GocOGlyhPeC4aldzInqcqeGd3exooc
         FlImbu7aM3dmO5qGLDMUlaqTJZFakw0HTLdKO1DzF2j8QX99ym0mr7ehHkYekF5GcgBU
         14xZAZGNuSuV2HwPsGJATsMXAWKjOV/Z1syRTP9MHnECUGovz/8olHhXKBgPdQ+kdMAw
         F1cIMiR6ajKPddSdaXiHzv+MZOzt3KoTj/EfQ9IEjXhPMNBj2wtoBeVvei3FatpZKCsd
         SCogybk2TeIlhRBLqvCN2MfEbpH3jdzv6cN31hJz7IhqHQOTnzKneVmAiPe2mkmVU7Kv
         pDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726282273; x=1726887073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+blspuoybzNu3AhzC/SMKsKwmuAp3Z3K2v2XJsIopFM=;
        b=gDOdaXAPqMm1jyTHhx/jW3EXXoTN/QpQ6MJNIGzsL8F/rRePO9GRDjKst3Pl2bs5bg
         le9+Wg7zpzRUQ4RzSJDEpuyHauUVLsDIa+4JcmSVewLkxv5jgM2ymQr8QLr5+dlzC+KC
         RK0rXAC9ulj22I+RzcLBaa/sKdC0ptPMayPH62NyWZ0AtEyR9VjqN/A5IWXK4V5cQvX6
         3AWxjgpvLVumWyf+YOdxTrt4RAcDGAS0aP/NWQfCcREYHzdjZUKf7uKQb29rwf9XOFRU
         D9ibqM6dYQPO7yJK+s/eyuFM/ogfvGtlv6FkZt0re3iBoKpFOdthlgpuYia4ZlPEHo1w
         Y30A==
X-Forwarded-Encrypted: i=1; AJvYcCWNfC2/w0SgJKHbBhxSa3Nibahax7TQAoRGJN4oX7rOF1vhtEqXJPktiVpvKn5j2QwmMEIJ6OmIGQ3wOPGONQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0yw+Lthz51JTJ8LhVWcqI1bzyUCwSk1krblmrLKbUG5WnLrp
	9PRyiA3RGYW2/+q2C4AZz3WFp6IgPc6UwEnXMKsCvtytuG5Ff55P2i/rKl8hRsTbiIa/JOqtjoL
	IW6dTUmLQWjkLpYojkDav053KNE1tZCGaYufF
X-Google-Smtp-Source: AGHT+IGWCbJtzQBtPkMgqGnnUdIlSr1NFVYVAQMMT/xk2RmouwM5DwlBs2oIGPKcxYyg5j8qxJE8okxzyOJR8KvtHNg=
X-Received: by 2002:ac8:7d02:0:b0:44f:e2c1:cc75 with SMTP id
 d75a77b69052e-45860780694mr9993621cf.8.1726282272496; Fri, 13 Sep 2024
 19:51:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913213041.395655-1-gary@garyguo.net> <14389f99-dfa9-4646-a24e-e5eef1beacf0@proton.me>
 <CAOcBZOS6BAJ1FTFkB3x6jdag_hL7zrLbFy7TxkvZWKxRZ_+ggA@mail.gmail.com>
In-Reply-To: <CAOcBZOS6BAJ1FTFkB3x6jdag_hL7zrLbFy7TxkvZWKxRZ_+ggA@mail.gmail.com>
From: Ramon de C Valle <rcvalle@google.com>
Date: Fri, 13 Sep 2024 19:51:01 -0700
Message-ID: <CAOcBZOTcoPEk2Bo05gj66cHiqKxTR7j1z9U_j+Jeh1oCjtOKXg@mail.gmail.com>
Subject: Re: [PATCH 0/5] use custom FFI integer types
To: Benno Lossin <benno.lossin@proton.me>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since we're doing this, may I suggest that we use
https://crates.io/crates/cfi-types by reexporting them as kernel::ffi
instead? By using those, we would also avoid the granularity loss of
normalizing integers and using the integer normalization option
wouldn't be necessary. I could accept any
contributions/kernel-specific changes that would make it easier for
the kernel to use them.


On Fri, Sep 13, 2024 at 7:48=E2=80=AFPM Ramon de C Valle <rcvalle@google.co=
m> wrote:
>
> Since we're doing this, may I suggest that we use https://crates.io/crate=
s/cfi-types by reexporting them as kernel::ffi instead? By using those, we =
would also avoid the granularity loss of normalizing integers and using the=
 integer normalization option wouldn't be necessary. I could accept any con=
tributions/kernel-specific changes that would make it easier for the kernel=
 to use them.
>
> On Fri, Sep 13, 2024 at 2:43=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
>>
>> On 13.09.24 23:29, Gary Guo wrote:
>> > This patch series aim to reduce the unnecessary type casts needed in
>> > Rust code doing FFI calls.
>> >
>> > With this series, we can ensure:
>> >
>> > * `size_t` is mapped to usize. Currently this is mostly true except fo=
r
>> >   C builtin functions, which gets translated by bindgen to c_ulong/c_u=
int.
>> >
>> > * `__kernel_size_t` is mapped to usize. Currently this is mapped to
>> >   c_ulong/c_uint.
>> >
>> > * `unsigned long` is mapped to usize. Currently this is mapped by Rust
>> >   libcore to either u32 or u64.
>> >
>> > * `char` is mapped to `u8`. Currently this is mapped by Rust libcore t=
o
>> >   either i8 or u8.
>>
>> Great work!
>>
>> > After this series, FFI code needs to use `kernel::ffi` types instead o=
f
>> > `core::ffi`.
>>
>> I think we should have a lint that checks for this. Can probably be a
>> checkpatch.pl check and a good-first-issue.
>>
>> ---
>> Cheers,
>> Benno
>>
>> > Gary Guo (5):
>> >   rust: fix size_t in bindgen prototypes of C builtins
>> >   rust: map `__kernel_size_t` and friends also to usize/isize
>> >   rust: use custom FFI integer types
>> >   rust: map `long` to `isize` and `char` to `u8`
>> >   rust: cleanup unnecessary casts
>> >
>> >  rust/Makefile                      | 24 ++++++++++-----
>> >  rust/bindgen_parameters            |  5 ++++
>> >  rust/bindings/lib.rs               |  5 ++++
>> >  rust/ffi.rs                        | 48 +++++++++++++++++++++++++++++=
+
>> >  rust/kernel/alloc/allocator.rs     |  4 +--
>> >  rust/kernel/block/mq/operations.rs | 18 +++++------
>> >  rust/kernel/block/mq/raw_writer.rs |  2 +-
>> >  rust/kernel/block/mq/tag_set.rs    |  2 +-
>> >  rust/kernel/error.rs               | 25 +++++++---------
>> >  rust/kernel/firmware.rs            |  2 +-
>> >  rust/kernel/init.rs                |  2 +-
>> >  rust/kernel/kunit.rs               | 10 ++-----
>> >  rust/kernel/lib.rs                 |  2 ++
>> >  rust/kernel/net/phy.rs             | 14 ++++-----
>> >  rust/kernel/print.rs               |  4 +--
>> >  rust/kernel/str.rs                 | 10 +++----
>> >  rust/kernel/sync/arc.rs            |  6 ++--
>> >  rust/kernel/sync/condvar.rs        |  2 +-
>> >  rust/kernel/sync/lock.rs           |  2 +-
>> >  rust/kernel/sync/lock/mutex.rs     |  2 +-
>> >  rust/kernel/sync/lock/spinlock.rs  |  2 +-
>> >  rust/kernel/task.rs                |  8 ++---
>> >  rust/kernel/time.rs                |  4 +--
>> >  rust/kernel/types.rs               | 26 ++++++++--------
>> >  rust/kernel/uaccess.rs             | 31 ++++++-------------
>> >  rust/macros/module.rs              |  8 ++---
>> >  rust/uapi/lib.rs                   |  5 ++++
>> >  27 files changed, 161 insertions(+), 112 deletions(-)
>> >  create mode 100644 rust/ffi.rs
>> >
>> >
>> > base-commit: 93dc3be19450447a3a7090bd1dfb9f3daac3e8d2
>> > --
>> > 2.44.1
>> >
>>
>>
