Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE27226C39F
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 19:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773342947; cv=pass; b=r8StT6yg9xwKW7p2nE3AR9ncEKqbWNydmrklqPH44LC2THN5L+pNkxwuFHVoekYZLK/wN7UQs8Ghv8EUwvVre+80xlt/co1/tr4oXg0og4C0Z0i3mWb6bbwYbiBO0MsYPJcW9NOmedSCN0ANkzQ1cz3jNaIHHJLEEAoKMESe4Is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773342947; c=relaxed/simple;
	bh=4VzEC4HlHoK4vh0lvr6EYPz1Eqp/YdbOqaCW1vewwOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=US8W4TTNegzdz6hUdrDM3JCAT+9LN1kwSZVVcOMtlofFVfZWf4lW7wEcHF052DRT8La/XweGunYTKyIWpXYVJv8kBq5owSdDCkHcVDlaVFeRuaoIK+XMfdFi0JaQOcCFw/+lland+M2kX2Je9dNd0PJ15MbTIDo9CqjCmexu2ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mds+JwZA; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mds+JwZA"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-128bae6a35aso94014c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Mar 2026 12:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773342946; cv=none;
        d=google.com; s=arc-20240605;
        b=ZEV+iIlIBDg0x+hMQyDHFNTpwOZIptxf5x/FKf7RTVSehqplgfGCjUJ26oQI+asbo/
         HAu45IrDaZEk2/Zg/sN0M3r62F7qE0WHwAziT8U+OY9hSRr0uw3ZWvSfg1k082GzARCc
         niowP7lTBvyy543TcN03mk8U+sWXpVuB/I1Vtpyl6EknM3QPIrVla4shh+imWdAxERLZ
         0e7RWrkHemaP5+j+zq9uBpa5CDhiAkK1ZDUB3UWMnKzfHrZYJ33fqCzjAXilJon8NxRG
         uGrWE9gjAxzSLeqnEz2ai16sFBtFINtr9EnkVinuIeHMBSmei/dklz3OpF/IELuFs+52
         fxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4VzEC4HlHoK4vh0lvr6EYPz1Eqp/YdbOqaCW1vewwOg=;
        fh=sjCvbpJro9tiA2v6DP5buSsUjJGjZ063+mg0N0GwC3c=;
        b=YfmRQXqWl669gyIgwqbCTHG+4S3Cl+Dinb+eHesQm7ymeEBEI35VZTWxZZBhkqmQ+v
         i45th373ClWaxga4sMIPQV82BNxfS5fVCX+bNJoJVX/ktdcIsD4OHVLDjvZQqTdY10PB
         ByR3COvD8bulIPdpYiqnFdx8BF9e2yInh2LGS0U/PGGELnV1Rq9g3Yh4Y9cpQi1k4ZJa
         ARMWf2v7BzpAxYGCFNpvvwoj7rGNr9aDQDlpYKB26T9/IUkHL2p71E6Afpc2dVU/9fkL
         Z0IWls+UqNBb1LVpJvhIedQVCOiRxGYexl/7srWe0yIkXkw2i3KH2QnLHkeRVwuNXV+F
         0ZgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773342946; x=1773947746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VzEC4HlHoK4vh0lvr6EYPz1Eqp/YdbOqaCW1vewwOg=;
        b=Mds+JwZA8Oc7NjhpeV4FSN1/iP+X+fhRT2pASsS+li3LA7tJEBaJbx9omaoF04jfJm
         0KaEhyKFhvvR6bA5Ul1RkUZjawanfmKwgnLrlG9wPkrMLlSZlV4P3wl667VdlnyYnDyj
         +ePEpIlxvj99eJCBS48+J+ArRMvkjaPX+PGwYfUcGObXIwHwaTy0ldJv0aS29SaYMC6P
         811f+SRV34+/ZJ1Sk0Qd62dCTVbEKWbwGWxpyKs7emTPYFuRVrr1og7nwpfO+gSm7lPU
         /eevbC5don8pk4HE8D8ZAkHH4F7OLq/IOaIMjPzrV6/ybLDLIuHcImYx02KR2AqUNGXB
         5nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773342946; x=1773947746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4VzEC4HlHoK4vh0lvr6EYPz1Eqp/YdbOqaCW1vewwOg=;
        b=NUoT5lZEYb7iq3tYTelP8vPuDl67onGNq0ZP3KJucFSPy9sGnrtSjFdN5rP18behZO
         TMxjhQjsdx4wccG64XKoFvIqi5d9yTnC4S79AxGzhBlC6RpH0PaSdy+yLKxi5vn38RO2
         YKVnZZRXS+pPnw0q0eNshpsUykK+axxX4QysJgNz/1Kgzk+05hCa4uXh44Thlsgg+mm3
         l5/ymjB/iNW/G75KNBYcqgjr6KEy64BnHJ4mCxTYOfrnxgSZZO3DaHb7NCFsR+4y8JKo
         wrv0EG598mykDQX83vDxdWOkxlGjOSpsXpT09vT4lDvtH62KJlHM7x4A6EWpU2+vdLBs
         iNeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQU/BTKOt2g6XxeL5VVH8c2DCJoh5/ovh2eUIjfkSwmVFfZwN1hxKfFWk2ye0co/vx9npY0KWGqSmJ6Plk4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqfleexxjKC5EfGCAg/rPEpBzOjRJZsElnLweC1xwS/ov/QNVU
	9dwiKgqIF0tzkRQy6Tj6z/6+eFMX1xdZm6X8Fch/pIARI0YjMhuztA8CZHJCXslispuVzHX7DMA
	jmACk7onQgficD153v37atx5bOpil3tk=
