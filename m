Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795593480;
	b=H3+YqzOd1FwjH7XuOxgzWUd0kxm3/jot+1HUkxlg6BCCcIQoT+cJxUz26I5IyOSopnZp
	 R+XvGn0tT2M5uCyeqnfn5oamhYOFr0wDjsMjdos4kY+mcU78NBZEDvHlS328zQ8mB5kqy
	 5TGCBx3mJrymSFZKMPZB/K9C9cnK0MDhtcOVS70Qc4Z/4iHAYBHF9BTZ9eFvJ+o2UbXjp
	 bEzuoEQrQaY6zVdDFLYYLYfEIYytwCd5K/FUvsdDmxlYnCuYTvfXWnqPO8RyiqgNEw8HM
	 5ZHVj6eUSXA4F65pBLxIqKwZzU36UyDoi+3n11HFW6ILC5RR1eQcoq5UWbNjaUvGt8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:X-Google-Nh-Sender:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=ul5eVM6to8I5k6j4gyfBybKY8kBadnDIJAoBs2N8ESE=;
	b=AOcDYQ4wDMwAvkZ9GIpEfRFCD2n+n86XAbUtCt9oIUYaogSYzEpQYTvvzT0cUxjul0cZ
	 Suc93umKtkZqT0W+cMUjhiFmWEWTh57VTdL9lALdMXv5ZE5mL6WjOJS0b1G0nLu4pr1Vp
	 ziGrQ0WOnYiauwNtiZa4VffvWRuXLxFgfO8YpD/TLIE3IHCYRFKeHF2NtodJhkcT5WhgH
	 QRhX6ciMIlt2Rq003s9ADSv4OgOb04fiUWEmta1PMe3vJj5xGui4/OhcGefEi4lbOCLIC
	 5ZXUcxqzN25gk3nAfHqgoFc+40Ni7TTEdJ8DeMKUdJZ5N9PPFHK/9D2mxss2T2SmBNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="os1wA2k/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA490606A323
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 07:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA490606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=os1wA2k/
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4fb5d96b3so84074077b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 23:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795593478; cv=none;
        d=google.com; s=arc-20260327;
        b=MROeclewz0VP41hogQdZGKLtqF7Q6QV8R9NuesZCLSu+9gV0cDQWtlQ2RwLNtN563Z
         LXcpbbGUXpyv8cRb2YziJma6NAzpJi0FSFAwxCGVJRQzi1v5/cVpXbe5vSktqV0X3zUV
         G1NEjLztx9s0RvoVxPtdujXMPCKtMC5zLDU1Mp2OVw1+CDP4ACLrJtQIOv2U7g2Pdsv0
         NknwVWnV9MCEjZReUmq7k0S7B+5LZxh9Kea2oYixuU7pjZb4eOmj7UpI3DUER4uCpAyx
         /VeForQSqfzud8pstvLsW+ASJHNgCDEHHDt5BFWVVivC8Q6eq0zZvA6/1Sylis+VOfB8
         bgxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :in-reply-to:from:mime-version:dkim-signature;
        bh=ul5eVM6to8I5k6j4gyfBybKY8kBadnDIJAoBs2N8ESE=;
        fh=xSZFJpwkV0ZKOIYOYlgsT7hzADEEHMOwlOBYF16RNy0=;
        b=ohKebRfY8ccH0NUn+IY2d0okKAtu8bEmoDlEdh09mSABHjxxmIjUmEALozs4Xez8sg
         d0bRdghx5z4aeDDKg1EDtyY1AvK2Ga77gYFe/vahY0I6RO5BJcVxsMOw0fj31l2/FGiQ
         C/BbDvtHY3nMtTJ+YzNcj1S1lHVK5ltaRmPN5SIgNAL3Ykpmaa+8vUXmyeE1NqiyH3oe
         Wm9yvFQfNRNhiU9pmuTPlv7eso0awj0GyqHdNWX2F9yEPcKeQkiJ+axx7+AMgGuz9gjz
         Bo9rqzaD18Bm6dd4UyY0RXnZZb7lZAfu/o8UNzukssd/AAHtxUCmuHAj+cFBS9p2uDGL
         05iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593478; x=1796198278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ul5eVM6to8I5k6j4gyfBybKY8kBadnDIJAoBs2N8ESE=;
        b=os1wA2k/HDuNvLOaitHw6lCGdTi+dEc/77bcad7q/Cu5ogAwKJHE0EweBTKXoYNZ3q
         jVXKK6GCAyaD0jVtVZdL6H8f9BvyREOelAZj4bOmo6musSrOQcm2I6qtPKZYmANkJgtf
         PAtdjK+LHTv+2YwVQSJlID2FQUl7YFH8HK9PY92IFdTQo1peOEG3/+yyU0GTEDvavyhu
         DdS4bs9nslw9cHJwgvc92uZLmExB7pc27FAXPhQU3udgT9wH37yd+CXniwBi9lGXDgeM
         ykdBgdC2bYVbCE2YR+bk9LjUvXp6KtbtEVJR8EhGZ+WOYv9aCoikhvZq1yZ6D3IgMA52
         YXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593478; x=1796198278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:references:in-reply-to:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ul5eVM6to8I5k6j4gyfBybKY8kBadnDIJAoBs2N8ESE=;
        b=efz9c/quuNupBPXaKhrtXTy21EOEmCCUp+wf4CJz5u9ji35IILaIj79KeHcZy55l5n
         egSv2oesO8ags1g45n/qAfE74yxzbmg+ngWjoQ3w3VUeGs3RKdIGlGbKlUwr2G/UFcqP
         hzaSWFgwnwcSKCOlt9qSuu3LNwAgdtyttpqPYTzZVCSIjj6kX6tT9UQ79O5bPSdH8vNk
         Rh/7ru9OAW38CIUoxm7kRAamRpU3LAow92/U4leqgnlmsopMiG0HktQ/DvMbSP2Gz+15
         eIq6yI5naPsJlksxScyTWNBED6sQEen8shfqisl1lRGUZZwbQCp7VTyEWoQkFgs5MXmc
         FZuQ==
