Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817C61548C
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 22:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771194802; cv=pass; b=qj9Dt6NkzWggy9+3iHP6LNptAoDkhMeeyA3s6cgxKrX0WMp81HmJo5uw7dxioKPx0ZWm4V/l8VrPhF92mmDLZkEF6zA+Q4XhJyrWQLiD86YPC/KIWPPd04znutUYXvlGqx1llZbgTSrQKjAoO6AcPH1TH3UKJXt92j7Ea8F2lsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771194802; c=relaxed/simple;
	bh=JRf+T2YaX60xNkl8DrYNEOF4nHjpNo+v2ALRgaDwDHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1IUcJx1ITTumXHMkGgnnKmV8WHaSZCDEjGltZZYOrwyzGVboXikz26NQbe/yFmdrrpW2XM4N/gr5grA8WWn98pVKIyjuW5ljZkvdx6/fu5ppQUtVggNUN/UyJYkKud+H6r8fTTYzoz343oNr/F8CJ/KevtR3SwzOf6pWUVRw7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQppJezf; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQppJezf"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2baa1ed79b0so107763eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 14:33:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771194801; cv=none;
        d=google.com; s=arc-20240605;
        b=K3J//NWyyVgCg5+Cx+aAEaDq0TUc+hAAcjiW+z1I2IoY87561IpejXa6I2rVusNXr7
         57K+rXoOuW+IxhbWhBx75V6jtD4ZFtDQ+Atgs9u7xBafrG61L+Ywjgk77ml8naemUzck
         xO382U2KMQMJlJ3r0snLmsUimeSWmAICvhradXdON06giKk7dXRTRL/0LzTA3FbHFhLu
         7BZFzwGvKLeXYBwyai5TBKnnkjRyFRYFoNTGyBP5A0g/blqQkNnOGDdq8sWzVJWHJ6r3
         jHsS2oo1n4M/anlKyB4OjZG0nrD/ZSF4TCOJa4sfGQ1I2XByyeDvaJutMSnVFTPnKx/U
         xhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JZ7+qUdkTyM+y7B0PTABlfJWNoucM7Ep8elG9lwBdIM=;
        fh=NdottfVrHcwT4hyPq69d6kjy6nWE5xZOv2hfMkY4fNI=;
        b=MbYTiaXERybgPK1y6wRtWNm2QR6vxX0F6x7vYfXIqo/KXWB9pW3mWXpJbg1/CA1TF+
         PaTlarbSf4UYeaTqgBTliEQxrCF0IMDSt3J5AAOe9HRo+PZEBG4cwkzInacOEX32uFiM
         xNSIXaLMbfTluQ7X0CxgTUCdh5gTWCsNghFlw7MUEFHNQnz7kHXzhqRAdz7VJXJCaMmF
         PoiyttzC2lWmcR1wsTDzMhK7Ep5AtzPNtqEO62olIsmn0Eyzd2KOy27cgZAihhW2tJoi
         P6+QjNNPrOK1+dOXjKSvLbwOg4dO29epo/CcMMbEREVkK4u1J5E2HfedWowiYIx08v7T
         p6Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771194801; x=1771799601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ7+qUdkTyM+y7B0PTABlfJWNoucM7Ep8elG9lwBdIM=;
        b=WQppJezfkXcfGlHkSWTNzsMbxQs9GGZANJWwYuGctLHfPPqo4YezV1JlBecbR/Jduq
         y8YMcxzmW1LQC6F59tzdaKx+Y0q3ThjWgzvy9fCbtQ5fnNy0Fad4qFWAxSV4Lao9z0s0
         c4FqN1+Tp/1OAG1cLb3L+XdXxp3bOaI0dhoWpYHRH65SBSwR9Qtmn+Ii4/Nn5rEV5BbG
         ZFE+uPhoN1ju0EtUAkD9HtUHFcpaC3zUvS3s/t2ubFJO684VAtT4PjPTSEZHw2/M1c7B
         B5XsjEfTMrsD6JDoqo+naS9o3WcGkYRGImbdlYQb4zk3cXYRnILtNQsbEDhJzscGlx6J
         HyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771194801; x=1771799601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZ7+qUdkTyM+y7B0PTABlfJWNoucM7Ep8elG9lwBdIM=;
        b=AeeDTpEZmAXKh5SzgSAoT/A8FMHLgsITKjP5tgCb8zreZpUOzN3wh+LtXROkqNwZ0h
         hoaNPhkHBuSecIv2qoooXxs/gAuHKFm/e4evSlnWET/HZl4sxEERz3vOR8ZodvlWwkRl
         4FzjoH8pE2yu0Aj4Ydw1bKFbSQF6cXD1a2dnrr1qDVVNTzCNo0Hlh6oCy6GyoVki1xRk
         xxdDGA9x5KG+WpWu+NFwEDezP+Q37x/gUKxrIoo/8Z3AWukKk5kERkUvhB6ZQ2fWsdXw
         WM4k2AuJuM3zJPOmgufB2lRJ1g+gh3rpUR+9vi7Ai7UUAZA4FQLsRsOyi++jnoXk2LRJ
         aTkg==
