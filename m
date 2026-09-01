Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1232418340
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 15:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275356; cv=pass; b=X66WOpzeuluEsmg4n6YPzpQIpDjkLPlKRgzDYD0faf3LR7qgUSeR6NZkrKwoDPddwrTCyneBVpqzmawc8jBMS1aRjOo++76llE9T0oSjH9WKbFPcju6lPYpoTBptcnQUqi6jhyP9z1i2F1SZL+yRuQIyDGKmol9gAPQ7KJFREK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275356; c=relaxed/simple;
	bh=hp3yESPtXxrcu2bjHF262KdS0dcVGfMdnTb9S+Ess5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aPXjCrKpROc8vrI+6S1yukIMlYBtQykNilISQZgQVSe4a/tE5DU3nKLQG1Z2GDJbZ60ur4qAqnteu49JuRFSJRDBH8vFbackxMm3rFRmXv1ZRiL+I6eo+FxRa7yBVhMWbXOWTb7+bl01f+qAOsnFfCPhbt1rr0pgy1nOapuUYGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7k52jFc; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7k52jFc"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-467a6834028so2589113fac.1
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 08:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788275354; cv=none;
        d=google.com; s=arc-20260327;
        b=adeE0OrnijA5jREm6PZmRPvLbv1Bz4hi+jcGyHlQTR6NJY73MkZggqwcEOwe9zw+5V
         auVTWmaFyT4Yu0JgLIHlJMYbMgqeY57khFzSsQxEcM0/bgucnssJAu8vg1QtKThRGS0M
         teOs5zXlCfewndhNEoyBMTodCo7cVbLqT8T5faEvYFeHtkm8hKMM3xMV6/UA12JfNWcb
         gSuQovJAWaKVnVuoPo30jgnmP20MEMwbuU12ZY5dnUKX9aYh4v5ulD6XuSnVIW1tcbms
         bbvzC2PHiR0dCIaMg3CtIbdw5UAYkJxD4XqFDL7oBBmbUndYqPi+qDtPdShcBNWKDjWx
         bvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hp3yESPtXxrcu2bjHF262KdS0dcVGfMdnTb9S+Ess5U=;
        fh=D2C539dNxeK+NrienOoXYp51GS1bI6++bl5XgfCy4y0=;
        b=n8R9tFuh1gg/vlrcrkdRUUulYacoEq6C6pMi+4iLZhR116ZRwUffSuCTvast2x1P16
         872Lz9B3FUEm9zftqQmiyEQ2ANS8AOGb4by1xveVBgg4lv0T6MXRjC1s9RAuvhFHVaXj
         X1Of1OwxY/k8Yg9ELl9Or972q7mMkNBSZlUZQBVEqDe/kpoMfLvMJ1vA7J5luG4jRmJw
         K3KuNFsJrRfAzxeL+L8WFjLjXQXBY9rHUuCKBdjFW4EOlLI8DwGcpHkz7+o/eyFKtySd
         6wuro0z8OCXjKy5i3LZTT/shu+r0aClSL5ntGrTgWQDp6qlxgx7dezljF2ZDZeEleS2A
         +73w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275354; x=1788880154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hp3yESPtXxrcu2bjHF262KdS0dcVGfMdnTb9S+Ess5U=;
        b=E7k52jFcXuybJamK9AMtxlx9DV/aPCHG0tD3QuAoGyOr1mwvcd6mvp9MCvFb4hgbv4
         NE+FZvupa9VWS73DWcs+QoUPPT3f/MfUHHfFvrPQAvuoCWnNpYv+M/5wD0lv8o+yFwtM
         By/KZyv4EvBnMYk/gGTcaghzXVKoN1+hyLH72CYbnr1ecLT7RiZDI5imXlgTuSvpEUK6
         JIxBGNykkZ1xoPHQKeL9B+mJ1HcwXmfQBSuQbbdWBtiwLHQD0H/62/UiZCT5hUnOkR65
         t3xUjiXgsmYVdHboK7B2bhUsrdEUa7lExzG9pjmtU5fZkLAc3yIJ8S+OABapDyI5R7uI
         40Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275354; x=1788880154;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hp3yESPtXxrcu2bjHF262KdS0dcVGfMdnTb9S+Ess5U=;
        b=QXiI+YSBL//7pzkyJ17J/MmKr4f0g75M3QxSQ8DJFx0gv7DRiCG3XEpLL/MGfCsA4T
         NrpCiSHxEsVF3FtqQ9tjw7Yr5UYVywA84wUfC9qLHOj9VxuZwgszDAKFVG8bO2YQUwbs
         zKOSJFx+KP2tEKH4DBUrPM0XD7edIXvMptR7F3ysMizttySBer3n1Z9YyOQaksicGgj5
         msm8MgbmlWD1VByjvwxz/BT2swp2RM/wBv4kX2xVAdb33q/wcJcX1Ys+4gmp0lHdjJ1X
         8ISY3MK9BJyd9UjP4gqwl9Pdjkn4j/9cyl8j05zgsrjU2PzD6gKnKrlKbGGd7yFWZZ0x
         9wIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpotRviqcsWigoUOBGAudKXR7Ff+SCjRZcXBc1XjX5qXEy44dzywIhiwEbEgyCYYqc5Juoy8jfV+p8tNBUItw==@vger.kernel.org
