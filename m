Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B6943DA4B
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 17:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768931691; cv=pass; b=pbURvXi3NMWrysKeO/VDX+PVUYcpYEBImjM1xAA9zxsdQEoxYQA+xkpBBPwZzY3SiURUj8b7kV9gJtCAxsSb86gPnWJLqheqjbFlOcqj186GqmFebF25uEkLz4OxvOjjCUh/8nBph9Kx+4WBahd7vCkwqEft+s9PdAeos7a8dTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768931691; c=relaxed/simple;
	bh=Nale/QVsxc1/f3aBzvjpGU6AR7WFvKMjnVGw8qHH3gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUwmmyDYxe+nbPhQC6H7GWLbNydLQX7Bjbkqdd61WJRRBknClUiowt0beqgSsSiyLVPjANNd4LoziawGgdsO60h4FWsEM+7+eSD3uH8NNv6Ok20JCBlMPAMbe+GzniimrAYs6UZfgTyv4nQHjSL508pNzwi5mORF9Tv4TgCMocg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X7KcJOQI; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X7KcJOQI"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-657fec06242so144a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 09:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768931687; cv=none;
        d=google.com; s=arc-20240605;
        b=UgUycDasNi1jgH80T3mV2Kq4UcAGlyS2Rq24VfVn30UaDWJAmDweiLXrAob6v0QREN
         9B3623C4FSq0KNvxKKKX0MfS0tWvaZq+yiV8edTu3Qj7yk7Bh/7NBMgkufR6BRuds0nH
         c2L/p/qNZ/QkCQjK03qm+lXgvl0SKB9ZJZgGr4ifxs0sfpH8bnPQ9W2c6Jylq+9QCxmU
         dZx6oBHgAvb8+E7iofkhOjIb4At6nfVQC8qqq8R1tS5Q83LWDIbSivRhePvyWfR/drMS
         47934qmZxI3TJhaEqiPeUKJZ/+BV9maFXJ8PmRQ9YpM4BK+ztocbj0SGu9RfsNROy7Tz
         vPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jft6THq09271RMd7h3tPOydoy0a3rVfq9Xg1LUh61UE=;
        fh=R9ccNTqXhYQwFuMg2XWpg33Azpb5WLBTQoaPmEMgQo4=;
        b=KzeERw00D0kzc+ZLGRBOWMxPX+A6o73wMtNKXQuIX2zz/lXrfPKRuzYpn3sSG1+xyO
         GR5vDGzCJWvl27yYv5AR/09HFIdfAWHOlOaT3d3DIiz5W7J5axXU9sOYfAdExMQe5vwS
         Ywmu1pbOVaMvaLNj9ADCztmy8Ih/fnIRoSzBUujtMiTBQihHiW6FG92Dc7I8qU484UxF
         bNAlzBYqkIpKBUsG87R9Dm55cArgpfG7sv5FB2+WGxHPnJLxkw4k0Hkk/B1wr2D4YHMo
         4HmHqa/DnTdL4pojzgT5xf6V+bztH7nvSitekwnjCyYJxCtaKnGZqNZZLNaX0oEexokl
         e5Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768931687; x=1769536487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jft6THq09271RMd7h3tPOydoy0a3rVfq9Xg1LUh61UE=;
        b=X7KcJOQItLNP7fBUmPEs1vREStWET4I8jc2R5Z8GKq5NKjtYG9u9uZhnFd6K69O6Sb
         6RyOjdoXc/xKa9nkMt0Vuc/aZMVMzqyd9pX+D5ILWh96NtMd2i/Y71XT67gFSf85FzIR
         QYxOs/WS7mG7P7sXYd2POEiZrpcIz1QkMOsOqzCRw0RPA6VrbmT/cRWNOYPzPcyPJLyl
         mnmDRxnKjdFy8iv/7R6E6YdCB38kko/GT31OcKASTv2VYV5L9lcDuKefocr+Eyd3myWi
         FuCS3fcSeQ3sXdYqbWHDQW0M49Xis92JeLdIPe5nf+9M4HxQe2EqxVx3sqsxrvj/ys2E
         nTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768931687; x=1769536487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jft6THq09271RMd7h3tPOydoy0a3rVfq9Xg1LUh61UE=;
        b=iMZPm0D6PLPjQIOrEpCIhe346HHUhoJ2HYXz6XhVOau9V1Hms6BaURke/AJQOHlWOD
         aYu/7nhdWoQXDZyiIZhU5Xol15Wr/yGzPy8SFccTLtxnpZvXYfBb4CZHojW5mDVfXk88
         a4HnqGP2LEIHlE7ig9PpJxvpvYil/fTn2Ho3gZ7SUn1ZZo7LffpVSver7oVWkbcEGAsZ
         FTZiNJIbI4OVruK6CH1yz7R02l5jdFD+HG7TYk9KLgGvMyjoWa2TUsyUfH6NgK76JkbM
         3al5aWQ87Ev+IW+khKHiqokXqKSfteZXL04VR7S38ZJ8ghgAGi0nkWSI9kgEH4cXGUwf
         RUfA==
