Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C860226AF6
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 15:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732290853; cv=none; b=h91fU2/Cmv3savIdtb925K4Yr4g/QZyfvu7iA6Yi1TqD1FLCkxUzmfjvlNytq260OkXndfvg5dGEMiLO14oJ6MnSyEZgJqMpRgsT/0gVqiJLYJ1IO4j7EhBYFoiUnnEIZnjyyJYv4nNjf6hNR/R3E853kQPBLBWm38dqNfL3YKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732290853; c=relaxed/simple;
	bh=QVq5KFgL/UUdZVEO72cnRHkBo+D4+LvJLmuOecN8AIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gh2cdYlaL9IHfLihdA8RVDEFR8RtxVvbQinSzeiVC57GcA7LdFjOGalc/d9v4AnwQfwCJDP/grC/HFjbHSWOMxhOt0NjOJKo/wRG7vjax+rrZaWx+QLG0JXyBWURlZdci3qe57GUp/BdyPR2uxebty7MiNV6MbXsEo0RNWxC9+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3ezGqiQZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3ezGqiQZ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38231f84dccso1577163f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 07:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732290850; x=1732895650; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHBTAP93QaIBDXulWGODeivaCePNLj+7NuQRGSnsUCI=;
        b=3ezGqiQZW6neci7zy/DKcacep2NFwEUOp2ISc1VmFvij8A0+HaWCTaUsZsWi0iiO9B
         +m87lv/+NSPIkladkCJIYp1ru1odYNiOE41umI1Vt20K+T+TlsPjfO99b+A/+JaykcmX
         ep7zP84+ffmctu2r3n2o2w9IXxXoYr3AnR9jH4epfRmGrycTOoZ2dXuUED7YvyynFu6U
         aNxDH7OTcnDZoNYOcsgfHZgXQ4sas6oY28xsL1LfnkgrPsrDw5xxHiXcDZbBumYK1lyh
         df3+eSnwTaFTNb4qWAVUAu9OeyhJW26bH/hEuGVGPeeUbCgyboilN2LTotgqdTnTki1q
         mHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732290850; x=1732895650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHBTAP93QaIBDXulWGODeivaCePNLj+7NuQRGSnsUCI=;
        b=e2yK99FFRC7UrMfY1POshNvVE1rI2YdzHnTgVC0Ex1EKfeCyJlxuvO0Z/bPjDpmlCj
         lqykHLu0bycUjs0A3rWshZhwkSTXv4pcDM8agW9Qx40Cdc95zKrZf5DoM6TDGU+L3Q/K
         FfUH6SXWWO+jo/SzFh16xkM3zJg8iROUGuS/RpmExul7vKyuRIcQRKtcRag64w54ZJCE
         fbGuhxAdwwATiqEp4Md42bevU9123EJ5WSfk5M714uh+2272OvhwdpgHdMJ1vNnziKXU
         v4PI/LveysEclkiGxa1xznXNPNkbZAA5x6iL7YYGaq1dShmyoTY0380agBrKh+/0+tai
         sDvg==
X-Forwarded-Encrypted: i=1; AJvYcCU+cBenWur6kK3GdikrMlBWXep9LYmejj0Man0gxtSAY4ZrYlDevlNN8l3DVF3RnL46bHo9/b4kTTLcOjXBxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiIhCRaU4uNKRS+ECgEKrgs7+u2UE89OcV+Q2fK347uKsWdg6t
	7C2yuoGIVg5OD1O/DN8UaOrXWoVeP5iySRx9FtkrKbMyKLJpXfSH1XcNAf2q42nqHGBk5mp3jTM
	vuqPrHvTjTi1BQyLZEC5Uf36BZnDgqHNtkIhA
X-Gm-Gg: ASbGncspawzy99Q5fq3h7BcxrbPonAlIKuc16vrvuKpgRkbIGda4Ffva0ILyxpvloYz
	5mYKX19igTTGwgTxXvPGLo9H4x3zWPdNv
X-Google-Smtp-Source: AGHT+IEcuG0i0OmqqiSqqKVO0WuWikpbjy8X2Ivl9jcnoCFeKPdNRQPrawD+zGaNnWE7FPTBKZ3WMQbtEUO3d5UYyj0=
X-Received: by 2002:a05:6000:184e:b0:382:2242:7a8 with SMTP id
 ffacd0b85a97d-38260bcb00cmr3039059f8f.40.1732290850040; Fri, 22 Nov 2024
 07:54:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241122-vma-v9-0-7127bfcdd54e@google.com> <20241122-vma-v9-8-7127bfcdd54e@google.com>
In-Reply-To: <20241122-vma-v9-8-7127bfcdd54e@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 22 Nov 2024 16:53:58 +0100
Message-ID: <CAH5fLgguMwp=jfSG=BSDWxCVO7cd2MQVfLsFLH2byDBJVZbOfg@mail.gmail.com>
Subject: Re: [PATCH v9 8/8] task: rust: rework how current is accessed
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 4:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Introduce a new type called `CurrentTask` that lets you perform various
> operations that are only safe on the `current` task. Use the new type to
> provide a way to access the current mm without incrementing its
> refcount.
>
> With this change, you can write stuff such as
>
>         let vma =3D current!().mm().lock_vma_under_rcu(addr);
>
> without incrementing any refcounts.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Oh, that's awkward, I was testing this change using a config file that
was missing CONFIG_RUST=3Dy, so it didn't compile the code at all. You
need the following imports for this to work:

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 103d235eb844..60659076997a 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -7,7 +7,8 @@
 use crate::{
     bindings,
     ffi::{c_int, c_long, c_uint},
-    types::{NotThreadSafe, Opaque},
+    mm::MmWithUser,
+    types::Opaque,
 };
 use core::{
     cmp::{Eq, PartialEq},

Otherwise the code should be correct. You can fetch the tree with this fixe=
d at:
https://github.com/Darksonn/linux/commits/b4/vma/

I'll fix it in the next version, but I will wait for review before I send t=
hat.

Alice
