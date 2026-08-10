Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F1C31355D
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 06:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786341648; cv=pass; b=fST7vQzmdfckdV6EQ0mvDrUEW0zDIMMJK70rT6eel2AT4VP1PTUA9OMT9OVQjj/9zeVGyJhIY5fpEMAW9cHQe/ywE7X1H7FfBc27Pz01ErEQGVrez0ZFqr1Luq3AIDXyJe+TKnyHkV5It23HhNd/2dHMimauAgVJ5EX/FXIehhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786341648; c=relaxed/simple;
	bh=A6k/r7nYTVXUKSwr3yMiCfaokYfSJx1y4Hc9qQ/TqEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCBuwO1erqUVpaMtdJK5Ybjo9oZNV9oavP6E6BduVKJQ7IiCktywMmTiKEBn7qpVFPt9KCIroHtEliaNKnm0YiRZrHVYKKmGP0GZQrJHmGsjiNgdB4EbW72Hmx2ucvHx5i9qbyGUf1DUD0EjNvMTk5K2Y+wPJF8XkYndwqA0TXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jj7M4TRY; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jj7M4TRY"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf49dc28ccso2878875ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 09 Aug 2026 23:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786341646; cv=none;
        d=google.com; s=arc-20260327;
        b=nM8Pwh0pa4CB5FkEV/ZRpWICjvi2wfTEde7sq40jEbnYdwperKMRaOdWNjvf3e17rZ
         6Mog1XoneXYi00Peeh/DegQNeOz5cmI/Ufh7BHT3qT/AtWsl62JNHUFvxqE1dk/RhQvY
         hMfK29iaVAJmI2YQ6GpocWuYQSX0tp150w6wkl/szpvlyEISzYm1ONJmv/CcKe75lT3P
         +kg3Ieob3jmIklsVcHyxuznL6PF0V6bEXRaWpvs7msHob6A9cjDcD1G9AMSUaHKbpqIg
         PdcdQCglqxJnSkug7u4uibULAhNTLwGjc0ZiVZUCaE6fj0s2Wnur3H49JIiUYXaCCz8t
         CgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/zktKh644DXHbJuaAdqY5YkWn6ygQvUdVRJDbRh3y/s=;
        fh=KkktMIqyYPZrrt2dH/J2smMOZ3nt4Sfevi9jEouBL3U=;
        b=fOK+UfM0tWY+AMhkOISS57+3J1lvYmo11VyS4wfFpMqIOjFBDLZ5a+GYZ/EAf1Sb0B
         Pa5tt1vTTIJufPYgDguRaeS2L2dwso6n+ziEVEHA1HvR0M8ouStIevf3P3DcQLBjDoHk
         RXdt61jiRGAYPoAk5JWRUeymzRMwf47442u4qUdB5c/qJVuAgYggnSp+em1Ajv6Yp88q
         0yMc14CBiUDt5FwezhOnkhHiuOEobqC64FKAp3Hu2RRe/VfqD3k7KbxK2DphHMmvghHW
         OHnY7miHTEHPCen/eswjaZArTtnX+o9LUpdotV8D549JHM5Bce98pxwULilEeR2Ztzl2
         9+yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786341646; x=1786946446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/zktKh644DXHbJuaAdqY5YkWn6ygQvUdVRJDbRh3y/s=;
        b=Jj7M4TRYDJ7SXuZrD1ZuEtJxUuBtXt0KeIDqTROjszR7K/cwe2zxn6IT7OP6CymHui
         Ls2lHZJqZ4YWRVbWGRZVtLP+0MJzjNfwnP37iF+Fwyj2b9bidC6g/qoVVQXjiuCB0kRf
         xL+vMZ/yQmd+DOx1dgjnCmgf68Vu02f8nayd31uJ/G+hYK6EjLYbaBqoJ1EVXhjTzAyV
         220xatziRAEhCek5X2+fK0RXabPpiOi2DSzKLjHb3JH9+4DwW61UhdkJAw4Z1nMo/aX1
         cCa76nzrlVf7lycK/ZZ/gsFGywuvJAlVe84giizY57koLP0wvXCn+Z8kc966xQDVmG0t
         gPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786341646; x=1786946446;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zktKh644DXHbJuaAdqY5YkWn6ygQvUdVRJDbRh3y/s=;
        b=c4QVOyLHQmRvy1smRo7GN8yjJ/FjENYKY+OkrjI0vx+GsNXHGJ6ZS60ownzgrjJT0L
         +V5/0vonzFfYfhYGJMsmLmsPMPUC3S5CBHvAsDQN4Ae3+CPvmpFVeMms9CNeK2KMDzcI
         0/eAIiE3iE0SiKDi8V9p7qDcEf0VNdUdl15ZR6/1tBYjN0ZUiIg/A1ig7jlSfcCQ33+W
         Wa0f7K7S79Q925D+nOSmCt6QYC6EWJ8GHRCYmXPpqnUJxDmrWWVuW7c2Jb2SmuNB+Td/
         4wm+b8yUsbhwy2f/+o4ve8h2xNoe4oY7vT5k99gJhhqmY3A+gb2Mo0Ga0lLvXnUI7YNm
         6EaA==
