Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792527408;
	b=Kot/tEm1evvtbXowIxcb2F+i27tXz1jSRnAY0975g6VFBfxobeQbSO5lohtXrbuHCCJH
	 FAc5Tae0lnT8r3W5shs69IRp7VI8M6fxJ3Wr4CjZ6sRg58StjEej953B8MSL5AaZDYucO
	 iIfzbo7aiho38XVwGpwDMzfC2IAjkFDmSd4682W+h8kusNBYcDrdKst4pjdbpph3GBxTS
	 tGo7eNyF+DahbmBRfDqk7cu2IYd2kp98IyYq0fTUWaStQKrFCQO68zuTX1ELt1/tKt49U
	 g/b15NEpD6SCasenFrrBWUjmad3va3Dt/jS2PHVjHQvgw/ZxmbvaVYdtvmEs0LncNqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792527408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0h9M3TYjYg/Zu0GFYIpY3pxrKT9v+m/rFawThlx/TC8=;
	b=1kc07agN7SDQYSsRvDm5YPqofm/5IufAtkgYPpfjv0ChoBpS0E2a3W+Td8Mzw2R01VBQ
	 d61I+ltmryYcGS7njvgIvHIO/fxFRxh8N3T8ipsyzdQLNx97mneHz81GaKh2kvunn2m4z
	 RIJz8u/DH1er4/FpQ22s9iTAqwTBsnK/yoS8FY7TigPQ5etemxNOxV0C4N0UyZ9FJc9VN
	 4Va08cEK6oAXB40wdE5tTqcwSb4T9cLmhOvlmAkoihqCaF3F834ujul3coZJ3JL/DlmRK
	 vHUQXUBQZZWt3JcX5DW8hBqUajV6Ang85qmkcE0vmZLo4QXC7wz1FDar9jJQr0Zyr0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Rro8dZY6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CB0606A31A
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 20:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19CB0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Rro8dZY6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1de789b63so17305e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 13:16:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792527406; cv=none;
        d=google.com; s=arc-20260327;
        b=GItzbjOhbqHCfbs5JAgx942sfYFgTjPf9J0pVcaZa+tZnkGqn6rGOQVvJRv//nPtHj
         oOhL63JVEjrEDWsKXSv8cJQVLqF4EVjZCZ61m+jrd+M39r2Kw/V+bEtCn4bgEFDnhUZR
         v6rqOW9NU50glcMLzILlU2VjK8B0jtC1yF+EPkvI/WdSqpndUfOyV/+kXdaWBjBMOY6N
         T9v/uey9QIx3MNxuJpBEW6XQVNlDnD3gY0/sZ0baNYtqD5hO3zCS0PcMaiQ7w9RCNz47
         DhHFMQ6z3xzl9OIh9HSUYxbtMTeEjUqrgSvrfSB4Q+7dDEzUfy18fU0+p/fSoC45qcin
         Tuyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0h9M3TYjYg/Zu0GFYIpY3pxrKT9v+m/rFawThlx/TC8=;
        fh=rb06ez0JMpakl9e2XoGworLabi4fdFH6M9MVlZJ23GY=;
        b=mx3aucZVNRLioApa1Q6zSR7xXdxuzE6tNLcePqA7Je8hJVO3tnXwNihsH8/WogfVX2
         owf64oXohZUWzZTD1SR3jL2el2fZqEM9rgzY1cIW3ogRLQ6jnBvwdJQJdx+Q3m611Vx6
         2u/0Qn8eHMuefV0f80y00QWyqUREWDJUIj7kjBKWFaYMypUNv6mF3E3uhYdZlhg0bUXq
         GuqmKwH3+yDUeqITV283dvcLyLcmSUaJL/Tfrw3ki7XUY7LhXB4VnBb9jCMIvgSBt6yL
         M3qObUOP+/jEaKKE3EJk7d1hHkXTyX+sGH2wICPvpzflVu1TLdbK9vV1M1tX+4dRv7Qk
         qwmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792527406; x=1793132206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0h9M3TYjYg/Zu0GFYIpY3pxrKT9v+m/rFawThlx/TC8=;
        b=Rro8dZY6yl4AHc9wo5Vrysgk0rLLxepPlokWbH7DrBnLl6SRbHNoIpkulMS/zFx7By
         7cUJqZl00HgcjU9wPtT+KSCBuJKGhzsR1j5ZSRYKDALp0WbhQb9/HFhn7ly32KT05JY0
         tb/2IhrCHwfBNGd2eFvtPEh4fDDv/Hs9fL1prF410NMVNWshdLZfHyqG5Rfn9LWFboTZ
         g8C5Xg+XFUJh3e5ZQAWX6zV+f/A4B4iZk6ygUpCf2ZifapmvtmqckX44jGxW8T8H7H8G
         zqmqXhYmZO7nIaxnuk6u5YPZA0kE//bfkR8csgK3A60yNWn0lGE55iq6lZVT1Mapf3xN
         aZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792527406; x=1793132206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0h9M3TYjYg/Zu0GFYIpY3pxrKT9v+m/rFawThlx/TC8=;
        b=mcaiBR75cGkKVskjZ41QCk0Ejy7FYfofinnrT92lXPWzeGkKkFMQwCLW1XedIl+Asl
         hklNSifUjdoeyyegycVfNGEoWxH3W3ZeRAGgCbQjZ119aoLVnIlgTNmtAkoHldPoVE8X
         nSEmeCEcxfpDs4MK0UwcgU66q4C5lbvsSb2qAr3jZgFptvlrVs+SMi1QVTq+udKRIHy7
         AFQjsyjPmBXKcK7X7Kk32bl5Tzsnm4QsMmSdoTjuI04Lt9FhE3zFFZ/yVcDq3/QocJ6x
         CId98xFVEd0liAD8lLckYP84VkAix7oUXNmQHYcSISHmxfYlaQkEc+rM+qeLawb2ooCe
         dd/g==
