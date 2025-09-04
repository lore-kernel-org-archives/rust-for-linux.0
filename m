Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2782C21DB
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Sep 2025 21:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757023037; cv=none; b=alUpUtzx/+mywbFISi+zl04qqxCOjqQNotoSW1bDiHvj+m0kE9BjOd+G+Gu5pMAi5CWlTBOVlBcrW5Ps40BWLY5t+6AqNcRe6xcY8ztddrQ9NK5a0J3na8Zf5/3UKsIRpndCN4EkkHAcOiG8ya7xubVvH2+2YXQHiGn6lIvh11Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757023037; c=relaxed/simple;
	bh=mYPBA9fFtQcaQ5vcpRI0N2FCMIP+h5NUbhtm6CBMWOk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrIR8aWPtCkO2miosLzwMRbYTAIcfp3YPPNRsd3FzlbDGVu8fol0ML/Q6nY92aFkSxOnSVakD/ZCM0DBAN15QAZRoCmPqE84Uz5C96eTQR+Gmjc/ybdzIjCjNDLzoCcYYq4S2AmX+TQh30BMVFt1F8MPJknoCdWw1V1ZiCJOw2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZrqVRsu; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZrqVRsu"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b520539e95bso89296a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Sep 2025 14:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757023036; x=1757627836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcZeZoGWZd6oDyE1JgIMLenB9ELxcn6jjg+gL7yAmkY=;
        b=iZrqVRsuxCypbwrClmvoimaYUwi/mGx+++LDy26SziTAUPyWWOYiq1f+N4vEBcDr8A
         ghcahYCeKaKsTmsEM5EZzevEmx4w4hGvYdvVjUpDh496DVR8lVuRGifFAw3UrRIKfyUU
         l2W/+EZdExt8OmhpwKT80UpP8XW6TubTBD5cFE80ygiXzA2xgsD5pWSkrPM47C3S3FKj
         K/pcguII3h24LmW5hoZg3qK36K+4+2bFsyrtENLYPoUvOWNehx733eHI8eQDDfF7Jwtj
         loCnOjtQMMDK7vkSvZLWV4e8x9crJAvJCrwExtusF9dKaJeNDBgXvAUiVPJzOLZLe8XD
         LuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757023036; x=1757627836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcZeZoGWZd6oDyE1JgIMLenB9ELxcn6jjg+gL7yAmkY=;
        b=dpGGU+WqDmwMc+/zEdPnM1YwkhKuCyvi2zkmI8hoa6G/SQ0H1/sfvAlw63L80KSBqJ
         e4josOsSsRh3Ayswkoy+oli/alV+2RA9nVkjK6J8WvpzJa/xMqtoD5NlB+bDx4Xot0Bb
         sDkaO6fyaznI3MmiMzIJRqZqooii7sSEIDYfUPysG/rYuSQuFHTEAtTASyGqBF8JyTp+
         4/6uyxkSRP+DmgToxra6drMetsY+w7XGuIrpsGAEkuQTWFiPbsmIoUIk6cvAy+/2ox11
         0yKZUAP9H+BVyoiDO9OKO3Abm0O8TV+hX3/u5aX05/14ArLNghgZM75qDmN7ojS5Pr+i
         wdLw==
X-Forwarded-Encrypted: i=1; AJvYcCWjJVmi1vMEMorEDtyF2HwElN+VjjieUG7ohVfvonBoebUw0IBBxFjciOjiUxus4TRgQqulPVfQgDCmgiPlJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBte2+Mt8ramKzhpnnWrf3Yr6QmaXufAUOnZK4gU1nRrvijZfB
	sLbFsfHqiJx5vYL29TMyvwsPrBSqYwD5eKMxnbo8AgjeqdKjzwqsFECVFElvhzLIrrsMxJkvYRp
	qrZ4YLNIdTiw5eoGmYiByrge9On38fQo=
X-Gm-Gg: ASbGnctcwEKrkb5vMM+sXGMHotyoukZB6sA6SJy79NpNsUcrWTvNfxbhcAIxWAs2Ofs
	Ug5kXrClyoNc6lkVCu3Fn9nquSP3PiEx5crhmyEE8a23o6A4a2H/rqmOlpwHWLLNCSAYk1wGqU5
	2vtzxeIJJLQDKtIl9mi0fJEJSelhZxM64BlCdVWsIYlZ/5D9JrMG62faVXoiv8tgrJC2qBAUe7j
	ARn5I6W7UU9zeNYZitx4ZXVvjx8e3D7GhvRpLxYJlwCuRLtNkfdsMjhyzPsPYuaIXkP2Gj/wvfA
	XLeWlwfegSGI9mAjzMFDvoC7fzgM9Q7zdPZr
X-Google-Smtp-Source: AGHT+IHZzzEVWO5PSFfDM0hepN4yQvN1y0+nmWEUBQlDiGcXUbGHi5nbA08+gO7LBQf4rthVM0fgKbPH71PBos20E9w=
X-Received: by 2002:a17:90b:1c86:b0:32b:8f2a:ae35 with SMTP id
 98e67ed59e1d1-32b8f2aaf59mr3254587a91.1.1757023035654; Thu, 04 Sep 2025
 14:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828-rust-percpu-v3-0-4dd92e1e7904@gmail.com>
 <20250828-rust-percpu-v3-5-4dd92e1e7904@gmail.com> <aLi-7W21N45fBGJk@yury>
 <68b9f5e2.170a0220.1224d9.5d3d@mx.google.com> <aLn4bopPt8uS4d1O@yury> <68b9ff1c.050a0220.35de1d.11b7@mx.google.com>
In-Reply-To: <68b9ff1c.050a0220.35de1d.11b7@mx.google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Sep 2025 23:57:02 +0200
X-Gm-Features: Ac12FXzzgEdE64V3Xyhcttg0HrRdfADWmugK1SarEVytCTaLM5JzuX5Un97wiHw
Message-ID: <CANiq72k1oRcxKbBpp4B-uCmqm+Hd7_xPqwM1kt-BYikbcsUSVw@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] rust: percpu: Support non-zeroable types for DynamicPerCpu
To: Mitchell Levy <levymitchell0@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Tyler Hicks <code@tyhicks.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 11:05=E2=80=AFPM Mitchell Levy <levymitchell0@gmail.=
com> wrote:
>
> it *might* also be possible to use a macro and dispense with the need for
> a closure, though I'm not familiar enough with proc macros to say for
> sure. That would probably look like
>
>         for_each_possible_cpu!(cpu) {
>                 let remote_ptr =3D unsafe { ptr.get_remote_ptr(cpu) };
>                 // ...
>         }
>
> though personally I think the first one is better (simpler
> implementation without too much syntactic overhead, especially since
> closures are already used some within R4L).

Yeah, please avoid macros as much as possible. Sometimes macros do
have advantages, but if it is just to avoid a closure, then no, please
avoid it.

Similarly, unless there is a concrete advantage needed with the
function, please avoid it too -- the original `for` with the iterator
is the normal way of doing it and already used plenty in the kernel.

Thanks!

Cheers,
Miguel