X-Forwarded-Encrypted: i=1; AHgh+RquIBafD5nrkeW3i4wW4BlXWTg4Vd/W08A0fD2H1tpXlJ6Tg6HFjO1YWuL/vHPSNeNEx8fTfi6DEepXDjhBUA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw99ndyj9R0ourXwC/xybK3wvBeb/hdEw1dPvJOmGaqwFhUSil0
	vh93sgqQfpvLqy33iKOSDxJPCzWHVuw5siuANHhh78C1BsPZ48MDXRE3PCZHI03/iH5TwywdFF3
	4LY1MUEDk2p5KVEofjQqHZmYtvsTBtK4=
X-Gm-Gg: AR+sD10MFf5tW/Z3XjMh5XSQ31j0PXYw2mesV2mNSIpKHjZ8JixLnPYM94D4PzT6pwS
	GD+/PPVeWB9G9YQ20n39fKHBaDAx1RyW0I6seGK6I8zREY22T1P+Gz4xvatw5fCSu0w80JXqiGk
	g+93T4+pP1Evna9SxFqq+VKyP5BYqC8Ku6aoiTYYXE+7zQVkHEYL5bZaspDBS8fDCcE6Qyowmbf
	7vgVoE+N9M5z9DLXIC9bnAWhtZT2rrlIfJ9CGsMn60C7io8JIEVC5NTwo4sZLkuillGXdZrZUnF
	lI+YO9P9zleN4fSyPgqeTgqlIxRD3ErqysXfFH6S53w5rpafXiRHUCgTYh31n+Aa0GI1CQOAURD
	Bi/G6H9Zc4HfNXfzY6nu9liV7gIMyI41z1wSH8SxCdx392Cdz/nrkeDm+RNnB
X-Received: by 2002:a17:903:1b43:b0:2c9:d298:6c0a with SMTP id
 d9443c01a7336-2d0ca9ab066mr333546215ad.2.1786341646217; Sun, 09 Aug 2026
 23:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805145949.938505-2-phasta@kernel.org>
In-Reply-To: <20260805145949.938505-2-phasta@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Aug 2026 08:00:33 +0200
X-Gm-Features: AUfX_mwcm7oQ_Y3CUbVf59t9d9A6DohexL7x3OfKArvNRPUGCPEC33TB28La-48
Message-ID: <CANiq72nZ25wkxVHpz9GTA_m5E_vyBmRKdDSUNMsJAZ=6zk=zhw@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] rust / dma_buf: Add abstractions for dma_fence
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Lyude Paul <lyude@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Burak Emir <bqe@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Mirko Adzic <adzicmirko97@gmail.com>, 
	Timur Tabi <ttabi@nvidia.com>, 
	Daniel del Castillo <delcastillodelarosadaniel@gmail.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 5:01=E2=80=AFPM Philipp Stanner <phasta@kernel.org> =
wrote:
>
>   rust: types: implement ForeignOwnable for ARef<T>
>   rust: sync: Add abstraction for rcu_barrier()
>   rust: error: add remaining error codes

Applied (these three) to `rust-next` -- thanks everyone!

Please note that your Signed-off-by is required when sending a patch
from someone else:

  https://docs.kernel.org/process/submitting-patches.html#sign-your-work-th=
e-developer-s-certificate-of-origin

I added it here on apply for you -- please let me know if that is not
what you intended!

    [ Formatted comments. Added the submitter's Signed-off-by tag. - Miguel=
 ]

    [ Relaxed `'static` bound and added `#[inline]` as discussed. Added
      the submitter's Signed-off-by tag. - Miguel ]

    [ Formatted documentation. Sorted tags. - Miguel ]

Thanks!

Cheers,
Miguel