X-Forwarded-Encrypted: i=1; AJvYcCVlQw9TxcmuCLLLhncO+IPzqqjHt5Af1p7Rc+0i+0EAxrzf/BCeda5ogFoNh8DX1GEG3kZ/w/zJwxplGuN0Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynKmxuRzQmFZa5lSOGlg718+zq2HeQggK+lAz4VhRE86ToBI6j
	Q7l2kBYEbOasV5hFheIZfbeJK6d8kw4080TuDl3ICbXIxH0CvgpLrTJCZ8M28+em3yHvyVldtby
	uVayGbg0zS9gxOW59lD19LqBLPQYCzyVB61v3+Ese
X-Gm-Gg: AZuq6aKx9gUcN0R7gptEqlX1YEsRdDQqqVSassPwQD2DKUOynwKAI2+zTqVAv7wA/1x
	dxpTwFNPA/H/nZkvMxYXSgfK/L4XjXTxP+liTJ5gcTiHrlfy7Gena1AsDsySm8nlyGWH9+EVz1O
	0eWcOvOqxUCerg/2Fn3HaD/vv4xzQACySl2IDLdr2AAfFECKe78XJ4NrGxtkVTqb88Dggm30nSP
	RQ9Zeul7rdguQ1bFNOTcUuhPLq4Hmee1aRA2fKyBHmVNZnt19G90YYgUqacaMaBW+bVf92MVY49
	CBRvn0cymMD1J98fWjMzQhHIu9bSni9pMB0=
X-Received: by 2002:a05:6402:5052:b0:655:ac89:92ce with SMTP id
 4fb4d7f45d1cf-6560b37aaaemr150437a12.16.1768931686728; Tue, 20 Jan 2026
 09:54:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116214959.641032-1-ttabi@nvidia.com> <20260116214959.641032-3-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-3-ttabi@nvidia.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 20 Jan 2026 09:54:33 -0800
X-Gm-Features: AZwV_QgFJtJo9ERHdhC6JMlYvhsy0igZvgz8-jFT2Z_91f_ZX-nN4lpTrntG_ns
Message-ID: <CAGSQo02KDAuHiec0vnZEYN45Tr-Kt8nWhUW41rHCQpnCTGpxNg@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] rust: debugfs: add Dir::empty() for conditional
 debugfs usage
To: Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 1:50=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Add Dir::empty() which returns a &'static reference to a no-op Dir.
> All file and subdirectory operations on this directory silently succeed
> without creating actual filesystem entries.

I thought the whole point of Greg's admonition to never report errors
and to automatically create no-op structures if debugfs was disable
was that we *don't* do things like this, and instead you just do
something like

```
// Always do this, whether or not debugfs is available.
let debugfs_root =3D Dir::new("my_thing");
debugfs_root.scope(data, name, |d, s| { ... })
```

If DebugFS is not available, it already returns an empty fake
directory. That variant of a fake directory is also size 0, so you
aren't paying anything to use it...

>
> This enables callers to use a single code path regardless of whether
> debugfs is available at runtime. For example:
>
>     let dir =3D optional_debugfs_root.unwrap_or_else(|| Dir::empty());
>     dir.scope(data, name, |d, s| { ... })
>
> The returned reference has 'static lifetime, allowing initializers
> returned by scope() to be used outside the immediate scope where the
> Dir reference was obtained.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/debugfs.rs | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index facad81e8290..44ff2b37786a 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -110,6 +110,24 @@ pub fn new(name: &CStr) -> Self {
>          Dir::create(name, None)
>      }
>
> +    /// Returns a reference to a static no-op directory that doesn't cre=
ate any debugfs entries.
> +    ///
> +    /// All file and subdirectory creation operations on this directory =
will silently succeed
> +    /// without creating actual filesystem entries. This is useful when =
you want to conditionally
> +    /// enable debugfs but use the same code path regardless.
> +    pub fn empty() -> &'static Self {
> +        #[cfg(CONFIG_DEBUG_FS)]
> +        {
> +            static EMPTY: Dir =3D Dir(None);
> +            &EMPTY
> +        }
> +        #[cfg(not(CONFIG_DEBUG_FS))]
> +        {
> +            static EMPTY: Dir =3D Dir();
> +            &EMPTY
> +        }
> +    }
> +
>      /// Creates a subdirectory within this directory.
>      ///
>      /// # Examples
> --
> 2.52.0
>
