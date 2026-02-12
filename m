Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521261DDA24
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 10:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770893133; cv=pass; b=GdIyi3YetEGwESjNE8asrFain/N1nO4Sm6y1SqmJDC5m7rGHyFG6OM8qaCct40E8kFD64ALuYfPzJB7v9mwPxXSox0QuzTPITkesZooqKK6L+uTwSEYr/6KawZ3K5kMh7VaRIwoeenWJ+gfJoRCQMJoRtneA8PKRIsy8d0twp8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770893133; c=relaxed/simple;
	bh=M8TTbL+aY2yUKkHe7XHXPPJX7/sNfOERgWKYT8fIYe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BaEUvSSO3Wvtl/PNT9/kLVtLk9qgkbsTiXZVpKyla9W5MNn8JBNc1uNMF93Gmoh0nFPISJm3x3sKU5aA5aY0BLHe0lDqJN0iem2XpbtpQ7UNus4WHEVGDH+9kaBKaJh60bbIKMKwWBo8xaHB7yhVPP4KXBJuR4LcwyxGfCCg05Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdXMnBnB; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdXMnBnB"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba4f9df1b4so291629eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 02:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770893131; cv=none;
        d=google.com; s=arc-20240605;
        b=Ux8DL8ABoov9DUfq/e8Q9c6vB/UtnUVFLwLyfUu3KxINK0gP2IHx581u1n08q8iRsM
         9M4gi0sp3NVCKatOroi3JLlz/W64QSVu0Wr5DUjmWW6phRff8v4e/+4Kn0Vfx+K8ze4j
         KIic0WqIzKFs2R+pdXDY+k2SMQX7QHS4uO043As6KHVsfU6Uexwaog7zFip4fb/JWLIO
         NeTxAuTqYkK43YZ6X7UPrrojuIwrmkRrS/6V/9WBnmVJL/jROHhRE4Noj/QJZDaXOqq5
         Iy64/JJBOY09qnKDYcAz0B9mrPqASb/zuu4dknf8Mhfv0ucTjcEbM4/7GsWJiD5kkEew
         IyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=phpZ1LJL4LHD3Xu5bAIFwIXSGa+vgb+4IXaYk+lvQ+c=;
        fh=r+6L4gMpSGQvkV8c+kk8g8U2cijh3nMJF0tOuJtRshM=;
        b=HO/f65HgaJBjgJZ5qeuVSJ00T6igXOR0n4ThGTmRcZa3USH3UEp/DxuwUgfwM8Sd+p
         LGurYkxrXj1LntKVIkR6Xdxna4wbfMSCOQSWC+GBJCUVgDtA3LKj0IDTERo8ROX+goXe
         LhrCFE6NxDaifufEgIPCJyXHaKkWeOEinnzr8dARXW6wEhoRq8W1ko2gRQkzae4A/uAO
         hAy19BN/wVfyPNTmxxycsU4IcEEiO/ModBFsq5oUYEp1TZj+EOQ/WZAj/k4MbaHLGisb
         9wEcmfmrQ8UQTutgfJeBKNPy3ZUtdlrmLTzC26L7PA7IZU2n5hYneVpF5GNDqH07DaRL
         V0qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770893131; x=1771497931; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phpZ1LJL4LHD3Xu5bAIFwIXSGa+vgb+4IXaYk+lvQ+c=;
        b=HdXMnBnBRyx50HLsBUUt9GmOAr3690IiT+vOIhEpGJTwEyW3AOhI/uwrX4WhRaQZGd
         sErwk/l4sWWuRDM6ho9DIpI9ywUGsYFe33gVqYqnj8H6qvj8lJs4nBPxmm+M0i+GabM1
         YeT3emb5wiRgRXfUSncqqI3829tKKpcPuNgPyz3Tov7Jt0jdIKfvchheAMjAG1ot16jD
         BWoZWZEDrUEqKb3uqGpNsNbcwpNrHMzbFScyQxHwDz/OnORz1j86u84o6l0HXEfPzWV1
         Tt004zCHCo74Ajo20+4WLQ4PrfqtGALBVM6egNniV+yQci4Yb+XU9FXvE9qqQXq3bcaI
         92Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770893131; x=1771497931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=phpZ1LJL4LHD3Xu5bAIFwIXSGa+vgb+4IXaYk+lvQ+c=;
        b=aMDsgnMdhLzPxCXFXyfi0F/jAlBg8NgX/K/IGCyUGj+ze1lglhvaB4coymykUvhIAd
         MGY1VtBVzWzgG6Rsf+1uluBf17kSiFvuGe7GoaHEOPame8vXkbZToR7SEcqIE/tvUGPj
         O/epnZoDiT/5uNOhpUwSH46bH8b6HpqQ290KhGmx2uAEUSl74vIfFD6NQxao6GkfOAma
         qW1ReV18MlLT3p8z9xeCnA5D6tArJ7x8iDyDEX7YpvrI5AKYYADmIUYX6FKtIFtA3qEY
         Aiz0jU9rVajnb92cDJGoARKdUmVuUTXV4m+zcBuGuc5f2idiWcRVoTuCdHxb//hGMeql
         Pk2A==