X-Gm-Gg: ATEYQzyWcRjKC40XZQsmNxOsgi12TMB3EqgmLjnwkN4Z7PePKqEWIoIWBN1MOA075NS
	9j6eks5ifEpu7s/+C/RQHrtko2yFVsDRyH3xxjzZxhfIyRk0Df1FqAe2PCoJ3bpf+WzAEIyonJv
	NN4PN38GqL02nTyhRye6sOu33c5mHxpsD82SWWmu/aI/WozIujYwUTkkTGBncYUXB8OKL0RjCVs
	3AymLysF74u7bu82GOWthwHeRM1EjXZBKPPGb302cH5vqmuutjgmXohiRfzgeK6scxxDgW+OAog
	mSHS+MzqTjmnary5NU/OIhkDZ8zi/NNhCUctdpEbSPxmhbtHvyxbe93fmsx066t9jQgpDok03+D
	GsYmLa+0qBp+EWso7bbNRxXY=
X-Received: by 2002:a05:7301:1924:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2bea555c8d0mr231898eec.3.1773342945899; Thu, 12 Mar 2026
 12:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306203648.1136554-1-joelagnelf@nvidia.com>
 <20260306203648.1136554-2-joelagnelf@nvidia.com> <DH0ZMJKN6OE6.243UPT928HIIX@kernel.org>
In-Reply-To: <DH0ZMJKN6OE6.243UPT928HIIX@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 20:15:33 +0100
X-Gm-Features: AaiRm53560zXAmoL0EVQHDBxYh33LaVByeeBz-QChPDevjdBJ65drv5v7FGkL1c
Message-ID: <CANiq72n6ccEz71V3nkJxtY_BNbTw3F_eekt+Dyhvfb1FNP-srw@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked list interface
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Dave Airlie <airlied@redhat.com>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Koen Koning <koen.koning@linux.intel.com>, Nikola Djukic <ndjukic@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 6:42=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Was this given off-list? I can't find a corresponding reply from Miguel.

Thanks for double-checking that -- it is fine.

I am sending some nits and Clippy issues independently though.

Cheers,
Miguel
