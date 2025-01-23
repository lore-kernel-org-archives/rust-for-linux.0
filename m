Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C486F13212A;
	Thu, 23 Jan 2025 14:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641776; cv=none; b=u6GV16wCOOyb2X6NVNrfKCSCclfJnwU46om0d5lu8mSaDINn/K92yQOUJRieeybKAH4wOALk8VKjvoFVKDRRm+Ro297WNma4lMB3x4ggkXNxtqeQ1et+q98ve9rxC89Y/+lQE92nz/QToMwE3qON93KUeWXCBBvEoR9Bonv1kAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641776; c=relaxed/simple;
	bh=wFQRAR+UbyxJkTdGtdDRCO/Ux+XBAI70FmckB2I+cz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBQF2PEldluDUU6VY2sA/z++kZtcDchgsHNrI7bbdViNqz9SepeJiQgWM1AD5WniH3wq1kdUVKJ1KQJZs3cVUkZFKSuvh3JiCbzCt6g1l/Crp6+8EMacP6UDsWtZWCFpQuaZnAaCZRb/clvvN7yRg8/ifY+Jqqvay1RcmvwUTRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfliSPxo; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfliSPxo"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2efdaa02378so237845a91.1;
        Thu, 23 Jan 2025 06:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737641774; x=1738246574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFQRAR+UbyxJkTdGtdDRCO/Ux+XBAI70FmckB2I+cz4=;
        b=GfliSPxo030RXsQz0UfIUvaq9EmbSKNh+xzE8LO1qjYrk2ATYQD/+3LAAEcTw+dQnM
         /8QNGnyZqTzURKrUvcPR1bAqmsLSxOn9DJN0QmxCjuiGHOMT6DuZIW9vJS5qSPnNHp5k
         WfTIHZFe3OjvkpfLOU9Puz4r+TC+rS9uiilsKaEF8Doez1vd5KvePATQh1o09SlsgY7u
         CGNNQ5ucLY0yY+mvRJxAO0RuUdbreNu8HG4fBGHmr7QENg3TM5nL3WYDNMH4Tco1sh5w
         jpwmZS9pBRiSQ5rrIGpch8B4wrohvi17rbbaJHCh4MlD4fGkXQ9ejQFjFXhCKqQbImnW
         6Qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737641774; x=1738246574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFQRAR+UbyxJkTdGtdDRCO/Ux+XBAI70FmckB2I+cz4=;
        b=KAtHTMMd/3pXeFVy7zGr0T5tj2/GrytmBojOnnEFRCqgFPCDxapAWUXEMWPDGaNRql
         7tuVrpbj9LxgEzfhbz/MMRNVLeNY5ZH1fmteKz3pY717R+BmAyZmT5NmwA44RbTniOVP
         65ShG2Wufv2ozG4XQawUdocQIgXOpjSxio9VHhpMIpvEoQJaFnKNFj9Us6xuZUQUk59s
         n5Ao1WskLZI+dYvJLQRhIaGG1O6aMCzmicOc5mOoZNHLyKzXCfsdSEFx4W0FMxq4wyGb
         MDJdXUi1S9hywhbNvjGGU1mZ/KGUXKP9+u4xqnx5m6RawEqJSQFpVxDmlREUoLqUhMoO
         /qTA==
X-Forwarded-Encrypted: i=1; AJvYcCX7z4EFoY+ovorutaGwKRN6gLVX53FrSsFM0xBGdAxJJUFEdnCz654WRvHl20SGPjRoTeYYbJpt+bW9+tc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZA1U4MeA8wGbcrgDHXmeu3bdJMJBj0O/rwZH2mgtoeH8MIEUY
	YO8cJh8z/+sdIXEyqsvzKxyB1MUd5dPj3s4BhHtJ3XCPHQSdQ6MSv5Tk8o8D1XneCu2jMZhLxa4
	PyzDWlkLDswPZo8Zn7D9ZFrnD/dE=
X-Gm-Gg: ASbGnctwkxo4//g9GS6Uw9iZh5JS1m80mGJSHLlGQQwkvbFwobr+FeHXZQ9wEjmJD3Q
	yQCgPRMVzgIvY4fMSW2dAGWVP7DZ2uR6zy923/0TovdO+VaSRZEk8DT00U6DQ9A==
X-Google-Smtp-Source: AGHT+IFBX9h1NFlbamzZYz3CLVXkBZMBNrCE/6iJV1TBzqE1M0MU4IUclfvJBkpWZfb7odXJ+Uv0EZcFXS/q+Mtdoq8=
X-Received: by 2002:a17:90b:534c:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-2f782b06b52mr14477214a91.0.1737641773986; Thu, 23 Jan 2025
 06:16:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121191432.1178734-1-abdiel.janulgue@gmail.com> <20250121191432.1178734-4-abdiel.janulgue@gmail.com>
In-Reply-To: <20250121191432.1178734-4-abdiel.janulgue@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Jan 2025 15:16:01 +0100
X-Gm-Features: AWEUYZlZEiZq2V2b3wTqB9B-oPb5SNJJ-KNqQmn9GobBkSA8HfwoUjNt9_DYBa4
Message-ID: <CANiq72n4cgutTCcVa+Ee4jnsELxfmCrvotZQCVO8aQ1J3ppTNA@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] MAINTAINERS: add entry for Rust dma mapping
 helpers device driver API
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	dakr@kernel.org, robin.murphy@arm.com, aliceryhl@google.com, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com, 
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 8:14=E2=80=AFPM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> Add an entry for the Rust dma mapping helpers abstractions.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
