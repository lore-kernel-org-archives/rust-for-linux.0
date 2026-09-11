Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4580471CF2
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Sep 2026 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117802; cv=pass; b=gH3+A6cGD4PVvDX4pMtxXddz51UGfYxzCJmMFYaV7teYMZ7jkFvWqBwgnfZcoX2FV9AS9kXMsISNWy1DVLrrYv5/oBKOXlByVYUCMygQuzNuO5tNaERHYUx5rgcwnDv0ZjzAixTNkOzLGfwCz/4OxXYpY+UraAGbTP952Ig3/u0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117802; c=relaxed/simple;
	bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWUA/wJuCADytdSiJ0T1gzKB2zapj3mDgn7NMqGN+aDOcaRgB1c6uz2spWglWP7YF7V9QwE2DbObM62nEwGDpNH8LLotxvsJg9Xcy6KqfFMX6TgUhQP2gsZjxHSFWNUwTa3VuMfkJ2mQ9rT11v7bBBgJUh7EsT/0OFTLN4ggyMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MSlPe9Et; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MSlPe9Et"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-485aca32ab7so108217f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Sep 2026 02:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789117793; cv=none;
        d=google.com; s=arc-20260327;
        b=U1CPRZF/BihzjyY65EICn9Iw5YzfA92O3BSozyM+dJNTvJBbAuGlP6FIrAtmmx/8WJ
         0PZ6DgDCs3ZhXNhGqqCPSnZHhYakyBdRUPiuaTNZIJ/BtLp7Tr/7dswMtPw/lzV2DxDc
         RZto/I1KsL1lFtThYQQGXYTlS4VwCF19okKUYXQ7aDtUIbzdjfiBz+RNBHhWNgYyl1tf
         WgCiMlfdq1cYSpC+Qq85FYbDsI/CNV/WPVZ6DOyR7uiw/gEX9au85WsdPfVyuP45qkLv
         CqViwwNuRvbWZbG2IhZ0v9ztJUcBotU29MnD77jSrc48NzdHC2F1v4lIrDf3MpuLKTWv
         hVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
        fh=AHuvbM9ruVeSiYT9uQsATbTYRJMsND1TGcRwfl7ugt4=;
        b=LkyblGGx1OaxjdPslDyGnoI8taruf2I3w2BrdvyY9bujqHlClEpGj7nesLUX016v7n
         YHFeZY5Jxz4Nnnxa7nlQfWP0OeWMBUM3A0GQX4iM5YKEdhs5TUle5o7p8uU0OhSL3hfV
         uZgss1LgT5E8RpUHRToYiPirDkHqqdZ9ip9yaaleEmjS0SJVdOrbzBtS+tYhMtbHzRNh
         LAEk/zxun0F1lK+9Js+njzPZ6GUpibKlviB6MnVx8kwlDDZ4DyLX4ovDy/VBiZeMYNah
         wbMNBUvbjWL6m7u5FBUvmqyusSieEGGz6+KxJe/K0fa7udCvQtCfCpXwZppukvZpRkhC
         TUYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789117793; x=1789722593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
        b=MSlPe9Et/aYooxs+mmr25pr80uFZG23i1Ff+HYNwoUYblRVkid0l2inKFKvyYhCHpA
         74RMEIvUI+LYnoLKLKfOmV3XsO+idJkaF0kKg+yth0rRQtl5E2y2iqZ2+BzrV44esGe9
         Gfqu0/0FtTeTt/gj1nMdkeGllp4GG8/dPMW6SAduAajB2PJTTh0EyTtISUFtDK6olxs/
         iuCpPN7ycYnpIx1qtI10WS4KO12IM90KAskYtoHYQeaRXYEsRQKGp3BGi7i/JLvOBusZ
         K3RJXi816wGUGyT/m2NeekI8C+6tI9P5dFmWFfKhpigFYWlsVGwnGy/m0LuueQHmrlvX
         Kr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117793; x=1789722593;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqoU+uWaz7+Vutomy33tnRZ5BBkjj/lsKZ4FCxPriAw=;
        b=qGbD3vS6s5LvCl/By16LobkWm47LauAp8hx08PD7F42YdUDWV9ZYLHJCyL2jzBVOfl
         cEGGCYsNkcTJUjSTs4xh3clhW0iIa4tq+y1ph/zmG/PVCoT8YNrYqsYyz0tmu2VK2T15
         L6IoBu1HGkMQIFTap/dOAIsfSV/TGmrptB3Y63aIgw/T4rcLGMtAzAjXiUfbNsgq6qga
         BN3GSULKLBMetwPgaMdATh9r/3aCjorrCDRjFiAs4tj76kuglbvBa6gOH9ZkcUoMiKUm
         Ls+8Lxpi08WFv9mUj/GfQGKowz9Z1gYyYSVywrog0XQs3/OSPUnNeMxaHFRbdbOtPs+G
         +wpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJntNDddZ5SoyPDK24vbR4mtmvZBFF5rBFoFE6n1N4PTnhrJosynEQGBfpKA4vxnjqR+V5uFwqJNAefZiqjg==@vger.kernel.org
