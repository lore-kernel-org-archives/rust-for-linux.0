Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340CA36896D
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Sep 2026 18:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101834; cv=pass; b=aOIbNjowNJvEMAaECeMnHdsNZlIztrr64WRBFpORF3nGV2lzjFnyzCofyS9K+vvOWknwQPIeh4lwESvpYjMyyuXn+U3g+/sRXWkBIkxmzxSNRWYjzD/DBzD5VdDPTygDWJ+nGqQ5fx1POINSAFJ+sKDsxGfz2xQazfLKQ+9E60o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101834; c=relaxed/simple;
	bh=kblI8jvzuw+DdDqY67GusYDiVjYY1AFEjqn2PvfijFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ny2w7TKU7fE7RBPZLb08gR9m6D64ga3+mXll9hM+Oil0MswQkfVph6lg4s/T68lq8FodH6B5ypXDieTm+Mscjqu+8YnLJtJ21dv6/60KdF4CC/K1NJlq24S//LOh5NsIPceRcg83N4Cvw3dI0r4ALcURem7+Eu2wi3iFm/LcLws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7Y0Qsbg; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7Y0Qsbg"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c13f2685f2so137737b6e.1
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Sep 2026 11:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790101832; cv=none;
        d=google.com; s=arc-20260327;
        b=G1MejmTZjZup+16a3KzAQ1l5NrFDG9exRMqxfK+UIhVlgWni9p0BwboWPguu4XFtb5
         ts6FjBj8sOn9zDrroyBgOiSea9vFTN0EBfR/GSad6aN06fsQW4aw185EBh+cPygZeKaW
         ZhtMUkQd0yW9jLZbd7ERq+t7ZEL1PPzZfBnA7I4ERB8gCZVAyQzdNRKHdVqYWXnSdJPn
         k5cWGoVOSp4+M0oc6VqHIDwfUe0/Yo+gDYQmYNiEsnJ+rtQBbwyifHXMS2Z56t1/1acU
         H7p1vSiw+JMBerzGr35W6W9SvPJJQ6zZUBsgSu/Qn5fyRIzCykNju9aKyVoTVJQoKZKt
         gdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kblI8jvzuw+DdDqY67GusYDiVjYY1AFEjqn2PvfijFA=;
        fh=yHf4EePBKPgbcsXNPR4hYAv0jn4I4AsizRvrtaHWHVg=;
        b=If/FFdQf2tjHFMUIbA8rQ1KKE8tlkBokvOqeaZ4fT7jiQ2smmBx3E0P+/YS02/HGGD
         A+wvIWy5GA/BkHL7ocjm/BR4P2vkpJXwql+hFaNsmxH+bqgG1ABrmslh2jIq4j4L25YT
         J2D2eQNRPJvlggIt0j6tXB1hN5gpStt26bKY4OxzznG876FAzR1wYpmYGGfJzp8KDBx/
         vqQFk0IUY8cDKgK+uBV+YIHLy7yEMJU8IuDU/HEjji0+F7TsbPuz4WXX7ZWEpu1+5u2H
         COCfwGJkPppPglV+/VtFffNmxw8ItZwBFsJgah5ec8Rbcw24bbLgG0bUesnUx2ot3lwd
         IF0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790101832; x=1790706632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kblI8jvzuw+DdDqY67GusYDiVjYY1AFEjqn2PvfijFA=;
        b=l7Y0QsbgxSeX7YI6DdTjrF7Aev0Ksef8ZwY7Fk8NlV/FSRo0NwRxp23nQgMb4hK3Uo
         jfotH+1SG2sZ7D3wgzjgc7LzsXUa8YPojVdU4AvSkYmugHSKtiuO9J8F/UmkCzPkxk5J
         qAFrTyN3+AjbroiQSKgCC71lkrk7L/iIoQ671k8UIxLFBZVgiBhi8iSBRImAXI97XuzK
         FlWiy1xkzoHGC43+ARG2B98dJb8jNrSPefW7R1mAdj1ej5TUz2pfeK4BSUfxMO2gqJL4
         lkiYlkLUS/3niQMv2RMd1KkyhvYJfOCOQwkAzDYfZnrVp0Hg8jc9z/LHorUSNPAvIQv3
         RArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101832; x=1790706632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kblI8jvzuw+DdDqY67GusYDiVjYY1AFEjqn2PvfijFA=;
        b=T0sJaJ0qViDmY/LLcQfbT3j2oKcf4k8qhLVgRub6WUPFxevnTYcCm/W9kIc3b1Hgvv
         Y1jyI7zzsN8rNRgp+hKnSCP+48hNg3LQMtu3G6/CdPUM8IoiQCh3oOtyx1pJvixc4+Ci
         T1sewX+nEwYHX87o/KivIzOo55f1m2wyFZWvksJl3zz9aRQs5xB7d5dUQGWKxXcGKnAW
         tPE1l1mKoAVd/nrUdoQwjTbi0yNzaWFq33bG7J7YTTMdhnTu4iq/y3Z3rvvDIEz9Oska
         Ygbxl1hKQzpWO5cV5nYj5EkzI7zCUqKFHb2iAhfsgjaGdJWTTDzkcqqOwBO/Cr70EL9k
         13vg==
