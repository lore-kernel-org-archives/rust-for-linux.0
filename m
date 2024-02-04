Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B250422F02
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Feb 2024 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707064468; cv=none; b=kRWIivSaw8FTsnZFhaVoYqsyaiE6a41N2PuICGiC9ujHoSxPnGvIIATc2Tj7yhXHBmZZZ+7f6KiWxzeKhi6j/Nfl9q0j3xq9Z3sCAI12DZRufxAyha1OAUhqFjUpr/ptLgdvRkespv3JK6BKVehhv//uyqWnYOmlMU3WZJHyveM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707064468; c=relaxed/simple;
	bh=dEyJpjvR5RKHrQH9CQ3IKeg+m4JOaprD5HtDRfIUhwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGtDIe/I+BRcqQjepguBxEClEE76ZiHhz6gJ0jOdgF3BgiMZ2myK+dX349OAgdyrsvQpRylyXvD6b0OkXWk79fitYipatH+GtjXOF2YpBedDdm14Jg3gNx6l9NyxEmhO5l+8fFZSRrXpmx8q5pgaWCMc8/vFq8ZG7ebrYOcFtS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7M30wwG; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7M30wwG"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6040d0c9cf1so35251347b3.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Feb 2024 08:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707064465; x=1707669265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8XLxPsKBUVIBBZRXVx/XaQOvFb13ZjSRH6rSHORdbE=;
        b=T7M30wwGH3p/JbMh5sdtlozunSVEF6uhTETcjfOY/2P7J8DZ8kXlgTfkHSBzqDokN6
         AUn+Gt/2qH4X6LUi9RJ20n+LUrlhbNzWs3KUGxSpEnN/vL1zChGiMvxm/DoBDTjDuJEh
         IHi7XponXrqT4POWsReZhbD+LjK/pgumtUxgwLmO1XWg2MWB2mmWt+OhmKK8EHZPirpO
         q7i/TtyoEZIN4s40TVShxzav0FYF/wSrNuVv9szlpDrvUzs9XOU5sz5zCgP8uVZxNi5G
         eWmbmJHzxOaR2TP/iFTYqKyd7z15E00B7Rzh8OhEul2xGDDypLRJSVtoLIiuGNXssA+h
         Reuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707064465; x=1707669265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8XLxPsKBUVIBBZRXVx/XaQOvFb13ZjSRH6rSHORdbE=;
        b=YZSLO06HCTUc7HmnxLU1nKNanplP95VSZrKVEXgKnNXYJDJ+GCeJKVfCE6Lg3eqDRK
         zWs/TPFlWL1E+ksOkYIU8dRrU6IJgqBAQ4uRvugqdjoNSA+b4cxKVW5+teMfBYggf7p9
         pUBEe0pCaVfZL+M01JnJlO22ot+hkVn0naNYm+sOlfF0t8dAQ3Md9E4fyHvMBTxisZc1
         kkL/bfNgwO+PEBF5XGbyeOiJlN9PgDt/PH1KpkK7+foKB5UUJMMcD2HBgn7x/kYW/BrN
         uYtUuA9FhO3Na9i5Y7PTLCPk2BDqv4Q1lUfF7HKRqSiJX0Zz8hEsJD0rwez9nj9XpOsz
         oPzA==
X-Gm-Message-State: AOJu0Yx0IweVRG7RIAchVsRfqx3+Z0fQdH8tp29svRATxYZ2OFvYyNZ1
	IEeF130lfq5NV5vmknP3i2/lwWmURCv4bWP7a87B73WtqMZOzDxRwyByaSyUcUli1wGCkKb2ZmF
	nMfZZ+TV68t85ahVTxfZaOU9Ae24=
X-Google-Smtp-Source: AGHT+IHRgEBWHV9JSqj+CMDIMFQNiGDpQu+hS2gVRH8RDAFjpZkF5zNSvcROJmu9wm0aHSFBlopS9o+uO5+qrezwmJ4=
X-Received: by 2002:a81:9c52:0:b0:5ff:4bf7:c481 with SMTP id
 n18-20020a819c52000000b005ff4bf7c481mr14120931ywa.16.1707064465523; Sun, 04
 Feb 2024 08:34:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240204101049.41101-1-linux@obei.io> <0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com>
 <0100018d7399881d-9945af06-7e0c-4f80-be5d-e4e7a614de28-000000@email.amazonses.com>
In-Reply-To: <0100018d7399881d-9945af06-7e0c-4f80-be5d-e4e7a614de28-000000@email.amazonses.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Feb 2024 17:34:14 +0100
Message-ID: <CANiq72nDnWDS16dxAUaqYc0LRGN5R5Pk2ZWefsoJ90j9p-CLag@mail.gmail.com>
Subject: Re: [PATCH v6] rust: types: Add `try_from_foreign()` method
To: Obei Sideg <linux@obei.io>
Cc: "a.hindborg@samsung.com" <a.hindborg@samsung.com>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, "benno.lossin@proton.me" <benno.lossin@proton.me>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"gary@garyguo.net" <gary@garyguo.net>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "wedsonaf@gmail.com" <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 4, 2024 at 11:11=E2=80=AFAM Obei Sideg <linux@obei.io> wrote:
>
> It's version 6.

It cannot be, since you sent v6 already:

    https://lore.kernel.org/rust-for-linux/0100018d53f737f8-80c1fe97-0019-4=
0d7-ab69-b1b192785cd7-000000@email.amazonses.com/

I guess you mean that the diff (i.e. the code changes) did not change,
but please note that even if you only change the commit message/title,
you should increase the version number, because it is still a change
that will end up in the repository.

Having said that, if the changes are trivial (e.g. a typo fix), it is
probably not worth it to send another version -- it is all about a
balance. You can also simply point the issue as a reply and the
maintainer can fix them for you if it happens to be the version that
gets picked up.

In addition, some mistakes can be prevented before submitting the
patch -- please use `scripts/checkpatch.pl --codespell` on your
patches to e.g. prevent typos.

Thanks!

Cheers,
Miguel