X-Forwarded-Encrypted: i=1; AJvYcCUxwvKT8MA7EUyw0K4hWBowtEq+dy4NKSmoi2X4EW+187tayEBA+QY5hsBHDUJlLeK6x6WFHUZNYu2TcUdGjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK+YSvXSQBzVfibH1wsH3Bx5ZlYpMxVNu+VUWgfv1lb+VCFjdY
	jDcvGsPHE6nidCvyrHeXhzGmjlXjpitkLB4CgJ0kprHisVtA6pfjCJuRhIPIH5/+/qcKyaBYUZG
	fygtxx3E3gWlfjtb+Y9vQGfiMgp8tEjU=
X-Gm-Gg: AZuq6aISjaUlBB8A+B3BSBfbPYd5ASLFts8TiDMZe57D4ZaS4cjYLpTJslEEOtLg7Bt
	2Ff9YvsOs5awhIr1k/34uC7amL0tXJW0S4cLp+iwlkm+dwd6u3i7p3qtm+jFXdzBfGNoCjM7KEr
	YY2Jn9wk8SjLHNwhX0EiPHVtPcHtctPB1A2efVO9IjNxaD56vvV7a1C3Y1gGmxa9jIEb2OrhPyg
	cGSq/bKXmS7usMfEw9Cy+5JKxMM309EwL2DwOhmEjIXoPU8Hv95caCv+OE+apMUnH3c1x/sCBLw
	RC9VDcPR0FpkuvMUDM+yLJWj7JlnNOo+BKj6oWv1F7VCYAUWl/vIuYLJ4XqlztGsItF3Mo+g/wC
	OXFdGW7ngx+A2+09Hu4N75Cal
X-Received: by 2002:a05:7301:1011:b0:2b7:1008:9f2e with SMTP id
 5a478bee46e88-2baa808a1a0mr502293eec.7.1770893131339; Thu, 12 Feb 2026
 02:45:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-8-deborah.brouwer@collabora.com> <20260212111113.68778819@fedora>
In-Reply-To: <20260212111113.68778819@fedora>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 11:45:17 +0100
X-Gm-Features: AZwV_Qj0hpy9yWpoQU6BD-WczAf3MmOLS9jRC4UWcoe2oNEcIa9_Ve27ZA0Cghs
Message-ID: <CANiq72na4OjOT+LD4E0oPoPtrV5jJXoApbhoSbVivMDOwhkPMQ@mail.gmail.com>
Subject: Re: [PATCH 07/12] drm/tyr: Add generic slot manager
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	aliceryhl@google.com, beata.michalska@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 11:11=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Don't know what the doc rules are in rust, but for this sort of generic
> layer, maybe we should provide extensive docs around objects, fields
> and public functions. I see that most struct fields are documented, but
> not the struct themselves. the enum doesn't seem to be documented, and
> some of the public functions are not either. And that's all my fault,
> because I gave you this raw piece of code without much doc (you added a
> lot already). Just saying that, maybe now that things have settled
> down, is a good time to add proper doc where it's missing.

Yeah, documentation is definitely welcome, and will be rendered for
all crates in the future.

We configure the compiler to require documentation for public items,
and while it is not enforced for private ones, it is definitely wanted
and expected unless unreasonable (e.g. too trivial or onerous).
Examples are also encouraged.

We generally try to be strict within the `kernel` crate, but we don't
want to make things too hard either. It is a balance. Subsystems
should decide on how strict they need/want to be on things like docs
for private items. Some subsystems define further guidelines/rules,
e.g. like Nova:

  https://docs.kernel.org/gpu/nova/guidelines.html

A few related notes at (I am writing a "coding guidelines list" to go
along that document with simple, short notes I have been accumulating
over the months, and that may also be useful to give to AI review
tooling):

  https://docs.kernel.org/rust/coding-guidelines.html#code-documentation

I hope that helps.

Cheers,
Miguel
