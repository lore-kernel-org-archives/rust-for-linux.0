Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9EE1E98EB
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560114; cv=none; b=e5ytJh00zc2ugOrXvFVbjJTSzUEg4gGtu43kRRhxnkKOO5XYLKLsloCvKh/ANGyBNUTOAy6nDabQX5QcQWnRW8HyvOOGbU/vjmzVCIP32To0AyIkbn3Ni7LZMr2iaA9MuVSo8ssC38FK72brsKsZuwE6XlKySGcyo9uO5ta5CK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560114; c=relaxed/simple;
	bh=xNTdXsPV7ZLLw7TInR7IVWdNotSiaVd6/yq6CpjdPNI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ddYAdN49w6kQo7vYupoTYRrlqymv5lSrmCbqhwr28CkHzaQTHlGZs4hFhPJZSret9l8U0O11x65RN36M5Xu7O4rXATfwM8/fgk7oX2CJwMlI304tVQ6+QjbkAG+5Drp6JDERGsN/1Ua/33LdctWo9nudTC+GCmbsLiWorOmL2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=djTuvp78; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="djTuvp78"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf446681cso10176815e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 05:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742560111; x=1743164911; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b5TcWZiE0ilse5UvOGyrUMGqPLytNxTeNJ6aN4o6LPo=;
        b=djTuvp78Hd7WYLs7kv3RNP7s7vmIuHPSrN5tSXBHpBqngQguGzoB4qh/As8psd/+4x
         l9SHG1NmeMK/2AQ9dh4xklezwyozDJdb5NvVNex2euqkpsRBT2v0ZU4A2MrCNp42XWtH
         sHzzcJLWhELOJHEj9A3fW6ojN9lQTWVMQdyWePgxwS1mCjTbevhdy+SY6bmL9kLdXxVN
         BvQup3VsA6A48cj4ZYuApwcBMMBY9erzwKG49i2pzLxZ/JZjiAc9WrMc6XVfNcccQcA5
         coxrWuC7LS31cDQSSHdtHTRWeTv+maW0WT7Zzu1kPxjqDXsxxgKixXhDK7gWiSJjf++i
         RXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560111; x=1743164911;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5TcWZiE0ilse5UvOGyrUMGqPLytNxTeNJ6aN4o6LPo=;
        b=cMaD0O75q/0cIqmO02iuE7K6v6Z/3CDAdIpl5876DdMjx1WSt383rBFGWUuUw1XOwk
         yyi6YWAi6TDhIvegBX1z/fH67Zryhjqk2LWal7M6Qrj/f1Rdk/h6xQktqJJvNkUh7NCi
         NR2bfz94QKScxT0yXd2eSxWI5lyvyatLu5YNFOt4OzBPsaJ3+novpnEx+6zGMm3etxdk
         msKGMfLYOvChTN2VnK5I/FzsbbpIDwtZMZpR0OKeG1zRX1rCVIQSGzXNhE+3+FuqyrSC
         LxgOb8fmd/SUgdHQbjS+H+/7RhjnboPe+fLw+xheYijIduQlgsacS3nQZZUYh/ylr4PG
         BcEg==
X-Forwarded-Encrypted: i=1; AJvYcCXUvVzgW9R5WD+eMvFvS/ZmZAER9cTyBFpgPu/XDmqrZRaEArOT7gWPcbdX6v4QDpn0m6f2VunahDVjURJfvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkNG9C+Q269q7dHy4UBX/L/TqeqakJ8aXBdlR1bIs6e/yJ0QDu
	/O+GUIsgy4veBwlbjruFATAjCua2ckc8F/paRz91bU2F2RsOERsOM1frlqjBjWdc9esHPeV+XfH
	OX5jKuoKfRxeKXA==
X-Google-Smtp-Source: AGHT+IENczTHdx1nb9pOMIzleGyvG3hLaKmxIgbwMngbB9RAPEpzfQoh1+OX1XkGUsZAGg09pVhxpuOz4Ajl+44=
X-Received: from wmbh11.prod.google.com ([2002:a05:600c:a10b:b0:43d:4fae:83fb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4512:b0:43b:c878:144c with SMTP id 5b1f17b1804b1-43d509ee50amr30863035e9.12.1742560111811;
 Fri, 21 Mar 2025 05:28:31 -0700 (PDT)
Date: Fri, 21 Mar 2025 12:28:29 +0000
In-Reply-To: <20250321-vec-methods-v2-0-6d9c8a4634cb@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250321-vec-methods-v2-0-6d9c8a4634cb@google.com>
Message-ID: <Z91bbTevB0LCp2qK@google.com>
Subject: Re: [PATCH v2 0/7] Additional methods for Vec
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benno Lossin <benno.lossin@proton.me>, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Fri, Mar 21, 2025 at 12:09:55PM +0000, Alice Ryhl wrote:
> This adds various Vec methods. Some of them are needed by Rust Binder,
> and others are needed in other places. Each commit explains where it is
> needed.
> 
> I'm not sure what we concluded on the set_len / dec_len changes, so I
> don't depend on that series for now.
> 
> This series is based on top of Vec::truncate from
> https://lore.kernel.org/rust-for-linux/20250316111644.154602-1-andrewjballance@gmail.com/
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Oops, this doesn't compile. Looks like I've already gone on vacation
mentally. Sorry guys!

Alice
