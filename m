Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C513116DC1A
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 08:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500525; cv=none; b=W++Him3O863M7A1b34BFIUjbRs6pMzCGca+CPBUsrV+R/+6oeODKpeU+j7HcNoL9shnAE+AlS2Q4Uzf4laQ++77u27ErLVPqU/ZfElt13F9rkKzI3DTMwdk+b4Kll+/fYjvx5ol2JBDR4RspaN3CgNKKx8Q98SvKdOWmV7sqd5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500525; c=relaxed/simple;
	bh=FT234993Aw1ZLPSi5PWQMADO794dozH7F0acAYhTfeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nq5h09KuXcKGjnq95rAjip6AojBm9i+qImusYA+FsIVmgSYVk8RzLQbfln9Faq+Xa3LLAcmXTvnHpz7QB2Gdq8g6ALlBWztxRiPVg55fhtpFn2JSipe5bnQ1AEqZCZ55GLqaC29/P5iOU1pWQFrFu/bXDRu4TKfE+SuoghslfCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FntNDhVl; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FntNDhVl"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ef2cce8c08so71384631fa.0
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 01:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722500522; x=1723105322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FT234993Aw1ZLPSi5PWQMADO794dozH7F0acAYhTfeg=;
        b=FntNDhVl69IdkN0upJFoCQRkkQ2K95lrV1FoT39BTxheVCM+la9NQUw0feSKnxyDyu
         gqnAIZwaHk830WfaQ3/irGzsi0bb0ePWbQO7jhmzNOtyc8z9G1g+df0iMNbI1MA2T6XM
         Fr31SNWkcxjsR/4GdqKB0vdL01bC5iocQsMJ0KExiauVaqSiR3qG27NhazaLTg4jPv+c
         8/vD2/2yJss3M3L5jqWqpAM8UZQnp8IBEWaAYk14WXS9942pQ4RFEK1NFFKQqN/Ww/Km
         E1FFVUPEK0R68b0nD50SKAc520FVsGq4j3j6AIcSECzspg4LZ5pb9yfJKoYICpJCcGy0
         kQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500522; x=1723105322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FT234993Aw1ZLPSi5PWQMADO794dozH7F0acAYhTfeg=;
        b=vesjqtixx3wXpBeC+PNOBFfig7ZNYACvnal5DoG+NeI8g8+toi5VdBxGItRN7TW38d
         SZ7KWVkAiMhsCso6K7orrdxsCrGh79rmZT0JYYGd7p8uj7SXTuHpFGmtyILm5sq0RFYw
         AS3suwyx5A45Fvw+X9ppKvnCsgysWMSojEQo6f136LKKPUOr5Ars33oB9UafmVeMWQog
         qj44EAae0h3MwD6Crbgx39KoKGpnGWNJb7RfAXPXwlEbIRsc0sfJid/dAjiSQpvPZXa8
         ddSvo5/fXEomwMoy9lukm2VoQc7KGJ7fenuPhyMhV+8f6TyD3koOQmsBgcMMAN2/pMWD
         YMEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0mXMM1No+fGtGCeERfV0pQedPe5KeCk3ojtNsvk1M2r01NH9/Em+w3CBA92VqGNND1c7AYiRcL6Vn9H0B0wOxJJXkAgNL91jfJQBoqfc=
X-Gm-Message-State: AOJu0Yw9f3nyCtoItQrNApf3yg6fZIN4bPNkxmOk4Iu4I5twQ/O6gc59
	Qn/iIK0+DMPNdwdmcwDD0VeCxQVKgYFw7zkITuupjfT2P7/XMibtpWwn9eFY17yY2GRFLHroaxA
	Ss8K0P3rI5wdqUmB3y9zOfzqGDrcqMO+dNhGP
X-Google-Smtp-Source: AGHT+IHhacoZk5k76GYn78ckj7AxpCBMjEKmH4Pd/5oixcLcLUenXqaOpQlIotSnXXmbAEE1q36iFnsD3sIXG2MF8E8=
X-Received: by 2002:a2e:9682:0:b0:2ef:3292:4bdf with SMTP id
 38308e7fff4ca-2f1531027c1mr12931161fa.17.1722500521533; Thu, 01 Aug 2024
 01:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801000641.1882-1-dakr@kernel.org> <20240801000641.1882-4-dakr@kernel.org>
In-Reply-To: <20240801000641.1882-4-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 10:21:49 +0200
Message-ID: <CAH5fLgi_YXxsnLQ_p6Xx8yKFpn2PVjXO04-+dJ8aX-k0K+O4EA@mail.gmail.com>
Subject: Re: [PATCH v3 03/25] rust: alloc: rename `KernelAllocator` to `Kmalloc`
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Subsequent patches implement `Vmalloc` and `KVmalloc` allocators, hence
> align `KernelAllocator` to this naming scheme.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
