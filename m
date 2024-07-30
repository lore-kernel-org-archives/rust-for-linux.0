Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F2F189503
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 16:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722357856; cv=none; b=PvWyYa1cNLWpvKiFPSMyuErbz7m02z7B5gsYSHX1YJNTjpn0guDy0IaEpML/6Jq26SVwAg/VhjS/0zyqVNeF0r6zaZLRGd7unhNA0tBzLGrw5o4lsyGaWtKK+3+eHsb4TKxACXywlYb0WneqWSs6uCipyfeR2ekXnktRhkcMxjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722357856; c=relaxed/simple;
	bh=/9OG9y6hP+6SfnI18c2tJ5kPmALXdgpYpAlvKpnHS3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQuRVsnZhPMLDwXnq2yKmOTDKIsWELis8YIbbqJeub7HpzL5eh9DSYAusMWp5Hiab/auqAaqnZGu2MHm0ZqsgQd3WVon+cNkEvtP0NkVi/2Z0yxkQNg/j4auYsjpKVoVt6l4At1qkokLbTToM0POnp1UKZXGa+lOyotK0OlWMj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dRa1PddM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dRa1PddM"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3684e8220f9so18218f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Jul 2024 09:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722357854; x=1722962654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5021+fwAvRxGdu5GI9N27lF6o38chWudSfjBKY3WxUk=;
        b=dRa1PddMw6EVRFsTvLXVGEzKHoWryOAOCmYhbIKcCR+pHLxDvetRxcnQ/sCB6UCt7R
         W4L5giBcM64RnTiW2sAph+NOZafJ9VCOnsHLLO1rAgkt07UimtUfsPbu+B9OIXWoLQf1
         bavzFiXOOEUCsQ8kyCCMUl7brQGz1dqaw56/3hTV0t4UxPeDh6U0qVJgYuByM563JZth
         kQBbbfkB4d9IbbBj5Vbre5o7P67sZooSESHxFtVDAiFYbsPY3O59VTryg0Yy6BYmB3lW
         cUxPHu32xbWRbbMTE6khzLuONxqUQEHVYYh49d06cksHtxyDOTzZQ8bstMxhB2ZkNQtX
         IX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722357854; x=1722962654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5021+fwAvRxGdu5GI9N27lF6o38chWudSfjBKY3WxUk=;
        b=Pku23vXCJV+gK1T9iS+CfRebByRNDBkSxOJVXpfIPKpvxQInZhZqgiDTRUtfh9sK38
         bdndnJWj0MxRQLuxq7Sat7TUNhnFSN4itCSyUj2OeavnBMIPalhk/lxScEQkOtMp71Bl
         WC2lpqUjAwcpf9b6xzyQ8oRU4D95PdN/S3nNiDdJDby6zNzDyLGknif+qAAlUYMcK+VI
         S6JxUgnyZ7E8uLUBhnMW8yCIedsEGW38dZUU8ND/FYeuqkbGQytPyTF12wg/o/rnyt4W
         xd2M66hNsW/G40XY6EpXpfhJk4MQ93Z4gYx4HbXXhYRGhIDv1MhNH6qnJLFTYois0yx8
         iZXw==
X-Forwarded-Encrypted: i=1; AJvYcCWF8+TTRKV9+zc5ePoj8OB7nW3GJptBhBHN6ijmVVweLj9vJb+TI1QQWW50Eu5zBpb6Tnw5Ojv7NFRG2HoJ7OKHH318CbBmoDZ5Kdw7FmU=
X-Gm-Message-State: AOJu0YwEXNxMuP30z5kQgCgq3x7ZRmOLPPxOOoXTeVtsWopJ6l7EmB7u
	LGgv9ygtmr89VN7x8MBRDKusfGQBGvVV10KAjI1zoy/WEhEQAawa28ibEGmoOmWTXSPKq8qnSh5
	QjyMzhrcBwCduIOX/iaOM0lri4xA3yzF9Raom
X-Google-Smtp-Source: AGHT+IFyPEWVu13a/JXKYRwNhAY0ulJH7mLayPlDw+oEoMsOSEDWr2v4wLogU1iA2qYMBVhWygDzrgUTv0poXAGRpBA=
X-Received: by 2002:adf:e2c5:0:b0:367:8e63:4da4 with SMTP id
 ffacd0b85a97d-36b8c8e9959mr1768784f8f.14.1722357853484; Tue, 30 Jul 2024
 09:44:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730-kcfi-v1-0-bbb948752a30@google.com> <20240730-kcfi-v1-2-bbb948752a30@google.com>
 <CANiq72mshrgXJLw+AZ+ovfhZXjYYfgQLdyYdW_v0FmdWdEjvbg@mail.gmail.com>
In-Reply-To: <CANiq72mshrgXJLw+AZ+ovfhZXjYYfgQLdyYdW_v0FmdWdEjvbg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 30 Jul 2024 18:44:01 +0200
Message-ID: <CAH5fLghu8Gy8copyBgcBknMN7GaikhYZb57M0Ye2_xANW6YzoQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: cfi: add support for CFI_CLANG with Rust
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 1:51=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jul 30, 2024 at 11:40=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > +       RS_FLAGS_CFI   :=3D -Zsanitizer=3Dkcfi -Zsanitizer-cfi-normaliz=
e-integers
>
> Before I forget: this should probably be `RUSTC_...` for consistency
> with the rest (and, in this case, these are flags, so it makes sense
> they target the particular compiler).

Hmm. It seems like the existing variables containing rustc flags just
use RUST not RUSTC in the name?

Alice
