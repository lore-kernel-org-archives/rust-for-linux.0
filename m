Received: from mail-wr2-f17.google.com (mail-wr2-f17.google.com [74.125.225.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B0741169B
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246012; cv=pass; b=PDuhIMDCFo3zL8JbrdF/xwMON2W8E4t5OQiBOwlnY5f90hX0gYWtDtf/WvBjxuIFipG/EELMRuxAAtIRkhB/WvRpBXgoXSXyDgHQZ2NwUyWk9aNG32wywhdW7Gt6PFRbV/vgVyxlkZAHAhsB2YK6oe9D816SRqzg7uihKIOHKXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246012; c=relaxed/simple;
	bh=TjBwBAVtLQJ10cPrfbNdj5ZS+FgVnFhStUQ45fL6gTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIaHEMWgXMmv3CTczXDvzilDfEl7XPxBbcnZcrHA/heD+vGz2ynb+ikSnHgFotK0Rw7sTyx/sylfhn6OJAjkoTrCbyyZUmZ2yX3Hc1w5S/h+yWqzZo6qQgULMBU7LMyYgp3DW2IaaTItfNVZSTr8FXnCBiZIa1Pt8iBGL0pPQFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Srq02qpN; arc=pass smtp.client-ip=74.125.225.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Srq02qpN"
Received: by mail-wr2-f17.google.com with SMTP id ffacd0b85a97d-484366874b0so1191389f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 03:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790246008; cv=none;
        d=google.com; s=arc-20260327;
        b=Y08XTaAlxY9HSE/CCJsz+ZzgQAdnhEAz5QAMcBhA2gn14w7mFrfoldxBAdzD9BPh+X
         KZbCmS6MSYPwY7/pVEa73LoEtI2oXUT4X3xmMlietQE2rTSxBhauAxv4/ZVelZCmiNfH
         Q80a6FG5PW/3SQRO8Wg7mbr6Zl+zSx8WeIlb3vuqRZqTH9f7hMgdg3tbgg7Os1eVJ0ov
         1UYOQXDt3D8C16RJqKysz5k3yREXk5ucT+E25BmWbh4bsD2wuixF8DmaU22NFVt2oWSa
         Os7/2wRDuFeV/gJA0RL5TGB4YybZNY1V2S5BfD5ly7C1I24ow5a6EZqlIu/j7m1LfUcb
         es4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B2Y2KJCyXfWZMz2HsqnglDrl7rh38AmDRqjeiA7oS9M=;
        fh=ayN6YWuT3hGY78vtlyEowaS4feH+5haSzBypoGWivdQ=;
        b=XQVAY3wBt/uzVCG4zgGCCmis8lvKhrcChjqXN9ox6E1G2k6yPXnQP7W3UUHvE5moYV
         KZnzE2aGqDLxkPo0rkJNqs8RYsR5/Ex4MMZb13LWS0f+k0iT6kQEJEXvq3BPtn1/WEoa
         T9Q1z9bjE3lG0ZtMHiHbz3VjXki1ydyv4ZDDxq8XtQxjBg9Wcjfx6402RyoNauEsrBRm
         Gk+Ur8m+jdTarXvmqhzGyar1k1Oj9w67KXogZRKAeRKhgpp71YPkY4EhOmDDV9wDZkmE
         Wqb4NqINVVbgWPy4Iqh2m8Y92zcvPeCWXyiNRMxyTm1+pK+5iCC+YTDgAYAmZsd+eujr
         bG2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790246008; x=1790850808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2Y2KJCyXfWZMz2HsqnglDrl7rh38AmDRqjeiA7oS9M=;
        b=Srq02qpNlN8a178XnoLBNZzvBaSb7c1UuU4vi4BAsYEUvbF0chwKQ6VoUqJhUtbMcn
         wImqVxp3mNwn1CcqISmOEfRg2qJjxVFmUvRNQNvsFGNOmhuLP6XNqU8z4gIeiDsE7bxT
         oAP0CGwY2GCA5NDqTsxHKDjCL53wx19E2G4laYGBjQyPmK+jAUEIEeezwSdWv1j9TRmw
         ZWHLsRLHgvNologue4tARw2iUkwYrAufsNPQCiwteEJXl1Z0Et2yCuqQgKjhT5517No4
         R+eKkGpjMp5KF3vw4xpuY+zCIcdpjiewE97JxenacSzE9+jIWlIq6faA4Oii/DGRbaZk
         WwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246008; x=1790850808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2Y2KJCyXfWZMz2HsqnglDrl7rh38AmDRqjeiA7oS9M=;
        b=A9TU3AgqBq0Go/dcewdX3UcbVDGCWpNik+TtOw3fwSpzflUY0hY52UP4le5B58ago5
         x1++ktUcaXBifG+MKwqBICRFv2sUd1rNdvLAu8M4nZsOWwFARkQJFXJzG8ZBSrNQ3nSy
         oRMnKQLc0pZFV48LZod6OycqsSijj3z0pY4MQdZdKigC8XdeJpdgS8jCH4k6OgVcjTHM
         fL7q92MCG3YzoXeN9l80HCA5xJ1V0EVRlOffQ5DLGZhTQvmGPK+WveqOLXCEzmHOawdV
         5fdRrE/GeGfxkDNL705gURViil755jtcLe83IhkJZDb2cYYKLBuvxbe3ID8KkQJVJM/l
         OpRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw281nnpxkGEsCJb2niM6Y0qiUbVikoxgLpSZukhaE+lmbZZDTvZlSe+p01Aud4uB2YBuJzJXss5iixQTc3Sw==@vger.kernel.org
X-Gm-Message-State: AFuF++k9W+A3bvUvosgqXmEW4SLkG22EZRrWzF3sqQoJThWwj5P4HV8j
	vGugF5w83yH45sALi8sZ9wCcXjFRhtnXpc1MBnqKhw41SzvRKJlioXlngPlxLbMo6fe+vLKMCL8
	ZRc+jVLF6djCteBK42L8mylyquIBGdN1Ze8DjO8aa
X-Gm-Gg: AYBFou3BRj//kyBEDpS4o9QlyQL8/W49mUX2XpMCN4Mz+zGBw6hXtZaSuwNdDh+ryfm
	grKhLlvrh/RSizK+EIkn4qK14u0XvNS9Sd4NKdv+gC7REIA9ivR/5Hykf0VNZ1pRO7tdh8/sl66
	HPlXCDeEJg1+CEGn/YWCf03O2s+Bz3rlFez8sng6ASypGILmA9FeXhjiA9yOv+rS7dwSrzh27wk
	2FB91NucdeTfw8L1Ieh7ie7yIVvOD07mfdc41yZCnaKbEpXyEdZT3NGjlGZKVfC0J75owK9hnW5
	Qq/BhA7nE7pV4S8lNKa3g+cUCXks7JL0TZxqEah05X9xrH2UrWXwl+Kwlrx9oScLdmCxHKX+QLz
	Ka6i1uR6DROFQ8jk4p1oH5F6NVO51uuwf8Gr4AZBnd9RIX/ScloWu
X-Received: by 2002:a05:6000:4a0a:b0:487:1084:10f7 with SMTP id
 ffacd0b85a97d-488716a5f1amr3158902f8f.28.1790246007990; Thu, 24 Sep 2026
 03:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-gpu_info_intobytes-v1-1-bb2173f91e11@collabora.com>
In-Reply-To: <20260923-b4-gpu_info_intobytes-v1-1-bb2173f91e11@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 24 Sep 2026 12:33:15 +0200
X-Gm-Features: AclHuK804AwDAE6HGEoAUsZfzHXQ3A-22uNDOLxivpJVZwrsF_RPFfFu1xUpH0s
Message-ID: <CAH5fLgg9xCmiN=MdNpxCLOO5zByVxrPNxhqCeiEQNpb-U2AooQ@mail.gmail.com>
Subject: Re: [PATCH] drm/tyr: safely write GpuInfo to userspace
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

On Thu, Sep 24, 2026 at 2:21=E2=80=AFAM Deborah Brouwer
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
> Instead, use the macros provided by the zerocopy crate to safely derive
> the traits IntoBytes and Immutable for struct drm_panthor_gpu_info. This
> will cause a compile error if the Panthor UAPI changes in a way that the
> traits IntoBytes or Immutable can no longer be implemented.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

I checked it myself and per-type declarations are indeed needed. We
can't use most_traits for everything yet.

> diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
> index 8402b0c93545..65d913181eec 100644
> --- a/rust/bindgen_parameters
> +++ b/rust/bindgen_parameters
> @@ -71,3 +71,7 @@
>  # Structs should implement `Zeroable` when all of their fields do.
>  --with-derive-custom-struct .*=3DMaybeZeroable
>  --with-derive-custom-union .*=3DMaybeZeroable
> +
> +# `drm_panthor_gpu_info` is copied byte-for-byte to userspace.
> +--with-derive-custom-struct '^drm_panthor_gpu_info$'=3DIntoBytes
> +--with-derive-custom-struct '^drm_panthor_gpu_info$'=3DImmutable

For this case, I think we should just do:

--with-derive-custom-struct
'^drm_panthor_gpu_info$'=3Dzerocopy_derive::most_traits

That will automatically give us these two traits.

Alice
