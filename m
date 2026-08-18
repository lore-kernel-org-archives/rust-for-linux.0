Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1C32DEA86
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 06:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787035286; cv=pass; b=eLuZSCMOF+LCC8fNj/FTsipTOiBa6fY6iApnWUG5tNMaCtDhCHogMtT+NLh8ibjYoWU8gF0lhSgLFeSweDh1NS4u0V266G6Bf/b/idWloe7j1CIReCqbkazuIDUF+HK7zB0VdDtyoq0uQ8/dU4faJiRMVrospKt7XbfUU3SFP+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787035286; c=relaxed/simple;
	bh=F66vDlwnqNRvpNa85V4+GIKOYUyq40PQaHNUdB5z/NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+uHuGhiAIG498x/9WkXJx4tkdpdAwyHktTHe1cda0EYcJpYodWnOIIlhwzNBxHzXMhjAPhldxg/h/XsbU9UWnc0md4votx6DqWRpgvtsh5WpLPBQEAw90TcLh4+JtD+E/s/2c6lElcgDGqqYAQEP1d8GN5pdynNGcPiuvuvQmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEkx1lrU; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEkx1lrU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d590f4c291so3264275ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 23:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787035284; cv=none;
        d=google.com; s=arc-20260327;
        b=mou8YbKzL09G7eCG9nBvaeQof7AHxioA7hcX0I6VzQys7XWf55LH2IE4rt3bjNfVjS
         kf7rQpTQmYDY31IcHrywW0w0/tkcWk/d8qUcsiOa8u371lvPBkKFlAxzVRVNrFRw9hv4
         vEW6CbIlcno++xlaGL7U3afNgI3FANtVKQmJLFSm4x46NYEpXDvTbPBhEP6MEdUZ+wJ7
         6BPTKJlkMzj+cgL2uXoS6nW7KHcGgIV+MNBKdNTR0g/vqZMrVDYnXZ5mNM1rhHOF6SmR
         J3cbRrhtW9M7xB+PQJP2RGmQfC7d5E9PMpyS8M5zctbX/1qrPaxSPsil7vaxum7T85Ws
         0dHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F66vDlwnqNRvpNa85V4+GIKOYUyq40PQaHNUdB5z/NM=;
        fh=9afj5Kd7vq6ZUqJZYJBZgTjMZfBRZmSgz76aFcSVhNI=;
        b=eEb5HlARCQff84BgQMFWGVhQi49EyogbVHAb0FvPUd4wjnxnjL0H3aYicWQhtm6EHG
         cutDwoqrZGIaJ9GxlJUff6cG38jenDndKkJtjv0NBMfozDIVyYR/R8VpiAWDcqCIT507
         18BN59/EZXLjFAJo1YlVpuri53NKfuGnvJpuGHbiwZLz3wKjitf7tUAicjhSTiXKYAdB
         CoBEfftBNwgpPy+g698xF2nWD/i0vPuRE65wNi6JyiHVQfJ+tjg/5U5IGCbPCv3s9Elk
         bpd6sMVi99DIODxEvE3iLUYzvSVE2gVkzReJnD4caaqzXKuHFa/3/oZKgf7hX56iebp/
         /Dcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787035284; x=1787640084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F66vDlwnqNRvpNa85V4+GIKOYUyq40PQaHNUdB5z/NM=;
        b=WEkx1lrUEIgROSpVvB/3XI4qrk3epckAJWHJLi6ogBj8snFTz0vPNkyKEKMqFA82iQ
         LRgfIbLxypw5n6Eypyk3GWZuFW57+dS8entJrRgb8wQ7T6AXH8bleIuqDRF1wRcEZ0hA
         IGtbNL0bDd+vL5QyKcQxfngqYiX6PAXrlbzccKjrz/tqhJnWpvM307dtoak6Cvv4CeeT
         VBt82hf5KeQueO5WhifbchWjCvzxu2xV5cmJwUmNew+00ZmQjzeS7lBywUsrOxyDOR3E
         iknR5W6AYzM3DblfnjB33uO5vT/GlhKerhu/NVATYUZLlmf1x4b+aPqP6ZJDW/nH7rBB
         ZeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787035284; x=1787640084;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F66vDlwnqNRvpNa85V4+GIKOYUyq40PQaHNUdB5z/NM=;
        b=FVd9EHgY5sk/SrERYs6/cCTfZki8RFOHBcUgukBgYne633NnXSQhiiOefM/mwXMTij
         Hpt6leguI428wHWwQUPFGuj8AgVsbP0kAVlGMKwJyuXiUW0F7vDvErS6sMhdr6NW+A6L
         5TRlWsxhNKbxLfuKuX3Mb+MolVUcpbRPKxp7MTrVx1bAxqHmpVlKAQ1VDlbjEsauEsVG
         lg2WTXmNFsF6snBYE4q357UDM+y5Vf9whLfsUXWlD/fTxQr0aonjSLfJBQg+VXRfx9FQ
         QLMJPhcYUakVIxQlCJfSNdPe3Dx+Qqvg96Ya/gM5Fv4F9FbRRoD46BJeXGG5Tq3V7Acn
         6aaw==
