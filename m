Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671CD335081
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 11:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398083; cv=pass; b=R3ZqyEBI4Q87iZb3VDGkINsqpg1ZDDpg39WPbWZOpgA3DSUOzzn0flCcA1munZOnP4DkSNiS+CDHhRBEG1n8VvuOJepqJqOq95TgiGII77psR1PieeZN14jYC8PuTIuRCGv17u38lzMwfWaGVoBZ0/GT/BMu254KnymQK11Plb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398083; c=relaxed/simple;
	bh=EXQKe9KDqYrZRHigRPOszHTAsqXwql1KtKQuvZVp5Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0DR5VPFtCRJOM6/exr+I5pCsOastSOrPL7LoCTZzZhtZRoIhmFX4j3WaYAMH/pKbjSA/k9x3mLj458TzCSG+KCTO6yDjd+GEnniNDsLoWnLhhNq8leDaXC/mE8PHzTsWljvXE0CvoaHVJZfIoygf1zflJHL2Lfb0dVi/v7FEwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WvjNNC52; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WvjNNC52"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso7063285e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Jun 2026 04:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780398081; cv=none;
        d=google.com; s=arc-20240605;
        b=Gb2n37ZDQ8ySiDzMraHMps1ixJWFeQUJxGWfltFBxSkRIW3+Cv4W5jeO+wg1ZweggG
         ysj15wOjmFn8lNfYl3lXTc6QdTMRPCXT0LtB2JP56TkTTFkAY/2QXz8SOTopg4yNPgre
         cTXGzupL/RD9rZxM/U9GZoGrwVAJKd/HQ5TAD71jVaGyNKHtjuqd0ZZBKKoMyAQ1sLp2
         2Mt5D9dAnGmhQPjqk8A78ab9gKVIGA67frrI4cScwqsqRSUh+4I5ONoz6ZER/912WfSg
         FO/88cbX7RenRh6/tClHzWxBHLvQhzALSVMPXP1wHdjlTaWaap7F1J/hS4rKbMjLY/cT
         k/dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bu2OrHUrdv8mY3erGyGbB8ppYLrym+SFyVnHvC8BRas=;
        fh=GbJMrFzs651hPnaR+E7jgQaLh4Q8wJZLuaZTtms9pQk=;
        b=CXQRLCjwjqxrx6PtlC5uFqkxps2DwX6eYRb1hjyaTDb6ypE7mgkPLvYtjXkLmRua82
         gbsXe10RjUXsK/2B/YVUi1DNF7dlRaob8VEoIOK8Gh73U5OkBZ757X8C0IC1pD+cyu++
         drM0EPZfcHv63BBokzCuJkACtg2/APB3fvmhwqsZawYjzulgCaWGDgi0dTUQq+umJyxy
         dSP/2nLD+OMhhcpP5J/pHrbjOuwFDhuhNBZ9Adn9V9Cmi/+mPV+X97UBlETnsCqhdbyw
         4tLt6D58KY1THDGpYe/sj/9snrufM4BV5WmAr7WfSyUWQkk7CvtZGZYg14BuraKATY+g
         rSqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780398081; x=1781002881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bu2OrHUrdv8mY3erGyGbB8ppYLrym+SFyVnHvC8BRas=;
        b=WvjNNC52UNzO+X5yh0YJThJnp+KVgnebVWi0NEp27aC3FbObbGvlNgxC/fApaJmHeJ
         2D7DCtsQZvir0+BvlBAUNK7anKuDBwCZGfUZvC0gih0M2LXrUSF62TtzRrqSmRa+MJeg
         fvR1hgtnBMykhdluWZSkrCpH0AZSdhuywqfXKNStpg0WzePmXbd/7V9PJnRN7mWjBZ/r
         bG7orwyATKy/vQY/uaDCq12NHlbRaPDHXi7Kn3exFox4SnIjklJ03BNvdAAsYU2R6pqv
         27TA1T1CJ9jXSCtGypDZTdIfwXpQrT2xD6pWjv7ANEBT0Ctrr8rfDjI508thH57aW9nz
         JMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780398081; x=1781002881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bu2OrHUrdv8mY3erGyGbB8ppYLrym+SFyVnHvC8BRas=;
        b=qYPYDOHChNQqvKzFc+CZ8Pl/DnlDuOmy+HMD7ZUrs/nDpWE9tc9TAURyKQxhn+NnZV
         n2r+xjp4gf4aAOiG7RJREzaJ/E4UvP8RKOPO2S+OdDeRbpk7UsnTUiDWASmUyHf9H+Y3
         gaT24IjR3RqsJgNSEXB1PLoboGRI0GcfVkxywsadGtikssWLRcM8zRxsqZaaTdabP+ih
         Vhvh2ntO3+n3YGb6GsAsOhrfch9HQY9bVmfT5f4ct8HDBD9Xt9oQB1nCSUxWWIRgUeD2
         nn5ILtdt9QBpulxBhoMOTkSOQBgzWsqfLgPvTc8aKal6vohWQruS8eHbynAjtpmVjNrK
         hOfA==
