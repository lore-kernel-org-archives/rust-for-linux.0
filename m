Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AED2DA75B
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776785929; cv=pass; b=M8tO7O7Hz2ArcQr35viQGDsPqQS+Ij5fCVNObbLn4Z0ocZJnl28OQLwvhHr9rUiOSpvSaUuCb/YacEf46Dk1rUTzxQGgzXlrUezJS78NfvkSWCIq871RHXqCfZSzIWFLPh24E6ZylcN94CTD782QpMSHG1CqxQug8tcvN1uRAJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776785929; c=relaxed/simple;
	bh=ooor8Wg66l2hU5nd+/rDDWKrttHSiPMUgBX/qDNQA7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EEDo2FkSNWwlDdY4bf3XfoWpu1TVt0TB2jSKHqVXzOKX1Jj/Y2quT/NNyHU4uXhCDD4EivcVDdPqGGKPT0oTm/UzhztNyZA7FM2lAH/vpQEUdWMqrVy01u26CCNXXuzZShIRWf7wdPfAM34M8wwlGELUc/IG1HFKNAUi1GEq7Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rduJ45aY; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rduJ45aY"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a01c80c34so40799611fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 08:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776785926; cv=none;
        d=google.com; s=arc-20240605;
        b=E7FNIAc1nmh49mGAbn6zDVciepow7C9vBDb9YkqtzA7QLS2ZTa0eAa787v4YvjQjjb
         lJy/E2c7pSYWqTcy+FfQlYnRfY8JkvLpKRxXzlpWNT9J+wxDq1JpJ0bBBg91OVWj3KAx
         6CXJ+/5y4G7hUnv4t4irw5FNH2aZN/rj67u7BxmukJm8mZLSBf+l+oEuc3oLxJl1GcAZ
         57J4nyF1jr1bHbCugb+Y829HfRhHzBbfxlyi2KvlabdsaCQ/91djG1R25u5rIwYUKUwq
         c7XvbOuDxM5uui2y0VChAvauzoKWh5WdULeESEzNge2W6mTrh3sii4MRo3dXknyAu5+N
         Qf3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zl+Yk4rwSV3pc+0hAmsNIGhBC2b4D9FzfdQUh1cAks0=;
        fh=6kRwJEzKKViUrT5vKnslcCP3Y5Hj+zty1kLCfkbBQyk=;
        b=NCh/bmJ8ciTD9kagl7RgSv8tgec0H5tH1dot0OJ5sH+hMingMpG4rVUDIcwlDOyEL3
         ge4aFlGZn/cvQPI6cJpswktq0RyTspcfUkZJT/+nwzEA7uivtXWbhHTvyHYOqLgKmGxe
         BarxIPMhmokzjuYE3GYBHnck0YwVDM7CUoC+MaQwaWk1AfTEkX8tEg4IjbVhZI8PdtCO
         4XTXT83lejownCoxGbyFh/DG3sz/xJM42ES63Ew6/CIWNpG6YAbSRmHzDb8YgX6jg9Bs
         M0634C8KzNQJnuYiZkMsjdLva3inR1s3ppxCCz2ECG3RJcMjXBh7Gr8ESvWMezUQcbEM
         Lx1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776785926; x=1777390726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zl+Yk4rwSV3pc+0hAmsNIGhBC2b4D9FzfdQUh1cAks0=;
        b=rduJ45aYkLnpCh5MGpw/JrF8+lQoCU0CMgDNe0TIJA5GJZqFI2e3CyIA/gZkC9/A3q
         r1WifP4Cl+7qAhUL7wga5pNIBZJvPM6YyPIgggtsluAYR8DHNo0uulQ3Sb+ehD5bqhrG
         4SB8FHY/jEvu7ZCA5hN/kpYdArRNR0/xTcYeTRN4BfWHGXt4zGd269hOkcYQ5oAhCJEL
         IkQxK3D50WYaPjtlb8J9wQlsI14kCoCYzSN4La+WWd4bd/tj6ocnxK5Cqp534/bwqDuU
         B31AEm2ncAnt9t9Hmwyk9pKH0MQnudbrXFkZeP7F+5r3MST4fhKPV2oufQQKB83cz+5v
         Gfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776785926; x=1777390726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zl+Yk4rwSV3pc+0hAmsNIGhBC2b4D9FzfdQUh1cAks0=;
        b=LW00z0xYZ4X2umnc4T35YLHxORl5vJjEf/2qgBUbJRdQuwwVyHoCxJdSd2ytX6QDJ5
         5cruv8Tuy3a+86g8cpCvhSTij+LvYIHakMFWpELe0aGEMQfP4p2U3Wp4ZuQd9F9QIoKd
         JaJi+t6FJaPHsEsrMy51zMj3lV789d9HvaGlySpInMOn3jmHC1m/2l1Tu8uaqudA7Jwx
         NLF/FNIhe2UifI0FaChB35cy+lSBTVYJEGqHXCiqi4TqQKH3SRVrT+e6aSiDa9RlL2dl
         mfy/wwXeoiTj1//jpRQijW76RdDIQvSwW2Mk61H/SoOejPpkjXhUSEsJswxXj7d0WDYW
         U7TA==
