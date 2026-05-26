Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBEA3F7872
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799080; cv=pass; b=TX9X4Uu1cNZeDJ1z/mxLs4I9UE6WWvg14I2gjNslMz68tW7ed5XMwi336AzJhyB0J/6HL3PSwVVDUtj0GuY3sMw1YpbaxIw9xWfDfFlffiOHUGY7zYDOKVI9ZGZ0YVEGvylok2BBmPzelMyrAvTmV8gJLmnVsjuuG8eMSmsaGVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799080; c=relaxed/simple;
	bh=mLnNy9oW/G+5ymzh/2kNXsDW1h67qK+6LVHU489oQIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KEfZdFmSeRiEZkjHPMxDmbuGIlwDI+UUoH/EOW4mztF+bWOA9egbk8nEtxHaVrL3czb/9LOh6yKw0uQ+3Om4cAg5zBRuCDz/ejEeCnH2TmwCvNsIgM6ky35cv9dxvziBwOlCtKkj0UIviaaHuGXPLHBgO+nI/9XnA4JkMygVdjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ypwgj/E0; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ypwgj/E0"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f53c6af46eso749055eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 05:37:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779799078; cv=none;
        d=google.com; s=arc-20240605;
        b=RTrqt9vglF+paG/30MrH6/+T8ksCG//Ouu89HGPM6AtvjKV+lTtifFU+XhZd0Wp2fm
         Odhmu0GFAo+i3xw3nkTsRm1qJ/yW0lEb7ltlKuIaF2GZHOs15/xUJ07syIiZdE6lGJc/
         FVb6HlCMEzllY5zK7so3Uh34xFv+bmEZE+CY42IU3j9TFowzNtlE+c0wjop3YZZeR/6k
         DKUoGlbfbxXBmKU8b6zB1znshBp58aVWrvIIl2cFyHy2z6Z91/PZK4n5ho2q/kefCgVE
         f3HbRN18qWxe3CQPaj7sZUqbFi9Pd5ZQTlYx9nKeOTZBv4zyO4QJuFtd6e5ChlGCXg51
         wZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zLEYxxo1EJ6dECgeEvUHoxB7lK2wiKidNtL5g8UvMak=;
        fh=tvKSy+WYXGs6wIwW1opaKeaXUTIWyZRiBrFAiRfcw0E=;
        b=enHjYuVW3MSuuIQVWFTQozrCrTNZgoULqQqj7ZiGKBAdVWoJ7zR9H0WBpdTaTi6qdN
         5j7lcD9eiQcUS51yH02tEx3u2N/JVfOaM+2F07MXClgrmZXjZIXTousavK4uNWeG/oc4
         /j6We56XULupjaS7nBQTwpMsZ+N4CKf+x0MQH7GRH+raAWvoe0uCOtQUprxj3mWQS9gS
         SZO8Va27hvHf1poCt+t1m91pA/la/EhjJfz8yncEGDENVQ/5X2Y7WN+A9iQB97J9OQNa
         50X1EqIUtahmv6Dov0JbTinZ5rLuFoUlfDQP/PqkZLFBwTEVxv3Nll5UHjVKDBZyOsEg
         ObZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779799078; x=1780403878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLEYxxo1EJ6dECgeEvUHoxB7lK2wiKidNtL5g8UvMak=;
        b=Ypwgj/E0TcF7+saNBrqQg0dzs1u6XtVwzJwzgG49g8Zw9pVvQHqc6Zn5R/n8d7xP5h
         S2D4qZnbnJROmsDHX2dhah6FMuNWZ2Mqqe36lNvgeSSS2oDGqa11olt1jVB2g5Liy9ps
         sGURmJ5BzFKrzpFYJx2dcUqpJWD6QGs56CJRN8/e0oi1aF/DyymnWcSWdFHaERE01Xf9
         9U3XuGR9wBsYxZ/vxldwgmzVw2NIyKtibjZYQ4Iadwaiu9I4ZmoF7+Sb8uShX2vO6ELz
         O614UGYx0DyYKkgCmjdigDiVAWQRqV38tXby7mNAKBRGpBbQZFo0Ot9syz3STQ4iYmHi
         KPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799078; x=1780403878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zLEYxxo1EJ6dECgeEvUHoxB7lK2wiKidNtL5g8UvMak=;
        b=bwHtDLBLSbTe+Ln7O80sB6WorKRBwUdrW1oCB3WHTb4JeaVwecZ4ulCgddyYi5AWQx
         40ozR0IXpXT46K4jjjcE7pBTiQqLtIs/zUdgX5vFmnJLEzC46hqZXMl1DgJ+2FCUCX0/
         gdrFoNddm03uB3V1eZz0Ae/d0SXeHX2oZl0NFzNcA2C8FoxRlYV1+yxeYtL5sV2EJWx5
         +7hk7L3UEqlpUiqEfeT2dBUy2Kl9/2IDA1JtrUDpjNhbWOPsCMU1d6VNs9E6dZ+ZSAnI
         CxJLqkNrQ6jfuj75McClnS/7jekUixZ9wpe/sJ74PeyX/x5VA0tO0CST3Oqx8DnPQRvU
         FjgA==
