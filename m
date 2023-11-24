Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBTDbk3W"
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C5319A2;
	Fri, 24 Nov 2023 06:36:35 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6d64c1155a8so1227472a34.2;
        Fri, 24 Nov 2023 06:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700836594; x=1701441394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Vv0rtHfWtcFebZ1VVJSJKFyqw883ui6a5aqGjhf3uo=;
        b=XBTDbk3W92xAaznV+7HMHY/tsTgnKkLRg2qYMLhA1K0WDKuA/XR0OUqv2lrEHXSjG/
         fMASWrnk9E4QSK5jyKt2QprPkcPAVGm4cr4dfwMIxAjMuESWIOD/rSCkqQ64CaIFb0UC
         UhuYRFXkFc3d7SW5iMYscLc1s84Pd0rCFaRYNd1ZxEgIjLS6Nt2JAGDALJFegddQieym
         U/vwv+/AtQNk9fyHDedQyzOp4FLslL0ixuLve8uq/Ep7a4yuBMBilmvNjVzPhz5n67n0
         HifvRnRudLNoHX6WaU2eImlZB7IeHpXJtF/kb8+2a8w6i4r4JQse/qUNvW02zIyjzYp1
         sBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700836594; x=1701441394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Vv0rtHfWtcFebZ1VVJSJKFyqw883ui6a5aqGjhf3uo=;
        b=woAUJRNg1Yx5F3+XnZ2/RssGbvh9qpSp4UE7danC5yDLlXbv061ikBfYPMFQkGjYJY
         U1ZynUWDhT2LzZKc0oe8oCdVmNrNbKBMzOSZx44A37zkaouUppwNxIU76xamaYbvZRjY
         tQc3IOuH729NcBjf3+0f4KZaLOjYYYL2u++9XJOtO9p9hxlqGx+3WT2/J8l76bv9w0/d
         9Rtsdov0aRyPoMUQNUY/iNAetU9BKnTyi8BqAZ07NGrJnKYUFazmZddNifzpk//O8cmF
         ePjzCULDN+mbkl4APoPcQmD3l4/Kh3nRnh7JiEeOc20k92vxDAZO10wWTDHf8a39IHdR
         aJHQ==
X-Gm-Message-State: AOJu0Yw9GianI7VQ5YrLsMNclch5/feQ+Mm24vsZcQpLvKI7xsQjdvGk
	EtSfpXwQt+fPpg6F0glGf5uoXnLu71MMdwSsiE8=
X-Google-Smtp-Source: AGHT+IEY03pzmZ8WjFdDj6NERUvmAXkjntpYl8YDZb3VHn5YPJae3IFqKOIhxotTeHKd8zH0W1g0Q4xvV4raK6KJ0aQ=
X-Received: by 2002:a9d:6b90:0:b0:6c6:5053:66dc with SMTP id
 b16-20020a9d6b90000000b006c6505366dcmr3824415otq.21.1700836594307; Fri, 24
 Nov 2023 06:36:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231124142617.713096-1-masahiroy@kernel.org>
In-Reply-To: <20231124142617.713096-1-masahiroy@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Nov 2023 15:36:22 +0100
Message-ID: <CANiq72mHXkT972Othqd0t_EzQHe+mKvpRSzRXvhQqxXRqdXDCQ@mail.gmail.com>
Subject: Re: [PATCH] rust: replace <linux/module.h> with <linux/export.h> in rust/exports.c
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Benno Lossin <benno.lossin@proton.me>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 3:26=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> <linux/export.h> is the right header to include for using
> EXPORT_SYMBOL_GPL. <linux/module.h> includes much more bloat.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Good catch, thanks!

Cheers,
Miguel
