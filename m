Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBD2450916
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924111; cv=pass; b=Lu+gpo2+ixDIJllbhpMETZYbP66JzQJgSH286RD6T9plqQIiod/xkCmmTgLSlIo4SqkBLNrJmuqV7mtQZrXjEEi4bVJegcCtW9RsP5jVAIvtFYFCtTPxt+mvaGw1JJiivNnO1rIT61gNPkza4stI/UVMWkLg5odG1E3GKNUaQik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924111; c=relaxed/simple;
	bh=iNS29Pvn7e4trT/66izyQW++U1iF/qAhxTr5wXYsUgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=urfg6HmFQ+PQY02AHOxyfHpLMD5WogyX3VcqwR+KIYpGOZG9RBlBsxjsDH6s7r3FNoJIBIC/oKiGO+CzkLXTq46rUfcCegeX1ZBK+1o6dUTKCNzGGLxFzVuJOBHJwZzhGDBtVzXu2uNf+lKYDf7QLMWnCZXGAiE7wklbJeUWtxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nS8dLvJD; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nS8dLvJD"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12336c0ae91so505216c88.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 07:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768924108; cv=none;
        d=google.com; s=arc-20240605;
        b=dUN4Zc33sTn1gcYd8UIE7G56Lyhl87U6g3v2A/LtGyh+zKDaVHU5xzdQtMbDOOXDK7
         EBD1A/ti8paeXsN7Z1HwpVE6q7naf5+N9KwE8y3bjSLsvjxkncymU7x+OdJd4IxB8vOM
         LhumcBy3zU2zg8rVPKUVvWyJR0atXZsXEoCISf3Jr3dQuP6zaymCc6NLicsMWeoHWmWZ
         3WOMKUqwV5Wez7v7KHHKvJDkqohBAga0CKC0/7pKe2a7QyLguOE9RtksWmGQ/EJaqMkU
         wZ5HmrNdN6sTYwbQYXLmCDcjptkVDgHPaq9ewkJ59scI5hEk7M694rYlfF7w970NMCBh
         8RKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iNS29Pvn7e4trT/66izyQW++U1iF/qAhxTr5wXYsUgg=;
        fh=3IDXYgDuhT/uVDxw85c+foJuUvMXM5nkoz6mb0CIuQk=;
        b=k19fZBbBZK9u9F7j28xwOci5CWiOCpIjs7zJ82joQa3WsnOdDBXbPuD1DuZxco1r+A
         gAnCgy+cnLVirGaf0vhEubqiNIk/0axbdvLAIEPYURbMGOLeJcQ2bFzqHzkxiBhFiman
         GlBSGPgIrN22g9MvzRQLum4mNPFcnV0Ojg0fUCZpD2n72r4yzGlDZGrIPQYn4mZ1AaA2
         lhoXds3ei8QLTaZXRRqWWER8UH5U81Kn1f93ko2XzHfp+u7xO76L2b4inTj1ebycYZds
         c/lGYFXAMfZgUFzO4gM+p0KoOi4bQa9PmREMBlv4J4cQaBplbYU55C+P+gAsjCp7P0UL
         5IOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768924108; x=1769528908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNS29Pvn7e4trT/66izyQW++U1iF/qAhxTr5wXYsUgg=;
        b=nS8dLvJDpjYz+TV9GTwtzSvz1QHlHEkhWyI6WZkr0bU3+OGsThVTjsLefB6ayq6RLM
         VjyQPQOsKtBB7nw/85HojmuSEzwybKWC3VDomOUPtzynPftwmDmSNmcKIeRccPszlvVL
         0KVoOfoP9Lz1ZXDFF+trKlAbQNITegPYS7vaW0D9EL2ItYhXAzudQEAWqI3FkuuveADS
         /pMEW1CjRE/z0ApdzH0w1JUUG1niBHNVPJuYQctnMn9d/IXfdKxqFemky9IIM7dXpC9z
         DUt5fDdCaw/dizuun18odnxKSDzibbb6gi310AVCulFPD6Vrolt/FTCf8djUw3qtWn34
         s6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768924108; x=1769528908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iNS29Pvn7e4trT/66izyQW++U1iF/qAhxTr5wXYsUgg=;
        b=bHOZ5vhFdDjqwz6gi9xsRlMHVo4Mgmrg5BStvJCnoJVcBHFEAZsagXRo7seV8uKPN+
         CoAb7Jk5h3HHcWq6Q/ZlVnC5XUxSpri69B8KOOCKZO04muZaKYSEZIQhmOlmyse1HGoj
         FNyNcuCGE2+pB7hNYyjks2MD5stWSsmPAwD8lw4n4FSuYeXrRlM3VWl+GxGz1WSLx+Vv
         hpQeLT+a1uYw70qAb0HDwCC+FeMFGwtf21b9txSPPhUv/XmWqjelJQ2XbsLKgcKfF4C/
         KzvTYHID42D0J9OWOCQU6gyoTWAz2FKT2aTKi2I3YJFrqGFlHwpbOagICxuUhoMaSMoG
         5f/A==
