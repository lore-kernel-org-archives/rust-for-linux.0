Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EBB4582D6
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 07:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149361; cv=pass; b=Og2MEYpmfXXrVSsBsTahg7B3DxWBbdRMNxVu1BkaH20h0O8nhUOZ6dibFkLZGGy9Pswc/LOeFHBVWcwRc2o+x1CtPsrVGPu7+GAiRMT+VAtd2eMOS9t7XupL/fcpauDiPqQt50poCnzzVZ9pHF8qZfxqVjDubWlkzC7sMY2yH2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149361; c=relaxed/simple;
	bh=/IJk6BwyL2t+xmXjHGLGD+TklywKkZlMfXsjfutBVv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1xZsNrlioZtfW84onyb2CbjlhTj6tx8gcNVRKkiF0ZE3mO74ewQZ58Bslo4ygyhqrq4VQauTaKepaVQYAZB9qM3eAhy2sFCIOIPFIOn5WvqhFUrdE4R3FM+UMiEwfDV4prDUVUt+7X7AihcVurxErb1DJ4sKsWNg/L1savTGtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PBuvzwOM; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PBuvzwOM"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so524881f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 00:42:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790149357; cv=none;
        d=google.com; s=arc-20260327;
        b=bMOfbLAZX4J4RkSv6GBL8XXyfROujkaI1B5ImANqjLqGPpyqy1qz0BX0XjYHZMarmu
         JkbUFfrxHotNxEKuASO6rWiRpnlyEWYAkiqOC7MDiuOOSeNb4eX5QC5p1Sbf5ZPTYVzI
         N+yWDnTvM2PjMOhrbfuGEpSVh1U1Ge459ZnaBzFIo1PSJXwZ7LG4S/of+aRekKf77yQG
         JLso5BOjtCJCvuvKUUwMe9L36R+Cx/ZWt4J6695XSaIaqEviBEV+1Eu3DmhaknVMStn+
         NHh/IBHBwvmWKAkNUyGjZmNLCWoZUaSja6+PFs/R9JL+lMVtrQ/7QUhOtmwQRgEydab+
         rv/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/IJk6BwyL2t+xmXjHGLGD+TklywKkZlMfXsjfutBVv8=;
        fh=21bN9vPQLJpB5KkeqOdq+jjLtx74k3rMxgG+NlMPsVs=;
        b=Tq0c7vQC1frStGw2Y3wLjG3Fu1YlHcdO4lcdUkm1kwSLUVgLOC952WvWd2aBOLX5/k
         404MQj1vJz15YYrFdR74Fy3C2HaICTmWS6mKbQjHnl+f95iJ16S/CEz0TvGZod0xDoFm
         yqFhuXMby5dj+epYO0hu6H89lJ9d4bNc0TZfKwrNz6zKdL5ktBP+MK0mQxQtoUpG1GBP
         5vSe5Dop3foyUt/gRmiuRh9IThiRNgfjsgug0pnzFLDX9e9PCqTTeTmyCjM/u+40W08A
         jCboLDA9gek94hiQDNhGbwfsFfdXRpP6N5yYROEYR8U3ca904S1xxSGNFdj/F1Zwyc8u
         /EUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790149357; x=1790754157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/IJk6BwyL2t+xmXjHGLGD+TklywKkZlMfXsjfutBVv8=;
        b=PBuvzwOMlJE50DdNANx8SQ7X61G/v19IosMrQmMsLNtLvBx38548fP55e4IgXLwiaz
         7hU9k3SwTJ/Bm/S+B5PLB8vaNWlAxQ9d46eLbhyQDhrwcZQD4RYIKXmgKu4NEmCCc1Ce
         H+wVO5HRuy/PZLRKNLnyqMotJvdsS92S1c9oEWDn4XX0pQN/bX2OeVmlFZ5hi7U1RFup
         iW7uwvRxa+SLDA4e4GogGxl4oHeBpfYaMES3D/A5EGEY8GrScQcaE3A+Cd9hOrvPBxAz
         Dq5v1M7BrmYkDgDvwsHYUX55vjYU8YpfG0rHFWJw73oGIIVdzwVbuTCujP4XEC3u/PSN
         tNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790149357; x=1790754157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IJk6BwyL2t+xmXjHGLGD+TklywKkZlMfXsjfutBVv8=;
        b=ubYrzR5nrB85u6WjTsQM9CqJj8k1IRbhMGztcjaWuVlZ07yojRXsrgviyNZJYeZ9re
         oxU+UINeKs9UmKX2Zt0LJgBaWPsJeee+b4Rgi3QdV1dgMmVHeiPvIK6svVtiV+mXi8rC
         0gQVr9i51fq5rHmO+1PrV9LkoeToZy+8KL0AhlS74yzFpO7LkYcuE2MLSjhxv3r7vean
         DyOMquNbzwMnZCW8red4J8gLVbYH0temrOFIKXGziXsRwZ0E6Wduqyrhcfvlr/zg5FPE
         k+ZdbOLxue79i/xn8gj5nymUkT+JQVjZ+PfGRoSJC8Tr/PterkLb3zzx5eRdxoVwd0pY
         Iy8g==
