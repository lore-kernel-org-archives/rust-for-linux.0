Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D3047DD5F
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 17:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065188; cv=pass; b=p+vDGOLy8l0TszciVPBN1sUrkB15rxhSlxk9+DD7htad2JgyQ5vgYfiMt2ywzlilR77MKDK8aNN59J+xtWCLO23iM5KU9tKZWQi/M4oJANILXdfHSrIhKgO8MKuwvJuBUNVKLvS3D9JmRzopXosO4SWb37E8RUTX806VpNoHUkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065188; c=relaxed/simple;
	bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckSn63ovgKAFIVhTBdBU5dgAdTM6BuppDVlUBoZ4Z13PmiFcW1dsKyq4eNOcg2bgaCb6G7NYVVRilFpmfX2y0vz+8yQYFeU5X4xCs2RX/2AaHxUSWCwIVHhx09P73dxKcjwElq5UDd8IrQBdVwe7TsEAZWKCxPuTDlYVbpNTgjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHWieLuM; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHWieLuM"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c98928e4bfso4493eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Apr 2026 10:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065186; cv=none;
        d=google.com; s=arc-20240605;
        b=ifPsritlSL6E48EX32qNk7hpnt8hid3Qn7Y2TpFWMHo12eLA27mxa1aLrMi2fXn9Bb
         m5Wl0fIv5qfw/RkiTBqf5ePoAS/xTysK3EQsXYB4k4hfcfOk51etwj8PKUmWass8gdSj
         qjw5t8lxK0tmDwjNmCu/Oy2liDG/YUp8oeoqxpMcp1YR4Ebat8T8XzqM9Lprqf1+GanY
         WetJRBEUxa6MkVI3UjzlgMlNBSMz1tJBJU94CHMSxB0IpQxMGKhABiQunVh2gBrP8HiI
         Fw7EF3F0q9lBx0eqvaJn23QEMjW1puHeUuTIyNDzAxEAOl8/ydZN5SFZNh2oJeG1E8eK
         nnTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        fh=f9tRuB3jNLF+Le5eA96XETK79VKTFphEz/YNyQk3izo=;
        b=akChDRtXrv7WPSBwcROYaTJ8cJSOzuWLGQTC4XbJfDsEaX6xyJtinAXqPQCKwqkLcb
         LAs3l1Ru5SWkdrRstpEWQItS/Xdi7UwcD1AcKlplDxYxO3SjLykaBlQqcWw2jU4TIciv
         UIBiBVKEzJNTcOlT4LVMQRCo2IyhrpMjgaUXeJn09oub7IrPGcBKQdhRxHa2m6Uqaubq
         50fQmtK0nq1HGaEUeH0rPu28lblNBmaQ3PXtvQnJSvXvfPgB/vAISovl1Q1msROBzff5
         8SA2uQYb6dQ5pfCJ8AWyb6T+sqTsVfpKGe9i3mP0mcyDleFCm0g+QRhmwkYnL5kR3YhE
         nwqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065186; x=1775669986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=MHWieLuMH/ByIIbgNAqItzRtGa0YCLeZZ3sJoYjxtAmdptV+B0FY01Sa9Zy4qL76Ic
         j82EBQ+pmxUaafDRoehP99t3m/Zv5K1RwSlO0WGJzoVzMbKQ1K2/hN7LiW+j6xe9e2fI
         Qe48XqY1X/x80hXa7HqlTVfURdWVK8QQ7CZlpCi8Vl30IN5v//X+jIR6tSvxhNC8V1BX
         G779+LCZiJh4X/19XUjup1EKn4XzI8nKUs442PSZUfpxP5Rq272WIYw2YE3QHQjZAKe1
         nzSWR9d5uMuWppW34ZIMY7LLBWaKUO5J1IO7l/SzzvCWh7Ymqn9OQh9dqDzEk8eAiVVS
         jWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065186; x=1775669986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=fhVvGGp1O5IjC8moFBeQn7S6G3faxI/NzChHIbTliyo5G3lTvm+i9ILk6ayU7DIiB/
         dO3xfiCZHYpHKBKKNg0catQ+24Juj4oNHl4wcz8i1enjpxkdhYEuL2uGWMohF/+sKfjV
         D9SQRc1YGh/yW1H99DU8gAwJicuqDXMN/x2P75oO6+9//4ts7DDjZu2vQ8aV9Eb6Es9k
         hi1WtTt+jH8xAWIomwP2Ugf71hqQ+jHxUzqilahYLtHaFr3sNdWcPBJXR9yRLox5zRCg
         bHnpuQJfci2jnX75JfNMSv8AkeRCsXPwRnvbM72yh6sAFAfSsYlgIUPrpI095E8ojgN0
         yp/w==
X-Forwarded-Encrypted: i=1; AJvYcCU9nbYxGk+mVvXbyhCg5vDB6ErjYTzGgVHILAHgsQF0efYLKgXKWPktAABnWgP2aCx2j/po/SV/M+pYiFRCFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfjzS0zo0JwSb80gGoW0/OpPG/3gP4Ru4fvcE7tbK6D/mMTUx7
	ZTEGkV8yg7hdKiew2PuJn5YCpM7LB1t5oX+cPQbSs5usG1PJJOJTZMIZWwFPXo572qTc74rQOgZ
	0k6fl2//dYSxTgntmD4+qm06wHm2MjsY=
X-Gm-Gg: ATEYQzyfVQJhm8os3YvUohmzvvF4KsZtrJH1pFEkHTmUlGAfoom/ziwMcGEMjXG59kU
	2jGzG8jODTuzz4shNPt6E+40QKhGZCxIRzQl8v+bt207c88g2OVMO/ntU7Qi6NoJbx31fi1IWzF
	vfgwWG7+rVpDSWU1yoOVjmmKuhQZiX6gXzAInpjKAn+ND58LfbPlbXqYhumDV1T/2yQgllLhUuY
	Q7YiT/NtFMSbM7Syelb+K3TR4CHpeAv/0zu/drRYolIL64sQBR3Ic9sEWjIvR7CJzLr1WsZC71F
	WRwhuHjw7DID92ddj1h8iAD55nziaCePONmb/tNPnnxV0BTd7msrDmQXy9Sqkpay09it2ck1J8H
	CaVW/u0BHmSVjERxFoCeUfBwrLZaxx47+zw==
X-Received: by 2002:a05:7301:4586:b0:2c7:2cac:8147 with SMTP id
 5a478bee46e88-2c932cb3abamr970192eec.5.1775065186457; Wed, 01 Apr 2026
 10:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-10-ojeda@kernel.org>
 <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
In-Reply-To: <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:39:33 +0200
X-Gm-Features: AQROBzBO7Aafw_pbzha_JEZl4Ht2QE7dpytXYa0WjnL8RQv-FxGnezpSMqEOLn0
Message-ID: <CANiq72kSYFiS6zN+VLs2URhAeHy8_-aEXki1pyR0qoj7jO-qSQ@mail.gmail.com>
Subject: Re: [PATCH 09/33] rust: kbuild: make `--remap-path-prefix` workaround conditional
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 4:08=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Okay, I see what the comments mean now. Perhaps squash this to the previo=
us
> commit?

This one was mostly to ensure the workaround was not needed anymore,
i.e. it is more "optional" than the other.

In fact, we may want to just not have neither of the patches, i.e. we
could just remove the workaround given the timelines of the branches
-- please see my reply on the previous one on this.

Cheers,
Miguel
