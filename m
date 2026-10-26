Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793039202;
	b=gcv7ZNNeOXZwnE4WDzdi29qapWtXnMyvw+5UfWpChzaVIR1iJWGEyryP8zK1y9/LFR60
	 DlRFxZLQFH9+KmmAOWuOkEOErgTUVXE/hb3aN/kfTuq2jJgZLhEfEomUDP0eWS55cBX9U
	 xdTeVGRjpSy9MNiY1QOm/CT2//YK0h1r95kpyMdqawYHBhC90O3gVnDltdchucwtRalBo
	 respQ0JM+IBeIlVl3cmcfQ+EoAFBw0FUPlWI1b4HiBwAtcgfJceqtvjmgDWfh8+wGath0
	 KI/z1VoxD+wvBOXpvrw73FinJB1PlnIVCOsyNz/2U5wHui8XTMlMOj2fbVjFwyY6sXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nY/Dg58kDlhRREyLtFBek1i7zB95DzfSYinza+ky90U=;
	b=oRUHLgx0MNaNJy6QZHZ1DcAjLXRaGmu4tpYu4LuCDzBK3DFTGPPaXOODPgH4MJmmFbEZ
	 Xir1YJxmetKNsvQlp3iDryGURKpJueMk8WpypH6RQqVVzit01Ft5lQbv4OpueOdOFdPz7
	 CnY7jEkSnCBkbmxQO3XjfnA8nd+6eheHPGasgiVhuSBR2kaMsPM3LlNdOxmPTlQhR8HjY
	 GzsGqilVnh0G6i79Ghkw73ay7rOmdxJ4dSl/ecRITyMlnsTXpj8R72EZfCSEZc9WjfGiu
	 Erau2AWFVU7rmyZ05hHX2DXoRzZFq/s6mysE3oEsZVVPv6hmpG/yTeJt2b6SGYxPdDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=MdaQFEyh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03647606A31A
	for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 18:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03647606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=MdaQFEyh
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53665358476so35670231cf.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Oct 2026 11:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793039201; cv=none;
        d=google.com; s=arc-20260327;
        b=Aupj8kDZhWky/6t9PZLoVpcLW99Ux114g7R0EcPJueYOVGZqm7pZjvRMdlqtQ1Hso7
         HzamIChlF2wPk89yzNCVBKLA9M+C/eTI4Xp7ihInWTM7DIyuynRkY/g5OOXYogkFCm7S
         8I34iyWcMY+B0Zc5f/ONUFoGphC/70a9bwcjbinQaqmEcy0kTbZRG4jsMjz8bRc9QqxK
         wCzMoPKetVMByt8K2SX+VGrA2lTsk0SQgDTSvRpSRqYzcTWFwPtRxr2TzM9FblTa3aGF
         M6wEapb3d1nPyPOggeu6hEmDjMBZ6b14H9nUUvef1GbicfRdO6zig9uwRG+tcuag0a2s
         TE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nY/Dg58kDlhRREyLtFBek1i7zB95DzfSYinza+ky90U=;
        fh=1oQWabvvYVXLU2bmohlbHO9gkgXZxPmzT1ofvCeRylM=;
        b=axcP4zjMWoZvIWCO2vLtS1K2WPuThqZWjVLMBkvv5z9GxszKcQfBEIHYlUE5PjDT6L
         G4e4nl8C6iEM7qypadqGEej5kQGzbyQktWVsni7ouVNc3uxPwmCwk6Yyekkh+PFCoePj
         gqmoDk7nZ/1MId8UQUHI63cXe45vEW0YvpiaHTJy9c+9/cBAcuXNNPiGV0UpnYpN0h4D
         GiY1JCdH4IRi2nHX+m/XkH4PcsnJwakvuLucR/HcA9OGyLJAckE1SD2V97P4k65W/FUA
         5XclI7TH+jaNv0BvIJr/wWYQCbSjhYvHEh62tQ8LrvXy4qu4oW/QkgiJt2sXOXmlGfxM
         OhFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1793039201; x=1793644001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nY/Dg58kDlhRREyLtFBek1i7zB95DzfSYinza+ky90U=;
        b=MdaQFEyhrHiKlVA5e9cpLrvo1eX3Zu1r3VMlYWlcabdn6ZMaZ2xc/+PQHLz7nLBjDG
         YbVKvD+9Jq+50riuQRBZV48a4ja7NKsD0gki9lRVYvANDpnUFDZACmK/dPgP7ZbcmoOl
         7J9+MZCdG9cd5wm0PckeB2Br7J47WouDNfmHygALN744r9w3g/4B6aJ9iWwE+iP9BThN
         Hxo6pNej6p+f8OXxdhh2/X3UbuHpuGe0dQQG+FKj/pGzHCFIiaIEtT7+KssJk3y/nCY8
         rJZV8xrDhOqMAa32tx7RnHjdul4GSwsCIwmNXQ5BZj/sGeKyfoouSrMcmwNYD3FZX74P
         rPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039201; x=1793644001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nY/Dg58kDlhRREyLtFBek1i7zB95DzfSYinza+ky90U=;
        b=BA95ktdWJhJSXW8JGQ8+d2CJRnH/waw63zSjLX6zBIN0h+5O2C98ltCVHFpQDwPjMh
         JlGbm/PZmVwEw4S0amro+ob1ZwJKlojlHYY325JMvsA/p/i5KtAVxQd7LPVMu0ufptde
         aLYFQaCQcWLQqNoVGFqAocmV2Vb+Frx0iKX/LhjNRQfpw5HnuZJQVh2kFM7ozfAIIO90
         6cucWDZR2x1M0L9n99lKyHYzp06q+YG8nNPqnFZA6mT/oyGw6yaW5PNArTDbVypYJJwf
         i17r94Pg+/VSv/QffGjNIKoOAg8YcFHmYJ+sFc8vMcs7Qpmu/1QulaEuwRGna+E25NqE
         zN+Q==
