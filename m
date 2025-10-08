Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D812853F3
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759932321; cv=none; b=hxatzV/asV1G59/jt5AJWyOmyHmbbpFx0PFlNyGx0t87VSKZSEpVmEXBvE3a/Z9vn1hB1cqM3mjjW54K8gWzH07+s9hF0FJdtiLwc2tSmeErDMjhYSevdaxSmfYbF3BlL4ebAyLpTeUwITMIRWJjiNBkWKEgD61ESnAZpPH26Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759932321; c=relaxed/simple;
	bh=F6IH1UUuRkcLE+CnqnTRKITctuOhDmCi+4zdK2zYidU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TZQ+ZNbCfiheeFihxMYcyV4xsyXtmBB8u2EvnzugppRIxCNxX+MdEDuh+BhJdCTTNox+RqtYNsbBDEn0kf2WBtmqqRsLe6QhOVEllNl8IvgWrNxA7OWeiRM5QCC0qMlK30To8n64rb5vFukhBVZ2qsubfrgcdPaYneKEcCr9cNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AoRYueJ4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AoRYueJ4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4060b4b1200so6526009f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759932318; x=1760537118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnFNM1hwuEwchUfhEuJaKySc2Ut3Y6Tp66F6XTEbLGo=;
        b=AoRYueJ48bVEgyGD/n88L6PvDQPhPAgKdqeMBxQFhW1vqdui2yif0lOOKRxdSYwZEY
         Gh2un4XkJPfhauj/qoPcgUS2bz9n6foRhy1VG0JDDlL1Kqg08MCcCqjXinoH/M/EdvPb
         KJvaufESPITN6mbI0M8rm9QkVtLtbX+GjAfqdgMQUG/ygBA3vlZCiXrYqWPP4IIr1ikS
         7ptZOAV1q/yD/7VAgfbDLwte6aUtudgbCe/wofqDzxsdWRdAC9hQ/EBi95TZGlaTqtBq
         STNzGfr1ZmgkUE/p+dNeMWq65JWEVDV6To95sAKmI9h4NtsBukkqDMK8YU6UopT5hGye
         8XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759932318; x=1760537118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnFNM1hwuEwchUfhEuJaKySc2Ut3Y6Tp66F6XTEbLGo=;
        b=v7ncK9tZyRFs3EgDe5zN01kS9VS3GxYFny3UjMtsX3IKHDs5dRYMJ5io0ixcoYPvBp
         wZZkL+5rsGPJyWoh2pjHqJ+Pw/3km7dXaYZ5zm/oP/VgvKW9vP49zfzpInMdMQ/v+h3T
         /nFOEKoR/7f1N7zgzVgJ2eM8VKNRAOJSlJPE55JjvO8EzwBkVmS3US6JgKPuVhT8SKlk
         rzBUmk6nfwyBAgfXeu1RXP8wJuVxML89iu1KILcHXCUjenOGWrmxw5xndU0O1LpxhyRL
         tFZ5t6xoJJcC1i/EX7sMnH9YZ9lyO/RkcI19kIwB9cQaWFGJ+6B4izTAylivvnNaBmrS
         8hxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQscXpERs3+4mQFj1MzWBB5I8MT91a7Lsba/UDMKxVG1UcIweS0G44N9SlXUOtb/x30hkYFpBoVs/4xAVOlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz34uVZDjJFiPFE2+BiT/lblmyrKCNvWpZXiHbTEggfm/KsFCCo
	XPrPNGkGy+tlPXMsAi4RDEJqFjtaAuGT9WVYNUE6c6pLk9bxb3a0cf3UOY2+q1HMtmIHQ9M/ckw
	I1yP/5kVZTRrqlqkvlV/9tTULPnP2fsEQ/QYGi+AwmC3EKnTv2VG5PgNz
X-Gm-Gg: ASbGncsf5+0Qx6HbfV2Aaf/K4C/t0cnpFQfo0bkfu+K1HzS4oqQQfFFAWY2E9A+jOsI
	I0rGRtn/xV3WVCUkThNizFsxmi4y61XoMz5dpoxWXqNrEY5buKsRJvYa2C+qKxaIwqkz3bI0+0s
	tmMv1xot653dvabCXmLyvaR+L2KrIr7UaICS1hyH9yn4ODizVV4WOAkHT4wi8FV/1MV1lC3RIhc
	SyAbeFuAz1cKa0AXwIJ91oXzvW4LtDAXCpFr7aEFW9gWRkPQ/Gxy73KjTGSyeVAWmk=
X-Google-Smtp-Source: AGHT+IEtL1VUjwteFF0aUMusK9O6vaSfUkvwFkxXShRQV/K9msyLkRj+XdqkEBNkBGqLRAXp1DSu3/HCWH6QZ7gPJbw=
X-Received: by 2002:a05:6000:2c0d:b0:3ec:df2b:14e2 with SMTP id
 ffacd0b85a97d-4267260e143mr2316476f8f.51.1759932317676; Wed, 08 Oct 2025
 07:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008124619.3160-1-work@onurozkan.dev> <20251008124619.3160-3-work@onurozkan.dev>
 <aOZhS9nTDnH3Zh7N@google.com> <aOZpwUD50MwSBycB@casper.infradead.org>
In-Reply-To: <aOZpwUD50MwSBycB@casper.infradead.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Oct 2025 16:05:05 +0200
X-Gm-Features: AS18NWCZJ-_06NHTt-9pvac60ma3Z_7vD0cIto5b6ZZ5rLx2-etkF4_odDy_JZs
Message-ID: <CAH5fLghoDEKnpq6WaD3zzV9UHm6gYzYXCOG_Q=pOUomcNcQhPg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rust: xarray: abstract `xa_alloc`
To: Matthew Wilcox <willy@infradead.org>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 8, 2025 at 3:40=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Wed, Oct 08, 2025 at 01:04:11PM +0000, Alice Ryhl wrote:
> > > +        limit: Range<u32>,
> >
> > The Range type is inclusive/exclusive but xa_limit is
> > inclusive/inclusive. They should match to avoid confusion.
>
> ... and xa_limit is inclusive at the top end to be sure that we can
> actually allocate 2^32-1.  Or does Range handle that by using 0 to mean
> that 2^32-1 is allowed?

Rust has multiple range types for inclusive and exclusive cases. The
Range type is usually used for indexing arrays where the length fits
in the integer type. To include 2^32-1, you have to use RangeInclusive
instead of Range. It should be possible to write code that handles all
of the range types without repetition.

Alice