X-Forwarded-Encrypted: i=1; AFNElJ+RE/QprGn/ZwI+I3VedmGJCZOuHVsuI4JQPWT8YPQNrIu2BITYjs9qPI8WnHDrxTxX5HUTpH9e1qKGTeaQXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJF8lElGo9C3U/vCtZzFdr1ofui0CppaFcO54grDkUzBbxXRLz
	IN50MVsJaZkSxcnEeSwMvh96QeoTPll69PogBVk0Em1qn9own1UPvdHxyrL9mpTj4lKH+jvw98+
	mm5InNYSeNrRePYUJw1TfVgRV8haru+oCLwzM
X-Gm-Gg: AeBDietbTYQhAn3VzQw6hNg9XMj906DxwxdB0QkNsZnZzj9lGWERqY7ru5uyB4x58xg
	DoggMikIIKZXPbEHqO5WPMkWmG6fsqlHI2ADdoo9ShqGt14BG2rKwgaB4n6osiwhmHMFNF00LnB
	4k5aALB9N22nvKL2MHROO56fG3rMdC1A/kuSGL6iIgrxPxLoDe0q0vz7jW7aIOd2XBrtQC79hHO
	c/NlZHyfUZLIdzrsWbSL4qWsv0DQFdKsgVYnrVZabh/vwVvocS2p14XEZJXJPDMcxnCDnqxpkoN
	K8jVOuHMYXXY3N9PFEiQnLC5QYppSXiKftFhX1vBi/ksrGUFvz2uKrox8xkaVTM=
X-Received: by 2002:a2e:bc09:0:b0:38f:20cc:2bb9 with SMTP id
 38308e7fff4ca-38f20cc37femr33563371fa.5.1776785925908; Tue, 21 Apr 2026
 08:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419151327.26306-1-muchamadcoirulanwar@gmail.com>
 <20260420193320.22df4979@jic23-huawei> <CANiq72kKkRW7vwYKi38dvsM4HCtKGwzOF4ujMS-X=peGb_Vi3Q@mail.gmail.com>
In-Reply-To: <CANiq72kKkRW7vwYKi38dvsM4HCtKGwzOF4ujMS-X=peGb_Vi3Q@mail.gmail.com>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Tue, 21 Apr 2026 22:38:33 +0700
X-Gm-Features: AQROBzAPh-8rV-iHNyCsJxELuNXQ_YFaVo5DxQrC5oJPsOWT4R6e3VhgIFh8Fkg
Message-ID: <CAO26r3TqeLOF0mEgrsZszNU2TnGv6++OtSzEWtcSgXj-OvpTfQ@mail.gmail.com>
Subject: Re: [RFC PATCH] [RFC PATCH] iio: position: rust: add initial AS5600 driver
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Miguel Ojeda <ojeda@kernel.org>, 
	Frank Zago <frank@zago.net>, linux-iio@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan, Miguel,

