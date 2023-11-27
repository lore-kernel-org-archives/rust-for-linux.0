Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OJl3mNIL"
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FFD19B4
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Nov 2023 06:01:16 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-58d08497aa1so2570510eaf.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Nov 2023 06:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701093674; x=1701698474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOw7FonKD9MbC43k524zBSSsF7xxQpwUCU29NYnvaYc=;
        b=OJl3mNILmZTiqrlV73fwESfHGqesPKULezY5YoR/hoWDnaKMpNhk3Tf34HBwaROh53
         GcRQNkavgyhK9b3+098L8JGZ5gk1VGIVoceM2ya11oDvjHs8ML99oIHHvKZV6zt4ZE87
         mHKGWuejAx+slrIJKQcrayqNUpy2NMQIt6kLohbEvCUTQuHf4YbKiVel/cKEHLM4N4YJ
         y1g5zPBP+mzfFDGIVseumrYEZLUHl47waAS3tAlCtFGN57KnOnjfH5j8TjY4If4PBpKN
         WbAqpr9D41bcpP+VC5rcojcdR4IGZIoMA4QaSqv3JY87R70OWeeb1cJPvOYXlnZXgp2F
         DUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701093674; x=1701698474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOw7FonKD9MbC43k524zBSSsF7xxQpwUCU29NYnvaYc=;
        b=sy9QfT+VCe5UuxGJw3/Tqvqnk62hGyhvZK99GnGBVWCWxsvqRcAtihVXo0wFaWbrRP
         mXuJ2awRhMMbOidF9beTXi1TY15ZgjzM/fQZSFzjwhOV+deYUeWXgjoXhPRJXB40hJTE
         uOAU0HAK240QOfi4mN8d3sQaiUCw6DZ83R7A0HonjVtoPI+t9Gt+tPy+glKU0RBU/Jzc
         3ad3kwEou6PgxaLlTBwVE2teXxdmDwTLbp/HQFXCdet4tEUeFQCj0v/QqWRApOTpSn6a
         GzEcQF4Ndt0Z1U4kH05kbX8yC2JTnCOW2Ow8CJNs8CyxZmApsWQjdJvlThPOGyBdSOyA
         9/TA==
X-Gm-Message-State: AOJu0YzjbeNDt82jgalvs3UFwftTTr9n1wDpfiB/D98zU+CCARt/b8ET
	95NPPlPYGoE9UsxF4x1mBgrWMEx9GZZNkODZ24uqRw==
X-Google-Smtp-Source: AGHT+IHW3yEZWLUXwXW7lR4kIYc6dC4HAOI3WjIsnCEwT9kCuUBav8/wXNjJwUSjpBcw7tbU4EpOfyuvEFAszzuQaQ4=
X-Received: by 2002:a05:6358:4407:b0:16d:abc7:bfab with SMTP id
 z7-20020a056358440700b0016dabc7bfabmr13836740rwc.15.1701093674044; Mon, 27
 Nov 2023 06:01:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231118013959.37384-1-tmgross@umich.edu>
In-Reply-To: <20231118013959.37384-1-tmgross@umich.edu>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Nov 2023 15:01:03 +0100
Message-ID: <CAH5fLghnpHCXg8c3wkpBrsxNLZjZvNZ6QDqu5rBJ8xPNkHSCAw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: macros: update 'paste!' macro to accept string literals
To: Trevor Gross <tmgross@umich.edu>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 18, 2023 at 2:41=E2=80=AFAM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> Enable combining identifiers with literals in the 'paste!' macro. This
> allows combining user-specified strings with affixes to create
> namespaced identifiers.
>
> This sample code:
>
>     macro_rules! m {
>         ($name:lit) =3D> {
>             paste!(struct [<_some_ $name _struct_>] {})
>         }
>     }
>
>     m!("foo_bar");
>
> Would previously cause a compilation error. It will now generate:
>
>     struct _some_foo_bar_struct_ {}
>
> Signed-off-by: Trevor Gross <tmgross@umich.edu>
> Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Since there are no other replies to this version, I'll confirm that
this still looks good to me.

Alice
