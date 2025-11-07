Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6011E51E0
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 09:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762507047; cv=none; b=co6o83lSku1Y2LdNno/AUFHxPyZANy7w7IqXvV9PGksQHVIwy1yo6nQ64RQeHd3who49gD62onxImOOOTGdYhxLTmR3Hev6IdnUVEvoaKQlgL3Mdciuf4ia9rE8MBGVQR9CvkPZVFOMFNgGAv1wlP6O3WjnDJ+NNC2M45I94JcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762507047; c=relaxed/simple;
	bh=9PmcMVZDsHCK4rt0iNzZTEThhWDp09sptHuKBIoFGww=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GbOIC3Jg898ykyLwfs/PwfClYT9pjhPyhkDzUcuj/6tc5XVyWQnV179dLfez1tI/WAuxdWQ6+h7QUPPFBegE+dKdFjX36YUJk7+pcZczokFF/H0a5QEefEYqPoykn4JpRbP0AuLD5tXCrnoMaIK9/D9t+GAV7CuaR6fNqQpp8Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yMMkEnEm; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yMMkEnEm"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477171bbf51so3482345e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 01:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762507044; x=1763111844; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Fu/bJv5yl4C82p3zPtmSlFNQMIanK+cOnJiMIeio9k=;
        b=yMMkEnEmRfbgUgnbjqM0C3iKasKrAVl5dBx3PxOtoDc4DFWyppTrWlyemSKwhSrB6/
         XJngTzQ0uL9f+V7UeoKhOVHSOj7hPMxGuynqbbWf3TxHDpNYyjyi5lXoLaLFFARNlCDu
         wJuGGjamOYzDtiub5nABrsKzm+FvZvbVd4+vpJ/jDMMLxiT4MIxpBQqZuwu1adIcD+MI
         wvtFjq4bzvjOmXa9fTA0VOgKAZTTQs5DcZAaTJjDPtbAtyDFufeKq2JXkXLOPY/UufnI
         vHZ/Yhf6XcL5cH3LQzRpghQiDTibTt8EMOMgDdoBW6HXPfQn7hCWiwL7FRgXly4SZfua
         ifyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762507044; x=1763111844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Fu/bJv5yl4C82p3zPtmSlFNQMIanK+cOnJiMIeio9k=;
        b=NYRRq0O6rgoe67X+BiGFr1PTLRzjiXnz+UHSXUlat3Uo2biVwl1BzBmbLgWanwgxvs
         yN5xPIsOnTY4wvX+f5q3DXL6zS3GdQq3s51C6F7q2VORGWZIddICrMWP/e6h2jiw7cFK
         MpWlC3+ccxyjuW4NLQqjzNdzRyaZAGrKApcFvf6W1L6VZ+KeR/R1LIaedI5ME4ulHn8D
         CyuN/3jEOJmVDW2lGp6torWCJDMyOJ/Sqqr+OY8J1zsN2+BR1bVAtW86QdiAm1NOW6rD
         +iQxLSfmwCAFAg1B+CRzo0GrZ8MKHXVeGTYtwUs0QYFGcSD49S5V25A0cZgAJiK74jp4
         D5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUnx5+Wd5NpYjHLz/cL//u+ue6dSEfDj98mCesHY5lpXxhGXySlou/cEFdPHdWSKP1cY1yw6Y191eDOM8pDTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFGksOKSr3duUiZOwjxtERLs9fRp4m7cL9csBz9vxljxQBg11W
	lJUPHT/XoFsiJoN+Aa6V25DSoOHHvqC102E4vyuHfc3YuvIMAAsstdxs4m3Pni+xmo2hYTclsK4
	pwcpzBnvkAf3qm6dEOQ==
X-Google-Smtp-Source: AGHT+IHgbMb0VxmaHAt6pjz/fRqkDWP8S9rkud4tbuPtykItYMZV8DRvEbIRPLT10AkQTXLwi9zhaXdoS9ucMWk=
X-Received: from wmoz20.prod.google.com ([2002:a05:600c:794:b0:475:e020:fc28])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3513:b0:477:63b5:6f76 with SMTP id 5b1f17b1804b1-4776bcca2d5mr16265125e9.25.1762507043890;
 Fri, 07 Nov 2025 01:17:23 -0800 (PST)
Date: Fri, 7 Nov 2025 09:17:23 +0000
In-Reply-To: <20251107024720.369067-1-m18080292938@163.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251107024720.369067-1-m18080292938@163.com>
Message-ID: <aQ25Ix2V_8IMc_8y@google.com>
Subject: Re: [PATCH] rust: correct documentation comment for rbtree cursor
 peek_next method
From: Alice Ryhl <aliceryhl@google.com>
To: Hang Shu <m18080292938@163.com>
Cc: ojeda@kernel.org, Hang Shu <hangshu847@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yutaro Ohno <yutaro.ono.418@gmail.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Borys Tyran <borys.tyran@protonmail.com>, 
	Charalampos Mitrodimas <charmitro@posteo.net>, Daniel Sedlak <daniel@sedlak.dev>, 
	Tamir Duberstein <tamird@gmail.com>, Matt Gilbride <mattgilbride@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Nov 07, 2025 at 02:47:16AM +0000, Hang Shu wrote:
> From: Hang Shu <hangshu847@gmail.com>
> 
> The peek_next method's doc comment incorrectly stated it accesses the
> "previous" node when it actually accesses the next node. This commit
> fixes the documentation to accurately reflect the method's behavior.
> 
> Fixes: 98c14e40e07a ("rust: rbtree: add cursor")
> Signed-off-by: Hang Shu <hangshu847@gmail.com>

I shared a Reviewed-by tag for the first version, so please include it
in the commit message when sending a new version. That way, I don't have
to review the same code twice.

Also, this should say [PATCH v2] in the subject since it's version 2 of
this patch.

Alice
