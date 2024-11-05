Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A6A163
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800197; cv=none; b=PBBUUfiqRPmA+/iJdH/0y2WXzFO18jeKHeHzRx5tqrHrPAmUAslV0YVSwsb5LaobhDvGmPE05uErCi4fs8NZEr30L94bi2vmD4Etsy1JRD6wT8XIHhidzsxwDFfRs7c+Uoxe3qX2huAqaiII0pfq1J7k9sfy8wrIAmQKgqLshuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800197; c=relaxed/simple;
	bh=IXb9cQqHT8o8aMKgG1mO0NFQOJzW0wjEJA3r2RbQkpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UCVCvkv3LrDi8u8Nurg9+myTAwgEiFfo280eswJiL81xTUvSOjZoRzmQ0s0KoXSZdiyqQbUx3S/h8Gi+zoV8EgqjRbrTG1amNqgDscVqpacxavLLR7jjTxwjNOxqJJ5ML2OGwiBd3nT5Zh69sZ8xESpxMVQM60SioUlKy20J5tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ujbPv36o; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ujbPv36o"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so4711675f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 01:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730800194; x=1731404994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXb9cQqHT8o8aMKgG1mO0NFQOJzW0wjEJA3r2RbQkpw=;
        b=ujbPv36oBPGkTh1XbubBls8aChNRggdkUpUbyxhBRZbFb9fDFAADjtfMDy125LrjaL
         JEbAc1/ysmIH+TW9D63JlyyHhqdzV03KnjqozePQWrUmO1cbQjZlWFXb5vl/0F82Ff0C
         BKcFEc/50ZNLBgSF4YZarsaVmqhks5WAFUk5ToC/b8IxJbQ8m4gGZn/gzPcBiFTggKre
         PmQl8EPDaM/lujhM4JuiDeOwRyD2bQfR4qjDN4KEu3CATkzKTbEGzeWNqzE5SbO4E9r8
         /kT9G+7hUWSnHBgQHAceXT+B+5cjbVU81nb5v2hdDznhUbYg6mv+q8qbS4jFH9q9znrA
         zJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800194; x=1731404994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXb9cQqHT8o8aMKgG1mO0NFQOJzW0wjEJA3r2RbQkpw=;
        b=gXLX029/G8FWHjJdlDzVZ1DVKEJ9HP9HEqukQryLdFotQvsT8+SJdKkXCN1zRttO4w
         n4kQvMlKqDl/X1pjLoOk8diy9mwIIc53iPrjb8+7gj9MppXLxwaMhsEnW2E30sDlLOgx
         I8UZbFDNwIS5wA+g+mh18x3iJBrGqE5xVj3pInhJG5oGxdEZuK4jb1oEEoGx2rCRUW27
         xC7rGQVYqOl9NHrOqix9zNuWxo6TpaG++sMB0r1WPqVu5vVdEsD1a2gYoDTVm8FwkPf7
         0jyWzx2s9yA4G1c7KCfhx1mniFl8v4shVUr9m27qtWfcUekuer6F0xtourAHGxX/wdyt
         L36g==
X-Forwarded-Encrypted: i=1; AJvYcCV8VxZ5DaTf+USy2UirF9MDhdK2n602dXon7wijTiud8dW28wZQiFr6GCVkG5pmx7ZrL0ypvt6fmm13BTTB3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT73BWoAf4XIc5j7l5G9xnxNPEOLW3C3DxkQ6aEbAXnOb9TD93
	JELsjWkXHHUk/J2MFrW/jndhf59Irih9ffr4LbWVVgvHVfdB4qO90piajUUPbaInpiAraSK6mvF
	9VswRWs0dl7vS48IFD0+tzTWR0SAH2vqJ6dPd
X-Google-Smtp-Source: AGHT+IHb8iA7M2SPqI88lSUscw/3UTlhwxMNkAwwv4ZX4xjp8BIP6ZjG/FCGGWfYZrk+M2H/mhpY1r8TPmAqDd222uw=
X-Received: by 2002:a5d:64c5:0:b0:37d:4c40:699 with SMTP id
 ffacd0b85a97d-381c7a467admr17707898f8f.5.1730800194047; Tue, 05 Nov 2024
 01:49:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104140514.877185-1-2407018371@qq.com> <tencent_2E70D3E99973A54BB6C3590393365CFA6B0A@qq.com>
In-Reply-To: <tencent_2E70D3E99973A54BB6C3590393365CFA6B0A@qq.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 5 Nov 2024 10:49:40 +0100
Message-ID: <CAH5fLgjO9=r5GMv2hXjPmRB8HAB-7EELhgB2NM2DQvw7h3HjMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] rust: align Debug implementation for Box with Display
To: Guangbo Cui <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 3:07=E2=80=AFPM Guangbo Cui <2407018371@qq.com> wrot=
e:
>
> Ensure consistency between `Debug` and `Display` for `Box` by
> updating `Debug` to match the new `Display` style.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Guangbo Cui <2407018371@qq.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