X-Forwarded-Encrypted: i=1; AHgh+RoWEII+uuZGz5yYKxamiTtONSmosmBuDXBt+SvEtVCKKBleapuBjyCwdyWkaKKQUGrUwh/7mGks3SdJAxJHCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Zo/AVagTsNGCq5Olk4qDNAOSOZOEHWiBCaHq+Cdos+zbHrRc
	sGNX3jOe7sxm9L5ODvXuSlcqnJf72W/BQkUJTC8v3BpwaLMAW7DBJg74P5MVBPwtvtgnakMJ9jD
	ZUUmBrOsRT+Ij77AytlbkgShTgNMxuvg=
X-Gm-Gg: AR+sD12Ry8chK5+pIokAZy9nrc6G359LaCJgevquSSHiiKlGv0JtPPheC/l9kFZ1voB
	V80C30hXx+Vlmg5YOqBtTQS4OS/5H2Ix7btNBtwz7bo0H32Ckkfp1n9DcVmCI9piPSAJFVBPbKk
	FHUuvH+B4eV6OquUpTZ/0PdO7uvT0tqXgPsgQnBwelLmj8Ywup9xRXxWXkaMiLODAKG+sizu3WN
	r7AR5H61i/i/WY8wYgcmoXc71MCXeO6pLbN2rfD/ISc+ENUNdgLrA581YJ/3Wemjr/kxTgNJ9Vb
	GiMqF26guNqpKVGjgUF2fjAuccQDK8GpzveoHcmnoHRwa1GiaftES13z0xT72k+nAFd6+s8oRTS
	i1SaIRwSgelZz4kWB8TWB3gnlJ4GRSbOOX9C7dVQRdibXcqBf7pg+T1IHQxYxb2OjxNWVQq4=
X-Received: by 2002:a17:902:e54c:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d3b0503575mr218175045ad.0.1787035284410; Mon, 17 Aug 2026
 23:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DKOECWHEEAK1.3N3JXH9MH7Q58@nvidia.com> <an7bG2bEd28AbNRr@yury>
 <an8r4VECQ8iFP8ze@yury> <DKR0ZNGYW9IT.37N7TEN97GG3N@nvidia.com>
 <DKR5W5DGAWAJ.38LHLLNPO9R4W@garyguo.net> <DKR6EB8OWPXG.2QYAY81UG1RF3@kernel.org>
 <DKR724N9V3Z8.1HJP6NJC5A4ZK@nvidia.com> <DKR7N2LLIQZH.25F7VF4CET6PO@kernel.org>
 <DKR8MCRB76L2.1TV4D7261PVTH@garyguo.net> <DKRA0IU4WVW1.3AOKCY38VHTKZ@kernel.org>
 <aoON0FepAUw1b003@yury>
In-Reply-To: <aoON0FepAUw1b003@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 08:41:09 +0200
X-Gm-Features: AcwNN1XoW3I66H8usbqd_WxG6tEFGRwBY_Sn9lhKHblIF3shDY3QyhmlBc9AX_0
Message-ID: <CANiq72nFwdXcN+C8nJhd5Yq-cdUp1CDw_2u-D+zkgvW1-a5dLQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add ChannelIdPool
To: Yury Norov <ynorov@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 12:40=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wro=
te:
>
> Again, any kernel API trusts it's caller. It holds for assembler,
> for C, and I don't see any reason why it shouldn't hold for Rust.

Because the more you trust callers, the more complexity you are adding
to keep everything dancing in sync, and thus the more perfect you have
to be on every subsequent patch that modifies any code.

So this is all about not having to trust callers as much as possible
-- the point of using Rust in the kernel is to prevent mistakes using
the stronger type system.

And preventing mistakes is not just about memory safety. That is, even
if `f(0)` is not UB, we still want to consider whether it is worth
using the type system to prevent such an input.

In other words, yes, restricting inputs to functions as much as
possible allows us to convert certain functions from unsafe to safe
ones, but it doesn't mean we have to stop there: we use the type
system to prevent other mistakes too.

We can even have types that do not restrict in any way the inputs
value-wise, i.e. they may be pure wrappers of a primitive integer, to
prevent mishandling such as passing the wrong kind of unit or mixing
up two parameters.

Now, particular cases may or may not be worth it, but the general
principle stands.

Cheers,
Miguel
