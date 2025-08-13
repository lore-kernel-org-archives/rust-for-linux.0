Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C4B2EAB68
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 13:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755093299; cv=none; b=P+n1Cj88ocGoC/2Rcp8Ia5ppPnJWJqaWo838GsbH5Tn+9c2ix+GGlrGnyf3p9Pjgvkj6knG4ppK5PpWvOEJeuS/HTse+n8NntAdB7azFiYLPae8SaLycfS9qFV8V8LrpRFJPsrbsJM+ZjUvJGa57fur20+bCuguWgpEEgivO/6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755093299; c=relaxed/simple;
	bh=Bsr3Xgf1pvt0rMkSUDDvq7T6BZJlReymd/Jc4jOjIgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBGZsTbT0Ul3MPfu45DoUrTo4LJ/OjtKxE/f6wQ2yr66+yaOyBjoI8QWKyYbz2+L8W5/ta0Hn6IdIK73IQNJPLqDER5mYs0la0XcdKUl8/GrBnW5oJqhrPIOe2R4AKiRSpU48N1x0zvHXCaDX4zE9je+kMuuwufaM8SfdcMnM5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mo4qNBds; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mo4qNBds"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b913b7dbe3so907080f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 06:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755093294; x=1755698094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey7XIorOzAd7x0egX+tKCQ6muW37hs4s2Deiul4Gcbk=;
        b=mo4qNBdslknkhb84d65Z8mi2jUaF7/xuHRkgukdFg3HYIpxxpV+fM8avqTgxkJfXnY
         9a/YPhlZ3D5rAJqZrKRETXk7yfh9dcOi7SEJoCcEpO2DKTQ5qWFj+Z5WzmnkioReGaej
         CPN3Tw5o41qy1QTcZwROVlkvPi09gICrmcsPZLi3buLlN5gbmhtTP9ERXfemNNvIL5JR
         pR3kt9P5oJ3qkeAAlYKODEQeJgkhPIBM2QZ8/Icu4zoc2lfTDzGnxf8Ws3dhyL2wy80Z
         gR2bYL0WX0SMwTe4RLUEi2cpoDdkdcm5HqzILe91IOPiwy71bihWg4G54vU4uJQeR5H/
         LUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755093294; x=1755698094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ey7XIorOzAd7x0egX+tKCQ6muW37hs4s2Deiul4Gcbk=;
        b=EXHy1+LurLXT9QNrH4o+Vahu9vkWgRs0FjrmVV85gVv9Th5Zyni4Fx69pqJGQombSN
         P0kkKn3PDMAo+PxW3BqKJIubOuvdZxlhw2gR+7UoIfvkbEQYkvg1NQfUkyak8OcAQDb4
         YfRPkoi5xdCqHXyQ027n1r6RhXHgN9j0aXSXsZXx7XQ3CfVHlOoHkRqIqxoNKon23aXc
         ekqMTnJvaazK4uVEM95emDCi7Q84BF2xs+0ROGrDqzQYZjbi0Ij62oAOlcetwuy6V8jg
         PqyGHGERoZ2FkRhJvBK40vn5TCzjLVSNu2QGswOGjR6KI9eUmBQOBC794vBNiHqHGoa0
         aMDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5WUZDxqGpaNA+VnZQEfLUnJU6J5i3apdyh/zE7ZF5Huk8ezvn5iPTd9J4arC9N3JxFOVRoL+RR8Wy0H+tSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqPo1qn4XohrdrBD8Pyaqx8GzSBJhBKL99gYrytJMG0HQuKgNj
	RAZLb6MLPRVKOlhTX2pZSF+y7APNCurTBog8aoPH2Nkm7G4et4Gw8Bo4FGwVLFxUXSvuKfhhuOd
	QmL/y7IiDtf3wY1vh3MjhomaR1G9yr02wUYHp9GNA
X-Gm-Gg: ASbGncsN0hsVEWhwOWAAouJHJIP+bvDiLlLFaKtQvGJZ2y8LyBl4xDFVLSn06i9qtpz
	iONCJW/e4dxYJyCH1ym/iHJth0Iqy0p+ugpIxWur8O0osiO84/9jm1iNGs8Zi3/gZMfYcS44ZUy
	0cZNPX2iqdRDhiTDEDUo1FssHjBuSYinl1bslXyLc6dOB91vw8Ui277HujH3WAXB6SxQ0HFhQlY
	1LpFwHoxPtYuPNVpuI3akiPQowT1K01KjGqfMIH1ohgu3zO