X-Gm-Message-State: AFuF++n7syHGKR80hx1J0UHxyDyoBA5K4guwLaIzMb7QIjjtIaWyMFWb
	UtXiLwluHuRaFcVolPEm3ZTrZzzQFbpGBPOcKwaSXfXrCvKVeKgBhi72jIlnVFQa2eZCi0t+MS3
	9YJ0/iZ0SjqtFXOvcsmLSNyVA3KcPw2f/nWCjetXb
X-Gm-Gg: AYBFou0MrMaK+aqiGWBB0qlitQIPKpcUs0Ryb5UQwE43Toio2N3Q4K9As482+oeRbL3
	ph7csY7QF9IEaN4qq1lUxP0symPa6Gzfs77s4UZbDquAP2PcdMfttUNz3hUbsq6P6peu7RMtn4R
	tbozgdywTpHweQj/bD0zJ+lHJld2vLcPVW5JTYK+4SnON0k3N73/3z+WE5R8SXpJ+7J0js8S2Ly
	QiJ1qZqIE+50gmBQ6+VwFefjfp5BOe4qwszgKB8mZqDpfDWPlzKC0JGZDGTus3Z5w1bbLKL2MtH
	tdjjjyNBYNteYwcXwafdCGt82xZesvwdb7853Kbp/uTX7s7tw2BM/6dzqXt3kh2a/fKK/Ra96hF
	VFPUoP8Ay+0Dbc8Y2mfkoyYmO7Kipe5M4iRGJYoHb2S7mfxcfbTF9
X-Received: by 2002:a05:6000:118b:b0:485:8c16:5ef0 with SMTP id
 ffacd0b85a97d-486eb2fe6e9mr2544735f8f.42.1789117791504; Fri, 11 Sep 2026
 02:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-unique-ref-v21-0-e83257373062@kernel.org> <20260910-unique-ref-v21-5-e83257373062@kernel.org>
In-Reply-To: <20260910-unique-ref-v21-5-e83257373062@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Sep 2026 11:09:37 +0200
X-Gm-Features: AcwNN1U8uQc4Zj212gVRashrRro-WErwh8uVMQ_MWKQsPaL29993fZfZR2Hn4U8
Message-ID: <CAH5fLggBGvXayMT2QGo5JeQkYeJYc0L-348-kKLsBs_g45-fnQ@mail.gmail.com>
Subject: Re: [PATCH v21 5/9] rust: Add missing SAFETY documentation for `ARef` example
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:02=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> From: Oliver Mangold <oliver.mangold@pm.me>
>
> SAFETY comment in rustdoc example was just 'TODO'. Fixed.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/351
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Assisted-by: LLM
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