X-Forwarded-Encrypted: i=1; AKwUvByawIL+Zt69tAm0G+U6cDSY2WiHB3MGaBFjuIp0VH/DmjiHtQbb7xDAerSbrRr44goDmdsrVK9BytYLfFQHrw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJGn57ShoCA5WMV80VkxAQGJZ14nTbUpATCAMeguSyaN7ywI0xT
	3IPrMwUnguOLIpJkMWRvFdXoUr5dyOal7UQIddkUyjfsMAo/Sf695X74+85SN9oalHpLr82bP1Y
	vWxX+WytpCgfYnk0hQ0MtrTT2FnvyCJuAICfTzuV8Zg==
X-Gm-Gg: AYBFou1OTDo+DNYmafdX3uZZtlut7nJou8GZAyNJSxd8JRe60xj75l4aw6dOdrGO6o5
	24SPuDQXLxE9f18jNfF2rW7Cd7ZFSQyeSD3uv2WyQwJU1R8aVScjJdODiwDIC0Z6YOi6YAlaBxK
	R6MS0oML+0py/+oObSaU+HJ4ArT7aISoAYFRn/ZZwasU10HLItpgWQ9jujFI5Qtsfqz+oWDCtme
	ul/ZwClQDvOA11ibRkXx8TJgEvjC29RLMzLW6j4XA629KcR/UTZWxkuN33ECWZ7xcRSAf9Az0FB
	ipIYSIOzDZZpGZJBlDaVmcrZGQ49B3cJLyxeuc2QFxtc3L1CtHCv+XIFjw2F6gNVYXZ1fNcQ0q1
	lQ2+EDDCq870BT0dCjrqVDybcdDv7ToN7H4NwiYDw8x7+/qca9TxVIDzwY7/i0qUB33zh
X-Received: by 2002:a05:622a:5d3:b0:536:2fd8:a4d8 with SMTP id
 d75a77b69052e-5383b4afebbmr117637481cf.15.1793039200775; Mon, 26 Oct 2026
 11:26:40 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-b4-configfs_kzalloc-v1-1-17c1ba6db062@debian.org> <87cxt5dg1x.fsf@kernel.org>
In-Reply-To: <87cxt5dg1x.fsf@kernel.org>
From: Priya Bala Govindasamy <pgovind2@uci.edu>
Date: Mon, 26 Oct 2026 11:26:29 -0700
X-Gm-Features: AclHuK-HM7aWQnakYxF5bvOichqFt63lfe2rUOIlRJ_L7_Z_ycOyZaPy5TNVqAs
Message-ID: <CAPPBnEZz_oGkK8PQ=U3Tv67oDp+OaH0qzdv_m7u_fB7fePvYMg@mail.gmail.com>
Subject: Re: [PATCH] configfs: zero the write buffer on allocation
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:35=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Breno Leitao <leitao@debian.org> writes:
>
> > fill_write_buffer() allocates the per-open buffer page with kmalloc()
> > and initializes only the bytes copied from userspace plus the
> > terminating NUL. fill_read_buffer() reuses that page if it is already
> > allocated.
> >
> > After a write, a read on the same file descriptor therefore passes
> > ->show() a page that still holds stale heap data. A ->show() that
> > returns only what it wrote never notices, but one that returns a length
> > covering bytes it did not write leaks that data to userspace.
> >
> > The Rust bindings are exposed more directly: ->show() receives the page
> > as an &mut [u8; PAGE_SIZE], so a driver can read the uninitialized
> > bytes.
> >
> > fill_read_buffer() already allocates the same page with kzalloc(). Do
> > the same here, so the page is initialized whichever path allocates it.
> > The cost is zeroing one page the first time a file is written.
> >
> > Link: https://urldefense.com/v3/__https://lore.kernel.org/r/cover.17909=
81219.git.pgovind2@uci.edu__;!!CzAuKJ42GuquVTTmVmPViYEvSg!MzBh-OGC90bot_58m=
ikAXuNn-ZOko4X3HdO1al7Y_kCFHVAaLPKpyhKVLgRpDkWqziXPzvRGlJPkvD9e-ZWTkA$
> > Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
> > Signed-off-by: Breno Leitao <leitao@debian.org>
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
>
> Best regards,
> Andreas Hindborg
>
>

I tested this patch on v7.3-rc5 against the PoC I provided earlier [1]
and it works correctly.
Without the patch, the PoC shows that the first 8 bytes observed by
`show()` were:
  [78, 0, fb, 4f, 83, 88, ff, ff]
With the patch applied, the same bytes were:
  [78, 0, 0, 0, 0, 0, 0, 0]
so the reference is no longer created from uninitialized memory. I did
not see any new warnings in dmesg.

Tested-by: Priya Bala Govindasamy <pgovind2@uci.edu>

[1] https://lore.kernel.org/all/cover.1790981219.git.pgovind2@uci.edu/