X-Forwarded-Encrypted: i=1; AFNElJ+m74CT0hDUgP3XP+Sg1Dp+EkwMrZop+T7BVe3Qcuf3iPuEVR7snCJIKG/H84MZYkfV3ProjeqpoZt1t+k5Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjd1Gj/1dmEZIZN51qRAXanl+d+pVyV565DPLIKOM3ytxLxecF
	jDVpQFRbCy8EgZpOc0rO+r0N978uTztE7ScReQykkaSVU7S5DhFsr5eR2c4+jYtwZ/dECPn1HZe
	K1AbCYRm5V+8ym/PEBtxB2LbEmrXKmeU=
X-Gm-Gg: Acq92OGTzyMs54dsf7MZ+vN6fvXDmE0e9A/H/Vd9mnI0ZwrgAT2SsGkJ3Ngs9AwD9ef
	oPSG321bW++8EfKZA2sdafmAWGOiM30nG2NO6qLyE9s6eHIDejTDG0yd0ir968Hf6Zi61rcJWHf
	6JK84OwWyNHJFwlA5/9bffjDXMVFvB9GFo7Xnjkf2lpqAezgAFn0bL5th2Lry+U077+HaimO5bQ
	ep5DTbWZHOheK9+eYGtFn/8hmVimlWcemqahegMny2YSEbQ2bCOKTmsz4sl8xVd+BKcF2kc6YgQ
	bVMR3ydFlJlM11UTOgdMar+WjFbLMT6G6RFgEdTWgvtmlLVmBLBeNa87EKNw/Xz6F/5jud6jEy7
	DcP1t3iWOORDZXr3GW3pnaKw=
X-Received: by 2002:a05:693c:2c0c:b0:2d4:62f0:b2e1 with SMTP id
 5a478bee46e88-30448d4f1d8mr3832711eec.0.1779799077956; Tue, 26 May 2026
 05:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526094329.533943-1-kingeaary@gmail.com> <20260526115825.1480768-1-kingeaary@gmail.com>
In-Reply-To: <20260526115825.1480768-1-kingeaary@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 14:37:44 +0200
X-Gm-Features: AVHnY4IMrQS40rcLTT7RSpFMrbA_h5z_ANArJ0tzJY7YSCk7vcZX8k5C1QuNlOI
Message-ID: <CANiq72m5MnUJRJTH=Li-GCYEDoHLcPbKKNUQ=hJUKxB=tNLQaw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: devres: optimize type name allocation and fix truncation
To: Aary Milind Kinge <kingeaary@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 1:58=E2=80=AFPM Aary Milind Kinge <kingeaary@gmail.=
com> wrote:
>
> The unconditional 128-byte const array allocation for every unique
> `Devres<T>` caused unnecessary .rodata bloat in production builds,

Wasn't the string deduplicated?

> terminator), the copy routine now appends "..." at the end =E2=80=94 copy=
ing

Did an LLM assist this patch? If so, please add a tag:

  https://docs.kernel.org/process/generated-content.html
  https://docs.kernel.org/process/coding-assistants.html

Moreover, this should be sent to the right maintainers and reviewers,
e.g. at least to "DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS". Cc'ing
them here, but also please Cc all the "RUST" entry.

> +        let mut buf =3D [0u8; 128];

Why is there a hardcoded literal? Please use constants where possible,
deriving the rest of the literals from that.

> +        let mut len =3D 0;
> +        while len < 128 && static_buf[len] !=3D 0 {
> +            len +=3D 1;
> +        }
> +
> +        // SAFETY: `static_buf` is promoted to static memory, and we ver=
ified the null byte.

This should explain why this is all OK, e.g. why it doesn't go out of
bounds (a local-only reading of the loop above would appear to make it
so).

Or avoid `unsafe` altogether if possible.

> +    #[cfg(not(CONFIG_DEBUG_DEVRES))]
> +    const TYPE_NAME_CSTR: &'static crate::str::CStr =3D crate::c_str!(""=
);

Is the name not used at all under `!CONFIG_DEBUG_DEVRES`?

Either way, could we move the other `const`s inside this one, and
remove the `cfg` here? i.e. reducing the number of conditional items
and avoiding to repeat the "signature" of this `const`.

>  // Expected to become stable.
>  #![feature(arbitrary_self_types)]
>  #![feature(derive_coerce_pointee)]
> +#![feature(const_type_name)]

New features need to be justified in the commit message, with a link
to the tracking issue:

  https://github.com/rust-lang/rust/issues/63084

In particular, please justify why you think it will become stable.
Usually, we need to double-check with upstream that is the case.

Thanks!

Cheers,
Miguel