Thank you both for taking the time to review this early RFC. I truly
appreciate the architectural pointers and the lessons on kernel driver
culture. It has been incredibly helpful.

On Mon, 20 Apr 2026 16:49:00 +0200 Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Mon, 20 Apr 2026 01:33:00 +0100 Jonathan Cameron <jic23@kernel.org> wr=
ote:
> >
> > Do we have a rust equivalent of BIT()?  That tends to be easier to comp=
are with
> > datasheets that don't use hex for this.
>
> We do! Please see:
>
>   https://rust.docs.kernel.org/kernel/bits/

Thanks for the pointer, Miguel. I will update the constants to use
`kernel::bits` in the next iteration so they map cleanly to the
datasheet.

On Mon, 20 Apr 2026 01:33:00 +0100 Jonathan Cameron <jic23@kernel.org> wrot=
e:
> Have those been posted anywhere? Or are you working on them?
> I've kind of been wondering if anyone was interested in rust bindings
> for IIO drivers (and dreaming of having the time to write them), so
> this suggests that you are at least.
>
> In the mean time this stub of a driver isn't particularly interesting
> to review.  My concern is the common one on whether we will have enough
> folk familiar with both rust and IIO to review drivers.

To my knowledge, there are no official Rust IIO abstractions posted
yet. I initially planned to wait for them, but seeing the interest, I
will take the initiative to draft a minimal safe wrapper for `iio_dev`
and `iio_info`.

For v2, my goal is to implement just enough of the abstraction to
support the `read_raw` callback, allowing the AS5600 driver to
properly expose `in_angl_raw` and `in_angl_scale`. I will submit the
IIO abstractions as the first patch in the v2 series so the core
design can be reviewed independently.

> Push testing logs into a cover letter or under the --- so there is no
> chance we end up with them in the git log where they are too verbose.

Noted. All verbose testing logs will be moved below the `---` line or
into a cover letter in v2 to keep the commit history clean.

> ENODEV seems a bit too much of an indication the device is missing rather=
 than
> the magnet.  From my vague understanding of how these are used, the
> magnet may not always be present so perhaps failing on this at probe is t=
oo strong?
> If it does make sense to fail, then fail on the strong / weak as well if
> that means the outputs are useless.

This is a great architectural point. I missed the perspective that the
physical magnet is an external factor, whereas the I2C chip is the
actual device being probed. I will remove the `-ENODEV` abort from
`probe()`. The driver will initialize successfully as long as the I2C
communication is verified. The AGC status and magnet validation will
be deferred to the `read_raw` callback instead.

> Too noisy. dev_dbg!() at most even when doing development (assuming that =
exists
> - this is only the second bit of rust I've ever reviewed ;)
>
> Definitely not, even in an RFC patch. These sorts of things can end up
> making it all the way to the upstream driver so dev_dbg!() only.

Understood. I will downgrade the `dev_info!` calls to `dev_dbg!` and
entirely drop the noise inside the `unbind` function.

Thanks again for the guidance. I will start working on the IIO
wrappers and the v2 patch series.

Best regards,
Muchamad Coirul Anwar

Pada Sel, 21 Apr 2026 pukul 16.49 Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> menulis:
>
> On Mon, Apr 20, 2026 at 8:33=E2=80=AFPM Jonathan Cameron <jic23@kernel.or=
g> wrote:
> >
> > Do we have a rust equivalent of BIT()?  That tends to be easier to comp=
are with
> > datasheets that don't use hex for this.
>
> We do! Please see:
>
>   https://rust.docs.kernel.org/kernel/bits/
>
> Cheers,
> Miguel
