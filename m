Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545E220F09C;
	Thu, 23 Jan 2025 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641960; cv=none; b=TIVUrH9QX1GjMmi+yhnzlXpoPotkpJkNbqQGUCefvHu1HOKaJvn+dqGyiBoYUaXd3uQMZ9rvmZvKW9ODXAoUU2MQwKUIVcUvCCCaiVCjZylgs2AG4um2orq3arKVHKL1o+tVwgaKYZqdnZUWUIVFROkHvSQla8nQelN2+3nNLQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641960; c=relaxed/simple;
	bh=ji4tTEhSLgmSBgEcBwTGc8IM9lJoFcK7anuf12T/Zmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmRsyFT4mdyojGi5k+DGzGdIOrhYlzTo6ZeIXTkZQfmehToiJa5kdU76ZdS8S41DyujFRy9hGuEbF3FZyC/I9dse/j1ETvhP6nPqnMotGE0MlDeVZTY2oaij2opz5zd41ZvkaZv6quLPE8gTJOKUHn8h2qEilDakXwyz5Kx8+u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9MxKaiq; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9MxKaiq"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f7d35de32dso236787a91.3;
        Thu, 23 Jan 2025 06:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737641957; x=1738246757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji4tTEhSLgmSBgEcBwTGc8IM9lJoFcK7anuf12T/Zmc=;
        b=b9MxKaiqyPYOULHNRTmD+z1QP9ow4f3vNCvb0SX4/YsuJgWE4/pruQLqHxCi6pP9p/
         NT1jbM8yEX3ilcEXboXyghKZNw8I3o5mUfHrTuXrwiisQS77a9AoArGCpS/xxMuO094i
         JhaaL+zwKuzoINo27lqjyxr4dKA387CEJlnLDld3//18BA6RE5LAR9ie61mJuRfFxokE
         5XMdkEamLdz1Cvz+JpC9tZxAAkGW/xrPVjv3zo1bZQOps1TYimgClKAB4rcgr7B361EJ
         egyBHObvpL83LRui9AumtEvpejkBb8Msw62JZi7bmWxbZf2ZzJyu8bA4Of32S1LjZLtf
         FeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737641957; x=1738246757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ji4tTEhSLgmSBgEcBwTGc8IM9lJoFcK7anuf12T/Zmc=;
        b=czhEkoFgZvN+ucuykSDIxElPY3GMsUmB4Tuf/QIviNAAVxwuvm407KNLEzyY9d95+7
         5EJq5cgAufbrBFankGcLd1HnLhOmrocrFNjuy7FqZlg6eb8Z3CV0+OgMbfESKV5DYPyh
         YVqeDBGyjkhsbhyjxhJGE5ue6KFpBj8xR5t5jYEP2cZ8TFONQCSDtSbRcgAtqS6jT32g
         4qS8E8KVwAXZDr9VmOXRx5lGs0G35RT94A7bHepFOb74Nr9Z4Xs27va/cAOg6Nc/qyA7
         b7TKevYpjq3jsrrZi6yrDoO4+4Ay1R5m2h3WMCd2sqn+x6l7SJHLm8eb9QDdnb85DYtE
         I3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5EXkVB5OsulSXHyNvSwkHLdbOb8d1IhaUdkuGi7Yrr+qgvdzakENF/KhvHW26DAADLDTMWUNn7AXlHiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKcs4b10CCRwM6TGLR978rYUCfwb+dDUyxH3zukdjNQuR5fSFX
	8fTUgdfPcO08ng4m8jO21P6CZe8m/I2KphrVvgfztAxNrwOq6+dXEz9Q5zz3ERvJfHz7I1O5EdD
	d9no8hrWZaHSB3G5hX/MG976LMKY=
X-Gm-Gg: ASbGnculuQ+VyTSackYLhjBznLiRjoVQpnAzmcKNlak1VFMTvUmWH6+IBvFTpzgsGIZ
	mWW1A22fOcO4QwoSivUkRT+2EXxUsumtVvu0t76oLw0QZw+3t19IfF8G28lZ9SQ==
X-Google-Smtp-Source: AGHT+IEiX3B+fiUvSiB2OtH24g7/Gu7iV4fyzLSr7O4UcXxuypjzs50iGZdIGgKom1U0urfBGCq8zf6E3bu2aDzD0PQ=
X-Received: by 2002:a17:90b:6c4:b0:2ee:cbc9:d50b with SMTP id
 98e67ed59e1d1-2f782d35946mr14250865a91.4.1737641957557; Thu, 23 Jan 2025
 06:19:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121191432.1178734-1-abdiel.janulgue@gmail.com>
 <20250121191432.1178734-4-abdiel.janulgue@gmail.com> <CANiq72n4cgutTCcVa+Ee4jnsELxfmCrvotZQCVO8aQ1J3ppTNA@mail.gmail.com>
In-Reply-To: <CANiq72n4cgutTCcVa+Ee4jnsELxfmCrvotZQCVO8aQ1J3ppTNA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Jan 2025 15:19:04 +0100
X-Gm-Features: AWEUYZli8zMh6ToryzCH5GpzVr81ucB_RtvG5XoQ05bjOveUYIBPzvNwGZvo6I4
Message-ID: <CANiq72=tDyTtonTxb5j4xK++0XSNtdvo6vkKzhPNDn7orW4c-A@mail.gmail.com>
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

On Thu, Jan 23, 2025 at 3:16=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

To clarify: in case DMA MAPPING HELPERS decided to pick this initial one.

Cheers,
Miguel