X-Forwarded-Encrypted: i=1; AL+hErFPzxdDEYp0wf9D0SyqGUEUsYZgHiacviJF0qZPXI1Z5CQ/o/W9rEokHt7pLFZMmQVnU/I802vJ1MYV5sw8fA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8vNWojiAFE/U5NJCuMduRMjpnXdnovLKuOBtP7sJ0a2HtB9GAt
	sg3xnW2nNAXZFQdo0nSckvYpbiMn77Bi7b7mxVxUAKIK6W7MxjexkB/hWVeXq0RTfSthSOKx11b
	PaiYqGc44I5QBNr5uRH/96o1InfWWR3w=
X-Gm-Gg: AZFdTZcqWH32GnLR+oC74wo0UQPBiXg3T2xz1ShqgDTNXIXrKKDf6uT7u9Gx//ym1Qs
	ENgtWM7YQr9pzrTw1u3E7LT6KTMven7dILLdIcDTzHMBxJ7o3hdLrtO8hQYCnKciq//CLeAEqyH
	8wP2JulxegHIV5K0L1W8fP3ltxUi/Z9yuQLwK8CH3bYAbAFL4b25GT4IFtjym1uJ4TSxyTPuJmh
	avwYYPgSTJOmsbQyXFF8J906WdFn1tKR9vgmp0yoFWF+NXVyWBIFCD6zWqEBGk+nFNYvZpRL+N1
	BVwMQirKxk3lkyVXjKq/GB1uW+G7YqPs7SSa/b884dK4sOZ9ieTArex3RaY5EuOqsBeqRSKM/3Q
	7MB3sEUzgKQh3ZkXm2CA6KDPrRpe3uR6mO+VqFjW5VBs7NEzW1BabeWGux2AXho/bTTkA9S4uwb
	MzkjCZW6nfy39vovOluPXhiH+KvQeU0RZCNoyFMkgapU7RjxRk+NivjjyxWLGNbFxYdoIDDwaT6
	LJG3UU=
X-Received: by 2002:a05:690c:60c4:b0:8b3:b01:74c3 with SMTP id
 00721157ae682-8b518f19782mr69361117b3.23.1795593477817; Tue, 24 Nov 2026
 23:57:57 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 25 Nov 2026 01:57:56 -0600
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: peder.bergan@gmail.com
In-Reply-To: <20261124185427.3821700-1-aliceryhl@google.com>
References: <20261119-fix-drm-rust-fdinfo-v1-1-c10f4134488d@gmail.com> <20261124185427.3821700-1-aliceryhl@google.com>
X-Google-Nh-Sender: AW_J_UoiGWtwg6qnqUMBw-OJ-1UVFEbjy0wfv5Rh44W6JIMxd7U4y8mFVkrNI5HtQOK7ljja6JOiAjS7xwkZiGXEFdl0Ulsl2DyARbLE2OBtjbGtkeGRZSW5XZ0J_3lGWC7feWPG6jWtexTx2GjMEIk-wJteUIn1NtnDiX31bUda1vsE4L49hwYvar3comaDfsQX3th1DE1l2TZIEwwsgH3CoUYV2ANOWtkRhrYjuGo-r5eEdHFq0arOpzb1pjIEWnQXWuL9
Date: Wed, 25 Nov 2026 01:57:56 -0600
X-Gm-Features: Aa3M54p1LUGsSOwrIWll983HQ7Jb_OQJyMjmYeIZbB_tbx53ZIZvkiW3hGwAhAA
Message-ID: <nh-b28a5938-34e4-4077-822b-71fae5f4773b@google.com>
Subject: Re: [PATCH] rust: drm: enable standard fdinfo for Rust drivers
To: Danilo Krummrich <dakr@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Asahi Lina <lina+kernel@asahilina.net>, Lyude Paul <lyude@redhat.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the reviews, and thanks Janne for testing on Asahi. I agree
that the Fixes tag should go.

Danilo, I=E2=80=99ve prepared a v2 against drm-rust-next with the callback =
in
UnregisteredDevice::FOPS. Would you like me to send it?

Peder


On Tue, 24 Nov 2026 18:54:27 +0000, Alice Ryhl <aliceryhl@google.com> wrote=
:
> On Thu, Nov 19, 2026 at 10:48:47AM +0100, Peder Bergan wrote:
> > DRM monitoring tools use drm-driver and drm-client-id in procfs fdinfo
> > to identify DRM clients. The common Rust DRM file operations leave
> > show_fdinfo unset, so these entries are missing for those clients.
> >
> > Set show_fdinfo to drm_show_fdinfo. The DRM core helper emits the
> > standard client information and calls the separate driver statistics
> > hook if the driver provides one.
> >
> > Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1266
> > Signed-off-by: Peder Bergan <peder.bergan@gmail.com>
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> Alice
