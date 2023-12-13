Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcBynjMh"
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F99BD;
	Wed, 13 Dec 2023 10:44:55 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-dbcde128abeso336429276.0;
        Wed, 13 Dec 2023 10:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702493094; x=1703097894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdwPGSTIX5rNBaIrl1/3GcKjIpCybVlITHwJ+mspW+o=;
        b=EcBynjMhbJlplDV8GVD3TVxBpBB2UmvDCNblL3rzFjo5krk9Z/BNeO0wLFVOikhE5w
         bf88QxyV+fHbyRotcJsisE3iW3zJCKG6wVcdjfu/JFa6Td5s48e4CubLJy7qUFPb2S8z
         btPo6HDMkLJm3frnp6c2NPayiYzTSciNvJAPFIKV3yNWPAJQH1m6/5XzJo2QQV4jmdGZ
         2mQlyry4jnaj6+MJp8cxsfnWl+xLaClGycAaY/vv4TcSnAoD2SNKyVuk/AZ/jSQ5r3v5
         TH9Tt6mmE12yvMLutJi0dQxV9yBO+06nMWFktqWKfgz3tacOdFQFJOq3OVE6RlsEmjyj
         OvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493094; x=1703097894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdwPGSTIX5rNBaIrl1/3GcKjIpCybVlITHwJ+mspW+o=;
        b=EKwdrDjOTHvyahcxRxL5NnH1kn9zMYc2ioeXzIBtH+u3UiRi3A8RWbawe+BKx4zDa3
         u7SbuLfv2qhcCEqn5oDPx66vbhVe7d1Q7y4BLuC1+LqxmxDvx56KfGG6GxxkUzzgjC+e
         NRdmTimS2JXduoZ8ZQWXWIZMGOl7HKlZgzGhHvP+ESeD0unkOs/G7wEjL5FJMhM09LLt
         7WlB2xei457x/5XmyTPfVgmvsge7cUL2it8kXKPeFuRZ5JbDAeN4UVAmDsv2lvcnYOug
         PWndR+i1NUVV4rO4t7k/DUuDNxYFjdRZZbAPgwSOufd/CoFy7ItT3YjOGFD00Xqt6qkV
         EVIQ==
X-Gm-Message-State: AOJu0YwdMXyv9wt2jlWBtoj/BGdOJxxjeK3rIf488JmKq08mAxKGux3P
	fODRmHV2kSknErNMGevHxdlH7l21kbJs4VFXPrc=
X-Google-Smtp-Source: AGHT+IGEWrG6AOQ1j/kuXEg1PgBXbItHE/v//whY15tM4pFXt/Y3bW73yg2wfa8ZYF5eN2vm6nK+Lm01bRQAgrkqZFg=
X-Received: by 2002:a25:2905:0:b0:dbc:66c0:574c with SMTP id
 p5-20020a252905000000b00dbc66c0574cmr5370192ybp.127.1702493094496; Wed, 13
 Dec 2023 10:44:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231026201855.1497680-1-benno.lossin@proton.me>
In-Reply-To: <20231026201855.1497680-1-benno.lossin@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 Dec 2023 19:44:43 +0100
Message-ID: <CANiq72k41VmCHLFk9TAmW3VrJ=hv=e_vaVV4fjusgErVr_UmOQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: macros: improve `#[vtable]` documentation
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Asahi Lina <lina@asahilina.net>, 
	Sven Van Asbroeck <thesven73@gmail.com>, Viktor Garske <viktor@v-gar.de>, Finn Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 10:20=E2=80=AFPM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> Traits marked with `#[vtable]` need to provide default implementations
> for optional functions. The C side represents these with `NULL` in the
> vtable, so the default functions are never actually called. We do not
> want to replicate the default behavior from C in Rust, because that is
> not maintainable. Therefore we should use `build_error` in those default
> implementations. The error message for that is provided at
> `kernel::error::VTABLE_DEFAULT_ERROR`.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Applied to `rust-next` (with the requested wrapping applied and
capitalized sentence).

Thanks everyone!

Cheers,
Miguel