X-Gm-Message-State: AFuF++kinXI4CHRsXep7FjY5gH/Wm/HK5WDn5Pte9KnKWRU2HUjYAX4i
	vbBiBX/1VF5jhksjzzpfAZzbTXyQwp7ofqR2V3BOWL7SVy7vWXP7RehG/eWm/UI4i/ezyXvo1Dt
	5wxd6QXo0abhQatLOIN+emWr/WcvFDVk=
X-Gm-Gg: AR+sD10x4fiQ+GpqbZB8RlTyqV10zjicM15MrvWrm1Il5HvEnrdS5/2MpG4C0/eDBnr
	0BsY3dJi9gGXA3NJ3RmuYIyT04XXIWMIvkC8qR3alTsbI7quiVYwx4xKlh44BxgCiHGHDHfGymN
	li8QjbVVrPlQQZM6H3LXRYADofuo5IcWP3gWme0fbvxUKivbhwmsNDzVRoLgzAuP6pO0ptLRh5S
	3LYbWaoqygQKYP8g8MQbgbQzCn9j/Ehp8U86IJAhxHfWUW63A/WFAoMcf7vTx+2AnZg5t0tjPxK
	cCxAw00oFOvDIUR3nU47BrO1C4Xi9lkVWy6SeWSF13Ar0zqEohnn9OXWU61F7TWzAYd+RsDgTka
	c55s=
X-Received: by 2002:a05:6870:c44:b0:466:d80c:8b75 with SMTP id
 586e51a60fabf-46af571d645mr9719754fac.14.1788275353705; Tue, 01 Sep 2026
 08:09:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828133543.2259029-1-georgeandrout13@gmail.com>
 <DL2Q7DG3HIF1.6IU0VQX54L2A@nvidia.com> <CANiq72nh1MtnUU=sDVjRAEc3DxAmKcd21cdPohPwjDizujngFg@mail.gmail.com>
In-Reply-To: <CANiq72nh1MtnUU=sDVjRAEc3DxAmKcd21cdPohPwjDizujngFg@mail.gmail.com>
From: George Androutsopoulos <georgeandrout13@gmail.com>
Date: Tue, 1 Sep 2026 11:09:02 -0400
X-Gm-Features: AcwNN1XS4up07Fc3-W_8FN4ZC1H-wwj8itghp6SyGxm2ldsv6CBH-6FjbsX5prk
Message-ID: <CAESH5ocNhHk-vNSH+kODfxuUpo26AO_uPao-8qR3bk=Kw-c3sw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: bitmap: document panics in `next_bit` and `next_zero_bit`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:48=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> Maybe -- it depends on whether we consider this kind of documentation
> hole a bug or not. But if we do, then we want a Fixes: too.

I lean towards treating that as a bug and sending a v3 with `Closes:`
and `Fixes:`.

These are public `kernel` crate functions intended for driver authors,
and nothing in their documentation indicated they could panic. Finding
that out required reading the body and following it into
`bitmap_assert!`. For `next_bit()` and `next_zero_bit()` the docs went
further and stated that `None` is returned for exactly the input that
panics when `CONFIG_RUST_BITMAP_HARDENED` is enabled.

The same question applies to the `id_pool` patch ("rust: id_pool:
document panics in `find_unused_id` and `release_id`"), where the
docs were silent rather than contradictory.

Thanks,
Georgios
