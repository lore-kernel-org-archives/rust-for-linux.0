Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F10212EFB
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Oct 2024 20:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418992; cv=none; b=QIcF+sc7+FQAm6rRJeVB/Z6+0dpD1aqU0AVdQ5tgefLiYZaOnT8cKQjW0gIsNXPhAYyR/RwLYxVo16VFMtspuai2UZ9rK15HRP/1kFl+pQvMB5gOA9tQYF5Ql0X+911LR4NAgmKExwjJtZmIHL+fXDswWcAETQUnMBWmHJYt0qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418992; c=relaxed/simple;
	bh=aT/4Tv8yTS3tZk2OBCayfPS0Z48rZON+uEu5E5vyko4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/ijLDVnzRMEqBtivtcRe1UQIoP8IUOpHa0Jy9lR3pbjAR5Mc7XqKpXsy9Xa82YdWOqrQ8J/zGNutEm7zQ3dvqCeIImq9NbM12+b7tv7f/UTNHRdFsykdbXLGuYmhWeuH0E0F6gHdW0srjE5wA/wD1j+6ez0FoeUcmpMf/A6lQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RahmmyXT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RahmmyXT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42f6995dab8so73585e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Oct 2024 13:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728418989; x=1729023789; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT/4Tv8yTS3tZk2OBCayfPS0Z48rZON+uEu5E5vyko4=;
        b=RahmmyXTzY5DB8NueEYj+fQpSk8ckdmdRyaNG5cyCBi21D1VvZzqleUcGStcODlAZW
         ghAXPsb7CBPYgBMCb6IWAoQ+1FADdb47huJoBLHZ/9Bo7QE3dFUB+yIf5HP4ZX+qhnuz
         SPWgPZJA6UwnEus/0SGl1mjny6FeFO7UjfVLQ1etZLpqMqDMbqHohOJ52sTo/gSo8ZQ/
         mkKxnenk4tAvCBznSxTt7dSnf0gyqm6UMckkviu9ivuBoHAHpMHZcMHsZpDwiCSwwNrd
         LAlZZt3OxBWpEFnNLErCC6ZCY6LJbqGd294cD679X/ugeT0Xk7DbbYO1khQKyelHhaCK
         Xd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728418989; x=1729023789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aT/4Tv8yTS3tZk2OBCayfPS0Z48rZON+uEu5E5vyko4=;
        b=u6PE7PvwfOxoqfClyZQAcO8fcUsHYCwy5w9DeYbLDNie3fWySOtWUF+53lLkAn4UcO
         FMyJlcqyhdsICxVdW6UZX8LpXevvkE7xYiX2EJiZNRfHOBqeM8vjANKGQZBd11GDjqgg
         PNNBy2FUQie6DbUcttDBjlhAmvv7u7hSbjmVU8OYylAd3m0rxP4RY+sjBp9cQkGHCEpQ
         9Xz+hKBfG9985MSKpbbl44kFBumIx1rsHYAVT6Gd/yO+tITNc9i3cmQqvfy0vidO7+oq
         K3UVjT6oFagKHLcAKZl23KBtBIrwMxcNmj/CXwMBx8QKzrgbVOOsGgWxM7K8bHxhQzAq
         qa/A==
X-Forwarded-Encrypted: i=1; AJvYcCXuo3i2m6+Pb8ZqqCMSCLBgbyWSiY4LEcXOVduSWP7DXIFVF6KXGt71vQf8zIF/j2AbH+MyAqnVAMpRqB8psg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLpoGKVMZNd/liJrGoH91hUfR1WNrhDftuYjYMCn2N1+4SDTd/
	XrAIUrLt2OWlL97vgbgl1GaF9k+inEETVR8HingGqVFLFs4AU5mYWzz1ciZPxfOrKXbT2gfJnB9
	VRPBIHckVpKo9kcEUIY05Mh+rVfCPpfmQyLdu
X-Google-Smtp-Source: AGHT+IHXUIQZjrceGy2DNmHGyshwanbOpVyVoM7Mm1vllzb6eznDdYZ2tcjUOfsuDhIr71bTFFfEmbi5dRM+rdEoMs4=
X-Received: by 2002:a05:600c:3d1b:b0:42b:a961:e51 with SMTP id
 5b1f17b1804b1-43058c8bee3mr1131465e9.0.1728418988766; Tue, 08 Oct 2024
 13:23:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com>
 <CAGSQo02oVWxazut2nyh-9K9gK+937zKCfYMBkT4EQE2CddvZtg@mail.gmail.com>
 <CAGSQo01FErmGbeu-+_kRfpQrO4xkaGuSo_zAXTmGHZuFVYXpNw@mail.gmail.com> <CANiq72=40bsTubsXMqn_Jjx8TdfuuE9Z+eQNFvYrVXnX9S1-zg@mail.gmail.com>
In-Reply-To: <CANiq72=40bsTubsXMqn_Jjx8TdfuuE9Z+eQNFvYrVXnX9S1-zg@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 8 Oct 2024 13:22:56 -0700
Message-ID: <CAGSQo03_GZCJrnp9WPxo2T3GJz8TCtucHNx6_rAr7xfJ6ybukA@mail.gmail.com>
Subject: Re: [PATCH v2] Kbuild: fix issues with rustc-option
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 1:22=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 8, 2024 at 8:25=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
> >
> > Err, slight amendment - I think you want `-o $$TMP`, and not
> > `--out-dir $$TMPOUT`
>
> We need the `--out-dir` to avoid temporary files being created in the
> current working directory.
In that case we should omit `-o $$TMP`, because `rustc` is emitting a
warning that it's ignoring `--out-dir` because `-o` is set.
>
> Cheers,
> Miguel
