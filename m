Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A21023244D;
	Tue, 14 Jan 2025 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736867096; cv=none; b=Su56aBgyfqS+F4lB4B4cqxbqTd6GV/T53FJ8AFtRt3xrxeRYXuRKZVn6UxfOQEzhTiCHlv0iTxD/ORukh3Rgf26i6RbD/LgrFY6gMBqGPgpxcRwGt3cdnDWuDHxcSv+mfVzsGGGu8PvyFfeKGEUt51B42HvS1Bco4F0v7lOtKKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736867096; c=relaxed/simple;
	bh=Z96OTFkvAdTfb3beAUUpfoJj9MhcZGM3k/cg4yLd0hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=RrRJfgMfImnGtqeQuUI3ti9teSvP6nU2q4Qzf2lhThrZE0gBhS6+OuViNDjPC/dtkHyfF61WsclPm6z6nwjp/6avqAs3HOQ+7RPuohVRhH189u0Tkz+g9Zx/ZdQ6wWEeW9xbVUKQTkM9uuGlkWdeupj4KIpIV29KGMyqW73jehM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mafvgSU2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mafvgSU2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee94a2d8d0so1145515a91.2;
        Tue, 14 Jan 2025 07:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736867094; x=1737471894; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z96OTFkvAdTfb3beAUUpfoJj9MhcZGM3k/cg4yLd0hc=;
        b=mafvgSU2QEqCRZpWuR+Zvj0Mj6fP5VK2xNHxfu5stKKy01t57f9NqRH9zdkec8V+/f
         iXRrtjM1CNtr2FE3GasxddwvgAPgvqc2x2F9T4+oAoLcPf+S9+rhQzkEZLjfymTcYpNS
         s5J1TkdmkLkK624DL7xnhXPH7p6RmCYpcPD3ZerY3aXwtMD8CxIQ75GdHYSufP3btOp/
         76skHOmGDIFHK4wNQ3cLTiRX16zSIIsJjB8l95Np+24VOyVZuTOoleSL+MWVvnpeMof3
         A6mHrAWRSoNOmDIn9RAlAJT4LGMoRdnj6SFdLLAF/gjnYS22HJJsMyxbtL409qk6VpDV
         p6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736867094; x=1737471894;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z96OTFkvAdTfb3beAUUpfoJj9MhcZGM3k/cg4yLd0hc=;
        b=GjgF2720s80YFL4MjrV4/YmmFB3zRviaDOcWnnwqF7JdXZvprM0ign9Y6mtpIt+66N
         wi8P0BMWJa8R4DC1m+cC6aX4bZ9zBGycoxeu+X9MAXdL2g8e1vRVzciAhSQwf/izLHuo
         Qj19hsXuIhF5AZ9b/4TMD+tS1OskWeR97DQVtKooTuULiA41ovHWO1x3uZvcJ0M95EFE
         Ka0/x3rpgwP8TWIhoYGUgMC1K0so6za8QkJL0eG+8j4mJifG7v8RqwzQo31+3zIFQwyf
         qMqcKkCBu0KRDBJiUoxlZgaARuafZXO3aLpVvSwNQVsk51YZku7kT0JsGQW6/TUVguB1
         TU+A==
X-Forwarded-Encrypted: i=1; AJvYcCVL87LTh5pHE/tg+yVo1oshDUcCFs8mAIniUt67dTn9ZTwwaflUaYVUzm0bDmOFwliDkLSxwcvhY+xji/g=@vger.kernel.org, AJvYcCXCh82P+HtDZKRP++2RCF5J4jlV44xpLd0Yh8a2qlvKyqV666YTEoNZ+CfVOaGe58b+COgheI7BjA42Q780jEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIebOfwZN4lv8txIgO5x6MK0+ClKAIbGY8jc4farxB36ryKkME
	CH4moNSJMVzm5scsAtzrrn3H6RDJhNA6Tdld+ue2lBcuvElBbYQGUc5Su1IKR/2Me8lplfXXTBa
	eiDUgWYEPKyTjtNR2os5syGPq1lQ=
X-Gm-Gg: ASbGncsAxCgrjXUT8nPGufFQb3I0TMmj2hl1LV71FKQRxWpmnVrvf+SLbu4cl8rRufb
	s/KatKRfA7HmOaE5Tmuz0tPUC7HWTUawZqElsuw==
X-Google-Smtp-Source: AGHT+IH1L2K6ZTogUUYGpW6OauKJzk0IiQ/m7JIZn9eq3dPe9Ojpa3C3FmGNTCx6h610/EUWD/tJQx1WB0005ivDRKs=
X-Received: by 2002:a17:90b:568b:b0:2ee:6d73:7ae6 with SMTP id
 98e67ed59e1d1-2f54911d990mr13556945a91.7.1736867094223; Tue, 14 Jan 2025
 07:04:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930233257.1189730-1-lyude@redhat.com> <20240930233257.1189730-34-lyude@redhat.com>
 <FD0FB134-5FFD-419A-9B66-85ED2EB6554A@collabora.com> <d35e7f02b1d123fad8d4aefa494d0e83424c6e96.camel@redhat.com>
 <Z4ZzkBDCryk-NKPg@phenom.ffwll.local>
In-Reply-To: <Z4ZzkBDCryk-NKPg@phenom.ffwll.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jan 2025 16:04:41 +0100
X-Gm-Features: AbW1kvYAob4x0ZdjNClG9HmEC8lbd7Hjs0RuAGGsaVOZ-nWHpDFw8-W1fWpd5A4
Message-ID: <CANiq72=M3=0rcTfQS9Gch8NeNyrpXb91t-z-gDBSDO8V-Bh5gQ@mail.gmail.com>
Subject: Re: [WIP RFC v2 33/35] WIP: rust: drm/kms: Add VblankSupport
To: Lyude Paul <lyude@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@kernel.org>, mcanal@igalia.com, 
	airlied@redhat.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@redhat.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 3:24=E2=80=AFPM Simona Vetter <simona.vetter@ffwll.=
ch> wrote:
>
> Feels like trying to replicate docs in rust might be dangerous, because i=
f
> we have to keep really detailed and nuanced docs around in two places we
> will fail.
>
> Imo would be better to just explain how this maps to the C side and link
> to that for full docs? Or somehow include that, but then all the
> hyperlinks need to work from the C side kerneldoc or it's again
> incomplete.

Yeah, if things would be duplicated (in a way that does not add much
value, e.g. things that do not require linking to many Rust-side
things or does not use the examples KUnit support etc.), then I would
say it is best to do it in a single place.

To do that, we already support the `srctree/` links that can point to
files (and in rust.docs.kernel.org get rendered to git.kernel.org). To
point to rendered docs instead of files, for the time being the best
so far is to link to docs.kernel.org directly.

Then, what I proposed to upstream Rust is to have a feature that would
give us a way to have a bibliography/map of links that could be used
similarly to the existing intradoc-links in Rust docs. That way,
projects could write something like [`struct my_struct`] and you would
automatically get a link to the suitable URL to the C item, or
something like [`ref:interleaved_replies`] to get a link to the
Documentation/ rST reference and so on. It would also help to have
common links without having to repeat them everywhere. With that in
place, we could replace the docs.kernel.org links (though that
requires rendering the docs, and we heard from at least someone that
didn't want that at all...).

Then we can also work on the other direction somehow, e.g. sharing a
way to render docs properly for both C and Rust. I would like to work
on some of that after the build system stuff.

Cheers,
Miguel
