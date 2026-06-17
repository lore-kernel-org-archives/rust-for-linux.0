Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156B53DB960
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707185; cv=pass; b=BXQ4rJd6RDh6DpFut3s7EZUtaWTfHdkgb2bvIz0clvyvb4HN/jKyJkVcSG8jn7aL9WZj7nGovpCWHr0k3CGhzd7ANX1PqTaYAkqZssEWreTyl5UhC4JxSg4+a5/pCPcYetrEWcIfCpKjtNDM39Xjn/2A2BzfRrzK88wTUgnKbFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707185; c=relaxed/simple;
	bh=VxS0HmLW8+GSRQzFXTi1M7Yh8UWRw8/Egxhz3hzeuMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eeQBlrJNp5dI+s9BUCApFsb8fPPEyEOt6QJWr/6+dmHgmTY4buGbHTiAe5mqhd/EQgfDz5GKY/e0URQcOMmpEOoDbIh+BlYxCPsi0/OKQlnmn5CYgoHl5zG/6ud7mondO5iQzadfnEbtqMaq9njmJ2SvZRE1Bpy+4JR65CZw9IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wj4x6VqF; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wj4x6VqF"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13842cd7b13so270043c88.3
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 07:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781707183; cv=none;
        d=google.com; s=arc-20240605;
        b=THpRv5f3ichLsV6dCsFt9R+WO2tozMbPlQg6Lctj8LAvlFkTRs3yl4g9R+r/DbCgNR
         uvIJYyRoi8JRXYhbh1sxKPXBLqg4An5a7Dte4xWQAJ/1X9RBOCgeBBymSu0PsIEueZdv
         dq6iA2EVYTkSzLGaUYXNRMxfIx5kpk/KzA9TBjD9KVWUqLFm1alPRdzB+KLcW7W4Fagz
         58onK9RnTg8Vd8Fu/Aku63ZZ4CAJ+vYPm7wJm/xgRwBk8XVaeOzp8TDtZLl8zxoQ0Kkh
         61LyBjocIic2qvUGSe4xtvBIDw+az+dRIOm8UiPh30ckL5qW1fpok1gmS1D5/3j9lTvt
         0+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VxS0HmLW8+GSRQzFXTi1M7Yh8UWRw8/Egxhz3hzeuMY=;
        fh=pt7kcjVrHbV4HK0cV3Xe+zp8NINf0TNOp/SU4Mh+XBA=;
        b=ea1gBfoB4v0bDltXz6myUW1gRqTmEa8YutvWuLCxm+UuSDZADtUNN/xLJPnV6aPwPG
         6ZvKnRKmvow3+Z/TvaVqIAuamxXb7erWNwJApgmIkV+xQd2RYe9JtoaeRaI7O+gMXFQ3
         q2q19SwGBRm4yZnLM85dRQqGnqbnS+KctEVRmve7NSqr+LkHzvz/LL4eREMqZna+GqEz
         bzXpNDE8ES+1hZEGeuNM34UF0Hbf3U7RQjSMJRqotwpAPT3zMwGy0cn/p362BYBzsOA1
         omg5B0NSDCmpa2jW/tabQKl4SfFQ1p20GteU8MHeIDdtdxbRs9r8oH6paNxYHcwykIGO
         pAYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781707183; x=1782311983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxS0HmLW8+GSRQzFXTi1M7Yh8UWRw8/Egxhz3hzeuMY=;
        b=Wj4x6VqFvVDdwSk2956rlZ8ge3KZ72XiLefVVL+NLyHFC/tUQW9BXp4QbVpbLTNzLV
         6gtYX3xl4h45fswIslG2HyqJHVDwU5YX2PkuKOY3xTcwm9MPtR0wMH5aWM2SlS7U1aJg
         q3owRHeVlfyc2Yo7G4IULxwf9qRURhjX7nsesJkghs5r+qzWnDNWpQ6DyT/Wdu0gflZr
         phT+jEV3M9fPfJE1pBCntjSES98YQpzLthVA+74hEGdPOctfzR4UQgdTn0QfMzab7trU
         gw0E4OfyalqO6s0D5HTf6fOdON216iPWw4ZLaOfoC4/mt6ZmON1+eHB7rdcGvDUcfosZ
         MT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707183; x=1782311983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VxS0HmLW8+GSRQzFXTi1M7Yh8UWRw8/Egxhz3hzeuMY=;
        b=p1tcnE/AqyaT9keBxDGn2XLB+wWuU1E5vKFGXyGuLGFlgvjwRADbjzRzfI0YMFJwfY
         CMowtW0Qp3dqo0oFFo/M+grJEuPIDV2CxCDVyNJZXaFrOcinKdNdDiA3d1QJ+bjOdQJn
         afc5WpvCkQ2R/0SlTgJtFZpm+40Pw1nuefz6zXBpYi0B5AdBi7VIuiVv/KdIvtjKAlY5
         l8FUGkwhJg8mGj/BtA6l9Av9ctOoiePauHQxOCAbapqFHJei8Gfbw2A8s6eh6rv1ynZX
         ELR+mqyR7BTxeq72imQ2wq15GjTTVow7JLIj4ZnJhCeeF37mW3jyJrNoitxSLbuZpwN4
         /fDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tOuIpbWH9A19tv8i9vU/XKuNKfgHlMV48N3pG7ecZY1VeHvmhdfrxmQT7nzdeeUkrnFhAJ/ZocDLn8DCU5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKVNZCvMKJHioIKY1U1l6EYXje6wFhwISZcDqKhdborbZ3UYT3
	o1bKl0DU1rjgDhh9THE/hSmMf6jS7OEbhmTsnYhp/92Z6P4ra+6tWY0fkTEpl6QyncXIx6Dj+81
	bV0SVFmoSTDQNjRHXSE2iFNlZiZDddX8=
