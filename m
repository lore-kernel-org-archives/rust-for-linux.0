Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBFA632
	for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 10:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790505139; cv=pass; b=Z3shHR6ItIhT/OiA8C/4SMXbBUaPvTYn/YGK/TIiGmhbvMbB34Wza3Q8OcF5ABIUBqVeq+DFmRAGyw+ioeUgkIa88J9CTfjp+4xsVxkCE9LSoKTWhEEZdnodsJPNL41dJmFWSLAfjNFt3Zc8N/wDU3QZdknS0jjXsxWn66Q0ElQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790505139; c=relaxed/simple;
	bh=SHQk7gkbO2ea5uysrJ1Kbk5JIPAf5arZPkM7Am5MOaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoxitK70npMGxab5uj0rUi45Zh6jJAlTE04OzwbctjOBKUXrejJfqNPwmkQAZ8KYjd6ZBaDIyjwPsDYajpqzUt9152PV9meTF1M4fTI8M2tWKS38UAzdWLQwfyl9wyJK0lVRkpZVia8rBPTT0unx8ORiD3J9Iyn8VXss5eRfYq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XR8V/29B; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XR8V/29B"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3427977d677so150460eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Sep 2026 03:32:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790505136; cv=none;
        d=google.com; s=arc-20260327;
        b=QMpxRK4sYkO9cAMWp+n9f6qsqymWSUcIMwKW6GZrp9r1Pnu5LEUwiHNKspCYgLUYs1
         PbOHqyDgnGo5/puRJdzChse0GjCSNtnQ7H5NKFlYjhkZz6uWvNJ+jwe9i4bVCpzlF7iy
         zL6+4t09PVBh2ejfhHOwlnkFYtwxpRxO34zIqAl56VDtTqs22hukK1op8TLp2Xe15ieT
         f6hfnP62LYiU+7cFV55iYeony8gIYtnKLWhC7ZNregTzQ8Jru/LcIv4yjEq6LKHnAH3f
         N9l/XUy8HZjgCoHTqtpgHGDEVsvCE1DVRByDJSOlOjItPKv9P6Q0eK3x73airyfSdiW5
         47bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T0IBN3YB7gkpyxIrrQJOq1rE0sGtI266Z+5OM5H2e1o=;
        fh=VcklD93m9+3VHTif5rvjaxKAfdnY/+LgrfntMGLdDEw=;
        b=fBd8U9wg8oW/xXggul4v6is9slwzX0Ujcl97pq+7+8Tl83mTg2nhrmMQt02B0BLLbU
         8zxRuxVt6ohnSlLImF/hnT4JLP64QxiFvOYej7awVaJ+1DfPXWSXquo6TsR42yVdPp5F
         nhev1BmtMglTTLLmtu92brSWDa03GKEm4zAyLQf/vHKjTCJRC8zeUVD4VwjBsGq9qhFt
         tbKoV1ykPM49g+DvpCXCCVBdnIy5UhsRrML0oqVgNBb6yzOo/86Ij20pexyDM9WY0l1h
         uY4KCtC4APeRYNDFXdbgd0Ry34bnQvlmEC+/8HKxDnZrzFkeha/sDydSntlBFtEKiSAr
         pnVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790505136; x=1791109936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T0IBN3YB7gkpyxIrrQJOq1rE0sGtI266Z+5OM5H2e1o=;
        b=XR8V/29B9a9xrBzbZ9Z07pBSu8kygEYk1F4B9tNxOY8Um5rhoyAAZfXwJWiVfVGDP3
         kunng5LM1yHVR4lJUZyrlKIJCz01Cup3XyedgCw3yctV9GEi77nhq9zUVuWuaSiJyrB0
         hjddBEWyARrol16/uAZZBTifM0nxlZdiQ/xBdRR350jXv1kWqSRohsiz/8O9cZhLtg2Q
         EHh6O9zKit6cagm43HuArIxUJLC/nSrHHBq4VOb7/QPNA2/1hP+QXycnwEAlhRrV0VEu
         MFC9vgc8kfQblA35P7MZeN78MeM8QTd98+bU4ooxF6Jnhk0SiyiXjyqzcF4P5jQwjNqT
         oczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790505136; x=1791109936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0IBN3YB7gkpyxIrrQJOq1rE0sGtI266Z+5OM5H2e1o=;
        b=zNe1MecL4KOIHqGvexZBVk7eIwBEYLLDpTlmiM+aZssbr/JBr4KyIFOSlUF+aP/kbb
         U9ojIxxWQiVJ1iKjVWm8XcLKuujC1a5mAuYPbJzH2kekx6kKqf3NSHo7sS5tsh9QKZqZ
         8Jw/Dfx1lxvqRXVKvt3Iyr2yxnU5L2PxzRe7qt/5prYv3+lZ1K1rphHcOv31FEOqRxfE
         HsJkSpNba81Wfi5E+1al5Z4Hx5WekUm0qfmAce3F8EwFhE8EV9VQhNg481X368noe4Dq
         WKDl57v3F2zpW3FyIsM4dwWz8GRYj2f7bcV9sP9zTuxS9D6RRCjPZjzH0+N3+Da0DxDX
         xXnQ==
