Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5997445ACE
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Sep 2026 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323031; cv=pass; b=hXOSc0LBrA5624yTHka4CPfTR98nrNvw3i1xCF3A4jlZ7DCHHisT7iTTFPtG5R9Q+XC8Kwy/tKw+8EfQpFJt8Dxpg+uAqG3IsoHddtufcOt0PLVlv3bRWvUHpfNuk/9/63N/HvJVNg1WOnY5ggksvZQJSNwVNmF53I4kOLQmPPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323031; c=relaxed/simple;
	bh=K+5vgDFe5TGrq0mQPO50IjtX5/W4RN5ErRGtT9lE5JE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MN3gilEn3kGzR8liJQ3FWIu1UVTuMf3h3CaQhDCOCT3oXK3REiNxmCX0gZghtIq5npPfYlp9f1QU5jHI9+uUFBREYxPvFHLya7mznNdEQR8gIUTXD+c636N/dfyuUeBVdqQ+75e4yerSXWXLYGWDFo522goctu3NDPqnrwOLAkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q0HPTln+; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q0HPTln+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so444946f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 25 Sep 2026 00:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790323026; cv=none;
        d=google.com; s=arc-20260327;
        b=kmLKdtOWSzYGKBc1lshtVaW0HRbBCj7qBGH9EXFLBTyGJ4X0EI7hzsz3zsO072RrcZ
         kWuRK7M+F0DJ8uxjny5SNeceW6nbShYR9hnpwMyc5Vz0T2sA8YDoYHaLY90kcCkfHsVE
         Z9+XM4sYG84fyu/FW6gH2At/48A/9gyq2Tdn2G/2Qu0m3H8mtWUAi8qeqDnJzC5oiw0N
         kWYeO/RB9S0ZfSb8hyfAGU2hvxxzQvOQMyL8DKN5sY+fpMGOrPWEE9Lpd9fKqAxPK5zC
         vL84vmAOLuAQ2Ut9fbvM+imPxwoPvUYNXZXQ9ebIuG6kvNnRUlfmEDar0logcBHDtQw2
         zVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K+5vgDFe5TGrq0mQPO50IjtX5/W4RN5ErRGtT9lE5JE=;
        fh=Ubxf/AwKdeyyMEMyS9BrQCF2Qeavz62+tyJUDaK0tOE=;
        b=o2kXPjhJJa0s1VJ4pTmLO67fX+tal6kCeCBHJGtiTWvpRZun4ElQStWb9/5DUeEqAz
         D6cO5xGFq6/yBBV1M29XVZtnhpnGS9TTpwQntfuR/lLP/ksD0cYhwbVUrA2fGQKHBtNS
         8IKCKd5BkZlEPXQQecsFBMZJsKxHYI34UFhMDb4A6zgvYIyp4Zs44FsWU7cB7E9NtLIO
         HqOkGOgniBOy7AO9HSvD7xJGkCK1fiDv2Xqw+SUT7mWPxH8QqkjF3eOxtA1fXGBcEgFN
         UDHpfoGfHoeJN0jMp7LJEsXuhfMcdm1yusd1J1PFzTW8f5Yh03qZEsa9LJhJqMMfZFm3
         48HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790323026; x=1790927826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+5vgDFe5TGrq0mQPO50IjtX5/W4RN5ErRGtT9lE5JE=;
        b=Q0HPTln+2Q9jbkFozuLfv1RPDFI7q2UhIlC+g9Rq/CyZTTGCb+6WoX95k5MTH1bt/L
         qtPn/ImTIbuDEtUEp+4uYF7WoXQiY36luHMahyUyRN2+dK/B5oM+BMwYai48FXIJ5lS9
         UT+r9TuXP8TewLgaAwI/nw8LcYUrVbW907xyVW6q24ojlAJtNhm+0RZirxLQ6UhI4ky6
         CyZBPtH1GyFSUjFZujhvl0aztMdlWC0syZmzeaHdjNhpXXYf5V0kCPMVXcLTDOrMiVuY
         eOsJBoly5RHSMFphAPJN8NA3UlARjO9910bq1OA+bzwpnillP6EE/RVrJ4u3YG2NVVpW
         HEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323026; x=1790927826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+5vgDFe5TGrq0mQPO50IjtX5/W4RN5ErRGtT9lE5JE=;
        b=J7XwfXlIVEyJsIfDd/tvEPZDJvzpA0461z3EMRXQpzkttuJ2osawil95TIviQupKwz
         bJJoDoT8yUoG4oVrj81eCdfCXFkSD3AxxuVYxUgykpEkEd/i/x/RUcD9dqVTwxdgOCIA
         3h3uBgc0HTq/Eo+UqzYIXLbRr2yA0FuCXx3uhGRoF3Bb39GWJLSOBdWtitIvacyZI2ZC
         foE2KwUla2ZHWxxSpurUgedWMSoJXdgTcPxAszSudd3Qf+OLu9COPw7RKTIZ+VcPldX0
         hRGpCwBdrgCeeDTBYAnVsMV4/CR29z+e6S0VP1mIQz/cUK7qvixVbKfSwPi5lwSVu7zk
         vKLg==