X-Gm-Gg: AfdE7cnP4VlZmFXDvFF76RS65/tjjs6Eoe8WDeenW09WU9kV0pN4f2dz/FgKO8PrH0W
	ODd37Iy+d1Zt0jxcMU2YgrRMHZWxgMTwOOEBwuL7aDvn3Tu8aqGovz1aJICUAAaPFHi9HpLMhN4
	wMzMt3sksmH8NGMr4w2k+ciHlNTydNsUz+304PjJ5Hz/HNF+zXm6EwxdgctJrgh0nRmHkyRIjzc
	0uVwGzkSDRD1Cwc3vo+W7EARusoKj6TcAQYZgUQpnxHITerAuBfzJl7dD7pkWijaEHuKkYR09FZ
	6dQu28VAW9EnblMpdJGLuwN1lj2pyAGgz3p5w8mwsJ8h8ebDwLoPQXrXROWeFuJ196HR6OYpxhI
	RUQZk2u55dZzm
X-Received: by 2002:a05:7300:818c:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-30bca0cee9emr950331eec.3.1781707183050; Wed, 17 Jun 2026
 07:39:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616223614.16444-1-nico.antinori.7@gmail.com>
In-Reply-To: <20260616223614.16444-1-nico.antinori.7@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 17 Jun 2026 16:39:30 +0200
X-Gm-Features: AVVi8CdE78qrDEpmaA2sbZX9ps1hTfrNEgWajsz71kJ1maFNG--DIeKGXZ7BaMc
Message-ID: <CANiq72=Hmor3xnwQKbqoLe28yMei6hz9KdAUHeje4UapyF_w_w@mail.gmail.com>
Subject: Re: [PATCH] usb: rust: mark Device and Interface methods as inline
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2026 at 12:36=E2=80=AFAM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> When building the kernel using llvm-19.1.7-rust-1.85.1-x86_64, the
> following symbols are generated:
>
> $ nm vmlinux | grep ' _R'.*usb.*Device | rustfilt
> ...
> ffffffff823f2490 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefC=
ounted>::dec_ref
> ffffffff823f2470 T <kernel::usb::Device as kernel::sync::aref::AlwaysRefC=
ounted>::inc_ref
> ...
>
> $ nm vmlinux | grep ' _R'.*usb.*Interface | rustfilt
> ffffffff823f2450 T <kernel::usb::Interface as kernel::sync::aref::AlwaysR=
efCounted>::dec_ref
> ffffffff823f2430 T <kernel::usb::Interface as kernel::sync::aref::AlwaysR=
efCounted>::inc_ref
> ...
>
> However, these Rust symbols are trivial wrappers around the
> `usb_get_dev`, `usb_put_dev`, `usb_get_intf` and `usb_put_intf`
> functions. It doesn't make sense to go through a trivial wrapper
> for these functions.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Looks good, thanks -- I can pick this up, unless USB wants to route it
differently.

Cheers,
Miguel
