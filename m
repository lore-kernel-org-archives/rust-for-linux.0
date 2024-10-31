Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAC514F121
	for <rust-for-linux@vger.kernel.org>; Thu, 31 Oct 2024 14:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730383430; cv=none; b=PYHsCLaqpdTzNVFC+ZrYOAixvaFYgshe/4BoWccxHF3j8Pt/gUSEeABpk+aFLDrw5wKq4lqR+ivZ2hfZjhUgZQohL/Oi+Xi/oyQ5+xEacPai3RwyQ4ulnmcKJvocD9OME4Ehtc49TBueGcGb6AYh96ImL9qf6pecUi3osPaLSFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730383430; c=relaxed/simple;
	bh=/ujG1cezyJOLtrJGpOSVlHT/h9268ICutSdVP2Ou40Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3euGL4JMHYiZVfKdiXPvWCZ7RgjhNyJbs3xW4pbfWXiEFZZvC9FWX73U1/PEdBqcFzR74vG6dL3EO23s1zXruwuft0RbzKiOvtwq7UHLZMwv2PXAeV5c9HVXZ80AoBRY5lcSqpk/GKvl6cYw6NJtHoUSj/u8C7Jd0kC+1yukV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2x67lOBd; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2x67lOBd"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so541664f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 31 Oct 2024 07:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730383426; x=1730988226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ujG1cezyJOLtrJGpOSVlHT/h9268ICutSdVP2Ou40Q=;
        b=2x67lOBd4axvrilCA99OAdT7oI3WqCHOv0489EHHahjCpiaunmirfy+sxdvBwJ2w6G
         BxaHxZf0VVqKeE7ISXJ2Oh+fLobtsO5QWFkQ3rqiuKrDw1F/UBrUavAAutOq2RgzkT8w
         Zaco5TZLD4b+nDRs3jCoVJ4So4mal3miuJQgW5I3nTlBj9vH6Px3NwyKV1oSSvszHgL+
         DEnqu6zj6C6PuzSpfSLY91IDglEy/1OXNkv84blfPSSF0FKSwP+JtljPBSCp31yRzm8W
         vQC0q/XNe96/8WQTsOi+uJ+Oi4p8hM7ZCN1Uu9HODB4ZZlJEDL9LlY+pr0uc0zrx8xiS
         H+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730383426; x=1730988226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ujG1cezyJOLtrJGpOSVlHT/h9268ICutSdVP2Ou40Q=;
        b=a4BxE5fpp3TdrhGf2wfuzeOyqLNU4iG144XzbLbdrtnMoxTnuBWQzGqcxdEAJ1Y0a0
         0WrHAyt+DWmNJipDkedSqvsJmcysxDjx3YaA5CebqZyQU87Dp22hcvZe6wSiIONmnR1E
         DhTUGiw7GIc4DvcH+U41e6ayErl6oLqBqBup1Gm1S1aVR30b6PmU2EVadvvfjt6Y+D3K
         mQx9sfe/+O+9FnJ6z1g2PdvnAtiabHTpO6tuqZNCDLad1hqmQKJZiM5P6iRGXs8FKh7P
         K/ME9Em3BH6iI/L9lFxKrF5Y7ZOX1lfCR+k4w8l/as+Ge4PiWSiA+ecJgPRN8K51qIFA
         Op0A==
X-Forwarded-Encrypted: i=1; AJvYcCX+W+T6y+v2GcHaVe2um5pdk9T2fSSq99o0fJNUiun9VQGOjlN5odm04WBRPQD+S6eDhTbJD5xKrISmDKzKAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjSFOGfcBgq2djuyaeil1PNcc+St7nBDeuMk2ey94exmoPA7j6
	U/hnmZeqhW6PqqFhhlNvsfWtF6EVkZjea0ARUe5wugisDL/nBsn+W3SiISJ8KUJxw2DSU6yhKoQ
	alDuJRAzP8d5gfrJWAFIRxUxN6UP60bV7UKIN
X-Google-Smtp-Source: AGHT+IHf/f0WMGY5XNed4m51/xvXz/jJNZeXwlI9IFRgtvyFISoVvCcIb42ZBfoVHnQGnw0bffjs/1UKGO7A1p8T41g=
X-Received: by 2002:a05:6000:1569:b0:37d:5103:8894 with SMTP id
 ffacd0b85a97d-381c7aa4a56mr46347f8f.42.1730383426371; Thu, 31 Oct 2024
 07:03:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022213221.2383-1-dakr@kernel.org> <20241022213221.2383-11-dakr@kernel.org>
In-Reply-To: <20241022213221.2383-11-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 31 Oct 2024 15:03:33 +0100
Message-ID: <CAH5fLgj1rd3b4aaMj8b6Rs77_t+LZApxK-dmP2gk98L-NjFyWw@mail.gmail.com>
Subject: Re: [PATCH v3 10/16] rust: add devres abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	tmgross@umich.edu, a.hindborg@samsung.com, airlied@gmail.com, 
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 11:33=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> Add a Rust abstraction for the kernel's devres (device resource
> management) implementation.
>
> The Devres type acts as a container to manage the lifetime and
> accessibility of device bound resources. Therefore it registers a
> devres callback and revokes access to the resource on invocation.
>
> Users of the Devres abstraction can simply free the corresponding
> resources in their Drop implementation, which is invoked when either the
> Devres instance goes out of scope or the devres callback leads to the
> resource being revoked, which implies a call to drop_in_place().
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

How is this intended to be used? Every single field I add of this type
is going to result in an additional synchronize_rcu() call in my
destructor. Those calls are pretty expensive.

Alice