X-Forwarded-Encrypted: i=1; AKwUvBw876pR1IUke2T+DSz1l/ytmA17EnlMVYzQjuNTmBCZey/xB86/bhRNNGYUHOK+3GN1bAoyD3o5niMnMOyW6g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKLU5t1b/9zBtZS6J5HiYd6t6x8+1+pNsfPV4qPlnrzx039S39a
	l3bicwLAn9fasqOhUwEOtDFzJJT3E6N1c3NGr/81yRJn6mZX5VPJ23YwamlW3UCKoI8YImFMG7C
	MJGVDCXlZ6kkV6JG+F/VWY5h3zv1UWvzyC7KZMXZb
X-Gm-Gg: AYBFou21L6NfWgRkSlylAKpD5UxwsMIT6C6mgT/DIG8bcCg/bDERrwPPkwdeSRyV3lB
	xqBuMCeqiYF7q4nVIXn/yOilgm2dR3W8NT7DWGpKTQf2vf/qffD+vTE9dxfP/WD1YDngswF8/GN
	Xf357DQwyFwin8zQaMCv62TbQGaetc+eJFOQHOUiYt1NSPHVBSTbBAl3bNoAfY4+WrRz+HjRc+g
	haSu5v+NXPecvnC+nMKJhCZgOsp2r9itnpt+AwtxyQp3muH/akopZ2rHCR8lRKGlyuDcUCINlAf
	PtQUPgaNLVt/SLT462OWjn5oUL0DVTIr3evnQ4VHuGmKV7qbJMiMZdTHUSLohED1fhDDdvFjwYv
	7tX2I8TaLgQ==
X-Received: by 2002:a05:600c:a402:b0:4a0:1ca4:2741 with SMTP id
 5b1f17b1804b1-4a1f598682bmr1067665e9.9.1792527406013; Tue, 20 Oct 2026
 13:16:46 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-rust-shmem-fixes-v1-1-3f7f6de5b5e7@google.com> <DM9O11JY63Q2.1U3PB5GL0JYOQ@garyguo.net>
In-Reply-To: <DM9O11JY63Q2.1U3PB5GL0JYOQ@garyguo.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 20 Oct 2026 13:16:08 -0700
X-Gm-Features: AclHuK-3k8j6k-bTltQ8cEj3qPss7TOR1d3Ms0fv42pBRizgtolJ9QhEZUGBs_k
Message-ID: <CABCJKuf=7aVKfC14cXymn-BBfvA--3cfWjpTnBY0orkic5NzRQ@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: gem: shmem: do not leak pages when sg_table() fails
To: Gary Guo <gary@garyguo.net>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 5:31=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Mon Oct 19, 2026 at 9:21 PM BST, Sami Tolvanen via B4 Relay wrote:
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > `SGTableMap::new()` takes a pages reference and maps the table before
> > `Devres::new()` allocates. If the allocation fails, dropping the map
> > frees the table but keeps the reference, and the next `sg_table()`
> > takes another one. `drm_gem_shmem_release()` puts only one, so the
> > pages leak.
>
> Sorry, could you explain it in more detail?
>
> Creating a SGTableMap and dropping it doesn't restore the state? If so, i=
t
> sounds like an API design issue.

Correct, SGTableMap::new() increments pages_use_count, but
__drm_gem_shmem_free_sgt_locked() doesn't decrement it in
SGTableMap::drop(). The count is only decremented when the object is
freed, in drm_gem_shmem_release(). This works unless Devres::new()
fails here and sg_table() is called again. I'm not sure if there's
some background that led to this design, but I do agree that it
probably could be more intuitive.

Sami