X-Forwarded-Encrypted: i=1; AKwUvBwJapCEHGw6DmbxTA3cgQeR+Jjo9GhSXL6/TkMsT2nv4o0dk/o1c/3iPGY5g7swo4JmfBusbZFRU0uiMEOI1A==@vger.kernel.org
X-Gm-Message-State: AFuF++mVhIGKZHpO2UYTAvzfxsF+4iAIoezCINLpoPvgOFl3xXKETh43
	xS6KeIO8SsPS5SjdZ5GWnyMe8QbZDqdSbNcThTw6FryJYTpbA6jWVoVKgmxw1gdpnfqDk55p4SG
	NBOMdAnCBmePPSSJ1YbLeZiZK0jnIWIWwfb4sYhwa
X-Gm-Gg: AYBFou1gKAU6YTsEVm2xINetkg847WmSpXrHIR4GWoOXjsk8BtYomgsxfp0ifuhW1Ma
	BNrXF9MtJbVhNj5DNZ7Ao0zvI3eDBpNTmTl6W+lD7Dg9OKFl1xS1Gy4+hosurBD3BPzfAOjjGK5
	U0+ztpVs6ySwtHlwUzTmj8/0qQsJHmBLDsfxcb1cxzdqvt4zzvkvur1IvhIqvHCT7F7IG4GeVAL
	5hYqrTDsBpS3ZF1m1+95bQKiwvn9BLs+c22b/IewlXNPkYCVD45heTDuqM9C5FjaczMH3mxGWPI
	01bUM6QCkaTnmeddZhNxkW9Jn32KN5/IZd7OoI70tmrWKE4Al2w57/Zf0mYoRMNV1tazAzx+QE0
	HHg3I2gWG9/LB5gBt9A9doedvbX/ktvAt7IajkAXU7jqhhe/FaXIj
X-Received: by 2002:a05:6000:64d:b0:488:7da0:fedb with SMTP id
 ffacd0b85a97d-4887da0ff09mr2217956f8f.40.1790323025312; Fri, 25 Sep 2026
 00:57:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924-b4-gpu_info_intobytes-v2-1-1b05e33df8a4@collabora.com>
In-Reply-To: <20260924-b4-gpu_info_intobytes-v2-1-1b05e33df8a4@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 25 Sep 2026 09:56:51 +0200
X-Gm-Features: AclHuK_Dn3TRdt8_mIeczM_Dej9VW3qvC_z6fo4fHT4gwnLFIhhWWIgyFak4gco
Message-ID: <CAH5fLgj=h_riWoOvEX_TOH3+0FNbKBtjO1OrxzwHDQq7uzXg_A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/tyr: safely write GpuInfo to userspace
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 7:22=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Tyr creates the struct drm_panthor_gpu_info from the Panthor UAPI
> bindings. It initializes this struct by querying the gpu and then writes
> the struct into userspace memory faithfully byte-by-byte.
>
> Currently, the struct drm_panthor_gpu_info does not have any implicit
> padding, but if implicit padding were added in the future Rust does not
> guarantee that it would be initialized. Then when Tyr writes the struct
> back to userspace it could expose uninitialized kernel memory.
>
> Tyr implements the unsafe trait AsBytes for GpuInfo whereby the developer
> guarantees that struct drm_panthor_gpu_info does not include implicit
> padding, pointers, or interior mutability. This allows Tyr to safely copy
> the struct into userspace memory. However, relying on the unsafe trait
> AsBytes is fragile because if the Panthor UAPI changes, the SAFETY
> guarantees may no longer be accurate.
>
> Instead, use the derive macro `zerocopy_derive::most_traits` for struct
> drm_panthor_gpu_info. This macro will attempt to implement the zerocopy
> traits for struct drm_panthor_gpu_info. If the Panthor UAPI changes so
> that the traits IntoBytes or Immutable can no longer be implemented, Tyr
> will no longer compile.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

So this looks good to me

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

but needs Miguel's ok since it modifies the Makefile. And I imagine he
may ask the commit to be split into two.