X-Forwarded-Encrypted: i=1; AJvYcCXHkdqIG22I4zj/bijTd8Q3lRNYhL3EkC8o3fbKMcJmG6LsxX0fzMe4+Eo5fm1gzgWGUoIHnhkJBddK4AQCnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi3QeOMFyVFzew8K/Fq50gWeuSulBFUIqUa64EINDPdbOo7PuD
	rQTA8ZRZaFr29nK4LfcpzSSJBMMqyXuMnpmVaKDrC44uQMKmQ1OSa99C3PDe4Op7MAamLixqZWc
	SN/T9e4UghA3ctYAUMQGXY/uz81FACW8=
X-Gm-Gg: AZuq6aIg4mWKQYINOPEnwZwTY3GA3QeCIQR6NjdzkuCX/U6bnqpNZiWxcvwYwPHt7QG
	PRPA0zNaUwSPKPdqI1Cvx2mwlprM5p07Je2R3Dojv2ET4cTFhYPTdlN5hbijh2Vi89NxXQB/93F
	VyPGcWiV1/qrVkDZm3xlnM3f+0DLMd0SOYwEUWdVqKQ6j6yecuKqQzh4CUR8RdVBIbvZaDAdH5/
	0pGE63RtVqf3AW7U4tnPmIrdnUrxa0SsglMdrrUfeNuciw9We/sExbay6LHnpC7JuVYuvkqLY06
	a0hEfJzKBQFtqMohJ8/X0vKZjZdQzqufWcvur0Wnj5xTBaixyGEl+0W9UuXqaFW+jpJE/eKX+d2
	un2qv2vqbgLgG5XLoBUBFy395
X-Received: by 2002:a05:7300:ef82:b0:2ba:7013:2b94 with SMTP id
 5a478bee46e88-2baba0d9f2amr2278586eec.4.1771194800540; Sun, 15 Feb 2026
 14:33:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260215-page-additions-v1-0-4827790a9bc4@kernel.org> <20260215-page-additions-v1-2-4827790a9bc4@kernel.org>
In-Reply-To: <20260215-page-additions-v1-2-4827790a9bc4@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Feb 2026 23:33:08 +0100
X-Gm-Features: AaiRm52C4W01igr5c3XSj8GHXnZngfEE6Hme2FtEbEKQTchO0EV_WW3H4OO5KYo
Message-ID: <CANiq72kovxkiF1Kj66yVyQYKx1OijjtTGB6UN5M35th57UFFeQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: page: add method to copy data between safe pages
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2026 at 9:04=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> +    /// Copies data from this page to another page at the specified offs=
et.
> +    ///
> +    /// # Arguments
> +    ///
> +    /// - `dst` - The destination page to copy data to.
> +    /// - `offset` - The byte offset within both pages where copying sta=
rts.
> +    /// - `len` - The number of bytes to copy.

We generally try to avoid this kind of argument-by-argument docs
unless they are really needed.

For instance, would this suffice?

  /// Copies `len` bytes from this page to another one at the
specified byte offset.
  ///
  /// Copying starts within both pages at the same offset.

> +    /// ```
> +    /// # use kernel::page::SafePage;
> +    /// # use kernel::alloc::flags::GFP_KERNEL;
> +    /// let mut src_page =3D SafePage::alloc_page(GFP_KERNEL)?;
> +    /// let mut dst_page =3D SafePage::alloc_page(GFP_KERNEL)?;
> +    /// src_page.copy_to_page(dst_page.get_pin_mut(), 0, 1024)?;
> +    /// # Ok::<(), kernel::error::Error>(())
> +    /// ```

Could we show some error cases?

In addition, why could the test fail here? i.e. if you use `?` in the
"main line", then it means this could fail for reasons outside the
test. If it cannot, please assert it instead.

Also, couldn't you assert that some bytes were copied as expected?
Could you show an error case with e.g. an out of bounds case?

> +            // - By type invariant and existence of shared reference, th=
ere are no other writes to
> +            //   `src` during this call.

If you use the type invariant here that you promise not to break
above, isn't it circular logic? Why someone couldn't have another
`&self` and call this?

Cheers,
Miguel
