Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FFE2BD015
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Nov 2025 02:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762570215; cv=none; b=BhA+3O3cRa2LjkwzZs0K/qqDt0lEps2W0BLkHU7qn7E4CbBtZy9q+fIWZtcEkf2txnvHR7vUlkKwVrQag76WfzSmbxcaqZZZiS3UjQBr2LZ3th5NxSJ5kbCKs6TRhPSN7Yqpa9SaGplGPrZgy7JxInN61fKtgTzsB5N7ZWRPzKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762570215; c=relaxed/simple;
	bh=OAMQkM8H202HpZ9SyALa6Zflvi3TrT+59q9nVOpCnkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XWx4v4SMOT/qqoebLtSQatVSFGYEF8DKEbhWo+aTWc5BsjKPuBuqZlN5bzwt+XC8jgdAHqlqgUjYWCDOpVBnbpRKpvfFISLZbbBNBa2BVH/jLIJU3AWlANOmFpS7m12wHkwTQ4mZZg+gz1omPI2cEOIMXoYlA0imb9IF4Xb09uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VAchsO6a; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VAchsO6a"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-294f3105435so48405ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 18:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762570213; x=1763175013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xz9KbiB3pKiQMMUPj1p32orHVehzjrikuGFe9xgdEQk=;
        b=VAchsO6alXNukU6gX/pvJYwQCDSkZMHVh4dVm5JfY1oGfbAmpLxIYCzpZtKbeACb5R
         9sFUxtSIP4BSiAq9li9cHIgUHph9mZvWSTXO/T79k3bo0MUqC18QTeEytObcv5guW7PX
         RIOMgMkQdealGumFovKyXvrSk+QXhr92rzy44TokOfWiRrjxS+x6igOdcw0y6Ax7dhRz
         QPq9dkVUXaY7tjGC4wHgccyx5nv/nHP12pzmntBfGPDPuD61cbBRUMYB19mKOFXGeMiA
         kMjEWQmn//kTGO2mW6VgLFV8byEqB4R7Mzz0ZdgGWj/1YuqOZ6BEsHcuqNhuSjHK4zsf
         j1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762570213; x=1763175013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xz9KbiB3pKiQMMUPj1p32orHVehzjrikuGFe9xgdEQk=;
        b=wQFjldC4iS9qA/C8zhF5HcsmkUwxLNjO3cSXp5kAJoIeXMfyZL90XA+scGkwg5GDBh
         M38WyqzqvBEupj/HMTvQNBD/ceJDxwLVUnOcIU7zxz3bGuAyUOVy80CVlCKsniqPTweq
         zEHjef1BsPKX90a6fEIw1BWSrH65sXV5ntEF1hEBWPbCE5TPVh9EMjwCyb7CQmhrB9t6
         tSbh8fCFMKION2bmJwKdBJM+ZxgsPjM7zmuBvZY3v/HQ2wkjB1OjEhKDPKLPUHQgjzdx
         m0k5zQAkz5OmQQFLF8OHlHrygYeEjj2uaO1uKzbEvMnmfAsbkf+az24c4Hzz9DUUQdAl
         0gIA==
X-Forwarded-Encrypted: i=1; AJvYcCVny0d8m9+orisscxaSAc/eAJX3WGdYyXoh3w2upkbIv5dbQ9ctencMzoOXiG5wKMJm9gm6l7EXxL+qEbeXvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/Kae2y9M5sCSmYI5FlRJI/xChmTG/7hpGS+8/Jf5paXhlC8s
	brKlHIscLngI51GWQXPkotJ94U1OXMOCCm4yNX7ncp+HojO93lXnJJBQC1KljbSbByFKU8gVCfv
	F0t8prlLUHBT6XRvhf/A6d6PRtj5efwJXg8n33Ru3
X-Gm-Gg: ASbGncsByqC26sqB+xYsAESqVl198AkfOHOgZmp6vu3ciVoB7iUXGFQsmPyY/weDePQ
	YczVGpXrj93w3cyWmhxVd3+AWJNVUF7KCHZoI7B6kp5xCjBOXqAWdM2B1XShQI54aSDyeGLlNnp
	FBEUex2V+zNbGEpjViqbasBybJFw6ydQgVCQn2cGB8+1eg5IO/LWBfF0TBH5vYQs8i2S9apmNv0
	cdm6iCeqDEwrKbFJ5oUN/uDHkooQ0pC+whFqaO++CNjLTwns728uipw8rL0LTsuSGzk
X-Google-Smtp-Source: AGHT+IEDYpJKL+hIOzjq2gpmJ4iFLKF/Y9OWuaaO1G7yVaYPMHtubhDweRGu3Pd8BduK0hfGnF3VI4ZMdg1XmQs5Cik=
X-Received: by 2002:a17:902:d4cd:b0:291:6858:ee60 with SMTP id
 d9443c01a7336-297e51be5b3mr2383685ad.4.1762570212326; Fri, 07 Nov 2025
 18:50:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251108014246.689509-1-ojeda@kernel.org> <CANiq72nKC5r24VHAp9oUPR1HVPqT+=0ab9N0w6GqTF-kJOeiSw@mail.gmail.com>
In-Reply-To: <CANiq72nKC5r24VHAp9oUPR1HVPqT+=0ab9N0w6GqTF-kJOeiSw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 7 Nov 2025 18:49:35 -0800
X-Gm-Features: AWmQ_bn2xE_C004xbiOPfj6vuNrWvyE4Ho8Vxi_L-U3qXSI0Ruu8KQu5_TFbvtY
Message-ID: <CABCJKucCJLWfHz6o=wWWx95keLC6na+uO3a0WVLTPEz02gENPw@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: skip gendwarfksyms in `bindings.o` for Rust
 >= 1.91.0
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 6:31=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Nov 8, 2025 at 2:44=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
> >
> > note that `CLIPPY=3D1` does not reproduce it
>
> And obviously this means we have to special case this one too...
>
>     $(obj)/bindings.o: private skip_gendwarfksyms :=3D $(if $(call
> rustc-min-version,109100),$(if $(KBUILD_CLIPPY),,1))
>
> There may be other cases that disable the optimization or similar,
> plus we may have other small crates in the future that could also
> suffer from this, so it may be best to simply force to generate the
> DWARF with a dummy symbol from that crate for the time being as the
> fix:
>
>     #[expect(unused)]
>     static DUMMY_SYMBOL_FOR_DWARF_DEBUGINFO_GENERATION_FOR_GENDWARFKSYMS:
> () =3D ();

This looks reasonable to me, and indeed seems to fix the problem.

> And then later do something in the `cmd` command itself or teaching
> `genkallksyms` to auto-skip in cases like this.
>
> What do you think?

Like I mentioned in the other thread, we ideally wouldn't silently
skip symbol versioning because the exported symbols won't be usable in
this case.

Sami
