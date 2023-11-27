Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zUVReqXG"
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE753C3
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Nov 2023 05:51:45 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-462d3c7a413so457681137.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Nov 2023 05:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701093105; x=1701697905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMC2dnijtD4khPHAqqB1pZiXH5MNG4GoOpt+koRnosc=;
        b=zUVReqXGxGgtgf5yVcrVSTHhPISLrWbc6ON8IXPmgbKl9/WJoQM07AohRDTFOd9+v4
         0gNaYTV2lZjivamnvwX7lGWwHcnYs/uDBX3Yyw98pnlpJ2PfWz9VUOo4Da69YJtN/O8j
         2AHSzyfwblMroCx2zMK1hvrwurfPn3qGXLERX7tIOJ8affv2+AkzNpLx51fMonRnmJhX
         zI9h43CbGH25F7FvjyXU2/sxxpxxrXQw6XBbwgrcVGvDkDkXmjcgbBRoGDOSor/xMMEn
         HcXZFtY2vvrCfrBm+fW4rALaAE7qNU952+03bJQnFH4Kbi+1BHrwObu5iTcE9uNpL0M3
         mhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701093105; x=1701697905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMC2dnijtD4khPHAqqB1pZiXH5MNG4GoOpt+koRnosc=;
        b=X+oPwnQ/NYfTVHWapQFi+Mojq4edX0rPo7TV/Ec2USWtBXfctl1YkejPHlfHCmEqSh
         YW1yPCXzwIgkNXntXLUn6UvKAkBNwDED2pODh3Fl3NTEjFvYsmz9KyOdaLXNxceaHOfI
         FU5XwnefcUYEoTKcMCcYEHw0uk8uPmxCmKfkSFhg2R9PcpkcSdRcDBFT7tozKjwRaKyV
         N/u1diFf3JmiJtuufbIujlAuMTC+a9b4RDk60L3iaOJWoiSKSBjZ8/vt6sSevGVBXX+g
         N21BdTAPFxYzB5ZBiCjwpSVBHp+Agycx0OeczJuw2ZLhhKwFVAKlcrwjvjZAZqKtt1oM
         VX/g==
X-Gm-Message-State: AOJu0Yw+HrIAH/9QJeYAplrcJHDjDCf2sI8WxHrrrrhkkOV3HtueMsn8
	FKG/b5boM/oEqP2JCdW+bf2VY9ULvlfMelGoHJXHcQ==
X-Google-Smtp-Source: AGHT+IEsWzj9GuxG6VOnsbKao/08owiLRnFHo7syGCtDscrGhqb78aY2IclgRxD9NaO9P5YFmfA/T8t1k3AdN37kocU=
X-Received: by 2002:a1f:4b81:0:b0:49a:9a34:ec40 with SMTP id
 y123-20020a1f4b81000000b0049a9a34ec40mr3211876vka.2.1701093104863; Mon, 27
 Nov 2023 05:51:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231126131210.1384490-1-mcanal@igalia.com>
In-Reply-To: <20231126131210.1384490-1-mcanal@igalia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Nov 2023 14:51:33 +0100
Message-ID: <CAH5fLghV0jtXCJ2aetH9ZNvJ=Tu-48DCjNQMPxAWf1GW-1Mbcw@mail.gmail.com>
Subject: Re: [PATCH v4] rust: xarray: Add an abstraction for XArray
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Wilcox <willy@infradead.org>, rust-for-linux@vger.kernel.org, kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 26, 2023 at 2:13=E2=80=AFPM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
> +// Convenience impl for `ForeignOwnable` types whose `Borrowed`
> +// form implements Deref.
> +impl<'a, T: ForeignOwnable> Deref for Guard<'a, T>
> +where
> +    T::Borrowed<'static>: Deref,
> +{
> +    type Target =3D <T::Borrowed<'static> as Deref>::Target;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: See the `borrow()` method. The dereferenced `T::Borro=
wed` value
> +        // must share the same lifetime, so we can return a reference to=
 it.
> +        unsafe { &*(T::borrow(self.0 as _).deref() as *const _) }
> +    }
> +}

I don't think this is sound. Deref could return a reference into the
`T::Borrowed` itself, but it doesn't outlive this function. I would
either omit this impl, or provide a sub-trait for ForeignOwnable that
provides a borrow as a reference.

Alice
