Received: from mail-dy2-f23.google.com (mail-dy2-f23.google.com [74.125.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590004FD7AA
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 17:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961348; cv=pass; b=maXGBbrNTTpBmTJbkPT875381J2KnBzlk40/GdEOvRMayFjq9p4ILwRSnxKxtj2hr+zGbqLVbCnR4vXoPKUUQ8f8nJ1YmSiG7FDNgJztik5YD9vW4doJ4+2J6h9Z3s8c9VmytijeicgTGFzFsbRqKjZ99sF/c3mJhdISGC9Sw/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961348; c=relaxed/simple;
	bh=EN1cEQoe0e3LCZQ89Wmj7iyw49pEd9peoNHzrA2Y4aU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyscdBOrRj8UITn1IJZeiTneob75Ym4c8IzOBc9bECzlgDzjM3Lj+pl1Je8e88Uw1hstW/8oB9TS34j9DfjdRspr7tbo9UDyuxiur2x1LOitYmJ6IrXdNimpkPZ9zdqAcC3ixcAH8FdG/gAvQUNol+DAo0KT50XWIGcqL96h+kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qPr7oCgb; arc=pass smtp.client-ip=74.125.229.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPr7oCgb"
Received: by mail-dy2-f23.google.com with SMTP id 5a478bee46e88-32be7127c64so969454eec.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 10:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790961339; cv=none;
        d=google.com; s=arc-20260327;
        b=aIxdCSai2ibWuldwBuPccksbr4R91JYNRNQHmlhyU6wDrxFAHW6tdW+W7/x0AWHsD3
         IXeLe8uorPJl/VXcSKlPLTX5mUnBuVbNFr1onaj54n20ABJdTxeCxKUQ84jifwQpcDuV
         JFc+iZPC5ZC2AleRrLTsCM+0R/8hrxwPTCidpOfOwTQzJa6HUmn6mptkrcqElMjvNDMH
         I2Ujcm4zO2YoYnnGh/82hP233iQ4OLTIwFoJtGiiz4fsrXPuIuRn8EdB4lXhQU1GU+4w
         Iuk/mDqplDjrRWnyHSKJN844xdfEpLRSmxP7vbhXxhBqgpxlOteTLX5FufAXFZsmHv5p
         IlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EN1cEQoe0e3LCZQ89Wmj7iyw49pEd9peoNHzrA2Y4aU=;
        fh=RogepAoJ29M94i2QJxDki6x83+fdhQJsi9PripzXVhI=;
        b=qoZInyNxGeiWRhbaWT/IKkcX50sedXZ94O8lLfxUu57hzLGcufMW7O6A2UnccGILbY
         tSTulsb5fcjMWYdTwZvW135POYJse6redwcykuU0rS+PFFJChuxR8OsAZ1UJmUrofQTm
         M1kYVtrPnu+tiaaje9uImedXhmAUy0Oc2bjVbuEI7zAv1aFAG3YtOVGny6UIwaFD/Pua
         MkKUFmwIZ5pTLIxVI09IGjvALMYIwlv+sB0gY+uJLzQpiNBFK6jzKZS8TWX/7KrXqO6S
         1MGVNziG9RhbjkZccXCquACe9Pq/rOM30BLm666UEDr22hA4YS3UharGtDwVNmNSCKIA
         qbcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961339; x=1791566139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EN1cEQoe0e3LCZQ89Wmj7iyw49pEd9peoNHzrA2Y4aU=;
        b=qPr7oCgbCmVmsVRGhY/mlyRZc7AnEiwwEDhns/GQw2KpwtMejOPlZtLG0t7EhUjJbX
         riZCohM6eQUTfHAhxYJk2lZ7ZalM/rV50oooeLx2kQ70HuXzhYYqX19OIzoifElzz8f+
         isrJZRN2131FEhhK7im8v5sTKr94UUXh/d0aMhcS3G9+74CxqXQxpRqgJTFEdEKyo/UR
         fgFWoCsSoUaa29pDk4cYIYmrKlmyYC92ks3vOOSa9NlEdFgoPr3M+mrQNdpyZ1w2hvIs
         eRrsrMnh0zNVBvJNOzCwc9EhXmxk5rEMuyMdmPbDByIettcZa3nvmijIciBfAEEnqlYm
         GV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961339; x=1791566139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EN1cEQoe0e3LCZQ89Wmj7iyw49pEd9peoNHzrA2Y4aU=;
        b=H3Nd94xXpDzoxra7cYxnXGdS4q7LBYCoZ0AOkPSrt/IUkgHNzfqdFNW56V9NBhhuR/
         urIzTWmKvixhRLXpN45hmTOtXVJcHISWl2OBaQCZUTbHBSf0mBcSMD2QD/A/vFsoQ1Fi
         AYhXXcr26weNbt/JCJ3apBX1gjcpEAsJ397bl88sZtOmOvUTvXSoHpjFWNbKnsKB11l6
         r18jmIR+pq1Zkub7GNJqeuY8R1YVcChiv1kiG0m7zFuolBOCV49JJO0jTjGNK1PRkcKx
         I5cqCsu/OvJmDz2qKuQXPDvHNi3urquEgOp7xjlb9eWe6L0U0oxyL5Xml9eV+jIPMVUo
         seFg==
X-Forwarded-Encrypted: i=1; AKwUvBxIQR5d0aqme2Bs686Tkd0Qs7UolEa8ZIfm79xZF+4kZYQEhLMoc/Rp7Hd9pGlVilS+fYX8u4Fbv88FwH8onA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLcPFa5P32pdmdCsD3vI5jlYEr906DAFXio2jb2v8xRwbCpky4B
	w30FUWdNlDzIIbMGN2kWnRvjqUQvbd82L8qmbpyO4LUBcgbrEL6zsJZU3FpeWuSsUKXxui9p1Bl
	ge6GKNS0SAD0Sac6DGUE8HaYQCJ+kHw8=
X-Gm-Gg: AYBFou0OqaMrRZKOfADVgNK60XQVVx1fWS6ZA8w735Bq9Tgr/692Jpibd9ahxOWm0hd
	PbJ+HG11R1V7tz0lz8lv/u0xGrlNLGE4Qef/FgoJKyeadARVYxwXZO1ok+MyS7lLqVaFkkS5UXu
	s3Mr/FupQVGMrB7kETtwEJsjGT1uIc7c6OtLJ7VPHh0j/Mxayl6wfobP6XMNogssn5K+DnTxwGb
	3m9HXVC1Gt5MFKPVzA739rJYL+YKkyMVylRJ+Lp+cZFRKjR02BS4OlKkOQ/LJru/I6vjWqbVb/z
	ukhLoipIsl2380AsxvObVqf9GR1uSis8R/FiBVq6EHGweja/wDW0laS9v/ckxzNhQB/xy6LE48S
	T6ZmSPnEUJtAavbGzaAlm47QjTrOIt5hq3n+vV0hjF9EM948KfRTTGQaO4uX7BZBQpT8MEz5WQB
	JHzMFYSGAgfQBX1xPffGvjG2pUlCexnd8JjNNughw/6YtoxHOAJH8=
X-Received: by 2002:a05:693c:8951:20b0:34c:15b5:b4e7 with SMTP id
 5a478bee46e88-34f1503d60cmr5903420eec.2.1790961339293; Fri, 02 Oct 2026
 10:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-cv-v3-0-0f90659e711d@nvidia.com> <20260902-cv-v3-1-0f90659e711d@nvidia.com>
 <DLFPWSS3LZSN.12G96EM0FI18C@nvidia.com> <DLHFKT44IHW9.2QWQB0O0LJHJJ@nvidia.com>
In-Reply-To: <DLHFKT44IHW9.2QWQB0O0LJHJJ@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 19:15:27 +0200
X-Gm-Features: AclHuK8WU7MmTRz2zVr217nxxpeT8qmaOpCUrJpN90HnuhJSuc8jn6MdcGDQfTo
Message-ID: <CANiq72mrp7qw5jikznfRoWMjcWk3Vwm3dzPdWcC1AZ8jGzdibw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: num: add cv! macro to create values from
 constant expressions
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 9:59=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Will send the next version based on drm-rust-next, but Miguel please let
> us know if it's ok to take through drm-rust-next. Thanks!

Ok, given the recent discussions, let's move this forward... I have
replied in v4 with the Acked-by, although with some feedback.

Cheers,
Miguel
