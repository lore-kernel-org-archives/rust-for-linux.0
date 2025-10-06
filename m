Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180E21770A
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Oct 2025 16:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759768835; cv=none; b=NaEAFJpjjajfvI66qfBHcsjG5bpzYISJj6ob38/Vb68pUuxphL8SjOcnvTgLEoIbieiYxKmgF8DWSXi3psHUtiXeeC9ImxwRr1Oi1fBaOHReirL7fcBffmUEPBCUjkKAAWXiZuxF9xA2BC6djMQjndxPfG0yjSH9ucmMoVER4Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759768835; c=relaxed/simple;
	bh=veOdlZZAnBK5isc9zicCFKD4YiH6nvr7JBqv75sEnMg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIacGaA53COWHoTnrsKD0t+D4FwU8OnetXZXyfYtseW7guKAlFA9npClKXzOuXGqCqQjmIdjrVfUQueW2C1dcaB9WSZyyH6XO9yu06RnuhYh4JO/HQdKJjHz6Q0boW1fUT/O8pFg5LUAFW6jlr4gIc+ZiSOZ/16VcxdnFV8FwR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ehrut/i4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ehrut/i4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-280fc0e9f50so7234305ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Oct 2025 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759768833; x=1760373633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBA6fOaVmQat7EDMxIX5UPGSZ7U9w/6YSIQNIRnUw64=;
        b=Ehrut/i4r0bRwkjvO2cwH6tEuMQlvICJIDsNdYaEuXwWbYUQWgllbaEQsL+7BggVYV
         PIKf9aiE027/2JEyjtcb9v7kHACYzf0QYfrMaRMkBEeSoz0yYMB6z0JdnBRXgVWY0r2g
         SIAs7B/IdIQInY8h8yOwX2UNvMwDlZ+EfRTi078xAILFJ0I96x93DNpFSn5vN3NRNpQC
         zr3ilO4A5ThUCyJEiB8XH+K0+7YSc5FaT3IWdDcpcrpXSnmCfqKvPP3oWI8df1H+tLU8
         JeyutHRKKiZjxsuVRaEcoU2FaL+prMXYoeEPYC9FqjnLPkijYmPXx5GoAS7uvRZBZk0b
         xxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759768833; x=1760373633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBA6fOaVmQat7EDMxIX5UPGSZ7U9w/6YSIQNIRnUw64=;
        b=IY9/AFPyPmg3X/2WgUuVmSC1JpsyuH0wwglZ7U/mmUw/FVgHXpdtj1rk8WZb9KVNCA
         k104PFi/gk/sScMUM7pEJe2yEAOHGMUF+ms3KUXLnPF/nSE78sI0bNQ4s4wsw60+0CqA
         cJzJI3jXLJmg3yyuo5pGjcjp7GBknGWfXEc5ZCH5G5RZPJYxpME6SzdXMfTVXsnPGbgo
         4lAwvEVtzPym3mgPWYF+siHpYgyC/gBNWs5E15ApNls1U5ZkhbqTnqZENZ14OpY/TGWt
         kKJKPFL4oxBQCgMAjG0Kir2QAZjCXPICS+uFM7nNUCztLEg1nu9TTl7BedNxP2lzRmbq
         Fj1A==
X-Forwarded-Encrypted: i=1; AJvYcCUqPcOmUthISKb57QSwc7Fn4/bVhFJz+0MIy64qNfyBdiR6YxY2nOqVPJT8GLQSvVc60JbGOdr5LBAbAqC6pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwizKznJ1oqwTXtLGspn5S+jKyNBUvpyAMJtCxjFOL8lYDjyO7A
	MZl74dsYSOizMwJXh8P7tNfCDGi+mlRm4RsjWCn126UGnxvGdL4iQQ7J7O52gU9yv1GWNNQ/Gac
	uj/d3YB2vCmGZSHDYo6z0BzxpZvR0bzU=
X-Gm-Gg: ASbGncuaYLuNytMpJaA8aCXfWGgWPElMSRNJlihg/tVTPbH/C3DEhNEo1HowHG7YijF
	mdlAnLatUR2mKJs/gcgFEDOnnIjw0Yu2LoOqP2zyOYM3sSX7ZNXdLIfN9iIX7BLb8t35mroIchc
	OenY1iAuAlPcL1YLP9mp2Kbcyu4+XPbvRLZprWZlrkEBmBevU52BaWGad0me9lexa1xkmabQsEV
	S+4jShqY/jcyXDWQtlpRZbaLk/piYD5SbTSLwGQaWOT3tsxVNitMWKusNhhRx+PZmEQnqFrECWO
	mdWQMSWQysodlkv7BN1spwULlEk+MF+8vf2HLasMLEJPzKuSF9K69NA+hVjo
X-Google-Smtp-Source: AGHT+IED5q3x4DCSIrQmSNaI/hNM8JVZko4zCwH8pMSwHQyx8XQQtYie0DUOqb6XI3JebRYkGwAJqCnOXAShGoi26PE=
X-Received: by 2002:a17:902:d4cb:b0:25c:b66e:9c2a with SMTP id
 d9443c01a7336-28e9a6d01b1mr103155035ad.6.1759768833343; Mon, 06 Oct 2025
 09:40:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
 <20250930144537.3559207-7-joelagnelf@nvidia.com> <DD7GCYCZU3P3.1KK174S7MQ5BW@nvidia.com>
 <81490b32-6ea2-400f-a97e-ad2e33e6daab@nvidia.com> <DD949OHGD5WP.1X9TCLIEKSHGB@nvidia.com>
 <4324469D-4C47-441E-9AD3-54CEE379537C@nvidia.com>
In-Reply-To: <4324469D-4C47-441E-9AD3-54CEE379537C@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Oct 2025 18:40:20 +0200
X-Gm-Features: AS18NWCxy-Hq0OsmWL4xZOPiIrqjK1XDIHFlDGJPGtRa1Eva01va6UDuU96QULw
Message-ID: <CANiq72mC5pWz92KYtOhtgOcMuTeuzOeM9xrbkna+HkrwHAQqVw@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] rust: bitfield: Add KUNIT tests for bitfield
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	"joel@joelfernandes.org" <joel@joelfernandes.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Yury Norov <yury.norov@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Andrea Righi <arighi@nvidia.com>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 4, 2025 at 6:14=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Well, it can be efficient. It really depends. I have been contributing up=
stream for about 15 years if you see the git log, often when someone chats =
privately with me like you did and they told me they are ok with a patch, I=
 save them the trouble and add their review tag especially after they alrea=
dy added their tag to all my other patches. Surprisingly though this is pro=
bably the first time anyone has been pissed off about it.  Anyway I will no=
t add your tag henceforth unless you publicly reply (or you let me know oth=
erwise by chat).

If they just say they are OK with a patch, that would just mean an
Acked-by, not a Reviewed-by.

In any case, the documentation states those tags cannot be added
without permission -- if someone gives you a tag privately, it is best
that you tell them to please send it in the mailing list instead. That
way there is no confusion and others (including tooling, e.g.
patchwork and b4) can see it.

Thanks!

Cheers,
Miguel