X-Google-Smtp-Source: AGHT+IGgiOq86zC6zEFb2YvDD1kPnLHYi085001r9Kc/KjWLAMpkwG/q07e6iXZKpfciPeZjcuE0yHOu4qwg2T1TXk8=
X-Received: by 2002:a05:6000:2886:b0:3b7:895c:1562 with SMTP id
 ffacd0b85a97d-3b917d24906mr2699615f8f.11.1755093294136; Wed, 13 Aug 2025
 06:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-rnull-up-v6-16-v4-0-ed801dd3ba5c@kernel.org>
 <20250812-rnull-up-v6-16-v4-11-ed801dd3ba5c@kernel.org> <mACGre8-fNXj9Z2EpuE3yez_o2T-TtqrdB6HB-VkO0cuvhXsqzECKWMhsz_c43NJUxpsnVpO_U0oLbaaNhXqRQ==@protonmail.internalid>
 <aJw-XWhDahVeejl3@google.com> <87cy8zfkw5.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87cy8zfkw5.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 13 Aug 2025 15:54:41 +0200
X-Gm-Features: Ac12FXzSZBsTRd_3bSBK5cyzmFJUVfD341LZBlJNzhlp5C2WXoRm6AnVbM1u8aY
Message-ID: <CAH5fLggraEP7bwzJ+4ww8-7Ku-Z+d0Em3=NDUpa7r8oTLQy81A@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] rnull: enable configuration via `configfs`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 3:47=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Tue, Aug 12, 2025 at 10:44:29AM +0200, Andreas Hindborg wrote:
> >> Allow rust null block devices to be configured and instantiated via
> >> `configfs`.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > Overall LGTM, but a few comments below:
> >
> >> diff --git a/drivers/block/rnull/configfs.rs b/drivers/block/rnull/con=
figfs.rs
> >> new file mode 100644
> >> index 000000000000..8d469c046a39
> >> --- /dev/null
> >> +++ b/drivers/block/rnull/configfs.rs
> >> @@ -0,0 +1,218 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +use super::{NullBlkDevice, THIS_MODULE};
> >> +use core::fmt::Write;
> >> +use kernel::{
> >> +    block::mq::gen_disk::{GenDisk, GenDiskBuilder},
> >> +    c_str,
> >> +    configfs::{self, AttributeOperations},
> >> +    configfs_attrs, new_mutex,
> >
> > It would be nice to add
> >
> >       pub use configfs_attrs;
> >
> > to the configfs module so that you can import the macro from the
> > configfs module instead of the root.
>
> OK, I'll do that.
>
> >
> >> +            try_pin_init!( DeviceConfig {
> >> +                data <- new_mutex!( DeviceConfigInner {
> >
> > Extra spaces in these macros.
>
> Thanks. I subconsciously like the space in that location, so when
> rustfmt is bailing, I get these things in my code.
>
> >> +        let power_op_str =3D core::str::from_utf8(page)?.trim();
> >> +
> >> +        let power_op =3D match power_op_str {
> >> +            "0" =3D> Ok(false),
> >> +            "1" =3D> Ok(true),
> >> +            _ =3D> Err(EINVAL),
> >> +        }?;
> >
> > We probably want kstrtobool here instead of manually parsing the
> > boolean.
>
> Yea, I was debating on this a bit. I did want to consolidate this code,
> but I don't particularly like ktostrbool. But I guess in the name of
> consistency across the kernel it is the right choice.
>
> I'll add it to next spin.

For your convenience, I already wrote a safe wrapper of kstrtobool for
an out-of-tree driver. You're welcome to copy-paste this:

fn kstrtobool(kstr: &CStr) -> Result<bool> {
    let mut res =3D false;
    to_result(unsafe {
kernel::bindings::kstrtobool(kstr.as_char_ptr(), &mut res) })?;
    Ok(res)
}

Alice
