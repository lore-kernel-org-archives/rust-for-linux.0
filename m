Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D064420FAA2
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 09:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737538885; cv=none; b=GwT7g7mIEInpSQlowXM290e8Bfr3BIHMDniz4/DnRVD7xO1eHEPGjsMOrPcu/a1+LhP2iBgvPgdA8GzHsJ+uy6p1xNs2jOfN3L93AOLqYy+yoZtNjjv3A2+kFjeTbY//Oh3Q5NQDsaDu4qGtzf7YzeYcVQ1WYFh2DqeVboPEm28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737538885; c=relaxed/simple;
	bh=nOinp4enbjvBdkLomJeUdXpEITSxhW2oqbrDBlixIrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kLdNwpT3WT/OR+VAe7uqO2ftXk9FdJskFFwDrmcBYDI2CieExKaNjn1qq+97ms/NUs+9cMeZAeHie/U8vqsqLNn/mV0zB9VIcim26DC6jpzpPQ+T7Lyb/xKNyvBqn/0TmJrIIqmWu/loQA4cVpGULENgTJEQTntp32caKCCaxOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrBr90+d; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrBr90+d"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2161d4b820bso11987915ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 01:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737538883; x=1738143683; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNv2Sj0lQnrSuScUtebhpjxMi+BynbZgNUKnbjw1tAE=;
        b=GrBr90+doQ6/P0aFJYy4p5vQ/U4SQvrrCgGbok9pF5CJqpiaLsWVmma6Qdmq3PK2YH
         eskOrMMFusxu4Jd8f0lXP0g2s9B/EX8+9wUie1E7XrL1hQg+MtjHNz98Vu1QmRCT18Uu
         R1gSxrtRr/GUSAgloxvMnHbPJTuZfhgMvVyabEgNTriiI5VlaPjSWJ70VZDzTy0Z0pOP
         qloLFLLPW681ZbKYIaBEIUQecbwzU/Dxa6bd1tRVGONl2hVEKEIL8kGn5RnB2Swdp42D
         0gNDQYJ+eLAKDiuNJP+s51exl0pkR+9Hn2GoYaHaK4O9kNyPqpju6e0RJbQPnD/9IWLD
         Cs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737538883; x=1738143683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNv2Sj0lQnrSuScUtebhpjxMi+BynbZgNUKnbjw1tAE=;
        b=CoVfCemol0oduI78xA6ay1UKPlsYiNor8DtPo9FK5Ce/BkaVL7t3/jSbXNf9xfxtXh
         VcPsz0xkKlhsz3Ddyc/vmTxKQhmXNuoAdnYMsO44pDBR5N5O0yeysQ4IL2q57M8/rzy9
         Jk6tD3/gfW0WRkYZIO9VuI0Sjm6IXxBmgAcODCj6IzMc0K6Tsxdazqv43NbUbUQoHugt
         QDC0DpDlVATNpnNBuacUEBXnvlakM51rVnjeDy8rDg5slW4jlrQGREymu6EqsRjQ+qkV
         3IMyujwLioKdY4AF8t4oj1ejz/qpsQfCqLOfdMJPWMZd6RIK1kgyJdOr9f37lhhZvxYw
         6pKA==
X-Gm-Message-State: AOJu0YwkY/kK3nMbn7SR2XPSdCGuIUZ40yGj9wbK+qJVbYQ2AHp7OCe4
	vqjYCCFTCP+BPxXTjokbtCoDRTPHXDD1abtKtQ/lP9wKZk6fc+JNfbqLY0jfMTIiXNsuBScA2gc
	ZNPGOUcn/tIpZQx8LBAz8bVUSYpw=
X-Gm-Gg: ASbGncvAlO29CQCsKU1jnqFRIa3ffgJ8NbO5xcjDVZgGreLYgfxQYfqvMp9f2Cbi8Ep
	5UTkSfWqgB8WntrTS8SFc4hsuZ22UQBUinJ+WWgTsw0CqoUKwnOA=
X-Google-Smtp-Source: AGHT+IEMLJiXPInoepERngJZF3wm9f0KHA76EKVXo9yD1isZQB7fMHiNEP7tzPfxVtAx9ZZ0upGTGwZcwMzvnXlf5Og=
X-Received: by 2002:a17:903:22cd:b0:215:435d:b41a with SMTP id
 d9443c01a7336-21c3553920emr111680335ad.1.1737538883089; Wed, 22 Jan 2025
 01:41:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122055347.597798-1-dirk.behme@de.bosch.com>
In-Reply-To: <20250122055347.597798-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Jan 2025 10:41:10 +0100
X-Gm-Features: AbW1kvYcXKGrjLonPzYcdB6M6xAP6IK42HyaIyRcSaPAftOrkU17IxgbHhV_6DI
Message-ID: <CANiq72=o1ouGc4ScvDkz_uMnEfM+D47YQTMh0jTC=Go4tvQvkg@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: types: extend `Opaque` documentation
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, aliceryhl@google.com, 
	daniel.almeida@collabora.com, gary@garyguo.net, boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 6:54=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> This is marked as RFC as it mainly takes some statements from
> the linked discussion. Let us take this as a starting point
> to discuss how we want to extend the `Opaque` documentation.

Thanks Dirk for this sort of patch -- I think it is important to lift
some comments from the mailing list and distill them into
documentation as time permits, so thanks.

The docs already list the requirements that `Opaque` lifts. What we
could do, perhaps, is expand each bullet point on that list to mention
e.g. how that is done and link to the relevant docs.

To try to explain what I mean, for instance, in the bullet point:

    * The value is allowed to be uninitialized (for example have
invalid bit patterns: `3` for a [`bool`]).

perhaps we could add some of what you wrote here, or simply mention
and link to `MaybeUninit`'s relevant docs on it.

The destruction part of the paragraph could also be there in that
bullet point as another paragraph, or could be kept at the end of the
docs as a separate note to highlight it a bit more, e.g.

    Note that the destructor of [`Opaque<T>`] does _not_ run the destructor
    of `T`, as `T` may be uninitialized, as described above.

Cheers,
Miguel
