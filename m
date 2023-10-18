Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845C142918;
	Wed, 18 Oct 2023 21:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsmOaVR4"
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403334783;
	Wed, 18 Oct 2023 14:05:50 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5a7af20c488so90300067b3.1;
        Wed, 18 Oct 2023 14:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697663149; x=1698267949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXgwpoEmQGe1TS0FZv1gFNd3LQ65wOIduIw3gMeeQsU=;
        b=MsmOaVR4VVJTJbE6+sqdD70wKsr0CnWf4GDDoyWDe6iEtbR+fLHHUjodpUnvhhAw2r
         KxsABYqwhAi70YZCKo5ecirsullL321EAf0uLq8cKdMWVFVCej+uU+TW2RA8n2r6jDCU
         UY+4RDEyZlgHQuToaXDCOGuGL8XZPmXjW+VdBXxFmVWXL1b9jtTwmWYw5lvBcYIgc9Gp
         qiNlwOyC5Kj75bKhbvIVR7/4ZCunNRA/hcaYghP9P781DSvXntI0rnSjy77pGshxAdiD
         IhGgEgQw8AwEHOF1xJSDLSZ22u5Zqxxn2sexQ8S9/VuIDYIozS+panfINuVfzXlN3FRP
         kgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697663149; x=1698267949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXgwpoEmQGe1TS0FZv1gFNd3LQ65wOIduIw3gMeeQsU=;
        b=Wdswo+WgC27iYoLPFAKoXbN6G0JftaqtZOpbAw4fx9CKM6en+WU+aCmzrbre0Whv6t
         2QiOueSjVv/t7ONRKVgBV5Vjap3TMM8TvO8e7gGwnQfi5AXT0rB9G2pXPlYNAmJ5csy8
         ZyB/BAUBE1nMYuEgyydJ033N8MiQVgWQPA54h02iO+4oscNc5nTsOwT++dtkxLA9/vlL
         cR+b+5HdS0oyChpYwDjoNDSzMq8hAx7VzCKhYn02I8s9dw8TwnjetSLiYTAbVt46YLju
         hgdvz33aRXEhLe67Eo/0CJQyFipxDXWdCGaRa8hmbOeCDZRUis92dAcAJPYvo5W4YX9u
         0QBw==
X-Gm-Message-State: AOJu0YzYMQXOMEu+jpTQTBVmmizIu18UtNcUChI5Jp7UEqWii8BPi72Y
	0V6q84/p9qNtEIpCHbnfkHh2XAnXt8oQzSp74To=
X-Google-Smtp-Source: AGHT+IGcIykGrNxI2WdLHRb+V3eXK86nmXV/VsdlJY1JvwzKBV7IrtCvoDXzBglo1nYM4Mc9IH/xMBMekjcxEFHS5bo=
X-Received: by 2002:a81:b40e:0:b0:59b:c6a4:15c7 with SMTP id
 h14-20020a81b40e000000b0059bc6a415c7mr406578ywi.46.1697663149202; Wed, 18 Oct
 2023 14:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231018160922.1018962-1-ojeda@kernel.org> <d47553f1-1832-4c69-8a8c-71c58048ff30@lunn.ch>
 <CANiq72=E7TPLcq-yiQF9E8a33ghbogPcbv-yMqFKBxMQ0oOxNQ@mail.gmail.com>
In-Reply-To: <CANiq72=E7TPLcq-yiQF9E8a33ghbogPcbv-yMqFKBxMQ0oOxNQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Oct 2023 23:05:37 +0200
Message-ID: <CANiq72nmtkupLXiCVyTivS2QL_UeXu5y5g=JBra6Wik1a7E5dA@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: add "The Rust experiment" section
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-doc@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 6:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> We can add a note to the Kconfig symbol too -- would that be OK with you?

Or do you mean you think the Quick Start guide would be a better place
given that is perhaps more likely to be read by end users that want to
just compile the kernel?

If so, I am happy to move it there.

Cheers,
Miguel