X-Forwarded-Encrypted: i=1; AKwUvByjNZrE/nrBmS0gpS8gaw2na5wqFzFSOBZv9SDFNuL2n8AzEiUBbGgNK6UBc6LRLbEYDasldkv8VjIRkfFL/w==@vger.kernel.org
X-Gm-Message-State: AFuF++mfE2srKUfaO/hN4jmSGDAvrMfz6u4sEbLJtxWIHO1IbdDOmLA0
	5wstpMQzBUWRKjYJL8kW5F1QeU3bPv39AKxHoFpQKUR44UM0dXIOs9XX9ehYoawNl6bm2b4BK7r
	1hRh0rAWAnhAqyyCzmC8ixbW/U40RUB1g+JqOokbC
X-Gm-Gg: AYBFou2FT5ZuLeeJn3i0N8uhy1erxDdhe+oRsvokpEUsMNKXaSAUlBEAEm9hVjXDV0F
	GudzZNwEWWDgbDvI2GyTU/oWywz+MxmnyqjX7vKFQNp9Uhiz06CQ6mBKdSuLHUuOJwzgnWt4weX
	K8gBe4fT7aNWU7hsAJKltul2r+2i2EYH+t9ApoUMS6aXHnxtfOkP3+1h3wCdMnGHD3XtV2uwth3
	LDerRidj+YCD4sMzwe4z4FNzr9F8k8NdeB2QZnSkxL3C0CMsD9Zw+4c4F3JJ1eCBXeTAxKf1Hei
	VAA9RzfTpmlzzUWRAj24zzzCQEsH4lrQtLhebHrS7A8IESULkl/kc4t/7QN4MBz0iUfNPaYT9xt
	byNRtrCQoUPpcGZEO71yLrzhkwkBIuT0=
X-Received: by 2002:a05:6000:178b:b0:486:f1ec:f939 with SMTP id
 ffacd0b85a97d-488670a6c46mr3157053f8f.40.1790149356616; Wed, 23 Sep 2026
 00:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922-b4-gpu_info_zero-v1-1-7259840069c6@collabora.com>
In-Reply-To: <20260922-b4-gpu_info_zero-v1-1-7259840069c6@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Sep 2026 09:42:23 +0200
X-Gm-Features: AclHuK_kOTENlrajsbD3PM-8sSHORN3Gp4PV1SmVXbX3HMVeZKOfsOHmtEYRT3c
Message-ID: <CAH5fLghN0w908Z-MYDfmaeC7gvAB78MMT7zg599=1kU0HexkOw@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: gpu_info: zero out new/unused fields
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	karunika.choo@arm.com, boris.brezillon@collabora.com, laura.nao@collabora.com, 
	steven.price@arm.com, liviu.dudau@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 1:16=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> If a new field is added to the struct drm_panthor_gpu_info in the panthor
> uapi, Tyr must initialize this field or it will cause a compile error.
>
> To pre-emptively avoid compile errors, use ..pin_init::zeroed() to zero
> out all new fields added to this struct. Tyr can subsequently change the
> initialization as necessary. Also use it instead of manually zeroing out
> existing fields at the end of the struct.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Merged into drm-rust-next, thanks!

With regards to sashiko bot, we should look into whether the
MaybeZeroable that bindgen adds to structs applies on this struct. If
so, we can remove our unsafe impl block. But it's not an issue in this
patch.

Alice