X-Forwarded-Encrypted: i=1; AKwUvBzgRplElGAyz22FV6OlDbFjLElsZK+lAisOcPRl+F4wYDorUkQcjGKpibibSbv7jMtd2HD0KnhZ2AWK/3eS6g==@vger.kernel.org
X-Gm-Message-State: AFuF++kbxfA8UqCWvX9bRBLn7kewlGPTAgtDEo9Q91jDMhdv5b5zOWxx
	6WBlLp4UJgYRnv8URovLnWDRcXi3p5IITQjCU9Kc3X6dUnXD65gysVBvCTZDPSd4fJkmcO0sYyG
	8Zc318l1Hb+ZJ+NSdbNQ+A8ELWyU4lkk=
X-Gm-Gg: AYBFou3j2gswtUfN3dgd+nXpxVonidtJNAhSKf1LffHKpIigAGcUj8cXlIU8VqJklzj
	CMznE9QizC8hIGeBV2nSWr8Pz1+Ud1oknDp3D9Fe8ruqcKH3wmCvTde6pMYHJIFmV03WcVOXSnt
	4xhYb30LFTK2FAlQIP4RbxvomDGc1IhYoNLbZ1GYaPpe2KSv76/asuW//iqbYGcBm2zUGsT/Zvm
	na51PJ4AIlO0tXdtPgnpCZOgCVlRSycLd5t++lvNpCUYZX5jQz4Qr05GN06iQY0h/f4vwkFF11Z
	8w2PT1vyu7OR8JX+86At3wZWKmSiBDelCkYmSaIfg9HFM0kbuyjdFRTGuhw6Anf4x6t6oqvge5y
	V5/fWSyaT+hZjIEH0NmV8LMX8
X-Received: by 2002:a05:6808:1247:b0:486:8a11:6e8b with SMTP id
 5614622812f47-4d5b7508c71mr243620b6e.2.1790101831981; Tue, 22 Sep 2026
 11:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920200154.1194983-1-georgeandrout13@gmail.com> <DLKFTVSN56P2.2NHCFW6NIUOAH@garyguo.net>
In-Reply-To: <DLKFTVSN56P2.2NHCFW6NIUOAH@garyguo.net>
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Date: Tue, 22 Sep 2026 14:30:21 -0400
X-Gm-Features: AcwNN1WCk-bP1a41pSc70f2QVB_IR4W1RwREP0VVcFOJquCvEG0378Po8h1cQFo
Message-ID: <CAESH5oeuKoDyr6ZcGR3Fa+_nPn+ceg9PbqBXoXjRsstaSKtJtw@mail.gmail.com>
Subject: Re: [PATCH] rust: file: handle fd table teardown in file descriptor APIs
To: Gary Guo <gary@garyguo.net>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Jan Kara <jack@suse.cz>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 4:48=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
> I think we want to add `unlikely()` on them (which is being added by
> https://lore.kernel.org/rust-for-linux/20260406095820.465994-2-ojeda@kern=
el.org/).

I checked current `linux-next` and `rust-next`, but this does not seem to
have landed yet. Should I leave these as regular checks for now and add a
`TODO:` to use `unlikely()` once it is available?

> I wonder if we should upgrade this to `WARN_ONCE`. As code being executed=
 when
> exiting are cleanup code, for this code path to be hit, it would mean tha=
t some
> code is installing FD descriptor while being dropped -- which is likely a=
 bug.
>
> Putting a "BTW, some Rust code is installing a FD when process is exiting=
" in
> dmesg is not going to be useful to understand what's going on. We'd want =
a full
> backtrace.

`WARN_ONCE` does not seem to be available on the Rust side yet either.
`warn_on!()` is available on the current base and would give us the
backtrace. Would you prefer using that here for now?

> I think we can remove this warning. Skipping put_unused_fd isn't actually
> leaking anything as the files_struct is cleaned up.

Agreed. I'll treat dropping the reservation after fd table teardown as
normal cleanup, skip `put_unused_fd()`, and document that this can happen.

Best,
George
