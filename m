Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671E428E0E
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Oct 2023 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NxdO/QcP"
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50954129;
	Wed, 25 Oct 2023 09:56:06 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d9beb863816so5091308276.1;
        Wed, 25 Oct 2023 09:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698252965; x=1698857765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezNV1NENiP6KBX98JXvJ/eq70zrlc01gRGtk3N/fJGc=;
        b=NxdO/QcPhLbXQVKIB2Ai46gvdkKGsF5fsVA0L874EZ9MLH1oEzF8OqkBC2riycjXqR
         H6fsF/2GryxXhY3xp405joy9k7I0bGiBecfy31ZbTRFyBIm1z/a7rLUh3JoutL6LNVvc
         NvMUsMevlWsdPyZxsYnixZTzpPeyq45sl1QlicthwulFr1jVz3EhIi1K05BNvfDCW361
         +8A+moAeEZpFc0WjWBumUBB3pye9/AKQOjMssizykI0fGXQNhWHGpX7pFOiJirNsaR5k
         2Yc3277SMrSZ34F518vUwZFHGGbfoGmKrNA1iRauNEGr5cuY25B2f5cA06XWyzNJX7jk
         6b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698252965; x=1698857765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezNV1NENiP6KBX98JXvJ/eq70zrlc01gRGtk3N/fJGc=;
        b=Z+lN7YMf5DIiWPtlGp7APhtJB55y/nbgJ85b9SsTEcghHyHZHAdmTP1b2tBClo1kDA
         z0RaXOOy1Y+Ni4vt0MzNXPvYMCtkZLiZ2QL2j5M+AaHcNQUdv3Wkzwu+rg7MwGcBqHsB
         xtjq2XWy2RUFYWU1uZRXoSXPelmF5rwvb90R1s48pH73M6Q6m4dE7J4AR4QEzlldw+5U
         Ywq7uO0Z3FhzCJ696vjsTTKxCCTNYNaqOxYxH0ZKmanjffS2LvAvPeKSvdix65XCXI1I
         KNEaV4oo2RZTQ7c1IT0/1bP/NxwSiZdPEBHmwAsyBTKsq/QZHkHKMcYIC3qrPIBp+NQm
         HSvg==
X-Gm-Message-State: AOJu0Yx8kJviWk3Xezk1/AstkEXHNIWY2DRpipC8S2Q8i5NuIsyAx6qK
	R14Z87Yk+Fg1R05lPRXFj8jurS1pYGTccTnUr60=
X-Google-Smtp-Source: AGHT+IHyzol5ilHFal3eky2BDnngGqTplq7QvQFuTNt/cHcckhlsRBcb3ZdI/2OZ2gHb+8nVlcV+UY9Lsqa6vLfqPFs=
X-Received: by 2002:a25:d281:0:b0:d9b:453a:5426 with SMTP id
 j123-20020a25d281000000b00d9b453a5426mr15819811ybg.56.1698252965504; Wed, 25
 Oct 2023 09:56:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPDJoNv1HW-5uCj21PX3t23rJ+sbTL4Gm5pDis8HGJ-VTr4dug@mail.gmail.com>
 <20230714140201.383439-1-aliceryhl@google.com> <CANiq72n8-b992D4RbwUtuEUxXfJYQLNwfibgWSyspx-HYJ8+8A@mail.gmail.com>
 <hwqyfgbzbnquby5v6zby4u4pbyezzcsttt4ee5x7lw5etpv7se@kvarclpucc7w>
In-Reply-To: <hwqyfgbzbnquby5v6zby4u4pbyezzcsttt4ee5x7lw5etpv7se@kvarclpucc7w>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Oct 2023 18:55:54 +0200
Message-ID: <CANiq72=h_NkDsXrd+6TF2fiBdo0nfCbvgwqZdDSnaCFwYEEP_w@mail.gmail.com>
Subject: Re: [PATCH] rust: kernel: str: Implement Debug for CString
To: "Ariel Miculas (amiculas)" <amiculas@cisco.com>
Cc: Alice Ryhl <aliceryhl@google.com>, 
	"ariel.miculas@gmail.com" <ariel.miculas@gmail.com>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>, "benno.lossin@proton.me" <benno.lossin@proton.me>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"gary@garyguo.net" <gary@garyguo.net>, "lina@asahilina.net" <lina@asahilina.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "wedsonaf@gmail.com" <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 6:18=E2=80=AFPM Ariel Miculas (amiculas)
<amiculas@cisco.com> wrote:
>
> Any follow-up on this? It sure would make my logging cleaner.

We were expecting a new version, but I can pick it up with e.g. the
message that Alice suggested (i.e. marking it as modified by me).

Cheers,
Miguel