X-Forwarded-Encrypted: i=1; AFNElJ/lOLN/PYXnYgib0U/VdwDdpZQw43bXRCq9L9hOmoEjG6xa9aefYIrA18f3s69W4wHvXQDdWlXAiNX+Yre3lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwES2vd3W98699d1uTaTP454vNqxexRiLHnqrg1gUCurHfEezQd
	55x/wwu8YfMQykwDWVQ1gjX0eC4YdxfzzF4miBIUsZFzJTK42TUHbxNGYrSn6zLLHFw1C3cdF86
	Y3kJn/lf0sKmXRKCB1H+z95TJ0dv2VhXD5cuJgFeKrawI7ljhYS8RImbI
X-Gm-Gg: Acq92OGLyf5ac4SamoIvygwZVPovRvJSGJfXZmvfITClUhGnUiMtj0C9/evSRp9t9xs
	uiGHIwitXEb//6TENmp+SXzqSsSGluSsWH2jcLAim7OCJVYlVROifgbJoh0nErKsVEifuPyJvte
	80Gay2ioSDhkoqgMVtjkmrvFeiSrKC/L5j5c8xFxqICnObkTY+fXIgfyRlr1TbEQjNt35D30lsi
	81cRhLdsI2jrI0zQk1BKHu4gbYXLwDM1BnnZFXalCxh3OiMEDA5/kqeK2odI2Z9LuZQI96pqEub
	0FdySc3PkwBlz0ZrTLh2kJ8RO3U/XNCwCBAgG4QHIxE5M7I/EiiXuI3RWKI0NbvNp1nKUCNjarz
	mULn/
X-Received: by 2002:a05:600c:870c:b0:490:b2a6:8c2b with SMTP id
 5b1f17b1804b1-490b2a68d7cmr31498225e9.10.1780398080374; Tue, 02 Jun 2026
 04:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529000106.2257996-1-dakr@kernel.org>
In-Reply-To: <20260529000106.2257996-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 2 Jun 2026 13:01:06 +0200
X-Gm-Features: AVHnY4JUvKNlcBZ7jut1VhY0EFa3b4OvoHyV8efxn_w3UI8lZJxRLR-PKLgkXcQ
Message-ID: <CAH5fLghfiSY66767FBzDkibD6+YUHXKdCeoYymsDp2i9F45RRA@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm: tyr: use lifetime-bound IoMem
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	deborah.brouwer@collabora.com, gary@garyguo.net, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2026 at 2:01=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Adopt the driver core lifetime infrastructure for tyr.
>
> Separate the driver type from the driver data and use lifetime-bound
> IoMem directly in probe instead of wrapping it in Devres and Arc,
> simplifying register access.
>
> Changes in v2:
>   - Don't return Result from GpuInfo::new()
>   - Use "drm/tyr:" commit message prefix
>
> Danilo Krummrich (2):
>   drm/tyr: separate driver type from driver data
>   drm/tyr: use IoMem directly instead of Devres
>
>  drivers/gpu/drm/tyr/driver.rs | 29 ++++++++++++-----------------
>  drivers/gpu/drm/tyr/gpu.rs    | 17 +++++------------
>  drivers/gpu/drm/tyr/tyr.rs    |  4 ++--
>  3 files changed, 19 insertions(+), 31 deletions(-)

Applied to drm-rust-next. Thanks!
