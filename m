Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rIrWSWa6"
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B224B1732
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Dec 2023 23:43:37 -0800 (PST)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-464808da25eso483015137.1
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Dec 2023 23:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702021416; x=1702626216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4q2vuoSSJgvH7vZRaxIDen/jyKU6XB1LXeL+/4gRcM=;
        b=rIrWSWa6FMeZTRA6fOsq7PUz5nO/S7mlA2+xHwzMbfB2voaQlNJrCeXFB0LFJLHnwW
         lcgHihAnps8KkMjw0WtR8PrJrujwWJStNJyWMLVwE1TF3NnLDTEzx/0d3KI2vB9RpKTP
         /ZQz9Yp627xKNzP365RyfKbmo+H7Sccqxwp5MZ4SCW2RV8UTFqnQW4pkiKsRa2adIK8k
         1iYz5a3AmrGvIDcJXgdRYBCpj2el7zudWoQdyvjdk+DItHaCSDB+RNo/NyFxDUxImE/A
         jI5kkZhkRSqrEDkRF8g1VRuWv86sgrA0+eEcuQAUGyiqDibJShj6Ram4BWguRtBLrcmx
         /rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702021416; x=1702626216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4q2vuoSSJgvH7vZRaxIDen/jyKU6XB1LXeL+/4gRcM=;
        b=kwcamt5A8XziYljjDt8kgBjekn3G98es5akhSRMuXX0Pj9bm+5gI9Yy84qnVW6un4g
         dUFrr75dTgkKNGJR0JXEfYudKBAPcSo389uqH1TG/u2VBrcJaJ3AeQN+we0+/6VVi1sF
         OXcM5z/+shpPED+IDuc3M+EUDkVulmR2qvML8dIUIUuVTZA/wBcBkXOofmfiKiZKN8k7
         RrxVud/3SFherLv/hVequT+YO3FDNwgy/q+l+CeLrVsvXLny5AKyofe4rNHOVqkj/USU
         p+tYRk1gzk5+ZxH9VySp0cKRbAV1QFn1+MY+kY/92P1eQz5vhTz1tVRcEdvCXtmCl79A
         Vl3Q==
X-Gm-Message-State: AOJu0Yxs6YRU4nHUsAzCuM6VNB1No+P5vmmWN9bTfPAkIGc1Z1FmHBO2
	oe7BWkasduzi62LtjFYIe6IYeCkX8IFYKtsfylGm+A==
X-Google-Smtp-Source: AGHT+IH3GFhE6C5y58gfbtDBuMvPVznxpofnP+2ZfxvpHEccq0MFGv9X86KkaH/iD1Z/02axDn1F0RFCnYFzPu5sjwQ=
X-Received: by 2002:a05:6102:548d:b0:464:8660:18b2 with SMTP id
 bk13-20020a056102548d00b00464866018b2mr4377343vsb.22.1702021416509; Thu, 07
 Dec 2023 23:43:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206-alice-file-v2-0-af617c0d9d94@google.com>
 <20231206-alice-file-v2-4-af617c0d9d94@google.com> <ooDN7KSgDTAyd45wWcPa1VLmvo-fiqwDmffX1Yl8uiesYUcgnCZq5dcd6fGw5sVYMusZGpEI4L5avLCqNXXM7opR627oUp1NB-TIHOwJufg=@proton.me>
In-Reply-To: <ooDN7KSgDTAyd45wWcPa1VLmvo-fiqwDmffX1Yl8uiesYUcgnCZq5dcd6fGw5sVYMusZGpEI4L5avLCqNXXM7opR627oUp1NB-TIHOwJufg=@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 8 Dec 2023 08:43:25 +0100
Message-ID: <CAH5fLghg7=eF38fNeUTEFe9zH95H-Que_911kJ+g_rsNrODHsw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] rust: file: add `FileDescriptorReservation`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Dan Williams <dan.j.williams@intel.com>, 
	Kees Cook <keescook@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 8:37=E2=80=AFAM Benno Lossin <benno.lossin@proton.me=
> wrote:
> > +/// Zero-sized type to mark types not [`Send`].
> > +///
> > +/// Add this type as a field to your struct if your type should not be=
 sent to a different task.
> > +/// Since [`Send`] is an auto trait, adding a single field that is `!S=
end` will ensure that the
> > +/// whole type is `!Send`.
> > +///
> > +/// If a type is `!Send` it is impossible to give control over an inst=
ance of the type to another
> > +/// task. This is useful when a type stores task-local information for=
 example file descriptors.
> > +pub type NotThreadSafe =3D PhantomData<*mut ()>;
>
> This should be in its own commit.

Will do.

> Then you can also change the usages of `PhantomData<*mut ()>` in
> `Guard` and `TaskRef`.

Will do.

> It would be nice to use `NotThreadSafe` as the value instead of
> `PhantomData`, since it is a bit confusing...

That doesn't compile, unfortunately.

> I think we might be able to also have a constant with the same name
> that is just `pub const NotThreadSafe: NotThreadSafe =3D PhantomData;`.

I can try to get this to work, but I worry that they will shadow each other=
.

Alice
