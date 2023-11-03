Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4376A14276
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Nov 2023 10:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.de header.i=@kloenk.de header.b="CfMEaSuP"
X-Greylist: delayed 514 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 03 Nov 2023 03:59:47 PDT
Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46AEFCE;
	Fri,  3 Nov 2023 03:59:47 -0700 (PDT)
From: Finn Behrens <finn@kloenk.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.de; s=mail;
	t=1699008669; bh=v88bXp/Pzz3KupI1R/cU3rgQhWmmooa/JqPJrqKEJAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CfMEaSuPibdpukZdckDsSViOO18i4SgpcHfb+LJ76DTVOZ7AB/2IuJ3vOiGpZw5gZ
	 2t19Q0GNtaIoq8X1fmmjUst0COoSGheRgAWi7tHU6xE4isQki/8h/LmR8XT0vydu4O
	 LrlgdIZ+xSGBHp9NGHPy7FZJbr0z7KeK9kgCi6pY=
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?b?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>,
 Matt Gilbride <mattgilbride@google.com>,
 Jeffrey Vander Stoep <jeffv@google.com>, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH RFC 03/20] rust_binder: add threading support
Date: Fri, 03 Nov 2023 11:51:07 +0100
Message-ID: <62F430CC-9980-4779-9D43-7D561D322C9B@kloenk.de>
In-Reply-To: <20231101-rust-binder-v1-3-08ba9197f637@google.com>
References: <20231101-rust-binder-v1-0-08ba9197f637@google.com>
 <20231101-rust-binder-v1-3-08ba9197f637@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 1 Nov 2023, at 19:01, Alice Ryhl wrote:


> diff --git a/drivers/android/error.rs b/drivers/android/error.rs
> new file mode 100644
> index 000000000000..41fc4347ab55
> --- /dev/null
> +++ b/drivers/android/error.rs
> +
> +impl core::fmt::Debug for BinderError {
> +    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Resu=
lt {
> +        match self.reply {
> +            BR_FAILED_REPLY =3D> match self.source.as_ref() {
> +                Some(source) =3D> f
> +                    .debug_struct("BR_FAILED_REPLY")
> +                    .field("source", source)
> +                    .finish(),
> +                None =3D> f.pad("BR_FAILED_REPLY"),
> +            },
> +            BR_DEAD_REPLY =3D> f.pad("BR_DEAD_REPLY"),
> +            BR_TRANSACTION_COMPLETE =3D> f.pad("BR_TRANSACTION_COMPLET=
E"),
> +            _ =3D> f
> +                .debug_struct("BinderError")
> +                .field("reply", &self.reply)
> +                .finish(),
> +        }
> +    }
> +}
Renaming the debug_struct itself feels like it will make it harder to fin=
d later, as I would expect that a debug implementation names the struct i=
ts from.
Also this has the fallback in CamelCase and all defined cases as SCREAMIN=
G_SNAKE_CASE. Maybe rather in the defined cases something like f.debug_st=
ruct(=E2=80=98BinderError=E2=80=99).field(=E2=80=98reply=E2=80=99, =E2=80=
=9Cname=E2=80=9D)?