X-Forwarded-Encrypted: i=1; AJvYcCVE5seoaqlO9ES16j3Ap/koaFA7E7IowpOeQ1wPjOl9rSbHWx+AZ6+d30P10HWvRKqRpjC8OP3BU4ucC7v2ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtYvM5VTARHl/Yb1WcDYxAQ7gSY901SSDRKXCzxJEtNakR01Q+
	MVF651Tl7PL6K83OQ+2qh9KXxM5I+VYo1i+p35oKk4G2jJBurnn1sXetyXeS1zt3rg0zDh7KD9H
	/d+X5/1/nPgKqyTra9/0QyYxoD8S7lFs=
X-Gm-Gg: AZuq6aK3aTEPShi01SqQZlpYsbFKQWgnf9autEc117lcq7IRMOPzWNhtLwUrZWkPUzB
	oM4Unz10+63JQKq+wiCDsm3FnuVUVLzCBafC7XlHv5M6800OZ6r0E6zz6gIeXQyFNzke1UuzJzl
	ocebJ9SI24ReNH1ny2WWPJkMgnDH5dAFvkbdSlAO0Bl5NJVdYdwNpsurwCeUI71pXJ9O7Q1icRx
	zgqpDYRZIe5IeBGPOlxzV9Bsn0vbtVgWJuPNqjb62/mfzebDrpoFBZkJ2JZNuYwHCABP8fp0s98
	xK7/lgCpCwxTKU7ydHdmxXJS4NrqFbnbyBOxN7LrDkUzxDpBJlq97O1DHoyjUosxixW6dxxBYLy
	PsrigXi8+LpMRHptlYfN+AIc=
X-Received: by 2002:a05:7301:4342:b0:2ae:605b:d530 with SMTP id
 5a478bee46e88-2b6f70d3a61mr1184164eec.6.1768924107387; Tue, 20 Jan 2026
 07:48:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <CANiq72n9tSMFW1KHsLBLM-q47+4f7yM70CVFNVeg_3Q8i3RTvw@mail.gmail.com>
 <DFTGHU40Q7GS.2YXW1OUFRM2ML@kernel.org> <CANiq72=PWw6MW8NiHtFPmQ5C8xjzVJf2OOpVP2YQbsFqrB4XMA@mail.gmail.com>
 <DFTHCJYQHUHD.24MJ2SUFZDLTJ@kernel.org> <CANiq72m2tU-Zuv_MjLdjfK0qjE45YnuMmTTtrbzmrQ3=84ei=Q@mail.gmail.com>
 <DFTITPLFU1HB.3VCKBVLW2VCPI@kernel.org>
In-Reply-To: <DFTITPLFU1HB.3VCKBVLW2VCPI@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 16:48:15 +0100
X-Gm-Features: AZwV_QhhJK4UHBThj1zoWBcmtcNJ191v2d59EfoJ0Rnu-qpyRGh0hYU_h8TWd5Q
Message-ID: <CANiq72ny=huNUmM7_1XjFyXZ_zvTFiAGwx4UB_dOxSaUx5VwOg@mail.gmail.com>
Subject: Re: [PATCH 0/6] rust: add `bitfield!` and `register!` macros
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 4:27=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> I think it's just about pasting the current bitfield work into register.r=
s, such
> that it can only be used from there. In a follow up we can work out how i=
t
> should turn out finally and have to patches: 1. introduce bitfield.rs and=
 2.
> move register!() to use the code from bitfield.rs.

Hmm... I am generally not a fan of putting local code. I know you did
it for the DRM `register!` itself, which is fine given the constraints
you have, but here perhaps we could put it in the right file but as
private/hidden as possible just to be used by the other file?

i.e. that way we can debate improvements on top of what we have,
rather than having a move or new code and a drop of the old one?

I mention this since you say "pasting", i.e. I guess it is still
smaller, but it sounds like you would essentially use it more or less
as-is?

> The register!() macro code is worked on by Alex for about 10 month in nov=
a-core,
> the first RFC for general I/O infrastructure is from March 2025 and the c=
urrent
> series has been discussed on the list for about two cycles.

I meant the `bitfield!` one, i.e. landing the patches as they are here
if we get very fast agreement etc. etc. I can see that possibility,
especially if private/hidden.

> You mean a tag with the bitfield!() code? Yeah, that would help if we don=
't make
> it this cycle.

Yeah.

Cheers,
Miguel