X-Gm-Message-State: AFq9FYLkxfzRIZb/Nq30qDBp/PUXZgiYRZUn3xWxWnyL3/hijHnWPO90
	3mBmrKQNL5Kze5UL1SfuhcOiNNM1LOF/K3OFWG9xjGz77w9Iit5Hu1VG+eUWLhZX6zjHb/ULLng
	NczjnAMqYHEnP3Tzsjg473IrE5K9hJ8k=
X-Gm-Gg: AYBFou2IvbD2F1Xe+z3DND7LioSrfgNsPLYBfiVMNs4k5BBomxqT9FZ04SwpiWxQ/hj
	uNM7yg76zuWSBGih+i0LaX46ZPnYPewGIdezPbElwxcHj4RIWJCiSkwd6ikSvWhmVJNHHZtbNjX
	FPyamXVu/djez5dmwhOD689JDInxLgK0BmL7R49oiLPmJpRIQ4SZ8WpiyJBuKuJQnVVPcQ8Oj2q
	dhSPzzZ6N5oUmr/vDvTo9iV1aiqrxQKPKhrn1kD4nxRiXIj1v87ztWDPkrNRIjToiz0+uGJw5Iw
	kLDEJMMIMvGoOCvyFrs7LXvTOoYG+UoIRublgxgi0/a/TM4OxpABOLwnyyBSAdx/3OQeCyJpbL5
	vuPWKhUoptxdn1hWPlbhc7r0xSWaGe4fpabFmM0L2gF5e0RnKVYz3f6VV15t4ltoxTbIJQRvWMn
	HA7ybBQEsivuQGzcncJtFLYV3T5xP1uW/0EOnzSG9JIlMu3/qDk3OauSmZbo6lUKoY4nBolFBQ
X-Received: by 2002:a05:7301:dd97:b0:33e:6a79:5a81 with SMTP id
 5a478bee46e88-3427179721dmr8395927eec.1.1790505136091; Sun, 27 Sep 2026
 03:32:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909064506.910162-1-apopple@nvidia.com> <20260909064506.910162-7-apopple@nvidia.com>
In-Reply-To: <20260909064506.910162-7-apopple@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 27 Sep 2026 12:32:02 +0200
X-Gm-Features: AclHuK8iLs1xJry90CQ3QvtDKTbcAUCAThEBu2i1dWjYp5xrWZkI9Bh3mU59r6M
Message-ID: <CANiq72nFAbA_uEuUfWvdeMQeYJ+uMcAn7z-FWcQOPUcbX9CkZA@mail.gmail.com>
Subject: Re: [PATCH v6 06/13] rust: uaccess: add UserSliceWriter::write_truncated()
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, nova-gpu <nova-gpu@lists.linux.dev>, 
	M Henning <mhenning@darkrefraction.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 8:52=E2=80=AFAM Alistair Popple <apopple@nvidia.com>=
 wrote:
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Nit: if the suggestion happened in public, then a Link tag after it
would be nice.

> +    pub fn write_truncated<T: AsBytes>(&mut self, value: &T) -> Result<u=
size> {
> +        let len =3D self.length.min(size_of::<T>());
> +        self.write_slice(&value.as_bytes()[..len])?;
> +        Ok(len)
> +    }

This could reuse `write_slice_partial()`, though it would need
`#[inline]` to make it generate the same code (but we may want to do
that anyway).

Thanks!

Cheers,
Miguel
